import type { MetadataRoute } from "next";
import { IS_INDEXABLE, SITE_URL } from "@/lib/constants";
import { getAllSeoPages, isSeoPageIndexable } from "@/lib/seo-pages";
import { getAllCenters, isCenterIndexable } from "@/lib/centers";
import { getAllGuides } from "@/lib/guides";

export default function sitemap(): MetadataRoute.Sitemap {
  // NEXT_PUBLIC_INDEXABLE=false means this deployment (e.g. the temporary
  // .vercel.app domain) is not meant to be indexed at all, so publishing a
  // sitemap full of URLs would just invite crawlers in. Keep it empty.
  if (!IS_INDEXABLE) return [];

  const staticEntries: MetadataRoute.Sitemap = [
    { url: SITE_URL, changeFrequency: "weekly", priority: 1 },
    { url: `${SITE_URL}/guarderias`, changeFrequency: "weekly", priority: 0.9 },
    { url: `${SITE_URL}/escuelas-infantiles`, changeFrequency: "weekly", priority: 0.9 },
    { url: `${SITE_URL}/ciudades`, changeFrequency: "weekly", priority: 0.7 },
    { url: `${SITE_URL}/para-centros`, changeFrequency: "monthly", priority: 0.5 },
    { url: `${SITE_URL}/blog`, changeFrequency: "weekly", priority: 0.6 },
  ];

  const seoPageEntries: MetadataRoute.Sitemap = getAllSeoPages()
    .filter(isSeoPageIndexable)
    .map((seoPage) => ({
      url: `${SITE_URL}/${seoPage.slug}`,
      changeFrequency: "weekly",
      priority: 0.8,
    }));

  const centerEntries: MetadataRoute.Sitemap = getAllCenters()
    .filter(isCenterIndexable)
    .map((center) => ({
      url: `${SITE_URL}/centro/${center.slug}`,
      lastModified: center.updatedAt,
      changeFrequency: "monthly",
      priority: 0.6,
    }));

  const guideEntries: MetadataRoute.Sitemap = getAllGuides().map((guide) => ({
    url: `${SITE_URL}/blog/${guide.slug}`,
    lastModified: guide.updatedAt ?? guide.publishedAt,
    changeFrequency: "monthly",
    priority: 0.5,
  }));

  return [...staticEntries, ...seoPageEntries, ...centerEntries, ...guideEntries];
}
