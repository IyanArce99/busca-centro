import "server-only";
import { getServerClient } from "@/lib/supabase/server";
import type { Database } from "@/types/database";
import type { DataConflict } from "@/types/center";

export type CenterRow = Database["public"]["Tables"]["centers"]["Row"];
export type LeadRow = Database["public"]["Tables"]["leads"]["Row"];
export type ClaimRow = Database["public"]["Tables"]["center_claims"]["Row"];
export type SubmissionRow = Database["public"]["Tables"]["center_submissions"]["Row"];

export interface AdminCenter extends CenterRow {
  realServices: string[];
  hasInvalidServices: boolean;
  faqCount: number;
  conflictCount: number;
  isIndexable: boolean;
  isThin: boolean;
}

/** Same substance gate as src/lib/centers.ts#isCenterIndexable, applied to raw rows. */
function computeIndexable(row: CenterRow, realServices: string[]): boolean {
  const hasCore = Boolean(
    row.name && row.slug && row.type && row.city_name && row.city_slug && (row.district || row.neighborhood || row.street)
  );
  if (!hasCore) return false;
  const hasDescription = Boolean(row.short_description?.trim());
  // Services only — a long description no longer counts as substance. See the
  // rationale in src/lib/centers.ts#isCenterIndexable (July 2026 demotion).
  const hasSubstance = realServices.length > 0;
  return hasDescription && hasSubstance;
}

function enrichCenter(row: CenterRow): AdminCenter {
  const allServices = row.services ?? [];
  const realServices = allServices.filter((s) => !s.startsWith("aula-"));
  const faqs = Array.isArray(row.faqs) ? (row.faqs as unknown[]) : [];
  const conflicts = (row.data_conflicts as unknown as Record<string, DataConflict> | null) ?? {};
  const conflictCount = Object.values(conflicts).filter((c) => c?.status === "pending_manual_review").length;
  const isIndexable = computeIndexable(row, realServices);

  return {
    ...row,
    realServices,
    hasInvalidServices: allServices.length !== realServices.length,
    faqCount: faqs.length,
    conflictCount,
    isIndexable,
    isThin: row.status === "published" && !isIndexable,
  };
}

// Supabase caps every query at 1000 rows by default. Same pitfall as the
// public getCenters() (src/lib/data/centers.ts): once the catalog exceeds
// 1000 rows, a single select silently drops the overflow — and because we
// order by updated_at, the least-recently-edited cities (e.g. Madrid) vanish
// from the dashboard and every stat undercounts. Page through in 1000-row
// chunks so the admin always sees the full catalog.
const SUPABASE_PAGE_SIZE = 1000;

/** All centers regardless of status — admin needs to see drafts/archived too. */
export async function getAllCentersAdmin(): Promise<AdminCenter[]> {
  const client = getServerClient();
  if (!client) return [];

  const rows: CenterRow[] = [];
  for (let from = 0; ; from += SUPABASE_PAGE_SIZE) {
    const { data, error } = await client
      .from("centers")
      .select("*")
      .order("updated_at", { ascending: false })
      .range(from, from + SUPABASE_PAGE_SIZE - 1);

    if (error) {
      console.error("[admin:getAllCentersAdmin]", error.message);
      return rows.map(enrichCenter);
    }
    if (!data?.length) break;
    rows.push(...data);
    if (data.length < SUPABASE_PAGE_SIZE) break;
  }
  return rows.map(enrichCenter);
}

export async function getCenterByIdAdmin(id: string): Promise<AdminCenter | null> {
  const client = getServerClient();
  if (!client) return null;

  const { data, error } = await client.from("centers").select("*").eq("id", id).maybeSingle();
  if (error || !data) return null;
  return enrichCenter(data);
}

export async function getLeadsAdmin(): Promise<LeadRow[]> {
  const client = getServerClient();
  if (!client) return [];
  const { data, error } = await client.from("leads").select("*").order("created_at", { ascending: false });
  if (error) {
    console.error("[admin:getLeadsAdmin]", error.message);
    return [];
  }
  return data;
}

export async function getClaimsAdmin(): Promise<ClaimRow[]> {
  const client = getServerClient();
  if (!client) return [];
  const { data, error } = await client.from("center_claims").select("*").order("created_at", { ascending: false });
  if (error) {
    console.error("[admin:getClaimsAdmin]", error.message);
    return [];
  }
  return data;
}

export async function getSubmissionsAdmin(): Promise<SubmissionRow[]> {
  const client = getServerClient();
  if (!client) return [];
  const { data, error } = await client.from("center_submissions").select("*").order("created_at", { ascending: false });
  if (error) {
    console.error("[admin:getSubmissionsAdmin]", error.message);
    return [];
  }
  return data;
}

export interface AdminStats {
  total: number;
  published: number;
  madrid: number;
  indexable: number;
  noindex: number;
  withLongDescription: number;
  withoutLongDescription: number;
  withFaqs: number;
  withoutFaqs: number;
  withServices: number;
  withoutServices: number;
  withConflicts: number;
  pendingManualReview: number;
  confidenceHigh: number;
  confidenceMedium: number;
  confidenceLow: number;
  confidenceUnknown: number;
  thinCount: number;
  leadsTotal: number;
  claimsNew: number;
}

export function computeStats(centers: AdminCenter[], leads: LeadRow[], claims: ClaimRow[]): AdminStats {
  const published = centers.filter((c) => c.status === "published");
  return {
    total: centers.length,
    published: published.length,
    madrid: centers.filter((c) => c.city_slug === "madrid").length,
    indexable: published.filter((c) => c.isIndexable).length,
    noindex: published.filter((c) => !c.isIndexable).length,
    withLongDescription: centers.filter((c) => c.long_description?.trim()).length,
    withoutLongDescription: centers.filter((c) => !c.long_description?.trim()).length,
    withFaqs: centers.filter((c) => c.faqCount > 0).length,
    withoutFaqs: centers.filter((c) => c.faqCount === 0).length,
    withServices: centers.filter((c) => c.realServices.length > 0).length,
    withoutServices: centers.filter((c) => c.realServices.length === 0).length,
    withConflicts: centers.filter((c) => c.conflictCount > 0).length,
    pendingManualReview: centers.filter((c) => c.verification_status === "pending_manual_review").length,
    confidenceHigh: centers.filter((c) => c.confidence_level === "high").length,
    confidenceMedium: centers.filter((c) => c.confidence_level === "medium").length,
    confidenceLow: centers.filter((c) => c.confidence_level === "low").length,
    confidenceUnknown: centers.filter((c) => !c.confidence_level || c.confidence_level === "unknown").length,
    thinCount: published.filter((c) => c.isThin).length,
    // `leads` has no status column yet (see 011_admin_schema.sql) — report total until it's added.
    leadsTotal: leads.length,
    claimsNew: claims.filter((c) => c.status === "nueva" || c.status === "pendiente_verificacion").length,
  };
}
