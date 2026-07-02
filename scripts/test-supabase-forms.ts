/**
 * Supabase forms integration test — con diagnóstico completo.
 *
 * Run: npm run test:supabase
 *
 * Hipótesis que testa en orden:
 *  H1 — INSERT sin RETURNING (replicar exactamente el código de producción)
 *  H2 — INSERT con RETURNING id (test anterior que fallaba — aisla si el problema era el SELECT)
 *  H3 — Lectura anon de tablas privadas (debe devolver 0 filas, no error)
 *  H4 — Verificación + limpieza con service role (si SUPABASE_SERVICE_ROLE_KEY está disponible)
 *
 * Seguridad:
 *  - No imprime API keys en consola.
 *  - No modifica políticas RLS.
 *  - No corre en producción.
 *  - Limpia datos de prueba con service role si está disponible.
 */

import { readFileSync } from "fs";
import { resolve } from "path";
import { createClient } from "@supabase/supabase-js";
import type { Database } from "../src/types/database";

// ─── Carga .env.local ─────────────────────────────────────────────────────────
function loadEnvLocal() {
  try {
    const raw = readFileSync(resolve(process.cwd(), ".env.local"), "utf-8");
    for (const line of raw.split("\n")) {
      const trimmed = line.trim();
      if (!trimmed || trimmed.startsWith("#")) continue;
      const eqIdx = trimmed.indexOf("=");
      if (eqIdx < 1) continue;
      const key = trimmed.slice(0, eqIdx).trim();
      const val = trimmed.slice(eqIdx + 1).trim();
      if (key && !(key in process.env)) process.env[key] = val;
    }
  } catch { /* ignorar si .env.local no existe */ }
}

loadEnvLocal();

// ─── Helpers ──────────────────────────────────────────────────────────────────
function pass(msg: string) { console.log(`  ✓ ${msg}`); }
function fail(msg: string, detail?: string) {
  console.error(`  ✗ ${msg}`);
  if (detail) console.error(`    └─ ${detail}`);
}
function info(msg: string) { console.log(`  ℹ  ${msg}`); }
function section(title: string) {
  console.log(`\n── ${title} ${"─".repeat(Math.max(0, 65 - title.length))}`);
}

// ─── Main ─────────────────────────────────────────────────────────────────────
async function main() {
  // Guard: no production
  if (process.env.NODE_ENV === "production" || process.env.VERCEL_ENV === "production") {
    console.error("✗ No debe ejecutarse en producción. Abortando.");
    process.exit(1);
  }

  // Validar env vars
  const SUPABASE_URL = process.env.NEXT_PUBLIC_SUPABASE_URL;
  const ANON_KEY     = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;
  const SERVICE_KEY  = process.env.SUPABASE_SERVICE_ROLE_KEY;

  if (!SUPABASE_URL || !ANON_KEY) {
    console.error("✗ Faltan: NEXT_PUBLIC_SUPABASE_URL y/o NEXT_PUBLIC_SUPABASE_ANON_KEY");
    process.exit(1);
  }

  console.log(`\n🔍 Proyecto: ${SUPABASE_URL}`);
  console.log(SERVICE_KEY ? "🔑 SERVICE_ROLE_KEY disponible" : "ℹ️  Sin SERVICE_ROLE_KEY");

  // Clientes
  const anon = createClient<Database>(SUPABASE_URL, ANON_KEY);
  const svc  = SERVICE_KEY
    ? createClient<Database>(SUPABASE_URL, SERVICE_KEY, { auth: { persistSession: false } })
    : null;

  const NOW      = new Date().toISOString();
  const TEST_TAG = "TEST_SUPABASE_BUSCACENTRO";

  // ════════════════════════════════════════════════════════════════════════════
  // DIAGNÓSTICO PREVIO — qué policies existen según el dashboard
  // ════════════════════════════════════════════════════════════════════════════
  section("DIAGNÓSTICO — policies actuales (vía service role)");

  if (svc) {
    // rpc call a una query SQL directa con service role para leer pg_policies
    const { data: policies, error: pErr } = await svc
      .rpc("get_rls_policies_for_form_tables" as never);

    if (pErr) {
      // La función RPC no existe todavía — mostramos el SQL que hay que ejecutar
      info("La función RPC de diagnóstico no existe. Pega este SQL en el Dashboard SQL Editor:");
      info("──────────────────────────────────────────────────────────────────────");
      info("SELECT tablename, policyname, permissive, roles, cmd, with_check");
      info("FROM pg_policies");
      info("WHERE tablename IN ('leads','center_submissions','center_claims')");
      info("ORDER BY tablename, policyname;");
      info("──────────────────────────────────────────────────────────────────────");
    } else {
      console.log("  Policies encontradas:");
      console.log(JSON.stringify(policies, null, 4));
    }
  } else {
    info("Sin SERVICE_ROLE_KEY — no se pueden leer pg_policies desde el script.");
    info("Ejecuta este SQL en el Dashboard → SQL Editor para ver las policies actuales:");
    console.log("");
    console.log("    SELECT tablename, policyname, permissive, roles, cmd, with_check");
    console.log("    FROM pg_policies");
    console.log("    WHERE tablename IN ('leads','center_submissions','center_claims')");
    console.log("    ORDER BY tablename, policyname;");
    console.log("");
    info("Deberías ver 3 filas con cmd='INSERT' y with_check='true'.");
    info("Si no ves esas filas, las policies INSERT no están creadas.");
  }

  // ════════════════════════════════════════════════════════════════════════════
  // H1 — INSERT sin RETURNING (exactamente como lo hace el código de producción)
  //      Si esto falla → las políticas INSERT realmente no están activas.
  //      Si esto pasa  → el problema anterior era el RETURNING sin política SELECT.
  // ════════════════════════════════════════════════════════════════════════════
  section("H1 — INSERT sin RETURNING (replica código de producción)");

  const leadBase = {
    center_slug: "test-center-slug",
    name: `Test BuscaCentro [${NOW}]`,
    email: "test+supabase@buscacentro.local",
    phone: "600000000",
    message: `[${TEST_TAG}] Prueba automática. Puede eliminarse.`,
  };

  const subBase = {
    name: `Centro Test [${NOW}]`,
    city: "Madrid",
    address: "Calle Test 0, 28001 Madrid",
    contact_name: "Test BuscaCentro",
    email: "test+supabase@buscacentro.local",
    phone: "600000000",
    website: null as string | null,
    center_type: "guarderia" as string | null,
    age_range: "4 meses a 3 años",
    services: `[${TEST_TAG}] comedor, horario ampliado`,
    comments: `[${TEST_TAG}] Prueba automática. Puede eliminarse.`,
  };

  const claimBase = {
    center_name: `Centro Test [${NOW}]`,
    center_url: "https://test.buscacentro.local",
    applicant_name: "Test BuscaCentro",
    applicant_role: "Director",
    corporate_email: "test+supabase@buscacentro.local",
    phone: "600000000",
    website: null as string | null,
    comments: `[${TEST_TAG}] Prueba automática. Puede eliminarse.`,
  };

  // INSERT puro sin RETURNING — mismo patrón que createLead() en producción
  const h1Lead = await anon.from("leads").insert(leadBase);
  if (h1Lead.error) {
    fail("leads INSERT (sin RETURNING)", `${h1Lead.error.code} — ${h1Lead.error.message}`);
    info("→ Las políticas INSERT no están activas para el rol anon.");
    info("  Ejecuta el SQL de corrección en supabase/fix-rls-insert-policies.sql");
  } else {
    pass("leads INSERT sin RETURNING — OK (la política INSERT funciona)");
  }

  const h1Sub = await anon.from("center_submissions").insert(subBase);
  if (h1Sub.error) {
    fail("center_submissions INSERT (sin RETURNING)", `${h1Sub.error.code} — ${h1Sub.error.message}`);
  } else {
    pass("center_submissions INSERT sin RETURNING — OK");
  }

  const h1Claim = await anon.from("center_claims").insert(claimBase);
  if (h1Claim.error) {
    fail("center_claims INSERT (sin RETURNING)", `${h1Claim.error.code} — ${h1Claim.error.message}`);
  } else {
    pass("center_claims INSERT sin RETURNING — OK");
  }

  // ════════════════════════════════════════════════════════════════════════════
  // H2 — INSERT con RETURNING id (el test anterior que fallaba)
  //      Si H1 pasa pero H2 falla → la política INSERT existe pero no hay
  //      política SELECT, y PostgreSQL no permite RETURNING en ese caso.
  //      Solución: no usar .select() en inserts sin política SELECT, o añadir
  //      una política SELECT restringida (solo la propia fila, using auth.uid()).
  // ════════════════════════════════════════════════════════════════════════════
  section("H2 — INSERT con RETURNING id (aisla si el error era del SELECT)");

  let leadId: string | null = null;
  const h2Lead = await anon.from("leads").insert(leadBase).select("id").single();
  if (h2Lead.error) {
    fail(
      "leads INSERT con RETURNING",
      `${h2Lead.error.code} — ${h2Lead.error.message}`
    );
    info("→ Si H1 pasó pero H2 falla: el INSERT funciona pero RETURNING necesita");
    info("  una política SELECT. Esto es normal y esperado si no hay SELECT policy.");
    info("  El código de producción (forms.ts) no usa .select() — no es un problema real.");
  } else {
    leadId = h2Lead.data?.id ?? null;
    pass(`leads INSERT con RETURNING — OK (id: ${leadId})`);
  }

  let submissionId: string | null = null;
  const h2Sub = await anon
    .from("center_submissions")
    .insert(subBase)
    .select("id")
    .single();
  if (h2Sub.error) {
    fail("center_submissions INSERT con RETURNING", `${h2Sub.error.code} — ${h2Sub.error.message}`);
  } else {
    submissionId = h2Sub.data?.id ?? null;
    pass(`center_submissions INSERT con RETURNING — OK (id: ${submissionId})`);
  }

  let claimId: string | null = null;
  const h2Claim = await anon.from("center_claims").insert(claimBase).select("id").single();
  if (h2Claim.error) {
    fail("center_claims INSERT con RETURNING", `${h2Claim.error.code} — ${h2Claim.error.message}`);
  } else {
    claimId = h2Claim.data?.id ?? null;
    pass(`center_claims INSERT con RETURNING — OK (id: ${claimId})`);
  }

  // ════════════════════════════════════════════════════════════════════════════
  // H3 — SELECT con anon key (debe devolver 0 filas, no error)
  // ════════════════════════════════════════════════════════════════════════════
  section("H3 — SELECT con anon key (debe retornar vacío, no error)");

  const r1 = await anon.from("leads").select("id").limit(1);
  if (r1.error) {
    pass(`leads: bloqueado con error (${r1.error.code}) — RLS activa`);
  } else if (!r1.data?.length) {
    pass("leads: SELECT devuelve 0 filas — RLS filtra correctamente");
  } else {
    fail("leads: SELECT devuelve filas públicamente — revisar política RLS");
  }

  const r2 = await anon.from("center_submissions").select("id").limit(1);
  if (r2.error) {
    pass(`center_submissions: bloqueado con error (${r2.error.code}) — RLS activa`);
  } else if (!r2.data?.length) {
    pass("center_submissions: SELECT devuelve 0 filas — RLS filtra correctamente");
  } else {
    fail("center_submissions: SELECT devuelve filas públicamente — revisar política RLS");
  }

  const r3 = await anon.from("center_claims").select("id").limit(1);
  if (r3.error) {
    pass(`center_claims: bloqueado con error (${r3.error.code}) — RLS activa`);
  } else if (!r3.data?.length) {
    pass("center_claims: SELECT devuelve 0 filas — RLS filtra correctamente");
  } else {
    fail("center_claims: lectura pública — revisar política RLS");
  }

  // ════════════════════════════════════════════════════════════════════════════
  // H4 — Verificación + limpieza con service role
  // ════════════════════════════════════════════════════════════════════════════
  if (svc) {
    section("H4 — Verificación + limpieza con service role");

    // Leer lo que insertamos (por email y timestamp para cubrir H1 + H2)
    const { data: leadsInserted } = await svc
      .from("leads")
      .select("id, email, created_at")
      .eq("email", "test+supabase@buscacentro.local")
      .order("created_at", { ascending: false })
      .limit(5);

    if (leadsInserted?.length) {
      pass(`leads: ${leadsInserted.length} fila(s) de prueba encontradas en BD`);
    } else {
      fail("leads: ninguna fila de prueba encontrada — los inserts no llegaron a la BD");
    }

    const { data: subsInserted } = await svc
      .from("center_submissions")
      .select("id, email, created_at")
      .eq("email", "test+supabase@buscacentro.local")
      .order("created_at", { ascending: false })
      .limit(5);

    if (subsInserted?.length) {
      pass(`center_submissions: ${subsInserted.length} fila(s) de prueba encontradas en BD`);
    } else {
      fail("center_submissions: ninguna fila de prueba encontrada");
    }

    const { data: claimsInserted } = await svc
      .from("center_claims")
      .select("id, corporate_email, created_at")
      .eq("corporate_email", "test+supabase@buscacentro.local")
      .order("created_at", { ascending: false })
      .limit(5);

    if (claimsInserted?.length) {
      pass(`center_claims: ${claimsInserted.length} fila(s) de prueba encontradas en BD`);
    } else {
      fail("center_claims: ninguna fila de prueba encontrada");
    }

    // Limpiar todas las filas de prueba por email
    section("Limpieza de datos de prueba");

    const { error: delLead } = await svc
      .from("leads")
      .delete()
      .eq("email", "test+supabase@buscacentro.local");
    if (delLead) fail("borrar leads de prueba", delLead.message);
    else pass("leads de prueba eliminados");

    const { error: delSub } = await svc
      .from("center_submissions")
      .delete()
      .eq("email", "test+supabase@buscacentro.local");
    if (delSub) fail("borrar center_submissions de prueba", delSub.message);
    else pass("center_submissions de prueba eliminados");

    const { error: delClaim } = await svc
      .from("center_claims")
      .delete()
      .eq("corporate_email", "test+supabase@buscacentro.local");
    if (delClaim) fail("borrar center_claims de prueba", delClaim.message);
    else pass("center_claims de prueba eliminados");

    pass("datos de prueba limpiados correctamente");
  } else {
    section("H4 — Service role no disponible");
    info("Para verificar y limpiar automáticamente, añade SUPABASE_SERVICE_ROLE_KEY a .env.local");
    info("Mientras tanto, elimina los datos de prueba en el Dashboard:");
    info('  leads → email = "test+supabase@buscacentro.local"');
    info('  center_submissions → email = "test+supabase@buscacentro.local"');
    info('  center_claims → corporate_email = "test+supabase@buscacentro.local"');
  }

  section("Fin del test");
  console.log("");
}

main().catch((err: unknown) => {
  console.error("✗ Error inesperado:");
  console.error(err);
  process.exit(1);
});
