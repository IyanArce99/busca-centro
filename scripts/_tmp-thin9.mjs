import { createClient } from '@supabase/supabase-js'
import { readFileSync, writeFileSync } from 'fs'
const env = {}
for (const line of readFileSync('.env.local','utf8').split(/\r?\n/)) {
  const m = line.match(/^([A-Z0-9_]+)=(.*)$/); if (m) env[m[1]] = m[2].trim()
}
const c = createClient(env.NEXT_PUBLIC_SUPABASE_URL, env.NEXT_PUBLIC_SUPABASE_ANON_KEY)
const { data } = await c.from('centers')
  .select('id,slug,name,type,ownership,street,postal_code,district,neighborhood,neighborhood_barrio,phone,email,website,social_links,source_url,services,long_description,age_min_months,age_max_months,status')
  .eq('status','published')
const real = s => (s||[]).filter(x=>!String(x).startsWith('aula-'))
const thin = data.filter(d=> real(d.services).length===0 && !(d.long_description||'').trim())
writeFileSync('scripts/_tmp-thin9.json', JSON.stringify(thin,null,2),'utf8')
for (const d of thin) {
  console.log(`\n${d.name}`)
  console.log(`  id:${d.id}`)
  console.log(`  dir: ${d.street||'-'} | ${d.postal_code||'-'} | ${d.neighborhood_barrio||d.neighborhood||'-'} | ${d.district||'-'}`)
  console.log(`  tel:${d.phone||'-'}  email:${d.email||'-'}`)
  console.log(`  web:${d.website||'-'}`)
  console.log(`  social:${d.social_links&&Object.keys(d.social_links).length?JSON.stringify(d.social_links):'-'}`)
}
