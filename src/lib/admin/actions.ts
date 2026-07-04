"use server";

import { revalidatePath } from "next/cache";
import { requireAdmin } from "./auth";
import { getServerClient } from "@/lib/supabase/server";
import type { CenterService, DataConflict } from "@/types/center";
import type { FAQItem } from "@/types/faq";
import type { Database, Json } from "@/types/database";

type CenterUpdate = Database["public"]["Tables"]["centers"]["Update"];

const VALID_SERVICES: CenterService[] = [
  "comedor",
  "cocina-propia",
  "catering",
  "horario-ampliado",
  "servicio-madrugadores",
  "bilingue",
  "ingles",
  "patio-exterior",
  "psicomotricidad",
  "musica",
  "actividades-extraescolares",
  "verano-campamentos",
  "orientacion-pedagogica",
  "escuela-de-padres",
  "uniformes",
];

export interface ActionResult {
  ok: boolean;
  error?: string;
}

function client() {
  const c = getServerClient();
  if (!c) throw new Error("Supabase no está configurado (faltan variables de entorno).");
  return c;
}

function revalidateCenter(id: string) {
  revalidatePath(`/admin/centers/${id}`);
  revalidatePath("/admin/centers");
  revalidatePath("/admin");
  revalidatePath("/admin/quality");
}

const EMAIL_RE = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

export async function updateCenterBasics(
  id: string,
  input: {
    name: string;
    slug: string;
    type: string;
    ownership: string;
    cityName: string;
    citySlug: string;
    district: string;
    neighborhoodBarrio: string;
    street: string;
    postalCode: string;
    latitude: string;
    longitude: string;
    phone: string;
    email: string;
    website: string;
    socialLinks: { instagram?: string; facebook?: string; linkedin?: string };
  }
): Promise<ActionResult> {
  await requireAdmin();

  if (!input.name.trim()) return { ok: false, error: "El nombre no puede estar vacío." };
  if (!input.slug.trim() || !/^[a-z0-9-]+$/.test(input.slug)) {
    return { ok: false, error: "El slug solo puede contener minúsculas, números y guiones." };
  }
  if (input.email && !EMAIL_RE.test(input.email)) return { ok: false, error: "Email no válido." };
  if (input.website && !/^https?:\/\/.+/i.test(input.website) && !/^[\w.-]+\.[a-z]{2,}/i.test(input.website)) {
    return { ok: false, error: "Web no válida." };
  }
  const lat = input.latitude ? Number(input.latitude) : null;
  const lng = input.longitude ? Number(input.longitude) : null;
  if (input.latitude && Number.isNaN(lat)) return { ok: false, error: "Latitud no válida." };
  if (input.longitude && Number.isNaN(lng)) return { ok: false, error: "Longitud no válida." };

  const supabase = client();

  // Slug uniqueness check (excluding this center itself).
  const { data: existing } = await supabase.from("centers").select("id").eq("slug", input.slug).neq("id", id).maybeSingle();
  if (existing) return { ok: false, error: "Ya existe otro centro con ese slug." };

  const { error } = await supabase
    .from("centers")
    .update({
      name: input.name.trim(),
      slug: input.slug.trim(),
      type: input.type,
      ownership: input.ownership,
      city_name: input.cityName.trim(),
      city_slug: input.citySlug.trim(),
      district: input.district.trim() || null,
      neighborhood_barrio: input.neighborhoodBarrio.trim() || null,
      street: input.street.trim() || null,
      postal_code: input.postalCode.trim() || null,
      latitude: lat,
      longitude: lng,
      phone: input.phone.trim() || null,
      email: input.email.trim() || null,
      website: input.website.trim() || null,
      social_links: input.socialLinks,
      updated_at: new Date().toISOString(),
    })
    .eq("id", id);

  if (error) return { ok: false, error: error.message };
  revalidateCenter(id);
  revalidatePath(`/centro/${input.slug}`);
  return { ok: true };
}

export async function updateCenterServices(id: string, services: string[]): Promise<ActionResult> {
  await requireAdmin();

  const clean = services.filter((s): s is CenterService => (VALID_SERVICES as string[]).includes(s));
  if (clean.length !== services.length) {
    return { ok: false, error: "Se han detectado servicios no válidos (posibles aula-*). Usa 'limpiar servicios inválidos'." };
  }

  const { error } = await client()
    .from("centers")
    .update({ services: clean, updated_at: new Date().toISOString() })
    .eq("id", id);

  if (error) return { ok: false, error: error.message };
  revalidateCenter(id);
  return { ok: true };
}

export async function updateCenterDescriptions(id: string, shortDescription: string, longDescription: string): Promise<ActionResult> {
  await requireAdmin();

  if (!shortDescription.trim()) return { ok: false, error: "La short_description no puede quedar vacía." };

  const { error } = await client()
    .from("centers")
    .update({
      short_description: shortDescription.trim(),
      long_description: longDescription.trim() || null,
      updated_at: new Date().toISOString(),
    })
    .eq("id", id);

  if (error) return { ok: false, error: error.message };
  revalidateCenter(id);
  return { ok: true };
}

export async function updateCenterFaqs(id: string, faqs: FAQItem[]): Promise<ActionResult> {
  await requireAdmin();

  const clean = faqs.filter((f) => f.question?.trim() && f.answer?.trim());
  if (clean.length > 6) return { ok: false, error: "Máximo 6 FAQs recomendado; reduce antes de guardar." };

  const seen = new Set<string>();
  for (const f of clean) {
    const key = f.question.trim().toLowerCase();
    if (seen.has(key)) return { ok: false, error: `Pregunta duplicada: "${f.question}"` };
    seen.add(key);
  }

  const { error } = await client()
    .from("centers")
    .update({ faqs: clean as unknown as Json, updated_at: new Date().toISOString() })
    .eq("id", id);

  if (error) return { ok: false, error: error.message };
  revalidateCenter(id);
  return { ok: true };
}

export async function updateVerification(
  id: string,
  input: { verificationStatus: string; confidenceLevel: string; touchVerifiedAt: boolean }
): Promise<ActionResult> {
  await requireAdmin();

  const update: CenterUpdate = {
    verification_status: input.verificationStatus,
    confidence_level: input.confidenceLevel,
    updated_at: new Date().toISOString(),
  };
  if (input.touchVerifiedAt) update.verified_at = new Date().toISOString();

  const { error } = await client().from("centers").update(update).eq("id", id);
  if (error) return { ok: false, error: error.message };
  revalidateCenter(id);
  return { ok: true };
}

export async function resolveConflict(
  id: string,
  field: string,
  decision: "accept" | "dismiss" | "pending"
): Promise<ActionResult> {
  await requireAdmin();

  const supabase = client();
  const { data: row, error: fetchError } = await supabase.from("centers").select("data_conflicts").eq("id", id).maybeSingle();
  if (fetchError || !row) return { ok: false, error: fetchError?.message ?? "Centro no encontrado." };

  const conflicts = (row.data_conflicts as unknown as Record<string, DataConflict>) ?? {};
  const conflict = conflicts[field];
  if (!conflict) return { ok: false, error: "Conflicto no encontrado." };

  const update: CenterUpdate = { updated_at: new Date().toISOString() };
  const ACCEPTABLE_FIELDS = ["name", "phone", "email", "website", "street", "postal_code", "district", "neighborhood_barrio", "schedule"] as const;
  type AcceptableField = (typeof ACCEPTABLE_FIELDS)[number];

  if (decision === "accept") {
    if (!(ACCEPTABLE_FIELDS as readonly string[]).includes(field)) {
      return { ok: false, error: `Campo '${field}' no soportado para aceptación automática.` };
    }
    update[field as AcceptableField] = conflict.proposed;
    update.verified_at = new Date().toISOString();
    conflicts[field] = { ...conflict, status: "resolved" };
  } else if (decision === "dismiss") {
    conflicts[field] = { ...conflict, status: "dismissed" };
  } else {
    conflicts[field] = { ...conflict, status: "pending_manual_review" };
  }
  update.data_conflicts = conflicts as unknown as Json;

  const { error } = await supabase.from("centers").update(update).eq("id", id);
  if (error) return { ok: false, error: error.message };
  revalidateCenter(id);
  revalidatePath("/admin/conflicts");
  return { ok: true };
}

export async function cleanInvalidServices(id: string): Promise<ActionResult> {
  await requireAdmin();

  const supabase = client();
  const { data: row, error: fetchError } = await supabase.from("centers").select("services").eq("id", id).maybeSingle();
  if (fetchError || !row) return { ok: false, error: fetchError?.message ?? "Centro no encontrado." };

  const clean = (row.services ?? []).filter((s) => (VALID_SERVICES as string[]).includes(s));
  const { error } = await supabase.from("centers").update({ services: clean, updated_at: new Date().toISOString() }).eq("id", id);
  if (error) return { ok: false, error: error.message };
  revalidateCenter(id);
  return { ok: true };
}

export async function updateClaimStatus(id: string, status: string): Promise<ActionResult> {
  await requireAdmin();
  const { error } = await client().from("center_claims").update({ status }).eq("id", id);
  if (error) return { ok: false, error: error.message };
  revalidatePath("/admin/claims");
  revalidatePath("/admin");
  return { ok: true };
}
