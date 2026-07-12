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
  },
];
