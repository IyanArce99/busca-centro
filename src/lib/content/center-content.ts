import type { Center, CenterService } from "@/types/center";
import type { FAQItem } from "@/types/faq";

// ── Label maps ────────────────────────────────────────────────────────────────

const TYPE_NOUN: Record<string, string> = {
  guarderia: "guardería",
  "escuela-infantil": "escuela infantil",
};

const TYPE_NOUN_PLURAL: Record<string, string> = {
  guarderia: "guarderías",
  "escuela-infantil": "escuelas infantiles",
};

const TYPE_ART: Record<string, string> = {
  guarderia: "una guardería",
  "escuela-infantil": "una escuela infantil",
};

const OWNERSHIP_ADJ: Record<string, string> = {
  publico: "pública",
  privado: "privada",
  concertado: "concertada",
};

const SVC_LABEL: Partial<Record<CenterService, string>> = {
  comedor: "comedor",
  "cocina-propia": "cocina propia",
  catering: "catering",
  "horario-ampliado": "horario ampliado",
  "servicio-madrugadores": "servicio de madrugadores",
  bilingue: "proyecto bilingüe",
  ingles: "inglés",
  "patio-exterior": "patio exterior",
  psicomotricidad: "psicomotricidad",
  musica: "música",
  "actividades-extraescolares": "actividades extraescolares",
  "verano-campamentos": "verano o campamentos",
  "orientacion-pedagogica": "orientación pedagógica",
  "escuela-de-padres": "escuela de padres",
  uniformes: "uniformes",
};

// ── Internal helpers ──────────────────────────────────────────────────────────

function ageText(minMonths: number, maxMonths: number): string {
  const fmt = (m: number) => {
    if (m < 12) return `${m} meses`;
    const y = m / 12;
    return Number.isInteger(y) ? `${y} ${y === 1 ? "año" : "años"}` : `${y.toFixed(1)} años`;
  };
  return `de ${fmt(minMonths)} a ${fmt(maxMonths)}`;
}

function locationPhrase(center: Center): string {
  const { neighborhood, cityName } = center.address;
  return neighborhood ? `el distrito de ${neighborhood}, ${cityName}` : cityName;
}

function svcLabel(s: CenterService): string {
  return SVC_LABEL[s] ?? s;
}

function joinList(items: string[]): string {
  if (items.length === 0) return "";
  if (items.length === 1) return items[0]!;
  return items.slice(0, -1).join(", ") + " y " + items.at(-1);
}

// ── buildCenterIntro ──────────────────────────────────────────────────────────

export function buildCenterIntro(center: Center): string[] {
  const tipo = TYPE_ART[center.type] ?? "un centro";
  const adj = OWNERSHIP_ADJ[center.ownership] ?? "privada";
  const loc = locationPhrase(center);
  const age = ageText(center.ageRange.minMonths, center.ageRange.maxMonths);
  const extraSvc = center.services.filter(s =>
    ["comedor", "horario-ampliado", "bilingue"].includes(s),
  );
  const hasContact = !!(center.contact.phone || center.contact.email || center.contact.website);

  // P1 — identidad + contexto de titularidad
  let p1: string;
  if (center.ownership === "publico") {
    p1 = `${center.name} es ${tipo} ${adj} situada en ${loc}. Los centros públicos de primer ciclo en Madrid pertenecen a la red municipal o autonómica; la admisión de plazas se gestiona habitualmente a través del proceso oficial de escolarización de la Comunidad de Madrid.`;
  } else if (center.ownership === "concertado") {
    p1 = `${center.name} es ${tipo} concertada situada en ${loc}. Los centros concertados combinan financiación pública con gestión privada; el proceso de admisión puede tener criterios específicos según el concierto vigente con la administración.`;
  } else {
    p1 = `${center.name} es ${tipo} ${adj} situada en ${loc}. Los datos de esta ficha proceden de fuentes públicas oficiales y pueden estar sujetos a actualizaciones por parte del propio centro.`;
  }

  // P2 — etapa educativa con variación por tipo
  let p2: string;
  if (center.type === "escuela-infantil") {
    p2 = `Según los datos disponibles, ${center.name} es un centro orientado al primer ciclo de Educación Infantil, etapa dirigida habitualmente a niños y niñas ${age}. El proyecto educativo y el enfoque pedagógico concreto pueden variar de un centro a otro; conviene consultarlo directamente con el equipo de ${center.name}.`;
  } else {
    p2 = `Según los datos disponibles, ${center.name} está orientada al primer ciclo de Educación Infantil, habitualmente para niños y niñas ${age}. El enfoque educativo concreto de cada guardería puede variar; conviene confirmarlo directamente con el centro antes de tomar una decisión.`;
  }

  // P3 — nota sobre datos disponibles, varía según contacto y servicios
  let p3: string;
  if (hasContact && extraSvc.length > 0) {
    const svcList = joinList(extraSvc.map(svcLabel));
    p3 = `La ficha incluye datos de contacto, ubicación y algunos servicios registrados como ${svcList}. Los horarios exactos, la disponibilidad de plazas, las cuotas y las condiciones de admisión pueden cambiar durante el curso; te recomendamos confirmarlos directamente con ${center.name}.`;
  } else if (hasContact) {
    p3 = `La ficha recoge los datos de contacto y ubicación disponibles. Para conocer el horario exacto, la disponibilidad de plazas, las cuotas y las condiciones de admisión, contacta directamente con ${center.name}.`;
  } else {
    p3 = `Esta ficha incluye la información de ubicación y servicios básicos registrados. Los horarios, las plazas disponibles, las cuotas y las condiciones de admisión deben confirmarse siempre directamente con el propio centro.`;
  }

  return [p1, p2, p3];
}

// ── buildCenterSummary ────────────────────────────────────────────────────────

export function buildCenterSummary(center: Center): string {
  const tipo = TYPE_NOUN[center.type] ?? "centro";
  const adj = OWNERSHIP_ADJ[center.ownership] ?? "privada";
  const { neighborhood, cityName } = center.address;
  const loc = neighborhood ? `en ${neighborhood}, ${cityName}` : `en ${cityName}`;
  const age = ageText(center.ageRange.minMonths, center.ageRange.maxMonths);
  return `${center.name}, ${tipo} ${adj} ${loc}. Primer ciclo de Educación Infantil (${age}). Consulta contacto, servicios y solicita información.`;
}

// ── buildLocationText ─────────────────────────────────────────────────────────

export function buildLocationText(center: Center): string {
  const { street, postalCode, cityName, neighborhood } = center.address;
  let text = neighborhood
    ? `El centro se encuentra en el distrito de ${neighborhood}, ${cityName}.`
    : `El centro se encuentra en ${cityName}.`;

  if (street && postalCode) {
    text += ` La dirección registrada es ${street}, ${postalCode} ${cityName}.`;
  } else if (street) {
    text += ` La dirección registrada es ${street}, ${cityName}.`;
  }

  text +=
    " Antes de acudir, te recomendamos confirmar con el centro el horario de atención y si es posible concertar una visita previa.";
  return text;
}

// ── buildEducationStageText ───────────────────────────────────────────────────

export function buildEducationStageText(center: Center): string {
  const age = ageText(center.ageRange.minMonths, center.ageRange.maxMonths);
  const { minMonths, maxMonths } = center.ageRange;

  let text =
    center.type === "escuela-infantil"
      ? `Según los datos disponibles, ${center.name} es un centro de primer ciclo de Educación Infantil, etapa que comprende habitualmente ${age}.`
      : `Según los datos disponibles, ${center.name} es una guardería de primer ciclo de Educación Infantil, orientada habitualmente a niños y niñas ${age}.`;

  if (maxMonths <= 36) {
    text += " El primer ciclo de Educación Infantil abarca desde el nacimiento hasta los 3 años.";
  } else if (minMonths >= 36) {
    text += " El segundo ciclo de Educación Infantil abarca de los 3 a los 6 años.";
  }

  text +=
    " Confirma siempre las edades admitidas y la disponibilidad de plaza directamente con el centro antes de realizar cualquier gestión.";
  return text;
}

// ── buildServicesText ─────────────────────────────────────────────────────────

export function buildServicesText(center: Center): string {
  if (center.services.length === 0) {
    return `Por ahora no tenemos servicios específicos confirmados para este centro. La ficha se ha elaborado a partir de información pública y puede estar pendiente de verificación. Si representas a ${center.name}, puedes reclamar la ficha para completar datos sobre comedor, horarios, idiomas, instalaciones y actividades.`;
  }

  const svcList = joinList(center.services.map(svcLabel));
  return `Según la información pública disponible, este centro cuenta con: ${svcList}. Otros detalles como horarios concretos, condiciones del servicio o actividades adicionales deben confirmarse directamente con ${center.name}.`;
}

// ── buildScheduleAndAdmissionsText ────────────────────────────────────────────

export function buildScheduleAndAdmissionsText(center: Center): string {
  if (center.schedule) {
    return `El horario registrado para este centro es ${center.schedule}. La disponibilidad de plazas, las cuotas y las condiciones de admisión pueden cambiar durante el curso. Te recomendamos contactar directamente con ${center.name} para confirmar plazas, tarifas y el proceso de admisión vigente.`;
  }
  return `El horario exacto, la disponibilidad de plazas, las cuotas y las condiciones de admisión son datos que cambian con frecuencia durante el curso escolar. Te recomendamos contactar directamente con ${center.name} para confirmar si hay plazas disponibles, conocer las tarifas actuales y, si es posible, concertar una visita antes de tomar una decisión.`;
}

// ── buildContactText ──────────────────────────────────────────────────────────

export interface ContactText {
  intro: string;
  note: string | null;
}

export function buildContactText(center: Center): ContactText {
  const { phone, email, website } = center.contact;
  if (!phone && !email && !website) {
    return {
      intro: `No se dispone de datos de contacto registrados para ${center.name} en esta ficha.`,
      note: "Te recomendamos buscar información a través de fuentes oficiales o acudir a la dirección registrada.",
    };
  }
  return {
    intro: `Contacta directamente con el centro para confirmar disponibilidad de plazas, horario exacto, cuotas y proceso de admisión.`,
    note: website
      ? "La web del centro puede tener información más actualizada sobre el curso vigente."
      : null,
  };
}

// ── buildVerificationText ─────────────────────────────────────────────────────

export interface VerificationText {
  heading: string;
  body: string;
}

export function buildVerificationText(center: Center): VerificationText {
  if (center.isVerified) {
    return {
      heading: "Ficha verificada",
      body: "La información de esta ficha ha sido verificada o confirmada por el propio centro. Si has detectado algún dato incorrecto, puedes comunicárnoslo para revisarlo.",
    };
  }
  return {
    heading: "Ficha pendiente de verificación",
    body: `Esta ficha todavía no ha sido verificada por ${center.name}. La información puede proceder de fuentes públicas y puede no estar completamente actualizada. Si formas parte del equipo del centro, puedes reclamar la ficha para corregir o ampliar los datos.`,
  };
}

// ── buildQuestionsToAsk ───────────────────────────────────────────────────────

export function buildQuestionsToAsk(center: Center): string[] {
  const hasComedor = center.services.includes("comedor");
  const hasHorario = center.services.includes("horario-ampliado");
  const hasBilingue = center.services.includes("bilingue");

  const questions = [
    "¿Hay plazas disponibles para la edad de mi hijo o hija?",
    "¿Cuál es el horario habitual del centro y qué opciones de entrada y salida existen?",
    "¿Cuál es la cuota mensual y hay gastos de matrícula o reserva de plaza?",
    "¿Cómo es el periodo de adaptación y cuánto suele durar?",
    "¿Cuál es el proyecto educativo del centro y qué metodología utilizan?",
    "¿Cuántos niños hay por aula y cuál es la ratio educador/alumno?",
    "¿Cómo se comunica el centro con las familias a lo largo del curso?",
    "¿Es posible visitar el centro antes de confirmar la plaza?",
    "¿Cuál es el calendario escolar y cómo se gestionan las ausencias?",
  ];

  if (!hasComedor) questions.splice(3, 0, "¿El centro ofrece servicio de comedor? ¿Cómo funcionan los menús?");
  if (!hasHorario) questions.push("¿Existe alguna opción de horario ampliado para facilitar la conciliación?");
  if (!hasBilingue) questions.push("¿El centro trabaja en algún idioma adicional además del castellano?");

  return questions.slice(0, 11);
}

// ── buildCenterFaqs ───────────────────────────────────────────────────────────

// Fallback SOLO para centros sin FAQs en base de datos. Máximo 2-3 preguntas
// básicas y honestas, sin preguntar por servicios no confirmados.
// La prioridad (center.faqs de Supabase) se resuelve en la página del centro.
export function buildCenterFaqs(center: Center): FAQItem[] {
  const { neighborhood, cityName } = center.address;
  const hasContact = !!(center.contact.phone || center.contact.email || center.contact.website);
  const hasAge = center.ageRange.maxMonths > 0;

  const faqs: FAQItem[] = [];

  // 1) Ubicación — siempre disponible
  faqs.push({
    question: `¿Dónde está ${center.name}?`,
    answer: neighborhood
      ? `${center.name} está en el distrito de ${neighborhood}, ${cityName}. Puedes consultar la dirección exacta en la ficha y confirmar cualquier detalle directamente con el centro.`
      : `${center.name} está en ${cityName}. Puedes consultar la dirección exacta en la ficha y confirmar cualquier detalle directamente con el centro.`,
  });

  // 2) Edades — solo si hay etapa/edad disponible
  if (hasAge) {
    const age = ageText(center.ageRange.minMonths, center.ageRange.maxMonths);
    faqs.push({
      question: `¿Qué edades atiende ${center.name}?`,
      answer: `Según la información disponible, ${center.name} está orientado al primer ciclo de Educación Infantil, habitualmente ${age}. Conviene confirmar las edades admitidas y la disponibilidad de plaza directamente con el centro.`,
    });
  }

  // 3) Contacto si existe; si no, verificación de la ficha (máx. 3 FAQs)
  if (hasContact) {
    faqs.push({
      question: `¿Cómo puedo contactar con ${center.name}?`,
      answer: buildFaqContactAnswer(center),
    });
  } else {
    faqs.push({
      question: `¿La información de ${center.name} está verificada por el centro?`,
      answer: center.isVerified
        ? `Sí. La ficha de ${center.name} ha sido verificada o confirmada por el propio centro.`
        : `Todavía no. La ficha de ${center.name} no ha sido verificada por el centro: los datos proceden de fuentes públicas y pueden estar incompletos. Si representas al centro, puedes reclamar la ficha para completarla.`,
    });
  }

  return faqs.slice(0, 3);
}

function buildFaqContactAnswer(center: Center): string {
  const { phone, email, website } = center.contact;
  const parts: string[] = [];
  if (phone) parts.push(`llamando al ${phone}`);
  if (email) parts.push(`enviando un correo a ${email}`);
  if (website) parts.push("visitando su web");

  if (parts.length === 0) {
    return `No se dispone de datos de contacto registrados para este centro en la ficha actual. Te recomendamos buscar información a través de fuentes oficiales o acudir a la dirección registrada.`;
  }
  return `Puedes contactar con ${center.name} ${joinList(parts)}. Te recomendamos confirmar siempre la información sobre plazas, horarios y cuotas directamente con el centro.`;
}

// ── buildSimilarCentersIntro ──────────────────────────────────────────────────

export function buildSimilarCentersIntro(center: Center): string {
  const tipoPlural = TYPE_NOUN_PLURAL[center.type] ?? "centros";
  const { neighborhood, cityName } = center.address;
  return neighborhood
    ? `También puedes comparar otras ${tipoPlural} en el distrito de ${neighborhood} o en ${cityName}.`
    : `También puedes comparar otras ${tipoPlural} en ${cityName}.`;
}

// ── getCenterStructuredHighlights ─────────────────────────────────────────────

export interface CenterHighlight {
  label: string;
}

export function getCenterStructuredHighlights(center: Center): CenterHighlight[] {
  const highlights: CenterHighlight[] = [];

  const age = ageText(center.ageRange.minMonths, center.ageRange.maxMonths);
  highlights.push({ label: age.charAt(0).toUpperCase() + age.slice(1) });

  const ownershipLabel: Record<string, string> = {
    publico: "Centro público",
    privado: "Centro privado",
    concertado: "Centro concertado",
  };
  highlights.push({ label: ownershipLabel[center.ownership] ?? "Centro" });

  if (center.address.neighborhood) {
    highlights.push({ label: `Distrito ${center.address.neighborhood}` });
  }

  if (center.services.includes("comedor")) highlights.push({ label: "Comedor" });
  if (center.services.includes("horario-ampliado")) highlights.push({ label: "Horario ampliado" });
  if (center.services.includes("bilingue")) highlights.push({ label: "Bilingüe" });
  if (center.contact.phone) highlights.push({ label: "Teléfono disponible" });

  return highlights.slice(0, 6);
}

// ── buildJsonLd ───────────────────────────────────────────────────────────────

export function buildJsonLd(center: Center): Record<string, unknown> {
  const schemaType = center.type === "guarderia" ? "ChildCare" : "EducationalOrganization";

  const address: Record<string, string> = {
    "@type": "PostalAddress",
    addressLocality: center.address.cityName,
    addressCountry: "ES",
  };
  if (center.address.street) address.streetAddress = center.address.street;
  if (center.address.postalCode) address.postalCode = center.address.postalCode;

  const ld: Record<string, unknown> = {
    "@context": "https://schema.org",
    "@type": schemaType,
    name: center.name,
    address,
  };
  if (center.contact.phone) ld.telephone = center.contact.phone;
  if (center.contact.email) ld.email = center.contact.email;
  if (center.contact.website) ld.url = center.contact.website;

  return ld;
}
