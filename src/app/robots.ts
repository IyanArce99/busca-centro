import type { MetadataRoute } from "next";
import { IS_INDEXABLE, SITE_URL } from "@/lib/constants";

export default function robots(): MetadataRoute.Robots {
  // NEXT_PUBLIC_INDEXABLE=false keeps the whole deployment out of search
  // engines — this is what protects the temporary .vercel.app domain (and
  // any preview/staging deploy) from being indexed before launch.
  if (!IS_INDEXABLE) {
    return {
      rules: {
        userAgent: "*",
        disallow: "/",
      },
    };
  }

  return {
    // /anadir-centro and /reclamar-ficha stay crawlable (not disallowed here) so
    // crawlers can read their per-page "noindex, follow" meta tag and still follow
    // internal links; disallowing them here would hide that page-level robots metadata.
    rules: {
      userAgent: "*",
      allow: "/",
    },
    sitemap: `${SITE_URL}/sitemap.xml`,
  };
}
