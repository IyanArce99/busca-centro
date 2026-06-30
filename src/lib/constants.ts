export const SITE_NAME = "BuscaCentro";
export const SITE_DESCRIPTION =
  "Directorio para comparar guarderías y escuelas infantiles en España por ciudad, zona y servicios.";

function resolveSiteUrl(): string {
  const explicit = process.env.NEXT_PUBLIC_SITE_URL;
  if (explicit) return explicit.replace(/\/$/, "");
  // Vercel sets VERCEL_URL automatically on every deployment (production,
  // preview and staging), so canonical/sitemap/robots still resolve to a
  // real, working URL even before NEXT_PUBLIC_SITE_URL is configured.
  if (process.env.VERCEL_URL) return `https://${process.env.VERCEL_URL}`;
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
