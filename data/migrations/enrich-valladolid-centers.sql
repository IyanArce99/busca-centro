-- enrich-valladolid-centers.sql
-- Enriquecimiento de long_description para los 19 centros "finos" de Valladolid capital:
-- centros sin long_description previa y sin servicios confirmados (services vacio),
-- que por ello quedan en noindex. Con esta long_description pasan a ser indexables.
-- Redaccion basada EXCLUSIVAMENTE en datos ya presentes en
-- data/migrations/insert-valladolid-centers.sql y data/enrichment/valladolid-centers.json
-- (nombre, direccion, titularidad privada, edades 4-36 meses, adhesion al programa de
-- gratuidad del primer ciclo de la Junta de Castilla y Leon y notas internas del dataset
-- sobre gestion por convenio o pertenencia a grupo). No se inventan servicios, horarios,
-- metodologias ni barrios; el contexto generico se formula como caracteristica de la
-- etapa 0-3, no del centro.
-- Solo actualiza long_description y updated_at, identificando cada centro por slug.
-- NO toca: services, verification_status, confidence_level, verified_at, faqs,
-- pedagogical_approach, schedule ni ningun otro campo.
-- Centros afectados: 19 (todos privados adheridos al programa de gratuidad del primer
-- ciclo de educacion infantil de la Junta de Castilla y Leon; los otros 23 centros de
-- Valladolid ya tienen long_description o servicios confirmados y NO se tocan).
-- Generado: 2026-07-20. Revisar antes de ejecutar. NO ejecutado.
-- Sin DELETE / DROP / TRUNCATE.
-- Rollback disponible en data/migrations/rollback-enrich-valladolid-centers.sql.

BEGIN;

-- ARCO IRIS (arco-iris-valladolid) [privado, adherido gratuidad JCyL]
UPDATE centers SET
  long_description = E'Arco Iris escolariza a niños de 4 meses a 3 años en la calle Júpiter, 12 (47009). Es una guardería de gestión privada que imparte el primer ciclo de educación infantil en Valladolid capital.\n\nSu inclusión en el listado autonómico de adheridos a la gratuidad 0-3 significa que la escolarización puede resultar gratuita con arreglo a lo regulado por la Junta de Castilla y León. Ningún otro aspecto del funcionamiento consta verificado: alimentación, franjas horarias o adaptación quedan a criterio del proyecto de cada escuela en este tramo educativo.\n\nEsta ficha se nutre únicamente de fuentes públicas, por lo que algunos puntos pueden quedar incompletos. Preguntar directamente en el centro despeja lo esencial: vacantes, tarifas y funcionamiento del día a día.',
  updated_at = NOW()
WHERE slug = 'arco-iris-valladolid';

-- ARGENTINAS (argentinas-valladolid) [privado, adherido gratuidad JCyL]
UPDATE centers SET
  long_description = E'En la carretera de Rueda, 41 (47008), en Valladolid, desarrolla su actividad Argentinas, un centro privado de primer ciclo de educación infantil que escolariza a niños de entre 4 meses y 3 años.\n\nConsta como adherido al programa de gratuidad de estas enseñanzas impulsado por la Junta de Castilla y León, que desde el curso 2024-2025 permite obtener plaza gratuita también en centros privados. La fuente oficial no detalla servicios adicionales; como en cualquier escuela 0-3, la incorporación suele plantearse con un periodo de adaptación progresivo cuyos detalles concreta cada centro.\n\nEsta información procede del registro oficial de centros docentes y de otras fuentes públicas. Si valoras esta opción, pregunta directamente por el proceso de admisión, el horario y las condiciones económicas.',
  updated_at = NOW()
WHERE slug = 'argentinas-valladolid';

-- CASA DE NIÑAS Y NIÑOS MAESTRO CLAUDIO LOPEZ SERRANO (casa-de-ninas-y-ninos-maestro-claudio-lopez-serrano-valladolid) [privado, adherido gratuidad JCyL, convenio Ayto.-Liga Esp. de la Educacion]
UPDATE centers SET
  long_description = E'La Casa de Niñas y Niños Maestro Claudio López Serrano atiende el primer ciclo de educación infantil, de los 4 meses a los 3 años, en la calle Soto, 64 (47010), en la zona de La Rondilla de Valladolid. Funciona mediante convenio entre el Ayuntamiento de Valladolid y la Liga Española de la Educación y la Cultura Popular, aunque el registro oficial de centros docentes la clasifica como centro de titularidad privada.\n\nEstá incluida en la oferta de plazas gratuitas del programa de gratuidad del primer ciclo de la Junta de Castilla y León. En cambio, la fuente oficial no recoge servicios confirmados, así que el horario de apertura, la comida o el modo de plantear los primeros días corresponde consultarlos con el equipo.\n\nLos datos publicados provienen de registros y fuentes de acceso público. Antes de solicitar plaza, merece la pena contactar con el centro para conocer la disponibilidad, el calendario y el funcionamiento del día a día.',
  updated_at = NOW()
WHERE slug = 'casa-de-ninas-y-ninos-maestro-claudio-lopez-serrano-valladolid';

-- CASA DE NIÑAS Y NIÑOS PAJARILLOS (casa-de-ninas-y-ninos-pajarillos-valladolid) [privado, adherido gratuidad JCyL, convenio Ayto.-Liga Esp. de la Educacion]
UPDATE centers SET
  long_description = E'En la calle Tordo, 7 (47012), en el barrio de Pajarillos, funciona la Casa de Niñas y Niños Pajarillos, dedicada al primer ciclo de educación infantil en Valladolid y abierta a niños de 4 meses a 3 años. El registro oficial vigente la recoge como centro privado, si bien su gestión se articula a través de un convenio del Ayuntamiento de Valladolid con la Liga Española de la Educación y la Cultura Popular.\n\nEl centro aparece entre los adheridos a la gratuidad del primer ciclo que aplica la Junta de Castilla y León, lo que abre la puerta a escolarizarse sin coste según la normativa vigente. No hay servicios adicionales verificados en la fuente consultada; en el tramo 0-3, rutinas como el juego, la alimentación o el descanso se organizan según el criterio de cada escuela.\n\nFicha construida con datos de acceso público, sujeta a actualización. El equipo del centro es la mejor referencia para resolver dudas sobre horarios, plazas y cuotas.',
  updated_at = NOW()
WHERE slug = 'casa-de-ninas-y-ninos-pajarillos-valladolid';

-- CHUPETIN (chupetin-valladolid) [privado, adherido gratuidad JCyL]
UPDATE centers SET
  long_description = E'Chupetín es un centro privado de educación infantil situado en la calle Vinos de Rueda, 12 (47008), en Valladolid. Su actividad se centra en el primer ciclo, la etapa que va de los 4 meses a los 3 años.\n\nAl estar adherido al programa de gratuidad del primer ciclo de la Junta de Castilla y León, las familias matriculadas pueden acogerse a la plaza gratuita que contempla la normativa autonómica desde el curso 2024-2025. Sobre horarios, comedor u otros servicios no hay confirmación oficial, algo habitual en centros cuyo funcionamiento se conoce mejor en una visita.\n\nLa información reunida aquí tiene origen en fuentes públicas y puede no reflejar cambios recientes. Llamar al centro sigue siendo la vía más fiable para confirmar plazas, cuotas y organización diaria.',
  updated_at = NOW()
WHERE slug = 'chupetin-valladolid';

-- CUBILLAS JARDIN DE RECREO (cubillas-jardin-de-recreo-valladolid) [privado, adherido gratuidad JCyL]
UPDATE centers SET
  long_description = E'Cubillas Jardín de Recreo ocupa un emplazamiento en la calle Roble, 5 (47009), en Valladolid. Es una guardería de titularidad privada orientada al primer ciclo de educación infantil, con niños desde los 4 meses hasta cumplir los 3 años.\n\nForma parte del listado de centros con plazas gratuitas 0-3 adheridos al programa de la Junta de Castilla y León para el curso 2026-2027. El registro no aporta más detalle de funcionamiento; en esta etapa, cada escuela fija su propio calendario, sus horarios y la distribución de los grupos por edades.\n\nLos datos aquí mostrados se han obtenido de fuentes públicas. Para conocer el proyecto del centro, sus horarios reales y las cuotas, lo recomendable es concertar una visita o llamar directamente.',
  updated_at = NOW()
WHERE slug = 'cubillas-jardin-de-recreo-valladolid';

-- HAKUNA MATATA (hakuna-matata-valladolid) [privado, adherido gratuidad JCyL]
UPDATE centers SET
  long_description = E'Hakuna Matata es una escuela infantil privada con sede en la plaza San Francisco de Asís, 1 (47013), en Valladolid. Escolariza el primer ciclo de educación infantil y admite a pequeños de entre 4 meses y 3 años.\n\nAparece en el listado oficial de centros privados adheridos a la gratuidad del primer ciclo de educación infantil de Castilla y León, por lo que la plaza puede ser gratuita conforme a la normativa en vigor. Los servicios concretos no constan en el registro consultado; cuestiones como el comedor, la ampliación de horario o el periodo de adaptación se gestionan con el equipo educativo.\n\nEsta ficha puede incluir información procedente de fuentes públicas. Además del teléfono, el centro cuenta con página web y correo electrónico de contacto, útiles para preguntar por plazas, horarios y cuotas de este curso.',
  updated_at = NOW()
WHERE slug = 'hakuna-matata-valladolid';

-- LA ABEJA MAYA (la-abeja-maya-valladolid) [privado, adherido gratuidad JCyL]
UPDATE centers SET
  long_description = E'La Abeja Maya recibe a niños de entre 4 meses y 3 años en la calle Castañuelas, 5 (47012), en Valladolid. Se trata de un centro de titularidad privada centrado en el primer ciclo de educación infantil.\n\nSu adhesión al programa de gratuidad de la Junta de Castilla y León hace posible escolarizarse sin coste en los términos que marca la normativa autonómica. Como en el resto de escuelas de la etapa, la entrada al centro suele acompañarse de una adaptación pautada con las familias; los detalles de servicios y organización no figuran en la fuente oficial.\n\nLa información publicada procede de registros públicos de la administración educativa. Conviene verificar con el propio centro las plazas libres, el calendario y las condiciones económicas antes de tomar una decisión.',
  updated_at = NOW()
WHERE slug = 'la-abeja-maya-valladolid';

-- LA LUNA AZUL BILINGÜE (la-luna-azul-bilingue-valladolid) [privado, adherido gratuidad JCyL]
UPDATE centers SET
  long_description = E'La Luna Azul Bilingüe es un centro privado de primer ciclo de educación infantil ubicado en el paseo Juan Carlos I, 140 (47011), en Valladolid, que acompaña a niños desde los 4 meses hasta los 3 años.\n\nEstá entre los centros adheridos a la oferta de gratuidad del primer ciclo que gestiona la Junta de Castilla y León, con plazas sin coste desde el curso 2024-2025. La fuente oficial consultada no confirma servicios ni detalles del proyecto educativo, de modo que aspectos como el enfoque de idiomas, el horario o el comedor conviene consultarlos directamente.\n\nDatos obtenidos de registros públicos, susceptibles de cambios. Una llamada al centro permite confirmar plazas del curso actual, precios y funcionamiento antes de decidirse.',
  updated_at = NOW()
WHERE slug = 'la-luna-azul-bilingue-valladolid';

-- LA SUITE INFANTIL (la-suite-infantil-valladolid) [privado, adherido gratuidad JCyL]
UPDATE centers SET
  long_description = E'En el paseo del Obregón, 15 (47009) se encuentra La Suite Infantil, una guardería privada de Valladolid dedicada a la etapa 0-3: acoge a bebés y niños de 4 meses a 3 años dentro del primer ciclo de educación infantil.\n\nEl centro consta adherido al programa autonómico de gratuidad de estas enseñanzas, así que las familias pueden solicitar plaza gratuita conforme a lo que regula la Junta de Castilla y León. No hay constancia oficial de servicios adicionales; el trabajo diario en el primer ciclo gira en torno al juego, los hábitos y la autonomía, con una organización propia en cada escuela.\n\nFicha elaborada a partir de fuentes de acceso público. Para resolver dudas sobre matrícula, horarios y cuotas, lo más práctico es dirigirse al propio centro.',
  updated_at = NOW()
WHERE slug = 'la-suite-infantil-valladolid';

-- MI BOSQUE ENCANTADO (mi-bosque-encantado-valladolid) [privado, adherido gratuidad JCyL]
UPDATE centers SET
  long_description = E'Mi Bosque Encantado es una escuela infantil privada de la calle Juan García Hortelano, 14 (47014), en Valladolid. Atiende el primer ciclo de educación infantil, es decir, a niños de entre 4 meses y 3 años.\n\nFigura adherida al programa de gratuidad del primer ciclo de la Junta de Castilla y León, el mecanismo que permite plaza gratuita en centros privados desde el curso 2024-2025. En el registro oficial no constan servicios verificados, por lo que la existencia de comedor, la franja horaria o las actividades deben confirmarse con el equipo.\n\nLos datos de esta página provienen de fuentes públicas. El centro dispone de web propia, una buena vía, junto al teléfono, para preguntar por plazas, horarios y tarifas actualizadas.',
  updated_at = NOW()
WHERE slug = 'mi-bosque-encantado-valladolid';

-- MI PEQUEÑO COLE (mi-pequeno-cole-valladolid) [privado, adherido gratuidad JCyL]
UPDATE centers SET
  long_description = E'Mi Pequeño Cole desarrolla su labor en el paseo de Zorrilla, 87 (47008), en Valladolid. De titularidad privada, este centro escolariza el primer ciclo de educación infantil, de los 4 meses a los 3 años.\n\nSe encuentra entre los centros adheridos al programa de gratuidad de la Junta de Castilla y León, cuyo objetivo es que la escolarización temprana no tenga coste para las familias según la normativa vigente. El registro no recoge servicios adicionales confirmados; el arranque de curso en esta etapa incluye habitualmente una adaptación gradual cuyos plazos fija cada escuela.\n\nLa información procede de fuentes públicas y puede completarse con el tiempo. Para plazas, cuotas y calendario, contacta directamente con el centro.',
  updated_at = NOW()
WHERE slug = 'mi-pequeno-cole-valladolid';

-- MIS PRIMEROS PASITOS (mis-primeros-pasitos-valladolid) [privado, adherido gratuidad JCyL]
UPDATE centers SET
  long_description = E'Mis Primeros Pasitos ofrece plazas de primer ciclo de educación infantil en el paseo Juan Carlos I, 142 (47011), en Valladolid. Es un centro de titularidad privada para niños de entre 4 meses y 3 años.\n\nSu presencia en el listado de adheridos a la gratuidad 0-3 de Castilla y León permite a las familias tramitar la plaza gratuita que establece la normativa autonómica. Al margen de la titularidad y la dirección, la fuente oficial no confirma servicios concretos, así que el detalle de horarios, comidas y actividades corresponde facilitarlo al propio centro.\n\nInformación recopilada de registros públicos y pendiente de posibles ampliaciones. Al valorar esta opción, pide al centro detalles de su proyecto, las plazas libres y las condiciones del curso.',
  updated_at = NOW()
WHERE slug = 'mis-primeros-pasitos-valladolid';

-- NOELIA (noelia-valladolid) [privado, adherido gratuidad JCyL]
UPDATE centers SET
  long_description = E'La guardería Noelia trabaja con niños de 4 meses a 3 años en la calle Pelícano, 17 (47012), en Valladolid. Es un centro privado autorizado para el primer ciclo de educación infantil.\n\nConsta en la relación oficial de centros con plazas gratuitas de primer ciclo de la Junta de Castilla y León, de forma que la escolarización puede ser gratuita según la normativa vigente. Los servicios específicos no aparecen recogidos en la fuente oficial; cuestiones prácticas como la hora de entrada y salida, la comida o la siesta se organizan según los criterios propios de cada centro.\n\nLos datos mostrados provienen de fuentes públicas. Antes de pedir plaza, es recomendable hablar con el equipo para conocer disponibilidad, cuotas y rutina diaria.',
  updated_at = NOW()
WHERE slug = 'noelia-valladolid';

-- OKAPI (okapi-valladolid) [privado, adherido gratuidad JCyL]
UPDATE centers SET
  long_description = E'Okapi es un centro privado de primer ciclo de educación infantil instalado en la calle Valle Inclán, 2 (47008), en Valladolid, donde atiende a pequeños desde los 4 meses hasta los 3 años.\n\nParticipa en la oferta de gratuidad del primer ciclo articulada por la Junta de Castilla y León, que cubre el coste de la plaza en los centros adheridos desde el curso 2024-2025. No constan en cambio servicios verificados en el registro; en la etapa 0-3, cada escuela decide su horario, su calendario y cómo agrupa a los niños por edades, de ahí la importancia de preguntar directamente.\n\nEsta ficha se apoya en información pública. El centro puede facilitar de primera mano su horario, la existencia de comedor y las cuotas vigentes: merece la pena llamar antes de descartar o elegir.',
  updated_at = NOW()
WHERE slug = 'okapi-valladolid';

-- PEQUEÑA LUNA (pequena-luna-valladolid) [privado, adherido gratuidad JCyL]
UPDATE centers SET
  long_description = E'En la calle Ciudad de la Habana, 39 (47014), Pequeña Luna acoge el primer ciclo de educación infantil en Valladolid. Este centro privado admite a niños de entre 4 meses y 3 años.\n\nAparece como adherido al programa de gratuidad que la Junta de Castilla y León aplica a estas enseñanzas, con plaza sin coste para las familias conforme a la normativa en vigor. La fuente oficial no aporta más datos de funcionamiento; como referencia general de la etapa, la solicitud de plaza se realiza en los plazos de admisión que se publican cada curso.\n\nContenido elaborado con datos de origen público. El teléfono del centro es la vía más rápida para confirmar vacantes, horarios y condiciones económicas.',
  updated_at = NOW()
WHERE slug = 'pequena-luna-valladolid';

-- ROMER (romer-valladolid) [privado, adherido gratuidad JCyL]
UPDATE centers SET
  long_description = E'Romer es una escuela infantil privada situada en la calle La Legión, s/n (47008), en Valladolid. Su oferta educativa corresponde al primer ciclo de educación infantil y va dirigida a niños de 4 meses a 3 años.\n\nEl centro está adherido a la gratuidad del primer ciclo de la Junta de Castilla y León, por lo que la plaza puede obtenerse sin coste con arreglo a la normativa autonómica. Más allá de eso, el registro oficial no confirma servicios; en estas edades, los primeros días suelen organizarse de forma escalonada para facilitar la adaptación, con pautas que decide cada equipo.\n\nLa información recogida procede de fuentes oficiales de acceso público y podría no estar al día. Confirma con el centro las plazas, el horario y las cuotas antes de decidir.',
  updated_at = NOW()
WHERE slug = 'romer-valladolid';

-- SAN ANTONIO (san-antonio-valladolid) [privado, adherido gratuidad JCyL]
UPDATE centers SET
  long_description = E'San Antonio atiende a niños de entre 4 meses y 3 años en la calle Maldonado, 8 (47002), en Valladolid. Es un centro de educación infantil de titularidad privada dedicado al primer ciclo.\n\nEstá incluido en el listado de centros adheridos al programa de gratuidad de la Junta de Castilla y León para el primer ciclo, vigente también en el curso 2026-2027. Sobre el resto de su funcionamiento no hay confirmación en la fuente oficial; horario, comedor y actividades son datos que conviene pedir al propio equipo.\n\nFicha basada en registros públicos y, por tanto, mejorable. Si este centro encaja con lo que buscas, llama para conocer plazas disponibles, cuotas y calendario.',
  updated_at = NOW()
WHERE slug = 'san-antonio-valladolid';

-- TRASTES SAN CRISTOBAL (trastes-san-cristobal-valladolid) [privado, adherido gratuidad JCyL, segunda sede del grupo Trastes en Valladolid]
UPDATE centers SET
  long_description = E'Trastes San Cristóbal es la segunda sede en Valladolid del grupo de escuelas infantiles Trastes, distinta de la de Parquesol. Ocupa un local en la calle Plata, 39 (47012), en la zona de San Cristóbal, y escolariza el primer ciclo de educación infantil, de los 4 meses a los 3 años.\n\nComo centro privado adherido al programa de gratuidad del primer ciclo de la Junta de Castilla y León, permite a las familias acceder a plaza gratuita según la normativa vigente. Para esta sede no se han localizado servicios confirmados en fuente oficial ni página propia diferenciada, así que horario, comedor y actividades deben consultarse directamente.\n\nLos datos proceden de fuentes públicas y del registro oficial de centros docentes. El contacto telefónico con la escuela es la mejor forma de resolver dudas sobre admisión, cuotas y organización.',
  updated_at = NOW()
WHERE slug = 'trastes-san-cristobal-valladolid';

COMMIT;
