import { mockSeoPages } from "@/data/mock-seo-pages";
import type { Center } from "@/types/center";
import type { SeoPage } from "@/types/seo-page";
import { getCentersByFilters } from "./centers";
import { isCityIndexable } from "./cities";
import { MIN_CENTERS_FOR_TYPE_PAGE } from "./constants";

export function getAllSeoPages(): SeoPage[] {
  return mockSeoPages;
}

export function getSeoPageBySlug(slug: string): SeoPage | undefined {
  return mockSeoPages.find((page) => page.slug === slug);
}

export function getCentersForSeoPage(seoPage: SeoPage): Center[] {
  return getCentersByFilters(seoPage.filters);
}

/**
 * Pure city + type pages ("/guarderias-en-madrid") follow the "city page"
 * rule: the city itself needs at least 10 centers in the directory,
 * regardless of type, since they represent that city's hub.
 * Pages narrowed further by a service or ownership filter
 * ("/guarderias-bilingues-en-madrid") follow the lighter
 * "neighborhood/type page" rule: at least 5 centers matching that filter.
 */
export function isSeoPageIndexable(seoPage: SeoPage): boolean {
  if (seoPage.disabled) return false;
  const isNarrowedFilter = Boolean(seoPage.filters.service || seoPage.filters.ownership);
  if (isNarrowedFilter) {
    return getCentersForSeoPage(seoPage).length >= MIN_CENTERS_FOR_TYPE_PAGE;
  }
  return isCityIndexable(seoPage.filters.citySlug);
}
