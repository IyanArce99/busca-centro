import type { Metadata } from "next";
import { IS_INDEXABLE } from "./constants";

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
