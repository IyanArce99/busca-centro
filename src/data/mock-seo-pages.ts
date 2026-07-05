import type { SeoPage } from "@/types/seo-page";

export const mockSeoPages: SeoPage[] = [
  {
    id: "seo-guarderias-madrid",
    slug: "guarderias-en-madrid",
    title: "Guarderías en Madrid: busca y compara centros | BuscaCentro",
    h1: "Guarderías en Madrid",
    subtitle: "Encuentra guarderías en Madrid por distrito, servicios y horario, y solicita información al centro que mejor encaje con tu familia.",
    metaDescription:
      "Encuentra guarderías en Madrid por distrito, barrio, servicios, titularidad y edades. Consulta fichas con datos públicos, contacto y preguntas frecuentes.",
    filters: { citySlug: "madrid", centerType: "guarderia" },
    introText:
      "Buscar guardería en Madrid suele empezar por una pregunta muy concreta: ¿qué centro me viene bien para conciliar y está cerca de casa o del trabajo? En esta página puedes consultar guarderías repartidas por los distritos de Madrid, filtrar por servicios como comedor u horario ampliado y comparar varias opciones antes de contactar. Cada ficha reúne la información disponible del centro —ubicación, edades, servicios y datos de contacto— para que compares sin dar mil vueltas.",
    sections: [
      {
        heading: "Cómo encontrar guardería en Madrid según tus necesidades",
        paragraphs: [
          "La elección de guardería depende mucho de la logística del día a día: la cercanía al domicilio o al centro de trabajo, el horario de entrada y salida, y si necesitas servicios como comedor o una franja de horario ampliado para llegar a recoger a tu hijo o hija sin agobios. En Madrid, con distritos tan distintos entre sí, merece la pena comparar centros de tu zona antes de decidir.",
          "En BuscaCentro puedes filtrar el listado por servicios concretos y quedarte solo con las guarderías que encajan con lo que buscas. Cuando tengas dos o tres candidatas, lo habitual es contactar con cada centro para confirmar plazas disponibles, cuotas y periodo de adaptación, y a ser posible concertar una visita.",
        ],
      },
      {
        heading: "Qué tener en cuenta al elegir una guardería en Madrid",
        paragraphs: [
          "Más allá del precio, conviene fijarse en la ratio de niños por educador, el proyecto del centro para los más pequeños, cómo gestionan la alimentación y el descanso, y cómo se comunican con las familias durante el curso. Los servicios como comedor con cocina propia, horario ampliado o servicio de madrugadores pueden marcar la diferencia para la conciliación.",
          "La titularidad también influye: en Madrid conviven guarderías privadas, escuelas infantiles públicas de la red municipal o autonómica y centros concertados, cada uno con su propio proceso de admisión. Si te interesa el segundo ciclo o un proyecto educativo más estructurado, quizá te encaje mejor una escuela infantil.",
        ],
      },
    ],
    outroText:
      "Los datos de cada ficha pueden proceder de fuentes públicas o de información facilitada por el propio centro, y pueden estar pendientes de verificación. Antes de decidir, te recomendamos confirmar plazas, horarios y cuotas directamente con la guardería. Si representas un centro de Madrid, puedes reclamar su ficha para mantener sus datos al día.",
    faqs: [
      {
        question: "¿Cómo encuentro una guardería en Madrid con BuscaCentro?",
        answer:
          "Consulta el listado de esta página y usa los filtros para quedarte con las guarderías que ofrecen los servicios que necesitas, como comedor u horario ampliado. Después, abre la ficha del centro que te interese y contacta directamente para confirmar plazas y condiciones.",
      },
      {
        question: "¿Puedo buscar guarderías en Madrid por distrito o barrio?",
        answer:
          "Sí. Cada ficha indica el distrito y la zona del centro, y en la página verás las zonas con centros disponibles. Así puedes centrarte en las guarderías cercanas a tu casa o a tu lugar de trabajo.",
      },
      {
        question: "¿Hay guarderías con comedor u horario ampliado en Madrid?",
        answer:
          "Sí. Varios centros del directorio ofrecen comedor y horario ampliado para facilitar la conciliación. Puedes filtrar el listado por estos servicios y revisar el detalle en la ficha de cada guardería.",
      },
      {
        question: "¿Qué datos puedo consultar en la ficha de cada guardería?",
        answer:
          "Cada ficha reúne la información disponible del centro: ubicación y zona, edades admitidas, servicios registrados y datos de contacto. Los datos pueden proceder de fuentes públicas o del propio centro, por lo que conviene confirmarlos antes de decidir.",
      },
      {
        question: "¿Cómo puede un centro actualizar o reclamar su ficha?",
        answer:
          "Si representas una guardería, puedes reclamar su ficha para corregir y actualizar servicios, horarios y datos de contacto. Si el centro todavía no aparece, puedes añadirlo desde el formulario para centros.",
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
    title: "Escuelas infantiles en Madrid: centros 0-3 años | BuscaCentro",
    h1: "Escuelas infantiles en Madrid",
    subtitle: "Consulta escuelas infantiles y centros de educación infantil en Madrid por titularidad, etapa y servicios educativos.",
    metaDescription:
      "Busca escuelas infantiles en Madrid y centros de educación infantil por zona, titularidad, servicios y etapa educativa. Consulta fichas y datos de contacto.",
    filters: { citySlug: "madrid", centerType: "escuela-infantil" },
    introText:
      "Las escuelas infantiles de Madrid forman parte de la red de centros de primer ciclo de Educación Infantil, la etapa dirigida a niños y niñas de 0 a 3 años. En esta página puedes consultar escuelas infantiles de titularidad pública, privada o concertada repartidas por los distritos de Madrid, con información sobre su ubicación, servicios y datos de contacto para orientar tu decisión.",
    sections: [
      {
        heading: "Qué es una escuela infantil y qué etapa cubre",
        paragraphs: [
          "En España, la escuela infantil se asocia al primer ciclo de Educación Infantil (0-3 años), una etapa educativa —no meramente asistencial— con un proyecto pedagógico propio. Algunos centros integran también el segundo ciclo (3-6 años). La denominación concreta y las etapas autorizadas dependen de la Comunidad de Madrid y de la autorización de cada centro.",
          "Frente a la idea más informal de 'guardería', la escuela infantil pone el foco en el desarrollo, la socialización y la estimulación temprana dentro de un marco educativo reglado. Por eso conviene fijarse en el proyecto del centro y en cómo lo aplica en el día a día.",
        ],
      },
      {
        heading: "Titularidad: escuelas infantiles municipales, privadas y concertadas",
        paragraphs: [
          "En Madrid encontrarás escuelas infantiles de la red pública (municipal o autonómica), centros privados y centros concertados. La titularidad condiciona el proceso de admisión: en los centros públicos, la asignación de plaza se gestiona habitualmente a través del proceso oficial de escolarización de la Comunidad de Madrid, mientras que en los privados la admisión se acuerda directamente con el centro.",
          "Cada ficha del directorio indica la titularidad cuando el dato está disponible, junto con los servicios educativos registrados. Ten en cuenta que parte de esta información procede de fuentes públicas y puede estar pendiente de verificación por el propio centro.",
        ],
      },
    ],
    outroText:
      "La información de cada escuela infantil puede proceder de registros y fuentes públicas o de datos facilitados por el propio centro, y puede requerir confirmación. Para conocer el proyecto educativo, las plazas y el proceso de admisión, contacta directamente con el centro. Si representas una escuela infantil de Madrid, puedes reclamar su ficha para completarla.",
    faqs: [
      {
        question: "¿Qué diferencia hay entre una guardería y una escuela infantil en Madrid?",
        answer:
          "El término escuela infantil hace referencia a un centro de educación infantil con proyecto pedagógico, habitualmente del primer ciclo (0-3 años) y en algunos casos hasta los 6. 'Guardería' es una denominación más coloquial. En la práctica muchos centros comparten funciones, pero la escuela infantil enfatiza la dimensión educativa.",
      },
      {
        question: "¿Qué edades atienden las escuelas infantiles en Madrid?",
        answer:
          "La mayoría atiende el primer ciclo de Educación Infantil, de 0 a 3 años. Algunos centros amplían su oferta al segundo ciclo (3-6 años). La etapa exacta figura en la ficha de cada centro y depende de su autorización educativa.",
      },
      {
        question: "¿Hay escuelas infantiles municipales y privadas en Madrid?",
        answer:
          "Sí. En Madrid conviven escuelas infantiles de titularidad pública (municipales o autonómicas), privadas y concertadas. Cada una tiene su propio proceso de admisión, que puedes consultar contactando con el centro.",
      },
      {
        question: "¿Qué servicios educativos pueden aparecer en la ficha de un centro?",
        answer:
          "Según los datos disponibles, una ficha puede incluir servicios como comedor, horario ampliado, iniciación al inglés o programa bilingüe, psicomotricidad, música o patio exterior. Conviene confirmarlos directamente, ya que pueden variar por curso.",
      },
      {
        question: "¿Cómo se verifica la información de las escuelas infantiles?",
        answer:
          "Parte de la información procede de fuentes públicas oficiales y puede estar pendiente de verificación. Los centros pueden reclamar su ficha para confirmar y actualizar sus datos, lo que ayuda a mantener el directorio fiable.",
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
    subtitle: "Centros con introducción a un segundo idioma o programa bilingüe en Madrid.",
    metaDescription: "Guarderías bilingües en Madrid: compara centros con programa en inglés y solicita información sin compromiso.",
    filters: { citySlug: "madrid", centerType: "guarderia", service: "bilingue" },
    introText:
      "Cada vez más familias buscan centros con introducción temprana a un segundo idioma. Aquí puedes consultar guarderías en Madrid que ofrecen programa bilingüe o iniciación al inglés, según los datos disponibles en cada ficha. El enfoque, las horas de exposición al idioma y la metodología varían mucho de un centro a otro.",
    outroText:
      "Solicita información directamente a cada centro para conocer el detalle de su programa bilingüe: horas de exposición al idioma, metodología y perfil del profesorado. Los datos de la ficha pueden estar pendientes de verificación.",
    faqs: [
      {
        question: "¿En qué consiste el programa bilingüe de estas guarderías?",
        answer:
          "Cada centro define su propio enfoque bilingüe. Te recomendamos solicitar información directamente para conocer las horas de exposición al idioma, la metodología y si el profesorado es nativo o bilingüe.",
      },
      {
        question: "¿A partir de qué edad se introduce el segundo idioma?",
        answer:
          "Depende del proyecto de cada centro. Algunos inician la exposición al inglés desde el primer ciclo con canciones, rutinas y juego, mientras que otros lo estructuran más adelante. Confírmalo en la ficha o directamente con la guardería.",
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
    subtitle: "Centros con servicio de comedor en Madrid para facilitar el día a día de las familias.",
    metaDescription: "Guarderías en Madrid con servicio de comedor. Compara centros, consulta sus fichas y solicita información.",
    filters: { citySlug: "madrid", centerType: "guarderia", service: "comedor" },
    introText:
      "El comedor es uno de los servicios que más pesa a la hora de elegir guardería, sobre todo para conciliar. En esta página puedes consultar guarderías en Madrid que cuentan con servicio de comedor, según los datos disponibles en cada ficha. La gestión del menú varía: algunos centros tienen cocina propia y otros trabajan con catering externo.",
    outroText:
      "Confirma con cada centro el tipo de menú, cómo gestionan alergias e intolerancias y si el comedor es de cocina propia o catering. Los datos de la ficha pueden estar pendientes de verificación.",
    faqs: [
      {
        question: "¿Todas las guarderías de esta página tienen comedor?",
        answer:
          "Este listado muestra guarderías en Madrid en cuya ficha consta el servicio de comedor según los datos disponibles. Te recomendamos confirmarlo con el centro, ya que la disponibilidad y el tipo de gestión pueden cambiar por curso.",
      },
      {
        question: "¿Puedo saber si el comedor es de cocina propia o catering?",
        answer:
          "Cuando el dato está disponible, la ficha del centro puede indicar si cuenta con cocina propia. Para el detalle exacto del menú y la gestión de alergias, lo mejor es contactar directamente con la guardería.",
      },
    ],
  },
  {
    id: "seo-guarderias-horario-ampliado-madrid",
    slug: "guarderias-con-horario-ampliado-en-madrid",
    title: "Guarderías con horario ampliado en Madrid | BuscaCentro",
    h1: "Guarderías con horario ampliado en Madrid",
    subtitle: "Centros con horario ampliado o servicio de madrugadores en Madrid para ayudarte a conciliar.",
    metaDescription: "Guarderías en Madrid con horario ampliado. Compara centros con franjas flexibles y solicita información.",
    filters: { citySlug: "madrid", centerType: "guarderia", service: "horario-ampliado" },
    introText:
      "Cuando los horarios de trabajo no encajan con el horario habitual del centro, el horario ampliado marca la diferencia. Aquí puedes consultar guarderías en Madrid que ofrecen franjas ampliadas de entrada o salida —o servicio de madrugadores— para ayudarte a conciliar la vida laboral y familiar, según los datos de cada ficha.",
    outroText:
      "El horario exacto, las franjas disponibles y su coste pueden variar según el centro; confírmalo antes de solicitar plaza. Los datos de la ficha pueden estar pendientes de verificación.",
    faqs: [
      {
        question: "¿Qué se considera horario ampliado en una guardería?",
        answer:
          "Suele referirse a franjas de entrada anticipada (servicio de madrugadores) o de salida más tarde de lo habitual, pensadas para familias que necesitan flexibilidad para conciliar. Cada centro define sus franjas y condiciones.",
      },
      {
        question: "¿El horario ampliado tiene un coste adicional?",
        answer:
          "En muchos centros el horario ampliado es un servicio opcional con un coste añadido, pero varía de una guardería a otra. Confirma el precio y las condiciones directamente con el centro.",
      },
    ],
  },
];
