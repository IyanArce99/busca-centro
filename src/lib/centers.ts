import { mockCenters } from "@/data/mock-centers";
import type { Center } from "@/types/center";
import type { SeoPageFilters } from "@/types/seo-page";

export function getAllCenters(): Center[] {
  return mockCenters;
}

export function getCenterBySlug(slug: string): Center | undefined {
  return mockCenters.find((center) => center.slug === slug);
}

export function getCentersByCity(citySlug: string): Center[] {
  return mockCenters.filter((center) => center.address.citySlug === citySlug);
}

export function getCentersByFilters(filters: SeoPageFilters): Center[] {
  return mockCenters.filter((center) => {
    if (center.address.citySlug !== filters.citySlug) return false;
    if (center.type !== filters.centerType) return false;
    if (filters.service && !center.services.includes(filters.service)) return false;
    if (filters.ownership && center.ownership !== filters.ownership) return false;
    return true;
  });
}

/**
 * A center detail page is indexable when it has (a) the minimum identity/location
 * data needed to render a useful page and (b) enough real content to avoid a
 * thin, template-like ficha at launch.
 *
 * Quality gate (b): a short description PLUS **confirmed services**.
 *
 * This gate used to also accept a long description as the substantive signal
 * (`services.length > 0 || longDescription`). That proved to be the wrong
 * trade-off: a bulk pass in July 2026 added editorial long descriptions to ~660
 * fichas that had no confirmed services, which flipped them all to indexable at
 * once. Indexed pages jumped 459 → 1,290 in days, and Google responded with a
 * site-wide quality demotion — impressions fell from ~1,700/day to ~10/day while
 * every page stayed indexed. A long description written from the same public
 * registry the ficha already shows adds no information a searcher cannot get
 * elsewhere; confirmed services do.
 *
 * So substance now means services only. Fichas without them stay
 * `noindex, follow`: still online, still crawlable, still passing internal link
 * equity — just held out of the index until real data is confirmed for them.
 * The way to grow the indexed set is to confirm services, not to generate prose.
 */
export function isCenterIndexable(center: Center): boolean {
  const hasCore = Boolean(
    center.name &&
      center.slug &&
      center.type &&
      center.address.cityName &&
      center.address.citySlug &&
      (center.address.district || center.address.neighborhood || center.address.street)
  );
  if (!hasCore) return false;

  const hasDescription = Boolean(center.shortDescription?.trim());
  const hasSubstance = center.services.length > 0;
  return hasDescription && hasSubstance;
}

export function getRelatedCenters(center: Center, limit = 3): Center[] {
  return mockCenters
    .filter((other) => other.id !== center.id && other.address.citySlug === center.address.citySlug && other.type === center.type)
    .slice(0, limit);
}
