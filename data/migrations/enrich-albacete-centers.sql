-- enrich-albacete-centers.sql
-- Enriquecimiento de long_description para los 8 centros "finos" de Albacete capital:
-- centros sin long_description previa Y sin servicios confirmados (services vacio),
-- que por ello quedan en noindex. Con esta long_description pasan a ser indexables.
-- OJO: las escuelas municipales del Patronato y otros centros con services=['comedor']
-- (ensanche, hermanos-falco, san-pablo, san-pedro-mortero, carrusel...) NO son finos
-- y NO se tocan en esta migracion.
-- Redaccion basada EXCLUSIVAMENTE en datos ya presentes en
-- data/migrations/insert-albacete-centers.sql y data/enrichment/albacete-centers.json
-- (nombre, direccion, barrio/zona, titularidad, red autonomica JCCM si consta, edades,
-- ano de fundacion si consta). No se inventan servicios, horarios, metodologias ni
-- barrios; el contexto generico se formula como caracteristica de la etapa 0-3,
-- no del centro.
-- Solo actualiza long_description y updated_at, identificando cada centro por slug.
-- NO toca: services, verification_status, confidence_level, verified_at, faqs,
-- pedagogical_approach, schedule ni ningun otro campo.
-- Centros afectados: 8 (3 publicos de titularidad autonomica de la Junta de
-- Comunidades de Castilla-La Mancha: el-tren-azul, virgen-de-los-llanos, los-girasoles;
-- 5 privados: aire-libre-i, aire-libre-ii, tulgarita, la-escuelita, rayuela).
-- Generado: 2026-07-20. Revisar antes de ejecutar. NO ejecutado.
-- Sin DELETE / DROP / TRUNCATE.
-- Rollback disponible en data/migrations/rollback-enrich-albacete-centers.sql.

BEGIN;

-- ESCUELA INFANTIL EL TREN AZUL (escuela-infantil-el-tren-azul-albacete) [publico, autonomica JCCM]
UPDATE centers SET
  long_description = E'La Escuela Infantil El Tren Azul es un centro público de primer ciclo de educación infantil situado en la Plaza Francisco Jareño, s/n (02001), en el Polígono de San Antón de Albacete. Forma parte de la red de escuelas infantiles de titularidad autonómica de la Junta de Comunidades de Castilla-La Mancha y su proceso de admisión está dirigido a niños de 0 a 2 años.\n\nComo en el resto de la red autonómica, la plaza se solicita a través del proceso de admisión que la Junta convoca cada curso escolar para los tramos de 0, 1 y 2 años. La fuente oficial consultada no recoge servicios concretos de este centro, de modo que cuestiones prácticas como el horario de apertura, el comedor o el periodo de adaptación conviene tratarlas directamente con el equipo educativo.\n\nLos datos de esta ficha proceden de fuentes públicas y pueden quedar incompletos. Antes de presentar la solicitud, lo más práctico es contactar con la escuela para confirmar plazas disponibles, calendario y funcionamiento del día a día.',
  updated_at = NOW()
WHERE slug = 'escuela-infantil-el-tren-azul-albacete';

-- ESCUELA INFANTIL VIRGEN DE LOS LLANOS (escuela-infantil-virgen-de-los-llanos-albacete) [publico, autonomica JCCM]
UPDATE centers SET
  long_description = E'En la calle San Pedro, 21 (02006), dentro del barrio de La Estrella, desarrolla su actividad la Escuela Infantil Virgen de los Llanos, una escuela pública que la Junta de Comunidades de Castilla-La Mancha gestiona en Albacete capital. Atiende el primer ciclo de educación infantil y su admisión, tramitada por la vía autonómica, va dirigida a niños de 0 a 2 años.\n\nEl acceso a las escuelas de titularidad autonómica se organiza mediante la convocatoria anual de admisión de la Junta, con grupos por tramos de edad de 0, 1 y 2 años. Más allá de la titularidad y la dirección, la fuente consultada no confirma servicios adicionales: horario, alimentación o la forma de plantear la incorporación de los pequeños son aspectos que cada escuela concreta con las familias.\n\nEsta ficha se ha elaborado con información de fuentes públicas y puede no reflejar cambios recientes. Para resolver dudas sobre plazas, cuotas y rutina diaria, la vía más fiable es hablar directamente con el centro.',
  updated_at = NOW()
WHERE slug = 'escuela-infantil-virgen-de-los-llanos-albacete';

-- ESCUELA INFANTIL LOS GIRASOLES (escuela-infantil-los-girasoles-albacete) [publico, autonomica JCCM]
UPDATE centers SET
  long_description = E'Los Girasoles es una de las escuelas infantiles de titularidad autonómica con las que cuenta Albacete capital. Ocupa el número 62 de la calle Francisco Javier de Moya, en el código postal 02006 (zona de Hospital), y escolariza el primer ciclo de educación infantil, con un proceso de admisión autonómico pensado para niños de 0 a 2 años.\n\nEn esta etapa la jornada gira en torno a rutinas de juego, alimentación y descanso, y la incorporación suele acompañarse de un periodo de adaptación progresivo; los detalles de organización dependen de cada escuela y no figuran en la fuente oficial consultada. La solicitud de plaza se presenta cada año dentro del proceso de admisión de Escuelas Infantiles de Titularidad Autonómica de Castilla-La Mancha.\n\nLa información publicada procede de registros y fuentes de acceso público. Conviene verificar con la propia escuela el calendario, los servicios y las condiciones del curso antes de tomar una decisión.',
  updated_at = NOW()
WHERE slug = 'escuela-infantil-los-girasoles-albacete';

-- ESCUELAS INFANTILES AIRE LIBRE I (escuelas-infantiles-aire-libre-i-albacete) [privado]
UPDATE centers SET
  long_description = E'Escuelas Infantiles Aire Libre I es un centro privado de educación infantil de primer ciclo (0-3 años) fundado en 1988, con sede en la calle Hermanos Jiménez, 60 (02004), en el barrio de Fátima de Albacete. Comparte nombre comercial con una segunda ubicación en la ciudad, Aire Libre II, aunque cada sede funciona en un local distinto.\n\nLas fuentes consultadas no recogen servicios confirmados de este centro, algo habitual cuando el detalle de funcionamiento solo se publica en canales propios. Como referencia general de la etapa 0-3, los grupos se organizan por edades y cada escuela define su horario, su calendario y la manera de acompañar la adaptación de los recién llegados.\n\nEsta ficha puede incluir información procedente de fuentes públicas. Si estás valorando este centro, pregunta directamente por su proyecto educativo, las plazas libres y las cuotas del curso en marcha.',
  updated_at = NOW()
WHERE slug = 'escuelas-infantiles-aire-libre-i-albacete';

-- ESCUELAS INFANTILES AIRE LIBRE II (escuelas-infantiles-aire-libre-ii-albacete) [privado]
UPDATE centers SET
  long_description = E'La calle Literatura, 34 (02008), en el barrio de Universidad, es la dirección de Escuelas Infantiles Aire Libre II, la segunda sede que este nombre comercial tiene en Albacete capital. Se trata de un centro privado dedicado al primer ciclo de educación infantil, la etapa que va de los 0 a los 3 años.\n\nNo constan servicios verificados en las fuentes consultadas, por lo que horario, comedor o actividades deben confirmarse en el propio centro. En las escuelas de este ciclo, el trabajo diario se apoya en el juego, los hábitos y el desarrollo de la autonomía, con una organización que cada centro adapta a sus espacios y a sus grupos.\n\nLos datos aquí mostrados tienen origen en fuentes públicas y pueden completarse con el tiempo. Llamar al centro sigue siendo la mejor forma de conocer plazas, tarifas y funcionamiento real.',
  updated_at = NOW()
WHERE slug = 'escuelas-infantiles-aire-libre-ii-albacete';

-- GUARDERIA TULGARITA (guarderia-tulgarita-albacete) [privado]
UPDATE centers SET
  long_description = E'Guardería Tulgarita atiende a niños de 0 a 3 años en la calle Marzo, 7 (02002), una dirección de la zona centro de Albacete, en el barrio de Carretas-Huerta Marzo. Es un centro de titularidad privada cuya actividad corresponde al primer ciclo de educación infantil.\n\nDe este centro no hay servicios confirmados en fuente primaria, así que aspectos como el comedor, la ampliación horaria o el periodo de adaptación quedan pendientes de consulta directa. Sirve como orientación que, en el ciclo 0-3, las escuelas suelen agrupar a los pequeños por tramos de edad y pautar la incorporación de forma gradual junto a las familias.\n\nFicha construida con datos de acceso público, sujeta a actualización. El equipo del centro es la referencia para cualquier duda sobre horarios, plazas y precios del curso actual.',
  updated_at = NOW()
WHERE slug = 'guarderia-tulgarita-albacete';

-- ESCUELA INFANTIL LA ESCUELITA (escuela-infantil-la-escuelita-albacete) [privado]
UPDATE centers SET
  long_description = E'Escuela Infantil La Escuelita es un centro privado autorizado para impartir el primer ciclo de educación infantil, dirigido a niños de 0 a 3 años. Tiene su sede en la calle Herreros, 30 (02001), dentro del barrio de Carretas-Huerta Marzo de Albacete.\n\nMás allá de la autorización, la dirección y el contacto, las fuentes consultadas no aportan servicios confirmados de este centro. En el primer ciclo, cada escuela establece su propio horario y calendario, organiza los grupos por edades y acuerda con las familias cómo abordar los primeros días; son cuestiones que merece la pena repasar en una visita.\n\nEsta ficha reúne datos de origen público y puede no estar completa. Para confirmar disponibilidad de plaza, cuotas y servicios, contacta directamente con la escuela.',
  updated_at = NOW()
WHERE slug = 'escuela-infantil-la-escuelita-albacete';

-- ESCUELA INFANTIL RAYUELA (escuela-infantil-rayuela-albacete) [privado]
UPDATE centers SET
  long_description = E'En un pasaje de la calle Batalla del Salado, 9 (02002), en la zona centro de Albacete, trabaja la Escuela Infantil Rayuela, un centro privado de primer ciclo de educación infantil que recibe a niños de entre 0 y 3 años.\n\nLa fuente consultada no confirma servicios concretos de este centro, de manera que comedor, horarios o actividades deben preguntarse directamente. Con carácter general, en esta etapa el aprendizaje se construye a través del juego y de las rutinas cotidianas, y la entrada al aula se suele escalonar durante los primeros días para facilitar la adaptación.\n\nLa información de esta ficha procede de fuentes públicas. Antes de decidir, pide al centro los detalles de plazas, tarifas y organización del día a día de este curso.',
  updated_at = NOW()
WHERE slug = 'escuela-infantil-rayuela-albacete';

COMMIT;
