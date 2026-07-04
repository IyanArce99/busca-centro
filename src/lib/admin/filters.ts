import type { AdminCenter } from "./data";

export interface CenterFiltersState {
  q?: string;
  city?: string;
  district?: string;
  barrio?: string;
  type?: string;
  ownership?: string;
  status?: string;
  indexable?: "yes" | "no";
  confidence?: string;
  verification?: string;
  services?: "some" | "none";
  comedor?: "1";
  horarioAmpliado?: "1";
  ingles?: "1";
  faqs?: "some" | "none";
  longDescription?: "some" | "none";
  conflicts?: "1";
  pendingReview?: "1";
  thin?: "1";
  sort?: string;
  dir?: "asc" | "desc";
  page?: string;
  perPage?: string;
}

export function parseFilters(sp: Record<string, string | string[] | undefined>): CenterFiltersState {
  const get = (k: string) => (typeof sp[k] === "string" ? (sp[k] as string) : undefined);
  return {
    q: get("q"),
    city: get("city"),
    district: get("district"),
    barrio: get("barrio"),
    type: get("type"),
    ownership: get("ownership"),
    status: get("status"),
    indexable: get("indexable") as CenterFiltersState["indexable"],
    confidence: get("confidence"),
    verification: get("verification"),
    services: get("services") as CenterFiltersState["services"],
    comedor: get("comedor") as CenterFiltersState["comedor"],
    horarioAmpliado: get("horarioAmpliado") as CenterFiltersState["horarioAmpliado"],
    ingles: get("ingles") as CenterFiltersState["ingles"],
    faqs: get("faqs") as CenterFiltersState["faqs"],
    longDescription: get("longDescription") as CenterFiltersState["longDescription"],
    conflicts: get("conflicts") as CenterFiltersState["conflicts"],
    pendingReview: get("pendingReview") as CenterFiltersState["pendingReview"],
    thin: get("thin") as CenterFiltersState["thin"],
    sort: get("sort"),
    dir: get("dir") as CenterFiltersState["dir"],
    page: get("page"),
    perPage: get("perPage"),
  };
}

export function applyCenterFilters(centers: AdminCenter[], f: CenterFiltersState): AdminCenter[] {
  let result = centers;

  if (f.q) {
    const q = f.q.toLowerCase();
    result = result.filter(
      (c) =>
        c.name.toLowerCase().includes(q) ||
        c.slug.toLowerCase().includes(q) ||
        (c.street ?? "").toLowerCase().includes(q) ||
        (c.phone ?? "").toLowerCase().includes(q) ||
        (c.email ?? "").toLowerCase().includes(q) ||
        (c.website ?? "").toLowerCase().includes(q)
    );
  }
  if (f.city) result = result.filter((c) => c.city_slug === f.city);
  if (f.district) result = result.filter((c) => c.district === f.district);
  if (f.barrio) result = result.filter((c) => c.neighborhood_barrio === f.barrio || c.neighborhood === f.barrio);
  if (f.type) result = result.filter((c) => c.type === f.type);
  if (f.ownership) result = result.filter((c) => c.ownership === f.ownership);
  if (f.status) result = result.filter((c) => c.status === f.status);
  if (f.indexable === "yes") result = result.filter((c) => c.isIndexable);
  if (f.indexable === "no") result = result.filter((c) => !c.isIndexable);
  if (f.confidence) result = result.filter((c) => (c.confidence_level || "unknown") === f.confidence);
  if (f.verification) result = result.filter((c) => c.verification_status === f.verification);
  if (f.services === "some") result = result.filter((c) => c.realServices.length > 0);
  if (f.services === "none") result = result.filter((c) => c.realServices.length === 0);
  if (f.comedor === "1") result = result.filter((c) => c.realServices.includes("comedor"));
  if (f.horarioAmpliado === "1") result = result.filter((c) => c.realServices.includes("horario-ampliado"));
  if (f.ingles === "1") result = result.filter((c) => c.realServices.includes("ingles") || c.realServices.includes("bilingue"));
  if (f.faqs === "some") result = result.filter((c) => c.faqCount > 0);
  if (f.faqs === "none") result = result.filter((c) => c.faqCount === 0);
  if (f.longDescription === "some") result = result.filter((c) => c.long_description?.trim());
  if (f.longDescription === "none") result = result.filter((c) => !c.long_description?.trim());
  if (f.conflicts === "1") result = result.filter((c) => c.conflictCount > 0);
  if (f.pendingReview === "1") result = result.filter((c) => c.verification_status === "pending_manual_review");
  if (f.thin === "1") result = result.filter((c) => c.isThin);

  const sort = f.sort ?? "updated_at";
  const dir = f.dir === "asc" ? 1 : -1;
  result = [...result].sort((a, b) => {
    switch (sort) {
      case "name":
        return a.name.localeCompare(b.name) * dir;
      case "confidence": {
        const order = { high: 3, medium: 2, low: 1, unknown: 0 } as Record<string, number>;
        return ((order[a.confidence_level || "unknown"] ?? 0) - (order[b.confidence_level || "unknown"] ?? 0)) * dir;
      }
      case "services":
        return (a.realServices.length - b.realServices.length) * dir;
      case "faqs":
        return (a.faqCount - b.faqCount) * dir;
      case "district":
        return (a.district ?? "").localeCompare(b.district ?? "") * dir;
      case "indexable":
        return (Number(a.isIndexable) - Number(b.isIndexable)) * dir;
      case "updated_at":
      default:
        return (new Date(a.updated_at).getTime() - new Date(b.updated_at).getTime()) * dir;
    }
  });

  return result;
}

export function paginate<T>(items: T[], f: CenterFiltersState): { pageItems: T[]; page: number; perPage: number; totalPages: number } {
  const perPage = Number(f.perPage) || 25;
  const totalPages = Math.max(1, Math.ceil(items.length / perPage));
  const page = Math.min(Math.max(Number(f.page) || 1, 1), totalPages);
  const start = (page - 1) * perPage;
  return { pageItems: items.slice(start, start + perPage), page, perPage, totalPages };
}
