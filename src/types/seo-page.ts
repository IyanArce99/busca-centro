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

/** An editorial content block rendered as an H2 heading plus one or more paragraphs. */
export interface SeoContentSection {
  heading: string;
  paragraphs: string[];
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
  /**
   * Optional long-form explanatory blocks (H2 + paragraphs) shown between the
   * intro and the center listing. Used to give priority landings enough unique,
   * useful content to rank without keyword stuffing. Only present on the mock
   * source; the Supabase row mapper leaves this undefined.
   */
  sections?: SeoContentSection[];
  /** When true the page is excluded from sitemap, generateStaticParams, and
   *  any internal SEO links. Accessing it directly returns noindex. */
  disabled?: boolean;
}
