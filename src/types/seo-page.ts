import type { CenterOwnership, CenterService, CenterType } from "./center";
import type { FAQItem } from "./faq";

/**
 * A local SEO landing page is defined by a combination of filters
 * (type + city + optional service/ownership) rather than by storing a
 * static center list, so the matching centers are always derived live
 * from `mock-centers.ts` (and later from the real database).
 */
export interface SeoPageFilters {
  citySlug: string;
  centerType: CenterType;
  service?: CenterService;
  ownership?: CenterOwnership;
}

export interface SeoPage {
  id: string;
  slug: string;
  title: string;
  h1: string;
  subtitle: string;
  metaDescription: string;
  filters: SeoPageFilters;
  introText: string;
  outroText: string;
  faqs: FAQItem[];
}
