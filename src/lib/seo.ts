import type { Metadata } from "next";
import { IS_INDEXABLE, SITE_NAME } from "./constants";

/**
 * Central robots-metadata gate used by every page.
 *
 * - `NEXT_PUBLIC_INDEXABLE=false` (or unset): always "noindex, follow",
 *   regardless of the page's own readiness — this is what keeps the
 *   temporary `.vercel.app` domain out of Google.
 * - `NEXT_PUBLIC_INDEXABLE=true`: falls back to the page's own
 *   indexability rule (e.g. a city page needs 10+ centers, a center
 *   needs complete data) via the `isPageIndexable` argument.
 */
export function robotsMeta(isPageIndexable = true): Metadata["robots"] {
  if (!IS_INDEXABLE) return { index: false, follow: true };
  return isPageIndexable ? { index: true, follow: true } : { index: false, follow: true };
}

interface BuildMetadataOptions {
  title: string;
  description: string;
  /** Site-relative path starting with "/", e.g. "/guarderias-en-valencia". */
  path: string;
  indexable?: boolean;
}

/**
 * Per-page metadata builder. The root layout only sets sitewide OG/Twitter
 * defaults — Next does not merge a child route's title/description into
 * those objects automatically, so every page must set its own openGraph
 * and twitter blocks or social previews fall back to the homepage's.
 */
export function buildMetadata({
  title,
  description,
  path,
  indexable = true,
}: BuildMetadataOptions): Metadata {
  return {
    title,
    description,
    alternates: { canonical: path },
    robots: robotsMeta(indexable),
    openGraph: {
      title,
      description,
      url: path,
      siteName: SITE_NAME,
      type: "website",
      locale: "es_ES",
    },
    twitter: {
      card: "summary",
      title,
      description,
    },
  };
}
