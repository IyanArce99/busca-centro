/**
 * Script de enriquecimiento desde CSV oficiales de Madrid.
 * Cruza 194 centros de la DB con:
 *   1. ayto-escuelas-infantiles.csv  (Ayuntamiento — municipales)
 *   2. ayto-centros-educativos.csv   (Ayuntamiento — todos los tipos)
 *   3. cam-centros-educativos.csv    (Comunidad de Madrid)
 *
 * Salida: data/enrichment/csv-match-results.json
 */

import { readFileSync, writeFileSync, mkdirSync } from 'fs'

const PROJECT = 'C:/Users/iyiar/Desktop/git_projects/buscacentro'

// ── CSV parser ─────────────────────────────────────────────────────────────────
function parseCSV(path, sep = ';') {
  const raw = readFileSync(path, 'latin1')
  const lines = raw.split(/\r?\n/).filter(l => l.trim())
  const headers = lines[0].split(sep).map(h => h.replace(/^"|"$/g, '').trim())
  return lines.slice(1).map(line => {
    const fields = []
    let cur = '', inQ = false
    for (const ch of line) {
      if (ch === '"') { inQ = !inQ }
      else if (ch === sep && !inQ) { fields.push(cur.trim()); cur = '' }
      else cur += ch
    }
    fields.push(cur.trim())
    const obj = {}
    headers.forEach((h, i) => { obj[h] = (fields[i] || '').replace(/^"|"$/g, '').trim() })
    return obj
  })
}

// ── Normalizers ────────────────────────────────────────────────────────────────
function normalize(name) {
  return (name || '')
    .toLowerCase()
    .normalize('NFD').replace(/[̀-ͯ]/g, '')
    .replace(/escuela\s+de\s+educacion\s+infantil\s+(municipal\s+)?/g, '')
    .replace(/escuela\s+infantil\s+(municipal\s+)?/g, '')
    .replace(/centro\s+(de\s+)?educacion\s+infantil\s+/g, '')
    .replace(/^(ei|eim|cein|cei|eei|e\.i\.)\s*/g, '')
    .replace(/\s+(s\.?l\.?|s\.?a\.?)$/g, '')
    .replace(/[^\w\s]/g, ' ')
    .replace(/\s+/g, ' ')
    .trim()
}

function tokenSimilarity(a, b) {
  const ta = new Set(normalize(a).split(' ').filter(t => t.length > 2))
  const tb = new Set(normalize(b).split(' ').filter(t => t.length > 2))
  if (ta.size === 0 || tb.size === 0) return 0
  const inter = [...ta].filter(t => tb.has(t)).length
  const union = new Set([...ta, ...tb]).size
  const jaccard = inter / union
  // Bonus if exact normalized match
  const na = normalize(a), nb = normalize(b)
  if (na === nb) return 1.0
  if (na.includes(nb) || nb.includes(na)) return Math.max(jaccard, 0.85)
  return jaccard
}

function toTitleCase(str) {
  if (!str) return str
  return str.toLowerCase().replace(/(?:^|\s|-)\S/g, c => c.toUpperCase())
}

function safeUrl(base, path) {
  if (!path) return null
  if (path.startsWith('http')) return path
  return base + path
}

function districtLabel(d) {
  if (!d) return null
  const map = {
    'CHAMARTIN': 'Chamartín', 'CHAMBERI': 'Chamberí', 'ARGANZUELA': 'Arganzuela',
    'RETIRO': 'Retiro', 'SALAMANCA': 'Salamanca', 'TETUAN': 'Tetuán',
    'HORTALEZA': 'Hortaleza', 'BARAJAS': 'Barajas', 'CARABANCHEL': 'Carabanchel',
    'USERA': 'Usera', 'LATINA': 'Latina', 'CENTRO': 'Centro',
    'MORATALAZ': 'Moratalaz', 'VILLA DE VALLECAS': 'Villa de Vallecas',
    'PUENTE DE VALLECAS': 'Puente de Vallecas', 'VICALVARO': 'Vicálvaro',
    'SAN BLAS': 'San Blas-Canillejas', 'CIUDAD LINEAL': 'Ciudad Lineal',
    'FUENCARRAL': 'Fuencarral-El Pardo', 'MONCLOA': 'Moncloa-Aravaca',
    'MONCLOA-ARAVACA': 'Moncloa-Aravaca', 'FUENCARRAL-EL PARDO': 'Fuencarral-El Pardo',
  }
  const key = d.toUpperCase().replace(/-.*/, '').trim()
  return map[d.toUpperCase().trim()] || map[key] || d.trim()
}

function cleanPhone(p) {
  if (!p) return null
  const digits = p.replace(/\D/g, '')
  if (digits.length < 9) return null
  // Take first 9-digit block
  const m = p.match(/\d[\d\s.-]{8,10}\d/)
  return m ? m[0].replace(/\s/g, '') : digits.slice(0, 9)
}

function cleanWebsite(url) {
  if (!url || url.length < 5) return null
  let u = url.trim().replace(/\s/g, '')
  if (!u.startsWith('http')) u = 'https://' + u
  return u
}

function extractServices(equip, desc) {
  const text = ((equip || '') + ' ' + (desc || '')).toLowerCase()
  const s = new Set()
  if (/comedor/.test(text)) s.add('comedor')
  if (/cocina propia/.test(text)) s.add('cocina-propia')
  if (/catering/.test(text)) s.add('catering')
  if (/horario ampliado/.test(text)) s.add('horario-ampliado')
  if (/madrugadores/.test(text)) s.add('servicio-madrugadores')
  if (/biling[üu]e/.test(text)) s.add('bilingue')
  if (/ingl[eé]s/.test(text)) s.add('ingles')
  if (/psicomotricidad/.test(text)) s.add('psicomotricidad')
  if (/m[uú]sica/.test(text)) s.add('musica')
  if (/patio/.test(text)) s.add('patio-exterior')
  if (/extraescolar/.test(text)) s.add('actividades-extraescolares')
  if (/verano|campamento/.test(text)) s.add('verano-campamentos')
  if (/escuela de (padres|familias)/.test(text)) s.add('escuela-de-padres')
  if (/uniform/.test(text)) s.add('uniformes')
  return [...s]
}

// ── Load data ──────────────────────────────────────────────────────────────────
console.log('Cargando datos...')
const backup = JSON.parse(readFileSync(`${PROJECT}/data/backups/centers-before-enrichment-all-remaining.json`, 'utf8'))
console.log(`  Centros backup: ${backup.length}`)

const aytoMunic = parseCSV(`${PROJECT}/data/sources/raw/ayto-escuelas-infantiles.csv`)
console.log(`  Ayto municipales: ${aytoMunic.length}`)

const aytoAll = parseCSV(`${PROJECT}/data/sources/raw/ayto-centros-educativos.csv`)
// Filter for infant-related entries
const aytoInfant = aytoAll.filter(r => {
  const desc = (r['DESCRIPCION'] || '').toLowerCase()
  const tipo = (r['TIPO'] || '').toLowerCase()
  return desc.includes('infantil') || tipo.includes('infantil') || tipo.includes('guarderia')
})
console.log(`  Ayto infant (filtrado): ${aytoInfant.length} de ${aytoAll.length}`)

// CAM — check what values MUNICIPIO has
const camRaw = parseCSV(`${PROJECT}/data/sources/raw/cam-centros-educativos.csv`)
// Debug: show field names and SITUACIÓN values to detect encoding issues
const camKeys = camRaw.length > 0 ? Object.keys(camRaw[0]) : []
const situacionKey = camKeys.find(k => k.includes('TUACI') || k.includes('tuaci')) || 'SITUACIÓN'
const madridMunis = [...new Set(camRaw.map(r => r['MUNICIPIO']).filter(m => m && m.toLowerCase().includes('adrid')))].slice(0,5)
const situValues = [...new Set(camRaw.slice(0,50).map(r => r[situacionKey]).filter(Boolean))].slice(0,5)
console.log(`  CAM MUNICIPIO like "Madrid": ${JSON.stringify(madridMunis)}`)
console.log(`  CAM situación key: "${situacionKey}", sample values: ${JSON.stringify(situValues)}`)

const camMadrid = camRaw.filter(r =>
  r['MUNICIPIO']?.toLowerCase() === 'madrid' &&
  r[situacionKey] === 'ALTA'
)
const camInfant = camMadrid.filter(r => {
  const tipo = (r['TIPO_EXT'] || '').toLowerCase()
  const abrv = (r['TIPO_ABRV'] || '').toLowerCase()
  return tipo.includes('infantil') || abrv.includes('inf')
})
console.log(`  CAM Madrid ALTA: ${camMadrid.length}`)
console.log(`  CAM Madrid infant: ${camInfant.length}`)

// ── Matching ───────────────────────────────────────────────────────────────────
console.log('\n─── Matching ────────────────────────────────────────────')

const THRESHOLDS = { municipal: 0.55, aytoInfant: 0.65, cam: 0.70 }

const results = []
const stats = { municipal: 0, aytoInfant: 0, cam: 0, none: 0 }

for (const center of backup) {
  let matchedSource = null
  let matchedRecord = null
  let matchScore = 0
  const enriched = {}
  const dataConflicts = {}

  // ── 1. Ayto municipales (public municipal schools only) ─────────────────
  if (center.ownership === 'publico') {
    for (const row of aytoMunic) {
      const score = tokenSimilarity(center.name, row['NOMBRE'])
      if (score > matchScore) { matchScore = score; matchedSource = 'ayto-municipal'; matchedRecord = row }
    }
  }

  // ── 2. Ayto infant centers (all ownership types) ────────────────────────
  if (!matchedSource || matchScore < THRESHOLDS.municipal) {
    matchScore = 0; matchedSource = null; matchedRecord = null
    for (const row of aytoInfant) {
      const score = tokenSimilarity(center.name, row['NOMBRE'])
      if (score > matchScore) { matchScore = score; matchedSource = 'ayto-infant'; matchedRecord = row }
    }
    if (matchScore < THRESHOLDS.aytoInfant) { matchScore = 0; matchedSource = null; matchedRecord = null }
  }

  // ── 3. CAM data ─────────────────────────────────────────────────────────
  if (!matchedSource && camInfant.length > 0) {
    for (const row of camInfant) {
      const score = tokenSimilarity(center.name, row['CENTRO'])
      if (score > matchScore) { matchScore = score; matchedSource = 'cam'; matchedRecord = row }
    }
    if (matchScore < THRESHOLDS.cam) { matchScore = 0; matchedSource = null; matchedRecord = null }
  }

  // ── Extract enrichment from match ────────────────────────────────────────
  if (matchedRecord && matchedSource) {
    const isAyto = matchedSource.startsWith('ayto')
    const isCam = matchedSource === 'cam'

    const barrio = isAyto ? (matchedRecord['BARRIO'] || null) : null
    const distrito = districtLabel(
      isAyto ? matchedRecord['DISTRITO'] : matchedRecord['DISTRITO']
    )
    const phone = cleanPhone(
      isAyto ? matchedRecord['TELEFONO'] : matchedRecord['TELEFONO']
    )
    const email = isAyto
      ? (matchedRecord['EMAIL'] || null)
      : (matchedRecord['E_MAIL'] || matchedRecord['E_MAIL2'] || null)
    const website = isCam ? cleanWebsite(matchedRecord['WEB']) : null
    const cp = isAyto
      ? (matchedRecord['CODIGO-POSTAL'] || null)
      : (matchedRecord['CDPOSTAL'] || null)
    const lat = isAyto ? (parseFloat(matchedRecord['LATITUD']) || null) : null
    const lng = isAyto ? (parseFloat(matchedRecord['LONGITUD']) || null) : null
    const equipamiento = isAyto ? (matchedRecord['EQUIPAMIENTO'] || '') : ''
    const descripcion = isAyto ? (matchedRecord['DESCRIPCION'] || '') : (matchedRecord['TIPO_EXT'] || '')
    const services = extractServices(equipamiento, descripcion)

    // Barrio / distrito
    if (barrio && !center.neighborhood_barrio) enriched.neighborhood_barrio = toTitleCase(barrio)
    if (distrito && !center.district) enriched.district = distrito

    // Phone — only fill if empty; if different, flag conflict
    if (phone) {
      if (!center.phone) enriched.phone = phone
      else if (phone !== center.phone && phone !== center.phone?.replace(/\s/g,'')) {
        dataConflicts.phone = { current: center.phone, proposed: phone, reason: `${matchedSource} indica teléfono diferente`, status: 'pending_manual_review' }
      }
    }

    // Email — fill if empty
    if (email && email !== '' && !center.email) enriched.email = email

    // Website (CAM only, and only if current is empty or dead educa.madrid.org)
    if (website && (!center.website || center.website.includes('educa.madrid.org'))) {
      enriched.website = website
    }

    // Postal code
    if (cp && !center.postal_code) enriched.postal_code = cp

    // Coordinates
    if (lat && lng) { enriched.latitude = lat; enriched.longitude = lng }

    // Services (merge with existing aula-* services)
    if (services.length > 0) {
      const existingAulas = (center.services || []).filter(s => s.startsWith('aula-'))
      const merged = [...new Set([...existingAulas, ...services])]
      if (JSON.stringify(merged.sort()) !== JSON.stringify((center.services || []).sort())) {
        enriched.services = merged
      }
    }

    // Ages for municipales (all are 0-36)
    if (matchedSource === 'ayto-municipal') {
      if (!center.age_max_months || center.age_max_months > 36) enriched.age_max_months = 36
      if (!center.age_min_months) enriched.age_min_months = 0
    }

    // Source URL — ayto CSVs may have relative (/portal/...) or full (http://...) URLs
    if (matchedSource === 'ayto-municipal') {
      const url = matchedRecord['CONTENT-URL']
      enriched.source_url = url
        ? safeUrl('https://www.madrid.es', url)
        : 'https://www.madrid.es/portales/munimadrid/es/Inicio/El-Ayuntamiento/Centros-y-servicios/Escuelas-infantiles-municipales/'
    } else if (matchedSource === 'ayto-infant') {
      const url = matchedRecord['CONTENT-URL']
      enriched.source_url = url ? safeUrl('https://www.madrid.es', url) : null
    }
    // CAM CSV has no per-center page URLs; website is updated separately above

    // Verification
    const hasConflicts = Object.keys(dataConflicts).length > 0
    enriched.verification_status = hasConflicts ? 'pending_manual_review' : 'partially_verified'
    enriched.confidence_level = matchedSource === 'ayto-municipal' ? 'high' : 'medium'
    enriched.verified_at = '2026-07-02T00:00:00Z'

    if (hasConflicts) enriched.data_conflicts = dataConflicts

    stats[matchedSource === 'ayto-municipal' ? 'municipal' : matchedSource === 'ayto-infant' ? 'aytoInfant' : 'cam']++
  } else {
    // No match
    enriched.verification_status = 'unverified'
    enriched.confidence_level = 'unknown'
    enriched.verified_at = '2026-07-02T00:00:00Z'
    stats.none++
  }

  // Short description (generate based on what we know)
  const district = enriched.district || center.district || center.neighborhood
  const barrio = enriched.neighborhood_barrio || center.neighborhood_barrio
  const tipo = center.type === 'guarderia' ? 'Guardería' : 'Escuela infantil'
  const owner = center.ownership === 'publico' ? 'pública' : center.ownership === 'concertado' ? 'concertada' : 'privada'
  const location = barrio ? `barrio de ${barrio}, distrito ${district}` : district ? `distrito de ${district}` : 'Madrid'
  const maxM = enriched.age_max_months || center.age_max_months
  const etapa = maxM === 36 ? 'primer ciclo (0 a 3 años)' : maxM === 72 ? 'primer y segundo ciclo (0 a 6 años)' : null
  const allServices = enriched.services || center.services || []
  const svcLabels = []
  if (allServices.includes('comedor') || allServices.includes('cocina-propia') || allServices.includes('catering')) svcLabels.push('comedor')
  if (allServices.includes('horario-ampliado')) svcLabels.push('horario ampliado')
  if (allServices.includes('bilingue') || allServices.includes('ingles')) svcLabels.push('inglés')

  let desc = `${tipo} ${owner} ubicada en el ${location}.`
  if (etapa) desc += ` Atiende el ${etapa}.`
  if (svcLabels.length > 0) desc += ` Cuenta con ${svcLabels.join(', ')} según la información pública disponible.`
  if (enriched.verification_status === 'unverified') desc += ' La ficha está pendiente de verificación.'
  enriched.short_description = desc

  results.push({
    _meta: {
      id: center.id,
      slug: center.slug,
      current_name: center.name,
      matched_source: matchedSource,
      matched_name: matchedRecord ? (matchedRecord['NOMBRE'] || matchedRecord['CENTRO']) : null,
      match_score: Math.round(matchScore * 100) / 100,
      ready_to_apply: !!matchedSource,
      notes: matchedSource ? `Match ${matchedSource} (score ${(matchScore*100).toFixed(0)}%)` : 'Sin match en CSV — revisar manualmente'
    },
    updates: Object.keys(enriched).length > 0 ? enriched : {
      verification_status: 'unverified',
      confidence_level: 'unknown',
      verified_at: '2026-07-02T00:00:00Z',
      short_description: enriched.short_description || center.short_description
    }
  })
}

// ── Summary ────────────────────────────────────────────────────────────────────
console.log(`\n  Matched municipal:   ${stats.municipal}`)
console.log(`  Matched ayto-infant: ${stats.aytoInfant}`)
console.log(`  Matched CAM:         ${stats.cam}`)
console.log(`  Sin match:           ${stats.none}`)
console.log(`  Total:               ${backup.length}`)

console.log('\nCentros sin match en CSV:')
results.filter(r => !r._meta.matched_source).forEach((r,i) =>
  console.log(`  ${i+1}. ${r._meta.current_name} | ${backup.find(c=>c.id===r._meta.id)?.ownership} | web: ${backup.find(c=>c.id===r._meta.id)?.website || '-'}`)
)

console.log('\nAlta confianza (municipal):')
results.filter(r => r._meta.matched_source === 'ayto-municipal').slice(0,5).forEach(r =>
  console.log(`  ✓ ${r._meta.current_name} → ${r._meta.matched_name} (${(r._meta.match_score*100).toFixed(0)}%)`)
)

console.log('\nSample matches ayto-infant:')
results.filter(r => r._meta.matched_source === 'ayto-infant').slice(0,5).forEach(r =>
  console.log(`  ~ ${r._meta.current_name} → ${r._meta.matched_name} (${(r._meta.match_score*100).toFixed(0)}%)`)
)

mkdirSync(`${PROJECT}/data/enrichment`, { recursive: true })
writeFileSync(`${PROJECT}/data/enrichment/csv-match-results.json`, JSON.stringify(results, null, 2), 'utf8')
console.log(`\nGuardado: data/enrichment/csv-match-results.json (${results.length} centros)`)
