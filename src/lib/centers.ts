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
 * Quality gate (b): a short description PLUS at least one substantive signal —
 * confirmed services or an editorial long description. Centers failing this gate
 * (e.g. only name + type + district) stay `noindex, follow`: still crawlable and
 * reachable via internal links, but held back from the index until enriched.
 * Loosen this if you prefer volume over quality once more fichas are completed.
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
  const hasSubstance =
    center.services.length > 0 || Boolean(center.longDescription?.trim());
  return hasDescription && hasSubstance;
}

export function getRelatedCenters(center: Center, limit = 3): Center[] {
  return mockCenters
    .filter((other) => other.id !== center.id && other.address.citySlug === center.address.citySlug && other.type === center.type)
    .slice(0, limit);
}
