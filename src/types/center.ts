import type { FAQItem } from "./faq";

/**
 * MVP only covers early childhood education (0-3 / 0-6).
 * Keep this union easy to extend with "colegio" | "instituto" | "fp" later
 * without reshaping the rest of the schema.
 */
export type CenterType = "guarderia" | "escuela-infantil";

export type CenterOwnership = "publico" | "privado" | "concertado";

export type CenterService =
  | "comedor"
  | "horario-ampliado"
  | "bilingue"
  | "aula-0-1-anos"
  | "aula-1-2-anos"
  | "aula-2-3-anos"
  | "patio-exterior"
  | "psicomotricidad"
  | "orientacion-pedagogica"
  | "servicio-madrugadores";

export interface CenterAddress {
  street: string;
  postalCode: string;
  citySlug: string;
  cityName: string;
  neighborhood?: string;
  latitude?: number;
  longitude?: number;
}

export interface CenterContact {
  phone?: string;
  email?: string;
  website?: string;
}

export interface CenterAgeRange {
  minMonths: number;
  maxMonths: number;
}

/**
 * Shaped to map closely to a future `centers` table in Supabase so the
 * frontend doesn't need to change when mock data is swapped for real data.
 */
export interface Center {
  id: string;
  slug: string;
  name: string;
  type: CenterType;
  ownership: CenterOwnership;
  address: CenterAddress;
  contact: CenterContact;
  ageRange: CenterAgeRange;
  schedule?: string;
  services: CenterService[];
  shortDescription: string;
  longDescription?: string;
  images?: string[];
  faqs?: FAQItem[];
  isClaimed: boolean;
  isVerified: boolean;
  createdAt: string;
  updatedAt: string;
}
