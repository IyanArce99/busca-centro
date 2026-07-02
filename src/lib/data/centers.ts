import type { Center, CenterOwnership, CenterService, CenterType } from "@/types/center";
import type { SeoPageFilters } from "@/types/seo-page";
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
    services: (row.services ?? []) as CenterService[],
    shortDescription: row.short_description,
    longDescription: row.long_description ?? undefined,
    images: row.images ?? [],
    isClaimed: row.is_claimed,
    isVerified: row.is_verified,
    createdAt: row.created_at,
    updatedAt: row.updated_at,
  };
}

export async function getCenters(): Promise<Center[]> {
  const client = getServerClient();
  if (!client) return getMockCenters();

  const { data, error } = await client
    .from("centers")
    .select("*")
    .eq("status", "published")
    .order("updated_at", { ascending: false });

  if (error || !data?.length) return getMockCenters();
  return data.map(rowToCenter);
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
