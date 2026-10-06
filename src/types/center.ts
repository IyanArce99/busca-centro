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

export type CenterFactKey =
  | "horario"
  | "calendario"
  | "edades"
  | "aulas"
  | "equipo"
  | "comedor"
  | "idiomas"
  | "metodologia"
  | "instalaciones"
  | "comunicacion"
  | "ayudas"
  | "admision"
  | "precio"
  | "historia"
  | "gestion";

/**
 * A single data point checked against the center's own channels or an official
 * source. `sourceUrl` is mandatory: a fact without a traceable source is not a
 * verified fact and must not be stored here.
 */
export interface CenterFact {
  key: CenterFactKey;
  value: string;
  sourceUrl: string;
  /** ISO date (YYYY-MM-DD) of the last check. */
  checkedAt: string;
  /**
   * True when the same fact applies to a whole network or group (municipal
   * network hours, a chain's shared website). Shown on the ficha, but it does
   * not count towards indexability: it is the same text on every sibling ficha.
   */
  shared?: boolean;
  /**
   * True when the source is a regional registry or open-data portal rather
   * than the center's own channels. Valid and shown, but a ficha built only on
   * administrative records says nothing a parent is looking for, so at least
   * MIN_OWN_SOURCE_FACTS_FOR_INDEXABLE_CENTER facts must come from elsewhere.
   */
  registry?: boolean;
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
  /** Defined (possibly empty) once the ficha has been reviewed; undefined otherwise. */
  verifiedFacts?: CenterFact[];
  /** ISO date (YYYY-MM-DD) from which a reviewed ficha may be indexed. */
  indexableFrom?: string;
  createdAt: string;
  updatedAt: string;
}
