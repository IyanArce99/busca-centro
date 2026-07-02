// Script temporal — obtiene centros de Madrid restantes y guarda backup
import { createClient } from '@supabase/supabase-js'
import { writeFileSync, mkdirSync } from 'fs'

const client = createClient(
  process.env.NEXT_PUBLIC_SUPABASE_URL,
  process.env.SUPABASE_SERVICE_ROLE_KEY
)

const ALREADY_DONE = [
  '81bef1fb-58ae-40c8-a323-058c1f917e9d',
  '49e1fb72-4b07-4bec-b52d-6d53fc3f66fa',
  '843c6622-c091-4b26-b069-b0764200ecb5',
  '4fb5d8d8-d11c-431f-8acc-73cc33ec1e53',
  '375bcd5b-f1ad-421d-a62e-33671df573ba',
  '674b04e9-fef5-4432-a4fc-338aad58acc7',
  'f8909853-cf9e-434e-8951-3ed004176dcb',
  'a41cfb3d-e7d6-4c1b-8122-41295776a71c',
  'e82f1941-c68a-4ddd-a8e6-0c6d56a77c7f',
  '698058e0-e2c0-4bd5-b324-f4441ab4bbf8'
]

const { data, error } = await client
  .from('centers')
  .select('id,slug,name,type,ownership,street,postal_code,neighborhood,district,neighborhood_barrio,phone,email,website,age_min_months,age_max_months,schedule,services,short_description,long_description,images,is_claimed,is_verified,social_links,pedagogical_approach,source_url,source_urls_secondary,verified_at,verification_status,confidence_level,data_conflicts,status,created_at,updated_at')
  .eq('city_slug', 'madrid')
  .eq('status', 'published')
  .order('name')

if (error) { console.error('ERROR:', JSON.stringify(error)); process.exit(1) }

const remaining = data.filter(c => !ALREADY_DONE.includes(c.id))
console.log(`Total Madrid published: ${data.length}`)
console.log(`Ya enriquecidos (excluidos): ${ALREADY_DONE.length}`)
console.log(`Restantes a procesar: ${remaining.length}`)
console.log('---')
remaining.forEach((c,i) => {
  const web = c.website ? c.website.slice(0,55) : '-'
  const tel = c.phone || '-'
  console.log(`${String(i+1).padStart(3)}. [${c.id}] ${c.name.slice(0,40).padEnd(40)} | ${(c.type||'').padEnd(18)} | ${(c.ownership||'').padEnd(10)} | tel:${tel.padEnd(14)} | web:${web}`)
})

mkdirSync('data/backups', { recursive: true })
writeFileSync('data/backups/centers-before-enrichment-all-remaining.json', JSON.stringify(remaining, null, 2), 'utf8')
console.log(`\nBackup guardado: data/backups/centers-before-enrichment-all-remaining.json (${remaining.length} centros)`)
