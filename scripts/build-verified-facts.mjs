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

// Richest fichas first, interleaving cities so no weekly batch is a single city.
const hasPrice = (c) => c.facts.some((f) => f.key === 'precio' && /€/.test(f.value))
const city = (slug) => slug.split('-').slice(-1)[0]
const byCity = new Map()
for (const c of centers.filter((c) => qualifies(c) && !previous[c.slug]?.indexableFrom)) {
  if (!byCity.has(city(c.slug))) byCity.set(city(c.slug), [])
  byCity.get(city(c.slug)).push(c)
}
for (const list of byCity.values()) {
  list.sort((a, b) => own(b).length - own(a).length || hasPrice(b) - hasPrice(a) || a.slug.localeCompare(b.slug))
}
const queue = []
const lists = [...byCity.values()].sort((a, b) => b.length - a.length)
while (lists.some((l) => l.length)) for (const l of lists) if (l.length) queue.push(l.shift())

const scheduled = Object.values(previous).map((e) => e.indexableFrom).filter(Boolean).sort()
const lastDate = scheduled.at(-1)
const inLast = scheduled.filter((d) => d === lastDate).length
let date = lastDate ?? RELEASE_START
let slots = lastDate ? RELEASE_SIZE - inLast : RELEASE_SIZE
const release = new Map()
for (const c of queue) {
  if (slots <= 0) { date = addDays(date, RELEASE_EVERY_DAYS); slots = RELEASE_SIZE }
  release.set(c.slug, date)
  slots--
}

const out = {}
for (const c of centers.sort((a, b) => a.slug.localeCompare(b.slug))) {
  const indexableFrom = qualifies(c) ? previous[c.slug]?.indexableFrom ?? release.get(c.slug) : undefined
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
