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
  comedor: "Comedor",
  "horario-ampliado": "Horario ampliado",
  bilingue: "Bilingüe",
  "aula-0-1-anos": "Aula 0-1 años",
  "aula-1-2-anos": "Aula 1-2 años",
  "aula-2-3-anos": "Aula 2-3 años",
  "patio-exterior": "Patio exterior",
  psicomotricidad: "Psicomotricidad",
  "orientacion-pedagogica": "Orientación pedagógica",
  "servicio-madrugadores": "Servicio de madrugadores",
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
