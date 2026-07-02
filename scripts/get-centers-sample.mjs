// Script temporal para obtener muestra de centros desde Supabase
// Uso: node scripts/get-centers-sample.mjs
import { createClient } from "@supabase/supabase-js";

const supabase = createClient(
  "https://qqjojugpidgjdffgcmso.supabase.co",
  "sb_publishable_Yy_xkEv5vPpqPyMltJHZSA_WK3_6rlY"
);

const { data, error } = await supabase
  .from("centers")
  .select(
    "id, slug, name, type, ownership, street, postal_code, neighborhood, phone, email, website, services, age_min_months, age_max_months, schedule, short_description, is_verified, is_claimed"
  )
  .eq("status", "published")
  .eq("city_slug", "madrid")
  .order("neighborhood", { ascending: true, nullsFirst: false })
  .order("name")
  .limit(50);

if (error) {
  console.error("Error:", error.message);
  process.exit(1);
}

// Muestra breve para seleccionar la muestra de 10
console.log(`Total obtenidos: ${data.length}\n`);
for (const c of data) {
  const hasSvcs = c.services?.length > 0 ? `svcs:${c.services.length}` : "sin-servicios";
  const hasWeb = c.website ? "web:si" : "web:NO";
  const hasPhone = c.phone ? "tel:si" : "tel:NO";
  console.log(
    `${c.neighborhood ?? "SIN-BARRIO"} | ${c.slug} | ${c.name} | ${c.type} | ${c.ownership} | ${hasPhone} | ${hasWeb} | ${hasSvcs}`
  );
}
