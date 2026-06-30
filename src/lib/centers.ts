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
 * A center detail page is only indexable when it has enough basic data:
 * name, city, type, location/area, services and a description.
 */
export function isCenterIndexable(center: Center): boolean {
  return Boolean(
    center.name &&
      center.address.cityName &&
      center.type &&
      center.address.neighborhood &&
      center.services.length > 0 &&
      center.shortDescription
  );
}

export function getRelatedCenters(center: Center, limit = 3): Center[] {
  return mockCenters
    .filter((other) => other.id !== center.id && other.address.citySlug === center.address.citySlug && other.type === center.type)
    .slice(0, limit);
}
