// Applies the field corrections of a review batch (scripts/data/verified-facts-*.json)
// to Supabase. The verified facts themselves are not stored in the database:
// they ship with the code (see scripts/build-verified-facts.mjs).
//
//   node scripts/apply-verified-facts.mjs scripts/data/<file>.json           -> dry run, prints the diff
//   node scripts/apply-verified-facts.mjs scripts/data/<file>.json --apply   -> writes
//
// With --apply, the current rows are saved to scripts/data/backups/ first.
import { createClient } from '@supabase/supabase-js'
import { mkdirSync, readFileSync, writeFileSync } from 'fs'
import { basename } from 'path'

const [file, flag] = process.argv.slice(2)
if (!file) {
  console.error('Usage: node scripts/apply-verified-facts.mjs <batch.json> [--apply]')
  process.exit(1)
}
const apply = flag === '--apply'

const env = {}
for (const line of readFileSync('.env.local', 'utf8').split(/\r?\n/)) {
  const m = line.match(/^([A-Z0-9_]+)=(.*)$/); if (m) env[m[1]] = m[2].trim()
}
const client = createClient(
  env.NEXT_PUBLIC_SUPABASE_URL,
  apply ? env.SUPABASE_SERVICE_ROLE_KEY : env.NEXT_PUBLIC_SUPABASE_ANON_KEY,
)

const ALLOWED = new Set([
  'schedule', 'phone', 'email', 'website', 'street', 'postal_code', 'age_min_months',
  'age_max_months', 'services', 'status', 'long_description', 'faqs',
])
const batch = JSON.parse(readFileSync(file, 'utf8'))
const short = (v) => {
  const s = typeof v === 'string' ? v : JSON.stringify(v)
  return s == null ? 'null' : s.length > 110 ? `${s.slice(0, 110)}…` : s
}

// jsonb does not preserve key order, so compare with keys sorted.
const canonical = (v) =>
  JSON.stringify(v, (_, x) =>
    x && typeof x === 'object' && !Array.isArray(x)
      ? Object.fromEntries(Object.entries(x).sort(([a], [b]) => a.localeCompare(b)))
      : x,
  )

// Refuse the whole batch on an unknown column or a fact without a traceable source.
for (const c of batch.centers) {
  for (const key of Object.keys(c.set ?? {})) {
    if (!ALLOWED.has(key)) { console.error(`Unknown field in ${c.slug}: ${key}`); process.exit(1) }
  }
  for (const f of c.facts) {
    if (!f.key || !f.value?.trim() || !/^https?:\/\//.test(f.sourceUrl ?? '')) {
      console.error(`Invalid fact in ${c.slug}: ${JSON.stringify(f)}`)
      process.exit(1)
    }
  }
}

const plan = []
let failed = 0
for (const c of batch.centers) {
  const { data: row, error } = await client.from('centers').select('*').eq('slug', c.slug).maybeSingle()
  if (error || !row) {
    console.error(`\n✗ ${c.slug}: not found${error ? ` (${error.message})` : ''}`)
    failed++
    continue
  }
  const update = {}
  for (const [key, value] of Object.entries(c.set ?? {})) {
    if (canonical(row[key]) !== canonical(value)) update[key] = value
  }
  if (c.facts.length && String(row.verified_at ?? '').slice(0, 10) !== batch.checkedAt) {
    update.verified_at = batch.checkedAt
  }

  console.log(`\n■ ${c.slug}${c.note ? ` — ${c.note}` : ''}`)
  if (!Object.keys(update).length) { console.log('  (no changes)'); continue }
  for (const [key, value] of Object.entries(update)) {
    console.log(`  ${key}:\n    - ${short(row[key])}\n    + ${short(value)}`)
  }
  plan.push({ row, update })
}

if (apply && plan.length) {
  mkdirSync('scripts/data/backups', { recursive: true })
  const stamp = new Date().toISOString().replace(/[:.]/g, '-')
  const backup = `scripts/data/backups/${basename(file, '.json')}-${stamp}.json`
  writeFileSync(backup, JSON.stringify(plan.map((p) => p.row), null, 1))
  console.log(`\nBackup of ${plan.length} rows: ${backup}`)

  for (const { row, update } of plan) {
    const { error } = await client
      .from('centers')
      .update({ ...update, updated_at: new Date().toISOString() })
      .eq('id', row.id)
    if (error) { console.error(`✗ ${row.slug}: ${error.message}`); failed++ }
  }
}

console.log(
  apply
    ? `\nDone: ${plan.length} rows updated, ${failed} failed.`
    : `\nDry run: ${plan.length} rows would change, ${failed} not found. Re-run with --apply to write.`,
)
process.exit(failed ? 1 : 0)
