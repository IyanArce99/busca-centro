import type { SeoPage, SeoPageFilters } from "@/types/seo-page";
import type { CenterOwnership, CenterService, CenterType } from "@/types/center";
import type { FAQItem } from "@/types/faq";
import { getServerClient } from "@/lib/supabase/server";
import {
  getAllSeoPages as getMockSeoPages,
  getSeoPageBySlug as getMockSeoPageBySlug,
} from "@/lib/seo-pages";
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
