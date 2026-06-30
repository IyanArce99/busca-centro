import type { FAQItem } from "@/types/faq";

export const homeFaqs: FAQItem[] = [
  {
    question: "¿Qué es BuscaCentro?",
    answer:
      "BuscaCentro es un directorio donde las familias pueden comparar guarderías y escuelas infantiles por ciudad, zona y servicios, y solicitar información directamente a cada centro.",
  },
  {
    question: "¿Los datos de los centros están verificados?",
    answer:
      "Parte de la información puede proceder de fuentes públicas o de datos facilitados por el propio centro. Si representas un centro, puedes reclamar su ficha para mantenerla actualizada.",
  },
  {
    question: "¿BuscaCentro gestiona la matrícula o el pago de la plaza?",
    answer:
      "No. BuscaCentro ayuda a comparar opciones y a contactar con los centros; la gestión de plazas, matrícula y pagos se realiza directamente con cada centro.",
  },
];

export const guarderiasFaqs: FAQItem[] = [
  {
    question: "¿A partir de qué edad admiten las guarderías?",
    answer:
      "La mayoría de guarderías admiten bebés a partir de los 3-4 meses, aunque cada centro establece su propia política de admisión.",
  },
  {
    question: "¿Cómo elijo entre varias guarderías?",
    answer:
      "Te recomendamos comparar ubicación, horarios, servicios como comedor o horario ampliado, y visitar el centro antes de decidir.",
  },
];

export const escuelasInfantilesFaqs: FAQItem[] = [
  {
    question: "¿Las escuelas infantiles cubren el segundo ciclo (3-6 años)?",
    answer:
      "Muchas escuelas infantiles atienden de 0 a 6 años, combinando primer y segundo ciclo, aunque esto depende de cada centro y de su autorización educativa.",
  },
  {
    question: "¿Las escuelas infantiles son siempre públicas?",
    answer:
      "No, existen escuelas infantiles públicas, concertadas y privadas. Puedes filtrar por este criterio en cada ficha.",
  },
];

export const paraCentrosFaqs: FAQItem[] = [
  {
    question: "¿Cómo añado mi centro al directorio?",
    answer: "Puedes usar el formulario de 'Añadir centro' para enviarnos los datos básicos de tu guardería o escuela infantil.",
  },
  {
    question: "¿Cómo reclamo la ficha de mi centro?",
    answer:
      "Si tu centro ya aparece en el directorio, usa el formulario de 'Reclamar ficha' indicando tu cargo y un email corporativo para verificar la solicitud.",
  },
  {
    question: "¿Tiene algún coste aparecer en el directorio?",
    answer: "El alta básica en el directorio no tiene coste durante esta fase inicial del proyecto.",
  },
];
