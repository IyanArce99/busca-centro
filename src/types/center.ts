import type { FAQItem } from "./faq";

export type CenterType = "guarderia" | "escuela-infantil";

export type CenterOwnership = "publico" | "privado" | "concertado";

export type CenterService =
  // Alimentación
  | "comedor"
  | "cocina-propia"
  | "catering"
  // Horario
  | "horario-ampliado"
  | "servicio-madrugadores"
  // Idiomas
  | "bilingue"
  | "ingles"
  // Aulas por edad
  | "aula-0-1-anos"
  | "aula-1-2-anos"
  | "aula-2-3-anos"
  // Instalaciones
  | "patio-exterior"
  // Actividades
  | "psicomotricidad"
  | "musica"
  | "actividades-extraescolares"
  | "verano-campamentos"
  // Pedagogía / familia
  | "orientacion-pedagogica"
  | "escuela-de-padres"
  // Otros
  | "uniformes";

export type VerificationStatus =
  | "unverified"
  | "partially_verified"
  | "verified"
  | "pending_manual_review";

export type ConfidenceLevel = "unknown" | "low" | "medium" | "high";

export interface DataConflict {
  current: string | null;
  proposed: string;
  reason: string;
  status: "pending_manual_review" | "resolved" | "dismissed";
}

export interface CenterSocialLinks {
  instagram?: string;
  facebook?: string;
  linkedin?: string;
}

export interface CenterAddress {
  street: string;
  postalCode: string;
  citySlug: string;
  cityName: string;
  /** @deprecated Actualmente almacena el distrito en datos importados. Usar `district`. */
  neighborhood?: string;
  district?: string;
  neighborhoodBarrio?: string;
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
  // Campos de enriquecimiento
  socialLinks?: CenterSocialLinks;
  pedagogicalApproach?: string[];
  sourceUrl?: string;
  sourceUrlsSecondary?: string[];
  verifiedAt?: string;
  verificationStatus?: VerificationStatus;
  confidenceLevel?: ConfidenceLevel;
  dataConflicts?: Record<string, DataConflict>;
  createdAt: string;
  updatedAt: string;
}
