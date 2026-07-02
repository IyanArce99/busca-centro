/**
 * Post-import verification — Supabase
 *
 * Verifica el estado de los datos importados en Supabase usando
 * SUPABASE_SERVICE_ROLE_KEY (bypasea RLS, nunca exponer en frontend).
 *
 * Run: npm run verify:import
 *
 * No modifica datos. Solo lectura.
 */

import { readFileSync } from "fs";
import { resolve } from "path";
import { createClient } from "@supabase/supabase-js";
import type { Database } from "../src/types/database";

// ─── Env ──────────────────────────────────────────────────────────────────────

function loadEnvLocal() {
  try {
    const raw = readFileSync(resolve(process.cwd(), ".env.local"), "utf-8");
    for (const line of raw.split("\n")) {
      const trimmed = line.trim();
      if (!trimmed || trimmed.startsWith("#")) continue;
      const eq = trimmed.indexOf("=");
      if (eq < 1) continue;
      const key = trimmed.slice(0, eq).trim();
      const val = trimmed.slice(eq + 1).trim();
      if (key && !(key in process.env)) process.env[key] = val;
    }
  } catch { /* opcional */ }
}

// ─── Helpers ──────────────────────────────────────────────────────────────────

function ok(msg: string)   { console.log(`  ✓  ${msg}`); }
function warn(msg: string) { console.log(`  ⚠️  ${msg}`); }
function fail(msg: string) { console.log(`  ✗  ${msg}`); }
function info(msg: string) { console.log(`  ℹ  ${msg}`); }

function section(title: string) {
  console.log(`\n── ${title} ${"─".repeat(Math.max(0, 62 - title.length))}`);
}

function table(rows: Array<[string, number]>, labelWidth = 30) {
  for (const [label, count] of rows) {
    const padded = label.padEnd(labelWidth, " ");
    console.log(`     ${padded} ${count}`);
  }
}

// ─── Main ─────────────────────────────────────────────────────────────────────

async function main() {
  loadEnvLocal();

  const url        = process.env.NEXT_PUBLIC_SUPABASE_URL;
  const serviceKey = process.env.SUPABASE_SERVICE_ROLE_KEY;

  if (!url || !serviceKey) {
    console.error("✗ Necesario: NEXT_PUBLIC_SUPABASE_URL y SUPABASE_SERVICE_ROLE_KEY en .env.local");
    process.exit(1);
  }

  const db = createClient<Database>(url, serviceKey, { auth: { persistSession: false } });

  console.log(`\n🔍 Verificando datos en: ${url}`);

  // ── 1. Ciudad Madrid en cities ────────────────────────────────────────────
  section("1. Ciudad Madrid en tabla cities");

  const { data: madridCity, error: cityErr } = await db
    .from("cities")
    .select("id, slug, name, province, region")
    .eq("slug", "madrid")
    .single();

  if (cityErr || !madridCity) {
    fail("Ciudad 'madrid' NO encontrada en tabla cities");
    warn("Ejecuta el import con --city madrid para crearla, o insértala manualmente.");
  } else {
    ok(`Ciudad encontrada: ${madridCity.name} (${madridCity.region})`);
    info(`id: ${madridCity.id}`);
  }

  // ── 2. Total centros ──────────────────────────────────────────────────────
  section("2. Total de centros importados");

  const { count: totalCenters, error: countErr } = await db
    .from("centers")
    .select("*", { count: "exact", head: true });

  if (countErr) {
    fail(`Error al contar centros: ${countErr.message}`);
  } else {
    ok(`Total centros en BD: ${totalCenters}`);
  }

  // ── 3. Por ciudad ─────────────────────────────────────────────────────────
  section("3. Centros por ciudad");

  const { data: byCityRaw } = await db
    .from("centers")
    .select("city_slug, city_name");

  if (byCityRaw) {
    const byCity = byCityRaw.reduce<Record<string, number>>((acc, r) => {
      const key = `${r.city_slug} (${r.city_name})`;
      acc[key] = (acc[key] ?? 0) + 1;
      return acc;
    }, {});
    table(Object.entries(byCity).sort((a, b) => b[1] - a[1]) as Array<[string, number]>);
  }

  // ── 4. Por barrio ─────────────────────────────────────────────────────────
  section("4. Centros por barrio (neighborhood)");

  const { data: byNeighborhoodRaw } = await db
    .from("centers")
    .select("neighborhood")
    .eq("city_slug", "madrid");

  if (byNeighborhoodRaw) {
    const byN = byNeighborhoodRaw.reduce<Record<string, number>>((acc, r) => {
      const key = r.neighborhood ?? "(sin barrio)";
      acc[key] = (acc[key] ?? 0) + 1;
      return acc;
    }, {});
    table(Object.entries(byN).sort((a, b) => b[1] - a[1]) as Array<[string, number]>);
  }

  // ── 5. Por tipo ───────────────────────────────────────────────────────────
  section("5. Centros por tipo");

  const { data: byTypeRaw } = await db
    .from("centers")
    .select("type")
    .eq("city_slug", "madrid");

  if (byTypeRaw) {
    const byT = byTypeRaw.reduce<Record<string, number>>((acc, r) => {
      acc[r.type] = (acc[r.type] ?? 0) + 1;
      return acc;
    }, {});
    table(Object.entries(byT).sort((a, b) => b[1] - a[1]) as Array<[string, number]>);
  }

  // ── 6. Por titularidad ────────────────────────────────────────────────────
  section("6. Centros por titularidad (ownership)");

  const { data: byOwnerRaw } = await db
    .from("centers")
    .select("ownership")
    .eq("city_slug", "madrid");

  if (byOwnerRaw) {
    const byO = byOwnerRaw.reduce<Record<string, number>>((acc, r) => {
      acc[r.ownership] = (acc[r.ownership] ?? 0) + 1;
      return acc;
    }, {});
    table(Object.entries(byO).sort((a, b) => b[1] - a[1]) as Array<[string, number]>);
  }

  // ── 7. Por status ─────────────────────────────────────────────────────────
  section("7. Centros por status");

  const { data: byStatusRaw } = await db
    .from("centers")
    .select("status")
    .eq("city_slug", "madrid");

  if (byStatusRaw) {
    const byS = byStatusRaw.reduce<Record<string, number>>((acc, r) => {
      acc[r.status] = (acc[r.status] ?? 0) + 1;
      return acc;
    }, {});
    table(Object.entries(byS).sort((a, b) => b[1] - a[1]) as Array<[string, number]>);

    const draft     = byS["draft"] ?? 0;
    const published = byS["published"] ?? 0;
    if (draft > 0 && published === 0) {
      info("Todos en draft — correcto para la fase actual. Publicar tras revisión manual.");
    } else if (published > 0) {
      warn(`${published} centros ya en published — verifica que sea intencionado.`);
    }
  }

  // ── 8. Verificación: is_claimed / is_verified ─────────────────────────────
  section("8. Flags claimed / verified");

  const { data: flagsRaw } = await db
    .from("centers")
    .select("is_claimed, is_verified")
    .eq("city_slug", "madrid");

  if (flagsRaw) {
    const claimed  = flagsRaw.filter((r) => r.is_claimed).length;
    const verified = flagsRaw.filter((r) => r.is_verified).length;
    if (claimed  === 0) ok("is_claimed=false en todos — correcto");   else warn(`${claimed} centros con is_claimed=true`);
    if (verified === 0) ok("is_verified=false en todos — correcto"); else warn(`${verified} centros con is_verified=true`);
  }

  // ── 9. Campos críticos vacíos ─────────────────────────────────────────────
  section("9. Campos críticos vacíos");

  const { data: allCenters } = await db
    .from("centers")
    .select("id, slug, name, type, ownership, city_slug, street, short_description")
    .eq("city_slug", "madrid");

  if (allCenters) {
    const missingName    = allCenters.filter((r) => !r.name?.trim()).length;
    const missingSlug    = allCenters.filter((r) => !r.slug?.trim()).length;
    const missingType    = allCenters.filter((r) => !r.type?.trim()).length;
    const missingOwner   = allCenters.filter((r) => !r.ownership?.trim()).length;
    const missingCity    = allCenters.filter((r) => !r.city_slug?.trim()).length;
    const missingStreet  = allCenters.filter((r) => !r.street?.trim()).length;
    const missingDesc    = allCenters.filter((r) => !r.short_description?.trim()).length;

    const checks: Array<[string, number]> = [
      ["Sin name",              missingName],
      ["Sin slug",              missingSlug],
      ["Sin type",              missingType],
      ["Sin ownership",         missingOwner],
      ["Sin city_slug",         missingCity],
      ["Sin street (esperado)", missingStreet],
      ["Sin short_description", missingDesc],
    ];

    for (const [label, count] of checks) {
      if (count === 0) ok(`${label}: 0`);
      else if (label.includes("esperado")) info(`${label}: ${count} (algunos centros no tienen dirección en la fuente)`);
      else warn(`${label}: ${count} — revisar`);
    }
  }

  // ── 10. Slugs duplicados ──────────────────────────────────────────────────
  section("10. Slugs duplicados");

  const { data: slugsRaw } = await db
    .from("centers")
    .select("slug")
    .eq("city_slug", "madrid");

  if (slugsRaw) {
    const slugCount = slugsRaw.reduce<Record<string, number>>((acc, r) => {
      acc[r.slug] = (acc[r.slug] ?? 0) + 1;
      return acc;
    }, {});
    const duplicates = Object.entries(slugCount).filter(([, c]) => c > 1);
    if (duplicates.length === 0) {
      ok("Sin slugs duplicados");
    } else {
      fail(`${duplicates.length} slugs duplicados:`);
      for (const [slug, count] of duplicates) {
        console.log(`     "${slug}" aparece ${count} veces`);
      }
    }
  }

  // ── 11. Muestra de 5 centros ──────────────────────────────────────────────
  section("11. Muestra aleatoria (5 centros)");

  const { data: sample } = await db
    .from("centers")
    .select("name, type, ownership, neighborhood, street, postal_code, phone, status")
    .eq("city_slug", "madrid")
    .limit(5);

  if (sample) {
    for (const c of sample) {
      console.log(`\n     ${c.name}`);
      console.log(`       type=${c.type}, ownership=${c.ownership}, status=${c.status}`);
      console.log(`       barrio=${c.neighborhood ?? "—"}`);
      console.log(`       dirección=${c.street ?? "—"} ${c.postal_code ?? ""}`);
      console.log(`       teléfono=${c.phone ?? "—"}`);
    }
  }

  section("Fin de la verificación");
  console.log("");
}

main().catch((err: unknown) => {
  console.error("✗ Error inesperado:", err);
  process.exit(1);
});
