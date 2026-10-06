import type { Guide } from "@/types/guide";

export const mockGuides: Guide[] = [
  {
    id: "guide-como-elegir-guarderia",
    slug: "como-elegir-guarderia",
    title: "Cómo elegir guardería: guía completa para familias",
    excerpt:
      "Criterios clave para comparar guarderías antes de solicitar plaza: ubicación, ratio, servicios, horarios y qué mirar en la visita.",
    category: "Guías para familias",
    publishedAt: "2026-01-12",
    updatedAt: "2026-07-12",
    readingTimeMinutes: 8,
    content: [
      "Elegir guardería es una de las primeras decisiones importantes que toma una familia, y suele llegar en un momento con poco margen: la vuelta al trabajo se acerca y las plazas en los centros más demandados vuelan. Esta guía resume los criterios que más pesan en la práctica, para que compares con método en vez de por intuición.",
      "Antes de mirar ningún centro, conviene tener claras tres cosas: el horario real que necesitas cubrir (incluyendo desplazamientos), el presupuesto mensual máximo que puedes asumir contando comedor y extras, y si prefieres cercanía al domicilio o al trabajo. Esas tres respuestas descartan por sí solas a la mitad de los candidatos.",
    ],
    sections: [
      {
        heading: "La logística manda: ubicación y horarios",
        paragraphs: [
          "La guardería perfecta a 40 minutos de casa deja de ser perfecta en la segunda semana de curso. La cercanía —a casa o al trabajo, según quién haga la ruta cada día— es el criterio que más satisfacción predice a largo plazo. Piensa también en el plan B: ¿quién puede recoger al niño si un día no llegas?",
          "Sobre horarios, no te quedes en el horario general del centro: pregunta por la hora límite real de entrada por la mañana, si hay flexibilidad de salida, y si existen servicios de madrugadores u horario ampliado y cuánto cuestan. Un centro con horario base más corto pero franjas ampliadas económicas puede salir mejor que uno con horario largo estándar.",
        ],
      },
      {
        heading: "Ratio, equipo y proyecto del centro",
        paragraphs: [
          "La ratio de niños por educador es de los datos más importantes y menos preguntados. En las aulas de bebés (0-1 años), pocas cosas influyen tanto en la atención diaria. Pregunta cuántos educadores hay por grupo, qué formación tienen y cuánto tiempo llevan en el centro: la rotación alta de personal es una señal a vigilar.",
          "El proyecto educativo importa incluso en el primer ciclo: cómo organizan el juego, el descanso y la alimentación, cómo trabajan la autonomía y cómo comunican el día a día a las familias (agenda, app, fotos, reuniones). No hace falta que sea una metodología con nombre propio; hace falta que te lo sepan explicar con claridad.",
        ],
      },
      {
        heading: "Servicios que marcan la diferencia",
        paragraphs: [
          "Comedor (y si es de cocina propia o catering), horario ampliado, periodo de adaptación flexible, apertura en vacaciones escolares... Estos servicios definen si el centro encaja con tu vida real. Si tu hijo tiene alergias o intolerancias, pregunta específicamente cómo las gestionan en el comedor y quién supervisa los menús.",
          "En BuscaCentro puedes filtrar centros por estos servicios en tu ciudad y comparar varias fichas antes de llamar. Cuando tengas dos o tres candidatas, pide visita: media hora dentro del centro aporta más que cualquier web.",
        ],
      },
      {
        heading: "La visita: qué mirar y qué preguntar",
        paragraphs: [
          "Fíjate en cómo interactúan los educadores con los niños que ya están allí, en la limpieza real (no la del día de puertas abiertas), en la luz natural y en los espacios exteriores. Pregunta por el periodo de adaptación, la política ante fiebre y enfermedades comunes, y qué pasa con la cuota en vacaciones o bajas prolongadas.",
          "Desconfía menos del centro que te reconoce limitaciones y más del que todo lo tiene perfecto. Y pide siempre las condiciones por escrito antes de pagar matrícula: cuota mensual, comedor, material, y las condiciones de baja.",
        ],
      },
    ],
  },
  {
    id: "guide-diferencia-guarderia-escuela-infantil",
    slug: "diferencia-entre-guarderia-y-escuela-infantil",
    title: "Diferencia entre guardería y escuela infantil",
    excerpt:
      "Qué distingue legalmente a una escuela infantil de una guardería, por qué casi todos los centros actuales son escuelas infantiles y qué implica para tu elección.",
    category: "Guías para familias",
    publishedAt: "2026-01-15",
    updatedAt: "2026-07-12",
    readingTimeMinutes: 6,
    content: [
      "«Guardería» y «escuela infantil» se usan a diario como sinónimos, pero técnicamente no lo son. La diferencia importa menos de lo que parece para el día a día de tu hijo, y más de lo que parece para entender qué tipo de centro estás contratando.",
    ],
    sections: [
      {
        heading: "La diferencia legal: asistencial frente a educativo",
        paragraphs: [
          "La escuela infantil es un centro educativo autorizado por la administración autonómica para impartir el primer ciclo de Educación Infantil (0-3 años), con un proyecto pedagógico, personal titulado y requisitos de espacios regulados. La «guardería» clásica, en cambio, era un servicio asistencial de cuidado, sin autorización educativa.",
          "En la práctica, la inmensa mayoría de los centros actuales que la gente llama «guardería» son escuelas infantiles autorizadas o centros privados de educación infantil registrados. El término guardería sobrevive en el lenguaje cotidiano —y en cómo buscamos en Google— pero el modelo puramente asistencial es hoy residual.",
        ],
      },
      {
        heading: "Qué implica para tu elección",
        paragraphs: [
          "Si el centro está autorizado como escuela infantil o centro de educación infantil, tienes garantías regladas: ratios máximas por aula, requisitos de titulación del personal y de instalaciones, e inspección educativa. Puedes comprobar la autorización de cualquier centro en el registro oficial de centros docentes de tu comunidad autónoma.",
          "Por eso, más útil que preguntar «¿es guardería o escuela infantil?» es preguntar: ¿está autorizado como centro de primer ciclo? ¿qué etapa cubre exactamente (0-3, o también 3-6)? ¿es de titularidad pública, privada o concertada? Esas tres respuestas sí cambian el precio, el proceso de admisión y las garantías.",
        ],
      },
      {
        heading: "En Cataluña y la Comunitat Valenciana: bressol, llar y escoleta",
        paragraphs: [
          "En Barcelona y el resto de Cataluña, el término habitual es «escola bressol» (red municipal) o «llar d'infants» (denominación general, muy usada en centros privados y de la Generalitat). En la Comunitat Valenciana se usa «escoleta» o «escola infantil». Todos designan centros de primer ciclo de educación infantil: cambia el nombre, no la etapa.",
        ],
      },
    ],
  },
  {
    id: "guide-cuanto-cuesta-guarderia",
    slug: "cuanto-cuesta-una-guarderia",
    title: "Cuánto cuesta una guardería en 2026: precios por ciudad y ayudas",
    excerpt:
      "Rangos de precio reales de guarderías y escuelas infantiles en Madrid, Barcelona y Valencia, y las ayudas que pueden dejar la cuota en cero.",
    category: "Precios y ayudas",
    publishedAt: "2026-01-20",
    updatedAt: "2026-07-12",
    readingTimeMinutes: 8,
    content: [
      "El coste de una guardería en España varía tanto que dar una sola cifra sería engañar: entre una plaza pública gratuita y un centro privado premium de una gran ciudad puede haber más de 800 euros de diferencia al mes. Lo que sí se puede hacer es explicar de qué depende el precio y qué rangos son habituales en cada ciudad en 2026.",
      "La cuota base suele cubrir el horario general. A partir de ahí se suman comedor (si no está incluido), horario ampliado, matrícula anual y, en algunos centros, material o uniforme. Al comparar precios, compara siempre el coste mensual total con tu horario real, no la cuota base.",
    ],
    sections: [
      {
        heading: "Madrid: red pública gratuita y privadas con cheque guardería",
        paragraphs: [
          "En la red pública de Madrid (municipal y autonómica), la escolaridad es gratuita desde el curso 2019-2020; se paga aparte el comedor y el horario ampliado según precios públicos. El reto no es el precio sino conseguir plaza: la demanda supera la oferta en muchos distritos.",
          "En las guarderías y escuelas infantiles privadas de Madrid, las cuotas habituales se mueven en un rango amplio, orientativamente entre 400 y 800 euros mensuales con comedor según zona y servicios. La ayuda clave es el cheque guardería de la Comunidad de Madrid, que en la convocatoria 2026 oscila entre 177 y 283 euros al mes según renta, aplicable en centros privados autorizados.",
        ],
      },
      {
        heading: "Barcelona: tarificación social en las escoles bressol",
        paragraphs: [
          "Las escoles bressol municipals de Barcelona aplican tarificación social: la cuota depende de la renta y del tamaño de la familia, con un rango que va aproximadamente de 50 a 406 euros mensuales (comedor incluido) según los tramos vigentes. Es decir, no hay un precio único: cada familia paga según su situación, y el Ayuntamiento ofrece un simulador oficial.",
          "En las llars d'infants y guarderías privadas de Barcelona, los rangos habituales son similares o superiores a los de Madrid en zonas céntricas. Al comparar, pregunta siempre qué incluye la cuota, porque la variabilidad entre centros privados es máxima.",
        ],
      },
      {
        heading: "Valencia: gratuidad 0-3 con el Bono Infantil",
        paragraphs: [
          "La Comunitat Valenciana es actualmente la situación más favorable de las tres grandes ciudades: desde el curso 2024-2025, la Generalitat aplica la gratuidad del 0-3 años mediante el Bono Infantil, que el centro gestiona directamente sin trámite para la familia. El tramo de 2-3 años es gratuito con carácter general, y los tramos de 0-2 tienen bonificaciones muy amplias.",
          "Esto aplica tanto a la red pública como a los centros privados adheridos al programa. En la práctica, muchas familias valencianas pagan solo comedor y servicios complementarios. Antes de matricular, confirma que el centro está adherido al Bono Infantil y qué cubre exactamente en su caso.",
        ],
      },
      {
        heading: "Consejos para comparar precios sin sorpresas",
        paragraphs: [
          "Pide siempre el desglose por escrito: cuota base, comedor, horario ampliado, matrícula y material. Pregunta qué pasa en agosto (muchos centros cobran el mes aunque cierren o el niño no asista), cómo funcionan las bajas y si la matrícula se devuelve si no llegas a empezar.",
          "Y antes de descartar la opción privada por precio, calcula el coste real después de ayudas: entre el cheque guardería madrileño, la tarificación social barcelonesa y el Bono Infantil valenciano, la diferencia entre pública y privada es hoy mucho menor de lo que era hace cinco años.",
        ],
      },
    ],
    faqs: [
      {
        question: "¿Cuánto cuesta una guardería privada en Madrid en 2026?",
        answer:
          "En las guarderías y escuelas infantiles privadas de Madrid, las cuotas habituales se mueven orientativamente entre 400 y 800 euros mensuales con comedor, según zona y servicios. La red pública, en cambio, es gratuita en escolaridad desde el curso 2019-2020: se paga aparte solo el comedor y el horario ampliado.",
      },
      {
        question: "¿Cuánto se paga en las escoles bressol municipals de Barcelona?",
        answer:
          "Barcelona aplica tarificación social: no hay un precio único, cada familia paga según su renta y el tamaño de la familia. El rango va aproximadamente de 50 a 406 euros mensuales con comedor incluido, según los tramos vigentes. El Ayuntamiento ofrece un simulador oficial para calcular tu cuota antes de solicitar.",
      },
      {
        question: "¿Es gratis la guardería en Valencia?",
        answer:
          "Desde el curso 2024-2025, la Generalitat Valenciana aplica la gratuidad del 0-3 años mediante el Bono Infantil. El tramo de 2-3 años es gratuito con carácter general y los tramos de 0-2 tienen bonificaciones muy amplias. Aplica en la red pública y en los centros privados adheridos; muchas familias pagan solo el comedor.",
      },
    ],
    relatedLinks: {
      intro: "Compara centros y precios en las ciudades de esta guía:",
      links: [
        { label: "Tarifas publicadas por guarderías privadas de Madrid en 2026-2027", href: "/blog/precios-guarderias-privadas-madrid-2026-2027" },
        { label: "Guarderías en Madrid", href: "/guarderias-en-madrid" },
        { label: "Guarderías en Barcelona", href: "/guarderias-en-barcelona" },
        { label: "Guarderías en Valencia", href: "/guarderias-en-valencia" },
      ],
    },
  },
  {
    id: "guide-que-preguntar-visita",
    slug: "que-preguntar-al-visitar-una-guarderia",
    title: "Qué preguntar al visitar una guardería: checklist completa",
    excerpt:
      "Las preguntas que de verdad importan en la visita a una guardería o escuela infantil, organizadas por temas, y las señales a observar.",
    category: "Guías para familias",
    publishedAt: "2026-01-25",
    updatedAt: "2026-07-12",
    readingTimeMinutes: 7,
    content: [
      "La visita al centro es el momento donde se decide casi todo, y sin embargo muchas familias salen de ella sin haber preguntado lo importante. Esta checklist organiza las preguntas por temas para que no se te escape nada, y añade las señales que conviene observar mientras te enseñan el centro.",
    ],
    sections: [
      {
        heading: "Equipo y funcionamiento diario",
        paragraphs: [
          "¿Cuántos educadores hay por aula y cuál es la ratio real en cada grupo de edad? ¿Qué titulación tienen? ¿Cuánto tiempo lleva el equipo actual en el centro? ¿Quién sustituye cuando alguien falta? ¿Cómo es un día normal, hora a hora, en el aula de mi hijo?",
          "Mientras preguntas, observa: cómo hablan los educadores a los niños presentes, si los espacios están pensados a su altura, y si el ambiente es de actividad ordenada o de caos contenido. El tono del centro se percibe en cinco minutos.",
        ],
      },
      {
        heading: "Alimentación, sueño y salud",
        paragraphs: [
          "¿El comedor es de cocina propia o catering? ¿Puedo ver el menú del mes? ¿Cómo gestionan alergias e intolerancias, y quién lo supervisa? ¿Cómo organizan las siestas y dónde duermen los niños? Para bebés: ¿cómo gestionan biberones, lactancia materna y la introducción de alimentos?",
          "En salud: ¿cuál es la política ante fiebre? ¿A partir de qué temperatura llaman? ¿Qué hacen ante enfermedades contagiosas típicas? ¿Administran medicación con receta? Son preguntas incómodas que cualquier buen centro responde sin titubear.",
        ],
      },
      {
        heading: "Adaptación, comunicación y condiciones",
        paragraphs: [
          "¿Cómo es el periodo de adaptación y cuánto dura? ¿Puedo acompañar a mi hijo los primeros días? ¿Cómo me contarán el día a día: agenda, app, fotos? ¿Con qué frecuencia hay reuniones o tutorías?",
          "Y las condiciones económicas, siempre por escrito antes de pagar nada: cuota mensual total con comedor, qué meses se pagan, coste de matrícula y material, política de bajas y de ausencias prolongadas, y si hay permanencias mínimas. Un centro serio no tiene problema en darte todo esto en papel.",
        ],
      },
    ],
  },
  {
    id: "guide-publica-privada-concertada",
    slug: "guarderia-publica-privada-o-concertada",
    title: "Guardería pública, privada o concertada: cuál elegir",
    excerpt:
      "Diferencias reales entre centros públicos, privados y concertados en el 0-3: precio, admisión, horarios y qué conviene según tu situación.",
    category: "Guías para familias",
    publishedAt: "2026-02-01",
    updatedAt: "2026-07-12",
    readingTimeMinutes: 7,
    content: [
      "La titularidad del centro —pública, privada o concertada— condiciona el precio, el proceso para conseguir plaza y hasta el horario. Pero la respuesta a «cuál es mejor» depende completamente de tu situación: renta, flexibilidad laboral, ciudad y fechas. Esta guía resume las diferencias que de verdad notarás.",
    ],
    sections: [
      {
        heading: "Centros públicos: precio imbatible, plaza no garantizada",
        paragraphs: [
          "Las escuelas infantiles públicas (municipales o autonómicas) son la opción más económica: gratuitas en Madrid desde 2019 y en la Comunitat Valenciana desde 2024 (vía Bono Infantil), y con tarificación social según renta en Barcelona. El personal es titulado y las ratios están regladas.",
          "La contrapartida: la plaza se asigna por baremo público en un proceso anual con plazos cerrados (habitualmente en primavera), la demanda supera la oferta en muchas zonas, y los horarios suelen ser menos flexibles que en la privada. Si tu horario laboral es atípico o necesitas empezar a mitad de curso, la pública puede no encajar aunque sea gratis.",
        ],
      },
      {
        heading: "Centros privados: flexibilidad a cambio de precio",
        paragraphs: [
          "Las guarderías y escuelas infantiles privadas gestionan sus propias plazas: puedes matricular en cualquier momento del año si hay hueco, los horarios ampliados son más habituales, y servicios como idiomas o actividades específicas abundan más. Para muchas familias, la privada no es la segunda opción sino la única que encaja con su logística.",
          "El precio varía enormemente por ciudad y zona, pero las ayudas lo han cambiado todo: el cheque guardería en Madrid o el Bono Infantil en Valencia (que aplica también a privados adheridos) reducen la brecha con la pública. Calcula siempre el coste después de ayudas antes de comparar.",
        ],
      },
      {
        heading: "El concertado en el 0-3: menos común de lo que crees",
        paragraphs: [
          "A diferencia de colegios de primaria, el concierto educativo formal apenas existe en el primer ciclo (0-3 años) en la mayoría de comunidades autónomas. Muchos centros que se anuncian como «concertados» en esta etapa son en realidad privados adheridos a programas de ayudas a la demanda (como el Programa de Ayuda a las Familias andaluz o el Bono Infantil valenciano), lo que no es lo mismo: la titularidad y la gestión siguen siendo privadas.",
          "¿Importa la diferencia? Para el precio final, poco: lo relevante es cuánto pagas tras la ayuda. Para tus expectativas, sí: no esperes en un «adherido» el proceso de admisión reglado ni las condiciones de un concierto real. Pregunta siempre qué régimen exacto tiene el centro y qué ayudas aplican.",
        ],
      },
      {
        heading: "Cómo decidir según tu caso",
        paragraphs: [
          "Si tu prioridad es el coste y tus horarios son estándar: solicita plaza pública en el plazo de primavera y ten un plan B privado por si no entra. Si necesitas flexibilidad horaria o incorporación inmediata: ve directamente a la privada y maximiza las ayudas disponibles en tu comunidad. Si dudas, solicita la pública (no pierdes nada) mientras reservas en la privada que te convenza — pregunta antes cuánto pierdes si finalmente no la usas.",
        ],
      },
    ],
    faqs: [
      {
        question: "¿Qué diferencia hay entre una guardería pública y una privada?",
        answer:
          "Las escuelas infantiles públicas son la opción más económica: gratuitas en Madrid desde 2019 y en la Comunitat Valenciana desde 2024 vía Bono Infantil, y con tarificación social según renta en Barcelona. La plaza se asigna por baremo en un proceso anual con plazos cerrados. Las privadas gestionan sus propias plazas y permiten matrícula en cualquier momento del año si hay hueco.",
      },
      {
        question: "¿Existen guarderías concertadas en el 0-3?",
        answer:
          "A diferencia de los colegios de primaria, el concierto educativo formal apenas existe en el primer ciclo (0-3 años) en la mayoría de comunidades. Muchos centros que se anuncian como «concertados» en esta etapa son en realidad privados adheridos a programas de ayudas a la demanda, como el Bono Infantil valenciano: la titularidad y la gestión siguen siendo privadas.",
      },
    ],
    relatedLinks: {
      intro: "Consulta centros por titularidad en cada ciudad:",
      links: [
        { label: "Escuelas infantiles en Madrid", href: "/escuelas-infantiles-en-madrid" },
        { label: "Escuelas infantiles en Barcelona", href: "/escuelas-infantiles-en-barcelona" },
        { label: "Escuelas infantiles en Valencia", href: "/escuelas-infantiles-en-valencia" },
      ],
    },
  },
  {
    id: "guide-cheque-guarderia",
    slug: "que-es-el-cheque-guarderia",
    title: "Cheque guardería de la Comunidad de Madrid: requisitos, plazo y cuantía",
    excerpt:
      "Cómo funciona el cheque guardería madrileño en la convocatoria 2026: quién puede pedirlo, cuánto dinero es, cuándo se solicita y en qué centros se aplica.",
    category: "Precios y ayudas",
    publishedAt: "2026-02-05",
    updatedAt: "2026-07-12",
    readingTimeMinutes: 7,
    content: [
      "El «cheque guardería» es el nombre popular de las becas de escolarización en el primer ciclo de Educación Infantil de la Comunidad de Madrid: una ayuda mensual para familias con hijos de 0 a 3 años matriculados en centros privados autorizados de la región. Es la ayuda más relevante para quien no obtiene (o no quiere) plaza pública en Madrid.",
      "Importante: aunque el término «cheque guardería» se usa a veces de forma genérica en toda España, el programa como tal es de la Comunidad de Madrid. Otras comunidades tienen sus propias ayudas con otros nombres y reglas —como el Bono Infantil en la Comunitat Valenciana o la tarificación social en Barcelona.",
    ],
    sections: [
      {
        heading: "Cuánto dinero es y cómo se cobra",
        paragraphs: [
          "En la convocatoria 2026, la cuantía oscila orientativamente entre 177 y 283 euros al mes según el nivel de renta familiar, y se aplica como descuento directo en la cuota del centro: no recibes el dinero tú, lo descuenta el centro de la mensualidad. La ayuda cubre los meses del curso escolar.",
          "La cuantía exacta por tramo de renta se fija en cada convocatoria anual publicada en el BOCM, así que confirma las cifras del año en curso en los canales oficiales de la Comunidad de Madrid antes de hacer números definitivos.",
        ],
      },
      {
        heading: "Requisitos y plazo de solicitud",
        paragraphs: [
          "Los requisitos habituales: que el niño esté matriculado (o vaya a estarlo) en un centro privado autorizado de primer ciclo de la Comunidad de Madrid, residencia en la región, y no superar los umbrales de renta de la convocatoria. La solicitud la presenta la familia, habitualmente de forma telemática.",
          "El plazo es corto y cambia cada año: en la convocatoria 2026 fue del 19 de mayo al 8 de junio. Si te interesa para el curso que viene, márcalo en el calendario en primavera y prepara la documentación (renta, empadronamiento, matrícula) con antelación — quedarse fuera de plazo significa un año entero sin ayuda.",
        ],
      },
      {
        heading: "En qué centros se puede usar",
        paragraphs: [
          "Solo en centros privados autorizados por la Comunidad de Madrid para el primer ciclo de Educación Infantil. No aplica en la red pública (que ya es gratuita en escolaridad desde 2019) ni en centros sin autorización educativa. Al visitar centros privados en Madrid, pregunta siempre si admiten el cheque guardería y cómo lo gestionan — la inmensa mayoría de los autorizados lo hace.",
          "Puedes comparar guarderías y escuelas infantiles privadas de Madrid en nuestro directorio y confirmar con cada centro su situación respecto a la beca antes de matricular.",
        ],
      },
      {
        heading: "Cheque guardería y plaza pública: ¿se pueden combinar estrategias?",
        paragraphs: [
          "Una estrategia habitual: solicitar plaza pública en el proceso de admisión de primavera y, en paralelo, preparar la solicitud del cheque por si no se obtiene plaza. Los plazos de ambos procesos suelen ser cercanos (admisión pública en abril, cheque en mayo-junio), así que la primavera es el momento crítico del año para las familias madrileñas con hijos de 0 a 3 años.",
        ],
      },
    ],
    faqs: [
      {
        question: "¿Cuánto dinero es el cheque guardería de Madrid en 2026?",
        answer:
          "En la convocatoria 2026, la cuantía oscila orientativamente entre 177 y 283 euros al mes según el nivel de renta familiar. Se aplica como descuento directo en la cuota del centro: no recibes el dinero tú, lo descuenta el centro de la mensualidad. La ayuda cubre los meses del curso escolar.",
      },
      {
        question: "¿Cuándo se solicita el cheque guardería en Madrid?",
        answer:
          "El plazo es corto y cambia cada año. En la convocatoria 2026 fue del 19 de mayo al 8 de junio, con solicitud habitualmente telemática. Conviene marcarlo en el calendario en primavera y preparar con antelación la documentación (renta, empadronamiento, matrícula), porque quedarse fuera de plazo significa un año entero sin ayuda.",
      },
      {
        question: "¿En qué centros se puede usar el cheque guardería?",
        answer:
          "Solo en centros privados autorizados por la Comunidad de Madrid para el primer ciclo de Educación Infantil. No aplica en la red pública, que ya es gratuita en escolaridad desde 2019, ni en centros sin autorización educativa. La inmensa mayoría de los centros privados autorizados admite el cheque; conviene confirmarlo con cada centro antes de matricular.",
      },
    ],
    relatedLinks: {
      intro: "Compara guarderías y escuelas infantiles de Madrid donde aplicar la ayuda:",
      links: [
        { label: "Guarderías en Madrid", href: "/guarderias-en-madrid" },
        { label: "Escuelas infantiles en Madrid", href: "/escuelas-infantiles-en-madrid" },
      ],
    },
  },
  {
    id: "guide-cheque-guarderia-subsanacion-julio-2026",
    slug: "cheque-guarderia-madrid-subsanacion-julio-2026",
    title: "Cheque guardería Madrid 2026-2027: en qué punto está la beca y qué falta por publicarse",
    excerpt:
      "La subsanación de las becas de Educación Infantil de la Comunidad de Madrid terminó el 6 de agosto de 2026. Falta la lista definitiva. Fechas, cuantías y cómo consultar tu solicitud.",
    category: "Precios y ayudas",
    publishedAt: "2026-07-13",
    updatedAt: "2026-10-06",
    readingTimeMinutes: 5,
    content: [
      "Las becas de la Comunidad de Madrid para el primer ciclo de Educación Infantil en centros privados, el conocido «cheque guardería», están en la recta final de su tramitación para el curso 2026-2027. El plazo de solicitud y la fase de subsanación ya han terminado. Lo que falta es la orden de resolución, con la lista definitiva de beneficiarios.",
      "A 6 de octubre de 2026, el calendario de actuaciones de la sede electrónica de la Comunidad de Madrid todavía no recoge esa resolución: la última actuación publicada es la ampliación del plazo de subsanación. Esta página resume en qué fase está cada cosa y qué puedes hacer mientras tanto.",
    ],
    sections: [
      {
        heading: "Las fechas de la convocatoria 2026-2027",
        paragraphs: [
          "Las solicitudes se presentaron del 19 de mayo al 8 de junio de 2026. El 9 de julio se publicó la lista provisional de admitidos y excluidos, y con ella se abrió la subsanación: primero del 10 al 23 de julio, y después ampliada hasta el 6 de agosto de 2026 por un acuerdo del Consejo de Gobierno del 29 de julio. La subsanación era la fase para corregir errores o aportar documentación que faltaba; no era un nuevo plazo de solicitud.",
          "Ese plazo está cerrado. Si tu solicitud aparecía como excluida o con documentación pendiente y no lo corregiste antes del 6 de agosto, ya no hay una vía ordinaria para hacerlo en esta convocatoria. La norma fija un plazo máximo de seis meses para resolver, y el silencio es desestimatorio: si pasa ese tiempo sin resolución, la solicitud se entiende denegada a efectos de poder recurrir.",
        ],
      },
      {
        heading: "Cuantía de la ayuda para 2026-2027",
        paragraphs: [
          "Según la convocatoria, la beca es de 177 euros mensuales, abonados en los meses en los que el menor asista efectivamente al centro durante el periodo escolar (entre el 1 de septiembre de 2026 y el 31 de julio de 2027), lo que supone una cuantía total de hasta 1.947 euros. Esa cantidad se incrementa hasta 283 euros mensuales para las familias que obtienen 5 puntos en el criterio de ingresos familiares.",
          "La ayuda se aplica como descuento en la cuota del centro y solo es válida en centros privados autorizados por la Comunidad de Madrid para el primer ciclo de Educación Infantil, siempre que el niño no ocupe una plaza sostenida con fondos públicos.",
        ],
      },
      {
        heading: "Cómo consultar tu solicitud y qué viene ahora",
        paragraphs: [
          "En la página del trámite «Becas de Educación Infantil 2026-2027» de la sede electrónica de la Comunidad de Madrid hay una consulta individual del estado de la solicitud. Cuando se resuelva la convocatoria, la lista definitiva se publicará en el calendario de actuaciones de ese mismo trámite y en la web institucional, con los beneficiarios por orden de puntuación, los no beneficiarios y los excluidos con su causa. También informan de forma individual las Direcciones de Área Territorial y el punto de información de la Consejería de Educación.",
          "La orden se publicará además en el Boletín Oficial de la Comunidad de Madrid, sin anexos, y desde el día siguiente empiezan a contar los plazos para recurrir: un mes para el recurso de reposición y dos meses para el contencioso-administrativo. Para dudas sobre un expediente, el contacto de la Subdirección General de Becas y Ayudas es becas.infantil@madrid.org.",
        ],
      },
      {
        heading: "Si vives en Madrid capital, hay una segunda beca",
        paragraphs: [
          "El Ayuntamiento de Madrid tiene su propia ayuda para escuelas infantiles privadas, la Beca Infantil Plus, de 118, 220 o 385 euros al mes según la renta. Es una convocatoria distinta, con sus propios plazos y listados, y es compatible con el cheque guardería de la Comunidad hasta cubrir el coste completo del centro. Su propuesta de resolución provisional se publicó el 17 de septiembre de 2026.",
        ],
      },
    ],
    faqs: [
      {
        question: "¿Ha salido ya la lista definitiva del cheque guardería de Madrid 2026-2027?",
        answer:
          "A 6 de octubre de 2026, el calendario de actuaciones de la sede electrónica de la Comunidad de Madrid no la recoge todavía. La última actuación publicada es la ampliación del plazo de subsanación hasta el 6 de agosto de 2026. La resolución se publicará en ese calendario y en la web de la Comunidad.",
      },
      {
        question: "¿Cuánto es el cheque guardería de Madrid para el curso 2026-2027?",
        answer:
          "La beca es de 177 euros mensuales durante los meses de asistencia efectiva entre septiembre de 2026 y julio de 2027, hasta un total de 1.947 euros. La cuantía sube a 283 euros mensuales para las familias que obtienen 5 puntos en el criterio de ingresos familiares.",
      },
      {
        question: "¿Todavía puedo subsanar mi solicitud del cheque guardería?",
        answer:
          "No. La subsanación estuvo abierta del 10 al 23 de julio de 2026 y se amplió hasta el 6 de agosto. Tampoco se pueden presentar solicitudes nuevas: el plazo fue del 19 de mayo al 8 de junio de 2026.",
      },
      {
        question: "¿Qué puedo hacer si me deniegan la beca de Educación Infantil?",
        answer:
          "Desde el día siguiente a la publicación de la orden de resolución puedes presentar recurso de reposición en el plazo de un mes, o recurso contencioso-administrativo ante el Tribunal Superior de Justicia de Madrid en el plazo de dos meses.",
      },
      {
        question: "¿Es compatible el cheque guardería con la beca del Ayuntamiento de Madrid?",
        answer:
          "Sí. La Beca Infantil Plus del Ayuntamiento es compatible con las ayudas de otras administraciones hasta cubrir el coste completo del servicio. Son dos convocatorias separadas, cada una con sus requisitos y plazos.",
      },
    ],
    relatedLinks: {
      intro: "Más información y centros donde aplicar la ayuda:",
      links: [
        { label: "Beca Infantil Plus del Ayuntamiento de Madrid 2026-2027", href: "/blog/beca-infantil-plus-madrid-2026-2027" },
        { label: "Guía completa del cheque guardería", href: "/blog/que-es-el-cheque-guarderia" },
        { label: "Guarderías privadas en Madrid", href: "/guarderias-privadas-en-madrid" },
        { label: "Escuelas infantiles en Madrid", href: "/escuelas-infantiles-en-madrid" },
      ],
    },
  },
  {
    id: "guide-beca-infantil-plus-madrid-2026-2027",
    slug: "beca-infantil-plus-madrid-2026-2027",
    title: "Beca Infantil Plus Madrid 2026-2027: listas provisionales, cuantías y qué pasa ahora",
    excerpt:
      "El Ayuntamiento de Madrid publicó el 17 de septiembre de 2026 la propuesta provisional de la Beca Infantil Plus: 118, 220 o 385 euros al mes para escuelas infantiles privadas. Cómo leer los anexos y qué falta.",
    category: "Precios y ayudas",
    publishedAt: "2026-10-06",
    updatedAt: "2026-10-06",
    readingTimeMinutes: 6,
    content: [
      "La Beca Infantil Plus es la ayuda del Ayuntamiento de Madrid para familias con niños de 0 a 3 años matriculados en escuelas infantiles privadas de la ciudad. Para el curso 2026-2027 paga 118, 220 o 385 euros al mes, según la renta, y tiene un presupuesto de 6,9 millones de euros, 1,8 millones más que el curso anterior.",
      "El plazo de solicitud se cerró en abril, así que esta página no es para pedirla, sino para quien ya la pidió. El 17 de septiembre de 2026 se publicó la propuesta de resolución provisional, con los listados de beneficiarios propuestos, las listas de reserva y las solicitudes desestimadas. El plazo de alegaciones ya ha terminado y falta la resolución definitiva. Aquí explicamos cómo leer esos listados y qué viene después.",
      "No es la misma ayuda que el cheque guardería de la Comunidad de Madrid. Son dos becas distintas, de dos administraciones, y se pueden cobrar a la vez.",
    ],
    sections: [
      {
        heading: "Cuánto se cobra: los tres tramos",
        paragraphs: [
          "La cuantía depende de la renta per cápita de la unidad familiar, es decir, los ingresos totales divididos entre el número de miembros. Tramo 1: 385 euros al mes (4.235 euros en el curso) para rentas per cápita de hasta 10.420 euros. Tramo 2: 220 euros al mes (2.420 euros) entre 10.420 y 17.020 euros. Tramo 3: 118 euros al mes (1.298 euros) entre 17.020 y 30.000 euros. Por encima de 30.000 euros per cápita no hay beca.",
          "Los importes se calculan sobre once mensualidades, de septiembre de 2026 a julio de 2027. La ayuda sirve para pagar la matrícula, las mensualidades, el comedor y el horario ampliado, y es compatible con otras becas públicas o privadas hasta cubrir el coste completo del servicio.",
        ],
      },
      {
        heading: "Quién podía pedirla",
        paragraphs: [
          "La convocatoria pedía cuatro cosas. Que el menor hubiera nacido en 2024, 2025 o 2026, o tuviera el nacimiento previsto antes del 1 de enero de 2027. Que estuviera matriculado o con reserva de plaza para 2026-2027 en el primer ciclo de Educación Infantil de un centro privado del municipio de Madrid, autorizado por la administración educativa, sin ocupar una plaza sostenida total o parcialmente con fondos públicos. Que la renta per cápita de la familia no superase los 30.000 euros. Y que el padre, la madre o el tutor estuviera empadronado en Madrid en la fecha de publicación de la convocatoria y lo hubiera estado sin interrupción durante los dos años anteriores; basta con que lo cumpla uno de los dos progenitores.",
          "El plazo de solicitud fue del 9 al 28 de abril de 2026. Quien no la pidió entonces ya no puede hacerlo para este curso. La convocatoria se publicó en el Boletín Oficial del Ayuntamiento de Madrid (BOAM) número 10101, de 8 de abril de 2026.",
        ],
      },
      {
        heading: "En qué punto está la tramitación",
        paragraphs: [
          "El calendario ha sido este. El 16 de julio de 2026 se publicaron los requerimientos de subsanación, con diez días hábiles para aportar lo que faltaba. El 3 de septiembre salió el decreto que da por desistidas las solicitudes que no se subsanaron. El 8 de septiembre se reunió la comisión de valoración y el 17 de septiembre se publicó, en el BOAM número 10215, la propuesta de resolución provisional, firmada el día 14.",
          "Desde el 18 de septiembre hubo diez días hábiles para presentar alegaciones, un plazo que ya ha terminado. Quedan dos pasos: la propuesta de resolución definitiva y el decreto de concesión. A 6 de octubre de 2026, la sede electrónica del Ayuntamiento todavía no indica fecha para ninguno de los dos. Como referencia, el decreto de concesión del curso anterior se publicó el 11 de noviembre de 2025.",
        ],
      },
      {
        heading: "Cómo leer los anexos de la propuesta provisional",
        paragraphs: [
          "La propuesta tiene seis anexos. El Anexo I recoge a los solicitantes propuestos como beneficiarios. Los Anexos II, III y IV son listas de reserva: familias que cumplen todos los requisitos pero para las que no alcanza el presupuesto. Cada una corresponde a un tramo: el II a quienes cobrarían 4.235 euros, el III a los de 2.420 y el IV a los de 1.298. El Anexo V lista las solicitudes desestimadas y el VI las inadmitidas por haberse presentado fuera de plazo.",
          "Estar en el Anexo I todavía no es tener la beca: la propia resolución advierte de que la propuesta provisional no crea ningún derecho hasta que se publique la concesión definitiva. Y estar en reserva no es quedarse fuera del todo. En la convocatoria 2025-2026, el Ayuntamiento publicó el 14 de julio de 2026 un decreto de nuevos beneficiarios para repartir los fondos que habían sobrado. La reserva puede acabar cobrando, aunque tarde.",
        ],
      },
      {
        heading: "Cómo y cuándo se cobra",
        paragraphs: [
          "La beca no se paga al terminar el curso. Por segundo año consecutivo, el Ayuntamiento la abona cada dos meses a través de una entidad colaboradora, que revisa los justificantes de gasto que aporta cada familia y paga los importes ya justificados. Conviene guardar todos los recibos de la escuela desde septiembre.",
          "La cuenta bancaria debe estar a nombre del progenitor que firmó la solicitud. Si necesitas cambiarla, en la página de la beca hay un formulario específico de cambio de cuenta.",
        ],
      },
      {
        heading: "Dónde consultar los listados y a quién preguntar",
        paragraphs: [
          "Los anexos y el resto de la documentación están en dos sitios: el trámite «Becas para el primer ciclo de educación infantil en escuelas infantiles privadas. Curso 2026-2027» de la sede electrónica del Ayuntamiento (sede.madrid.es) y el apartado de becas de escuelas privadas de madrid.es. Para dudas sobre un expediente concreto, el Ayuntamiento atiende de lunes a viernes de 9:00 a 14:00 en los teléfonos 914 801 244, 917 001 618 y 911 417 906, y en el correo becasinfantilayuntamientomadrid@madrid.es.",
          "Si estás eligiendo escuela para el curso que viene, recuerda que la beca solo vale en centros privados autorizados dentro del municipio de Madrid. En las fichas de nuestro directorio indicamos, cuando el centro lo publica, qué ayudas y cheques guardería acepta.",
        ],
      },
    ],
    faqs: [
      {
        question: "¿Cuánto es la Beca Infantil Plus de Madrid en el curso 2026-2027?",
        answer:
          "385 euros al mes para rentas per cápita de hasta 10.420 euros, 220 euros al mes entre 10.420 y 17.020 euros, y 118 euros al mes entre 17.020 y 30.000 euros. Se calcula sobre once mensualidades, de septiembre de 2026 a julio de 2027, lo que supone 4.235, 2.420 o 1.298 euros en el curso.",
      },
      {
        question: "¿Han salido ya las listas de la Beca Infantil Plus 2026-2027?",
        answer:
          "Han salido las provisionales. La propuesta de resolución provisional se publicó el 17 de septiembre de 2026 en el BOAM número 10215 y en la sede electrónica del Ayuntamiento, y el plazo de diez días hábiles para alegar empezó el 18 de septiembre y ya ha terminado. A 6 de octubre de 2026 faltan la propuesta definitiva y el decreto de concesión.",
      },
      {
        question: "¿Qué significa estar en lista de reserva en la Beca Infantil Plus?",
        answer:
          "Que la solicitud cumple todos los requisitos pero no ha entrado en el presupuesto disponible. Los Anexos II, III y IV de la propuesta son las listas de reserva de cada tramo. Si sobran fondos pueden concederse más becas: en la convocatoria 2025-2026 se publicó en julio de 2026 un decreto de nuevos beneficiarios con el dinero sobrante.",
      },
      {
        question: "¿La Beca Infantil Plus es compatible con el cheque guardería de la Comunidad de Madrid?",
        answer:
          "Sí. La ayuda municipal es compatible con las que concedan otras administraciones públicas o entidades privadas, hasta cubrir el coste completo del servicio. Son convocatorias distintas, con requisitos y plazos propios.",
      },
      {
        question: "¿Puedo solicitar ahora la Beca Infantil Plus?",
        answer:
          "No para el curso 2026-2027: el plazo fue del 9 al 28 de abril de 2026. La convocatoria de este curso se publicó a principios de abril, así que conviene estar atento en primavera a la del curso siguiente.",
      },
      {
        question: "¿Cuándo se paga la Beca Infantil Plus?",
        answer:
          "Cada dos meses, no al final del curso. Una entidad colaboradora revisa los justificantes de gasto que presenta la familia y abona los importes ya justificados.",
      },
      {
        question: "¿Vale la Beca Infantil Plus para cualquier guardería?",
        answer:
          "No. Solo para centros de titularidad privada del municipio de Madrid autorizados por la administración educativa para impartir el primer ciclo de Educación Infantil, y siempre que el niño no ocupe una plaza sostenida total o parcialmente con fondos públicos.",
      },
    ],
    relatedLinks: {
      intro: "Otras ayudas y centros de Madrid donde aplicar la beca:",
      links: [
        { label: "Cheque guardería de la Comunidad de Madrid: cómo funciona", href: "/blog/que-es-el-cheque-guarderia" },
        { label: "Cheque guardería 2026-2027: en qué punto está", href: "/blog/cheque-guarderia-madrid-subsanacion-julio-2026" },
        { label: "Guarderías privadas en Madrid", href: "/guarderias-privadas-en-madrid" },
        { label: "Escuelas infantiles en Madrid", href: "/escuelas-infantiles-en-madrid" },
        { label: "Cuánto cuesta una guardería", href: "/blog/cuanto-cuesta-una-guarderia" },
      ],
    },
  },
  {
    id: "guide-precios-guarderias-privadas-madrid-2026-2027",
    slug: "precios-guarderias-privadas-madrid-2026-2027",
    title: "Cuánto cuesta una guardería privada en Madrid en 2026-2027: las tarifas que sí publican los centros",
    excerpt:
      "Hemos revisado la información de 148 escuelas infantiles privadas de Madrid y solo 18 publican sus cuotas. Estas son las cifras, centro a centro: mensualidad, comedor, matrícula y extras.",
    category: "Precios y ayudas",
    publishedAt: "2026-10-06",
    updatedAt: "2026-10-06",
    readingTimeMinutes: 9,
    content: [
      "Preguntar el precio de una guardería privada en Madrid suele acabar en un «pide información y te lo contamos en la visita». Para saber qué cifras hay de verdad, hemos repasado una a una las webs y los documentos públicos de 148 escuelas infantiles y guarderías privadas de la ciudad de Madrid que tenemos en el directorio. Solo en 18 encontramos una tarifa de escolaridad publicada: una de cada ocho.",
      "Con esas 18 no se puede calcular un precio medio de Madrid, y no vamos a inventarlo. Lo que sí se puede hacer es enseñar las cifras tal cual, con el nombre del centro, el horario al que corresponden y lo que incluyen. En las escuelas infantiles que publican su cuota, una jornada completa con comida cuesta entre 430 y 700 euros al mes. En los colegios privados que tienen aulas de 1 y 2 años, entre unos 770 y 1.070.",
      "Todas las cifras proceden de la web o de las hojas de tarifas de cada centro, consultadas el 6 de octubre de 2026. Pueden cambiar, así que conviene confirmarlas con la escuela antes de hacer cuentas.",
    ],
    sections: [
      {
        heading: "Solo una de cada ocho publica sus cuotas",
        paragraphs: [
          "De las 148 privadas revisadas, 18 publican cuánto cuesta la escolaridad. En 89, la propia web no da ninguna cifra o remite a pedir presupuesto. En las 41 restantes no localizamos ninguna tarifa.",
          "Tampoco las 18 están igual de al día. Doce publican las tarifas del curso 2026-2027. Tres tienen una tabla de precios sin fecha, de modo que no se sabe a qué curso corresponde. Y otras tres siguen mostrando las tarifas de cursos anteriores.",
          "Hay otro límite que conviene tener presente: casi todas las que publican precios están en Chamartín, Hortaleza, Salamanca, Chamberí y Moncloa-Aravaca. Estas cifras describen a esos centros concretos y no sirven como referencia para toda la ciudad.",
        ],
      },
      {
        heading: "Jornada completa con comida: de 430 a 700 euros al mes",
        paragraphs: [
          "De menos a más, esto es lo que publican las escuelas infantiles para una jornada completa con comida, que suele ser de siete u ocho horas. Domo (Hortaleza) anuncia 430 euros por la jornada completa con comedor, en una página que no indica el curso. San Alonso de Orozco (Chamberí) cobra 320 euros de mensualidad más 170 de comedor, 490 en total, de septiembre a julio; su página de tarifas no dice qué horario cubre. El Duende Travieso II (Arganzuela), 510 euros de 9:00 a 16:30 con comida y merienda, o 580 de 8:00 a 17:00 con desayuno incluido; los bebés pagan 50 euros más. El Parque (Chamartín), 520 euros de 9:00 a 17:00 con comida y merienda, en una tabla sin fecha.",
          "Osobuco II (Chamartín) publica «desde 565 euros» de 9:00 a 17:00 con comida y merienda. Cocorico (Chamartín), 608 euros de 9:00 a 16:00 con comida: 460 de escolaridad y 148 de comedor; con la hora siguiente y la merienda son 670. El colegio Ramón y Cajal cobra en su etapa de 0 a 3 años 660 euros de 9:00 a 17:00 con comida y merienda. Casa del Niño (Chamartín), 670 euros por ocho horas con comida y 833 por diez horas con comida y merienda. Cuchitos (Salamanca) publica una única mensualidad de 690 euros para niños de 1 a 3 años y de 730 para bebés, y describe jornadas con comida y merienda hasta las 17:30. Y la escuela Waldorf de Aravaca, en su grupo de 1 a 3 años, 645 euros hasta las 14:00 con la comida incluida y 700 hasta las 16:15, en una tabla sin fecha.",
          "Dos casos se salen del patrón. El Columpio de Claudia (Sanchinarro) cobra 520 euros de 9:00 a 16:00, pero sin comedor: la comida se lleva de casa. Y Verbo Encarnado (Chamberí), un centro concertado cuyo primer ciclo es privado, cobra 300 euros de enseñanza, con salida a las 14:00, y 145 más a quien se queda al comedor.",
        ],
      },
      {
        heading: "Colegios privados con aulas de 1 y 2 años: otra escala",
        paragraphs: [
          "Los colegios privados que admiten niños antes de los 3 años publican sus honorarios con más frecuencia que las escuelas infantiles pequeñas, y sus cifras están un escalón por encima. San Patricio, en su campus de Serrano, cobra 7.700 euros al año en el aula de 1 a 2 años, con el comedor incluido, y 9.390 euros más 1.275 de comedor en la de 2 a 3; se pagan en diez mensualidades, lo que supone 770 y unos 1.067 euros al mes.",
          "Colegio Madrid FSM (Hortaleza) cobra 638 euros al mes en el primer ciclo de infantil y 185 de comedor: 823 en total. Brains Nursery School, en el barrio de Salamanca, cobra 740 euros al mes en el aula de bebés con desayuno, comida y merienda; a partir de 1 año la comida va aparte, y la cuenta sale por 906 euros al mes con 1 año (670 más 236 de almuerzo) y 945 de 2 a 4 años (709 más 236). El colegio Brains de Conde de Orgaz publica 6.980 euros al año de enseñanza para 1 y 2 años, con comedor opcional de 217 euros al mes.",
        ],
      },
      {
        heading: "Media jornada: entre 60 y 110 euros menos",
        paragraphs: [
          "Quien solo necesita la mañana paga menos, pero no la mitad. En los centros que publican las dos tarifas, la diferencia entre salir a mediodía con la comida hecha y quedarse hasta la tarde es de 60 euros en El Duende Travieso II (450 frente a 510), 80 en El Parque (440 frente a 520), 90 en Ramón y Cajal (570 frente a 660) y 107 en Osobuco II (desde 458 frente a desde 565).",
          "La opción más corta, de 9:00 a 12:00 y sin comida, cuesta desde 340 euros en Osobuco II, 380 en El Duende Travieso II y 470 en Ramón y Cajal. En Casa del Niño el mínimo que se puede contratar son seis horas con comida, por 560 euros.",
        ],
      },
      {
        heading: "Lo que no está en la mensualidad",
        paragraphs: [
          "La matrícula se paga cada curso, y varios centros advierten de que no se devuelve si el niño no llega a empezar. En las escuelas infantiles que la publican va de 105 a 420 euros: 105 en San Alonso de Orozco, donde cubre reserva de plaza, material y secretaría; 185 en Osobuco II, 200 en El Parque, 230 en El Columpio de Claudia, 300 en Cuchitos, 333 en Casa del Niño y 420 en Cocorico. El Duende Travieso II anuncia una matrícula de 150 euros y una reserva de plaza de 125. En los colegios sube: 400 euros en Ramón y Cajal, 600 en Colegio Madrid FSM, 890 en Waldorf de Aravaca para alumnos nuevos y 1.400 en San Patricio. Brains Nursery cobra una inscripción de 90 euros, pero añade una cuota anual de 380 euros en bebés y 530 en el resto.",
          "El material es el segundo extra más habitual: 250 euros al año en Cuchitos, 75 al trimestre en El Duende Travieso II, 45 al trimestre en Colegio Madrid FSM, 123 al año en Waldorf de Aravaca y un único pago de 75 euros en El Columpio de Claudia. Algunos centros exigen además uniforme, que se compra aparte.",
          "La hora extra de mañana o de tarde, contratada por meses, cuesta entre 50 y 63 euros en la mayoría: 50 en Colegio Madrid FSM, 55 en El Columpio de Claudia, 60 en El Duende Travieso II con desayuno, 62 en Cocorico con desayuno o merienda y 63 en Ramón y Cajal por hora y media. Y hay costes que no se ven hasta leer la letra pequeña: Cuchitos suma entre 5 y 15 euros al mes a quien paga con cheque guardería de empresa, según la emisora, y 2 euros por domiciliar el recibo.",
          "Fíjate también en cuántos meses se pagan. Osobuco II y San Alonso de Orozco publican tarifas de septiembre a julio, once recibos. San Patricio y Colegio Madrid FSM reparten el curso en diez.",
        ],
      },
      {
        heading: "La referencia pública: 96 euros de comedor",
        paragraphs: [
          "En las escuelas infantiles públicas de Madrid la escolaridad es gratuita, tanto en la red del Ayuntamiento como en la de la Comunidad. Para el curso 2026-2027 las familias pagan el comedor, 96 euros al mes, y el horario ampliado solo si lo usan: 12 euros al mes por cada media hora en la red municipal y 10,83 en la autonómica. Una familia que necesite comedor y una hora más al día paga 120 euros al mes en una escuela municipal.",
          "Esa es la distancia real con la privada: entre 300 y 600 euros al mes en las escuelas infantiles de este recuento. El problema de la pública no es el precio, sino que haya plaza.",
        ],
      },
      {
        heading: "Cuánto queda después de las becas",
        paragraphs: [
          "Las cuotas de arriba son antes de ayudas, y en Madrid hay dos que se pueden sumar. La beca de la Comunidad de Madrid para el primer ciclo en centros privados, el cheque guardería, es de 177 euros al mes en la convocatoria 2026-2027, o de 283 para las rentas más bajas. La Beca Infantil Plus del Ayuntamiento paga 118, 220 o 385 euros al mes según la renta per cápita. Son compatibles entre sí hasta cubrir el coste del servicio.",
          "Con una cuota de 608 euros como la de Cocorico, una familia con la beca autonómica básica pagaría 431 euros; si además cobra la cuantía mínima de la municipal, 313. Las dos ayudas tienen requisitos de renta y plazos que ya se cerraron para este curso, y a 6 de octubre de 2026 ninguna de las dos tiene resolución definitiva. Solo valen en centros privados autorizados, así que conviene preguntarlo antes de matricular.",
        ],
      },
      {
        heading: "Cómo hemos hecho este recuento",
        paragraphs: [
          "Partimos de las 148 escuelas infantiles y guarderías privadas de Madrid capital cuya ficha hemos revisado en BuscaCentro. Para cada una leímos su web y los documentos enlazados desde ella, como hojas de tarifas, circulares o impresos de matrícula, y anotamos solo lo que el propio centro publica. No hemos llamado a los centros ni usado precios de terceros, foros o reseñas.",
          "Para este artículo volvimos a abrir, el 6 de octubre de 2026, la fuente de cada cifra citada. Cuando una tabla no indica el curso lo decimos, y las tarifas de cursos pasados no se han usado para los rangos. Las sumas de escolaridad y comedor son nuestras; los importes de cada concepto son los del centro.",
          "Si representas a una escuela y quieres que añadamos o corrijamos tus tarifas, puedes pedirlo desde su ficha. Publicar el precio ahorra a las familias una llamada y, a la vista de este recuento, sigue siendo poco habitual.",
        ],
      },
    ],
    faqs: [
      {
        question: "¿Cuánto cuesta una guardería privada en Madrid en el curso 2026-2027?",
        answer:
          "En las escuelas infantiles privadas de Madrid que publican sus tarifas, una jornada completa con comida cuesta entre 430 y 700 euros al mes. En los colegios privados con aulas de 1 y 2 años, entre unos 770 y 1.070 euros. Son cifras de centros concretos, casi todos del norte y el centro de la ciudad, no una media de Madrid.",
      },
      {
        question: "¿Cuántas guarderías privadas de Madrid publican sus precios?",
        answer:
          "Pocas. De las 148 escuelas infantiles privadas de Madrid capital cuya información hemos revisado, solo 18 publican la cuota de escolaridad, y de ellas doce tienen las tarifas del curso 2026-2027. El resto no da cifras o remite a pedir información.",
      },
      {
        question: "¿Cuánto cuesta la matrícula de una escuela infantil privada en Madrid?",
        answer:
          "En las escuelas infantiles que la publican, entre 105 y 420 euros al año. En colegios privados con primer ciclo va de 400 a 1.400 euros. Suele pagarse al reservar la plaza, y varios centros advierten de que no se devuelve.",
      },
      {
        question: "¿El comedor está incluido en la cuota de la guardería?",
        answer:
          "Depende del centro. Algunos publican una tarifa por horario con la comida incluida, como El Parque, El Duende Travieso II o Ramón y Cajal. Otros lo cobran aparte: 148 euros al mes en Cocorico, 160 en Casa del Niño, 170 en San Alonso de Orozco o 236 en Brains Nursery. Al comparar, suma siempre escolaridad y comedor.",
      },
      {
        question: "¿Cuánto se paga en una escuela infantil pública de Madrid?",
        answer:
          "La escolaridad es gratuita. En el curso 2026-2027 se pagan 96 euros al mes de comedor y, si se usa, el horario ampliado: 12 euros al mes por cada media hora en las escuelas del Ayuntamiento y 10,83 en las de la Comunidad de Madrid.",
      },
      {
        question: "¿Qué ayudas rebajan la cuota de una guardería privada en Madrid?",
        answer:
          "La beca de la Comunidad de Madrid para primer ciclo en centros privados, de 177 euros al mes o 283 para las rentas más bajas, y la Beca Infantil Plus del Ayuntamiento, de 118, 220 o 385 euros al mes según la renta. Son compatibles y solo se aplican en centros privados autorizados.",
      },
    ],
    relatedLinks: {
      intro: "Las fichas de los centros citados, con la fuente de cada dato, y las guías de ayudas:",
      links: [
        { label: "Casa del Niño (Chamartín)", href: "/centro/casa-del-nino-madrid" },
        { label: "Cocorico (Chamartín)", href: "/centro/cocorico-madrid" },
        { label: "Cuchitos (Salamanca)", href: "/centro/cuchitos-madrid" },
        { label: "Domo (Hortaleza)", href: "/centro/domo-madrid" },
        { label: "El Columpio de Claudia (Sanchinarro)", href: "/centro/el-columpio-de-claudia-madrid" },
        { label: "El Duende Travieso II (Arganzuela)", href: "/centro/el-duende-travieso-ii-madrid" },
        { label: "El Parque (Chamartín)", href: "/centro/el-parque-madrid" },
        { label: "Osobuco II (Chamartín)", href: "/centro/osobuco-ii-madrid" },
        { label: "San Alonso de Orozco (Chamberí)", href: "/centro/san-alonso-de-orozco-madrid" },
        { label: "Beca Infantil Plus Madrid 2026-2027", href: "/blog/beca-infantil-plus-madrid-2026-2027" },
        { label: "Cheque guardería de la Comunidad de Madrid", href: "/blog/que-es-el-cheque-guarderia" },
        { label: "Guarderías privadas en Madrid", href: "/guarderias-privadas-en-madrid" },
      ],
    },
  },
  {
    id: "guide-guarderias-bilingues",
    slug: "guarderias-bilingues",
    title: "Guarderías bilingües: qué son y qué mirar antes de elegir una",
    excerpt:
      "Qué significa realmente «bilingüe» en el 0-3, qué diferencia hay entre iniciación al inglés e inmersión, y las preguntas clave antes de decidir.",
    category: "Guías para familias",
    publishedAt: "2026-02-10",
    updatedAt: "2026-07-12",
    readingTimeMinutes: 6,
    content: [
      "«Bilingüe» es probablemente la etiqueta más elástica del sector: puede significar desde media hora de canciones en inglés a la semana hasta educadores nativos hablando inglés todo el día. Ninguna de las dos opciones es un engaño — pero pagar precio de inmersión por media hora de canciones, sí. Esta guía te ayuda a saber qué estás contratando.",
    ],
    sections: [
      {
        heading: "Los tres niveles reales de «bilingüe» en el 0-3",
        paragraphs: [
          "Iniciación: sesiones puntuales de inglés (canciones, vocabulario, juego) unas horas a la semana, impartidas por el propio equipo o un especialista externo. Es lo más común y perfectamente válido como primer contacto con el idioma.",
          "Bilingüe estructurado: una parte significativa de la jornada transcurre en inglés, con educadores asignados al idioma y rutinas diarias en ambas lenguas. Inmersión: la lengua vehicular principal del centro es el inglés, a menudo con parte del equipo nativo. Cada nivel tiene su precio — lo importante es que el nombre y la realidad coincidan.",
        ],
      },
      {
        heading: "Qué preguntar para saber cuál es cuál",
        paragraphs: [
          "¿Cuántas horas a la semana está mi hijo expuesto al inglés, y en qué actividades? ¿Quién imparte el idioma: el equipo habitual, un especialista, personal nativo? ¿El inglés es una actividad o la lengua de las rutinas diarias (comida, cambio, juego)? Con esas tres respuestas sabrás exactamente qué nivel ofrece el centro.",
          "Y una expectativa realista: en el 0-3, el objetivo razonable es familiaridad y buena disposición hacia el idioma, no que el niño «salga hablando inglés». La continuidad en etapas posteriores importa más que la intensidad en esta.",
        ],
      },
      {
        heading: "¿Y la conexión con los colegios bilingües?",
        paragraphs: [
          "En comunidades con programas de colegios bilingües, como Madrid, algunas familias eligen guardería bilingüe pensando en esa continuidad. Conviene saber que no existe conexión automática: la admisión al colegio sigue sus propios criterios y ninguna guardería garantiza plaza. Elige la guardería bilingüe porque encaja hoy con tu familia, no como inversión de admisión futura.",
        ],
      },
    ],
  },
  {
    id: "guide-adaptacion-guarderia",
    slug: "adaptacion-a-la-guarderia",
    title: "Adaptación a la guardería: cómo hacerla más fácil",
    excerpt:
      "Cómo funciona el periodo de adaptación, cuánto dura, qué es normal y qué no, y consejos prácticos para que la transición sea más llevadera para todos.",
    category: "Guías para familias",
    publishedAt: "2026-02-15",
    updatedAt: "2026-07-12",
    readingTimeMinutes: 6,
    content: [
      "El periodo de adaptación es la transición gradual con la que el niño —y la familia— se incorpora al centro: primeros días con horarios cortos que se van ampliando, a veces con presencia de los padres al principio. Que cueste es normal; que se haga bien marca la diferencia entre unas semanas duras y unos meses difíciles.",
    ],
    sections: [
      {
        heading: "Cómo suele organizarse y cuánto dura",
        paragraphs: [
          "El formato más habitual: empezar con una o dos horas diarias e ir ampliando el tiempo a lo largo de una o dos semanas, retrasando la incorporación al comedor y la siesta hasta que el niño esté cómodo. Algunos centros invitan a los padres a quedarse los primeros días; otros prefieren despedidas breves desde el principio. Ninguno de los dos enfoques es «el correcto» — pero pregunta cuál sigue el centro y por qué.",
          "La duración real depende del niño: la mayoría se estabiliza entre una y tres semanas, aunque los lunes cuesten durante algo más de tiempo. Si puedes, evita incorporaciones en fechas donde no podrás mantener la rutina (viajes, mudanzas, llegada de un hermano).",
        ],
      },
      {
        heading: "Qué es normal y qué conviene consultar",
        paragraphs: [
          "Normal: llanto en la entrada (que suele parar a los pocos minutos de irte), más apego en casa, alteraciones de sueño o apetito las primeras semanas, y algún retroceso puntual tras vacaciones o enfermedad. Todo eso remite con la rutina.",
          "Conviene hablar con el centro (o el pediatra) si tras varias semanas el malestar va a más en vez de a menos, si el niño deja de comer o dormir de forma sostenida, o si el centro no te da información concreta de cómo pasa el día. Un buen equipo te contará qué hace tu hijo cuando tú no estás — y eso es exactamente lo que necesitas oír para calmarte tú también.",
        ],
      },
      {
        heading: "Consejos que funcionan",
        paragraphs: [
          "Despedidas breves y consistentes: alargar el adiós alarga el llanto. Mismo ritual cada día, mismo mensaje («vengo después de la siesta») y salir sin volver a entrar. Si necesitas llorar, hazlo fuera — los niños leen tu cara mejor de lo que crees.",
          "Cuida también tu adaptación: los primeros días casi siempre son más duros para la familia que para el niño. Ten margen laboral esas semanas si puedes (jornadas más cortas, apoyo de abuelos para imprevistos), porque además las primeras semanas de centro suelen venir con los primeros virus.",
        ],
      },
    ],
  },
  {
    id: "guide-plaza-escuela-infantil-madrid",
    slug: "como-pedir-plaza-escuela-infantil-madrid",
    title: "Cómo pedir plaza en una escuela infantil pública de Madrid",
    excerpt:
      "El proceso de admisión 0-3 en Madrid paso a paso: cuándo se solicita, cómo funciona el baremo de puntos, y qué hacer si no consigues plaza.",
    category: "Precios y ayudas",
    publishedAt: "2026-07-12",
    readingTimeMinutes: 8,
    content: [
      "Conseguir plaza en una escuela infantil pública de Madrid es, para muchas familias, la diferencia entre pagar cero euros de escolaridad o varios cientos al mes en la privada. Pero el proceso tiene plazos cerrados, un baremo de puntos que conviene entender, y más demanda que oferta en muchos distritos. Esta guía lo explica paso a paso.",
      "En Madrid conviven dos redes públicas: las escuelas infantiles municipales (Ayuntamiento de Madrid) y las de la Comunidad de Madrid, además de las casas de niños. La escolaridad es gratuita en ambas desde el curso 2019-2020 — se paga aparte comedor y horario ampliado según precios públicos.",
    ],
    sections: [
      {
        heading: "Cuándo se pide: el plazo de primavera",
        paragraphs: [
          "La solicitud se presenta una vez al año, en un plazo que suele abrirse en abril para el curso que empieza en septiembre. Como referencia, en el proceso para el curso 2026-2027 el plazo fue del 6 al 17 de abril. Las fechas exactas se publican cada año en los canales oficiales del Ayuntamiento y de la Comunidad de Madrid — márcalo en el calendario en marzo para no llegar tarde.",
          "Se presenta una única solicitud por niño con varios centros ordenados por preferencia. Puedes incluir centros de ambas redes; revisa bien las instrucciones de cada convocatoria porque los formularios y canales pueden diferir entre la red municipal y la autonómica.",
        ],
      },
      {
        heading: "Cómo funciona el baremo de puntos",
        paragraphs: [
          "Las plazas se asignan por puntuación. Los criterios habituales incluyen: hermanos ya matriculados en el centro (de los que más puntúan), proximidad del domicilio familiar o del lugar de trabajo, situación laboral de los tutores, renta familiar, familia numerosa o monoparental, y discapacidad en la unidad familiar. El detalle exacto y los puntos de cada criterio se publican con cada convocatoria.",
          "Consejo práctico: antes de ordenar tus preferencias, mira las adjudicaciones de años anteriores si el centro las publica o pregunta directamente cuántas solicitudes tuvieron el año pasado por plaza. Poner primero un centro muy demandado sin puntos suficientes puede tener sentido igualmente (no penaliza), pero conviene que el resto de tu lista sea realista.",
        ],
      },
      {
        heading: "Resultados, listas de espera y matrícula",
        paragraphs: [
          "Tras el plazo de solicitud llegan las listas provisionales, el periodo de reclamaciones y las listas definitivas, habitualmente entre mayo y junio. Si obtienes plaza, tendrás un plazo corto para formalizar la matrícula — no lo dejes pasar, porque la plaza no reclamada corre lista.",
          "Si no obtienes plaza, quedas en lista de espera del centro, que se mueve más de lo que parece durante el verano y el primer trimestre (renuncias, traslados). Aún así, ten un plan B: muchas familias reservan en un centro privado —donde el cheque guardería de la Comunidad de Madrid puede reducir la cuota entre 177 y 283 euros mensuales según renta— y renuncian si la pública llega después.",
        ],
      },
      {
        heading: "Fuera de plazo: qué opciones quedan",
        paragraphs: [
          "Si te mudas a Madrid o necesitas plaza a mitad de curso, existe la solicitud fuera de plazo ordinario contra las vacantes disponibles, aunque en la práctica las vacantes en aulas de bebés escasean. En paralelo, la privada admite incorporaciones todo el año si hay hueco. Puedes comparar las escuelas infantiles públicas y privadas de Madrid en nuestro directorio para tener localizadas las alternativas de tu zona antes de que las necesites.",
        ],
      },
    ],
    faqs: [
      {
        question: "¿Cuándo se pide plaza en una escuela infantil pública de Madrid?",
        answer:
          "La solicitud se presenta una vez al año, en un plazo que suele abrirse en abril para el curso que empieza en septiembre. Como referencia, en el proceso para el curso 2026-2027 el plazo fue del 6 al 17 de abril. Las fechas exactas se publican cada año en los canales oficiales del Ayuntamiento y de la Comunidad de Madrid.",
      },
      {
        question: "¿Cómo se asignan las plazas en las escuelas infantiles públicas de Madrid?",
        answer:
          "Las plazas se asignan por puntuación. Los criterios habituales incluyen hermanos ya matriculados en el centro, proximidad del domicilio o del lugar de trabajo, situación laboral de los tutores, renta familiar, familia numerosa o monoparental y discapacidad en la unidad familiar. El detalle y los puntos de cada criterio se publican con cada convocatoria.",
      },
      {
        question: "¿Qué hago si no consigo plaza pública en Madrid?",
        answer:
          "Quedas en lista de espera del centro, que se mueve durante el verano y el primer trimestre por renuncias y traslados. Como plan B, muchas familias reservan en un centro privado, donde el cheque guardería de la Comunidad de Madrid puede reducir la cuota entre 177 y 283 euros mensuales según renta, y renuncian si la pública llega después.",
      },
    ],
    relatedLinks: {
      intro: "Ten localizadas las alternativas de tu zona en Madrid:",
      links: [
        { label: "Escuelas infantiles en Madrid", href: "/escuelas-infantiles-en-madrid" },
        { label: "Guarderías en Madrid", href: "/guarderias-en-madrid" },
      ],
    },
  },
  {
    id: "guide-preinscripcio-bressol-barcelona",
    slug: "preinscripcion-escola-bressol-barcelona",
    title: "Preinscripción en las escoles bressol de Barcelona: guía completa",
    excerpt:
      "Cómo funciona la preinscripció a las escoles bressol municipals de Barcelona: plazos, baremo, tarificación social y qué hacer si no obtienes plaza.",
    category: "Precios y ayudas",
    publishedAt: "2026-07-12",
    readingTimeMinutes: 8,
    content: [
      "Las escoles bressol municipals son la columna vertebral de la etapa 0-3 en Barcelona: una red de más de un centenar de centros del Ayuntamiento con proceso de acceso público y cuotas por tarificación social. Conseguir plaza pasa por la preinscripció anual — un proceso con plazos cerrados que conviene preparar con antelación. Esta guía lo explica en castellano, paso a paso.",
      "Además de las bressol municipales, en Barcelona existen llars d'infants de la Generalitat (también públicas, con su propio circuito) y una amplia oferta privada. Esta guía se centra en el proceso municipal, que es el que concentra la mayor parte de las solicitudes.",
    ],
    sections: [
      {
        heading: "Cuándo es la preinscripció y cómo se presenta",
        paragraphs: [
          "El plazo se abre cada primavera para el curso siguiente: como referencia, para el curso 2026-2027 fue del 4 al 15 de mayo. Las fechas exactas se publican cada año en el portal de escoles bressol del Ayuntamiento de Barcelona — si tu hijo nacerá antes del inicio de curso, consulta las condiciones de la convocatoria, que contemplan este supuesto.",
          "La solicitud se presenta de forma telemática indicando varios centros por orden de preferencia. Conviene visitar los centros antes (muchas bressol organizan jornadas de puertas abiertas en los meses previos) y construir una lista realista mezclando centros muy demandados con opciones con más rotación.",
        ],
      },
      {
        heading: "El baremo: cómo se asignan las plazas",
        paragraphs: [
          "Las plazas se adjudican por puntos. Los criterios clásicos: hermanos ya escolarizados en el centro, proximidad del domicilio o del trabajo, renta (con atención a situaciones de vulnerabilidad), y circunstancias familiares específicas. En caso de empate, se resuelve por sorteo público. El detalle exacto de puntos se publica en cada convocatoria.",
          "Las aulas de lactants (bebés) son las más disputadas de toda la red — si buscas plaza de bebé, prepara alternativas. Para los grupos de 1-2 y 2-3 años la rotación es mayor y las opciones reales aumentan.",
        ],
      },
      {
        heading: "Cuánto cuesta: la tarificación social",
        paragraphs: [
          "Barcelona no tiene una cuota única: aplica tarificació social, de modo que cada familia paga según su renta y tamaño, en un rango que va aproximadamente de 50 a 406 euros mensuales con comedor incluido, según los tramos vigentes. El Ayuntamiento ofrece un simulador oficial para calcular tu cuota antes de solicitar.",
          "Esto significa que para rentas bajas y medias la bressol municipal es imbatible en precio, mientras que para rentas altas la diferencia con algunos centros privados se estrecha — motivo de más para tener las dos opciones estudiadas.",
        ],
      },
      {
        heading: "Si no obtienes plaza: lista de espera y alternativas",
        paragraphs: [
          "Quien no obtiene plaza queda en lista de espera, que se mueve durante el verano y el otoño con renuncias y traslados. En paralelo, la oferta privada de Barcelona (llars d'infants privadas y guarderías) admite matrícula durante todo el año si hay vacantes.",
          "Puedes comparar las escuelas infantiles públicas de Barcelona y la oferta privada de cada distrito en nuestro directorio, para tener localizado un plan B concreto en tu zona antes de que salgan las listas definitivas.",
        ],
      },
    ],
    faqs: [
      {
        question: "¿Cuándo es la preinscripció de las escoles bressol de Barcelona?",
        answer:
          "El plazo se abre cada primavera para el curso siguiente. Como referencia, para el curso 2026-2027 fue del 4 al 15 de mayo, con solicitud telemática indicando varios centros por orden de preferencia. Las fechas exactas se publican cada año en el portal de escoles bressol del Ayuntamiento de Barcelona.",
      },
      {
        question: "¿Cómo se asignan las plazas en las escoles bressol de Barcelona?",
        answer:
          "Las plazas se adjudican por puntos. Los criterios clásicos son hermanos ya escolarizados en el centro, proximidad del domicilio o del trabajo, renta (con atención a situaciones de vulnerabilidad) y circunstancias familiares específicas. En caso de empate, se resuelve por sorteo público. El detalle exacto de puntos se publica en cada convocatoria.",
      },
      {
        question: "¿Cuánto cuesta una escola bressol municipal de Barcelona?",
        answer:
          "Barcelona no tiene una cuota única: aplica tarificació social, de modo que cada familia paga según su renta y tamaño, en un rango que va aproximadamente de 50 a 406 euros mensuales con comedor incluido, según los tramos vigentes. El Ayuntamiento ofrece un simulador oficial para calcular tu cuota antes de solicitar.",
      },
    ],
    relatedLinks: {
      intro: "Compara la oferta pública y privada de cada distrito de Barcelona:",
      links: [
        { label: "Escuelas infantiles en Barcelona", href: "/escuelas-infantiles-en-barcelona" },
        { label: "Guarderías en Barcelona", href: "/guarderias-en-barcelona" },
      ],
    },
  },
  {
    id: "guide-bono-infantil-valencia-2026-2027",
    slug: "bono-infantil-valencia-2026-2027",
    title: "Bono Infantil Valencia 2026-2027: cuantías y listados provisionales ya publicados",
    excerpt:
      "Los listados provisionales del Bono Infantil 2026-2027 se publicaron en septiembre y el plazo de alegaciones ya ha terminado. Cuantías por edad, en qué centros aplica y cómo consultar tu resolución.",
    category: "Precios y ayudas",
    publishedAt: "2026-07-15",
    updatedAt: "2026-10-06",
    readingTimeMinutes: 4,
    content: [
      "La Generalitat Valenciana ha confirmado que mantiene por tercer curso consecutivo la gratuidad de la educación infantil de 0 a 3 años, con una inversión de 163 millones de euros para el curso 2026-2027. De esa cantidad, 64,6 millones corresponden al ejercicio 2026 y 98,3 millones al presupuesto de 2027.",
      "El programa —conocido como Bono Infantil— financia la escolarización en centros privados autorizados de Educación Infantil y en escuelas infantiles municipales de primer ciclo. El plazo ordinario de solicitud terminó el 30 de julio de 2026 y los listados provisionales se publicaron en septiembre: el día 8 los de las escuelas infantiles municipales y el día 17 los de los centros privados.",
    ],
    sections: [
      {
        heading: "Cuantías de la ayuda por tramo de edad",
        paragraphs: [
          "Para el curso 2026-2027, las ayudas mensuales en centros privados autorizados alcanzan hasta 460 euros para el tramo de 0-1 año, 350 euros para el de 1-2 años y 300 euros para el de 2-3 años. En las escuelas infantiles municipales la financiación se establece mediante módulos por aula, con importes que oscilan entre los 3.680 y los 6.000 euros mensuales.",
          "Como en cursos anteriores, «gratuidad» no siempre significa coste cero absoluto: el bono cubre el servicio educativo básico, pero servicios como el comedor o el horario ampliado pueden quedar fuera. Confirma siempre con el centro qué te quedaría por pagar cada mes con tu caso concreto, y contrasta las cifras en los canales oficiales de la Generalitat antes de hacer números definitivos.",
        ],
      },
      {
        heading: "En qué fase está el Bono Infantil 2026-2027",
        paragraphs: [
          "El plazo ordinario para presentar solicitudes terminó el 30 de julio de 2026, y desde el 4 de agosto se admiten solicitudes excepcionales. El 8 de septiembre se publicó el listado provisional de las escuelas infantiles municipales, con alegaciones del 9 al 22 de septiembre. El 17 de septiembre salió el de los centros privados, con alegaciones del 18 de septiembre al 1 de octubre. Los dos plazos de alegaciones han terminado.",
          "Cada familia puede consultar su resolución provisional en la aplicación del Bono Infantil de la Generalitat (gestioboinfantil.edu.gva.es), y los centros acceden al listado de admitidos y excluidos desde su propia aplicación. A 6 de octubre de 2026, la Conselleria no ha anunciado todavía el listado definitivo. Si en el provisional apareces como excluido y presentaste alegaciones, tu centro es quien puede decirte en qué estado está.",
        ],
      },
      {
        heading: "En qué centros aplica y cuántas familias se benefician",
        paragraphs: [
          "El bono aplica tanto en la red pública (escoles infantils municipals y escuelas de la Generalitat) como en los centros privados de primer ciclo adheridos al programa, que son la gran mayoría de los autorizados. El centro lo gestiona directamente: la familia ve la cuota reducida o eliminada, sin tener que tramitar el cobro por su cuenta.",
          "La medida no es menor por volumen: en el curso 2024-2025 se beneficiaron 42.706 alumnos y en el 2025-2026 se superaron las 45.000 solicitudes. Al comparar centros en Valencia, la pregunta clave ya no es «¿cuánto cuesta?» sino «¿está adherido al Bono Infantil y qué me quedaría por pagar cada mes?». Cualquier centro adherido te lo calcula al momento.",
        ],
      },
    ],
    faqs: [
      {
        question: "¿Cuánto es el Bono Infantil de Valencia para el curso 2026-2027?",
        answer:
          "En centros privados autorizados, las ayudas mensuales alcanzan hasta 460 euros en el tramo de 0-1 año, 350 euros en el de 1-2 años y 300 euros en el de 2-3 años. En las escuelas infantiles municipales la financiación se articula por módulos de aula, entre 3.680 y 6.000 euros mensuales. La Generalitat destina 163 millones de euros al programa este curso.",
      },
      {
        question: "¿Se puede solicitar todavía el Bono Infantil en Valencia?",
        answer:
          "El plazo ordinario terminó el 30 de julio de 2026. Desde el 4 de agosto solo se admiten solicitudes excepcionales. Si tu hijo se incorpora ahora a una escuela, pregunta allí si tu caso entra en esa vía y cómo se tramita.",
      },
      {
        question: "¿Dónde consulto si me han concedido el Bono Infantil 2026-2027?",
        answer:
          "En la aplicación del Bono Infantil de la Generalitat Valenciana (gestioboinfantil.edu.gva.es), donde cada solicitante puede ver su resolución provisional. El listado provisional de centros privados se publicó el 17 de septiembre de 2026 y el de escuelas municipales el 8 de septiembre.",
      },
      {
        question: "¿En qué centros se aplica el Bono Infantil de Valencia?",
        answer:
          "Se aplica en centros privados autorizados de Educación Infantil de primer ciclo adheridos al programa y en escuelas infantiles municipales. El centro gestiona la ayuda directamente, así que la familia ve la cuota reducida o eliminada. Conviene confirmar la adhesión al bono antes de matricular.",
      },
      {
        question: "¿La gratuidad cubre el comedor y el horario ampliado?",
        answer:
          "No necesariamente. El Bono Infantil cubre el servicio educativo básico del primer ciclo, pero servicios como el comedor, la matinera o la vespertina y otras actividades complementarias pueden quedar fuera. Conviene pedir siempre al centro el desglose de lo que quedaría por pagar cada mes.",
      },
    ],
    relatedLinks: {
      intro: "Consulta los centros de Valencia y confirma su adhesión al bono:",
      links: [
        { label: "Cómo funciona la gratuidad del 0-3 en Valencia", href: "/blog/bono-infantil-valencia" },
        { label: "Escuelas infantiles en Valencia", href: "/escuelas-infantiles-en-valencia" },
        { label: "Guarderías en Valencia", href: "/guarderias-en-valencia" },
      ],
    },
  },
  {
    id: "guide-bono-infantil-valencia",
    slug: "bono-infantil-valencia",
    title: "Bono Infantil en Valencia: así funciona la gratuidad del 0-3",
    excerpt:
      "Qué es el Bono Infantil de la Generalitat Valenciana, qué tramos de edad cubre, en qué centros se aplica y qué paga (y qué no) una familia en Valencia.",
    category: "Precios y ayudas",
    publishedAt: "2026-07-12",
    readingTimeMinutes: 7,
    content: [
      "Desde el curso 2024-2025, la Comunitat Valenciana aplica la gratuidad de la educación infantil de 0 a 3 años a través del Bono Infantil: una ayuda de la Generalitat que se gestiona directamente entre la administración y el centro, sin que la familia tenga que hacer ningún trámite específico para cobrarla. Es, hoy por hoy, el marco más favorable de las grandes comunidades para escolarizar a un menor de 3 años.",
      "Aun así, «gratuidad» no significa que todo sea gratis para todos, y conviene entender qué cubre exactamente el bono, en qué centros aplica y qué costes pueden quedar fuera. Esta guía lo aclara.",
    ],
    sections: [
      {
        heading: "Qué cubre el Bono Infantil y para qué edades",
        paragraphs: [
          "El bono cubre el coste del servicio educativo básico del primer ciclo. El tramo de 2-3 años es gratuito con carácter general para todas las familias. En los tramos de 0-1 y 1-2 años, las bonificaciones son muy amplias y dependen de la convocatoria vigente, de modo que muchas familias pagan poco o nada también en esas edades.",
          "Lo que puede quedar fuera del bono: el comedor, el horario ampliado (matinera/vespertina), y actividades o servicios complementarios que cada centro ofrezca. Es decir, una familia valenciana típica con un niño de 2 años paga hoy el comedor y poco más — pero ese «poco más» varía según el centro, así que pide siempre el desglose.",
        ],
      },
      {
        heading: "En qué centros se aplica",
        paragraphs: [
          "El bono aplica tanto en la red pública (escoles infantils municipals del Ajuntament de València y escuelas de la Generalitat) como en los centros privados de primer ciclo adheridos al programa — que son la gran mayoría de los autorizados. El centro lo gestiona directamente: la familia simplemente ve la cuota reducida o eliminada.",
          "Al comparar centros en Valencia, la pregunta clave ya no es «¿cuánto cuesta?» sino «¿está adherido al Bono Infantil y qué me quedaría por pagar cada mes con mi caso concreto?». Cualquier centro adherido te lo calcula al momento.",
        ],
      },
      {
        heading: "Pública o privada en Valencia: qué cambia con el bono",
        paragraphs: [
          "Con la gratuidad extendida a los privados adheridos, la diferencia entre pública y privada en Valencia se juega hoy más en horarios, servicios y proyecto que en precio. La pública mantiene su proceso de preinscripción municipal anual con baremo (el plazo suele abrirse en primavera); la privada adherida permite matrícula durante todo el año si hay plazas.",
          "Puedes consultar las escuelas infantiles públicas de Valencia y las guarderías privadas de cada barrio en nuestro directorio, y confirmar con cada centro su adhesión al bono y el coste real mensual para tu situación.",
        ],
      },
    ],
    faqs: [
      {
        question: "¿Qué es el Bono Infantil de la Comunitat Valenciana?",
        answer:
          "Es una ayuda de la Generalitat Valenciana que, desde el curso 2024-2025, aplica la gratuidad de la educación infantil de 0 a 3 años. Se gestiona directamente entre la administración y el centro, sin que la familia tenga que hacer ningún trámite específico para cobrarla: simplemente ve la cuota reducida o eliminada.",
      },
      {
        question: "¿Qué tramos de edad cubre el Bono Infantil en Valencia?",
        answer:
          "El tramo de 2-3 años es gratuito con carácter general para todas las familias. En los tramos de 0-1 y 1-2 años, las bonificaciones son muy amplias y dependen de la convocatoria vigente, de modo que muchas familias pagan poco o nada también en esas edades.",
      },
      {
        question: "¿Qué costes no cubre el Bono Infantil?",
        answer:
          "El bono cubre el servicio educativo básico del primer ciclo, pero puede dejar fuera el comedor, el horario ampliado (matinera o vespertina) y las actividades o servicios complementarios que cada centro ofrezca. Una familia valenciana típica con un niño de 2 años paga hoy el comedor y poco más; conviene pedir siempre el desglose.",
      },
      {
        question: "¿En qué centros se aplica el Bono Infantil de Valencia?",
        answer:
          "Se aplica tanto en la red pública (escoles infantils municipals y escuelas de la Generalitat) como en los centros privados de primer ciclo adheridos al programa, que son la gran mayoría de los autorizados. El centro lo gestiona directamente, así que conviene confirmar su adhesión al bono antes de matricular.",
      },
    ],
    relatedLinks: {
      intro: "Consulta los centros de Valencia y confirma su adhesión al bono:",
      links: [
        { label: "Cuantías y plazo del Bono Infantil 2026-2027", href: "/blog/bono-infantil-valencia-2026-2027" },
        { label: "Escuelas infantiles en Valencia", href: "/escuelas-infantiles-en-valencia" },
        { label: "Guarderías en Valencia", href: "/guarderias-en-valencia" },
      ],
    },
  },
  {
    id: "guide-programa-ayuda-familias-andalucia",
    slug: "programa-ayuda-familias-andalucia",
    title: "Programa de Ayuda a las Familias en Andalucía: cómo funciona la bonificación del 0-3",
    excerpt:
      "Qué es el Programa de Ayuda a las Familias de la Junta de Andalucía, qué servicios bonifica, en qué centros se aplica y cuáles son los seis plazos de solicitud del curso 2026-2027.",
    category: "Precios y ayudas",
    publishedAt: "2026-08-10",
    updatedAt: "2026-08-10",
    readingTimeMinutes: 6,
    content: [
      "En Andalucía, el coste de una plaza de primer ciclo de Educación Infantil no depende solo del centro que elijas: depende sobre todo de si ese centro está adherido al Programa de Ayuda a las Familias y de la renta de tu unidad familiar. Es el sistema con el que la Junta de Andalucía bonifica el precio de los servicios del 0-3, y explica por qué dos familias pueden pagar cantidades muy distintas por el mismo centro.",
      "A diferencia de otras convocatorias, esta no tiene un único plazo anual: el curso 2026-2027 se organiza en seis procedimientos de selección sucesivos, de modo que una familia que escolariza a su hijo en mitad de curso también puede solicitar la ayuda. Esta guía explica el funcionamiento, los plazos y qué conviene preguntar en el centro.",
    ],
    sections: [
      {
        heading: "Qué bonifica exactamente el programa",
        paragraphs: [
          "La jornada de los centros de primer ciclo en Andalucía se organiza de 7:30 a 17:00 h de forma ininterrumpida, pero no es un bloque único a efectos de precio. Se distingue el servicio de atención socioeducativa (de 9:00 a 15:30 h, que incluye el comedor), el aula matinal (de 7:30 a 9:00 h) y el aula de tarde (de 15:30 a 17:00 h).",
          "La ayuda funciona como un descuento sobre el precio de esos servicios, calculado en función de la renta per cápita de la unidad familiar y del número de miembros, además de los supuestos de gratuidad que recoge la normativa. El tramo de 2-3 años viene aplicando la gratuidad del servicio de atención socioeducativa, y la Junta ha ido ampliando la medida a tramos de menor edad en cursos sucesivos. Como las condiciones concretas se fijan en cada convocatoria, conviene confirmar en el centro qué te correspondería en tu caso antes de dar por hecho un importe.",
          "Un matiz que suele generar confusión: los servicios complementarios (aula matinal y aula de tarde) se bonifican según renta, pero no siempre quedan a coste cero aunque la atención socioeducativa sí lo esté. Si necesitas horario ampliado, pide el desglose por servicios y no solo la cuota total.",
        ],
      },
      {
        heading: "En qué centros se aplica: la palabra clave es «adherido»",
        paragraphs: [
          "El programa no cubre cualquier centro. Solo se aplica en los centros educativos de primer ciclo de Educación Infantil que están adheridos al programa de ayuda, que pueden ser tanto de titularidad pública como privados que se han sumado al convenio. Un centro privado no adherido queda fuera: sus precios los fija libremente y la bonificación autonómica no le es de aplicación.",
          "Por eso, al comparar centros en Andalucía la pregunta más rentable no es «¿cuánto cuesta?» sino «¿está adherido al Programa de Ayuda a las Familias?». El listado oficial de centros adheridos se consulta en el Portal de Escolarización de la Consejería, y el propio centro puede confirmártelo y calcularte el importe estimado según tu situación.",
          "En nuestras fichas de centros de Andalucía indicamos, cuando consta en el registro oficial, si el centro figura adherido al programa. Es un dato que cambia de un curso a otro, así que conviene contrastarlo siempre con el centro antes de matricular.",
        ],
      },
      {
        heading: "Los seis plazos del curso 2026-2027",
        paragraphs: [
          "La convocatoria del curso 2026-2027 (Resolución de 30 de marzo de 2026, publicada en BOJA) establece seis procedimientos de selección sucesivos, con estos plazos de presentación de solicitudes: del 7 de abril al 6 de mayo; del 1 de septiembre al 31 de octubre; del 1 de noviembre al 31 de diciembre; del 1 de enero al 28 de febrero; del 1 de marzo al 30 de abril; y del 1 de mayo al 30 de junio.",
          "Esto es más flexible de lo que parece: si no solicitaste la ayuda en primavera, o si vas a escolarizar a tu hijo una vez empezado el curso, el segundo procedimiento abre el 1 de septiembre de 2026 y se cierra el 31 de octubre. No hace falta esperar al curso siguiente.",
          "Ten en cuenta que la ayuda tiene carácter anual: hay que solicitarla para cada curso escolar, aunque ya se haya obtenido el año anterior. Y se resuelve en régimen de concurrencia competitiva, así que presentar la solicitud completa y en plazo importa.",
        ],
      },
      {
        heading: "Qué preparar antes de solicitarla",
        paragraphs: [
          "El cálculo se apoya en la renta per cápita de la unidad familiar referida al periodo impositivo anterior, junto con el número de miembros que la componen. Conviene tener a mano la documentación de ingresos, el libro de familia o documentación equivalente y los datos de matrícula o reserva de plaza en el centro.",
          "La solicitud puede presentarse de forma telemática a través de la Secretaría Virtual de los centros educativos o presencialmente en el propio centro. Si tienes dudas sobre qué tramo te corresponde, el centro adherido está acostumbrado a hacer ese cálculo y es la vía más rápida para salir de dudas.",
        ],
      },
    ],
    faqs: [
      {
        question: "¿Qué es el Programa de Ayuda a las Familias de Andalucía?",
        answer:
          "Es el sistema con el que la Junta de Andalucía bonifica el precio de los servicios del primer ciclo de Educación Infantil (0-3 años). La ayuda se aplica como un descuento sobre el precio que paga la familia al centro, calculado según la renta per cápita de la unidad familiar y el número de miembros, además de los supuestos de gratuidad previstos en la normativa.",
      },
      {
        question: "¿Hasta cuándo se puede solicitar la ayuda en el curso 2026-2027?",
        answer:
          "La convocatoria establece seis procedimientos de selección sucesivos. El segundo va del 1 de septiembre al 31 de octubre de 2026, y después hay plazos del 1 de noviembre al 31 de diciembre, del 1 de enero al 28 de febrero, del 1 de marzo al 30 de abril y del 1 de mayo al 30 de junio. Quien no la pidió en primavera puede solicitarla en alguno de estos periodos.",
      },
      {
        question: "¿Se aplica la ayuda en cualquier guardería de Andalucía?",
        answer:
          "No. Solo se aplica en los centros de primer ciclo de Educación Infantil adheridos al programa de ayuda. Un centro privado no adherido fija sus precios libremente y la bonificación no le es de aplicación. El listado de centros adheridos se consulta en el Portal de Escolarización de la Consejería y conviene confirmarlo con el propio centro.",
      },
      {
        question: "¿La gratuidad cubre también el comedor y el horario ampliado?",
        answer:
          "El servicio de atención socioeducativa (de 9:00 a 15:30 h) incluye el comedor. El aula matinal (7:30-9:00 h) y el aula de tarde (15:30-17:00 h) son servicios complementarios que se bonifican según la renta familiar, pero no siempre quedan a coste cero. Conviene pedir al centro el desglose por servicios y no solo la cuota total.",
      },
      {
        question: "¿Hay que pedir la ayuda todos los años?",
        answer:
          "Sí. El programa tiene carácter anual, de modo que la ayuda debe solicitarse para cada curso escolar aunque se haya obtenido en el curso anterior. Además se resuelve en régimen de concurrencia competitiva, por lo que conviene presentar la solicitud completa y dentro de plazo.",
      },
    ],
    relatedLinks: {
      intro: "Consulta centros de primer ciclo en Andalucía y confirma con cada uno su adhesión al programa:",
      links: [
        { label: "Guarderías en Sevilla", href: "/guarderias-en-sevilla" },
        { label: "Guarderías en Málaga", href: "/guarderias-en-malaga" },
        { label: "Guarderías en Córdoba", href: "/guarderias-en-cordoba" },
        { label: "Guarderías en Granada", href: "/guarderias-en-granada" },
        { label: "Guarderías en Jerez de la Frontera", href: "/guarderias-en-jerez-de-la-frontera" },
        { label: "Cuánto cuesta una guardería: precios y ayudas por ciudad", href: "/blog/cuanto-cuesta-una-guarderia" },
      ],
    },
  },
];
