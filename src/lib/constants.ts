export const SITE_NAME = "BuscaCentro";
export const SITE_DESCRIPTION =
  "Directorio para comparar guarderías y escuelas infantiles en España por ciudad, zona y servicios.";

/**
 * Canonical production domain. Single source of truth for the public URL, must
 * match the primary domain in Vercel (www + https). robots.txt, sitemap.xml,
 * canonicals and JSON-LD all derive from it.
 */
export const CANONICAL_SITE_URL = "https://www.buscacentro.es";

function resolveSiteUrl(): string {
  // 1. Explicit override always wins (set NEXT_PUBLIC_SITE_URL in Vercel prod).
  const explicit = process.env.NEXT_PUBLIC_SITE_URL;
  if (explicit) return explicit.replace(/\/$/, "");

  // 2. On Vercel *production*, never fall back to the *.vercel.app host — that
  //    would publish the wrong domain in robots/sitemap/canonicals. Use the
  //    real canonical domain as a safety net if the env var is ever missing.
  if (process.env.VERCEL_ENV === "production") return CANONICAL_SITE_URL;

  // 3. Preview / staging Vercel deploys: use the auto-assigned URL so links
  //    resolve to that specific deployment (these stay noindex anyway).
  if (process.env.VERCEL_URL) return `https://${process.env.VERCEL_URL}`;

  // 4. Local dev.
  return "http://localhost:3000";
}

export const SITE_URL = resolveSiteUrl();

/**
 * Master indexing switch, read once at build time. Defaults to `false`
 * (safe) whenever the variable is missing or not exactly "true" — local
 * dev, Vercel preview builds, or a staging deploy where it was simply
 * forgotten all stay noindex until someone explicitly opts in. Flip to
 * "true" only on the final production domain.
 */
export const IS_INDEXABLE = process.env.NEXT_PUBLIC_INDEXABLE === "true";

export const MIN_CENTERS_FOR_CITY_PAGE = 10;
export const MIN_CENTERS_FOR_TYPE_PAGE = 5;
