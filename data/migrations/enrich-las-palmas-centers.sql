-- enrich-las-palmas-centers.sql
-- Enriquecimiento de long_description para los 12 centros "finos" de
-- Las Palmas de Gran Canaria (city_slug = 'las-palmas-de-gran-canaria'):
-- centros sin servicios confirmados (services vacio) y sin long_description
-- previa, que por ello quedan en noindex. Con esta long_description pasan a
-- ser indexables.
-- Redaccion basada EXCLUSIVAMENTE en datos ya presentes en
-- data/migrations/insert-las-palmas-centers.sql y
-- data/enrichment/las-palmas-centers.json (nombre, direccion, titularidad
-- privada, edades 0-3 anos, autorizacion en el Registro de Centros Docentes
-- de Canarias, notas de denominacion registral/comercial y de sede recogidas
-- en el propio dataset). No se inventan servicios, horarios, metodologias ni
-- barrios; el contexto generico se formula como caracteristica de la etapa
-- 0-3, no del centro. La adhesion a ayudas canarias (p. ej. Bono Infantil)
-- NO consta en el dataset para ningun centro, por lo que no se afirma.
-- Solo actualiza long_description y updated_at, identificando cada centro
-- por slug. NO toca: services, verification_status, confidence_level,
-- verified_at, faqs, pedagogical_approach, schedule ni ningun otro campo.
-- Centros afectados: 12 (todos privados, tipo guarderia, primer ciclo 0-3).
-- Generado: 2026-07-20. Revisar antes de ejecutar. NO ejecutado.
-- Sin DELETE / DROP / TRUNCATE.
-- Rollback disponible en data/migrations/rollback-enrich-las-palmas-centers.sql.

BEGIN;

-- LA GALLINA TURULETA (la-gallina-turuleta-las-palmas-de-gran-canaria) [privado]
UPDATE centers SET
  long_description = E'La Gallina Turuleta es una guardería privada de primer ciclo de educación infantil situada en la Carretera General de Tamaraceite, 63 (35018), en Las Palmas de Gran Canaria. Está autorizada en el Registro de Centros Docentes de Canarias y acoge a niños desde los primeros meses hasta los 3 años.\n\nLa fuente oficial consultada no recoge servicios confirmados para este centro. En la etapa 0-3, aspectos como el horario de apertura, el comedor o la manera de plantear el periodo de adaptación los decide cada escuela, así que son preguntas que conviene trasladar directamente al equipo.\n\nEsta ficha se ha elaborado con datos de fuentes públicas y puede quedar incompleta. Para confirmar plazas, horarios y cuotas del curso, lo más práctico es llamar al centro antes de decidir.',
  updated_at = NOW()
WHERE slug = 'la-gallina-turuleta-las-palmas-de-gran-canaria';

-- EL BARQUITO (el-barquito-las-palmas-de-gran-canaria) [privado]
UPDATE centers SET
  long_description = E'El Barquito es el nombre con el que se presenta este centro privado de educación infantil de la calle Párroco Francisco Rodríguez Rodríguez, 45 (35010), en Las Palmas de Gran Canaria; en el Registro de Centros Docentes de Canarias figura inscrito como El Patio de mi Casa de Guanarteme. Atiende el primer ciclo de infantil, de 0 a 3 años.\n\nEl centro dispone de web propia donde presenta su actividad, aunque en el registro oficial no constan servicios confirmados. Comedor, horario ampliado o actividades son cuestiones que cada escuela de esta etapa organiza a su manera, por lo que merece la pena contrastarlas con el equipo educativo.\n\nLos datos de esta página proceden de fuentes públicas y de los canales del propio centro, y pueden completarse con el tiempo. Contacta con El Barquito para conocer plazas disponibles, horarios y tarifas actualizadas.',
  updated_at = NOW()
WHERE slug = 'el-barquito-las-palmas-de-gran-canaria';

-- FIRST STEPS (first-steps-las-palmas-de-gran-canaria) [privado]
UPDATE centers SET
  long_description = E'En la calle Camilo Saint Saens, 1 (35005), desarrolla su actividad First Steps, un centro privado autorizado para el primer ciclo de educación infantil en Las Palmas de Gran Canaria. Escolariza a bebés y niños de 0 a 3 años.\n\nMás allá de la autorización recogida en el Registro de Centros Docentes de Canarias, la fuente oficial no confirma servicios concretos. Como referencia general de la etapa, la jornada en el 0-3 suele articularse en torno al juego, la alimentación y el descanso, con una organización propia en cada escuela; First Steps cuenta además con página web donde presentarse a las familias.\n\nFicha construida a partir de información pública. Antes de tomar una decisión, pregunta al centro por las plazas del curso, el horario real y las cuotas vigentes.',
  updated_at = NOW()
WHERE slug = 'first-steps-las-palmas-de-gran-canaria';

-- DOMINGO ALONSO (domingo-alonso-las-palmas-de-gran-canaria) [privado]
UPDATE centers SET
  long_description = E'Domingo Alonso es un centro privado de primer ciclo de educación infantil con sede en la calle Lomo la Plana, 16 (bloque 31, portal 1), en el código postal 35019 de Las Palmas de Gran Canaria. Su alumnado abarca de los 0 a los 3 años.\n\nEl Registro de Centros Docentes de Canarias lo recoge como centro autorizado, pero no detalla servicios confirmados. En esta etapa cada centro define su calendario, sus horarios y la composición de los grupos por edades, de modo que la información práctica del día a día debe solicitarse al propio equipo.\n\nLo que muestra esta ficha procede de fuentes públicas y puede no reflejar cambios recientes. Llamar al centro sigue siendo la vía más fiable para confirmar plazas, cuotas y funcionamiento.',
  updated_at = NOW()
WHERE slug = 'domingo-alonso-las-palmas-de-gran-canaria';

-- LA PIRULETA (la-piruleta-las-palmas-de-gran-canaria) [privado]
UPDATE centers SET
  long_description = E'Un bajo de la calle Alfredo Calderón, 57, en el 35006 de Las Palmas de Gran Canaria, acoge La Piruleta, guardería privada dedicada al primer ciclo de educación infantil. Recibe a niños desde los primeros meses de vida hasta los 3 años.\n\nEn el registro autonómico de centros docentes no aparecen servicios confirmados para La Piruleta. Conviene tener presente que en el 0-3 el arranque de curso suele incluir un periodo de adaptación pautado con las familias y que cada escuela fija sus propios horarios; ambos aspectos se concretan hablando con el equipo.\n\nInformación recopilada de fuentes de acceso público. Para saber si hay plazas libres, cuánto cuestan y qué horario ofrece el centro, lo recomendable es contactar directamente.',
  updated_at = NOW()
WHERE slug = 'la-piruleta-las-palmas-de-gran-canaria';

-- EL PATIO DE MI CASA (el-patio-de-mi-casa-las-palmas-de-gran-canaria) [privado]
UPDATE centers SET
  long_description = E'El Patio de mi Casa es un centro privado de educación infantil situado en la calle Alfonso el Sabio, 1 (35005), en Las Palmas de Gran Canaria; la web del grupo al que pertenece la identifica como su sede de Ciudad Jardín. Trabaja el primer ciclo de la etapa infantil, de 0 a 3 años.\n\nAunque el centro cuenta con presencia web propia, el registro oficial de centros docentes de Canarias no confirma servicios concretos para esta sede. Horario, comedor o actividades complementarias son, por tanto, cuestiones abiertas que el equipo puede aclarar de primera mano.\n\nEsta ficha puede incluir información procedente de fuentes públicas o facilitada por el centro. Antes de solicitar plaza, confirma con El Patio de mi Casa la disponibilidad, las cuotas y la organización del día a día.',
  updated_at = NOW()
WHERE slug = 'el-patio-de-mi-casa-las-palmas-de-gran-canaria';

-- EL PATIO DE MI CASA 7 PALMAS (el-patio-de-mi-casa-7-palmas-las-palmas-de-gran-canaria) [privado]
UPDATE centers SET
  long_description = E'En la urbanización 7 Palmas, en la calle Lomo la Plana, 16 (35019), funciona El Patio de mi Casa 7 Palmas, segunda sede en Las Palmas de Gran Canaria del grupo El Patio de mi Casa. Es un centro privado de primer ciclo de educación infantil para niños de 0 a 3 años.\n\nLa web del grupo señala que procura adaptar los horarios a las necesidades de las familias, si bien no publica una franja concreta, y el registro oficial tampoco confirma otros servicios para esta sede. La forma de organizar la jornada, la alimentación o la adaptación inicial se concreta, por tanto, con el propio equipo.\n\nDatos tomados de fuentes públicas y de los canales del grupo, sujetos a actualización. Una llamada al centro permite verificar plazas, cuotas y horarios reales antes de decidir.',
  updated_at = NOW()
WHERE slug = 'el-patio-de-mi-casa-7-palmas-las-palmas-de-gran-canaria';

-- LITTLE STAR (little-star-las-palmas-de-gran-canaria) [privado]
UPDATE centers SET
  long_description = E'Little Star, que en sus propios canales aparece también con el nombre de El Patito Feo, es una guardería privada de la calle Canalejas, 65 (35003), en Las Palmas de Gran Canaria. Está autorizada por la Consejería de Educación del Gobierno de Canarias para impartir el primer ciclo de infantil, de 0 a 3 años.\n\nNo constan servicios confirmados en el registro oficial consultado. Como en el resto de centros de esta etapa, la distribución de los grupos por edades, el calendario y los servicios de apoyo a la conciliación dependen de la organización de cada escuela, de ahí que la consulta directa sea la mejor fuente.\n\nEsta ficha reúne información pública que puede evolucionar. Si Little Star entra en tu lista, pide al equipo detalles de plazas, cuotas y horario antes de dar el paso.',
  updated_at = NOW()
WHERE slug = 'little-star-las-palmas-de-gran-canaria';

-- MAFALDA (mafalda-las-palmas-de-gran-canaria) [privado]
UPDATE centers SET
  long_description = E'Mafalda desarrolla su labor educativa en la Carretera General del Norte, km 4,1, en Los Tarahales (35010), en Las Palmas de Gran Canaria. Es un centro privado autorizado para el primer ciclo de educación infantil, la franja de 0 a 3 años.\n\nLa fuente oficial que sustenta esta ficha, el Registro de Centros Docentes de Canarias, no incluye servicios confirmados para Mafalda. En el 0-3 resulta habitual que cada escuela module su horario, su calendario y la incorporación progresiva de los pequeños, así que estos detalles se resuelven mejor en conversación con el centro.\n\nDatos de origen público, susceptibles de ampliarse. El equipo de Mafalda puede informar de primera mano sobre plazas disponibles, tarifas y funcionamiento cotidiano.',
  updated_at = NOW()
WHERE slug = 'mafalda-las-palmas-de-gran-canaria';

-- LA BLANCA PALOMA (la-blanca-paloma-las-palmas-de-gran-canaria) [privado]
UPDATE centers SET
  long_description = E'En la confluencia de la calle Tirso de Molina, 3, con la calle Emilio Lev (35005) se encuentra La Blanca Paloma, un centro privado de primer ciclo de educación infantil de Las Palmas de Gran Canaria. Atiende a niños de entre 0 y 3 años.\n\nEl registro de centros docentes de Canarias, fuente de esta ficha, no recoge servicios adicionales confirmados. Cuestiones como el comedor, la ampliación de horario o el modo de acompañar la adaptación inicial varían de una escuela a otra en esta etapa y conviene plantearlas directamente al equipo educativo.\n\nLa información publicada procede de fuentes oficiales de acceso público. Para conocer plazas, cuotas y horarios del curso en marcha, contacta con el centro antes de decidir.',
  updated_at = NOW()
WHERE slug = 'la-blanca-paloma-las-palmas-de-gran-canaria';

-- EL ARBOLITO (el-arbolito-las-palmas-de-gran-canaria) [privado]
UPDATE centers SET
  long_description = E'El Arbolito figura en el Registro de Centros Docentes de Canarias como centro privado de primer ciclo de educación infantil, con sede en la calle Pérez del Toro, 57 (35004), en Las Palmas de Gran Canaria. Su etapa de referencia va de los 0 a los 3 años.\n\nMás allá de la autorización administrativa, no hay servicios confirmados en la fuente consultada. En estas edades el día a día gira en torno al juego, los hábitos y el desarrollo de la autonomía, con una organización de horarios y grupos que cada centro define según su propio proyecto.\n\nFicha elaborada con datos públicos, pendiente de contraste con el propio centro. Pregunta a El Arbolito por plazas libres, tarifas y calendario para valorar la opción con toda la información.',
  updated_at = NOW()
WHERE slug = 'el-arbolito-las-palmas-de-gran-canaria';

-- MIS PEQUES (mis-peques-las-palmas-de-gran-canaria) [privado]
UPDATE centers SET
  long_description = E'Mis Peques atiende a niños de 0 a 3 años en la calle Hermanos García de la Torre, 4 (35001), en Las Palmas de Gran Canaria. Se trata de un centro privado autorizado dentro del primer ciclo de educación infantil.\n\nLos servicios concretos de Mis Peques no están confirmados en la fuente oficial de esta ficha. A modo de contexto, en el primer ciclo las escuelas suelen acompañar la incorporación con una adaptación gradual y organizar la jornada alrededor de rutinas estables; el detalle exacto en este centro corresponde aclararlo a su equipo.\n\nEsta página se nutre de información pública y puede quedarse corta frente a la realidad del centro. Llama a Mis Peques para preguntar por plazas, horarios y cuotas actualizadas.',
  updated_at = NOW()
WHERE slug = 'mis-peques-las-palmas-de-gran-canaria';

COMMIT;
