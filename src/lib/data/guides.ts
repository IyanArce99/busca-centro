import type { Guide } from "@/types/guide";
import { getServerClient } from "@/lib/supabase/server";
import { getAllGuides as getMockGuides, getGuideBySlug as getMockGuideBySlug } from "@/lib/guides";
import type { Database } from "@/types/database";

type GuideRow = Database["public"]["Tables"]["guides"]["Row"];

function rowToGuide(row: GuideRow): Guide {
  return {
    id: row.id,
    slug: row.slug,
    title: row.title,
    excerpt: row.excerpt,
    content: Array.isArray(row.content) ? (row.content as string[]) : [],
    category: row.category,
    publishedAt: row.published_at ?? row.created_at,
    updatedAt: row.updated_at,
    readingTimeMinutes: row.reading_time_minutes,
  };
}

export async function getGuides(): Promise<Guide[]> {
  const client = getServerClient();
  if (!client) return getMockGuides();

  const { data, error } = await client
    .from("guides")
    .select("*")
    .eq("status", "published")
    .order("published_at", { ascending: false });

  if (error || !data?.length) return getMockGuides();
  return data.map(rowToGuide);
}

export async function getGuideBySlug(slug: string): Promise<Guide | undefined> {
  const client = getServerClient();
  if (!client) return getMockGuideBySlug(slug);

  const { data, error } = await client
    .from("guides")
    .select("*")
    .eq("slug", slug)
    .eq("status", "published")
    .maybeSingle();

  if (error || !data) return getMockGuideBySlug(slug);
  return rowToGuide(data);
}
