// Builds src/data/verified-facts.json from the review batches in
// scripts/data/verified-facts-*.json.
//
//   node scripts/build-verified-facts.mjs
//
// Every reviewed center gets an entry, even with no facts: being in the file is
// what marks a ficha as reviewed (see src/lib/centers.ts#isCenterIndexable).
//
// Fichas that qualify for indexing are released in weekly batches rather than
// all at once: turning hundreds of pages indexable on the same day is what
// preceded the July 2026 demotion. A slug keeps the release date it already
// has, so re-running this after adding a new batch only schedules the new ones.
import { readFileSync, writeFileSync, readdirSync, existsSync } from 'fs'

const BATCH_DIR = 'scripts/data'
const OUT = 'src/data/verified-facts.json'
const RELEASE_START = '2026-10-06'
const RELEASE_SIZE = 40
const RELEASE_EVERY_DAYS = 7
// Keep in sync with src/lib/centers.ts.
const MIN_OWN_FACTS = 5
const MIN_OWN_SOURCE_FACTS = 3

const previous = existsSync(OUT) ? JSON.parse(readFileSync(OUT, 'utf8')) : {}
const centers = []
for (const file of readdirSync(BATCH_DIR).filter((f) => /^verified-facts-.*\.json$/.test(f)).sort()) {
  const batch = JSON.parse(readFileSync(`${BATCH_DIR}/${file}`, 'utf8'))
  for (const center of batch.centers) centers.push({ ...center, checkedAt: batch.checkedAt })
}

const own = (c) => c.facts.filter((f) => !f.shared)
const qualifies = (c) =>
  c.set?.status !== 'draft' &&
  own(c).length >= MIN_OWN_FACTS &&
  own(c).filter((f) => !f.registry).length >= MIN_OWN_SOURCE_FACTS

const addDays = (iso, days) => {
  const d = new Date(`${iso}T00:00:00Z`)
  d.setUTCDate(d.getUTCDate() + days)
  return d.toISOString().slice(0, 10)
}

// A date that has already arrived is final. Dates still in the future are
// re-planned on every build, so the priority below always applies.
const today = new Date().toISOString().slice(0, 10)
const releasedOn = (slug) => {
  const d = previous[slug]?.indexableFrom
  return d && d <= today ? d : undefined
}

// Weekly quota per pool: Madrid and Barcelona go first because that is where
// the search demand is; the first plan interleaved all cities evenly and left
// both for the last weeks. Spare slots go to whichever pool still has fichas.
const QUOTA = [['madrid', 14], ['barcelona', 14], ['rest', 12]]
const poolOf = (slug) =>
  slug.endsWith('-madrid') ? 'madrid' : slug.endsWith('-barcelona') ? 'barcelona' : 'rest'
const hasPrice = (c) => c.facts.some((f) => f.key === 'precio' && /€/.test(f.value))
const pending = { madrid: [], barcelona: [], rest: [] }
for (const c of centers.filter((c) => qualifies(c) && !releasedOn(c.slug))) pending[poolOf(c.slug)].push(c)
// Richest fichas first within each pool.
for (const list of Object.values(pending)) {
  list.sort((a, b) => own(b).length - own(a).length || hasPrice(b) - hasPrice(a) || a.slug.localeCompare(b.slug))
}

const lastReleased = centers.map((c) => releasedOn(c.slug)).filter(Boolean).sort().at(-1)
let date = lastReleased ? addDays(lastReleased, RELEASE_EVERY_DAYS) : RELEASE_START
const release = new Map()
while (Object.values(pending).some((l) => l.length)) {
  let left = RELEASE_SIZE
  for (const [pool, quota] of QUOTA) {
    for (const c of pending[pool].splice(0, Math.min(quota, left))) { release.set(c.slug, date); left-- }
  }
  for (const [pool] of QUOTA) {
    for (const c of pending[pool].splice(0, left)) { release.set(c.slug, date); left-- }
  }
  date = addDays(date, RELEASE_EVERY_DAYS)
}

const out = {}
for (const c of centers.sort((a, b) => a.slug.localeCompare(b.slug))) {
  const indexableFrom = qualifies(c) ? releasedOn(c.slug) ?? release.get(c.slug) : undefined
  out[c.slug] = {
    checkedAt: c.checkedAt,
    ...(indexableFrom ? { indexableFrom } : {}),
    facts: c.facts.map(({ key, value, sourceUrl, shared, registry }) => ({
      key, value, sourceUrl, ...(shared ? { shared: true } : {}), ...(registry ? { registry: true } : {}),
    })),
  }
}
writeFileSync(OUT, `${JSON.stringify(out)}\n`)

const dates = {}
for (const e of Object.values(out)) if (e.indexableFrom) dates[e.indexableFrom] = (dates[e.indexableFrom] ?? 0) + 1
console.log(`${Object.keys(out).length} reviewed centers, ${Object.values(dates).reduce((a, b) => a + b, 0)} scheduled for indexing`)
for (const [d, n] of Object.entries(dates).sort()) console.log(`  ${d}: ${n}`)
