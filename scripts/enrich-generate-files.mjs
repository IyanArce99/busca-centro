/**
 * Genera los archivos de migración a partir de csv-match-results.json.
 *
 * Produce:
 *   data/enrichment/update-all-remaining-centers.json
 *   data/migrations/003_update_all_remaining_centers.sql
 *   data/migrations/rollback_all_remaining_centers.sql
 */

import { readFileSync, writeFileSync, mkdirSync } from 'fs'

const PROJECT = 'C:/Users/iyiar/Desktop/git_projects/buscacentro'

// ── Helpers ────────────────────────────────────────────────────────────────────
function esc(str) { return (str || '').replace(/'/g, "''") }

function sqlVal(v) {
  if (v === null || v === undefined) return 'NULL'
  if (typeof v === 'number') return String(v)
  if (typeof v === 'boolean') return v ? 'TRUE' : 'FALSE'
  if (Array.isArray(v)) {
    if (v.length === 0) return "ARRAY[]::text[]"
    return `ARRAY[${v.map(item => `'${esc(item)}'`).join(',')}]`
  }
  if (typeof v === 'object') return `'${esc(JSON.stringify(v))}'::jsonb`
  return `'${esc(String(v))}'`
}

// Field map: js name → SQL column name (they match for us)
const UPDATABLE_FIELDS = [
  'neighborhood_barrio', 'district', 'phone', 'email', 'website', 'postal_code',
  'latitude', 'longitude', 'services', 'age_min_months', 'age_max_months',
  'source_url', 'short_description', 'verification_status', 'confidence_level',
  'verified_at', 'data_conflicts',
]

// Fields present in backup (used for rollback)
const ROLLBACK_FIELDS = [
  'neighborhood_barrio', 'district', 'phone', 'email', 'website', 'postal_code',
  'services', 'age_min_months', 'age_max_months',
  'source_url', 'short_description', 'verification_status', 'confidence_level',
  'verified_at', 'data_conflicts',
]

// ── Load data ──────────────────────────────────────────────────────────────────
const matchResults = JSON.parse(readFileSync(`${PROJECT}/data/enrichment/csv-match-results.json`, 'utf8'))
const backup = JSON.parse(readFileSync(`${PROJECT}/data/backups/centers-before-enrichment-all-remaining.json`, 'utf8'))
const backupMap = new Map(backup.map(c => [c.id, c]))

console.log(`Match results: ${matchResults.length}`)
console.log(`Backup entries: ${backup.length}`)

// ── Compute diffs ──────────────────────────────────────────────────────────────
const enrichment = []
const stats = { updated: 0, fields_changed: 0, conflicts: 0, skipped: 0 }

for (const result of matchResults) {
  const { _meta, updates } = result
  const before = backupMap.get(_meta.id)
  if (!before) { console.warn(`WARN: no backup for ${_meta.id}`); continue }

  // Determine which fields actually changed
  const forward = {}
  const rollback = {}
  let changed = false

  for (const field of UPDATABLE_FIELDS) {
    const newVal = updates[field]
    if (newVal === undefined) continue  // not in this update

    const oldVal = before[field] ?? null
    const newValNorm = newVal === null ? null : newVal

    // Skip if values are functionally identical
    const oldStr = JSON.stringify(oldVal)
    const newStr = JSON.stringify(newValNorm)
    if (oldStr === newStr) continue

    // Don't overwrite non-null values for most fields (only append/fill)
    const fillOnly = ['phone', 'email', 'website', 'postal_code', 'short_description']
    if (fillOnly.includes(field) && oldVal !== null && oldVal !== '') {
      // Phone conflict is already in data_conflicts — skip the phone field itself
      if (field === 'phone') continue
      // For others: only overwrite if new value is clearly better (longer description, etc.)
      if (field === 'short_description') {
        // Always update description since generated one uses enriched data
        // fallthrough
      } else {
        continue
      }
    }

    forward[field] = newValNorm
    changed = true
    stats.fields_changed++
  }

  // Always add updated_at
  if (changed) {
    forward.updated_at = '__NOW__'
    enrichment.push({ _meta, forward, rollback: { ...rollbackFields(before), updated_at: '__NOW__' } })
    stats.updated++
  } else {
    stats.skipped++
  }

  if (updates.data_conflicts && Object.keys(updates.data_conflicts).length > 0) {
    stats.conflicts++
    // Ensure data_conflicts is in forward even if nothing else changed
    if (!forward.data_conflicts) {
      forward.data_conflicts = updates.data_conflicts
      forward.updated_at = '__NOW__'
      if (enrichment.at(-1)?._meta.id === _meta.id) {
        enrichment.at(-1).forward = forward
      } else {
        enrichment.push({ _meta, forward, rollback: { ...rollbackFields(before), updated_at: '__NOW__' } })
        stats.updated++
      }
    }
  }
}

function rollbackFields(before) {
  const rb = {}
  for (const field of ROLLBACK_FIELDS) {
    rb[field] = before[field] ?? null
  }
  return rb
}

// ── Build SQL ──────────────────────────────────────────────────────────────────
function buildUpdateSQL(id, name, fields, comment) {
  const sets = Object.entries(fields)
    .filter(([k]) => k !== 'updated_at')
    .map(([k, v]) => `  ${k.padEnd(24)} = ${sqlVal(v)}`)
  sets.push('  updated_at              = NOW()')
  return `-- ${name}\nUPDATE centers SET\n${sets.join(',\n')}\nWHERE id = '${id}';\n`
}

// ── Forward migration ──────────────────────────────────────────────────────────
const forwardLines = [
  `-- ============================================================`,
  `-- UPDATE 003 — Enriquecimiento de 194 centros restantes de Madrid`,
  `-- Generado: 2026-07-02`,
  `-- Fuentes: ayto-escuelas-infantiles.csv, ayto-centros-educativos.csv,`,
  `--          cam-centros-educativos.csv`,
  `-- REQUIERE: 001_enrich_centers.sql y 002_update_10_centers.sql ejecutados.`,
  `-- ============================================================`,
  `-- Solo modifica los 194 centros excluidos del update 002.`,
  `-- No toca: id, slug, city_slug, status, name, is_verified,`,
  `--          is_claimed, street (dirección), long_description, images.`,
  `-- ============================================================`,
  ``,
  `BEGIN;`,
  ``,
]

for (const { _meta, forward } of enrichment) {
  forwardLines.push(buildUpdateSQL(_meta.id, `${_meta.current_name} [${_meta.matched_source || 'sin match'}]`, forward))
}

forwardLines.push(`COMMIT;`)
forwardLines.push(``)
forwardLines.push(`-- ${enrichment.length} centros actualizados de ${matchResults.length} totales.`)

// ── Rollback ───────────────────────────────────────────────────────────────────
const rollbackLines = [
  `-- ============================================================`,
  `-- ROLLBACK 003 — Restaura valores anteriores al update 003`,
  `-- Generado: 2026-07-02`,
  `-- ============================================================`,
  `-- Ejecutar SOLO si quieres deshacer 003_update_all_remaining_centers.sql`,
  `-- ============================================================`,
  ``,
  `BEGIN;`,
  ``,
]

for (const { _meta, rollback } of enrichment) {
  rollbackLines.push(buildUpdateSQL(_meta.id, `ROLLBACK ${_meta.current_name}`, rollback))
}

rollbackLines.push(`COMMIT;`)

// ── JSON for staging review ────────────────────────────────────────────────────
const jsonOutput = enrichment.map(({ _meta, forward }) => ({
  id: _meta.id,
  slug: _meta.slug,
  name: _meta.current_name,
  source: _meta.matched_source,
  matched_to: _meta.matched_name,
  score: _meta.match_score,
  updates: forward,
}))

// ── Write files ────────────────────────────────────────────────────────────────
mkdirSync(`${PROJECT}/data/enrichment`, { recursive: true })
mkdirSync(`${PROJECT}/data/migrations`, { recursive: true })

writeFileSync(`${PROJECT}/data/enrichment/update-all-remaining-centers.json`, JSON.stringify(jsonOutput, null, 2), 'utf8')
writeFileSync(`${PROJECT}/data/migrations/003_update_all_remaining_centers.sql`, forwardLines.join('\n'), 'utf8')
writeFileSync(`${PROJECT}/data/migrations/rollback_all_remaining_centers.sql`, rollbackLines.join('\n'), 'utf8')

console.log(`\n✓ data/enrichment/update-all-remaining-centers.json   (${jsonOutput.length} centros)`)
console.log(`✓ data/migrations/003_update_all_remaining_centers.sql`)
console.log(`✓ data/migrations/rollback_all_remaining_centers.sql`)
console.log(`\nEstadísticas:`)
console.log(`  Centros con cambios:    ${stats.updated}`)
console.log(`  Campos totales:         ${stats.fields_changed}`)
console.log(`  Centros con conflictos: ${stats.conflicts}`)
console.log(`  Sin cambios:            ${stats.skipped}`)

// Show sample
console.log(`\nMuestra (primeros 3):`)
jsonOutput.slice(0, 3).forEach(c => {
  const keys = Object.keys(c.updates).filter(k => k !== 'updated_at')
  console.log(`  [${c.source}] ${c.name} → ${keys.join(', ')}`)
})

// Show centers with conflicts
const withConflicts = jsonOutput.filter(c => c.updates.data_conflicts)
if (withConflicts.length > 0) {
  console.log(`\nCentros con conflictos (${withConflicts.length}):`)
  withConflicts.forEach(c => {
    const fields = Object.keys(c.updates.data_conflicts)
    console.log(`  ${c.name} → conflicto en: ${fields.join(', ')}`)
  })
}
