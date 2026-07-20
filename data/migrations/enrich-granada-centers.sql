-- enrich-granada-centers.sql
-- Enriquecimiento de long_description para los 31 centros "finos" de Granada capital:
-- centros sin servicios confirmados (services vacio) y sin long_description previa,
-- que por ello quedan en noindex. Con esta long_description pasan a ser indexables.
-- Redaccion basada EXCLUSIVAMENTE en datos ya presentes en
-- data/migrations/insert-granada-centers.sql y data/enrichment/granada-centers.json
-- (nombre, direccion, titularidad privada, edades 4-36 meses, adhesion o no al
-- Programa de Ayuda a las Familias de la Junta de Andalucia). No se inventan
-- servicios, horarios ni metodologias; el contexto generico se formula como
-- caracteristica de la etapa 0-3, no del centro.
-- Solo actualiza long_description y updated_at, identificando cada centro por slug.
-- NO toca: services, verification_status, confidence_level, verified_at, faqs,
-- pedagogical_approach, schedule ni ningun otro campo.
-- Centros afectados: 31 (26 privados adheridos al Programa de Ayuda a las Familias,
-- 5 privados no adheridos: la-asuncion, caracoles, mofletes, suena-by-nerea-bedmar,
-- alqueria).
-- Generado: 2026-07-20. Revisar antes de ejecutar. NO ejecutado.
-- Sin DELETE / DROP / TRUNCATE.
-- Rollback disponible en data/migrations/rollback-enrich-granada-centers.sql.

BEGIN;

-- LA ASUNCION (la-asuncion-granada) [privado, no adherido]
UPDATE centers SET
  long_description = E'La Asunción es un centro privado de educación infantil de primer ciclo situado en la calle Martínez de la Rosa, 5 (18002), en Granada capital. Acoge a niños desde los 4 meses hasta los 3 años, la etapa anterior al segundo ciclo de infantil.\n\nEl centro está inscrito en el registro de centros de primer ciclo de la Junta de Andalucía, aunque en la consulta realizada no figuraba adherido al Programa de Ayuda a las Familias, el sistema andaluz de bonificación de precios para esta etapa. Tampoco constan servicios confirmados en fuente oficial, de modo que cuestiones como comedor, horario ampliado o periodo de adaptación conviene tratarlas con el propio equipo.\n\nLos datos de esta ficha proceden de fuentes públicas y pueden quedar incompletos. Antes de decidir, lo más práctico es llamar al centro y preguntar por plazas disponibles, horarios y cuotas actualizadas.',
  updated_at = NOW()
WHERE slug = 'la-asuncion-granada';

-- MAMI (mami-granada) [privado, adherido]
UPDATE centers SET
  long_description = E'En la calle Arabial, 79 (edificio Alhambra, 18004) desarrolla su actividad Mami, una guardería privada de Granada dedicada al primer ciclo de educación infantil, que abarca de los 4 meses a los 3 años.\n\nEl centro está adherido al Programa de Ayuda a las Familias de la Junta de Andalucía, de modo que las familias pueden solicitar la bonificación del precio del servicio según la normativa vigente. Más allá de este dato, el registro oficial no recoge servicios adicionales confirmados: horario concreto, comedor o forma de organizar la adaptación son aspectos que se gestionan directamente con el equipo educativo.\n\nEsta ficha se ha elaborado con información de fuentes públicas. Para confirmar disponibilidad de plaza, cuotas y funcionamiento del día a día, la vía más fiable es el contacto directo con el centro.',
  updated_at = NOW()
WHERE slug = 'mami-granada';

-- SNOOPY (snoopy-granada) [privado, adherido]
UPDATE centers SET
  long_description = E'Snoopy recibe a pequeños de entre 4 meses y 3 años en la calle Palencia, 17, dentro del código postal 18007 de Granada. Se trata de un centro de titularidad privada centrado en el primer ciclo de educación infantil.\n\nConsta como adherido al Programa de Ayuda a las Familias, por lo que el precio del servicio puede bonificarse conforme a la normativa de la Junta de Andalucía. Como en el resto de escuelas de esta etapa, la incorporación suele acompañarse de un periodo de adaptación progresivo; los detalles de organización, horarios y servicios concretos no aparecen en la fuente oficial consultada.\n\nLa información publicada procede del registro andaluz de centros de primer ciclo. Conviene verificar con el propio centro las plazas libres, el calendario y las condiciones económicas antes de tomar una decisión.',
  updated_at = NOW()
WHERE slug = 'snoopy-granada';

-- ALDEAS INFANTILES SOS (aldeas-infantiles-sos-granada) [privado, adherido]
UPDATE centers SET
  long_description = E'El centro infantil Aldeas Infantiles SOS ocupa el número 69 de la carretera de Murcia (18010), en Granada capital. De titularidad privada, atiende el primer ciclo de educación infantil: bebés y niños de 4 meses a 3 años.\n\nAparece en el registro oficial como centro adherido al Programa de Ayuda a las Familias, lo que permite a las familias acogerse a las bonificaciones de precio previstas por la Junta de Andalucía. La fuente consultada no detalla servicios adicionales, por lo que el horario, el comedor o las actividades diarias deben confirmarse con el equipo del centro.\n\nEsta ficha puede incluir información procedente de fuentes públicas. Si estás valorando este centro, pregunta directamente por el proceso de solicitud, las plazas y las cuotas de este curso.',
  updated_at = NOW()
WHERE slug = 'aldeas-infantiles-sos-granada';

-- GARABATOS (garabatos-granada) [privado, adherido]
UPDATE centers SET
  long_description = E'La calle Astrofísica, 4, en el 18008 de Granada, es la dirección de Garabatos, un centro privado que trabaja con niños desde los 4 meses hasta los 3 años dentro del primer ciclo de educación infantil.\n\nSu adhesión al Programa de Ayuda a las Familias abre la puerta a las bonificaciones de precio que regula la Junta de Andalucía para esta etapa. En el registro oficial no constan más detalles de funcionamiento; en los centros 0-3 la jornada se articula en torno a rutinas de juego, alimentación y descanso, y cada escuela define su propio horario y servicios.\n\nLos datos aquí mostrados tienen origen en fuentes públicas. Para conocer el proyecto del centro, sus horarios reales y las cuotas, lo recomendable es concertar una visita o llamar directamente.',
  updated_at = NOW()
WHERE slug = 'garabatos-granada';

-- GARABATOS DE ARABIAL (garabatos-de-arabial-granada) [privado, adherido]
UPDATE centers SET
  long_description = E'Garabatos de Arabial abre sus puertas en la calle Escultor Antonio Martínez Olalla, 5 (18003), en Granada. Es un centro privado de primer ciclo de educación infantil y escolariza a niños de entre 4 meses y 3 años.\n\nFigura adherido al Programa de Ayuda a las Familias de la Junta de Andalucía, el mecanismo que bonifica parte del coste de la escolarización 0-3 según la normativa vigente. La fuente oficial no especifica servicios adicionales del centro, así que aspectos como ampliación horaria, comedor o actividades hay que consultarlos con el equipo.\n\nLa información de esta ficha procede del registro andaluz de centros autorizados. Antes de formalizar una solicitud, merece la pena confirmar plazas, horarios y condiciones económicas con el propio centro.',
  updated_at = NOW()
WHERE slug = 'garabatos-de-arabial-granada';

-- COLORINES (colorines-granada) [privado, adherido]
UPDATE centers SET
  long_description = E'Colorines forma parte del registro andaluz de centros de primer ciclo de educación infantil con sede en la calle Francisco de Ayala, 14 (18014), en Granada. De titularidad privada, su actividad se dirige a niños de 4 meses a 3 años.\n\nAl estar adherido al Programa de Ayuda a las Familias, las familias matriculadas pueden solicitar las reducciones de cuota que establece la Junta de Andalucía. No hay servicios confirmados en la fuente oficial; en esta etapa cada centro decide su horario, su calendario y la organización de los grupos por edades, de ahí la importancia de preguntar directamente.\n\nFicha elaborada a partir de datos públicos, sujeta a actualización. El propio centro es quien puede confirmar plazas disponibles, cuotas y servicios del curso en marcha.',
  updated_at = NOW()
WHERE slug = 'colorines-granada';

-- VIRGEN DE MONTSERRAT (virgen-de-montserrat-granada) [privado, adherido]
UPDATE centers SET
  long_description = E'En el número 8 de la calle Virgen de Montserrat (18008) se encuentra Virgen de Montserrat, un centro privado de educación infantil dedicado al primer ciclo, de los 4 meses a los 3 años, en Granada capital.\n\nEstá adherido al Programa de Ayuda a las Familias de la Junta de Andalucía, cuyo objetivo es abaratar la escolarización temprana mediante bonificaciones sobre el precio del servicio. El registro no recoge servicios adicionales confirmados; el arranque de curso en el primer ciclo incluye habitualmente un periodo de adaptación pautado con las familias, cuyos detalles fija cada escuela.\n\nLos datos publicados provienen de fuentes oficiales de acceso público. Recomendamos contactar con el centro para resolver dudas sobre plazas, horarios, comedor y cuotas antes de decidir.',
  updated_at = NOW()
WHERE slug = 'virgen-de-montserrat-granada';

-- LUNA LUNERA (luna-lunera-granada) [privado, adherido]
UPDATE centers SET
  long_description = E'Luna Lunera es una guardería privada instalada en el bajo del número 19 de la calle Ingeniero Santa Cruz, en el 18007 de Granada. Atiende el primer ciclo de educación infantil, desde los 4 meses hasta los 3 años.\n\nEl centro consta adherido al Programa de Ayuda a las Familias, de manera que el precio puede bonificarse conforme a los términos que fija la normativa andaluza. Sobre horarios, comedor u otros servicios no hay confirmación en la fuente oficial consultada, algo frecuente en centros cuyo detalle de funcionamiento se conoce mejor en una visita.\n\nEsta ficha reúne datos de origen público y puede no reflejar cambios recientes. Llamar al centro sigue siendo la mejor forma de confirmar plazas, cuotas y organización del día a día.',
  updated_at = NOW()
WHERE slug = 'luna-lunera-granada';

-- CENTRO DE ATENCION FAMILIAR (centro-de-atencion-familiar-granada) [privado, adherido]
UPDATE centers SET
  long_description = E'Bajo el nombre de Centro de Atención Familiar funciona una guardería privada en la calle Henríquez de Jorquera, 21 (18011), en Granada. Su ámbito es el primer ciclo de educación infantil y admite a niños de entre 4 meses y 3 años.\n\nEn el registro de la Junta de Andalucía figura como centro adherido al Programa de Ayuda a las Familias, la vía autonómica para bonificar el precio de la plaza. No constan en cambio servicios adicionales verificados, por lo que el horario de apertura, la alimentación o el modo de plantear la adaptación son cuestiones a tratar con el equipo educativo.\n\nLa información procede de fuentes públicas y puede completarse con el tiempo. Para plazas, cuotas y calendario, contacta directamente con el centro.',
  updated_at = NOW()
WHERE slug = 'centro-de-atencion-familiar-granada';

-- BUBU (bubu-granada) [privado, adherido]
UPDATE centers SET
  long_description = E'Bubú acompaña el día a día de niños de 4 meses a 3 años en la calle San Sebastián de la Gomera, 7 (18014), en Granada. Es un centro privado autorizado para el primer ciclo de educación infantil.\n\nSu inclusión en el Programa de Ayuda a las Familias de la Junta de Andalucía permite solicitar bonificaciones sobre la cuota mensual en los términos que marca la normativa vigente. Los servicios concretos del centro no aparecen recogidos en la fuente oficial, de modo que horario ampliado, comedor o actividades deben confirmarse en el propio centro.\n\nDatos obtenidos de registros públicos. Si te interesa este centro, pide información sobre plazas del curso actual, precios y funcionamiento antes de decidirte.',
  updated_at = NOW()
WHERE slug = 'bubu-granada';

-- PASITO A PASITO (pasito-a-pasito-granada) [privado, adherido]
UPDATE centers SET
  long_description = E'Situado en un local de la calle Virgen del Monte, 13 (18015, Granada), Pasito a Pasito es un centro privado de primer ciclo de educación infantil, pensado para niños desde los 4 meses hasta los 3 años.\n\nEstá adherido al Programa de Ayuda a las Familias, así que las familias pueden beneficiarse de las bonificaciones de precio reguladas por la Junta de Andalucía. La fuente oficial no aporta más detalle sobre servicios; como referencia, en el primer ciclo el trabajo diario gira en torno al juego, los hábitos y el desarrollo de la autonomía, con una organización específica en cada escuela.\n\nEsta ficha se apoya en información pública. El centro puede facilitar de primera mano su horario, la existencia de comedor y las cuotas vigentes: merece la pena llamar antes de descartar o elegir.',
  updated_at = NOW()
WHERE slug = 'pasito-a-pasito-granada';

-- MI MUNECO (mi-muneco-granada) [privado, adherido]
UPDATE centers SET
  long_description = E'Mi Muñeco ocupa los locales 9 y 10 del número 5 de la calle Periodista Rafael Gago Palomo, en la residencial Brillante (18014), Granada. Este centro privado escolariza el primer ciclo de educación infantil, de los 4 meses a los 3 años.\n\nAparece como adherido al Programa de Ayuda a las Familias, el programa andaluz que bonifica el precio del servicio educativo según la normativa vigente. Al margen de la titularidad y la dirección, el registro no confirma servicios concretos, así que el detalle de horarios, comidas y actividades corresponde facilitarlo al propio centro.\n\nInformación recopilada de fuentes públicas, susceptible de ampliarse. Para valorar bien la opción, pregunta al centro por su proyecto, las plazas libres y las condiciones del curso.',
  updated_at = NOW()
WHERE slug = 'mi-muneco-granada';

-- CARACOLES (caracoles-granada) [privado, no adherido]
UPDATE centers SET
  long_description = E'Caracoles es un centro infantil privado del código postal 18012 de Granada, con sede en la calle Don Emilio Durán Durán, 4 (local 1). Trabaja el primer ciclo de educación infantil y acoge a niños de 4 meses a 3 años.\n\nEn el registro de la Junta de Andalucía no consta adherido al Programa de Ayuda a las Familias, por lo que, con los datos disponibles, las bonificaciones autonómicas de precio no serían de aplicación; conviene confirmarlo directamente porque la situación puede cambiar de un curso a otro. Tampoco hay servicios verificados en fuente oficial.\n\nFicha construida con datos de acceso público. El equipo del centro es la referencia para resolver cualquier duda sobre horarios, comedor, plazas y tarifas.',
  updated_at = NOW()
WHERE slug = 'caracoles-granada';

-- VIRGEN MADRE (virgen-madre-granada) [privado, adherido]
UPDATE centers SET
  long_description = E'La guardería Virgen Madre desarrolla su labor en la Cuesta Alcazaba, 2 (18008), en Granada. De carácter privado, se dedica al primer ciclo de educación infantil y recibe a pequeños desde los 4 meses hasta cumplir los 3 años.\n\nConsta adherida al Programa de Ayuda a las Familias, con lo que las familias pueden tramitar las bonificaciones de precio que contempla la Junta de Andalucía. Los servicios específicos no figuran en la fuente oficial; cuestiones prácticas como el horario de entrada y salida, la comida o la siesta se organizan según los criterios propios de cada centro.\n\nLos datos mostrados provienen de fuentes públicas. Antes de solicitar plaza, es recomendable hablar con el centro para conocer disponibilidad, cuotas y rutina diaria.',
  updated_at = NOW()
WHERE slug = 'virgen-madre-granada';

-- SAN FRANCISCO JAVIER (san-francisco-javier-granada) [privado, adherido]
UPDATE centers SET
  long_description = E'En la barriada de Haza Grande, junto a la carretera de Murcia (número 70 A, 18010), San Francisco Javier ofrece plazas de primer ciclo de educación infantil en Granada. Es un centro de titularidad privada para niños de entre 4 meses y 3 años.\n\nSu adhesión al Programa de Ayuda a las Familias de la Junta de Andalucía hace posible bonificar el precio del servicio educativo según la normativa vigente. No hay constancia oficial de servicios adicionales; el funcionamiento cotidiano, el calendario y el periodo de adaptación se concretan directamente con el equipo.\n\nEsta ficha se basa en registros públicos y puede no estar completa. Para información de matrícula, cuotas y horarios, lo más directo es contactar con el propio centro.',
  updated_at = NOW()
WHERE slug = 'san-francisco-javier-granada';

-- MAR DE AGATA (mar-de-agata-granada) [privado, adherido]
UPDATE centers SET
  long_description = E'Mar de Ágata es el nombre del centro privado de primer ciclo de educación infantil situado en el número 7 de Callej del Pretorio, en el 18008 de Granada. Escolariza a niños desde los 4 meses hasta los 3 años.\n\nEl registro andaluz lo recoge como centro adherido al Programa de Ayuda a las Familias, lo que da acceso a las bonificaciones de precio establecidas por la Junta de Andalucía. Más allá de ese dato no constan servicios confirmados: para saber si dispone de comedor, horario ampliado u otras opciones, la consulta debe hacerse al centro.\n\nLa información reflejada aquí se ha tomado de fuentes públicas. Plazas, cuotas y detalles de organización pueden variar cada curso, así que conviene verificarlos con el equipo antes de decidir.',
  updated_at = NOW()
WHERE slug = 'mar-de-agata-granada';

-- LA GUARDE (la-guarde-granada) [privado, adherido]
UPDATE centers SET
  long_description = E'En la avenida de la Ilustración, 129 (local 1, 18007) presta servicio La Guarde, un centro privado de Granada especializado en el primer ciclo de educación infantil, la franja de 4 meses a 3 años.\n\nFigura adherido al Programa de Ayuda a las Familias, el instrumento de la Junta de Andalucía para bonificar el coste de la escolarización 0-3. La fuente oficial consultada no confirma servicios adicionales; horario, alimentación y actividades son aspectos que cada centro define y comunica directamente a las familias interesadas.\n\nFicha basada en datos públicos, pendiente de ampliar con información del propio centro. Un contacto telefónico o una visita permiten confirmar plazas, cuotas y funcionamiento real.',
  updated_at = NOW()
WHERE slug = 'la-guarde-granada';

-- LA CASA DE OIKODORO (la-casa-de-oikodoro-granada) [privado, adherido]
UPDATE centers SET
  long_description = E'La Casa de Oikodoro acoge a niños de entre 4 meses y 3 años en un local bajo de la calle Santa Amelia, 26 (18013), en Granada. Es un centro privado autorizado dentro del primer ciclo de educación infantil.\n\nEstá adherido al Programa de Ayuda a las Familias de la Junta de Andalucía, por lo que el precio del servicio puede reducirse mediante las bonificaciones previstas en la normativa. En el registro oficial no aparecen servicios adicionales confirmados; el detalle del día a día, desde la adaptación inicial hasta el horario, lo facilita el propio equipo educativo.\n\nLo que recoge esta página procede de fuentes públicas. Si el centro encaja con lo que buscas, pregunta directamente por plazas disponibles, cuotas y calendario del curso.',
  updated_at = NOW()
WHERE slug = 'la-casa-de-oikodoro-granada';

-- MOFLETES (mofletes-granada) [privado, no adherido]
UPDATE centers SET
  long_description = E'Mofletes trabaja el primer ciclo de educación infantil desde un bajo de la calle Eurípides, 1 (18014), en Granada. Como centro privado autorizado, escolariza a niños desde los 4 meses hasta los 3 años.\n\nSegún el registro consultado de la Junta de Andalucía, no figura adherido al Programa de Ayuda a las Familias, de modo que las bonificaciones autonómicas de precio no constarían disponibles en este centro; es un punto que conviene aclarar con el equipo, junto con los servicios, que tampoco aparecen detallados en la fuente oficial.\n\nEsta ficha se nutre de información pública y puede quedarse corta frente a la realidad del centro. Llama o visita Mofletes para conocer su propuesta, sus horarios y sus tarifas actuales.',
  updated_at = NOW()
WHERE slug = 'mofletes-granada';

-- PLATERO (platero-granada) [privado, adherido]
UPDATE centers SET
  long_description = E'Platero figura en el registro de la Junta de Andalucía como centro privado de primer ciclo de educación infantil, con sede en la calle Profesor Manuel Garzón Pareja, 32 (18008), en Granada. Su alumnado va de los 4 meses a los 3 años.\n\nAl tratarse de un centro adherido al Programa de Ayuda a las Familias, las familias pueden solicitar la bonificación del precio del servicio educativo conforme a la normativa vigente. El registro no aporta información sobre servicios complementarios, por lo que horario ampliado, comedor o actividades específicas requieren consulta directa.\n\nDatos procedentes de fuentes públicas, sin verificación adicional por parte del centro. Antes de tomar una decisión, contrasta con el equipo las plazas, las cuotas y la organización diaria.',
  updated_at = NOW()
WHERE slug = 'platero-granada';

-- PARCHIS (parchis-granada) [privado, adherido]
UPDATE centers SET
  long_description = E'La calle Poeta Gracián, 15, en el código postal 18007 de Granada, alberga Parchís, un centro privado dedicado al primer ciclo de educación infantil que recibe a niños de 4 meses a 3 años.\n\nConsta adherido al Programa de Ayuda a las Familias, la línea de la Junta de Andalucía que permite bonificar el precio de la plaza según la normativa en vigor. Sobre el resto del funcionamiento no hay datos confirmados en la fuente oficial; en la práctica, cada escuela de esta etapa establece su horario, su calendario y su propuesta de actividades.\n\nInformación recogida de registros públicos. El centro puede aclarar de primera mano si hay plazas libres, cuánto cuestan y cómo organiza la jornada.',
  updated_at = NOW()
WHERE slug = 'parchis-granada';

-- PIOPIO (piopio-granada) [privado, adherido]
UPDATE centers SET
  long_description = E'Piopio desarrolla su actividad en un local de la calle Muladíes, 2 (18006), en Granada. Hablamos de un centro privado de primer ciclo de educación infantil, abierto a niños desde los 4 meses hasta los 3 años.\n\nSu presencia en el Programa de Ayuda a las Familias de la Junta de Andalucía implica que las familias pueden acceder a bonificaciones sobre el precio del servicio en los términos que marca la normativa. No constan servicios adicionales en el registro oficial, así que la letra pequeña del día a día (horarios, comidas, adaptación) debe consultarse en el propio centro.\n\nFicha elaborada con datos de origen público. Para avanzar, lo más útil es contactar con Piopio y preguntar por plazas, cuotas y funcionamiento.',
  updated_at = NOW()
WHERE slug = 'piopio-granada';

-- SUENA BY NEREA BEDMAR (suena-by-nerea-bedmar-granada) [privado, no adherido]
UPDATE centers SET
  long_description = E'El proyecto Sueña by Nerea Bedmar tiene su sede en la plaza Catedrática Asunción Linares, 1 (local 11, 18016), en Granada. Es un centro privado de primer ciclo de educación infantil y atiende a niños de entre 4 meses y 3 años.\n\nEn el momento de la consulta no figuraba adherido al Programa de Ayuda a las Familias de la Junta de Andalucía, por lo que las bonificaciones autonómicas de precio no constarían aplicables; este punto, junto con los servicios del centro (no detallados en la fuente oficial), conviene confirmarlo directamente con el equipo.\n\nLo publicado en esta ficha proviene de fuentes públicas y puede evolucionar. Una llamada o una visita al centro resolverá las dudas sobre plazas, horarios y condiciones económicas.',
  updated_at = NOW()
WHERE slug = 'suena-by-nerea-bedmar-granada';

-- SANTA ROSALIA 1 (santa-rosalia-1-granada) [privado, adherido]
UPDATE centers SET
  long_description = E'Santa Rosalía 1 presta servicio en la calle Santa Rosalía, 2 bis (18007), en Granada. Este centro privado cubre el primer ciclo de educación infantil y escolariza a pequeños desde los 4 meses hasta los 3 años.\n\nEstá adherido al Programa de Ayuda a las Familias, de forma que el coste de la plaza puede bonificarse con arreglo a la normativa de la Junta de Andalucía. La fuente oficial no concreta servicios adicionales; en el primer ciclo, cuestiones como los tramos de edad de cada aula o el ritmo de la adaptación varían de un centro a otro, y es el equipo quien mejor puede explicarlas.\n\nEsta información procede de registros públicos. Contacta con el centro para verificar plazas, cuotas y horarios del curso actual.',
  updated_at = NOW()
WHERE slug = 'santa-rosalia-1-granada';

-- N COLLEGE (n-college-granada) [privado, adherido]
UPDATE centers SET
  long_description = E'Ñ College es una guardería privada situada en la calle Luis Amador, 5 (18014), en Granada. Su actividad se centra en el primer ciclo de educación infantil, dirigido a niños de 4 meses a 3 años.\n\nFigura en el registro andaluz como centro adherido al Programa de Ayuda a las Familias, lo que posibilita bonificar el precio del servicio educativo según la normativa vigente. No hay servicios adicionales confirmados en la fuente consultada, de manera que horario, comedor y otras opciones prácticas deben preguntarse al equipo del centro.\n\nDatos recopilados de fuentes públicas. Si estás comparando opciones en la zona, pide al centro información actualizada de plazas, cuotas y funcionamiento antes de decidir.',
  updated_at = NOW()
WHERE slug = 'n-college-granada';

-- NEMOMARLIN GRANADA (nemomarlin-granada-granada) [privado, adherido]
UPDATE centers SET
  long_description = E'Dentro de la urbanización Las Flores, en la calle Arabial s/n (bloque D, 18004), se encuentra Nemomarlin Granada, un centro privado de primer ciclo de educación infantil que atiende a niños desde los 4 meses hasta los 3 años.\n\nEl registro de la Junta de Andalucía lo incluye entre los centros adheridos al Programa de Ayuda a las Familias, cuya finalidad es bonificar el precio del servicio educativo conforme a la normativa. Servicios concretos como comedor u horario ampliado no aparecen confirmados en esa fuente, así que lo razonable es consultarlos con el propio centro.\n\nLos contenidos de esta ficha se han extraído de registros públicos. El equipo de Nemomarlin Granada puede detallar plazas disponibles, cuotas y organización del día a día a las familias interesadas.',
  updated_at = NOW()
WHERE slug = 'nemomarlin-granada-granada';

-- MARIA INMACULADA (maria-inmaculada-granada) [privado, adherido]
UPDATE centers SET
  long_description = E'María Inmaculada ocupa un bajo de la avenida de América, 42 (18006), en Granada. Es un centro privado de educación infantil de primer ciclo que acoge a niños de entre 4 meses y 3 años.\n\nSu condición de centro adherido al Programa de Ayuda a las Familias permite a las familias solicitar las bonificaciones de precio reguladas por la Junta de Andalucía. En cuanto a servicios, la fuente oficial no confirma ninguno en particular; conviene tener en cuenta que en esta etapa el horario, el calendario y la organización de las aulas dependen de cada escuela.\n\nInformación procedente de fuentes públicas, pendiente de contraste con el centro. Para plazas, cuotas y detalles del día a día, la mejor opción es llamar directamente.',
  updated_at = NOW()
WHERE slug = 'maria-inmaculada-granada';

-- LA CARTUJA (la-cartuja-granada) [privado, adherido]
UPDATE centers SET
  long_description = E'El centro infantil La Cartuja está en la calle Henríquez de Jorquera, 16 (18011), en Granada. De titularidad privada, se dedica al primer ciclo de educación infantil y admite a niños desde los 4 meses hasta los 3 años.\n\nConsta como adherido al Programa de Ayuda a las Familias, el cauce de la Junta de Andalucía para bonificar el precio de la escolarización en esta etapa. El registro oficial no incluye servicios adicionales verificados, así que el horario de apertura, el servicio de comidas o el enfoque de la adaptación son preguntas para el equipo del centro.\n\nTodo lo anterior tiene origen en fuentes públicas. Antes de solicitar plaza, confirma con el centro la disponibilidad, las cuotas y el calendario.',
  updated_at = NOW()
WHERE slug = 'la-cartuja-granada';

-- AMANECER (amanecer-granada) [privado, adherido]
UPDATE centers SET
  long_description = E'En el barrio de La Chana (Granada), en la calle Veleta, 36 (18015), la guardería Amanecer atiende a niños de 4 meses a 3 años. Es un centro privado inscrito en el registro andaluz de primer ciclo de educación infantil.\n\nEstá adherido al Programa de Ayuda a las Familias, por lo que las familias pueden acogerse a las bonificaciones de precio que establece la Junta de Andalucía. Más allá de esa referencia, la fuente oficial no confirma servicios concretos: los horarios, el comedor o las actividades cotidianas se conocen mejor preguntando en el propio centro.\n\nFicha creada a partir de datos públicos. Para decidir con toda la información, contacta con Amanecer y pregunta por plazas, cuotas y funcionamiento del curso.',
  updated_at = NOW()
WHERE slug = 'amanecer-granada';

-- ALQUERIA (alqueria-granada) [privado, no adherido]
UPDATE centers SET
  long_description = E'Alquería es un centro de educación infantil privado situado en el Camino de Purchil, 33 (18004), en Granada. Cubre el primer ciclo de la etapa infantil y recibe a niños desde los 4 meses hasta los 3 años.\n\nEn el registro consultado de la Junta de Andalucía no aparece adherido al Programa de Ayuda a las Familias, un dato relevante a la hora de calcular el coste real de la plaza; tanto esta cuestión como los servicios del centro, que no figuran en la fuente oficial, se resuelven mejor hablando con el equipo.\n\nLa presente ficha se ha redactado con información pública que puede quedar desactualizada. El propio centro puede aclarar su horario, sus tarifas y la disponibilidad de plazas para el próximo curso.',
  updated_at = NOW()
WHERE slug = 'alqueria-granada';

COMMIT;
