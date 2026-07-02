import { getSupabaseClient } from "@/lib/supabase/client";

export interface LeadInput {
  centerSlug: string;
  name: string;
  email: string;
  phone?: string;
  message?: string;
}

export interface CenterClaimInput {
  centerName: string;
  centerUrl: string;
  applicantName: string;
  applicantRole: string;
  corporateEmail: string;
  phone?: string;
  website?: string;
  comments?: string;
}

export interface CenterSubmissionInput {
  name: string;
  city: string;
  address: string;
  contactName: string;
  email: string;
  phone?: string;
  website?: string;
  centerType?: string;
  ageRange?: string;
  services?: string;
  comments?: string;
}

export interface FormResult {
  error: string | null;
}

export async function createLead(input: LeadInput): Promise<FormResult> {
  const client = getSupabaseClient();
  if (!client) {
    // Supabase not configured — silently succeed so UX isn't broken during dev
    return { error: null };
  }

  const { error } = await client.from("leads").insert({
    center_slug: input.centerSlug,
    name: input.name,
    email: input.email,
    phone: input.phone ?? null,
    message: input.message ?? null,
  });

  if (error) {
    console.error("[createLead]", error.message);
    return { error: "No se pudo enviar tu solicitud. Inténtalo de nuevo." };
  }

  return { error: null };
}

export async function createCenterClaim(input: CenterClaimInput): Promise<FormResult> {
  const client = getSupabaseClient();
  if (!client) {
    return { error: null };
  }

  const { error } = await client.from("center_claims").insert({
    center_name: input.centerName,
    center_url: input.centerUrl,
    applicant_name: input.applicantName,
    applicant_role: input.applicantRole,
    corporate_email: input.corporateEmail,
    phone: input.phone ?? null,
    website: input.website ?? null,
    comments: input.comments ?? null,
  });

  if (error) {
    console.error("[createCenterClaim]", error.message);
    return { error: "No se pudo enviar tu solicitud. Inténtalo de nuevo." };
  }

  return { error: null };
}

export async function createCenterSubmission(input: CenterSubmissionInput): Promise<FormResult> {
  const client = getSupabaseClient();
  if (!client) {
    return { error: null };
  }

  const { error } = await client.from("center_submissions").insert({
    name: input.name,
    city: input.city,
    address: input.address,
    contact_name: input.contactName,
    email: input.email,
    phone: input.phone ?? null,
    website: input.website ?? null,
    center_type: input.centerType ?? null,
    age_range: input.ageRange ?? null,
    services: input.services ?? null,
    comments: input.comments ?? null,
  });

  if (error) {
    console.error("[createCenterSubmission]", error.message);
    return { error: "No se pudo enviar tu solicitud. Inténtalo de nuevo." };
  }

  return { error: null };
}
