import { mockGuides } from "@/data/mock-guides";
import type { Guide } from "@/types/guide";

export function getAllGuides(): Guide[] {
  return [...mockGuides].sort((a, b) => (a.publishedAt < b.publishedAt ? 1 : -1));
}

export function getGuideBySlug(slug: string): Guide | undefined {
  return mockGuides.find((guide) => guide.slug === slug);
}

export function getRelatedGuides(guide: Guide, limit = 3): Guide[] {
  return mockGuides.filter((other) => other.id !== guide.id).slice(0, limit);
}
