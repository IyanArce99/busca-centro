/**
 * Import centers from a CSV file into Supabase.
 *
 * Run:
 *   npm run import:centers -- --file data/import/madrid-centers.csv --dry-run
 *   npm run import:centers -- --file data/import/madrid-centers.csv --city madrid
 *   npm run import:centers -- --file data/import/madrid-centers.csv --neighborhood Chamberí
 *
 * Behavior:
 *   - Parses CSV (RFC 4180 inline parser — no extra dependency)
 *   - Auto-generates slug from name if empty
 *   - Validates required fields and enum values
 *   - Checks indexability (name + city + type + neighborhood + ≥1 service + description ≥60 chars)
 *   - Dry-run: prints table preview, never writes to DB
 *   - Real mode: upserts by slug (service role preferred, anon fallback)
 *   - Ensures the city row exists in cities before inserting centers
 */

import { readFileSync } from "fs";
import { resolve } from "path";
import { createClient, type SupabaseClient } from "@supabase/supabase-js";
import type { Database } from "../src/types/database";

// ─── Env loading ──────────────────────────────────────────────────────────────

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
  } catch { /* .env.local is optional */ }
}

// ─── RFC 4180 CSV parser ──────────────────────────────────────────────────────

function parseCsv(raw: string): Record<string, string>[] {
  const lines = raw.replace(/\r\n/g, "\n").replace(/\r/g, "\n").split("\n");
  const headers = parseCsvRow(lines[0] ?? "");
  const results: Record<string, string>[] = [];

  for (let i = 1; i < lines.length; i++) {
    const line = lines[i];
    if (!line?.trim()) continue;
    const values = parseCsvRow(line);
    const row: Record<string, string> = {};
    for (let j = 0; j < headers.length; j++) {
      row[headers[j] ?? ""] = values[j] ?? "";
    }
    results.push(row);
  }

  return results;
}

function parseCsvRow(line: string): string[] {
  const result: string[] = [];
  let field = "";
  let inQuotes = false;

  for (let i = 0; i < line.length; i++) {
    const ch = line[i];

    if (inQuotes) {
      if (ch === '"') {
        if (line[i + 1] === '"') {
          field += '"';
          i++;
        } else {
          inQuotes = false;
        }
      } else {
        field += ch;
      }
    } else {
      if (ch === '"') {
        inQuotes = true;
      } else if (ch === ",") {
        result.push(field);
        field = "";
      } else {
        field += ch;
      }
    }
  }

  result.push(field);
  return result;
}

// ─── Slug generation ──────────────────────────────────────────────────────────

function toSlug(name: string, citySuffix: string): string {
  return (
    name
      .normalize("NFD")
      .replace(/[̀-ͯ]/g, "")
      .toLowerCase()
      .replace(/[^a-z0-9\s-]/g, "")
      .trim()
      .replace(/\s+/g, "-")
      .replace(/-+/g, "-") +
    "-" +
    citySuffix
  );
}

// ─── Types ────────────────────────────────────────────────────────────────────

const VALID_TYPES = ["guarderia", "escuela-infantil"] as const;
const VALID_OWNERSHIPS = ["publico", "privado", "concertado"] as const;
const VALID_SERVICES = [
  "comedor",
  "horario-ampliado",
  "bilingue",
  "aula-0-1-anos",
  "aula-1-2-anos",
  "aula-2-3-anos",
  "patio-exterior",
  "psicomotricidad",
  "orientacion-pedagogica",
  "servicio-madrugadores",
] as const;

type ValidType = (typeof VALID_TYPES)[number];
type ValidOwnership = (typeof VALID_OWNERSHIPS)[number];

interface ParsedRow {
  rawIndex: number;
  slug: string;
  name: string;
  type: ValidType;
  ownership: ValidOwnership;
  street: string | null;
  postal_code: string | null;
  neighborhood: string | null;
  city_slug: string;
  city_name: string;
  phone: string | null;
  email: string | null;
  website: string | null;
  age_min_months: number;
  age_max_months: number;
  schedule: string | null;
  services: string[];
  short_description: string;
  source_url: string;
  notes: string | null;
  isIndexable: boolean;
}

interface ValidationError {
  rowIndex: number;
  field: string;
  message: string;
}

// ─── CLI arg parsing ──────────────────────────────────────────────────────────

function parseArgs(argv: string[]): {
  file: string | null;
  city: string | null;
  neighborhood: string | null;
  type: string | null;
  dryRun: boolean;
} {
  const args = argv.slice(2);
  let file: string | null = null;
  let city: string | null = null;
  let neighborhood: string | null = null;
  let type: string | null = null;
  let dryRun = false;

  for (let i = 0; i < args.length; i++) {
    const arg = args[i];
    if (arg === "--dry-run" || arg === "--dryrun") {
      dryRun = true;
    } else if (arg === "--file" && args[i + 1]) {
      file = args[++i] ?? null;
    } else if (arg === "--city" && args[i + 1]) {
      city = args[++i] ?? null;
    } else if (arg === "--neighborhood" && args[i + 1]) {
      neighborhood = args[++i] ?? null;
    } else if (arg === "--type" && args[i + 1]) {
      type = args[++i] ?? null;
    }
  }

  return { file, city, neighborhood, type, dryRun };
}

// ─── Validation ───────────────────────────────────────────────────────────────

function validateAndNormalize(
  rows: Record<string, string>[],
  filters: { city: string | null; neighborhood: string | null; type: string | null }
): { valid: ParsedRow[]; errors: ValidationError[] } {
  const valid: ParsedRow[] = [];
  const errors: ValidationError[] = [];

  for (let i = 0; i < rows.length; i++) {
    const row = rows[i];
    if (!row) continue;
    const rowErrors: ValidationError[] = [];

    const name = row["name"]?.trim() ?? "";
    const rawType = row["type"]?.trim() ?? "";
    const rawOwnership = row["ownership"]?.trim() ?? "";
    const neighborhood = row["neighborhood"]?.trim() || null;
    const city_slug = row["city_slug"]?.trim() ?? "";
    const city_name = row["city_name"]?.trim() ?? "";
    const source_url = row["source_url"]?.trim() ?? "";
    const short_description = row["short_description"]?.trim() ?? "";
    const rawServices = row["services"]?.trim() ?? "";

    if (!name) {
      rowErrors.push({ rowIndex: i + 2, field: "name", message: "Campo obligatorio" });
    }

    if (!VALID_TYPES.includes(rawType as ValidType)) {
      rowErrors.push({
        rowIndex: i + 2,
        field: "type",
        message: `Valor inválido "${rawType}". Usar: ${VALID_TYPES.join(" | ")}`,
      });
    }

    if (!VALID_OWNERSHIPS.includes(rawOwnership as ValidOwnership)) {
      rowErrors.push({
        rowIndex: i + 2,
        field: "ownership",
        message: `Valor inválido "${rawOwnership}". Usar: ${VALID_OWNERSHIPS.join(" | ")}`,
      });
    }

    if (!city_slug) {
      rowErrors.push({ rowIndex: i + 2, field: "city_slug", message: "Campo obligatorio" });
    }

    if (!city_name) {
      rowErrors.push({ rowIndex: i + 2, field: "city_name", message: "Campo obligatorio" });
    }

    if (!source_url) {
      rowErrors.push({ rowIndex: i + 2, field: "source_url", message: "Campo obligatorio" });
    }

    // Parse services
    const services: string[] = rawServices
      ? rawServices
          .split("|")
          .map((s) => s.trim())
          .filter((s) => s.length > 0)
      : [];

    const invalidServices = services.filter(
      (s) => !VALID_SERVICES.includes(s as (typeof VALID_SERVICES)[number])
    );
    if (invalidServices.length > 0) {
      rowErrors.push({
        rowIndex: i + 2,
        field: "services",
        message: `Servicios inválidos: ${invalidServices.join(", ")}`,
      });
    }

    if (rowErrors.length > 0) {
      errors.push(...rowErrors);
      continue;
    }

    // Apply filters
    if (filters.city && city_slug !== filters.city) continue;
    if (filters.neighborhood && neighborhood !== filters.neighborhood) continue;
    if (filters.type && rawType !== filters.type) continue;

    // Generate slug
    const rawSlug = row["slug"]?.trim() ?? "";
    const slug = rawSlug || toSlug(name, city_slug);

    // Parse optional numeric fields
    const age_min_months = parseInt(row["age_min_months"] ?? "4", 10) || 4;
    const age_max_months = parseInt(row["age_max_months"] ?? "36", 10) || 36;

    // Indexability check
    const isIndexable =
      name.length > 0 &&
      VALID_TYPES.includes(rawType as ValidType) &&
      VALID_OWNERSHIPS.includes(rawOwnership as ValidOwnership) &&
      neighborhood !== null &&
      neighborhood.length > 0 &&
      city_slug.length > 0 &&
      services.length > 0 &&
      short_description.length >= 60;

    valid.push({
      rawIndex: i + 2,
      slug,
      name,
      type: rawType as ValidType,
      ownership: rawOwnership as ValidOwnership,
      street: row["street"]?.trim() || null,
      postal_code: row["postal_code"]?.trim() || null,
      neighborhood,
      city_slug,
      city_name,
      phone: row["phone"]?.trim() || null,
      email: row["email"]?.trim() || null,
      website: row["website"]?.trim() || null,
      age_min_months,
      age_max_months,
      schedule: row["schedule"]?.trim() || null,
      services,
      short_description,
      source_url,
      notes: row["notes"]?.trim() || null,
      isIndexable,
    });
  }

  return { valid, errors };
}

// ─── City upsert ──────────────────────────────────────────────────────────────

async function ensureCityExists(
  supabase: SupabaseClient<Database>,
  citySlug: string,
  cityName: string
) {
  const { data, error } = await supabase
    .from("cities")
    .select("id")
    .eq("slug", citySlug)
    .single();

  if (error?.code === "PGRST116") {
    // Row not found — insert
    const { error: insertError } = await supabase.from("cities").insert({
      slug: citySlug,
      name: cityName,
      province: cityName,
      region: "Comunidad de Madrid",
    });
    if (insertError) {
      throw new Error(`No se pudo insertar la ciudad "${citySlug}": ${insertError.message}`);
    }
    console.log(`  ✓ Ciudad "${cityName}" creada en tabla cities`);
    return;
  }

  if (error) {
    throw new Error(`Error al verificar ciudad "${citySlug}": ${error.message}`);
  }

  if (data) {
    console.log(`  ✓ Ciudad "${cityName}" ya existe en tabla cities`);
  }
}

// ─── Main ─────────────────────────────────────────────────────────────────────

async function main() {
  loadEnvLocal();

  const { file, city, neighborhood, type, dryRun } = parseArgs(process.argv);

  if (!file) {
    console.error("✗ Uso: npm run import:centers -- --file <ruta.csv> [--dry-run] [--city <slug>] [--neighborhood <nombre>] [--type <tipo>]");
    process.exit(1);
  }

  console.log(`\n📂 Archivo: ${file}`);
  if (dryRun) console.log("🔍 Modo: DRY-RUN (no se escribirá nada en la base de datos)");
  if (city) console.log(`🏙  Filtro ciudad: ${city}`);
  if (neighborhood) console.log(`📍 Filtro barrio: ${neighborhood}`);
  if (type) console.log(`📋 Filtro tipo: ${type}`);

  // Read CSV
  let rawCsv: string;
  try {
    rawCsv = readFileSync(resolve(process.cwd(), file), "utf-8");
  } catch (e) {
    console.error(`✗ No se puede leer el archivo: ${file}`);
    console.error(e instanceof Error ? e.message : String(e));
    process.exit(1);
  }

  const rawRows = parseCsv(rawCsv);
  console.log(`\n📊 Filas en CSV (excl. cabecera): ${rawRows.length}`);

  // Validate
  const { valid, errors } = validateAndNormalize(rawRows, { city, neighborhood, type });

  if (errors.length > 0) {
    console.log(`\n⚠️  Errores de validación (${errors.length}):`);
    for (const err of errors) {
      console.log(`  Fila ${err.rowIndex} [${err.field}]: ${err.message}`);
    }
  }

  if (valid.length === 0) {
    console.log("\n✗ No hay filas válidas que importar. Revisa los errores anteriores.");
    process.exit(errors.length > 0 ? 1 : 0);
  }

  const indexable = valid.filter((r) => r.isIndexable);
  const draft = valid.filter((r) => !r.isIndexable);

  console.log(`\n✅ Filas válidas: ${valid.length}`);
  console.log(`   ✓ Indexables (→ status=published): ${indexable.length}`);
  console.log(`   ○ No indexables (→ status=draft):  ${draft.length}`);

  // Dry-run preview
  if (dryRun) {
    console.log("\n── PREVIEW ──────────────────────────────────────────────────────────────");
    console.log(
      ["Fila", "Slug", "Tipo", "Barrio", "Indexable"].map((h) => h.padEnd(20)).join("")
    );
    console.log("─".repeat(100));
    for (const row of valid) {
      console.log(
        [
          String(row.rawIndex).padEnd(20),
          row.slug.slice(0, 38).padEnd(40),
          row.type.padEnd(20),
          (row.neighborhood ?? "—").padEnd(20),
          row.isIndexable ? "✓" : "○",
        ].join("")
      );
    }
    console.log("\n🔍 Dry-run completado. No se ha escrito nada.");
    return;
  }

  // Real import
  const SUPABASE_URL = process.env.NEXT_PUBLIC_SUPABASE_URL;
  const SERVICE_KEY = process.env.SUPABASE_SERVICE_ROLE_KEY;
  const ANON_KEY = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;
  const key = SERVICE_KEY ?? ANON_KEY;

  if (!SUPABASE_URL || !key) {
    console.error("✗ Faltan variables: NEXT_PUBLIC_SUPABASE_URL y NEXT_PUBLIC_SUPABASE_ANON_KEY");
    process.exit(1);
  }

  if (!SERVICE_KEY) {
    console.warn("⚠️  Sin SUPABASE_SERVICE_ROLE_KEY — usando anon key. Solo funcionará si hay políticas INSERT para anon.");
  }

  const supabase = createClient<Database>(SUPABASE_URL, key, {
    auth: { persistSession: false },
  });

  // Ensure city exists (only if filter is active and we have a clear city)
  const citySlugsNeeded = [...new Set(valid.map((r) => r.city_slug))];
  console.log(`\n── Verificando ciudades ─────────────────────────────────────────────────`);
  for (const slug of citySlugsNeeded) {
    const cityName = valid.find((r) => r.city_slug === slug)?.city_name ?? slug;
    await ensureCityExists(supabase, slug, cityName);
  }

  // Upsert centers
  console.log(`\n── Importando centros ───────────────────────────────────────────────────`);

  let inserted = 0;
  let updated = 0;
  let failed = 0;

  for (const row of valid) {
    const record: Database["public"]["Tables"]["centers"]["Insert"] = {
      slug: row.slug,
      name: row.name,
      type: row.type,
      ownership: row.ownership,
      street: row.street,
      postal_code: row.postal_code,
      city_slug: row.city_slug,
      city_name: row.city_name,
      neighborhood: row.neighborhood,
      phone: row.phone,
      email: row.email,
      website: row.website,
      age_min_months: row.age_min_months,
      age_max_months: row.age_max_months,
      schedule: row.schedule,
      services: row.services,
      short_description: row.short_description,
      is_claimed: false,
      is_verified: false,
      status: "draft",
    };

    const { error } = await supabase
      .from("centers")
      .upsert(record, { onConflict: "slug", ignoreDuplicates: false });

    if (error) {
      console.error(`  ✗ [fila ${row.rawIndex}] ${row.name}: ${error.code} — ${error.message}`);
      failed++;
    } else {
      const isNew = !error;
      console.log(`  ✓ [fila ${row.rawIndex}] ${row.name} (${row.slug})`);
      if (isNew) inserted++;
      else updated++;
    }
  }

  console.log(`\n── Resultado ────────────────────────────────────────────────────────────`);
  console.log(`  Total procesados: ${valid.length}`);
  console.log(`  Insertados/actualizados: ${inserted + updated}`);
  console.log(`  Errores: ${failed}`);
  console.log(`\n⚠️  Todos los centros importados tienen status=draft.`);
  console.log(`   Revisa manualmente en Supabase Dashboard antes de publicar.`);
}

main().catch((err: unknown) => {
  console.error("✗ Error inesperado:");
  console.error(err);
  process.exit(1);
});
