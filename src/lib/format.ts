import type { CenterAgeRange, CenterOwnership, CenterService, CenterType } from "@/types/center";

const CENTER_TYPE_LABELS: Record<CenterType, string> = {
  guarderia: "Guardería",
  "escuela-infantil": "Escuela infantil",
};

const OWNERSHIP_LABELS: Record<CenterOwnership, string> = {
  publico: "Pública",
  privado: "Privada",
  concertado: "Concertada",
};

const SERVICE_LABELS: Record<CenterService, string> = {
  // Alimentación
  comedor: "Comedor",
  "cocina-propia": "Cocina propia",
  catering: "Catering",
  // Horario
  "horario-ampliado": "Horario ampliado",
  "servicio-madrugadores": "Servicio de madrugadores",
  // Idiomas
  bilingue: "Bilingüe",
  ingles: "Inglés",
  // Instalaciones
  "patio-exterior": "Patio exterior",
  // Actividades
  psicomotricidad: "Psicomotricidad",
  musica: "Música",
  "actividades-extraescolares": "Actividades extraescolares",
  "verano-campamentos": "Verano / campamentos",
  // Pedagogía / familia
  "orientacion-pedagogica": "Orientación pedagógica",
  "escuela-de-padres": "Escuela de padres",
  // Otros
  uniformes: "Uniformes",
};

const PEDAGOGICAL_APPROACH_LABELS: Record<string, string> = {
  montessori: "Montessori",
  "reggio-emilia": "Reggio Emilia",
  waldorf: "Waldorf",
  bilingue: "Bilingüe",
  "aprendizaje-activo": "Aprendizaje activo",
  "estimulacion-temprana": "Estimulación temprana",
  "8minds": "8MINDS",
  "proyecto-propio": "Proyecto propio",
  "orientacion-pedagogica": "Orientación pedagógica",
};

export function formatCenterType(type: CenterType): string {
  return CENTER_TYPE_LABELS[type];
}

export function formatOwnership(ownership: CenterOwnership): string {
  return OWNERSHIP_LABELS[ownership];
}

export function formatService(service: CenterService): string {
  return SERVICE_LABELS[service];
}

export function formatPedagogicalApproach(approach: string): string {
  return PEDAGOGICAL_APPROACH_LABELS[approach] ?? approach;
}

export function formatAgeRange({ minMonths, maxMonths }: CenterAgeRange): string {
  const minYears = minMonths / 12;
  const maxYears = maxMonths / 12;
  const formatYears = (years: number) => (Number.isInteger(years) ? `${years}` : years.toFixed(1));

  if (minMonths < 12 && maxMonths <= 36) {
    return `De ${minMonths} meses a ${formatYears(maxYears)} años`;
  }
  return `De ${formatYears(minYears)} a ${formatYears(maxYears)} años`;
}

export function phoneHref(phone: string): string {
  return `tel:${phone.replace(/\s/g, "")}`;
}

export function emailHref(email: string): string {
  return `mailto:${email}`;
}

/**
 * Normalize a stored website into a safe absolute URL. Many imported centers
 * store the site without a scheme (e.g. "www.centro.es"), which the browser
 * would otherwise treat as a relative link (→ /centro/www.centro.es). Prepend
 * https:// when no http(s) scheme is present.
 */
export function websiteHref(website: string): string {
  const trimmed = website.trim();
  if (/^https?:\/\//i.test(trimmed)) return trimmed;
  return `https://${trimmed}`;
}

/** Cleaned website label for display (drops scheme and trailing slash). */
export function formatWebsiteLabel(website: string): string {
  return website.trim().replace(/^https?:\/\//i, "").replace(/\/+$/, "");
}

/** Google Maps "search" deep link that opens the location in a new tab. */
export function mapsSearchUrl(query: string): string {
  return `https://www.google.com/maps/search/?api=1&query=${encodeURIComponent(query)}`;
}

/** Google Maps embeddable URL (no API key required) for an <iframe>. */
export function mapsEmbedUrl(query: string): string {
  return `https://www.google.com/maps?q=${encodeURIComponent(query)}&output=embed`;
}
