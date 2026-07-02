import type { City } from "@/types/city";
import { getServerClient } from "@/lib/supabase/server";
import { getAllCities as getMockCities, getCityBySlug as getMockCityBySlug } from "@/lib/cities";
import type { Database } from "@/types/database";

type CityRow = Database["public"]["Tables"]["cities"]["Row"];

function rowToCity(row: CityRow): City {
  return {
    id: row.id,
    slug: row.slug,
    name: row.name,
    province: row.province,
    region: row.region,
    isFeatured: row.is_featured,
  };
}

export async function getCities(): Promise<City[]> {
  const client = getServerClient();
  if (!client) return getMockCities();

  const { data, error } = await client.from("cities").select("*").order("name");
  if (error || !data?.length) return getMockCities();

  return data.map(rowToCity);
}

export async function getCityBySlug(slug: string): Promise<City | undefined> {
  const client = getServerClient();
  if (!client) return getMockCityBySlug(slug);

  const { data, error } = await client.from("cities").select("*").eq("slug", slug).maybeSingle();
  if (error || !data) return getMockCityBySlug(slug);

  return rowToCity(data);
}
