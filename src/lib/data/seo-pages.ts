import type { SeoPage, SeoPageFilters } from "@/types/seo-page";
import type { Center, CenterOwnership, CenterService, CenterType } from "@/types/center";
import type { FAQItem } from "@/types/faq";
import { getServerClient } from "@/lib/supabase/server";
import {
  getAllSeoPages as getMockSeoPages,
  getSeoPageBySlug as getMockSeoPageBySlug,
} from "@/lib/seo-pages";
import { MIN_CENTERS_FOR_CITY_PAGE, MIN_CENTERS_FOR_TYPE_PAGE } from "@/lib/constants";
import type { Database } from "@/types/database";

type SeoPageRow = Database["public"]["Tables"]["seo_pages"]["Row"];

function rowToSeoPage(row: SeoPageRow): SeoPage {
  const faqs = Array.isArray(row.faqs) ? (row.faqs as unknown as FAQItem[]) : [];

  const filters: SeoPageFilters = {
    citySlug: row.city_slug,
    centerType: row.center_type as CenterType,
    service: row.service === null ? undefined : (row.service as CenterService),
    ownership: row.ownership === null ? undefined : (row.ownership as CenterOwnership),
  };

  return {
    id: row.id,
    slug: row.slug,
    title: row.title,
    h1: row.h1,
    subtitle: row.subtitle,
    metaDescription: row.meta_description,
    filters,
    introText: row.intro_text,
    outroText: row.outro_text,
    faqs,
  };
}

export async function getSeoPages(): Promise<SeoPage[]> {
  const client = getServerClient();
  if (!client) return getMockSeoPages();

  const { data, error } = await client.from("seo_pages").select("*").eq("status", "published");
  if (error || !data?.length) return getMockSeoPages();
  return data.map(rowToSeoPage);
}

export async function getSeoPageBySlug(slug: string): Promise<SeoPage | undefined> {
  const client = getServerClient();
  if (!client) return getMockSeoPageBySlug(slug);

  const { data, error } = await client
    .from("seo_pages")
    .select("*")
    .eq("slug", slug)
    .eq("status", "published")
    .maybeSingle();

  if (error || !data) return getMockSeoPageBySlug(slug);
  return rowToSeoPage(data);
}

/** Re-export the sync mock list for use in generateStaticParams and similar build-time contexts. */
export { getMockSeoPages as getAllSeoPages };

/**
 * Determine whether a SEO landing page is indexable based on real center data
 * (Supabase-published or mock fallback), not compile-time mock counts.
 *
 * Pass the full array of published centers fetched from the data layer so this
 * stays pure and avoids extra Supabase round-trips at call sites.
 *
 * Rules:
 *   - City-level page (no service/ownership filter): city needs ≥10 centers total.
 *   - Narrowed page (service or ownership filter): ≥5 centers matching the full filter.
 */
export function isSeoPageIndexableFromCenters(seoPage: SeoPage, allCenters: Center[]): boolean {
  // A disabled page is never indexable, regardless of center counts.
  if (seoPage.disabled) return false;

  const { citySlug, centerType, service, ownership } = seoPage.filters;
  const isNarrowedFilter = Boolean(service || ownership);

  if (isNarrowedFilter) {
    const count = allCenters.filter((c) => {
      if (c.address.citySlug !== citySlug) return false;
      if (c.type !== centerType) return false;
      if (service && !c.services.includes(service)) return false;
      if (ownership && c.ownership !== ownership) return false;
      return true;
    }).length;
    return count >= MIN_CENTERS_FOR_TYPE_PAGE;
  }

  // City-level page: total published centers for that city, any type.
  const cityCount = allCenters.filter((c) => c.address.citySlug === citySlug).length;
  return cityCount >= MIN_CENTERS_FOR_CITY_PAGE;
}
