import type { SeoPage } from "@/types/seo-page";

export const mockSeoPages: SeoPage[] = [
  {
    id: "seo-guarderias-madrid",
    slug: "guarderias-en-madrid",
    title: "Guarderías en Madrid | BuscaCentro",
    h1: "Guarderías en Madrid",
    subtitle: "Compara guarderías por barrio, servicios y horario en Madrid.",
    metaDescription:
      "Directorio de guarderías en Madrid: comedor, horario ampliado, bilingües y más. Compara opciones y solicita información.",
    filters: { citySlug: "madrid", centerType: "guarderia" },
    introText:
      "Madrid cuenta con una amplia red de guarderías y escuelas infantiles repartidas por sus distritos. Aquí puedes consultar los centros añadidos recientemente al directorio, filtrar por servicios como comedor u horario ampliado, y comparar varias opciones antes de decidir.",
    outroText:
      "Recuerda que los datos mostrados pueden proceder de fuentes públicas o de información facilitada por el propio centro. Si necesitas más detalles, solicita información directamente desde la ficha de cada guardería.",
    faqs: [
      {
        question: "¿Cuántas guarderías hay disponibles en Madrid en este directorio?",
        answer:
          "El número de centros varía según se actualiza el directorio. Puedes ver el listado completo y filtrar por barrio o servicios en esta misma página.",
      },
      {
        question: "¿Puedo filtrar las guarderías de Madrid por horario ampliado o comedor?",
        answer:
          "Sí, usa los filtros visuales de esta página para ver solo los centros que ofrecen comedor, horario ampliado u otros servicios concretos.",
      },
    ],
  },
  {
    id: "seo-guarderias-barcelona",
    slug: "guarderias-en-barcelona",
    title: "Guarderías en Barcelona | BuscaCentro",
    h1: "Guarderías en Barcelona",
    subtitle: "Encuentra guarderías y llars d'infants por barrio en Barcelona.",
    metaDescription:
      "Directorio de guarderías en Barcelona con filtros por servicios y zona. Compara centros y solicita información.",
    filters: { citySlug: "barcelona", centerType: "guarderia" },
    introText:
      "En Barcelona conviven guarderías privadas, llars d'infants y centros concertados distribuidos por toda la ciudad. Consulta el listado de centros añadidos recientemente y compara servicios antes de solicitar información.",
    outroText:
      "La información de cada ficha puede proceder de fuentes públicas o del propio centro. Si representas un centro de Barcelona, puedes reclamar su ficha para mantenerla actualizada.",
    faqs: [
      {
        question: "¿Hay guarderías bilingües en Barcelona?",
        answer:
          "Sí, varios centros del directorio ofrecen programas bilingües. Puedes consultarlos en la sección de guarderías bilingües en Barcelona.",
      },
    ],
  },
  {
    id: "seo-guarderias-valencia",
    slug: "guarderias-en-valencia",
    title: "Guarderías en Valencia | BuscaCentro",
    h1: "Guarderías en Valencia",
    subtitle: "Compara guarderías por barrio y servicios en Valencia.",
    metaDescription:
      "Directorio de guarderías en Valencia: comedor, horario ampliado y centros bilingües. Compara y solicita información.",
    filters: { citySlug: "valencia", centerType: "guarderia" },
    introText:
      "Valencia ofrece centros de educación infantil en barrios como Ruzafa, Benimaclet o Campanar. Revisa el listado y compara servicios antes de contactar con cada centro.",
    outroText:
      "Si formas parte de un centro y detectas datos desactualizados, puedes solicitar la actualización o reclamar la ficha.",
    faqs: [
      {
        question: "¿Cómo solicito información a una guardería de Valencia?",
        answer: "Desde la ficha de cada centro puedes rellenar el formulario de solicitud de información.",
      },
    ],
  },
  {
    id: "seo-guarderias-sevilla",
    slug: "guarderias-en-sevilla",
    title: "Guarderías en Sevilla | BuscaCentro",
    h1: "Guarderías en Sevilla",
    subtitle: "Guarderías por barrio y servicios en Sevilla.",
    metaDescription: "Directorio de guarderías en Sevilla con datos actualizados y filtros por servicios.",
    filters: { citySlug: "sevilla", centerType: "guarderia" },
    introText:
      "Consulta guarderías de barrios como Triana, Nervión o Los Remedios en Sevilla, y compara comedor, horario ampliado y otros servicios.",
    outroText: "Los datos mostrados pueden proceder de fuentes públicas o del propio centro.",
    faqs: [
      {
        question: "¿El directorio incluye guarderías públicas y privadas en Sevilla?",
        answer: "Sí, el listado combina centros públicos, privados y concertados cuando hay datos disponibles.",
      },
    ],
  },
  {
    id: "seo-guarderias-zaragoza",
    slug: "guarderias-en-zaragoza",
    title: "Guarderías en Zaragoza | BuscaCentro",
    h1: "Guarderías en Zaragoza",
    subtitle: "Centros de educación infantil en Zaragoza.",
    metaDescription: "Directorio de guarderías en Zaragoza con datos actualizados recientemente.",
    filters: { citySlug: "zaragoza", centerType: "guarderia" },
    introText: "El directorio en Zaragoza está en crecimiento. Consulta los centros añadidos recientemente.",
    outroText: "¿Conoces un centro en Zaragoza que no aparece en el listado? Puedes añadirlo desde nuestro formulario.",
    faqs: [],
  },
  {
    id: "seo-guarderias-malaga",
    slug: "guarderias-en-malaga",
    title: "Guarderías en Málaga | BuscaCentro",
    h1: "Guarderías en Málaga",
    subtitle: "Centros de educación infantil en Málaga.",
    metaDescription: "Directorio de guarderías en Málaga con datos actualizados recientemente.",
    filters: { citySlug: "malaga", centerType: "guarderia" },
    introText: "El directorio en Málaga está en crecimiento. Consulta los centros añadidos recientemente.",
    outroText: "¿Representas un centro en Málaga? Puedes añadirlo desde nuestro formulario.",
    faqs: [],
  },
  {
    id: "seo-guarderias-bilbao",
    slug: "guarderias-en-bilbao",
    title: "Guarderías en Bilbao | BuscaCentro",
    h1: "Guarderías en Bilbao",
    subtitle: "Centros de educación infantil en Bilbao.",
    metaDescription: "Directorio de guarderías en Bilbao con datos actualizados recientemente.",
    filters: { citySlug: "bilbao", centerType: "guarderia" },
    introText: "El directorio en Bilbao está en crecimiento. Todavía no hay centros añadidos en esta ciudad.",
    outroText: "¿Conoces un centro en Bilbao? Puedes añadirlo desde nuestro formulario.",
    faqs: [],
  },
  {
    id: "seo-guarderias-alicante",
    slug: "guarderias-en-alicante",
    title: "Guarderías en Alicante | BuscaCentro",
    h1: "Guarderías en Alicante",
    subtitle: "Centros de educación infantil en Alicante.",
    metaDescription: "Directorio de guarderías en Alicante con datos actualizados recientemente.",
    filters: { citySlug: "alicante", centerType: "guarderia" },
    introText: "El directorio en Alicante está en crecimiento. Todavía no hay centros añadidos en esta ciudad.",
    outroText: "¿Conoces un centro en Alicante? Puedes añadirlo desde nuestro formulario.",
    faqs: [],
  },
  {
    id: "seo-escuelas-infantiles-madrid",
    slug: "escuelas-infantiles-en-madrid",
    title: "Escuelas infantiles en Madrid | BuscaCentro",
    h1: "Escuelas infantiles en Madrid",
    subtitle: "Escuelas infantiles de 0 a 6 años en Madrid.",
    metaDescription: "Directorio de escuelas infantiles en Madrid con servicios, horarios y datos de contacto.",
    filters: { citySlug: "madrid", centerType: "escuela-infantil" },
    introText:
      "Las escuelas infantiles en Madrid suelen atender de 0 a 6 años, combinando el primer y segundo ciclo de educación infantil. Compara centros concertados y privados por barrio.",
    outroText: "Los datos mostrados pueden proceder de fuentes públicas o del propio centro.",
    faqs: [
      {
        question: "¿Qué diferencia hay entre guardería y escuela infantil en Madrid?",
        answer:
          "En general, una escuela infantil suele cubrir de 0 a 6 años y puede estar adscrita a un proyecto educativo más amplio, mientras que una guardería suele centrarse en el primer ciclo (0-3 años). La denominación exacta varía según el centro.",
      },
    ],
  },
  {
    id: "seo-escuelas-infantiles-barcelona",
    slug: "escuelas-infantiles-en-barcelona",
    title: "Escuelas infantiles en Barcelona | BuscaCentro",
    h1: "Escuelas infantiles en Barcelona",
    subtitle: "Escuelas infantiles y llars d'infants en Barcelona.",
    metaDescription: "Directorio de escuelas infantiles en Barcelona con servicios y datos de contacto.",
    filters: { citySlug: "barcelona", centerType: "escuela-infantil" },
    introText: "Consulta escuelas infantiles y llars d'infants en distintos barrios de Barcelona.",
    outroText: "Los datos mostrados pueden proceder de fuentes públicas o del propio centro.",
    faqs: [],
  },
  {
    id: "seo-escuelas-infantiles-valencia",
    slug: "escuelas-infantiles-en-valencia",
    title: "Escuelas infantiles en Valencia | BuscaCentro",
    h1: "Escuelas infantiles en Valencia",
    subtitle: "Escuelas infantiles de 0 a 6 años en Valencia.",
    metaDescription: "Directorio de escuelas infantiles en Valencia con servicios y datos de contacto.",
    filters: { citySlug: "valencia", centerType: "escuela-infantil" },
    introText: "Consulta escuelas infantiles en barrios como El Carmen o Campanar en Valencia.",
    outroText: "Los datos mostrados pueden proceder de fuentes públicas o del propio centro.",
    faqs: [],
  },
  {
    id: "seo-escuelas-infantiles-sevilla",
    slug: "escuelas-infantiles-en-sevilla",
    title: "Escuelas infantiles en Sevilla | BuscaCentro",
    h1: "Escuelas infantiles en Sevilla",
    subtitle: "Escuelas infantiles de 0 a 6 años en Sevilla.",
    metaDescription: "Directorio de escuelas infantiles en Sevilla con servicios y datos de contacto.",
    filters: { citySlug: "sevilla", centerType: "escuela-infantil" },
    introText: "Consulta escuelas infantiles en barrios como Nervión en Sevilla.",
    outroText: "Los datos mostrados pueden proceder de fuentes públicas o del propio centro.",
    faqs: [],
  },
  {
    id: "seo-escuelas-infantiles-zaragoza",
    slug: "escuelas-infantiles-en-zaragoza",
    title: "Escuelas infantiles en Zaragoza | BuscaCentro",
    h1: "Escuelas infantiles en Zaragoza",
    subtitle: "Escuelas infantiles de 0 a 6 años en Zaragoza.",
    metaDescription: "Directorio de escuelas infantiles en Zaragoza con servicios y datos de contacto.",
    filters: { citySlug: "zaragoza", centerType: "escuela-infantil" },
    introText: "El directorio en Zaragoza está en crecimiento. Consulta las escuelas infantiles añadidas recientemente.",
    outroText: "Los datos mostrados pueden proceder de fuentes públicas o del propio centro.",
    faqs: [],
  },
  {
    id: "seo-escuelas-infantiles-malaga",
    slug: "escuelas-infantiles-en-malaga",
    title: "Escuelas infantiles en Málaga | BuscaCentro",
    h1: "Escuelas infantiles en Málaga",
    subtitle: "Escuelas infantiles de 0 a 6 años en Málaga.",
    metaDescription: "Directorio de escuelas infantiles en Málaga con datos actualizados recientemente.",
    filters: { citySlug: "malaga", centerType: "escuela-infantil" },
    introText: "El directorio en Málaga está en crecimiento. Todavía no hay escuelas infantiles añadidas en esta ciudad.",
    outroText: "¿Conoces una escuela infantil en Málaga? Puedes añadirla desde nuestro formulario.",
    faqs: [],
  },
  {
    id: "seo-guarderias-bilingues-madrid",
    slug: "guarderias-bilingues-en-madrid",
    title: "Guarderías bilingües en Madrid | BuscaCentro",
    h1: "Guarderías bilingües en Madrid",
    subtitle: "Centros con programa bilingüe español-inglés en Madrid.",
    metaDescription: "Guarderías bilingües en Madrid: compara centros con programa en inglés y solicita información.",
    filters: { citySlug: "madrid", centerType: "guarderia", service: "bilingue" },
    introText:
      "Cada vez más familias buscan centros con introducción temprana a un segundo idioma. Aquí puedes consultar guarderías en Madrid que ofrecen programa bilingüe, según los datos disponibles en cada ficha.",
    outroText: "Solicita información directamente a cada centro para conocer el detalle exacto de su programa bilingüe.",
    faqs: [
      {
        question: "¿En qué consiste el programa bilingüe de estas guarderías?",
        answer:
          "Cada centro define su propio enfoque bilingüe. Te recomendamos solicitar información directamente para conocer las horas de exposición al idioma y la metodología empleada.",
      },
    ],
  },
  {
    id: "seo-guarderias-bilingues-barcelona",
    slug: "guarderias-bilingues-en-barcelona",
    title: "Guarderías bilingües en Barcelona | BuscaCentro",
    h1: "Guarderías bilingües en Barcelona",
    subtitle: "Centros con programa bilingüe en Barcelona.",
    metaDescription: "Guarderías bilingües en Barcelona: compara centros y solicita información.",
    filters: { citySlug: "barcelona", centerType: "guarderia", service: "bilingue" },
    introText: "Consulta guarderías en Barcelona con programa bilingüe según los datos disponibles en cada ficha.",
    outroText: "Solicita información directamente a cada centro para conocer el detalle de su programa.",
    faqs: [],
  },
  {
    id: "seo-guarderias-privadas-madrid",
    slug: "guarderias-privadas-en-madrid",
    title: "Guarderías privadas en Madrid | BuscaCentro",
    h1: "Guarderías privadas en Madrid",
    subtitle: "Centros de titularidad privada en Madrid.",
    metaDescription: "Directorio de guarderías privadas en Madrid con servicios y datos de contacto.",
    filters: { citySlug: "madrid", centerType: "guarderia", ownership: "privado" },
    introText:
      "Las guarderías privadas suelen ofrecer mayor flexibilidad de horarios y servicios adicionales. Compara las opciones disponibles en Madrid.",
    outroText: "Los precios y plazas disponibles pueden variar; te recomendamos confirmarlos directamente con el centro.",
    faqs: [],
    // Temporarily disabled: most Madrid guarderías are private so this page
    // would be nearly identical to /guarderias-en-madrid. Re-enable once we
    // can confirm it offers meaningful differential content.
    disabled: true,
  },
  {
    id: "seo-guarderias-comedor-madrid",
    slug: "guarderias-con-comedor-en-madrid",
    title: "Guarderías con comedor en Madrid | BuscaCentro",
    h1: "Guarderías con comedor en Madrid",
    subtitle: "Centros con servicio de comedor propio en Madrid.",
    metaDescription: "Guarderías en Madrid con servicio de comedor. Compara centros y solicita información.",
    filters: { citySlug: "madrid", centerType: "guarderia", service: "comedor" },
    introText: "Consulta guarderías en Madrid que cuentan con servicio de comedor, según los datos disponibles en cada ficha.",
    outroText: "Confirma con cada centro el tipo de menú y la gestión del servicio de comedor.",
    faqs: [],
  },
  {
    id: "seo-guarderias-horario-ampliado-madrid",
    slug: "guarderias-con-horario-ampliado-en-madrid",
    title: "Guarderías con horario ampliado en Madrid | BuscaCentro",
    h1: "Guarderías con horario ampliado en Madrid",
    subtitle: "Centros con horario ampliado para facilitar la conciliación en Madrid.",
    metaDescription: "Guarderías en Madrid con horario ampliado. Compara centros y solicita información.",
    filters: { citySlug: "madrid", centerType: "guarderia", service: "horario-ampliado" },
    introText:
      "Si necesitas un centro con horario ampliado para conciliar la vida laboral y familiar, consulta este listado de guarderías en Madrid.",
    outroText: "El horario exacto puede variar según el centro; confírmalo antes de solicitar plaza.",
    faqs: [],
  },
];
