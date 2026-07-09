import type { SeoPage } from "@/types/seo-page";

export const mockSeoPages: SeoPage[] = [
  {
    id: "seo-guarderias-madrid",
    slug: "guarderias-en-madrid",
    title: "Guarderías en Madrid: busca y compara centros",
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
    title: "Guarderías en Barcelona",
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
    title: "Guarderías en Valencia",
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
    title: "Guarderías en Sevilla",
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
    title: "Guarderías en Zaragoza",
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
    title: "Guarderías en Málaga",
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
    title: "Guarderías en Bilbao",
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
    title: "Guarderías en Alicante",
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
    title: "Escuelas infantiles en Madrid: centros 0-3 años",
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
    title: "Escuelas infantiles en Barcelona",
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
    title: "Escuelas infantiles en Valencia",
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
    title: "Escuelas infantiles en Sevilla",
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
    title: "Escuelas infantiles en Zaragoza",
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
    title: "Escuelas infantiles en Málaga",
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
    title: "Guarderías bilingües en Madrid",
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
    title: "Guarderías bilingües en Barcelona",
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
    title: "Guarderías privadas en Madrid",
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
    title: "Guarderías con comedor en Madrid",
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
    title: "Guarderías con horario ampliado en Madrid",
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
  {
    id: "seo-guarderias-comedor-barcelona",
    slug: "guarderias-con-comedor-en-barcelona",
    title: "Guarderías con comedor en Barcelona: busca y compara centros",
    h1: "Guarderías con comedor en Barcelona",
    subtitle:
      "Guarderías y llars d'infants en Barcelona con servicio de comedor, muchas de ellas con cocina propia, para facilitar el día a día de las familias.",
    metaDescription:
      "Guarderías en Barcelona con servicio de comedor. Compara centros con cocina propia, consulta sus fichas y solicita información sin compromiso.",
    filters: { citySlug: "barcelona", centerType: "guarderia", service: "comedor" },
    introText:
      "El comedor es uno de los servicios que más pesa a la hora de elegir guardería en Barcelona, sobre todo para conciliar el horario laboral con el del centro. En esta página puedes consultar guarderías y llars d'infants de la ciudad en cuya ficha consta el servicio de comedor, según los datos disponibles. Una parte importante de estos centros gestiona el menú con cocina propia, elaborando la comida en las mismas instalaciones en lugar de recurrir a catering externo.",
    sections: [
      {
        heading: "Cocina propia frente a catering en las guarderías de Barcelona",
        paragraphs: [
          "Entre las guarderías de este listado, muchas destacan específicamente que preparan el menú diario en su propia cocina, un aspecto que las familias suelen valorar por el control directo sobre los ingredientes y la posibilidad de adaptar el menú a alergias o intolerancias concretas. Otros centros trabajan con catering externo, una fórmula igualmente habitual entre las guarderías que no disponen de cocina propia en el mismo edificio.",
          "Antes de decidir, conviene preguntar directamente al centro cómo gestiona los menús especiales, si hay opción de dieta sin gluten o sin lactosa, y si el precio del comedor está incluido en la cuota mensual o se factura aparte.",
        ],
      },
    ],
    outroText:
      "Confirma con cada centro el tipo de menú, cómo gestionan alergias e intolerancias y si el comedor es de cocina propia o catering. Los datos de la ficha pueden proceder de fuentes públicas o del propio centro y estar pendientes de verificación.",
    faqs: [
      {
        question: "¿Todas las guarderías de esta página tienen comedor?",
        answer:
          "Este listado muestra guarderías en Barcelona en cuya ficha consta el servicio de comedor según los datos disponibles. Te recomendamos confirmarlo con el centro, ya que la disponibilidad y el tipo de gestión pueden cambiar por curso.",
      },
      {
        question: "¿Cuántas de estas guarderías tienen cocina propia?",
        answer:
          "Una parte significativa de los centros de este listado indica en su ficha que elabora los menús con cocina propia. Puedes comprobarlo en la descripción de cada centro y confirmarlo directamente antes de solicitar plaza.",
      },
      {
        question: "¿Puedo consultar el menú antes de matricular a mi hijo o hija?",
        answer:
          "La mayoría de los centros facilita el menú semanal o mensual si lo solicitas directamente. Es buen momento también para preguntar por la gestión de alergias e intolerancias alimentarias.",
      },
    ],
  },
  {
    id: "seo-escuelas-infantiles-comedor-barcelona",
    slug: "escuelas-infantiles-con-comedor-en-barcelona",
    title: "Escuelas infantiles con comedor en Barcelona: busca y compara centros",
    h1: "Escuelas infantiles con comedor en Barcelona",
    subtitle:
      "Escoles bressol municipales y escuelas infantiles privadas en Barcelona con servicio de comedor y cocina propia.",
    metaDescription:
      "Escuelas infantiles y escoles bressol en Barcelona con comedor. Consulta horarios, cocina propia y datos de contacto de cada centro.",
    filters: { citySlug: "barcelona", centerType: "escuela-infantil", service: "comedor" },
    introText:
      "La gran mayoría de escoles bressol municipales de Barcelona ofrece comedor con cocina propia como parte de su funcionamiento habitual, y muchas escuelas infantiles privadas siguen el mismo modelo. En esta página puedes consultar escuelas infantiles de la ciudad con servicio de comedor, según los datos disponibles en cada ficha, ya sean de titularidad pública, privada o concertada.",
    sections: [
      {
        heading: "El comedor en las escoles bressol municipales de Barcelona",
        paragraphs: [
          "Las escoles bressol municipales gestionadas por el Institut Municipal d'Educació de Barcelona (IMEB) preparan habitualmente el menú diario con cocina propia en el mismo centro, dentro de un horario que suele ir de 8:00 a 17:00 horas entre semana. El acceso a estas plazas se realiza mediante el proceso anual de preinscripción municipal, con una cuota pública que puede tener bonificaciones según la renta familiar.",
          "En las escuelas infantiles privadas y concertadas, el funcionamiento del comedor varía más de un centro a otro: algunas cuentan también con cocina propia, mientras que otras recurren a catering externo. Conviene revisar la ficha de cada centro y confirmar el detalle directamente antes de matricular.",
        ],
      },
    ],
    outroText:
      "Confirma con cada centro el tipo de menú, la gestión de alergias e intolerancias y si el comedor está incluido en la cuota o se paga aparte. Los datos de la ficha pueden proceder de fuentes públicas o del propio centro y estar pendientes de verificación.",
    faqs: [
      {
        question: "¿Las escoles bressol municipales de Barcelona tienen todas comedor?",
        answer:
          "La mayoría de las escoles bressol municipales de Barcelona incluidas en este directorio cuenta con servicio de comedor y cocina propia, según los datos del Institut Municipal d'Educació de Barcelona. Puedes confirmarlo en la ficha de cada centro.",
      },
      {
        question: "¿El comedor está incluido en la cuota de la escola bressol municipal?",
        answer:
          "Las cuotas de las escoles bressol municipales, incluido el comedor, siguen los precios públicos vigentes y pueden tener bonificaciones según la renta familiar. Te recomendamos confirmar el importe exacto con el centro o en los canales oficiales del Ayuntamiento de Barcelona.",
      },
      {
        question: "¿Y en las escuelas infantiles privadas o concertadas?",
        answer:
          "El funcionamiento y el coste del comedor en centros privados o concertados varían según el centro. Algunos gestionan la comida con cocina propia y otros con catering externo; confírmalo directamente con la escuela.",
      },
    ],
  },
  {
    id: "seo-guarderias-horario-ampliado-barcelona",
    slug: "guarderias-con-horario-ampliado-en-barcelona",
    title: "Guarderías con horario ampliado en Barcelona",
    h1: "Guarderías con horario ampliado en Barcelona",
    subtitle: "Centros con horario ampliado o servicio de madrugadores en Barcelona para ayudarte a conciliar.",
    metaDescription:
      "Guarderías en Barcelona con horario ampliado. Compara centros con franjas flexibles de entrada y salida y solicita información.",
    filters: { citySlug: "barcelona", centerType: "guarderia", service: "horario-ampliado" },
    introText:
      "Cuando el horario laboral no encaja con el horario habitual del centro, contar con una franja ampliada de entrada o salida marca la diferencia. Aquí puedes consultar guarderías y llars d'infants en Barcelona que ofrecen horario ampliado, según los datos disponibles en cada ficha.",
    outroText:
      "El horario exacto, las franjas disponibles y su coste pueden variar según el centro; confírmalo antes de solicitar plaza. Los datos de la ficha pueden proceder de fuentes públicas o del propio centro y estar pendientes de verificación.",
    faqs: [
      {
        question: "¿Qué se considera horario ampliado en una guardería de Barcelona?",
        answer:
          "Suele referirse a franjas de entrada anticipada o de salida más tarde de lo habitual, pensadas para familias que necesitan flexibilidad para conciliar. Cada centro define sus propias franjas y condiciones.",
      },
      {
        question: "¿El horario ampliado tiene un coste adicional?",
        answer:
          "En muchos centros el horario ampliado es un servicio opcional con un coste añadido, pero varía de una guardería a otra. Confirma el precio y las condiciones directamente con el centro.",
      },
    ],
  },
  {
    id: "seo-escuelas-infantiles-publicas-barcelona",
    slug: "escuelas-infantiles-publicas-en-barcelona",
    title: "Escuelas infantiles públicas en Barcelona: escoles bressol municipals",
    h1: "Escuelas infantiles públicas en Barcelona",
    subtitle:
      "Escoles bressol municipals y llars d'infants de titularidad pública en Barcelona, también conocidas como guarderías municipales.",
    metaDescription:
      "Escuelas infantiles públicas en Barcelona: escoles bressol municipals y llars d'infants de la Generalitat. Consulta horarios, comedor y proceso de preinscripción.",
    filters: { citySlug: "barcelona", centerType: "escuela-infantil", ownership: "publico" },
    introText:
      "En Barcelona, la red de educación infantil pública para niños de 0 a 3 años está formada principalmente por las escoles bressol municipals, gestionadas por el Institut Municipal d'Educació de Barcelona (IMEB), y por las llars d'infants dependientes del Departament d'Educació de la Generalitat de Catalunya. En el lenguaje cotidiano de muchas familias, estos centros se conocen simplemente como \"guarderías municipales\" o \"guarderías públicas\", aunque en este directorio se clasifican como escuelas infantiles por tratarse de centros de titularidad pública. Aquí puedes consultar el listado completo con datos de contacto, horario y servicios.",
    sections: [
      {
        heading: "Cómo funciona el acceso a una escola bressol municipal en Barcelona",
        paragraphs: [
          "El acceso a una plaza en una escola bressol municipal se realiza mediante un proceso anual de preinscripción y matrícula gestionado por el Ayuntamiento de Barcelona, que asigna las plazas disponibles según un baremo público. Las cuotas siguen los precios públicos vigentes, con posibilidad de bonificación en función de la renta familiar.",
          "El horario habitual de estos centros suele ir de 8:00 a 17:00 horas de lunes a viernes, con jornada reducida en septiembre y julio, y la mayoría dispone de comedor con cocina propia. Las llars d'infants de la Generalitat, aunque dependen de una administración distinta a la municipal, funcionan bajo un modelo similar de acceso público.",
        ],
      },
      {
        heading: "Diferencias entre escola bressol municipal, llar d'infants y centro concertado",
        paragraphs: [
          "Las escoles bressol municipals dependen del Ayuntamiento de Barcelona; las llars d'infants de este listado dependen directamente de la Generalitat de Catalunya. Ambas son de titularidad pública y comparten un proceso de acceso reglado, aunque cada una sigue su propio circuito administrativo. Los centros concertados, en cambio, son de gestión privada con un convenio parcial de financiación pública, y no están incluidos en esta página.",
        ],
      },
    ],
    outroText:
      "Los datos de esta página proceden de fuentes públicas —el Institut Municipal d'Educació de Barcelona y el Registre de Centres Docents de la Generalitat de Catalunya—. Si representas uno de estos centros y detectas algún dato desactualizado, puedes solicitar su revisión o reclamar la ficha.",
    faqs: [
      {
        question: "¿\"Escola bressol municipal\" es lo mismo que \"guardería pública\"?",
        answer:
          "Sí, en el lenguaje habitual de muchas familias ambos términos se usan indistintamente. En este directorio, los centros públicos de 0 a 3 años se clasifican como escuelas infantiles, e incluyen tanto las escoles bressol municipals del Ayuntamiento como las llars d'infants de la Generalitat.",
      },
      {
        question: "¿Cómo consigo plaza en una escola bressol municipal de Barcelona?",
        answer:
          "El acceso se realiza mediante el proceso anual de preinscripción y matrícula del Ayuntamiento de Barcelona, con asignación de plazas según un baremo público. Consulta los plazos oficiales de preinscripción, que suelen abrirse en primavera para el curso siguiente.",
      },
      {
        question: "¿Todas las escoles bressol municipals tienen comedor?",
        answer:
          "La mayoría dispone de comedor con cocina propia, según los datos del Institut Municipal d'Educació de Barcelona. Puedes comprobarlo en la ficha de cada centro.",
      },
      {
        question: "¿Cuál es la diferencia con una llar d'infants de la Generalitat?",
        answer:
          "Ambas son de titularidad pública y atienden el primer ciclo de educación infantil (0-3 años), pero dependen de administraciones distintas: las escoles bressol municipals del Ayuntamiento de Barcelona, y las llars d'infants de este listado del Departament d'Educació de la Generalitat de Catalunya.",
      },
    ],
  },
  {
    id: "seo-escuelas-infantiles-privadas-barcelona",
    slug: "escuelas-infantiles-privadas-en-barcelona",
    title: "Escuelas infantiles privadas en Barcelona",
    h1: "Escuelas infantiles privadas en Barcelona",
    subtitle: "Colegios y centros educativos privados y concertados de Barcelona con sección de infantil de 0 a 3 años.",
    metaDescription:
      "Escuelas infantiles privadas en Barcelona: colegios con sección de 0 a 3 años. Compara proyecto educativo, servicios y solicita información.",
    filters: { citySlug: "barcelona", centerType: "escuela-infantil", ownership: "privado" },
    introText:
      "Varios colegios de Barcelona ofrecen una sección de infantil para niños de 0 a 3 años dentro de un proyecto educativo que continúa después en primaria y secundaria. En esta página puedes consultar escuelas infantiles privadas de la ciudad, muchas de ellas parte de centros con trayectoria de varias décadas, según los datos disponibles en cada ficha.",
    outroText:
      "El proceso de admisión, las cuotas y el proyecto pedagógico varían mucho de un centro a otro. Te recomendamos contactar directamente con cada colegio para conocer el detalle de su etapa de 0 a 3 años. Los datos de la ficha pueden proceder de fuentes públicas o del propio centro y estar pendientes de verificación.",
    faqs: [
      {
        question: "¿Estos colegios tienen continuidad después de la etapa 0-3 años?",
        answer:
          "Sí, en general se trata de centros educativos con oferta más amplia, que continúan con el segundo ciclo de infantil, primaria y, en muchos casos, secundaria y bachillerato dentro del mismo proyecto.",
      },
      {
        question: "¿Cómo es el proceso de admisión para la etapa de 0 a 3 años?",
        answer:
          "Cada centro privado o concertado gestiona su propio proceso de admisión para la etapa de 0 a 3 años, que no siempre coincide con el proceso general de escolarización. Te recomendamos consultarlo directamente con el colegio.",
      },
    ],
  },
  {
    id: "seo-escuelas-infantiles-bilingues-barcelona",
    slug: "escuelas-infantiles-bilingues-en-barcelona",
    title: "Escuelas infantiles bilingües en Barcelona",
    h1: "Escuelas infantiles bilingües en Barcelona",
    subtitle: "Escuelas infantiles en Barcelona con programa bilingüe o trilingüe desde el primer ciclo.",
    metaDescription:
      "Escuelas infantiles bilingües en Barcelona: centros con programa en catalán, castellano e inglés. Compara y solicita información.",
    filters: { citySlug: "barcelona", centerType: "escuela-infantil", service: "bilingue" },
    introText:
      "Algunas escuelas infantiles de Barcelona plantean su proyecto educativo desde un enfoque bilingüe o incluso trilingüe, combinando catalán, castellano e inglés desde el primer ciclo. Aquí puedes consultar las escuelas infantiles de la ciudad con programa bilingüe registrado en su ficha.",
    outroText:
      "El enfoque, las horas de exposición al idioma y la metodología varían de un centro a otro. Solicita información directamente a cada escuela para conocer el detalle de su programa. Los datos de la ficha pueden estar pendientes de verificación.",
    faqs: [
      {
        question: "¿En qué consiste el programa bilingüe de estas escuelas infantiles?",
        answer:
          "Cada centro define su propio enfoque: algunos combinan catalán y castellano con iniciación al inglés, y otros plantean un modelo trilingüe desde el primer ciclo. Te recomendamos solicitar información directamente para conocer la metodología y las horas de exposición a cada idioma.",
      },
      {
        question: "¿A partir de qué edad se introduce el inglés?",
        answer:
          "Depende del proyecto de cada centro. En el primer ciclo de infantil, la introducción al inglés suele hacerse mediante canciones, rutinas y juego más que con un enfoque académico. Confírmalo en la ficha o directamente con la escuela.",
      },
    ],
  },
  {
    id: "seo-guarderias-ingles-barcelona",
    slug: "guarderias-con-ingles-en-barcelona",
    title: "Guarderías con inglés en Barcelona",
    h1: "Guarderías con inglés en Barcelona",
    subtitle: "Guarderías y llars d'infants en Barcelona con iniciación al inglés o programa bilingüe.",
    metaDescription:
      "Guarderías con inglés en Barcelona: centros con iniciación al idioma desde el primer ciclo. Compara y solicita información.",
    filters: { citySlug: "barcelona", centerType: "guarderia", service: "ingles" },
    introText:
      "Muchas guarderías y llars d'infants de Barcelona incorporan el inglés dentro de sus actividades diarias, ya sea como iniciación puntual o como parte de un programa bilingüe más estructurado. En esta página puedes consultar los centros de la ciudad que registran esta actividad en su ficha.",
    outroText:
      "El nivel de exposición al idioma varía mucho de un centro a otro: desde canciones y rutinas puntuales hasta programas bilingües completos. Solicita información directamente a cada guardería para conocer el detalle.",
    faqs: [
      {
        question: "¿Es lo mismo \"guardería con inglés\" que \"guardería bilingüe\"?",
        answer:
          "No siempre. Algunas guarderías ofrecen sesiones puntuales de iniciación al inglés dentro de sus actividades, mientras que otras plantean un programa bilingüe más estructurado con mayor exposición al idioma. Consulta la ficha de cada centro para ver el detalle disponible.",
      },
      {
        question: "¿Cuántas horas a la semana se dedican al inglés?",
        answer:
          "Depende de cada centro y no siempre consta en la ficha. Te recomendamos preguntar directamente a la guardería por las horas de exposición al idioma y la metodología empleada.",
      },
    ],
  },
  {
    id: "seo-escuelas-infantiles-ingles-barcelona",
    slug: "escuelas-infantiles-con-ingles-en-barcelona",
    title: "Escuelas infantiles con inglés en Barcelona",
    h1: "Escuelas infantiles con inglés en Barcelona",
    subtitle: "Escuelas infantiles en Barcelona con actividades o iniciación al inglés desde el primer ciclo.",
    metaDescription:
      "Escuelas infantiles con inglés en Barcelona: centros con iniciación al idioma en el primer ciclo de infantil. Compara y solicita información.",
    filters: { citySlug: "barcelona", centerType: "escuela-infantil", service: "ingles" },
    introText:
      "Un número creciente de escuelas infantiles en Barcelona incorpora el inglés en sus actividades diarias desde el primer ciclo (0-3 años), tanto en centros públicos como privados. Consulta aquí las escuelas infantiles de la ciudad que registran esta actividad en su ficha.",
    outroText:
      "El enfoque y la carga horaria dedicada al inglés varían según el centro y su titularidad. Solicita información directamente a cada escuela para conocer el detalle de su programa.",
    faqs: [
      {
        question: "¿Las escoles bressol municipals también ofrecen actividades en inglés?",
        answer:
          "Algunas lo incorporan como actividad puntual, aunque no es una característica generalizada en toda la red pública. Consulta la ficha de cada centro para comprobar si consta esta actividad.",
      },
      {
        question: "¿Qué diferencia hay con un centro bilingüe?",
        answer:
          "Un centro bilingüe suele plantear un programa más estructurado, con mayor exposición al segundo idioma a lo largo del día. La iniciación al inglés, en cambio, puede limitarse a actividades puntuales dentro de la rutina semanal. Confirma el enfoque exacto directamente con el centro.",
      },
    ],
  },
  {
    id: "seo-guarderias-privadas-barcelona",
    slug: "guarderias-privadas-en-barcelona",
    title: "Guarderías privadas en Barcelona",
    h1: "Guarderías privadas en Barcelona",
    subtitle: "Guarderías y llars d'infants de titularidad privada en Barcelona.",
    metaDescription:
      "Directorio de guarderías privadas en Barcelona con servicios, horarios y datos de contacto. Compara centros y solicita información.",
    filters: { citySlug: "barcelona", centerType: "guarderia", ownership: "privado" },
    introText:
      "La mayoría de las guarderías y llars d'infants de Barcelona son de titularidad privada, con proyectos educativos, horarios y servicios que varían mucho de un centro a otro. En esta página puedes consultar guarderías privadas de la ciudad y comparar comedor, horario ampliado, idiomas y otros servicios antes de solicitar información.",
    outroText:
      "Las guarderías privadas gestionan su propio proceso de admisión y sus propias cuotas, por lo que conviene confirmar plazas, precios y periodo de adaptación directamente con cada centro. Los datos de la ficha pueden proceder de fuentes públicas o del propio centro y estar pendientes de verificación.",
    faqs: [
      {
        question: "¿En qué se diferencia una guardería privada de una escola bressol municipal?",
        answer:
          "Las guarderías privadas gestionan su propio proceso de admisión, horarios y cuotas, sin el baremo público que rige el acceso a las escoles bressol municipals. Suelen ofrecer más flexibilidad de horario, aunque el coste es a cargo de la familia sin las bonificaciones de la red pública.",
      },
      {
        question: "¿Cómo puedo comparar varias guarderías privadas en Barcelona?",
        answer:
          "Puedes revisar la ficha de cada centro para comparar servicios como comedor, horario ampliado o idiomas, y contactar directamente con las que más te interesen para confirmar plazas y cuotas.",
      },
    ],
  },
  {
    id: "seo-escuelas-infantiles-horario-ampliado-barcelona",
    slug: "escuelas-infantiles-con-horario-ampliado-en-barcelona",
    title: "Escuelas infantiles con horario ampliado en Barcelona",
    h1: "Escuelas infantiles con horario ampliado en Barcelona",
    subtitle: "Escuelas infantiles en Barcelona con franjas de entrada y salida ampliadas para facilitar la conciliación.",
    metaDescription:
      "Escuelas infantiles con horario ampliado en Barcelona. Compara centros con franjas flexibles y solicita información.",
    filters: { citySlug: "barcelona", centerType: "escuela-infantil", service: "horario-ampliado" },
    introText:
      "Algunas escuelas infantiles de Barcelona, tanto públicas como privadas, ofrecen una franja de horario ampliado además de su horario lectivo habitual, pensada para familias que necesitan entrar antes o salir más tarde de lo estándar. Consulta aquí las escuelas infantiles de la ciudad que registran este servicio en su ficha.",
    outroText:
      "El horario exacto, las franjas disponibles y su coste varían según el centro y su titularidad; confírmalo antes de solicitar plaza. Los datos de la ficha pueden proceder de fuentes públicas o del propio centro y estar pendientes de verificación.",
    faqs: [
      {
        question: "¿Las escoles bressol municipals tienen horario ampliado?",
        answer:
          "El horario habitual de las escoles bressol municipals suele ir de 8:00 a 17:00 horas. Algunos centros ofrecen franjas adicionales de acogida; consulta la ficha del centro o confírmalo directamente con la escuela.",
      },
      {
        question: "¿El horario ampliado tiene coste adicional en una escuela infantil?",
        answer:
          "En los centros privados y concertados, el horario ampliado suele ser un servicio opcional con coste añadido. En la red pública, cuando está disponible, puede estar sujeto a los precios públicos vigentes. Confirma las condiciones exactas con cada centro.",
      },
    ],
  },
  {
    id: "seo-guarderias-cocina-propia-barcelona",
    slug: "guarderias-con-cocina-propia-en-barcelona",
    title: "Guarderías con cocina propia en Barcelona",
    h1: "Guarderías con cocina propia en Barcelona",
    subtitle: "Guarderías y llars d'infants en Barcelona que elaboran el menú diario en sus propias instalaciones.",
    metaDescription:
      "Guarderías con cocina propia en Barcelona: centros que preparan el menú diario sin catering externo. Compara y solicita información.",
    filters: { citySlug: "barcelona", centerType: "guarderia", service: "cocina-propia" },
    introText:
      "Frente al catering externo, varias guarderías y llars d'infants de Barcelona elaboran el menú diario en su propia cocina, dentro de las mismas instalaciones del centro. En esta página puedes consultar las guarderías de la ciudad que registran este servicio en su ficha, un aspecto que muchas familias valoran por el control directo sobre los ingredientes y la posibilidad de adaptar los menús.",
    outroText:
      "Aunque un centro tenga cocina propia, conviene confirmar directamente cómo gestiona alergias e intolerancias alimentarias y si el servicio de comedor está incluido en la cuota mensual. Los datos de la ficha pueden proceder de fuentes públicas o del propio centro y estar pendientes de verificación.",
    faqs: [
      {
        question: "¿Qué ventaja tiene que una guardería tenga cocina propia?",
        answer:
          "Permite un control más directo sobre los ingredientes y la elaboración del menú, y suele facilitar adaptar la comida a alergias, intolerancias o necesidades concretas de cada niño o niña. Aun así, conviene confirmarlo directamente con el centro.",
      },
      {
        question: "¿Las guarderías con cocina propia son más caras?",
        answer:
          "No necesariamente; el coste del comedor depende de cada centro y no siempre está relacionado con el tipo de gestión de la cocina. Te recomendamos consultar el precio y las condiciones directamente con la guardería.",
      },
    ],
  },
];
