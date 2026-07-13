import type {
  Center,
  CenterOwnership,
  CenterService,
  CenterSocialLinks,
  CenterType,
  ConfidenceLevel,
  DataConflict,
  VerificationStatus,
} from "@/types/center";
import type { SeoPageFilters } from "@/types/seo-page";
import type { FAQItem } from "@/types/faq";
import { getServerClient } from "@/lib/supabase/server";
import {
  getAllCenters as getMockCenters,
  getCenterBySlug as getMockCenterBySlug,
  getCentersByCity as getMockCentersByCity,
} from "@/lib/centers";
import type { Database } from "@/types/database";

type CenterRow = Database["public"]["Tables"]["centers"]["Row"];

function rowToCenter(row: CenterRow): Center {
  return {
    id: row.id,
    slug: row.slug,
    name: row.name,
    type: row.type as CenterType,
    ownership: row.ownership as CenterOwnership,
    address: {
      street: row.street ?? "",
      postalCode: row.postal_code ?? "",
      citySlug: row.city_slug,
      cityName: row.city_name,
      neighborhood: row.neighborhood ?? undefined,
      district: row.district ?? undefined,
      neighborhoodBarrio: row.neighborhood_barrio ?? undefined,
      latitude: row.latitude ?? undefined,
      longitude: row.longitude ?? undefined,
    },
    contact: {
      phone: row.phone ?? undefined,
      email: row.email ?? undefined,
      website: row.website ?? undefined,
    },
    ageRange: {
      minMonths: row.age_min_months,
      maxMonths: row.age_max_months,
    },
    schedule: row.schedule ?? undefined,
    services: ((row.services ?? []) as string[]).filter(s => !s.startsWith("aula-")) as CenterService[],
    shortDescription: row.short_description,
    longDescription: row.long_description ?? undefined,
    images: row.images ?? [],
    faqs: Array.isArray(row.faqs) ? (row.faqs as unknown as FAQItem[]) : [],
    isClaimed: row.is_claimed,
    isVerified: row.is_verified,
    socialLinks: (row.social_links as CenterSocialLinks) ?? undefined,
    pedagogicalApproach: row.pedagogical_approach ?? [],
    sourceUrl: row.source_url ?? undefined,
    sourceUrlsSecondary: row.source_urls_secondary ?? [],
    verifiedAt: row.verified_at ?? undefined,
    verificationStatus: (row.verification_status as VerificationStatus) ?? undefined,
    confidenceLevel: (row.confidence_level as ConfidenceLevel) ?? undefined,
    dataConflicts: (row.data_conflicts as unknown as Record<string, DataConflict>) ?? undefined,
    createdAt: row.created_at,
    updatedAt: row.updated_at,
  };
}

// Supabase caps every query at 1000 rows by default. Once the published
// catalog exceeds 1000 centers, a single select silently drops the overflow —
// and because we order by updated_at, whichever cities were edited least
// recently fall off the end, disappearing from the sitemap and flipping their
// city landings to noindex. Page through in 1000-row chunks so getCenters()
// always returns the full published set regardless of catalog size.
const SUPABASE_PAGE_SIZE = 1000;

export async function getCenters(): Promise<Center[]> {
  const client = getServerClient();
  if (!client) return getMockCenters();

  const rows: CenterRow[] = [];
  for (let from = 0; ; from += SUPABASE_PAGE_SIZE) {
    const { data, error } = await client
      .from("centers")
      .select("*")
      .eq("status", "published")
      .order("updated_at", { ascending: false })
      .range(from, from + SUPABASE_PAGE_SIZE - 1);

    if (error) return rows.length ? rows.map(rowToCenter) : getMockCenters();
    if (!data?.length) break;
    rows.push(...data);
    if (data.length < SUPABASE_PAGE_SIZE) break;
  }

  if (!rows.length) return getMockCenters();
  return rows.map(rowToCenter);
}

export async function getCenterBySlug(slug: string): Promise<Center | undefined> {
  const client = getServerClient();
  if (!client) return getMockCenterBySlug(slug);

  const { data, error } = await client
    .from("centers")
    .select("*")
    .eq("slug", slug)
    .eq("status", "published")
    .maybeSingle();

  if (error || !data) return getMockCenterBySlug(slug);
  return rowToCenter(data);
}

export async function getCentersByCity(citySlug: string): Promise<Center[]> {
  const client = getServerClient();
  if (!client) return getMockCentersByCity(citySlug);

  const { data, error } = await client
    .from("centers")
    .select("*")
    .eq("city_slug", citySlug)
    .eq("status", "published")
    .order("name");

  if (error || !data?.length) return getMockCentersByCity(citySlug);
  return data.map(rowToCenter);
}

export async function getCentersByFilters(filters: SeoPageFilters): Promise<Center[]> {
  const client = getServerClient();
  if (!client) {
    const { getCentersByFilters: getMockByFilters } = await import("@/lib/centers");
    return getMockByFilters(filters);
  }

  let query = client
    .from("centers")
    .select("*")
    .eq("city_slug", filters.citySlug)
    .eq("type", filters.centerType)
    .eq("status", "published");

  if (filters.service) {
    query = query.contains("services", [filters.service]);
  }
  if (filters.ownership) {
    query = query.eq("ownership", filters.ownership);
  }

  const { data, error } = await query.order("name");
  if (error || !data) {
    const { getCentersByFilters: getMockByFilters } = await import("@/lib/centers");
    return getMockByFilters(filters);
  }
  return data.map(rowToCenter);
}
