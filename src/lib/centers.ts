import { mockCenters } from "@/data/mock-centers";
import type { Center, CenterFact } from "@/types/center";
import type { SeoPageFilters } from "@/types/seo-page";

export function getAllCenters(): Center[] {
  return mockCenters;
}

export function getCenterBySlug(slug: string): Center | undefined {
  return mockCenters.find((center) => center.slug === slug);
}

export function getCentersByCity(citySlug: string): Center[] {
  return mockCenters.filter((center) => center.address.citySlug === citySlug);
}

export function getCentersByFilters(filters: SeoPageFilters): Center[] {
  return mockCenters.filter((center) => {
    if (center.address.citySlug !== filters.citySlug) return false;
    if (center.type !== filters.centerType) return false;
    if (filters.service && !center.services.includes(filters.service)) return false;
    if (filters.ownership && center.ownership !== filters.ownership) return false;
    return true;
  });
}

/**
 * A center detail page is indexable when it has (a) the minimum identity/location
 * data needed to render a useful page and (b) enough real content to avoid a
 * thin, template-like ficha at launch.
 *
 * Quality gate (b): a short description PLUS **data beyond the public registry**.
 *
 * This gate used to also accept a long description as the substantive signal
 * (`services.length > 0 || longDescription`). That proved to be the wrong
 * trade-off: a bulk pass in July 2026 added editorial long descriptions to ~660
 * fichas that had no confirmed services, which flipped them all to indexable at
 * once. Indexed pages jumped 459 → 1,290 in days, and Google responded with a
 * site-wide quality demotion — impressions fell from ~1,700/day to ~10/day while
 * every page stayed indexed. A long description written from the same public
 * registry the ficha already shows adds no information a searcher cannot get
 * elsewhere; confirmed services do.
 *
 * Services-only (August 2026) was still too loose: 811 fichas passed, 216 of
 * them with one or two services and no schedule, and Google went on to drop
 * the site from 1,290 indexed pages to 184 by late September ("Crawled -
 * currently not indexed"). So the gate now asks for data that goes beyond the
 * public registry row: at least MIN_SERVICES_FOR_INDEXABLE_CENTER services, a
 * schedule, and a source other than the registry (the center's own website or
 * a secondary source). ~94 fichas pass as of October 2026.
 *
 * A manual check of the 13 Madrid fichas that passed showed that criterion is
 * only a proxy: 5 of the "own websites" were dead and several schedules had no
 * official source. The real signal is `verifiedFacts` — data points checked
 * one by one, each with its source URL — so a ficha with at least
 * MIN_VERIFIED_FACTS_FOR_INDEXABLE_CENTER of them is indexable on its own.
 *
 * Everything else stays `noindex, follow`: still online, still crawlable, still
 * passing internal link equity — just held out of the index until real data is
 * confirmed for it. The way to grow the indexed set is to confirm data, not to
 * generate prose.
 */
export const MIN_SERVICES_FOR_INDEXABLE_CENTER = 3;
export const MIN_VERIFIED_FACTS_FOR_INDEXABLE_CENTER = 5;
export const MIN_OWN_SOURCE_FACTS_FOR_INDEXABLE_CENTER = 3;

// Public-administration hosts and social profiles: a `website` pointing here is
// the registry/aggregator page, not the center's own site.
const NON_OWN_WEBSITE_PATTERN =
  /(\.gob\.|madrid\.org|madrid\.es|munimadrid|juntadeandalucia|gva\.es|gencat|barcelona\.cat|ayto|ajuntament|caib\.es|jcyl|aragon\.es|zaragoza\.es|laspalmasgc|cartagena\.es|albacete\.es|murciaeduca|canarias\.es|facebook|instagram)/i;

/**
 * Enough facts specific to this center (not shared with a network), of which
 * a minimum come from the center's own channels rather than a registry.
 */
export function hasEnoughOwnFacts(facts: CenterFact[]): boolean {
  const own = facts.filter((fact) => !fact.shared);
  return (
    own.length >= MIN_VERIFIED_FACTS_FOR_INDEXABLE_CENTER &&
    own.filter((fact) => !fact.registry).length >= MIN_OWN_SOURCE_FACTS_FOR_INDEXABLE_CENTER
  );
}

/** True once the release date (YYYY-MM-DD) has arrived; no date means no hold. */
export function isReleased(indexableFrom: string | undefined): boolean {
  return !indexableFrom || indexableFrom <= new Date().toISOString().slice(0, 10);
}

export function isOwnWebsite(website: string | null | undefined): boolean {
  const url = website?.trim();
  return Boolean(url) && !NON_OWN_WEBSITE_PATTERN.test(url as string);
}

export function isCenterIndexable(center: Center): boolean {
  const hasCore = Boolean(
    center.name &&
      center.slug &&
      center.type &&
      center.address.cityName &&
      center.address.citySlug &&
      (center.address.district || center.address.neighborhood || center.address.street)
  );
  if (!hasCore) return false;

  const hasDescription = Boolean(center.shortDescription?.trim());
  if (!hasDescription) return false;

  // Reviewed fichas (`verifiedFacts` defined, even if empty): only facts
  // specific to this center count. Network-wide facts (`shared`) repeat
  // verbatim across sibling fichas — 13 Cartagena municipal schools came back
  // with 10 facts each and 0 of their own. Qualifying fichas are released in
  // weekly batches (`indexableFrom`) instead of all on the same day.
  if (center.verifiedFacts) {
    return hasEnoughOwnFacts(center.verifiedFacts) && isReleased(center.indexableFrom);
  }

  // Legacy path, for fichas not yet reviewed. To be removed once the
  // verified-facts batches have covered the catalog.
  const hasSubstance =
    center.services.length >= MIN_SERVICES_FOR_INDEXABLE_CENTER && Boolean(center.schedule?.trim());
  const hasOwnSource =
    isOwnWebsite(center.contact.website) || (center.sourceUrlsSecondary?.length ?? 0) > 0;
  return hasSubstance && hasOwnSource;
}

export function getRelatedCenters(center: Center, limit = 3): Center[] {
  return mockCenters
    .filter((other) => other.id !== center.id && other.address.citySlug === center.address.citySlug && other.type === center.type)
    .slice(0, limit);
}
