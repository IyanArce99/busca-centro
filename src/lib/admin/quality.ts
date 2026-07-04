import type { AdminCenter } from "./data";

export interface QualityIssue {
  centerId: string;
  centerName: string;
  slug: string;
  type: string;
  detail: string;
}

function shingles(text: string, size = 5): Set<string> {
  const words = text.toLowerCase().replace(/[^\wáéíóúñü\s]/g, "").split(/\s+/).filter(Boolean);
  const set = new Set<string>();
  for (let i = 0; i + size <= words.length; i++) set.add(words.slice(i, i + size).join(" "));
  return set;
}

function jaccard(a: Set<string>, b: Set<string>): number {
  if (a.size === 0 || b.size === 0) return 0;
  let intersection = 0;
  for (const s of a) if (b.has(s)) intersection++;
  const union = a.size + b.size - intersection;
  return union === 0 ? 0 : intersection / union;
}

/** Groups centers whose long_description is near-duplicate (Jaccard > 0.55 on 5-word shingles). */
function findDuplicateLongDescriptions(centers: AdminCenter[]): QualityIssue[] {
  const withText = centers.filter((c) => c.long_description?.trim()).map((c) => ({ c, sh: shingles(c.long_description!) }));
  const issues: QualityIssue[] = [];
  const flagged = new Set<string>();

  for (let i = 0; i < withText.length; i++) {
    for (let j = i + 1; j < withText.length; j++) {
      const sim = jaccard(withText[i]!.sh, withText[j]!.sh);
      if (sim > 0.55) {
        for (const item of [withText[i]!, withText[j]!]) {
          if (flagged.has(item.c.id)) continue;
          flagged.add(item.c.id);
          issues.push({
            centerId: item.c.id,
            centerName: item.c.name,
            slug: item.c.slug,
            type: "long_description duplicada",
            detail: `Similar a "${item.c.id === withText[i]!.c.id ? withText[j]!.c.name : withText[i]!.c.name}" (similitud ${Math.round(sim * 100)}%)`,
          });
        }
      }
    }
  }
  return issues;
}

function findDuplicateShortDescriptions(centers: AdminCenter[]): QualityIssue[] {
  const groups = new Map<string, AdminCenter[]>();
  for (const c of centers) {
    const key = (c.short_description ?? "").trim().toLowerCase();
    if (!key) continue;
    if (!groups.has(key)) groups.set(key, []);
    groups.get(key)!.push(c);
  }
  const issues: QualityIssue[] = [];
  for (const group of groups.values()) {
    if (group.length < 2) continue;
    for (const c of group) {
      issues.push({ centerId: c.id, centerName: c.name, slug: c.slug, type: "meta description duplicada", detail: `Compartida con ${group.length - 1} centro(s) más` });
    }
  }
  return issues;
}

function findDuplicateFaqs(centers: AdminCenter[]): QualityIssue[] {
  const issues: QualityIssue[] = [];
  for (const c of centers) {
    const faqs = Array.isArray(c.faqs) ? (c.faqs as unknown as { question: string; answer: string }[]) : [];
    const seen = new Set<string>();
    for (const f of faqs) {
      const key = (f.question ?? "").trim().toLowerCase();
      if (key && seen.has(key)) {
        issues.push({ centerId: c.id, centerName: c.name, slug: c.slug, type: "FAQ duplicada", detail: `Pregunta repetida: "${f.question}"` });
      }
      seen.add(key);
    }
  }
  return issues;
}

function findStructuralIssues(centers: AdminCenter[]): QualityIssue[] {
  const issues: QualityIssue[] = [];
  for (const c of centers) {
    if (c.hasInvalidServices) issues.push({ centerId: c.id, centerName: c.name, slug: c.slug, type: "aulas en services", detail: "Contiene tokens aula-* en services" });
    if (!/^[a-z0-9-]+$/.test(c.slug)) issues.push({ centerId: c.id, centerName: c.name, slug: c.slug, type: "slug raro", detail: c.slug });
    if (!c.source_url) issues.push({ centerId: c.id, centerName: c.name, slug: c.slug, type: "sin source_url", detail: "No hay fuente registrada" });
    if (c.isIndexable && (c.short_description ?? "").trim().length < 80) {
      issues.push({ centerId: c.id, centerName: c.name, slug: c.slug, type: "contenido muy corto", detail: "short_description < 80 caracteres en centro indexable" });
    }
  }
  return issues;
}

export function findSeoProblems(centers: AdminCenter[]): QualityIssue[] {
  return [...findDuplicateLongDescriptions(centers), ...findDuplicateShortDescriptions(centers), ...findDuplicateFaqs(centers), ...findStructuralIssues(centers)];
}

export interface ReadyReason {
  label: string;
}

export function readyReasons(center: AdminCenter): ReadyReason[] {
  const reasons: ReadyReason[] = [];
  if (center.long_description?.trim()) reasons.push({ label: "Tiene long_description" });
  if (center.faqCount > 0) reasons.push({ label: "Tiene FAQs" });
  if (center.realServices.length > 0) reasons.push({ label: "Tiene servicios confirmados" });
  if (center.conflictCount === 0) reasons.push({ label: "Sin conflictos pendientes" });
  if (center.confidence_level === "high" || center.confidence_level === "medium") reasons.push({ label: `Confidence ${center.confidence_level}` });
  return reasons;
}

export interface ThinReason {
  label: string;
}

export function thinReasons(center: AdminCenter): ThinReason[] {
  const reasons: ThinReason[] = [];
  if (!center.long_description?.trim()) reasons.push({ label: "Sin long_description" });
  if (center.realServices.length === 0) reasons.push({ label: "Sin servicios confirmados" });
  if (center.faqCount === 0) reasons.push({ label: "Sin FAQs" });
  if (!center.confidence_level || center.confidence_level === "low" || center.confidence_level === "unknown") reasons.push({ label: `Confidence ${center.confidence_level ?? "unknown"}` });
  if (center.verification_status === "pending_manual_review") reasons.push({ label: "pending_manual_review" });
  if (!center.district && !center.neighborhood && !center.street) reasons.push({ label: "Sin dirección/barrio" });
  if (!center.source_url) reasons.push({ label: "Sin fuente" });
  return reasons;
}
