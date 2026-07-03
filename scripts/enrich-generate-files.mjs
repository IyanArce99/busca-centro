/**
 * Genera archivos de migración REVISED a partir de csv-match-results.json.
 *
 * Diferencias respecto a la versión original:
 *   - Elimina aulas/tramos de edad de services en todos los centros
 *   - Limpia el DB para centros que solo tenían aulas (→ services vacío)
 *   - Genera archivos con sufijo _REVISED
 *
 * Produce:
 *   data/enrichment/update-all-remaining-centers_REVISED.json
 *   data/migrations/003_update_all_remaining_centers_REVISED.sql
 *   data/migrations/rollback_all_remaining_centers_REVISED.sql
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

const isAula = s => s.startsWith('aula-')

const UPDATABLE_FIELDS = [
  'neighborhood_barrio', 'district', 'phone', 'email', 'website', 'postal_code',
  'latitude', 'longitude', 'services', 'age_min_months', 'age_max_months',
  'source_url', 'short_description', 'verification_status', 'confidence_level',
  'verified_at', 'data_conflicts',
]

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

// ── Rollback helper ────────────────────────────────────────────────────────────
function rollbackFields(before) {
  const rb = {}
  for (const field of ROLLBACK_FIELDS) {
    rb[field] = before[field] ?? null
  }
  return rb
}

// ── SQL builder ────────────────────────────────────────────────────────────────
function buildUpdateSQL(id, name, fields) {
  const sets = Object.entries(fields)
    .filter(([k]) => k !== 'updated_at')
    .map(([k, v]) => `  ${k.padEnd(24)} = ${sqlVal(v)}`)
  sets.push('  updated_at              = NOW()')
  return `-- ${name}\nUPDATE centers SET\n${sets.join(',\n')}\nWHERE id = '${id}';\n`
}

// ── Compute diffs ──────────────────────────────────────────────────────────────
const enrichment = []
const stats = {
  updated: 0, fields_changed: 0, conflicts: 0,
  aula_cleanup_only: 0, aula_cleanup_with_new_services: 0,
  centers_with_real_services: 0, no_real_services: 0,
}

for (const result of matchResults) {
  const { _meta, updates } = result
  const before = backupMap.get(_meta.id)
  if (!before) { console.warn(`WARN: no backup for ${_meta.id}`); continue }

  const forward = {}
  let changed = false

  // ── Apply CSV match updates ────────────────────────────────────────────────
  for (const field of UPDATABLE_FIELDS) {
    const newVal = updates[field]
    if (newVal === undefined) continue

    const oldVal = before[field] ?? null
    const newValNorm = newVal === null ? null : newVal

    const oldStr = JSON.stringify(oldVal)
    const newStr = JSON.stringify(newValNorm)
    if (oldStr === newStr) continue

    const fillOnly = ['phone', 'email', 'website', 'postal_code', 'short_description']
    if (fillOnly.includes(field) && oldVal !== null && oldVal !== '') {
      if (field === 'phone') continue
      if (field !== 'short_description') continue
    }

    // Strip aulas from any services value coming from CSV match
    if (field === 'services' && Array.isArray(newValNorm)) {
      forward[field] = newValNorm.filter(s => !isAula(s))
    } else {
      forward[field] = newValNorm
    }
    changed = true
    stats.fields_changed++
  }

  // ── Aula cleanup: strip aulas from DB services ─────────────────────────────
  const beforeServices = before.services ?? []
  const beforeHasAulas = beforeServices.some(isAula)

  if (beforeHasAulas) {
    const cleanedServices = beforeServices.filter(s => !isAula(s))

    if ('services' in forward) {
      // Already updating services — ensure aulas are stripped (safety)
      forward.services = (forward.services || []).filter(s => !isAula(s))
      stats.aula_cleanup_with_new_services++
    } else {
      // No services update from CSV — add cleanup
      forward.services = cleanedServices
      changed = true
      stats.fields_changed++
      if (cleanedServices.length === 0) stats.aula_cleanup_only++
      else stats.aula_cleanup_with_new_services++
    }
  }

  // ── data_conflicts handling ────────────────────────────────────────────────
  if (updates.data_conflicts && Object.keys(updates.data_conflicts).length > 0) {
    stats.conflicts++
    if (!forward.data_conflicts) {
      forward.data_conflicts = updates.data_conflicts
      changed = true
    }
  }

  if (changed) {
    forward.updated_at = '__NOW__'
    enrichment.push({ _meta, forward, rollback: { ...rollbackFields(before), updated_at: '__NOW__' } })
    stats.updated++
  }

  // Track service stats
  const finalServices = forward.services ?? beforeServices.filter(s => !isAula(s))
  if (finalServices.length > 0) stats.centers_with_real_services++
  else stats.no_real_services++
}

// ── Build SQL ──────────────────────────────────────────────────────────────────
const today = '2026-07-03'

const forwardLines = [
  `-- ============================================================`,
  `-- UPDATE 003 REVISED — Enriquecimiento de 194 centros de Madrid`,
  `-- Generado: ${today}`,
  `-- Fuentes: ayto-escuelas-infantiles.csv, ayto-centros-educativos.csv,`,
  `--          cam-centros-educativos.csv`,
  `-- REQUIERE: 001_enrich_centers.sql y 002_update_10_centers.sql ejecutados.`,
  `-- ============================================================`,
  `-- CAMBIOS vs versión original:`,
  `--   • Aulas/tramos de edad eliminados de services en todos los centros`,
  `--   • Centros con solo aulas → services limpio (ARRAY[]::text[])`,
  `-- ============================================================`,
  `-- No toca: id, slug, city_slug, status, name, is_verified,`,
  `--          is_claimed, street, long_description, images.`,
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

const rollbackLines = [
  `-- ============================================================`,
  `-- ROLLBACK 003 REVISED — Restaura valores anteriores al update 003 REVISED`,
  `-- Generado: ${today}`,
  `-- ============================================================`,
  `-- Ejecutar SOLO si quieres deshacer 003_update_all_remaining_centers_REVISED.sql`,
  `-- NOTA: el rollback restaura los services originales incluyendo aulas/tramos.`,
  `-- ============================================================`,
  ``,
  `BEGIN;`,
  ``,
]

for (const { _meta, rollback } of enrichment) {
  rollbackLines.push(buildUpdateSQL(_meta.id, `ROLLBACK ${_meta.current_name}`, rollback))
}

rollbackLines.push(`COMMIT;`)

// ── JSON ───────────────────────────────────────────────────────────────────────
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

writeFileSync(`${PROJECT}/data/enrichment/update-all-remaining-centers_REVISED.json`, JSON.stringify(jsonOutput, null, 2), 'utf8')
writeFileSync(`${PROJECT}/data/migrations/003_update_all_remaining_centers_REVISED.sql`, forwardLines.join('\n'), 'utf8')
writeFileSync(`${PROJECT}/data/migrations/rollback_all_remaining_centers_REVISED.sql`, rollbackLines.join('\n'), 'utf8')

console.log(`\n✓ data/enrichment/update-all-remaining-centers_REVISED.json   (${jsonOutput.length} centros)`)
console.log(`✓ data/migrations/003_update_all_remaining_centers_REVISED.sql`)
console.log(`✓ data/migrations/rollback_all_remaining_centers_REVISED.sql`)

console.log(`\n── Estadísticas ─────────────────────────────────────────────────`)
console.log(`  Centros actualizados:         ${stats.updated}`)
console.log(`  Campos totales:               ${stats.fields_changed}`)
console.log(`  Conflictos (phone):           ${stats.conflicts}`)
console.log(`  Solo limpieza aulas:          ${stats.aula_cleanup_only}`)
console.log(`  Aulas + servicios nuevos:     ${stats.aula_cleanup_with_new_services}`)
console.log(`  Con servicios reales:         ${stats.centers_with_real_services}`)
console.log(`  Sin servicios confirmados:    ${stats.no_real_services}`)

// ── Service breakdown ──────────────────────────────────────────────────────────
const svcCount = {}
for (const { forward } of enrichment) {
  const svcs = forward.services ?? []
  for (const s of svcs) { svcCount[s] = (svcCount[s] || 0) + 1 }
}
console.log(`\n── Servicios reales confirmados ─────────────────────────────────`)
Object.entries(svcCount).sort((a, b) => b[1] - a[1]).forEach(([s, n]) =>
  console.log(`  ${s.padEnd(30)} ${n}`)
)

// ── Sample ─────────────────────────────────────────────────────────────────────
console.log(`\nMuestra (primeros 5):`)
jsonOutput.slice(0, 5).forEach(c => {
  const svcs = c.updates.services
  let svcStr
  if (svcs === undefined) svcStr = '(sin cambio)'
  else if (svcs.length === 0) svcStr = '[]'
  else svcStr = svcs.join(', ')
  console.log(`  [${c.source || '-'}] ${c.name.slice(0,40)} → services: ${svcStr}`)
})

// ── Verify no aulas in output ──────────────────────────────────────────────────
const withAulas = jsonOutput.filter(c => (c.updates.services || []).some(s => s.startsWith('aula-')))
if (withAulas.length > 0) {
  console.warn(`\n⚠ AVISO: ${withAulas.length} centros aún tienen aulas en services:`)
  withAulas.forEach(c => console.warn(`  ${c.name}: ${c.updates.services}`))
} else {
  console.log(`\n✓ Verificado: ningún centro tiene aulas en services`)
}
