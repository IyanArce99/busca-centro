import type { MetadataRoute } from "next";
import { IS_INDEXABLE, SITE_URL } from "@/lib/constants";
import { getAllSeoPages } from "@/lib/seo-pages";
import { isCenterIndexable } from "@/lib/centers";
import { getCenters } from "@/lib/data/centers";
import { isSeoPageIndexableFromCenters } from "@/lib/data/seo-pages";
import { getAllGuides } from "@/lib/guides";

// IS_INDEXABLE=false means this deployment (e.g. a Vercel preview) should not
// be indexed at all. Keep the sitemap empty so crawlers get nothing useful.
export default async function sitemap(): Promise<MetadataRoute.Sitemap> {
  if (!IS_INDEXABLE) return [];

  // Fetch published centers once; reuse for both SEO-page and center entries.
  const allCenters = await getCenters();
  const allSeoPages = getAllSeoPages();

  const staticEntries: MetadataRoute.Sitemap = [
    { url: SITE_URL, changeFrequency: "weekly", priority: 1 },
    { url: `${SITE_URL}/guarderias`, changeFrequency: "weekly", priority: 0.9 },
    { url: `${SITE_URL}/escuelas-infantiles`, changeFrequency: "weekly", priority: 0.9 },
    { url: `${SITE_URL}/ciudades`, changeFrequency: "weekly", priority: 0.7 },
    { url: `${SITE_URL}/blog`, changeFrequency: "weekly", priority: 0.6 },
    { url: `${SITE_URL}/para-centros`, changeFrequency: "monthly", priority: 0.5 },
    { url: `${SITE_URL}/contacto`, changeFrequency: "yearly", priority: 0.3 },
    { url: `${SITE_URL}/aviso-legal`, changeFrequency: "yearly", priority: 0.3 },
    { url: `${SITE_URL}/privacidad`, changeFrequency: "yearly", priority: 0.3 },
    { url: `${SITE_URL}/cookies`, changeFrequency: "yearly", priority: 0.3 },
  ];

  // Guides: real long-form content, indexable since 2026-07.
  const guideEntries: MetadataRoute.Sitemap = getAllGuides().map((guide) => ({
    url: `${SITE_URL}/blog/${guide.slug}`,
    lastModified: guide.updatedAt ?? guide.publishedAt,
    changeFrequency: "monthly" as const,
    priority: 0.6,
  }));

  // Only include landing pages with enough real published centers.
  const seoPageEntries: MetadataRoute.Sitemap = allSeoPages
    .filter((page) => isSeoPageIndexableFromCenters(page, allCenters))
    .map((page) => ({
      url: `${SITE_URL}/${page.slug}`,
      changeFrequency: "weekly" as const,
      priority: 0.8,
    }));

  // Only include center pages that pass minimum data requirements.
  const centerEntries: MetadataRoute.Sitemap = allCenters
    .filter(isCenterIndexable)
    .map((center) => ({
      url: `${SITE_URL}/centro/${center.slug}`,
      lastModified: center.updatedAt,
      changeFrequency: "monthly" as const,
      priority: 0.6,
    }));

  return [...staticEntries, ...guideEntries, ...seoPageEntries, ...centerEntries];
}
