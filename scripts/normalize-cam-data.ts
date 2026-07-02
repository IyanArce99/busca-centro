/**
 * Normalizes official Madrid education datasets to BuscaCentro CSV format.
 *
 * Sources:
 *   - data/sources/raw/cam-centros-educativos.csv  (Comunidad de Madrid, UTF-8, semicolon)
 *   - data/sources/raw/ayto-escuelas-infantiles.csv (Ayuntamiento Madrid, ISO-8859-1, semicolon)
 *
 * Output: data/import/madrid-centers.csv
 *
 * Run: npm run normalize:cam
 */

import { readFileSync, writeFileSync } from "fs";
import { resolve } from "path";

// ─── Target config ────────────────────────────────────────────────────────────

const TARGET_DISTRICTS = new Set([
  "Chamartín",
  "Chamberí",
  "Salamanca",
  "Retiro",
  "Moncloa-Aravaca",
  "Hortaleza",
  "Arganzuela",
]);

// Types to include (first-cycle 0-3 year centers only)
const INFANTIL_TYPES = new Set(["EEI", "EIPR", "CPR INF", "EEI-CN", "CPR INF-PRI"]);

// ─── CSV helpers ──────────────────────────────────────────────────────────────

function parseSemicolonCsv(text: string): Record<string, string>[] {
  const lines = text.replace(/\r\n/g, "\n").replace(/\r/g, "\n").split("\n");
  const headers = (lines[0] ?? "").split(";").map((h) => h.trim().replace(/^"|"$/g, ""));
  const rows: Record<string, string>[] = [];
  for (let i = 1; i < lines.length; i++) {
    const line = lines[i];
    if (!line?.trim()) continue;
    const values = splitSemicolonRow(line);
    const row: Record<string, string> = {};
    for (let j = 0; j < headers.length; j++) {
      row[headers[j] ?? ""] = (values[j] ?? "").trim().replace(/^"|"$/g, "");
    }
    rows.push(row);
  }
  return rows;
}

function splitSemicolonRow(line: string): string[] {
  const result: string[] = [];
  let field = "";
  let inQuotes = false;
  for (let i = 0; i < line.length; i++) {
    const ch = line[i];
    if (inQuotes) {
      if (ch === '"' && line[i + 1] === '"') { field += '"'; i++; }
      else if (ch === '"') { inQuotes = false; }
      else { field += ch; }
    } else {
      if (ch === '"') { inQuotes = true; }
      else if (ch === ";") { result.push(field); field = ""; }
      else { field += ch; }
    }
  }
  result.push(field);
  return result;
}

// ─── Slug generation ──────────────────────────────────────────────────────────

function toSlug(name: string): string {
  return name
    .normalize("NFD")
    .replace(/[̀-ͯ]/g, "")
    .toLowerCase()
    .replace(/[^a-z0-9\s-]/g, "")
    .trim()
    .replace(/\s+/g, "-")
    .replace(/-+/g, "-") + "-madrid";
}

// ─── Type / ownership mapping ─────────────────────────────────────────────────

function mapType(tipoAbrv: string): "guarderia" | "escuela-infantil" {
  if (tipoAbrv === "CPR INF") return "guarderia";
  return "escuela-infantil"; // EEI, EIPR, EEI-CN, CPR INF-PRI y equivalentes
}

function mapOwnership(titularidad: string): "publico" | "privado" | "concertado" {
  const t = titularidad.toUpperCase();
  if (t.includes("CONCERTADO")) return "concertado";
  if (t.startsWith("PÚB") || t.startsWith("PUB")) return "publico";
  return "privado";
}

// ─── Description generation ───────────────────────────────────────────────────

function generateDescription(
  type: "guarderia" | "escuela-infantil",
  ownership: "publico" | "privado" | "concertado",
  district: string
): string {
  const ownershipLabel =
    ownership === "publico" ? "pública" :
    ownership === "concertado" ? "concertada" : "privada";

  if (type === "escuela-infantil") {
    return `Escuela infantil ${ownershipLabel} en el distrito de ${district}, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.`;
  }
  return `Guardería ${ownershipLabel} en el distrito de ${district}, Madrid. Centro de educación infantil de primer ciclo (0-3 años).`;
}

// ─── Services from Ayuntamiento EQUIPAMIENTO field ────────────────────────────

interface AytoEnrichment {
  services: string[];
  sourceUrl: string;
}

function parseAytoServices(equipamiento: string): string[] {
  const services: string[] = ["aula-0-1-anos", "aula-1-2-anos", "aula-2-3-anos"];
  const eq = equipamiento.toLowerCase();
  if (eq.includes("comedor")) services.push("comedor");
  if (eq.includes("horario ampliado")) services.push("horario-ampliado");
  return services;
}

function buildAytoIndex(
  aytoRows: Record<string, string>[]
): Map<string, AytoEnrichment> {
  // Index by normalized name (lowercase, no accents) for cross-referencing
  const index = new Map<string, AytoEnrichment>();
  for (const row of aytoRows) {
    const nombre = row["NOMBRE"] ?? "";
    // Strip "Escuela infantil municipal " prefix
    const cleanName = nombre
      .replace(/^[Ee]scuela\s+infantil\s+municipal\s+/i, "")
      .trim()
      .normalize("NFD")
      .replace(/[̀-ͯ]/g, "")
      .toLowerCase();

    const contentUrl = row["CONTENT-URL"] ?? "";
    const sourceUrl = contentUrl.startsWith("http")
      ? contentUrl
      : contentUrl
        ? `https://www.madrid.es${contentUrl}`
        : "https://datos.madrid.es/portal/site/egob/menuitem.c05c1f754a33a9fbe4b2e4b284f1a5a0/?vgnextoid=758352c974fb3410VgnVCM2000000c205a0aRCRD";

    index.set(cleanName, {
      services: parseAytoServices(row["EQUIPAMIENTO"] ?? ""),
      sourceUrl,
    });
  }
  return index;
}

// ─── CSV output helper ────────────────────────────────────────────────────────

function csvField(value: string): string {
  if (value.includes(",") || value.includes('"') || value.includes("\n")) {
    return `"${value.replace(/"/g, '""')}"`;
  }
  return value;
}

function csvRow(values: string[]): string {
  return values.map(csvField).join(",");
}

// ─── Main ─────────────────────────────────────────────────────────────────────

function main() {
  const BASE = resolve(process.cwd());

  // Load CAM data (UTF-8)
  const camRaw = readFileSync(resolve(BASE, "data/sources/raw/cam-centros-educativos.csv"), "utf-8");
  const camRows = parseSemicolonCsv(camRaw);
  console.log(`CAM: ${camRows.length} centros cargados`);

  // Load Ayuntamiento EI data (ISO-8859-1 → latin1 in Node)
  const aytoBuffer = readFileSync(resolve(BASE, "data/sources/raw/ayto-escuelas-infantiles.csv"));
  const aytoRaw = aytoBuffer.toString("latin1");
  const aytoRows = parseSemicolonCsv(aytoRaw);
  const aytoIndex = buildAytoIndex(aytoRows);
  console.log(`Ayto EI: ${aytoRows.length} escuelas infantiles municipales cargadas`);

  // Filter CAM
  const filtered = camRows.filter((row) => {
    return (
      row["MUNICIPIO"] === "Madrid" &&
      row["SITUACIÓN"] === "ALTA" &&
      TARGET_DISTRICTS.has(row["DISTRITO"]) &&
      INFANTIL_TYPES.has(row["TIPO_ABRV"])
    );
  });
  console.log(`\nFiltrados: ${filtered.length} centros infantiles en 7 distritos objetivo`);

  // Detect duplicates by slug before generating output
  const slugsSeen = new Set<string>();
  const output: string[] = [];

  const HEADER = "name,slug,type,ownership,street,postal_code,neighborhood,city_slug,city_name,phone,email,website,age_min_months,age_max_months,schedule,services,short_description,source_url,notes";
  output.push(HEADER);

  const stats: Record<string, { total: number; indexable: number }> = {};
  for (const d of TARGET_DISTRICTS) {
    stats[d] = { total: 0, indexable: 0 };
  }
  const typeCount: Record<string, number> = {};
  const ownershipCount: Record<string, number> = {};

  let duplicates = 0;

  for (const row of filtered) {
    const name = row["CENTRO"]?.trim() ?? "";
    const tipoAbrv = row["TIPO_ABRV"] ?? "";
    const titularidad = row["TITULARIDAD"] ?? "";
    const district = row["DISTRITO"] ?? "";
    const street = [row["DOMICILIO"], row["NMVIAL"]].filter(Boolean).join(", ").trim();
    const postalCode = (row["CDPOSTAL"] ?? "").replace(/^0+/, "").padStart(5, "0");
    const phone = row["TELEFONO"]?.trim() ?? "";
    const email = row["E_MAIL"]?.trim() ?? "";
    const website = row["WEB"]?.trim() ?? "";

    const type = mapType(tipoAbrv);
    const ownership = mapOwnership(titularidad);
    const slug = toSlug(name);

    if (slugsSeen.has(slug)) {
      duplicates++;
      continue;
    }
    slugsSeen.add(slug);

    // Try to enrich from Ayuntamiento index (for public EEI schools)
    const cleanedName = name
      .normalize("NFD")
      .replace(/[̀-ͯ]/g, "")
      .toLowerCase();
    const aytoEnrich = aytoIndex.get(cleanedName);

    const services = aytoEnrich?.services ?? [
      "aula-0-1-anos",
      "aula-1-2-anos",
      "aula-2-3-anos",
    ];
    const sourceUrl =
      aytoEnrich?.sourceUrl ??
      "https://datos.comunidad.madrid/catalogo/dataset/centros_educativos";

    const shortDesc = generateDescription(type, ownership, district);

    const isIndexable =
      name.length > 0 &&
      district.length > 0 &&
      services.length >= 1 &&
      shortDesc.length >= 60;

    if (stats[district]) {
      stats[district].total++;
      if (isIndexable) stats[district].indexable++;
    }
    typeCount[type] = (typeCount[type] ?? 0) + 1;
    ownershipCount[ownership] = (ownershipCount[ownership] ?? 0) + 1;

    output.push(csvRow([
      name,
      slug,
      type,
      ownership,
      street,
      postalCode,
      district,
      "madrid",
      "Madrid",
      phone,
      email,
      website,
      "4",
      "36",
      "",
      services.join("|"),
      shortDesc,
      sourceUrl,
      `Datos CAM ${new Date().getFullYear()}. Verificación pendiente.`,
    ]));
  }

  // Write output
  const outPath = resolve(BASE, "data/import/madrid-centers.csv");
  writeFileSync(outPath, output.join("\n"), "utf-8");
  console.log(`\n✓ CSV generado: ${outPath}`);
  console.log(`  ${output.length - 1} centros (${duplicates} slugs duplicados ignorados)`);

  // Stats
  console.log("\n── Por distrito ───────────────────────────────────────────");
  for (const d of TARGET_DISTRICTS) {
    const s = stats[d];
    console.log(`  ${d}: ${s?.total ?? 0} total, ${s?.indexable ?? 0} indexables`);
  }

  console.log("\n── Por tipo ────────────────────────────────────────────────");
  for (const [t, c] of Object.entries(typeCount).sort()) {
    console.log(`  ${t}: ${c}`);
  }

  console.log("\n── Por titularidad ─────────────────────────────────────────");
  for (const [o, c] of Object.entries(ownershipCount).sort()) {
    console.log(`  ${o}: ${c}`);
  }

  const totalIndexable = Object.values(stats).reduce((a, s) => a + s.indexable, 0);
  console.log(`\n✓ Total indexables: ${totalIndexable}`);
}

main();
