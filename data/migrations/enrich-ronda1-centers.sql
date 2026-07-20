-- enrich-ronda1-centers.sql
-- Enriquecimiento consolidado de las fichas "finas" de las 6 ciudades de la
-- Ronda 1: Sevilla 189, Malaga 127, Palma 57, Murcia 36, Zaragoza 27, Alicante 16.
-- Total: 452 centros.
--
-- Un centro "fino" no tenia long_description ni servicios reales, por lo que
-- quedaba en noindex por la puerta de calidad. Al anadir long_description
-- pasa a ser indexable.
--
-- Solo actualiza long_description y updated_at, identificando por slug.
-- No toca services, verification_status, confidence_level, verified_at ni faqs.
-- No incluye ningun centro que ya tuviera long_description o servicios reales.
--
-- Rollback: rollback-enrich-ronda1-centers.sql
-- Generado: 2026-07-20. Revisar antes de ejecutar. NO ejecutado.
-- Sin DELETE / DROP / TRUNCATE.

BEGIN;

-- ==========================================================
-- SEVILLA — 189 centros
-- ==========================================================

-- Concilio  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Concilio es un centro de educación infantil de primer ciclo de titularidad privada, situado en la plaza Juan XXIII, 1, acceso A, dentro del código postal 41006 de Sevilla. Trabaja con niños de 4 meses a 3 años.\n\nConsta acogido al Programa de Ayuda a las Familias, el sistema con el que la Junta de Andalucía bonifica parte del coste de la plaza en la etapa 0-3. La misma fuente no detalla los servicios complementarios —aula matinal, comedor o taller de juego—, que conviene preguntar antes de solicitar plaza.\n\nToda la información de esta ficha procede de registros administrativos de acceso público, que no siempre reflejan los cambios recientes. Para saber si hay plaza libre, en qué horario y con qué cuota, lo mejor es hablar con el equipo del centro.',
  updated_at = NOW()
WHERE slug = 'concilio-sevilla';

-- Inmaculado Corazón de María  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'En la plaza Corazón de María, 1, en el 41016 de Sevilla, desarrolla su actividad Inmaculado Corazón de María, un centro de educación infantil privado orientado a niñas y niños a partir de los 4 meses y hasta los 3 años.\n\nConsta la adhesión al Programa de Ayuda a las Familias: las familias pueden pedir la bonificación del precio de la plaza en los plazos que marca cada convocatoria. En esta etapa la incorporación se hace de forma progresiva y cada centro la organiza a su modo; el registro consultado no precisa cómo lo hace este.\n\nConviene tomar estos datos como punto de partida, ya que proceden de un registro público que se actualiza periódicamente. Escribir o llamar permite preguntar por las plazas disponibles y por cómo se organiza la jornada.',
  updated_at = NOW()
WHERE slug = 'inmaculado-corazon-de-maria-sevilla';

-- Escuelas Francesas  [privado, NO adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Escuelas Francesas ocupa un espacio en la calle Almendralejo, 18 (41020, Sevilla). Es un centro educativo de la etapa 0-3 de gestión privada y atiende a bebés y niños de los 4 a los 36 meses.\n\nLa fuente oficial no lo recoge como centro adherido al Programa de Ayuda a las Familias; el coste de la plaza, por tanto, se fija sin bonificación autonómica. Más allá de esos datos administrativos, el funcionamiento concreto —horarios, comidas, adaptación— no está documentado en fuentes públicas.\n\nSe trata de información de origen administrativo, útil para situar el centro pero insuficiente para conocerlo a fondo. Merece la pena preguntar directamente por el proceso de admisión y por los plazos de solicitud de cada curso.',
  updated_at = NOW()
WHERE slug = 'escuelas-francesas-sevilla';

-- Kirikou  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'La sede de Kirikou está en la calle Mercurio, 2, bajo E, en la zona del código postal 41003 de Sevilla. Se trata de un centro de primer ciclo de educación infantil de titularidad privada para alumnado desde los cuatro meses hasta los tres años.\n\nEl registro andaluz lo incluye entre los centros adheridos al Programa de Ayuda a las Familias, de manera que la mensualidad puede reducirse según la bonificación que corresponda a cada unidad familiar. Tampoco constan los servicios que ofrece ni cómo distribuye los grupos por edades, información que suele facilitar el propio centro al pedir cita.\n\nEsta ficha reúne datos públicos y no incorpora valoraciones ni opiniones sobre el centro. Para cualquier detalle sobre matrícula, jornada o precios, la vía adecuada es el contacto con Kirikou.',
  updated_at = NOW()
WHERE slug = 'kirikou-sevilla';

-- Los Lunares  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Los Lunares, una escuela infantil de primer ciclo de titularidad privada, abre sus puertas en la plaza Salesiano Don Ubaldo, 7 (escalera 7, puerta 17), en el 41010 de Sevilla y acoge a pequeños entre los 4 meses y los 3 años.\n\nEl centro está integrado en el Programa de Ayuda a las Familias, la fórmula con la que la administración andaluza subvenciona parte del coste de estas plazas. Nada más se recoge en la fuente oficial, ni horarios ni servicios, así que esta descripción se limita a los datos verificables.\n\nNada de lo anterior sustituye a la información que facilite el propio centro: son datos administrativos, sin más. Solicitar información al propio centro es la forma más rápida de conocer vacantes, horarios y cuotas de este curso.',
  updated_at = NOW()
WHERE slug = 'los-lunares-sevilla';

-- Oliver  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Con sede en la plaza Doctora Álvarez Silván, 1, en el 41013 sevillano, Oliver es una guardería privada que escolariza a niños desde los 4 meses hasta los 3 años.\n\nLa Junta de Andalucía lo recoge como centro adherido al Programa de Ayuda a las Familias, la vía habitual de bonificación del coste de la escolarización 0-3 en la comunidad. El detalle de servicios no consta: en Andalucía, el comedor, el aula matinal y el taller de juego son servicios complementarios que se solicitan junto con la plaza.\n\nEl origen de estos datos es el listado oficial de centros de primer ciclo con alumnado matriculado, de modo que puede estar incompleto. Ponerse en contacto con Oliver es el paso lógico para resolver dudas sobre admisión, horarios y coste.',
  updated_at = NOW()
WHERE slug = 'oliver-sevilla';

-- El Osito Azul  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'El Osito Azul atiende el primer ciclo de educación infantil en la calle San Juan de Aznalfarache, 2, código postal 41006 de Sevilla. De titularidad privada, recibe a niñas y niños de 4 meses a 3 años.\n\nParticipa en el Programa de Ayuda a las Familias, por lo que las familias pueden solicitar la ayuda autonómica que rebaja el precio del servicio de atención socioeducativa. Los listados oficiales tampoco recogen el proyecto educativo, un elemento que suele pesar bastante en la elección de escuela infantil.\n\nLos datos anteriores están tomados de fuentes públicas y no reflejan necesariamente la situación actual del centro. Una consulta directa aclarará plazas, horarios y condiciones económicas mejor que cualquier listado.',
  updated_at = NOW()
WHERE slug = 'el-osito-azul-sevilla';

-- Arco Iris  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Con dirección en la barriada Los Príncipes, parcela 8, bloque 13, local 1 (41008), Arco Iris presta servicio en Sevilla como una escuela de primer ciclo privada, con plazas para bebés y niños a partir de los 4 meses y hasta los 3 años. En el mismo bloque figura registrado otro centro de primer ciclo, Arco Iris de los Príncipes.\n\nForma parte del conjunto de centros adheridos al Programa de Ayuda a las Familias, lo que abre la puerta a la bonificación autonómica de la mensualidad. No se han confirmado servicios concretos en fuente oficial, por lo que esta ficha no los enumera.\n\nLa información mostrada tiene carácter orientativo y procede de registros públicos. Antes de dar cualquier paso, conviene contactar con Arco Iris y confirmar plazas, calendario y condiciones económicas.',
  updated_at = NOW()
WHERE slug = 'arco-iris-los-principes-sevilla';

-- Un-Dos-Tres  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Un-Dos-Tres es una guardería privada de la ciudad de Sevilla. Su local está en la calle Sebastián Recasens, 16, en el 41007, y su actividad se dirige a alumnado de los 4 a los 36 meses.\n\nEntre los datos oficiales figura su adhesión al Programa de Ayuda a las Familias, que permite pedir la bonificación del precio de la atención socioeducativa. Falta información oficial sobre comedor, aula matinal y horarios, que en esta etapa varían mucho de una escuela a otra.\n\nEsta descripción se ha elaborado únicamente a partir de datos públicos, sin material promocional del centro. Para comparar con otras opciones de la zona, pide al centro los datos concretos de horario, servicios y cuota.',
  updated_at = NOW()
WHERE slug = 'un-dos-tres-sevilla';

-- La Sonrisa de un Niño  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'En la calle Japón, s/n (41020, Sevilla) encontramos La Sonrisa de un Niño, un centro infantil de carácter privado dedicado a pequeños desde los cuatro meses hasta los tres años.\n\nSu adhesión al Programa de Ayuda a las Familias implica que el precio de la plaza está sujeto a las bonificaciones que fija cada curso la Junta de Andalucía. La información pública se detiene ahí: ni el horario de apertura ni los servicios figuran en el registro, de modo que hay que consultarlos al centro.\n\nAl proceder de un listado oficial, esta información no incluye ni el proyecto educativo ni las condiciones concretas de cada curso. Antes de decidir, pregunta al centro por el periodo de adaptación, el horario y las cuotas vigentes.',
  updated_at = NOW()
WHERE slug = 'la-sonrisa-de-un-nino-sevilla';

-- El Triángulo  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'El Triángulo figura en el registro andaluz de centros de primer ciclo como un centro de educación infantil privado. Está en la calle Francisco de Ariño, 18, 41008 de Sevilla, y atiende a niños entre los 4 meses y los 3 años.\n\nSegún el registro autonómico está adherido al Programa de Ayuda a las Familias, de forma que el importe a pagar depende de la bonificación reconocida a cada familia. Sobre el funcionamiento diario no hay datos oficiales; en el primer ciclo la jornada se organiza en torno a rutinas de alimentación, descanso y juego, y cada escuela fija las suyas.\n\nEsta ficha recoge lo que consta en fuentes públicas; el centro puede aportar más detalle o solicitar su actualización. Si estás valorando esta opción, pide información directamente al centro sobre disponibilidad, jornada y coste mensual.',
  updated_at = NOW()
WHERE slug = 'el-triangulo-sevilla';

-- Zaketines  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Dentro del 41020 de Sevilla, en la avenida Emilio Lemos, 37-A/B, trabaja Zaketines, un centro educativo de la etapa 0-3 de titularidad privada con niñas y niños desde los 4 meses hasta los 3 años.\n\nTrabaja dentro del Programa de Ayuda a las Familias, el marco autonómico que abarata la plaza de primer ciclo a las familias que cumplen los requisitos. No aparecen servicios confirmados en la fuente consultada, algo frecuente en los listados administrativos y que no significa que el centro no los ofrezca.\n\nLo que aparece aquí se apoya en datos abiertos de la administración educativa andaluza y puede haber variado desde la última actualización. La disponibilidad de plaza, el horario real y el precio final conviene confirmarlos con el centro antes de solicitar.',
  updated_at = NOW()
WHERE slug = 'zaketines-sevilla';

-- Arco Iris de los Príncipes  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Arco Iris de los Príncipes forma parte de la oferta de primer ciclo de Sevilla. Es un centro de primer ciclo de educación infantil de titularidad privada, con sede en la barriada Los Príncipes, parcela 8, bloque 13, local 2 (41008), y atiende a bebés y niños de 4 meses a 3 años. En el mismo bloque consta registrado otro centro de primer ciclo, Arco Iris.\n\nAparece entre los centros adheridos al Programa de Ayuda a las Familias; la admisión suele canalizarse por el procedimiento anual que convoca la administración educativa andaluza. El registro no baja al detalle del día a día: comedor, ampliación de horario o periodo de adaptación quedan fuera de la información publicada.\n\nEl contenido de esta ficha se basa en fuentes públicas y puede quedar desfasado entre actualizaciones del registro. Contactar con el centro permite confirmar si quedan plazas y qué servicios ofrece realmente este curso.',
  updated_at = NOW()
WHERE slug = 'arco-iris-de-los-principes-sevilla';

-- Campanilla  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'La actividad de Campanilla se desarrolla en la calle Cardenal Illundaín, 12, en el distrito postal 41013 de Sevilla. Es una escuela infantil privada para alumnado a partir de los 4 meses y hasta los 3 años.\n\nSu condición de centro adherido al Programa de Ayuda a las Familias da acceso a las ayudas que la Junta destina a las plazas de 0 a 3 años. En cambio, no hay constancia oficial de qué servicios presta ni de su horario concreto, dos aspectos que solo el centro puede aclarar.\n\nLos datos publicados provienen de fuentes abiertas y no han sido confirmados por el propio centro. Una llamada al centro despeja en pocos minutos las dudas sobre plazas, horarios y precios.',
  updated_at = NOW()
WHERE slug = 'campanilla-sevilla';

-- Los Angelitos  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Los Angelitos es una guardería dedicada al tramo de 0 a 3 años de titularidad privada que atiende a pequeños de los 4 a los 36 meses en la calle Pagés del Corro, 138, 41010, Sevilla.\n\nSu ficha en el registro lo señala como centro adherido al Programa de Ayuda a las Familias, de modo que la cuota puede bonificarse conforme a la normativa andaluza. La misma fuente no detalla los servicios complementarios —aula matinal, comedor o taller de juego—, que conviene preguntar antes de solicitar plaza.\n\nToda la información de esta ficha procede de registros administrativos de acceso público, que no siempre reflejan los cambios recientes. Concertar una visita permite ver las instalaciones y preguntar por matrícula, horarios y bonificaciones.',
  updated_at = NOW()
WHERE slug = 'los-angelitos-sevilla';

-- Bambi y Flor  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'En el 41012 de Sevilla, concretamente en la calle Bergantín, 23, se encuentra Bambi y Flor, una escuela de educación infantil privada con alumnado desde los cuatro meses hasta los tres años.\n\nEstá acogido al Programa de Ayuda a las Familias, con lo que parte de la cuota mensual puede quedar bonificada en función de los criterios de la convocatoria vigente. En esta etapa la incorporación se hace de forma progresiva y cada centro la organiza a su modo; el registro consultado no precisa cómo lo hace este.\n\nConviene tomar estos datos como punto de partida, ya que proceden de un registro público que se actualiza periódicamente. Las familias interesadas pueden dirigirse al centro para conocer vacantes, horario de apertura y tarifas.',
  updated_at = NOW()
WHERE slug = 'bambi-y-flor-sevilla';

-- Mary Poppins  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Mary Poppins desarrolla su labor educativa con niñas y niños entre los 4 meses y los 3 años en la plaza Vicente Aleixandre, s/n, en el 41013 de Sevilla. Su titularidad es privada.\n\nConsta acogido al Programa de Ayuda a las Familias, el sistema con el que la Junta de Andalucía bonifica parte del coste de la plaza en la etapa 0-3. Más allá de esos datos administrativos, el funcionamiento concreto —horarios, comidas, adaptación— no está documentado en fuentes públicas.\n\nSe trata de información de origen administrativo, útil para situar el centro pero insuficiente para conocerlo a fondo. Para saber si hay plaza libre, en qué horario y con qué cuota, lo mejor es hablar con el equipo del centro.',
  updated_at = NOW()
WHERE slug = 'mary-poppins-sevilla';

-- Las Águilas  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Una guardería de primer ciclo de titularidad privada: así consta Las Águilas en el registro autonómico. Está en la calle Águila Imperial, 5 (41006, Sevilla) y trabaja con bebés y niños desde los 4 meses hasta los 3 años.\n\nConsta la adhesión al Programa de Ayuda a las Familias: las familias pueden pedir la bonificación del precio de la plaza en los plazos que marca cada convocatoria. Tampoco constan los servicios que ofrece ni cómo distribuye los grupos por edades, información que suele facilitar el propio centro al pedir cita.\n\nEsta ficha reúne datos públicos y no incorpora valoraciones ni opiniones sobre el centro. Escribir o llamar permite preguntar por las plazas disponibles y por cómo se organiza la jornada.',
  updated_at = NOW()
WHERE slug = 'las-aguilas-sevilla';

-- Arbolito  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Arbolito tiene su sede en la plaza La Fuensanta, 4-A, en el 41020 de Sevilla, y funciona como un centro infantil privado para alumnado de 4 meses a 3 años.\n\nAl ser un centro adherido al Programa de Ayuda a las Familias, quienes obtienen plaza pueden beneficiarse de la bonificación autonómica del precio. Nada más se recoge en la fuente oficial, ni horarios ni servicios, así que esta descripción se limita a los datos verificables.\n\nNada de lo anterior sustituye a la información que facilite el propio centro: son datos administrativos, sin más. Merece la pena preguntar directamente por el proceso de admisión y por los plazos de solicitud de cada curso.',
  updated_at = NOW()
WHERE slug = 'arbolito-sevilla';

-- San Vicente de Paúl  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Entre los centros de primer ciclo de Sevilla se encuentra San Vicente de Paúl, un centro de educación infantil privado instalado en la calle Helipuerto de La Paz, 11 (41019), en el barrio de Aeropuerto Viejo, que atiende a pequeños a partir de los 4 meses y hasta los 3 años.\n\nEl registro andaluz lo incluye entre los centros adheridos al Programa de Ayuda a las Familias, de manera que la mensualidad puede reducirse según la bonificación que corresponda a cada unidad familiar. El detalle de servicios no consta: en Andalucía, el comedor, el aula matinal y el taller de juego son servicios complementarios que se solicitan junto con la plaza.\n\nEl origen de estos datos es el listado oficial de centros de primer ciclo con alumnado matriculado, de modo que puede estar incompleto. Para cualquier detalle sobre matrícula, jornada o precios, la vía adecuada es el contacto con San Vicente de Paúl.',
  updated_at = NOW()
WHERE slug = 'san-vicente-de-paul-sevilla';

-- Fábula  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Fábula es un centro de primer ciclo privado. Su dirección, la calle Gema, 7, corresponde al código postal 41020 de Sevilla, y su oferta se dirige a niños de los 4 a los 36 meses.\n\nEl centro está integrado en el Programa de Ayuda a las Familias, la fórmula con la que la administración andaluza subvenciona parte del coste de estas plazas. Los listados oficiales tampoco recogen el proyecto educativo, un elemento que suele pesar bastante en la elección de escuela infantil.\n\nLos datos anteriores están tomados de fuentes públicas y no reflejan necesariamente la situación actual del centro. Solicitar información al propio centro es la forma más rápida de conocer vacantes, horarios y cuotas de este curso.',
  updated_at = NOW()
WHERE slug = 'fabula-sevilla';

-- Pato Donald  [privado, NO adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'En la calle Paraíso, s/n, 41011 de Sevilla, Pato Donald cubre el tramo anterior al aula de 3 años como un centro de primer ciclo de educación infantil de titularidad privada, con niñas y niños desde los cuatro meses hasta los tres años.\n\nNo figura entre los centros acogidos al Programa de Ayuda a las Familias, así que tanto la admisión como el precio dependen directamente de su dirección. No se han confirmado servicios concretos en fuente oficial, por lo que esta ficha no los enumera.\n\nLa información mostrada tiene carácter orientativo y procede de registros públicos. Ponerse en contacto con Pato Donald es el paso lógico para resolver dudas sobre admisión, horarios y coste.',
  updated_at = NOW()
WHERE slug = 'pato-donald-sevilla';

-- Los Diminutos  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Los Diminutos pertenece al grupo de escuelas privadas de primer ciclo de Sevilla. Ocupa un local en la plaza Playa Punta Umbría, 2-3, en el 41009, y admite a bebés y niños entre los 4 meses y los 3 años.\n\nParticipa en el Programa de Ayuda a las Familias, por lo que las familias pueden solicitar la ayuda autonómica que rebaja el precio del servicio de atención socioeducativa. Falta información oficial sobre comedor, aula matinal y horarios, que en esta etapa varían mucho de una escuela a otra.\n\nEsta descripción se ha elaborado únicamente a partir de datos públicos, sin material promocional del centro. Una consulta directa aclarará plazas, horarios y condiciones económicas mejor que cualquier listado.',
  updated_at = NOW()
WHERE slug = 'los-diminutos-sevilla';

-- Colorín Colorado  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'El domicilio de Colorín Colorado es la ronda de Pío XII, 1-A, 41008 de Sevilla. Este centro privado se ocupa del primer ciclo de educación infantil y recibe a alumnado desde los 4 meses hasta los 3 años.\n\nForma parte del conjunto de centros adheridos al Programa de Ayuda a las Familias, lo que abre la puerta a la bonificación autonómica de la mensualidad. La información pública se detiene ahí: ni el horario de apertura ni los servicios figuran en el registro, de modo que hay que consultarlos al centro.\n\nAl proceder de un listado oficial, esta información no incluye ni el proyecto educativo ni las condiciones concretas de cada curso. Antes de dar cualquier paso, conviene contactar con Colorín Colorado y confirmar plazas, calendario y condiciones económicas.',
  updated_at = NOW()
WHERE slug = 'colorin-colorado-sevilla';

-- Futuritos  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Futuritos es una escuela de educación infantil privada que trabaja en la calle Doctor Hermosilla Molina, 2, local 2, dentro del 41020 sevillano, con pequeños de 4 meses a 3 años.\n\nEntre los datos oficiales figura su adhesión al Programa de Ayuda a las Familias, que permite pedir la bonificación del precio de la atención socioeducativa. Sobre el funcionamiento diario no hay datos oficiales; en el primer ciclo la jornada se organiza en torno a rutinas de alimentación, descanso y juego, y cada escuela fija las suyas.\n\nEsta ficha recoge lo que consta en fuentes públicas; el centro puede aportar más detalle o solicitar su actualización. Para comparar con otras opciones de la zona, pide al centro los datos concretos de horario, servicios y cuota.',
  updated_at = NOW()
WHERE slug = 'futuritos-sevilla';

-- Los Pirujos  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'A la altura de la calle Jaime Balmes, 23, en el 41007 de Sevilla, se ubica Los Pirujos, una escuela de educación infantil de primer ciclo de titularidad privada para niños a partir de los 4 meses y hasta los 3 años.\n\nSu adhesión al Programa de Ayuda a las Familias implica que el precio de la plaza está sujeto a las bonificaciones que fija cada curso la Junta de Andalucía. No aparecen servicios confirmados en la fuente consultada, algo frecuente en los listados administrativos y que no significa que el centro no los ofrezca.\n\nLo que aparece aquí se apoya en datos abiertos de la administración educativa andaluza y puede haber variado desde la última actualización. Antes de decidir, pregunta al centro por el periodo de adaptación, el horario y las cuotas vigentes.',
  updated_at = NOW()
WHERE slug = 'los-pirujos-sevilla';

-- Babyluna  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Babyluna, una guardería privada de Sevilla, tiene su local en la calle Patricio Sáenz, 15, bajo A (41003) y atiende a niñas y niños de los 4 a los 36 meses.\n\nSegún el registro autonómico está adherido al Programa de Ayuda a las Familias, de forma que el importe a pagar depende de la bonificación reconocida a cada familia. El registro no baja al detalle del día a día: comedor, ampliación de horario o periodo de adaptación quedan fuera de la información publicada.\n\nEl contenido de esta ficha se basa en fuentes públicas y puede quedar desfasado entre actualizaciones del registro. Si estás valorando esta opción, pide información directamente al centro sobre disponibilidad, jornada y coste mensual.',
  updated_at = NOW()
WHERE slug = 'babyluna-sevilla';

-- Mi pequeña casa  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'El registro de centros de primer ciclo de Andalucía incluye a Mi pequeña casa, un centro infantil privado con sede en la plaza Pintor Amalio García del Moral, 4, 41005 de Sevilla, para bebés y niños desde los cuatro meses hasta los tres años. En esa misma dirección aparece registrado un segundo centro, Mi Pequeña Casa II.\n\nTrabaja dentro del Programa de Ayuda a las Familias, el marco autonómico que abarata la plaza de primer ciclo a las familias que cumplen los requisitos. En cambio, no hay constancia oficial de qué servicios presta ni de su horario concreto, dos aspectos que solo el centro puede aclarar.\n\nLos datos publicados provienen de fuentes abiertas y no han sido confirmados por el propio centro. La disponibilidad de plaza, el horario real y el precio final conviene confirmarlos con el centro antes de solicitar.',
  updated_at = NOW()
WHERE slug = 'mi-pequena-casa-sevilla';

-- La casa del niño  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'La casa del niño está inscrito como un centro dedicado al primer ciclo de educación infantil de titularidad privada y trabaja en la calle Párroco Antonio González Abato, locales 3 y 4, 41013 de Sevilla, con alumnado entre los 4 meses y los 3 años.\n\nAparece entre los centros adheridos al Programa de Ayuda a las Familias; la admisión suele canalizarse por el procedimiento anual que convoca la administración educativa andaluza. La misma fuente no detalla los servicios complementarios —aula matinal, comedor o taller de juego—, que conviene preguntar antes de solicitar plaza.\n\nToda la información de esta ficha procede de registros administrativos de acceso público, que no siempre reflejan los cambios recientes. Contactar con el centro permite confirmar si quedan plazas y qué servicios ofrece realmente este curso.',
  updated_at = NOW()
WHERE slug = 'la-casa-del-nino-sevilla';

-- La casa de los niños  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'En la calle Doctora Navarro Rodríguez, edificio Bulevar, locales 1 y 2, código postal 41020 de Sevilla, La casa de los niños ofrece plazas de primer ciclo de educación infantil. Es un centro educativo de la etapa 0-3 de titularidad privada dirigido a pequeños desde los 4 meses hasta los 3 años.\n\nSu condición de centro adherido al Programa de Ayuda a las Familias da acceso a las ayudas que la Junta destina a las plazas de 0 a 3 años. En esta etapa la incorporación se hace de forma progresiva y cada centro la organiza a su modo; el registro consultado no precisa cómo lo hace este.\n\nConviene tomar estos datos como punto de partida, ya que proceden de un registro público que se actualiza periódicamente. Una llamada al centro despeja en pocos minutos las dudas sobre plazas, horarios y precios.',
  updated_at = NOW()
WHERE slug = 'la-casa-de-los-ninos-sevilla';

-- Creatividad  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Creatividad es un centro de primer ciclo de educación infantil de titularidad privada, situado en la calle de la Salud, s/n, dentro del código postal 41014 de Sevilla. Trabaja con niños de 4 meses a 3 años.\n\nSu ficha en el registro lo señala como centro adherido al Programa de Ayuda a las Familias, de modo que la cuota puede bonificarse conforme a la normativa andaluza. Más allá de esos datos administrativos, el funcionamiento concreto —horarios, comidas, adaptación— no está documentado en fuentes públicas.\n\nSe trata de información de origen administrativo, útil para situar el centro pero insuficiente para conocerlo a fondo. Concertar una visita permite ver las instalaciones y preguntar por matrícula, horarios y bonificaciones.',
  updated_at = NOW()
WHERE slug = 'creatividad-sevilla';

-- Rubén Darío  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'En el parque Rubén Darío, torre III, bajo, en el 41010 de Sevilla, desarrolla su actividad Rubén Darío, una escuela infantil privada orientada a niñas y niños a partir de los 4 meses y hasta los 3 años.\n\nEstá acogido al Programa de Ayuda a las Familias, con lo que parte de la cuota mensual puede quedar bonificada en función de los criterios de la convocatoria vigente. Tampoco constan los servicios que ofrece ni cómo distribuye los grupos por edades, información que suele facilitar el propio centro al pedir cita.\n\nEsta ficha reúne datos públicos y no incorpora valoraciones ni opiniones sobre el centro. Las familias interesadas pueden dirigirse al centro para conocer vacantes, horario de apertura y tarifas.',
  updated_at = NOW()
WHERE slug = 'ruben-dario-sevilla';

-- Disney  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Disney ocupa un espacio en la calle Parque Sierra Nevada, manzana B, local H2 (41015, Sevilla). Es una guardería dedicada al tramo de 0 a 3 años de gestión privada y atiende a bebés y niños de los 4 a los 36 meses.\n\nConsta acogido al Programa de Ayuda a las Familias, el sistema con el que la Junta de Andalucía bonifica parte del coste de la plaza en la etapa 0-3. Nada más se recoge en la fuente oficial, ni horarios ni servicios, así que esta descripción se limita a los datos verificables.\n\nNada de lo anterior sustituye a la información que facilite el propio centro: son datos administrativos, sin más. Para saber si hay plaza libre, en qué horario y con qué cuota, lo mejor es hablar con el equipo del centro.',
  updated_at = NOW()
WHERE slug = 'disney-sevilla';

-- Triana  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'La sede de Triana está en la calle Espartinas, 6, bajo, en la zona del código postal 41010 de Sevilla. Se trata de una escuela dedicada al primer ciclo de educación infantil de titularidad privada para alumnado desde los cuatro meses hasta los tres años.\n\nConsta la adhesión al Programa de Ayuda a las Familias: las familias pueden pedir la bonificación del precio de la plaza en los plazos que marca cada convocatoria. El detalle de servicios no consta: en Andalucía, el comedor, el aula matinal y el taller de juego son servicios complementarios que se solicitan junto con la plaza.\n\nEl origen de estos datos es el listado oficial de centros de primer ciclo con alumnado matriculado, de modo que puede estar incompleto. Escribir o llamar permite preguntar por las plazas disponibles y por cómo se organiza la jornada.',
  updated_at = NOW()
WHERE slug = 'triana-sevilla';

-- Las Margaritas  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Las Margaritas, una escuela de educación infantil de primer ciclo de titularidad privada, abre sus puertas en la calle Albatros, 2, bajo (41019, Sevilla), en el barrio de Valdezorras y acoge a pequeños entre los 4 meses y los 3 años.\n\nAl ser un centro adherido al Programa de Ayuda a las Familias, quienes obtienen plaza pueden beneficiarse de la bonificación autonómica del precio. Los listados oficiales tampoco recogen el proyecto educativo, un elemento que suele pesar bastante en la elección de escuela infantil.\n\nLos datos anteriores están tomados de fuentes públicas y no reflejan necesariamente la situación actual del centro. Merece la pena preguntar directamente por el proceso de admisión y por los plazos de solicitud de cada curso.',
  updated_at = NOW()
WHERE slug = 'las-margaritas-sevilla';

-- Virgen de la Estrella  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Con sede en la plaza del Zurraque, 8, local 4, en el 41010 sevillano, Virgen de la Estrella es una guardería privada que escolariza a niños desde los 4 meses hasta los 3 años.\n\nEl registro andaluz lo incluye entre los centros adheridos al Programa de Ayuda a las Familias, de manera que la mensualidad puede reducirse según la bonificación que corresponda a cada unidad familiar. No se han confirmado servicios concretos en fuente oficial, por lo que esta ficha no los enumera.\n\nLa información mostrada tiene carácter orientativo y procede de registros públicos. Para cualquier detalle sobre matrícula, jornada o precios, la vía adecuada es el contacto con Virgen de la Estrella.',
  updated_at = NOW()
WHERE slug = 'virgen-de-la-estrella-sevilla';

-- Jardín Mágico  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Jardín Mágico atiende el primer ciclo de educación infantil en la calle Marchena, 19, código postal 41013 de Sevilla. De titularidad privada, recibe a niñas y niños de 4 meses a 3 años.\n\nEl centro está integrado en el Programa de Ayuda a las Familias, la fórmula con la que la administración andaluza subvenciona parte del coste de estas plazas. Falta información oficial sobre comedor, aula matinal y horarios, que en esta etapa varían mucho de una escuela a otra.\n\nEsta descripción se ha elaborado únicamente a partir de datos públicos, sin material promocional del centro. Solicitar información al propio centro es la forma más rápida de conocer vacantes, horarios y cuotas de este curso.',
  updated_at = NOW()
WHERE slug = 'jardin-magico-sevilla';

-- Érase una vez...  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Con dirección en la calle Flor de Tomillo, 1, bloque 1, bajo B (41020), Érase una vez... presta servicio en Sevilla como un centro de educación infantil privado, con plazas para bebés y niños a partir de los 4 meses y hasta los 3 años.\n\nLa Junta de Andalucía lo recoge como centro adherido al Programa de Ayuda a las Familias, la vía habitual de bonificación del coste de la escolarización 0-3 en la comunidad. La información pública se detiene ahí: ni el horario de apertura ni los servicios figuran en el registro, de modo que hay que consultarlos al centro.\n\nAl proceder de un listado oficial, esta información no incluye ni el proyecto educativo ni las condiciones concretas de cada curso. Ponerse en contacto con Érase una vez... es el paso lógico para resolver dudas sobre admisión, horarios y coste.',
  updated_at = NOW()
WHERE slug = 'erase-una-vez-sevilla';

-- Colorines  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Colorines es un centro de primer ciclo privado de la ciudad de Sevilla. Su local está en la calle Aguadulce, 1 y 3, en el 41006, y su actividad se dirige a alumnado de los 4 a los 36 meses.\n\nParticipa en el Programa de Ayuda a las Familias, por lo que las familias pueden solicitar la ayuda autonómica que rebaja el precio del servicio de atención socioeducativa. Sobre el funcionamiento diario no hay datos oficiales; en el primer ciclo la jornada se organiza en torno a rutinas de alimentación, descanso y juego, y cada escuela fija las suyas.\n\nEsta ficha recoge lo que consta en fuentes públicas; el centro puede aportar más detalle o solicitar su actualización. Una consulta directa aclarará plazas, horarios y condiciones económicas mejor que cualquier listado.',
  updated_at = NOW()
WHERE slug = 'colorines-sevilla';

-- San José de la Montaña  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'En la calle Guzmán el Bueno, 10 (41004, Sevilla) encontramos San José de la Montaña, un centro educativo de carácter privado dedicado a pequeños desde los cuatro meses hasta los tres años.\n\nForma parte del conjunto de centros adheridos al Programa de Ayuda a las Familias, lo que abre la puerta a la bonificación autonómica de la mensualidad. No aparecen servicios confirmados en la fuente consultada, algo frecuente en los listados administrativos y que no significa que el centro no los ofrezca.\n\nLo que aparece aquí se apoya en datos abiertos de la administración educativa andaluza y puede haber variado desde la última actualización. Antes de dar cualquier paso, conviene contactar con San José de la Montaña y confirmar plazas, calendario y condiciones económicas.',
  updated_at = NOW()
WHERE slug = 'san-jose-de-la-montana-sevilla';

-- La Lechera  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'La Lechera figura en el registro andaluz de centros de primer ciclo como una escuela infantil privada. Está en la avenida de Kansas City, 30, 41007 de Sevilla, y atiende a niños entre los 4 meses y los 3 años.\n\nEntre los datos oficiales figura su adhesión al Programa de Ayuda a las Familias, que permite pedir la bonificación del precio de la atención socioeducativa. El registro no baja al detalle del día a día: comedor, ampliación de horario o periodo de adaptación quedan fuera de la información publicada.\n\nEl contenido de esta ficha se basa en fuentes públicas y puede quedar desfasado entre actualizaciones del registro. Para comparar con otras opciones de la zona, pide al centro los datos concretos de horario, servicios y cuota.',
  updated_at = NOW()
WHERE slug = 'la-lechera-sevilla';

-- María Auxiliadora  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Dentro del 41008 de Sevilla, en la calle Imaginero Fernández Andes, 13, trabaja María Auxiliadora, una guardería dedicada al tramo de 0 a 3 años de titularidad privada con niñas y niños desde los 4 meses hasta los 3 años.\n\nSu adhesión al Programa de Ayuda a las Familias implica que el precio de la plaza está sujeto a las bonificaciones que fija cada curso la Junta de Andalucía. En cambio, no hay constancia oficial de qué servicios presta ni de su horario concreto, dos aspectos que solo el centro puede aclarar.\n\nLos datos publicados provienen de fuentes abiertas y no han sido confirmados por el propio centro. Antes de decidir, pregunta al centro por el periodo de adaptación, el horario y las cuotas vigentes.',
  updated_at = NOW()
WHERE slug = 'maria-auxiliadora-sevilla';

-- Arco Iris  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Arco Iris forma parte de la oferta de primer ciclo de Sevilla. Es una escuela dedicada al primer ciclo de educación infantil de titularidad privada, con sede en la calle Azorín, 171-B (41006), y atiende a bebés y niños de 4 meses a 3 años.\n\nSegún el registro autonómico está adherido al Programa de Ayuda a las Familias, de forma que el importe a pagar depende de la bonificación reconocida a cada familia. La misma fuente no detalla los servicios complementarios —aula matinal, comedor o taller de juego—, que conviene preguntar antes de solicitar plaza.\n\nToda la información de esta ficha procede de registros administrativos de acceso público, que no siempre reflejan los cambios recientes. Si estás valorando esta opción, pide información directamente al centro sobre disponibilidad, jornada y coste mensual.',
  updated_at = NOW()
WHERE slug = 'arco-iris-azorin-sevilla';

-- Mi planeta  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'La actividad de Mi planeta se desarrolla en la calle Miguel Cid, 70, en el distrito postal 41002 de Sevilla. Es una escuela de primer ciclo privada para alumnado a partir de los 4 meses y hasta los 3 años.\n\nTrabaja dentro del Programa de Ayuda a las Familias, el marco autonómico que abarata la plaza de primer ciclo a las familias que cumplen los requisitos. En esta etapa la incorporación se hace de forma progresiva y cada centro la organiza a su modo; el registro consultado no precisa cómo lo hace este.\n\nConviene tomar estos datos como punto de partida, ya que proceden de un registro público que se actualiza periódicamente. La disponibilidad de plaza, el horario real y el precio final conviene confirmarlos con el centro antes de solicitar.',
  updated_at = NOW()
WHERE slug = 'mi-planeta-sevilla';

-- Los Príncipes  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Los Príncipes es una guardería de primer ciclo de titularidad privada que atiende a pequeños de los 4 a los 36 meses en la barriada Los Príncipes, parcela 7, bloque 12, 41008, Sevilla.\n\nAparece entre los centros adheridos al Programa de Ayuda a las Familias; la admisión suele canalizarse por el procedimiento anual que convoca la administración educativa andaluza. Más allá de esos datos administrativos, el funcionamiento concreto —horarios, comidas, adaptación— no está documentado en fuentes públicas.\n\nSe trata de información de origen administrativo, útil para situar el centro pero insuficiente para conocerlo a fondo. Contactar con el centro permite confirmar si quedan plazas y qué servicios ofrece realmente este curso.',
  updated_at = NOW()
WHERE slug = 'los-principes-sevilla';

-- Mi Pequeña Casa II  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'En el 41005 de Sevilla, concretamente en la plaza Pintor Amalio García del Moral, 4, puerta 3, se encuentra Mi Pequeña Casa II, un centro infantil privado con alumnado desde los cuatro meses hasta los tres años. En esa misma dirección figura también Mi pequeña casa, otro centro de primer ciclo.\n\nSu condición de centro adherido al Programa de Ayuda a las Familias da acceso a las ayudas que la Junta destina a las plazas de 0 a 3 años. Tampoco constan los servicios que ofrece ni cómo distribuye los grupos por edades, información que suele facilitar el propio centro al pedir cita.\n\nEsta ficha reúne datos públicos y no incorpora valoraciones ni opiniones sobre el centro. Una llamada al centro despeja en pocos minutos las dudas sobre plazas, horarios y precios.',
  updated_at = NOW()
WHERE slug = 'mi-pequena-casa-ii-sevilla';

-- Patín  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Patín desarrolla su labor educativa con niñas y niños entre los 4 meses y los 3 años en la calle Mallén, 5, en el 41018 de Sevilla. Su titularidad es privada.\n\nSu ficha en el registro lo señala como centro adherido al Programa de Ayuda a las Familias, de modo que la cuota puede bonificarse conforme a la normativa andaluza. Nada más se recoge en la fuente oficial, ni horarios ni servicios, así que esta descripción se limita a los datos verificables.\n\nNada de lo anterior sustituye a la información que facilite el propio centro: son datos administrativos, sin más. Concertar una visita permite ver las instalaciones y preguntar por matrícula, horarios y bonificaciones.',
  updated_at = NOW()
WHERE slug = 'patin-sevilla';

-- Villa Mariana  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Un centro educativo de la etapa 0-3 de titularidad privada: así consta Villa Mariana en el registro autonómico. Está en la calle Valeriano Bécquer, 57 (41005, Sevilla) y trabaja con bebés y niños desde los 4 meses hasta los 3 años.\n\nEstá acogido al Programa de Ayuda a las Familias, con lo que parte de la cuota mensual puede quedar bonificada en función de los criterios de la convocatoria vigente. El detalle de servicios no consta: en Andalucía, el comedor, el aula matinal y el taller de juego son servicios complementarios que se solicitan junto con la plaza.\n\nEl origen de estos datos es el listado oficial de centros de primer ciclo con alumnado matriculado, de modo que puede estar incompleto. Las familias interesadas pueden dirigirse al centro para conocer vacantes, horario de apertura y tarifas.',
  updated_at = NOW()
WHERE slug = 'villa-mariana-sevilla';

-- El castillo mágico San Diego  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'El castillo mágico San Diego tiene su sede en la barriada San Diego, 58-A, en el 41015 de Sevilla, y funciona como un centro educativo privado para alumnado de 4 meses a 3 años.\n\nConsta acogido al Programa de Ayuda a las Familias, el sistema con el que la Junta de Andalucía bonifica parte del coste de la plaza en la etapa 0-3. Los listados oficiales tampoco recogen el proyecto educativo, un elemento que suele pesar bastante en la elección de escuela infantil.\n\nLos datos anteriores están tomados de fuentes públicas y no reflejan necesariamente la situación actual del centro. Para saber si hay plaza libre, en qué horario y con qué cuota, lo mejor es hablar con el equipo del centro.',
  updated_at = NOW()
WHERE slug = 'el-castillo-magico-san-diego-sevilla';

-- Snoopy II  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Entre los centros de primer ciclo de Sevilla se encuentra Snoopy II, una escuela infantil privada instalada en la calle Mar Menor, 17-18 (41015), que atiende a pequeños a partir de los 4 meses y hasta los 3 años.\n\nConsta la adhesión al Programa de Ayuda a las Familias: las familias pueden pedir la bonificación del precio de la plaza en los plazos que marca cada convocatoria. No se han confirmado servicios concretos en fuente oficial, por lo que esta ficha no los enumera.\n\nLa información mostrada tiene carácter orientativo y procede de registros públicos. Escribir o llamar permite preguntar por las plazas disponibles y por cómo se organiza la jornada.',
  updated_at = NOW()
WHERE slug = 'snoopy-ii-sevilla';

-- Tambor  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Tambor es una guardería privada. Su dirección, la calle Castilla, 77-79, corresponde al código postal 41010 de Sevilla, y su oferta se dirige a niños de los 4 a los 36 meses.\n\nAl ser un centro adherido al Programa de Ayuda a las Familias, quienes obtienen plaza pueden beneficiarse de la bonificación autonómica del precio. Falta información oficial sobre comedor, aula matinal y horarios, que en esta etapa varían mucho de una escuela a otra.\n\nEsta descripción se ha elaborado únicamente a partir de datos públicos, sin material promocional del centro. Merece la pena preguntar directamente por el proceso de admisión y por los plazos de solicitud de cada curso.',
  updated_at = NOW()
WHERE slug = 'tambor-sevilla';

-- Cuentacuentos  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'En la calle Carmen Conde, 8, locales 37 y 38, 41019 de Sevilla, Cuentacuentos cubre el tramo anterior al aula de 3 años como una escuela dedicada al primer ciclo de educación infantil de titularidad privada, con niñas y niños desde los cuatro meses hasta los tres años.\n\nEl registro andaluz lo incluye entre los centros adheridos al Programa de Ayuda a las Familias, de manera que la mensualidad puede reducirse según la bonificación que corresponda a cada unidad familiar. La información pública se detiene ahí: ni el horario de apertura ni los servicios figuran en el registro, de modo que hay que consultarlos al centro.\n\nAl proceder de un listado oficial, esta información no incluye ni el proyecto educativo ni las condiciones concretas de cada curso. Para cualquier detalle sobre matrícula, jornada o precios, la vía adecuada es el contacto con Cuentacuentos.',
  updated_at = NOW()
WHERE slug = 'cuentacuentos-sevilla';

-- El Osito Azul I  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'El Osito Azul I pertenece al grupo de escuelas privadas de primer ciclo de Sevilla. Ocupa un local en la plaza de Forja XXI, s/n, en el 41006, y admite a bebés y niños entre los 4 meses y los 3 años.\n\nEl centro está integrado en el Programa de Ayuda a las Familias, la fórmula con la que la administración andaluza subvenciona parte del coste de estas plazas. Sobre el funcionamiento diario no hay datos oficiales; en el primer ciclo la jornada se organiza en torno a rutinas de alimentación, descanso y juego, y cada escuela fija las suyas.\n\nEsta ficha recoge lo que consta en fuentes públicas; el centro puede aportar más detalle o solicitar su actualización. Solicitar información al propio centro es la forma más rápida de conocer vacantes, horarios y cuotas de este curso.',
  updated_at = NOW()
WHERE slug = 'el-osito-azul-i-sevilla';

-- El Osito Azul II  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'El domicilio de El Osito Azul II es la plaza de la Carlota, s/n, 41006 de Sevilla. Este centro privado se ocupa del primer ciclo de educación infantil y recibe a alumnado desde los 4 meses hasta los 3 años.\n\nLa Junta de Andalucía lo recoge como centro adherido al Programa de Ayuda a las Familias, la vía habitual de bonificación del coste de la escolarización 0-3 en la comunidad. No aparecen servicios confirmados en la fuente consultada, algo frecuente en los listados administrativos y que no significa que el centro no los ofrezca.\n\nLo que aparece aquí se apoya en datos abiertos de la administración educativa andaluza y puede haber variado desde la última actualización. Ponerse en contacto con El Osito Azul II es el paso lógico para resolver dudas sobre admisión, horarios y coste.',
  updated_at = NOW()
WHERE slug = 'el-osito-azul-ii-sevilla';

-- Las 4 Estaciones II  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Las 4 Estaciones II es un centro infantil privado que trabaja en la calle San Vicente de Paúl, 8-E, dentro del 41010 sevillano, con pequeños de 4 meses a 3 años.\n\nParticipa en el Programa de Ayuda a las Familias, por lo que las familias pueden solicitar la ayuda autonómica que rebaja el precio del servicio de atención socioeducativa. El registro no baja al detalle del día a día: comedor, ampliación de horario o periodo de adaptación quedan fuera de la información publicada.\n\nEl contenido de esta ficha se basa en fuentes públicas y puede quedar desfasado entre actualizaciones del registro. Una consulta directa aclarará plazas, horarios y condiciones económicas mejor que cualquier listado.',
  updated_at = NOW()
WHERE slug = 'las-4-estaciones-ii-sevilla';

-- Las Góndolas  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'A la altura de la calle Cueva de Menga, 1, local 4, en el 41020 de Sevilla, se ubica Las Góndolas, un centro dedicado al primer ciclo de educación infantil de titularidad privada para niños a partir de los 4 meses y hasta los 3 años.\n\nForma parte del conjunto de centros adheridos al Programa de Ayuda a las Familias, lo que abre la puerta a la bonificación autonómica de la mensualidad. En cambio, no hay constancia oficial de qué servicios presta ni de su horario concreto, dos aspectos que solo el centro puede aclarar.\n\nLos datos publicados provienen de fuentes abiertas y no han sido confirmados por el propio centro. Antes de dar cualquier paso, conviene contactar con Las Góndolas y confirmar plazas, calendario y condiciones económicas.',
  updated_at = NOW()
WHERE slug = 'las-gondolas-sevilla';

-- Ratón Pérez 2  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Ratón Pérez 2, un centro de primer ciclo privado de Sevilla, tiene su local en la avenida Manuel Siurot, 3, bloque 8 (41013) y atiende a niñas y niños de los 4 a los 36 meses. En el mismo bloque está registrado Ratón Pérez 1, otro centro de primer ciclo.\n\nEntre los datos oficiales figura su adhesión al Programa de Ayuda a las Familias, que permite pedir la bonificación del precio de la atención socioeducativa. La misma fuente no detalla los servicios complementarios —aula matinal, comedor o taller de juego—, que conviene preguntar antes de solicitar plaza.\n\nToda la información de esta ficha procede de registros administrativos de acceso público, que no siempre reflejan los cambios recientes. Para comparar con otras opciones de la zona, pide al centro los datos concretos de horario, servicios y cuota.',
  updated_at = NOW()
WHERE slug = 'raton-perez-2-sevilla';

-- Virgen del Refugio  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'El registro de centros de primer ciclo de Andalucía incluye a Virgen del Refugio, un centro educativo privado con sede en la calle Campamento, 19, 41018 de Sevilla, para bebés y niños desde los cuatro meses hasta los tres años.\n\nSu adhesión al Programa de Ayuda a las Familias implica que el precio de la plaza está sujeto a las bonificaciones que fija cada curso la Junta de Andalucía. En esta etapa la incorporación se hace de forma progresiva y cada centro la organiza a su modo; el registro consultado no precisa cómo lo hace este.\n\nConviene tomar estos datos como punto de partida, ya que proceden de un registro público que se actualiza periódicamente. Antes de decidir, pregunta al centro por el periodo de adaptación, el horario y las cuotas vigentes.',
  updated_at = NOW()
WHERE slug = 'virgen-del-refugio-sevilla';

-- Piolín  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Piolín está inscrito como una escuela infantil de primer ciclo de titularidad privada y trabaja en la calle Salobreña, 9, bajo, 41006 de Sevilla, en el barrio de Doctora Este, con alumnado entre los 4 meses y los 3 años.\n\nSegún el registro autonómico está adherido al Programa de Ayuda a las Familias, de forma que el importe a pagar depende de la bonificación reconocida a cada familia. Más allá de esos datos administrativos, el funcionamiento concreto —horarios, comidas, adaptación— no está documentado en fuentes públicas.\n\nSe trata de información de origen administrativo, útil para situar el centro pero insuficiente para conocerlo a fondo. Si estás valorando esta opción, pide información directamente al centro sobre disponibilidad, jornada y coste mensual.',
  updated_at = NOW()
WHERE slug = 'piolin-sevilla';

-- Nuestra Señora de Nazaret  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'En la calle Salobreña, 2, código postal 41006 de Sevilla, Nuestra Señora de Nazaret ofrece plazas de primer ciclo de educación infantil. Es una guardería dedicada al tramo de 0 a 3 años de titularidad privada dirigida a pequeños desde los 4 meses hasta los 3 años.\n\nTrabaja dentro del Programa de Ayuda a las Familias, el marco autonómico que abarata la plaza de primer ciclo a las familias que cumplen los requisitos. Tampoco constan los servicios que ofrece ni cómo distribuye los grupos por edades, información que suele facilitar el propio centro al pedir cita.\n\nEsta ficha reúne datos públicos y no incorpora valoraciones ni opiniones sobre el centro. La disponibilidad de plaza, el horario real y el precio final conviene confirmarlos con el centro antes de solicitar.',
  updated_at = NOW()
WHERE slug = 'nuestra-senora-de-nazaret-sevilla';

-- Los Peques  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Los Peques es una escuela dedicada al primer ciclo de educación infantil de titularidad privada, situada en la avenida Parque Amate, 2-4, dentro del código postal 41006 de Sevilla. Trabaja con niños de 4 meses a 3 años.\n\nAparece entre los centros adheridos al Programa de Ayuda a las Familias; la admisión suele canalizarse por el procedimiento anual que convoca la administración educativa andaluza. Nada más se recoge en la fuente oficial, ni horarios ni servicios, así que esta descripción se limita a los datos verificables.\n\nNada de lo anterior sustituye a la información que facilite el propio centro: son datos administrativos, sin más. Contactar con el centro permite confirmar si quedan plazas y qué servicios ofrece realmente este curso.',
  updated_at = NOW()
WHERE slug = 'los-peques-sevilla';

-- Fresa  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'En la calle Afán de Ribera, 145, en el 41006 de Sevilla, desarrolla su actividad Fresa, una escuela de primer ciclo privada orientada a niñas y niños a partir de los 4 meses y hasta los 3 años.\n\nSu condición de centro adherido al Programa de Ayuda a las Familias da acceso a las ayudas que la Junta destina a las plazas de 0 a 3 años. El detalle de servicios no consta: en Andalucía, el comedor, el aula matinal y el taller de juego son servicios complementarios que se solicitan junto con la plaza.\n\nEl origen de estos datos es el listado oficial de centros de primer ciclo con alumnado matriculado, de modo que puede estar incompleto. Una llamada al centro despeja en pocos minutos las dudas sobre plazas, horarios y precios.',
  updated_at = NOW()
WHERE slug = 'fresa-sevilla';

-- Los Colorines  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Los Colorines ocupa un espacio en la avenida Parque Amate, 12, bajo (41006, Sevilla). Es una guardería de primer ciclo de gestión privada y atiende a bebés y niños de los 4 a los 36 meses.\n\nSu ficha en el registro lo señala como centro adherido al Programa de Ayuda a las Familias, de modo que la cuota puede bonificarse conforme a la normativa andaluza. Los listados oficiales tampoco recogen el proyecto educativo, un elemento que suele pesar bastante en la elección de escuela infantil.\n\nLos datos anteriores están tomados de fuentes públicas y no reflejan necesariamente la situación actual del centro. Concertar una visita permite ver las instalaciones y preguntar por matrícula, horarios y bonificaciones.',
  updated_at = NOW()
WHERE slug = 'los-colorines-sevilla';

-- Piruleta  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'La sede de Piruleta está en la plaza Doctor González Gramaje, 7, local, en la zona del código postal 41005 de Sevilla. Se trata de un centro de educación infantil de primer ciclo de titularidad privada para alumnado desde los cuatro meses hasta los tres años.\n\nEstá acogido al Programa de Ayuda a las Familias, con lo que parte de la cuota mensual puede quedar bonificada en función de los criterios de la convocatoria vigente. No se han confirmado servicios concretos en fuente oficial, por lo que esta ficha no los enumera.\n\nLa información mostrada tiene carácter orientativo y procede de registros públicos. Las familias interesadas pueden dirigirse al centro para conocer vacantes, horario de apertura y tarifas.',
  updated_at = NOW()
WHERE slug = 'piruleta-sevilla';

-- El Anclita  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'El Anclita, un centro dedicado al primer ciclo de educación infantil de titularidad privada, abre sus puertas en la calle Arqueología, 2 (41015, Sevilla) y acoge a pequeños entre los 4 meses y los 3 años.\n\nConsta acogido al Programa de Ayuda a las Familias, el sistema con el que la Junta de Andalucía bonifica parte del coste de la plaza en la etapa 0-3. Falta información oficial sobre comedor, aula matinal y horarios, que en esta etapa varían mucho de una escuela a otra.\n\nEsta descripción se ha elaborado únicamente a partir de datos públicos, sin material promocional del centro. Para saber si hay plaza libre, en qué horario y con qué cuota, lo mejor es hablar con el equipo del centro.',
  updated_at = NOW()
WHERE slug = 'el-anclita-sevilla';

-- Los Increíbles  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Con sede en la calle Traviesa, 25, locales 11D y 12D, en el 41015 sevillano, Los Increíbles es un centro de primer ciclo privado que escolariza a niños desde los 4 meses hasta los 3 años.\n\nConsta la adhesión al Programa de Ayuda a las Familias: las familias pueden pedir la bonificación del precio de la plaza en los plazos que marca cada convocatoria. La información pública se detiene ahí: ni el horario de apertura ni los servicios figuran en el registro, de modo que hay que consultarlos al centro.\n\nAl proceder de un listado oficial, esta información no incluye ni el proyecto educativo ni las condiciones concretas de cada curso. Escribir o llamar permite preguntar por las plazas disponibles y por cómo se organiza la jornada.',
  updated_at = NOW()
WHERE slug = 'los-increibles-sevilla';

-- El Pisotón  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'El Pisotón atiende el primer ciclo de educación infantil en la calle Alcolea del Río, 12, código postal 41016 de Sevilla, en la barriada Torreblanca. De titularidad privada, recibe a niñas y niños de 4 meses a 3 años.\n\nAl ser un centro adherido al Programa de Ayuda a las Familias, quienes obtienen plaza pueden beneficiarse de la bonificación autonómica del precio. Sobre el funcionamiento diario no hay datos oficiales; en el primer ciclo la jornada se organiza en torno a rutinas de alimentación, descanso y juego, y cada escuela fija las suyas.\n\nEsta ficha recoge lo que consta en fuentes públicas; el centro puede aportar más detalle o solicitar su actualización. Merece la pena preguntar directamente por el proceso de admisión y por los plazos de solicitud de cada curso.',
  updated_at = NOW()
WHERE slug = 'el-pisoton-sevilla';

-- Las Margaritas de la Salle  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Con dirección en la calle San Juan de la Salle, 24 (41008), Las Margaritas de la Salle presta servicio en Sevilla como una escuela infantil privada, con plazas para bebés y niños a partir de los 4 meses y hasta los 3 años.\n\nEl registro andaluz lo incluye entre los centros adheridos al Programa de Ayuda a las Familias, de manera que la mensualidad puede reducirse según la bonificación que corresponda a cada unidad familiar. No aparecen servicios confirmados en la fuente consultada, algo frecuente en los listados administrativos y que no significa que el centro no los ofrezca.\n\nLo que aparece aquí se apoya en datos abiertos de la administración educativa andaluza y puede haber variado desde la última actualización. Para cualquier detalle sobre matrícula, jornada o precios, la vía adecuada es el contacto con Las Margaritas de la Salle.',
  updated_at = NOW()
WHERE slug = 'las-margaritas-de-la-salle-sevilla';

-- Snoopy 6  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Snoopy 6 es una guardería privada de la ciudad de Sevilla. Su local está en la calle Sábalo, 5, en el 41015, y su actividad se dirige a alumnado de los 4 a los 36 meses.\n\nEl centro está integrado en el Programa de Ayuda a las Familias, la fórmula con la que la administración andaluza subvenciona parte del coste de estas plazas. El registro no baja al detalle del día a día: comedor, ampliación de horario o periodo de adaptación quedan fuera de la información publicada.\n\nEl contenido de esta ficha se basa en fuentes públicas y puede quedar desfasado entre actualizaciones del registro. Solicitar información al propio centro es la forma más rápida de conocer vacantes, horarios y cuotas de este curso.',
  updated_at = NOW()
WHERE slug = 'snoopy-6-sevilla';

-- El Bosque de Cardol  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'En la calle Agricultores, 4, locales 1 y 2 (41015, Sevilla) encontramos El Bosque de Cardol, una escuela de educación infantil de carácter privado dedicada a pequeños desde los cuatro meses hasta los tres años.\n\nLa Junta de Andalucía lo recoge como centro adherido al Programa de Ayuda a las Familias, la vía habitual de bonificación del coste de la escolarización 0-3 en la comunidad. En cambio, no hay constancia oficial de qué servicios presta ni de su horario concreto, dos aspectos que solo el centro puede aclarar.\n\nLos datos publicados provienen de fuentes abiertas y no han sido confirmados por el propio centro. Ponerse en contacto con El Bosque de Cardol es el paso lógico para resolver dudas sobre admisión, horarios y coste.',
  updated_at = NOW()
WHERE slug = 'el-bosque-de-cardol-sevilla';

-- Patín Royal - San Antonio  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Patín Royal - San Antonio figura en el registro andaluz de centros de primer ciclo como una escuela de primer ciclo privada. Está en la calle Vía Flavia, 14-A, en el polígono industrial El Pino, 41016 de Sevilla, y atiende a niños entre los 4 meses y los 3 años.\n\nParticipa en el Programa de Ayuda a las Familias, por lo que las familias pueden solicitar la ayuda autonómica que rebaja el precio del servicio de atención socioeducativa. La misma fuente no detalla los servicios complementarios —aula matinal, comedor o taller de juego—, que conviene preguntar antes de solicitar plaza.\n\nToda la información de esta ficha procede de registros administrativos de acceso público, que no siempre reflejan los cambios recientes. Una consulta directa aclarará plazas, horarios y condiciones económicas mejor que cualquier listado.',
  updated_at = NOW()
WHERE slug = 'patin-royal-san-antonio-sevilla';

-- Sunny School  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Dentro del 41015 de Sevilla, en la calle Tren Changay, local 5-A, trabaja Sunny School, una guardería de primer ciclo de titularidad privada con niñas y niños desde los 4 meses hasta los 3 años.\n\nForma parte del conjunto de centros adheridos al Programa de Ayuda a las Familias, lo que abre la puerta a la bonificación autonómica de la mensualidad. En esta etapa la incorporación se hace de forma progresiva y cada centro la organiza a su modo; el registro consultado no precisa cómo lo hace este.\n\nConviene tomar estos datos como punto de partida, ya que proceden de un registro público que se actualiza periódicamente. Antes de dar cualquier paso, conviene contactar con Sunny School y confirmar plazas, calendario y condiciones económicas.',
  updated_at = NOW()
WHERE slug = 'sunny-school-sevilla';

-- LA, LA, LA  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'LA, LA, LA forma parte de la oferta de primer ciclo de Sevilla. Es un centro de educación infantil de primer ciclo de titularidad privada, con sede en la calle Ildefonso Marañón Lavín, 12, local 4 (41019), y atiende a bebés y niños de 4 meses a 3 años.\n\nEntre los datos oficiales figura su adhesión al Programa de Ayuda a las Familias, que permite pedir la bonificación del precio de la atención socioeducativa. Más allá de esos datos administrativos, el funcionamiento concreto —horarios, comidas, adaptación— no está documentado en fuentes públicas.\n\nSe trata de información de origen administrativo, útil para situar el centro pero insuficiente para conocerlo a fondo. Para comparar con otras opciones de la zona, pide al centro los datos concretos de horario, servicios y cuota.',
  updated_at = NOW()
WHERE slug = 'la-la-la-sevilla';

-- Mi Bombón  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'La actividad de Mi Bombón se desarrolla en la calle Mallorca, 34, en el distrito postal 41014 de Sevilla. Es un centro de educación infantil privado para alumnado a partir de los 4 meses y hasta los 3 años.\n\nSu adhesión al Programa de Ayuda a las Familias implica que el precio de la plaza está sujeto a las bonificaciones que fija cada curso la Junta de Andalucía. Tampoco constan los servicios que ofrece ni cómo distribuye los grupos por edades, información que suele facilitar el propio centro al pedir cita.\n\nEsta ficha reúne datos públicos y no incorpora valoraciones ni opiniones sobre el centro. Antes de decidir, pregunta al centro por el periodo de adaptación, el horario y las cuotas vigentes.',
  updated_at = NOW()
WHERE slug = 'mi-bombon-sevilla';

-- Ratón Pérez  [privado, NO adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Ratón Pérez es un centro educativo de la etapa 0-3 de titularidad privada que atiende a pequeños de los 4 a los 36 meses en la calle Arcos, 31-A, 41011, Sevilla.\n\nEl registro de la Junta de Andalucía no lo incluye entre los centros adheridos al Programa de Ayuda a las Familias, un dato a tener en cuenta al comparar precios. Nada más se recoge en la fuente oficial, ni horarios ni servicios, así que esta descripción se limita a los datos verificables.\n\nNada de lo anterior sustituye a la información que facilite el propio centro: son datos administrativos, sin más. Si estás valorando esta opción, pide información directamente al centro sobre disponibilidad, jornada y coste mensual.',
  updated_at = NOW()
WHERE slug = 'raton-perez-sevilla';

-- Fresa 2  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'En el 41006 de Sevilla, concretamente en la calle Nuestra Señora de los Dolores, 27, local, se encuentra Fresa 2, un centro educativo privado con alumnado desde los cuatro meses hasta los tres años.\n\nTrabaja dentro del Programa de Ayuda a las Familias, el marco autonómico que abarata la plaza de primer ciclo a las familias que cumplen los requisitos. El detalle de servicios no consta: en Andalucía, el comedor, el aula matinal y el taller de juego son servicios complementarios que se solicitan junto con la plaza.\n\nEl origen de estos datos es el listado oficial de centros de primer ciclo con alumnado matriculado, de modo que puede estar incompleto. La disponibilidad de plaza, el horario real y el precio final conviene confirmarlos con el centro antes de solicitar.',
  updated_at = NOW()
WHERE slug = 'fresa-2-sevilla';

-- El Gusanito  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'El Gusanito desarrolla su labor educativa con niñas y niños entre los 4 meses y los 3 años en la avenida Flota de Indias, 20, bajo, en el 41011 de Sevilla. Su titularidad es privada.\n\nAparece entre los centros adheridos al Programa de Ayuda a las Familias; la admisión suele canalizarse por el procedimiento anual que convoca la administración educativa andaluza. Los listados oficiales tampoco recogen el proyecto educativo, un elemento que suele pesar bastante en la elección de escuela infantil.\n\nLos datos anteriores están tomados de fuentes públicas y no reflejan necesariamente la situación actual del centro. Contactar con el centro permite confirmar si quedan plazas y qué servicios ofrece realmente este curso.',
  updated_at = NOW()
WHERE slug = 'el-gusanito-sevilla';

-- Soletes  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Una guardería dedicada al tramo de 0 a 3 años de titularidad privada: así consta Soletes en el registro autonómico. Está en la calle Doctor Nieto Barrera, portal B, bajo, puerta 1 (41020, Sevilla) y trabaja con bebés y niños desde los 4 meses hasta los 3 años.\n\nSu condición de centro adherido al Programa de Ayuda a las Familias da acceso a las ayudas que la Junta destina a las plazas de 0 a 3 años. No se han confirmado servicios concretos en fuente oficial, por lo que esta ficha no los enumera.\n\nLa información mostrada tiene carácter orientativo y procede de registros públicos. Una llamada al centro despeja en pocos minutos las dudas sobre plazas, horarios y precios.',
  updated_at = NOW()
WHERE slug = 'soletes-sevilla';

-- Patín Macarena  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Patín Macarena tiene su sede en la calle Juan Manuel Rodríguez Correa, 5-7, en el 41009 de Sevilla, y funciona como una escuela de educación infantil privada para alumnado de 4 meses a 3 años.\n\nSu ficha en el registro lo señala como centro adherido al Programa de Ayuda a las Familias, de modo que la cuota puede bonificarse conforme a la normativa andaluza. Falta información oficial sobre comedor, aula matinal y horarios, que en esta etapa varían mucho de una escuela a otra.\n\nEsta descripción se ha elaborado únicamente a partir de datos públicos, sin material promocional del centro. Concertar una visita permite ver las instalaciones y preguntar por matrícula, horarios y bonificaciones.',
  updated_at = NOW()
WHERE slug = 'patin-macarena-sevilla';

-- La Estrella  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Entre los centros de primer ciclo de Sevilla se encuentra La Estrella, una escuela de primer ciclo privada instalada en la calle Virgen de la Estrella, 5, bajo (41011), que atiende a pequeños a partir de los 4 meses y hasta los 3 años.\n\nEstá acogido al Programa de Ayuda a las Familias, con lo que parte de la cuota mensual puede quedar bonificada en función de los criterios de la convocatoria vigente. La información pública se detiene ahí: ni el horario de apertura ni los servicios figuran en el registro, de modo que hay que consultarlos al centro.\n\nAl proceder de un listado oficial, esta información no incluye ni el proyecto educativo ni las condiciones concretas de cada curso. Las familias interesadas pueden dirigirse al centro para conocer vacantes, horario de apertura y tarifas.',
  updated_at = NOW()
WHERE slug = 'la-estrella-sevilla';

-- Delfín  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Delfín es una guardería privada. Su dirección, la calle Nueva Delhi, edificio El Marquesado, local 6, corresponde al código postal 41020 de Sevilla, y su oferta se dirige a niños de los 4 a los 36 meses.\n\nConsta acogido al Programa de Ayuda a las Familias, el sistema con el que la Junta de Andalucía bonifica parte del coste de la plaza en la etapa 0-3. Sobre el funcionamiento diario no hay datos oficiales; en el primer ciclo la jornada se organiza en torno a rutinas de alimentación, descanso y juego, y cada escuela fija las suyas.\n\nEsta ficha recoge lo que consta en fuentes públicas; el centro puede aportar más detalle o solicitar su actualización. Para saber si hay plaza libre, en qué horario y con qué cuota, lo mejor es hablar con el equipo del centro.',
  updated_at = NOW()
WHERE slug = 'delfin-sevilla';

-- Pajaroto  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'En la calle Urbión, 15, local, 41005 de Sevilla, Pajaroto cubre el tramo anterior al aula de 3 años como un centro de educación infantil de primer ciclo de titularidad privada, con niñas y niños desde los cuatro meses hasta los tres años.\n\nConsta la adhesión al Programa de Ayuda a las Familias: las familias pueden pedir la bonificación del precio de la plaza en los plazos que marca cada convocatoria. No aparecen servicios confirmados en la fuente consultada, algo frecuente en los listados administrativos y que no significa que el centro no los ofrezca.\n\nLo que aparece aquí se apoya en datos abiertos de la administración educativa andaluza y puede haber variado desde la última actualización. Escribir o llamar permite preguntar por las plazas disponibles y por cómo se organiza la jornada.',
  updated_at = NOW()
WHERE slug = 'pajaroto-sevilla';

-- La Casita  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'La Casita pertenece al grupo de escuelas privadas de primer ciclo de Sevilla. Ocupa un local en la calle Lazurita, 16, en el 41020, y admite a bebés y niños entre los 4 meses y los 3 años.\n\nAl ser un centro adherido al Programa de Ayuda a las Familias, quienes obtienen plaza pueden beneficiarse de la bonificación autonómica del precio. El registro no baja al detalle del día a día: comedor, ampliación de horario o periodo de adaptación quedan fuera de la información publicada.\n\nEl contenido de esta ficha se basa en fuentes públicas y puede quedar desfasado entre actualizaciones del registro. Merece la pena preguntar directamente por el proceso de admisión y por los plazos de solicitud de cada curso.',
  updated_at = NOW()
WHERE slug = 'la-casita-sevilla';

-- My nursery  [privado, NO adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'El domicilio de My nursery es la calle Pérez Hervás, 9, bajo izquierda, 41003 de Sevilla. Este centro privado se ocupa del primer ciclo de educación infantil y recibe a alumnado desde los 4 meses hasta los 3 años.\n\nAl no constar su adhesión al Programa de Ayuda a las Familias, las familias tratan la matrícula y la cuota directamente con el centro. En cambio, no hay constancia oficial de qué servicios presta ni de su horario concreto, dos aspectos que solo el centro puede aclarar.\n\nLos datos publicados provienen de fuentes abiertas y no han sido confirmados por el propio centro. Para cualquier detalle sobre matrícula, jornada o precios, la vía adecuada es el contacto con My nursery.',
  updated_at = NOW()
WHERE slug = 'my-nursery-sevilla';

-- Yurumi  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Yurumi es un centro educativo privado que trabaja en la calle Gaspar de Alvear, 2 y 4, local, dentro del 41009 sevillano, con pequeños de 4 meses a 3 años.\n\nEl centro está integrado en el Programa de Ayuda a las Familias, la fórmula con la que la administración andaluza subvenciona parte del coste de estas plazas. La misma fuente no detalla los servicios complementarios —aula matinal, comedor o taller de juego—, que conviene preguntar antes de solicitar plaza.\n\nToda la información de esta ficha procede de registros administrativos de acceso público, que no siempre reflejan los cambios recientes. Solicitar información al propio centro es la forma más rápida de conocer vacantes, horarios y cuotas de este curso.',
  updated_at = NOW()
WHERE slug = 'yurumi-sevilla';

-- La Casita de Chocolate  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'A la altura de la avenida La Calesera, 33, puertas 24 y 25, en el 41006 de Sevilla, se ubica La Casita de Chocolate, una escuela infantil de primer ciclo de titularidad privada para niños a partir de los 4 meses y hasta los 3 años.\n\nLa Junta de Andalucía lo recoge como centro adherido al Programa de Ayuda a las Familias, la vía habitual de bonificación del coste de la escolarización 0-3 en la comunidad. En esta etapa la incorporación se hace de forma progresiva y cada centro la organiza a su modo; el registro consultado no precisa cómo lo hace este.\n\nConviene tomar estos datos como punto de partida, ya que proceden de un registro público que se actualiza periódicamente. Ponerse en contacto con La Casita de Chocolate es el paso lógico para resolver dudas sobre admisión, horarios y coste.',
  updated_at = NOW()
WHERE slug = 'la-casita-de-chocolate-sevilla';

-- La Mía  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'La Mía, una guardería privada de Sevilla, tiene su local en la calle Luis Ortiz Muñoz, conjunto 1, bloque 2, en la barriada Martínez Montañés (41013) y atiende a niñas y niños de los 4 a los 36 meses.\n\nParticipa en el Programa de Ayuda a las Familias, por lo que las familias pueden solicitar la ayuda autonómica que rebaja el precio del servicio de atención socioeducativa. Más allá de esos datos administrativos, el funcionamiento concreto —horarios, comidas, adaptación— no está documentado en fuentes públicas.\n\nSe trata de información de origen administrativo, útil para situar el centro pero insuficiente para conocerlo a fondo. Una consulta directa aclarará plazas, horarios y condiciones económicas mejor que cualquier listado.',
  updated_at = NOW()
WHERE slug = 'la-mia-sevilla';

-- La Locomotora  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'El registro de centros de primer ciclo de Andalucía incluye a La Locomotora, una escuela de educación infantil privada con sede en la calle Urbano Orad, 9, 41020 de Sevilla, para bebés y niños desde los cuatro meses hasta los tres años.\n\nForma parte del conjunto de centros adheridos al Programa de Ayuda a las Familias, lo que abre la puerta a la bonificación autonómica de la mensualidad. Tampoco constan los servicios que ofrece ni cómo distribuye los grupos por edades, información que suele facilitar el propio centro al pedir cita.\n\nEsta ficha reúne datos públicos y no incorpora valoraciones ni opiniones sobre el centro. Antes de dar cualquier paso, conviene contactar con La Locomotora y confirmar plazas, calendario y condiciones económicas.',
  updated_at = NOW()
WHERE slug = 'la-locomotora-sevilla';

-- Los Diminutos 2  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Los Diminutos 2 está inscrito como una escuela de educación infantil de primer ciclo de titularidad privada y trabaja en la avenida Sánchez Pizjuán, 21, local 1, 41009 de Sevilla, con alumnado entre los 4 meses y los 3 años.\n\nEntre los datos oficiales figura su adhesión al Programa de Ayuda a las Familias, que permite pedir la bonificación del precio de la atención socioeducativa. Nada más se recoge en la fuente oficial, ni horarios ni servicios, así que esta descripción se limita a los datos verificables.\n\nNada de lo anterior sustituye a la información que facilite el propio centro: son datos administrativos, sin más. Para comparar con otras opciones de la zona, pide al centro los datos concretos de horario, servicios y cuota.',
  updated_at = NOW()
WHERE slug = 'los-diminutos-2-sevilla';

-- Mamá Canguro II  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'En la calle Aragón, 120, local, código postal 41006 de Sevilla, Mamá Canguro II ofrece plazas de primer ciclo de educación infantil. Es una guardería de primer ciclo de titularidad privada dirigida a pequeños desde los 4 meses hasta los 3 años.\n\nSu adhesión al Programa de Ayuda a las Familias implica que el precio de la plaza está sujeto a las bonificaciones que fija cada curso la Junta de Andalucía. El detalle de servicios no consta: en Andalucía, el comedor, el aula matinal y el taller de juego son servicios complementarios que se solicitan junto con la plaza.\n\nEl origen de estos datos es el listado oficial de centros de primer ciclo con alumnado matriculado, de modo que puede estar incompleto. Antes de decidir, pregunta al centro por el periodo de adaptación, el horario y las cuotas vigentes.',
  updated_at = NOW()
WHERE slug = 'mama-canguro-ii-sevilla';

-- Tico Tico  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Tico Tico es un centro de educación infantil de primer ciclo de titularidad privada, situado en la calle Estrella Altair, 2, local 6, dentro del código postal 41015 de Sevilla. Trabaja con niños de 4 meses a 3 años.\n\nSegún el registro autonómico está adherido al Programa de Ayuda a las Familias, de forma que el importe a pagar depende de la bonificación reconocida a cada familia. Los listados oficiales tampoco recogen el proyecto educativo, un elemento que suele pesar bastante en la elección de escuela infantil.\n\nLos datos anteriores están tomados de fuentes públicas y no reflejan necesariamente la situación actual del centro. Si estás valorando esta opción, pide información directamente al centro sobre disponibilidad, jornada y coste mensual.',
  updated_at = NOW()
WHERE slug = 'tico-tico-sevilla';

-- Snoopy 8  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'En la calle San Roque, 6 y 8, en el 41001 de Sevilla, desarrolla su actividad Snoopy 8, un centro de educación infantil privado orientado a niñas y niños a partir de los 4 meses y hasta los 3 años.\n\nTrabaja dentro del Programa de Ayuda a las Familias, el marco autonómico que abarata la plaza de primer ciclo a las familias que cumplen los requisitos. No se han confirmado servicios concretos en fuente oficial, por lo que esta ficha no los enumera.\n\nLa información mostrada tiene carácter orientativo y procede de registros públicos. La disponibilidad de plaza, el horario real y el precio final conviene confirmarlos con el centro antes de solicitar.',
  updated_at = NOW()
WHERE slug = 'snoopy-8-sevilla';

-- Smile Recaredo  [privado, NO adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Smile Recaredo ocupa un espacio en la calle Recaredo, 2 (41003, Sevilla). Es un centro educativo de la etapa 0-3 de gestión privada y atiende a bebés y niños de los 4 a los 36 meses.\n\nLa fuente oficial no lo recoge como centro adherido al Programa de Ayuda a las Familias; el coste de la plaza, por tanto, se fija sin bonificación autonómica. Falta información oficial sobre comedor, aula matinal y horarios, que en esta etapa varían mucho de una escuela a otra.\n\nEsta descripción se ha elaborado únicamente a partir de datos públicos, sin material promocional del centro. Contactar con el centro permite confirmar si quedan plazas y qué servicios ofrece realmente este curso.',
  updated_at = NOW()
WHERE slug = 'smile-recaredo-sevilla';

-- El Sabio 2  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'La sede de El Sabio 2 está en la avenida de Bellavista, 43, en la zona del código postal 41014 de Sevilla. Se trata de un centro de primer ciclo de educación infantil de titularidad privada para alumnado desde los cuatro meses hasta los tres años.\n\nSu condición de centro adherido al Programa de Ayuda a las Familias da acceso a las ayudas que la Junta destina a las plazas de 0 a 3 años. La información pública se detiene ahí: ni el horario de apertura ni los servicios figuran en el registro, de modo que hay que consultarlos al centro.\n\nAl proceder de un listado oficial, esta información no incluye ni el proyecto educativo ni las condiciones concretas de cada curso. Una llamada al centro despeja en pocos minutos las dudas sobre plazas, horarios y precios.',
  updated_at = NOW()
WHERE slug = 'el-sabio-2-sevilla';

-- Full Moon  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Full Moon, una escuela infantil de primer ciclo de titularidad privada, abre sus puertas en la calle Valladares, 4 y 6 (41010, Sevilla) y acoge a pequeños entre los 4 meses y los 3 años.\n\nSu ficha en el registro lo señala como centro adherido al Programa de Ayuda a las Familias, de modo que la cuota puede bonificarse conforme a la normativa andaluza. Sobre el funcionamiento diario no hay datos oficiales; en el primer ciclo la jornada se organiza en torno a rutinas de alimentación, descanso y juego, y cada escuela fija las suyas.\n\nEsta ficha recoge lo que consta en fuentes públicas; el centro puede aportar más detalle o solicitar su actualización. Concertar una visita permite ver las instalaciones y preguntar por matrícula, horarios y bonificaciones.',
  updated_at = NOW()
WHERE slug = 'full-moon-sevilla';

-- Petits 2  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Con sede en la calle Juan Rabadán, s/n, plaza del Bajondillo, locales 1 a 4, en el 41002 sevillano, Petits 2 es una guardería privada que escolariza a niños desde los 4 meses hasta los 3 años.\n\nEstá acogido al Programa de Ayuda a las Familias, con lo que parte de la cuota mensual puede quedar bonificada en función de los criterios de la convocatoria vigente. No aparecen servicios confirmados en la fuente consultada, algo frecuente en los listados administrativos y que no significa que el centro no los ofrezca.\n\nLo que aparece aquí se apoya en datos abiertos de la administración educativa andaluza y puede haber variado desde la última actualización. Las familias interesadas pueden dirigirse al centro para conocer vacantes, horario de apertura y tarifas.',
  updated_at = NOW()
WHERE slug = 'petits-2-sevilla';

-- Ciempiés  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Ciempiés atiende el primer ciclo de educación infantil en la calle Alcalde Isacio Contreras, 9, local, código postal 41003 de Sevilla. De titularidad privada, recibe a niñas y niños de 4 meses a 3 años.\n\nConsta acogido al Programa de Ayuda a las Familias, el sistema con el que la Junta de Andalucía bonifica parte del coste de la plaza en la etapa 0-3. El registro no baja al detalle del día a día: comedor, ampliación de horario o periodo de adaptación quedan fuera de la información publicada.\n\nEl contenido de esta ficha se basa en fuentes públicas y puede quedar desfasado entre actualizaciones del registro. Para saber si hay plaza libre, en qué horario y con qué cuota, lo mejor es hablar con el equipo del centro.',
  updated_at = NOW()
WHERE slug = 'ciempies-sevilla';

-- Solyluna  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Con dirección en la calle Manuel Ramón Alarcón, 16 (41007), Solyluna presta servicio en Sevilla como una escuela de primer ciclo privada, con plazas para bebés y niños a partir de los 4 meses y hasta los 3 años.\n\nConsta la adhesión al Programa de Ayuda a las Familias: las familias pueden pedir la bonificación del precio de la plaza en los plazos que marca cada convocatoria. En cambio, no hay constancia oficial de qué servicios presta ni de su horario concreto, dos aspectos que solo el centro puede aclarar.\n\nLos datos publicados provienen de fuentes abiertas y no han sido confirmados por el propio centro. Escribir o llamar permite preguntar por las plazas disponibles y por cómo se organiza la jornada.',
  updated_at = NOW()
WHERE slug = 'solyluna-sevilla';

-- Peter Pan  [privado, NO adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Peter Pan es una guardería privada de la ciudad de Sevilla. Su local está en la avenida de Grecia, s/n, en el 41012, y su actividad se dirige a alumnado de los 4 a los 36 meses.\n\nLa documentación pública no lo sitúa entre los centros adheridos al Programa de Ayuda a las Familias, así que las cuotas responden a su propio criterio. La misma fuente no detalla los servicios complementarios —aula matinal, comedor o taller de juego—, que conviene preguntar antes de solicitar plaza.\n\nToda la información de esta ficha procede de registros administrativos de acceso público, que no siempre reflejan los cambios recientes. Merece la pena preguntar directamente por el proceso de admisión y por los plazos de solicitud de cada curso.',
  updated_at = NOW()
WHERE slug = 'peter-pan-sevilla';

-- Mari Carmen  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'En la calle Elda, 1, local 16, en Parque Alcosa (41019, Sevilla) encontramos Mari Carmen, un centro infantil de carácter privado dedicado a pequeños desde los cuatro meses hasta los tres años.\n\nEl registro andaluz lo incluye entre los centros adheridos al Programa de Ayuda a las Familias, de manera que la mensualidad puede reducirse según la bonificación que corresponda a cada unidad familiar. En esta etapa la incorporación se hace de forma progresiva y cada centro la organiza a su modo; el registro consultado no precisa cómo lo hace este.\n\nConviene tomar estos datos como punto de partida, ya que proceden de un registro público que se actualiza periódicamente. Para cualquier detalle sobre matrícula, jornada o precios, la vía adecuada es el contacto con Mari Carmen.',
  updated_at = NOW()
WHERE slug = 'mari-carmen-sevilla';

-- Caramelo  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Caramelo figura en el registro andaluz de centros de primer ciclo como un centro de educación infantil privado. Está en la calle Profesor Manuel Clavero Arévalo, MC 2.2, locales K y L, 41019 de Sevilla, y atiende a niños entre los 4 meses y los 3 años.\n\nEl centro está integrado en el Programa de Ayuda a las Familias, la fórmula con la que la administración andaluza subvenciona parte del coste de estas plazas. Más allá de esos datos administrativos, el funcionamiento concreto —horarios, comidas, adaptación— no está documentado en fuentes públicas.\n\nSe trata de información de origen administrativo, útil para situar el centro pero insuficiente para conocerlo a fondo. Solicitar información al propio centro es la forma más rápida de conocer vacantes, horarios y cuotas de este curso.',
  updated_at = NOW()
WHERE slug = 'caramelo-sevilla';

-- El Nido de la Palmera  [privado, NO adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Dentro del 41013 de Sevilla, en la carretera de Su Eminencia, 2-B, trabaja El Nido de la Palmera, un centro educativo de la etapa 0-3 de titularidad privada con niñas y niños desde los 4 meses hasta los 3 años.\n\nNo figura entre los centros acogidos al Programa de Ayuda a las Familias, así que tanto la admisión como el precio dependen directamente de su dirección. Tampoco constan los servicios que ofrece ni cómo distribuye los grupos por edades, información que suele facilitar el propio centro al pedir cita.\n\nEsta ficha reúne datos públicos y no incorpora valoraciones ni opiniones sobre el centro. Ponerse en contacto con El Nido de la Palmera es el paso lógico para resolver dudas sobre admisión, horarios y coste.',
  updated_at = NOW()
WHERE slug = 'el-nido-de-la-palmera-sevilla';

-- Schola Snoopy  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Schola Snoopy forma parte de la oferta de primer ciclo de Sevilla. Es un centro de primer ciclo de educación infantil de titularidad privada, con sede en la calle Antonio Maura Montaner, s/n, planta baja, en el recinto de los Hospitales Universitarios Virgen del Rocío (41013), y atiende a bebés y niños de 4 meses a 3 años.\n\nParticipa en el Programa de Ayuda a las Familias, por lo que las familias pueden solicitar la ayuda autonómica que rebaja el precio del servicio de atención socioeducativa. Nada más se recoge en la fuente oficial, ni horarios ni servicios, así que esta descripción se limita a los datos verificables.\n\nNada de lo anterior sustituye a la información que facilite el propio centro: son datos administrativos, sin más. Una consulta directa aclarará plazas, horarios y condiciones económicas mejor que cualquier listado.',
  updated_at = NOW()
WHERE slug = 'schola-snoopy-sevilla';

-- Mundo Mágico  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'La actividad de Mundo Mágico se desarrolla en la avenida Ildefonso Marañón Lavín, 21, acceso A, en el distrito postal 41019 de Sevilla. Es una escuela infantil privada para alumnado a partir de los 4 meses y hasta los 3 años.\n\nForma parte del conjunto de centros adheridos al Programa de Ayuda a las Familias, lo que abre la puerta a la bonificación autonómica de la mensualidad. El detalle de servicios no consta: en Andalucía, el comedor, el aula matinal y el taller de juego son servicios complementarios que se solicitan junto con la plaza.\n\nEl origen de estos datos es el listado oficial de centros de primer ciclo con alumnado matriculado, de modo que puede estar incompleto. Antes de dar cualquier paso, conviene contactar con Mundo Mágico y confirmar plazas, calendario y condiciones económicas.',
  updated_at = NOW()
WHERE slug = 'mundo-magico-sevilla';

-- Edumundi School  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Edumundi School es una guardería dedicada al tramo de 0 a 3 años de titularidad privada que atiende a pequeños de los 4 a los 36 meses en la calle Pakistán, s/n, esquina con la calle Bombay (sector 15, polígono Aeropuerto), 41020, Sevilla.\n\nEntre los datos oficiales figura su adhesión al Programa de Ayuda a las Familias, que permite pedir la bonificación del precio de la atención socioeducativa. Los listados oficiales tampoco recogen el proyecto educativo, un elemento que suele pesar bastante en la elección de escuela infantil.\n\nLos datos anteriores están tomados de fuentes públicas y no reflejan necesariamente la situación actual del centro. Para comparar con otras opciones de la zona, pide al centro los datos concretos de horario, servicios y cuota.',
  updated_at = NOW()
WHERE slug = 'edumundi-school-sevilla';

-- Nulú  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'En el 41006 de Sevilla, concretamente en la calle Voltio, 2, local 2, se encuentra Nulú, una escuela de educación infantil privada con alumnado desde los cuatro meses hasta los tres años.\n\nSu adhesión al Programa de Ayuda a las Familias implica que el precio de la plaza está sujeto a las bonificaciones que fija cada curso la Junta de Andalucía. No se han confirmado servicios concretos en fuente oficial, por lo que esta ficha no los enumera.\n\nLa información mostrada tiene carácter orientativo y procede de registros públicos. Antes de decidir, pregunta al centro por el periodo de adaptación, el horario y las cuotas vigentes.',
  updated_at = NOW()
WHERE slug = 'nulu-sevilla';

-- Smile Ronda Histórica  [privado, NO adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Smile Ronda Histórica desarrolla su labor educativa con niñas y niños entre los 4 meses y los 3 años en la calle San Alonso de Orozco, 3, en el 41003 de Sevilla. Su titularidad es privada.\n\nEn el listado autonómico no aparece con adhesión al Programa de Ayuda a las Familias, por lo que la solicitud de plaza se gestiona en el propio centro. Falta información oficial sobre comedor, aula matinal y horarios, que en esta etapa varían mucho de una escuela a otra.\n\nEsta descripción se ha elaborado únicamente a partir de datos públicos, sin material promocional del centro. Si estás valorando esta opción, pide información directamente al centro sobre disponibilidad, jornada y coste mensual.',
  updated_at = NOW()
WHERE slug = 'smile-ronda-historica-sevilla';

-- La Ludopeque  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Una guardería de primer ciclo de titularidad privada: así consta La Ludopeque en el registro autonómico. Está en la carretera de la Esclusa, edificio Galia Puerto, local 9, en el entorno del Puerto de Sevilla (41011, Sevilla) y trabaja con bebés y niños desde los 4 meses hasta los 3 años.\n\nTrabaja dentro del Programa de Ayuda a las Familias, el marco autonómico que abarata la plaza de primer ciclo a las familias que cumplen los requisitos. La información pública se detiene ahí: ni el horario de apertura ni los servicios figuran en el registro, de modo que hay que consultarlos al centro.\n\nAl proceder de un listado oficial, esta información no incluye ni el proyecto educativo ni las condiciones concretas de cada curso. La disponibilidad de plaza, el horario real y el precio final conviene confirmarlos con el centro antes de solicitar.',
  updated_at = NOW()
WHERE slug = 'la-ludopeque-sevilla';

-- La Casita II  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'La Casita II tiene su sede en la avenida del Deporte, s/n, en el Nuevo Mercado de Sevilla Este, en el 41020 de Sevilla, y funciona como un centro infantil privado para alumnado de 4 meses a 3 años.\n\nAparece entre los centros adheridos al Programa de Ayuda a las Familias; la admisión suele canalizarse por el procedimiento anual que convoca la administración educativa andaluza. Sobre el funcionamiento diario no hay datos oficiales; en el primer ciclo la jornada se organiza en torno a rutinas de alimentación, descanso y juego, y cada escuela fija las suyas.\n\nEsta ficha recoge lo que consta en fuentes públicas; el centro puede aportar más detalle o solicitar su actualización. Contactar con el centro permite confirmar si quedan plazas y qué servicios ofrece realmente este curso.',
  updated_at = NOW()
WHERE slug = 'la-casita-ii-sevilla';

-- Los Girasoles  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Entre los centros de primer ciclo de Sevilla se encuentra Los Girasoles, un centro de educación infantil privado instalado en la barriada Núcleo Residencial Virgen de Gracia, 11, bajo (locales A, C y D), en el 41008, que atiende a pequeños a partir de los 4 meses y hasta los 3 años.\n\nSu condición de centro adherido al Programa de Ayuda a las Familias da acceso a las ayudas que la Junta destina a las plazas de 0 a 3 años. No aparecen servicios confirmados en la fuente consultada, algo frecuente en los listados administrativos y que no significa que el centro no los ofrezca.\n\nLo que aparece aquí se apoya en datos abiertos de la administración educativa andaluza y puede haber variado desde la última actualización. Una llamada al centro despeja en pocos minutos las dudas sobre plazas, horarios y precios.',
  updated_at = NOW()
WHERE slug = 'los-girasoles-sevilla';

-- Creciendo Felices  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Creciendo Felices es un centro de primer ciclo privado. Su dirección, la calle Camino de los Descubrimientos, s/n, en el Pabellón de España, corresponde al código postal 41092 de Sevilla, y su oferta se dirige a niños de los 4 a los 36 meses.\n\nSu ficha en el registro lo señala como centro adherido al Programa de Ayuda a las Familias, de modo que la cuota puede bonificarse conforme a la normativa andaluza. El registro no baja al detalle del día a día: comedor, ampliación de horario o periodo de adaptación quedan fuera de la información publicada.\n\nEl contenido de esta ficha se basa en fuentes públicas y puede quedar desfasado entre actualizaciones del registro. Concertar una visita permite ver las instalaciones y preguntar por matrícula, horarios y bonificaciones.',
  updated_at = NOW()
WHERE slug = 'creciendo-felices-sevilla';

-- Mary Poppins 2  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'En la avenida Cardenal Bueno Monreal, 32, acceso B, 41013 de Sevilla, Mary Poppins 2 cubre el tramo anterior al aula de 3 años como un centro de primer ciclo de educación infantil de titularidad privada, con niñas y niños desde los cuatro meses hasta los tres años.\n\nEstá acogido al Programa de Ayuda a las Familias, con lo que parte de la cuota mensual puede quedar bonificada en función de los criterios de la convocatoria vigente. En cambio, no hay constancia oficial de qué servicios presta ni de su horario concreto, dos aspectos que solo el centro puede aclarar.\n\nLos datos publicados provienen de fuentes abiertas y no han sido confirmados por el propio centro. Las familias interesadas pueden dirigirse al centro para conocer vacantes, horario de apertura y tarifas.',
  updated_at = NOW()
WHERE slug = 'mary-poppins-2-sevilla';

-- Pompitas  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Pompitas pertenece al grupo de escuelas privadas de primer ciclo de Sevilla. Ocupa un local en la plaza Pedro Santos Gómez, 9, local 15, en el 41010, y admite a bebés y niños entre los 4 meses y los 3 años.\n\nConsta acogido al Programa de Ayuda a las Familias, el sistema con el que la Junta de Andalucía bonifica parte del coste de la plaza en la etapa 0-3. La misma fuente no detalla los servicios complementarios —aula matinal, comedor o taller de juego—, que conviene preguntar antes de solicitar plaza.\n\nToda la información de esta ficha procede de registros administrativos de acceso público, que no siempre reflejan los cambios recientes. Para saber si hay plaza libre, en qué horario y con qué cuota, lo mejor es hablar con el equipo del centro.',
  updated_at = NOW()
WHERE slug = 'pompitas-sevilla';

-- La Jirafa  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'El domicilio de La Jirafa es la calle Cortegana, 18, 41006 de Sevilla. Este centro privado se ocupa del primer ciclo de educación infantil y recibe a alumnado desde los 4 meses hasta los 3 años.\n\nConsta la adhesión al Programa de Ayuda a las Familias: las familias pueden pedir la bonificación del precio de la plaza en los plazos que marca cada convocatoria. En esta etapa la incorporación se hace de forma progresiva y cada centro la organiza a su modo; el registro consultado no precisa cómo lo hace este.\n\nConviene tomar estos datos como punto de partida, ya que proceden de un registro público que se actualiza periódicamente. Escribir o llamar permite preguntar por las plazas disponibles y por cómo se organiza la jornada.',
  updated_at = NOW()
WHERE slug = 'la-jirafa-sevilla';

-- El Nido de los Perdigones  [privado, NO adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'El Nido de los Perdigones es una escuela de educación infantil privada que trabaja en la calle Perafán de Ribera, s/n, dentro del 41009 sevillano, con pequeños de 4 meses a 3 años.\n\nEl registro de la Junta de Andalucía no lo incluye entre los centros adheridos al Programa de Ayuda a las Familias, un dato a tener en cuenta al comparar precios. Más allá de esos datos administrativos, el funcionamiento concreto —horarios, comidas, adaptación— no está documentado en fuentes públicas.\n\nSe trata de información de origen administrativo, útil para situar el centro pero insuficiente para conocerlo a fondo. Merece la pena preguntar directamente por el proceso de admisión y por los plazos de solicitud de cada curso.',
  updated_at = NOW()
WHERE slug = 'el-nido-de-los-perdigones-sevilla';

-- Estrella Polar  [privado, NO adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'A la altura de la avenida García Morato, s/n, en la Factoría de Tablada, en el 41011 de Sevilla, se ubica Estrella Polar, una escuela de educación infantil de primer ciclo de titularidad privada para niños a partir de los 4 meses y hasta los 3 años.\n\nNo consta acogido al Programa de Ayuda a las Familias, de manera que su tarifa es privada y no está sujeta a la bonificación autonómica. Tampoco constan los servicios que ofrece ni cómo distribuye los grupos por edades, información que suele facilitar el propio centro al pedir cita.\n\nEsta ficha reúne datos públicos y no incorpora valoraciones ni opiniones sobre el centro. Para cualquier detalle sobre matrícula, jornada o precios, la vía adecuada es el contacto con Estrella Polar.',
  updated_at = NOW()
WHERE slug = 'estrella-polar-sevilla';

-- Princesa del Olimpo  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Princesa del Olimpo, una guardería privada de Sevilla, tiene su local en la calle Parque de la Toconera, 4, en la urbanización Jardines de Atenea (41014) y atiende a niñas y niños de los 4 a los 36 meses.\n\nEl centro está integrado en el Programa de Ayuda a las Familias, la fórmula con la que la administración andaluza subvenciona parte del coste de estas plazas. Nada más se recoge en la fuente oficial, ni horarios ni servicios, así que esta descripción se limita a los datos verificables.\n\nNada de lo anterior sustituye a la información que facilite el propio centro: son datos administrativos, sin más. Solicitar información al propio centro es la forma más rápida de conocer vacantes, horarios y cuotas de este curso.',
  updated_at = NOW()
WHERE slug = 'princesa-del-olimpo-sevilla';

-- Pinocho y su Amigo  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'El registro de centros de primer ciclo de Andalucía incluye a Pinocho y su Amigo, un centro infantil privado con sede en la plaza del Giraldillo, locales 15, 16A y 16B, 41003 de Sevilla, para bebés y niños desde los cuatro meses hasta los tres años.\n\nLa Junta de Andalucía lo recoge como centro adherido al Programa de Ayuda a las Familias, la vía habitual de bonificación del coste de la escolarización 0-3 en la comunidad. El detalle de servicios no consta: en Andalucía, el comedor, el aula matinal y el taller de juego son servicios complementarios que se solicitan junto con la plaza.\n\nEl origen de estos datos es el listado oficial de centros de primer ciclo con alumnado matriculado, de modo que puede estar incompleto. Ponerse en contacto con Pinocho y su Amigo es el paso lógico para resolver dudas sobre admisión, horarios y coste.',
  updated_at = NOW()
WHERE slug = 'pinocho-y-su-amigo-sevilla';

-- Puppy's  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Puppy''s está inscrito como un centro dedicado al primer ciclo de educación infantil de titularidad privada y trabaja en la calle Luxemburgo, locales 8C y 9C, 41012 de Sevilla, con alumnado entre los 4 meses y los 3 años.\n\nParticipa en el Programa de Ayuda a las Familias, por lo que las familias pueden solicitar la ayuda autonómica que rebaja el precio del servicio de atención socioeducativa. Los listados oficiales tampoco recogen el proyecto educativo, un elemento que suele pesar bastante en la elección de escuela infantil.\n\nLos datos anteriores están tomados de fuentes públicas y no reflejan necesariamente la situación actual del centro. Una consulta directa aclarará plazas, horarios y condiciones económicas mejor que cualquier listado.',
  updated_at = NOW()
WHERE slug = 'puppy-s-sevilla';

-- Pequeños artistas  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'En la calle Diego de Merlo, 8, código postal 41003 de Sevilla, Pequeños artistas ofrece plazas de primer ciclo de educación infantil. Es un centro educativo de la etapa 0-3 de titularidad privada dirigido a pequeños desde los 4 meses hasta los 3 años.\n\nForma parte del conjunto de centros adheridos al Programa de Ayuda a las Familias, lo que abre la puerta a la bonificación autonómica de la mensualidad. No se han confirmado servicios concretos en fuente oficial, por lo que esta ficha no los enumera.\n\nLa información mostrada tiene carácter orientativo y procede de registros públicos. Antes de dar cualquier paso, conviene contactar con Pequeños artistas y confirmar plazas, calendario y condiciones económicas.',
  updated_at = NOW()
WHERE slug = 'pequenos-artistas-sevilla';

-- Valle de la ternura  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Valle de la ternura es un centro de primer ciclo de educación infantil de titularidad privada, situado en la calle Donantes de Sangre, 14, acceso D, dentro del código postal 41020 de Sevilla. Trabaja con niños de 4 meses a 3 años.\n\nEntre los datos oficiales figura su adhesión al Programa de Ayuda a las Familias, que permite pedir la bonificación del precio de la atención socioeducativa. Falta información oficial sobre comedor, aula matinal y horarios, que en esta etapa varían mucho de una escuela a otra.\n\nEsta descripción se ha elaborado únicamente a partir de datos públicos, sin material promocional del centro. Para comparar con otras opciones de la zona, pide al centro los datos concretos de horario, servicios y cuota.',
  updated_at = NOW()
WHERE slug = 'valle-de-la-ternura-sevilla';

-- El nido del paraguas  [privado, NO adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'En la calle Presidente Cárdenas, s/n, en el 41013 de Sevilla, desarrolla su actividad El nido del paraguas, una escuela infantil privada orientada a niñas y niños a partir de los 4 meses y hasta los 3 años.\n\nNo figura entre los centros acogidos al Programa de Ayuda a las Familias, así que tanto la admisión como el precio dependen directamente de su dirección. La información pública se detiene ahí: ni el horario de apertura ni los servicios figuran en el registro, de modo que hay que consultarlos al centro.\n\nAl proceder de un listado oficial, esta información no incluye ni el proyecto educativo ni las condiciones concretas de cada curso. Antes de decidir, pregunta al centro por el periodo de adaptación, el horario y las cuotas vigentes.',
  updated_at = NOW()
WHERE slug = 'el-nido-del-paraguas-sevilla';

-- Nulú 2  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Nulú 2 ocupa un espacio en la urbanización Los Príncipes, parcela 5, bloque 3, locales 1 y 2 (41008, Sevilla). Es una guardería dedicada al tramo de 0 a 3 años de gestión privada y atiende a bebés y niños de los 4 a los 36 meses.\n\nSegún el registro autonómico está adherido al Programa de Ayuda a las Familias, de forma que el importe a pagar depende de la bonificación reconocida a cada familia. Sobre el funcionamiento diario no hay datos oficiales; en el primer ciclo la jornada se organiza en torno a rutinas de alimentación, descanso y juego, y cada escuela fija las suyas.\n\nEsta ficha recoge lo que consta en fuentes públicas; el centro puede aportar más detalle o solicitar su actualización. Si estás valorando esta opción, pide información directamente al centro sobre disponibilidad, jornada y coste mensual.',
  updated_at = NOW()
WHERE slug = 'nulu-2-sevilla';

-- Lucero  [privado, NO adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'La sede de Lucero está en la carretera A-8010, kilómetro 4, en la Factoría de San Pablo Sur, en la zona del código postal 41020 de Sevilla. Se trata de una escuela dedicada al primer ciclo de educación infantil de titularidad privada para alumnado desde los cuatro meses hasta los tres años.\n\nAl no constar su adhesión al Programa de Ayuda a las Familias, las familias tratan la matrícula y la cuota directamente con el centro. No aparecen servicios confirmados en la fuente consultada, algo frecuente en los listados administrativos y que no significa que el centro no los ofrezca.\n\nLo que aparece aquí se apoya en datos abiertos de la administración educativa andaluza y puede haber variado desde la última actualización. La disponibilidad de plaza, el horario real y el precio final conviene confirmarlos con el centro antes de solicitar.',
  updated_at = NOW()
WHERE slug = 'lucero-sevilla';

-- Con-Sentidos  [privado, NO adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Con-Sentidos, una escuela de educación infantil de primer ciclo de titularidad privada, abre sus puertas en la calle Virgen de las Montañas, 18 (41011, Sevilla) y acoge a pequeños entre los 4 meses y los 3 años.\n\nEl registro de la Junta de Andalucía no lo incluye entre los centros adheridos al Programa de Ayuda a las Familias, un dato a tener en cuenta al comparar precios. El registro no baja al detalle del día a día: comedor, ampliación de horario o periodo de adaptación quedan fuera de la información publicada.\n\nEl contenido de esta ficha se basa en fuentes públicas y puede quedar desfasado entre actualizaciones del registro. Contactar con el centro permite confirmar si quedan plazas y qué servicios ofrece realmente este curso.',
  updated_at = NOW()
WHERE slug = 'con-sentidos-sevilla';

-- Petit  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Con sede en la calle Nufro Sánchez, 4, en el 41008 sevillano, Petit es una guardería privada que escolariza a niños desde los 4 meses hasta los 3 años.\n\nSu condición de centro adherido al Programa de Ayuda a las Familias da acceso a las ayudas que la Junta destina a las plazas de 0 a 3 años. En cambio, no hay constancia oficial de qué servicios presta ni de su horario concreto, dos aspectos que solo el centro puede aclarar.\n\nLos datos publicados provienen de fuentes abiertas y no han sido confirmados por el propio centro. Una llamada al centro despeja en pocos minutos las dudas sobre plazas, horarios y precios.',
  updated_at = NOW()
WHERE slug = 'petit-sevilla';

-- Mil Sonrisas  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Mil Sonrisas atiende el primer ciclo de educación infantil en la calle Dinastía Músicos Palatín, 7, local 5, código postal 41008 de Sevilla. De titularidad privada, recibe a niñas y niños de 4 meses a 3 años.\n\nSu ficha en el registro lo señala como centro adherido al Programa de Ayuda a las Familias, de modo que la cuota puede bonificarse conforme a la normativa andaluza. La misma fuente no detalla los servicios complementarios —aula matinal, comedor o taller de juego—, que conviene preguntar antes de solicitar plaza.\n\nToda la información de esta ficha procede de registros administrativos de acceso público, que no siempre reflejan los cambios recientes. Concertar una visita permite ver las instalaciones y preguntar por matrícula, horarios y bonificaciones.',
  updated_at = NOW()
WHERE slug = 'mil-sonrisas-sevilla';

-- Potitos Pío XII  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Con dirección en la avenida Ronda de Pío XII, 2, local 1E (41008), Potitos Pío XII presta servicio en Sevilla como un centro de educación infantil privado, con plazas para bebés y niños a partir de los 4 meses y hasta los 3 años.\n\nEstá acogido al Programa de Ayuda a las Familias, con lo que parte de la cuota mensual puede quedar bonificada en función de los criterios de la convocatoria vigente. En esta etapa la incorporación se hace de forma progresiva y cada centro la organiza a su modo; el registro consultado no precisa cómo lo hace este.\n\nConviene tomar estos datos como punto de partida, ya que proceden de un registro público que se actualiza periódicamente. Las familias interesadas pueden dirigirse al centro para conocer vacantes, horario de apertura y tarifas.',
  updated_at = NOW()
WHERE slug = 'potitos-pio-xii-sevilla';

-- Edumundi School II  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Edumundi School II es un centro de primer ciclo privado de la ciudad de Sevilla. Su local está en la calle Bombay, 1, en el 41020, y su actividad se dirige a alumnado de los 4 a los 36 meses.\n\nConsta acogido al Programa de Ayuda a las Familias, el sistema con el que la Junta de Andalucía bonifica parte del coste de la plaza en la etapa 0-3. Más allá de esos datos administrativos, el funcionamiento concreto —horarios, comidas, adaptación— no está documentado en fuentes públicas.\n\nSe trata de información de origen administrativo, útil para situar el centro pero insuficiente para conocerlo a fondo. Para saber si hay plaza libre, en qué horario y con qué cuota, lo mejor es hablar con el equipo del centro.',
  updated_at = NOW()
WHERE slug = 'edumundi-school-ii-sevilla';

-- La Providencia  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'En la calle José Sebastián Bandarán, s/n (41013, Sevilla) encontramos La Providencia, un centro educativo de carácter privado dedicado a pequeños desde los cuatro meses hasta los tres años.\n\nConsta la adhesión al Programa de Ayuda a las Familias: las familias pueden pedir la bonificación del precio de la plaza en los plazos que marca cada convocatoria. Tampoco constan los servicios que ofrece ni cómo distribuye los grupos por edades, información que suele facilitar el propio centro al pedir cita.\n\nEsta ficha reúne datos públicos y no incorpora valoraciones ni opiniones sobre el centro. Escribir o llamar permite preguntar por las plazas disponibles y por cómo se organiza la jornada.',
  updated_at = NOW()
WHERE slug = 'la-providencia-sevilla';

-- San Cayetano  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'San Cayetano figura en el registro andaluz de centros de primer ciclo como una escuela infantil privada. Está en la calle Duque Cornejo, s/n, 41003 de Sevilla, y atiende a niños entre los 4 meses y los 3 años.\n\nAl ser un centro adherido al Programa de Ayuda a las Familias, quienes obtienen plaza pueden beneficiarse de la bonificación autonómica del precio. Nada más se recoge en la fuente oficial, ni horarios ni servicios, así que esta descripción se limita a los datos verificables.\n\nNada de lo anterior sustituye a la información que facilite el propio centro: son datos administrativos, sin más. Merece la pena preguntar directamente por el proceso de admisión y por los plazos de solicitud de cada curso.',
  updated_at = NOW()
WHERE slug = 'san-cayetano-sevilla';

-- Pececitos  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Dentro del 41012 de Sevilla, en la calle Chipre, 7, local 4, edificio Prasa, trabaja Pececitos, una guardería dedicada al tramo de 0 a 3 años de titularidad privada con niñas y niños desde los 4 meses hasta los 3 años.\n\nEl registro andaluz lo incluye entre los centros adheridos al Programa de Ayuda a las Familias, de manera que la mensualidad puede reducirse según la bonificación que corresponda a cada unidad familiar. El detalle de servicios no consta: en Andalucía, el comedor, el aula matinal y el taller de juego son servicios complementarios que se solicitan junto con la plaza.\n\nEl origen de estos datos es el listado oficial de centros de primer ciclo con alumnado matriculado, de modo que puede estar incompleto. Para cualquier detalle sobre matrícula, jornada o precios, la vía adecuada es el contacto con Pececitos.',
  updated_at = NOW()
WHERE slug = 'pececitos-sevilla';

-- Pasitos  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Pasitos forma parte de la oferta de primer ciclo de Sevilla. Es una escuela dedicada al primer ciclo de educación infantil de titularidad privada, con sede en la calle Gonzalo Bilbao, 10-12, local 2 (41003), y atiende a bebés y niños de 4 meses a 3 años.\n\nEl centro está integrado en el Programa de Ayuda a las Familias, la fórmula con la que la administración andaluza subvenciona parte del coste de estas plazas. Los listados oficiales tampoco recogen el proyecto educativo, un elemento que suele pesar bastante en la elección de escuela infantil.\n\nLos datos anteriores están tomados de fuentes públicas y no reflejan necesariamente la situación actual del centro. Solicitar información al propio centro es la forma más rápida de conocer vacantes, horarios y cuotas de este curso.',
  updated_at = NOW()
WHERE slug = 'pasitos-sevilla';

-- Pequeño Reino  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'La actividad de Pequeño Reino se desarrolla en la calle Irlanda, 4, acceso E, en el distrito postal 41012 de Sevilla. Es una escuela de primer ciclo privada para alumnado a partir de los 4 meses y hasta los 3 años.\n\nLa Junta de Andalucía lo recoge como centro adherido al Programa de Ayuda a las Familias, la vía habitual de bonificación del coste de la escolarización 0-3 en la comunidad. No se han confirmado servicios concretos en fuente oficial, por lo que esta ficha no los enumera.\n\nLa información mostrada tiene carácter orientativo y procede de registros públicos. Ponerse en contacto con Pequeño Reino es el paso lógico para resolver dudas sobre admisión, horarios y coste.',
  updated_at = NOW()
WHERE slug = 'pequeno-reino-sevilla';

-- Mi Tata  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Mi Tata es una guardería de primer ciclo de titularidad privada que atiende a pequeños de los 4 a los 36 meses en la calle Profesor Manuel Clavero Arévalo, 3, locales K y L, 41020, Sevilla.\n\nParticipa en el Programa de Ayuda a las Familias, por lo que las familias pueden solicitar la ayuda autonómica que rebaja el precio del servicio de atención socioeducativa. Falta información oficial sobre comedor, aula matinal y horarios, que en esta etapa varían mucho de una escuela a otra.\n\nEsta descripción se ha elaborado únicamente a partir de datos públicos, sin material promocional del centro. Una consulta directa aclarará plazas, horarios y condiciones económicas mejor que cualquier listado.',
  updated_at = NOW()
WHERE slug = 'mi-tata-sevilla';

-- Luna Lunera  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'En el 41006 de Sevilla, concretamente en la calle Hornachuelos, 41-43, se encuentra Luna Lunera, un centro infantil privado con alumnado desde los cuatro meses hasta los tres años.\n\nForma parte del conjunto de centros adheridos al Programa de Ayuda a las Familias, lo que abre la puerta a la bonificación autonómica de la mensualidad. La información pública se detiene ahí: ni el horario de apertura ni los servicios figuran en el registro, de modo que hay que consultarlos al centro.\n\nAl proceder de un listado oficial, esta información no incluye ni el proyecto educativo ni las condiciones concretas de cada curso. Antes de dar cualquier paso, conviene contactar con Luna Lunera y confirmar plazas, calendario y condiciones económicas.',
  updated_at = NOW()
WHERE slug = 'luna-lunera-sevilla';

-- La Guarde del Árbol  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'La Guarde del Árbol desarrolla su labor educativa con niñas y niños entre los 4 meses y los 3 años en la calle Presidente Cárdenas, 6, local 7C, en el 41013 de Sevilla. Su titularidad es privada.\n\nEntre los datos oficiales figura su adhesión al Programa de Ayuda a las Familias, que permite pedir la bonificación del precio de la atención socioeducativa. Sobre el funcionamiento diario no hay datos oficiales; en el primer ciclo la jornada se organiza en torno a rutinas de alimentación, descanso y juego, y cada escuela fija las suyas.\n\nEsta ficha recoge lo que consta en fuentes públicas; el centro puede aportar más detalle o solicitar su actualización. Para comparar con otras opciones de la zona, pide al centro los datos concretos de horario, servicios y cuota.',
  updated_at = NOW()
WHERE slug = 'la-guarde-del-arbol-sevilla';

-- Mis Sueños  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Un centro educativo de la etapa 0-3 de titularidad privada: así consta Mis Sueños en el registro autonómico. Está en la calle Alonso Cano, 10 (41005, Sevilla) y trabaja con bebés y niños desde los 4 meses hasta los 3 años.\n\nSu adhesión al Programa de Ayuda a las Familias implica que el precio de la plaza está sujeto a las bonificaciones que fija cada curso la Junta de Andalucía. No aparecen servicios confirmados en la fuente consultada, algo frecuente en los listados administrativos y que no significa que el centro no los ofrezca.\n\nLo que aparece aquí se apoya en datos abiertos de la administración educativa andaluza y puede haber variado desde la última actualización. Antes de decidir, pregunta al centro por el periodo de adaptación, el horario y las cuotas vigentes.',
  updated_at = NOW()
WHERE slug = 'mis-suenos-sevilla';

-- Caracol  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Caracol tiene su sede en el parque Genovés, 1, en el 41014 de Sevilla, y funciona como un centro educativo privado para alumnado de 4 meses a 3 años.\n\nSegún el registro autonómico está adherido al Programa de Ayuda a las Familias, de forma que el importe a pagar depende de la bonificación reconocida a cada familia. El registro no baja al detalle del día a día: comedor, ampliación de horario o periodo de adaptación quedan fuera de la información publicada.\n\nEl contenido de esta ficha se basa en fuentes públicas y puede quedar desfasado entre actualizaciones del registro. Si estás valorando esta opción, pide información directamente al centro sobre disponibilidad, jornada y coste mensual.',
  updated_at = NOW()
WHERE slug = 'caracol-sevilla';

-- My Nursery Nervión  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Entre los centros de primer ciclo de Sevilla se encuentra My Nursery Nervión, una escuela infantil privada instalada en la calle Muñoz Seca, 22 (41007), que atiende a pequeños a partir de los 4 meses y hasta los 3 años.\n\nTrabaja dentro del Programa de Ayuda a las Familias, el marco autonómico que abarata la plaza de primer ciclo a las familias que cumplen los requisitos. En cambio, no hay constancia oficial de qué servicios presta ni de su horario concreto, dos aspectos que solo el centro puede aclarar.\n\nLos datos publicados provienen de fuentes abiertas y no han sido confirmados por el propio centro. La disponibilidad de plaza, el horario real y el precio final conviene confirmarlos con el centro antes de solicitar.',
  updated_at = NOW()
WHERE slug = 'my-nursery-nervion-sevilla';

-- El Tren de Chocolate  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'El Tren de Chocolate es una guardería privada. Su dirección, la calle Estrella Betelgeuse, 14, corresponde al código postal 41015 de Sevilla, y su oferta se dirige a niños de los 4 a los 36 meses.\n\nAparece entre los centros adheridos al Programa de Ayuda a las Familias; la admisión suele canalizarse por el procedimiento anual que convoca la administración educativa andaluza. La misma fuente no detalla los servicios complementarios —aula matinal, comedor o taller de juego—, que conviene preguntar antes de solicitar plaza.\n\nToda la información de esta ficha procede de registros administrativos de acceso público, que no siempre reflejan los cambios recientes. Contactar con el centro permite confirmar si quedan plazas y qué servicios ofrece realmente este curso.',
  updated_at = NOW()
WHERE slug = 'el-tren-de-chocolate-sevilla';

-- Las Dueñas  [privado, NO adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'En la calle Doña María Coronel, 25-27, 41003 de Sevilla, Las Dueñas cubre el tramo anterior al aula de 3 años como una escuela dedicada al primer ciclo de educación infantil de titularidad privada, con niñas y niños desde los cuatro meses hasta los tres años.\n\nNo figura entre los centros acogidos al Programa de Ayuda a las Familias, así que tanto la admisión como el precio dependen directamente de su dirección. En esta etapa la incorporación se hace de forma progresiva y cada centro la organiza a su modo; el registro consultado no precisa cómo lo hace este.\n\nConviene tomar estos datos como punto de partida, ya que proceden de un registro público que se actualiza periódicamente. Una llamada al centro despeja en pocos minutos las dudas sobre plazas, horarios y precios.',
  updated_at = NOW()
WHERE slug = 'las-duenas-sevilla';

-- El Patio  [privado, NO adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'El Patio pertenece al grupo de escuelas privadas de primer ciclo de Sevilla. Ocupa un local en la calle González Cuadrado, 60, en el 41003, y admite a bebés y niños entre los 4 meses y los 3 años.\n\nLa fuente oficial no lo recoge como centro adherido al Programa de Ayuda a las Familias; el coste de la plaza, por tanto, se fija sin bonificación autonómica. Más allá de esos datos administrativos, el funcionamiento concreto —horarios, comidas, adaptación— no está documentado en fuentes públicas.\n\nSe trata de información de origen administrativo, útil para situar el centro pero insuficiente para conocerlo a fondo. Concertar una visita permite ver las instalaciones y preguntar por matrícula, horarios y bonificaciones.',
  updated_at = NOW()
WHERE slug = 'el-patio-sevilla';

-- Pino Montano  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'El domicilio de Pino Montano es la calle Alfareros, s/n, 41015 de Sevilla. Este centro privado se ocupa del primer ciclo de educación infantil y recibe a alumnado desde los 4 meses hasta los 3 años.\n\nEstá acogido al Programa de Ayuda a las Familias, con lo que parte de la cuota mensual puede quedar bonificada en función de los criterios de la convocatoria vigente. Tampoco constan los servicios que ofrece ni cómo distribuye los grupos por edades, información que suele facilitar el propio centro al pedir cita.\n\nEsta ficha reúne datos públicos y no incorpora valoraciones ni opiniones sobre el centro. Las familias interesadas pueden dirigirse al centro para conocer vacantes, horario de apertura y tarifas.',
  updated_at = NOW()
WHERE slug = 'pino-montano-sevilla';

-- Pequeñecos  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Pequeñecos es un centro infantil privado que trabaja en la calle Camilo José Cela, 1, local 14, dentro del 41018 sevillano, con pequeños de 4 meses a 3 años.\n\nConsta acogido al Programa de Ayuda a las Familias, el sistema con el que la Junta de Andalucía bonifica parte del coste de la plaza en la etapa 0-3. Nada más se recoge en la fuente oficial, ni horarios ni servicios, así que esta descripción se limita a los datos verificables.\n\nNada de lo anterior sustituye a la información que facilite el propio centro: son datos administrativos, sin más. Para saber si hay plaza libre, en qué horario y con qué cuota, lo mejor es hablar con el equipo del centro.',
  updated_at = NOW()
WHERE slug = 'pequenecos-sevilla';

-- Snoopysol  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'A la altura de la calle Camilo José Cela, 1, locales 13A y 13B, en el 41018 de Sevilla, se ubica Snoopysol, un centro dedicado al primer ciclo de educación infantil de titularidad privada para niños a partir de los 4 meses y hasta los 3 años.\n\nConsta la adhesión al Programa de Ayuda a las Familias: las familias pueden pedir la bonificación del precio de la plaza en los plazos que marca cada convocatoria. El detalle de servicios no consta: en Andalucía, el comedor, el aula matinal y el taller de juego son servicios complementarios que se solicitan junto con la plaza.\n\nEl origen de estos datos es el listado oficial de centros de primer ciclo con alumnado matriculado, de modo que puede estar incompleto. Escribir o llamar permite preguntar por las plazas disponibles y por cómo se organiza la jornada.',
  updated_at = NOW()
WHERE slug = 'snoopysol-sevilla';

-- Educa  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Educa, un centro de primer ciclo privado de Sevilla, tiene su local en la calle Médicos Sin Fronteras, 31, local 2 (41020) y atiende a niñas y niños de los 4 a los 36 meses.\n\nAl ser un centro adherido al Programa de Ayuda a las Familias, quienes obtienen plaza pueden beneficiarse de la bonificación autonómica del precio. Los listados oficiales tampoco recogen el proyecto educativo, un elemento que suele pesar bastante en la elección de escuela infantil.\n\nLos datos anteriores están tomados de fuentes públicas y no reflejan necesariamente la situación actual del centro. Merece la pena preguntar directamente por el proceso de admisión y por los plazos de solicitud de cada curso.',
  updated_at = NOW()
WHERE slug = 'educa-sevilla';

-- Cocoliso  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'El registro de centros de primer ciclo de Andalucía incluye a Cocoliso, un centro educativo privado con sede en la calle Doctor Antonio Cortés Lladó, 11, 41004 de Sevilla, para bebés y niños desde los cuatro meses hasta los tres años.\n\nEl registro andaluz lo incluye entre los centros adheridos al Programa de Ayuda a las Familias, de manera que la mensualidad puede reducirse según la bonificación que corresponda a cada unidad familiar. No se han confirmado servicios concretos en fuente oficial, por lo que esta ficha no los enumera.\n\nLa información mostrada tiene carácter orientativo y procede de registros públicos. Para cualquier detalle sobre matrícula, jornada o precios, la vía adecuada es el contacto con Cocoliso.',
  updated_at = NOW()
WHERE slug = 'cocoliso-sevilla';

-- Sueños  [privado, NO adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Sueños está inscrito como una escuela infantil de primer ciclo de titularidad privada y trabaja en la calle Penélope, 1, 41020 de Sevilla, con alumnado entre los 4 meses y los 3 años.\n\nLa documentación pública no lo sitúa entre los centros adheridos al Programa de Ayuda a las Familias, así que las cuotas responden a su propio criterio. Falta información oficial sobre comedor, aula matinal y horarios, que en esta etapa varían mucho de una escuela a otra.\n\nEsta descripción se ha elaborado únicamente a partir de datos públicos, sin material promocional del centro. Solicitar información al propio centro es la forma más rápida de conocer vacantes, horarios y cuotas de este curso.',
  updated_at = NOW()
WHERE slug = 'suenos-sevilla';

-- Miniclub Pumuky  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'En la calle Esperanza de Triana, 29-31, código postal 41010 de Sevilla, Miniclub Pumuky ofrece plazas de primer ciclo de educación infantil. Es una guardería dedicada al tramo de 0 a 3 años de titularidad privada dirigida a pequeños desde los 4 meses hasta los 3 años.\n\nLa Junta de Andalucía lo recoge como centro adherido al Programa de Ayuda a las Familias, la vía habitual de bonificación del coste de la escolarización 0-3 en la comunidad. La información pública se detiene ahí: ni el horario de apertura ni los servicios figuran en el registro, de modo que hay que consultarlos al centro.\n\nAl proceder de un listado oficial, esta información no incluye ni el proyecto educativo ni las condiciones concretas de cada curso. Ponerse en contacto con Miniclub Pumuky es el paso lógico para resolver dudas sobre admisión, horarios y coste.',
  updated_at = NOW()
WHERE slug = 'miniclub-pumuky-sevilla';

-- El Castillo Mágico Torneo  [privado, NO adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'El Castillo Mágico Torneo es una escuela dedicada al primer ciclo de educación infantil de titularidad privada, situada en la calle Torneo, 21, dentro del código postal 41002 de Sevilla. Trabaja con niños de 4 meses a 3 años.\n\nEn la consulta al registro andaluz no aparece adherido al Programa de Ayuda a las Familias, de modo que la plaza no cuenta con la bonificación autonómica y las condiciones se acuerdan con el propio centro. Sobre el funcionamiento diario no hay datos oficiales; en el primer ciclo la jornada se organiza en torno a rutinas de alimentación, descanso y juego, y cada escuela fija las suyas.\n\nEsta ficha recoge lo que consta en fuentes públicas; el centro puede aportar más detalle o solicitar su actualización. Una consulta directa aclarará plazas, horarios y condiciones económicas mejor que cualquier listado.',
  updated_at = NOW()
WHERE slug = 'el-castillo-magico-torneo-sevilla';

-- Fresa Triana  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'En la avenida de Coria, 27, local, en el 41010 de Sevilla, desarrolla su actividad Fresa Triana, una escuela de primer ciclo privada orientada a niñas y niños a partir de los 4 meses y hasta los 3 años.\n\nForma parte del conjunto de centros adheridos al Programa de Ayuda a las Familias, lo que abre la puerta a la bonificación autonómica de la mensualidad. No aparecen servicios confirmados en la fuente consultada, algo frecuente en los listados administrativos y que no significa que el centro no los ofrezca.\n\nLo que aparece aquí se apoya en datos abiertos de la administración educativa andaluza y puede haber variado desde la última actualización. Antes de dar cualquier paso, conviene contactar con Fresa Triana y confirmar plazas, calendario y condiciones económicas.',
  updated_at = NOW()
WHERE slug = 'fresa-triana-sevilla';

-- Wonderland  [privado, NO adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Wonderland ocupa un espacio en la calle Juan de Mata Carriazo, 3, local (41018, Sevilla). Es una guardería de primer ciclo de gestión privada y atiende a bebés y niños de los 4 a los 36 meses.\n\nLa fuente oficial no lo recoge como centro adherido al Programa de Ayuda a las Familias; el coste de la plaza, por tanto, se fija sin bonificación autonómica. El registro no baja al detalle del día a día: comedor, ampliación de horario o periodo de adaptación quedan fuera de la información publicada.\n\nEl contenido de esta ficha se basa en fuentes públicas y puede quedar desfasado entre actualizaciones del registro. Para comparar con otras opciones de la zona, pide al centro los datos concretos de horario, servicios y cuota.',
  updated_at = NOW()
WHERE slug = 'wonderland-sevilla';

-- Allkids  [privado, NO adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'La sede de Allkids está en la calle Doctor Pedro de Castro, 2, local, en la zona del código postal 41004 de Sevilla. Se trata de un centro de educación infantil de primer ciclo de titularidad privada para alumnado desde los cuatro meses hasta los tres años.\n\nAl no constar su adhesión al Programa de Ayuda a las Familias, las familias tratan la matrícula y la cuota directamente con el centro. En cambio, no hay constancia oficial de qué servicios presta ni de su horario concreto, dos aspectos que solo el centro puede aclarar.\n\nLos datos publicados provienen de fuentes abiertas y no han sido confirmados por el propio centro. Antes de decidir, pregunta al centro por el periodo de adaptación, el horario y las cuotas vigentes.',
  updated_at = NOW()
WHERE slug = 'allkids-sevilla';

-- La Gallina Caponata  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'La Gallina Caponata, un centro dedicado al primer ciclo de educación infantil de titularidad privada, abre sus puertas en la calle Vasco de Gama, 133 (41006, Sevilla) y acoge a pequeños entre los 4 meses y los 3 años.\n\nSegún el registro autonómico está adherido al Programa de Ayuda a las Familias, de forma que el importe a pagar depende de la bonificación reconocida a cada familia. La misma fuente no detalla los servicios complementarios —aula matinal, comedor o taller de juego—, que conviene preguntar antes de solicitar plaza.\n\nToda la información de esta ficha procede de registros administrativos de acceso público, que no siempre reflejan los cambios recientes. Si estás valorando esta opción, pide información directamente al centro sobre disponibilidad, jornada y coste mensual.',
  updated_at = NOW()
WHERE slug = 'la-gallina-caponata-sevilla';

-- Élite College  [privado, NO adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Con sede en la calle Cardenal Spínola, 18, en el 41002 sevillano, Élite College es un centro de primer ciclo privado que escolariza a niños desde los 4 meses hasta los 3 años.\n\nNo consta acogido al Programa de Ayuda a las Familias, de manera que su tarifa es privada y no está sujeta a la bonificación autonómica. En esta etapa la incorporación se hace de forma progresiva y cada centro la organiza a su modo; el registro consultado no precisa cómo lo hace este.\n\nConviene tomar estos datos como punto de partida, ya que proceden de un registro público que se actualiza periódicamente. La disponibilidad de plaza, el horario real y el precio final conviene confirmarlos con el centro antes de solicitar.',
  updated_at = NOW()
WHERE slug = 'elite-college-sevilla';

-- Limoncho  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Limoncho atiende el primer ciclo de educación infantil en la avenida Villas de Cuba, 9, código postal 41007 de Sevilla. De titularidad privada, recibe a niñas y niños de 4 meses a 3 años.\n\nAparece entre los centros adheridos al Programa de Ayuda a las Familias; la admisión suele canalizarse por el procedimiento anual que convoca la administración educativa andaluza. Más allá de esos datos administrativos, el funcionamiento concreto —horarios, comidas, adaptación— no está documentado en fuentes públicas.\n\nSe trata de información de origen administrativo, útil para situar el centro pero insuficiente para conocerlo a fondo. Contactar con el centro permite confirmar si quedan plazas y qué servicios ofrece realmente este curso.',
  updated_at = NOW()
WHERE slug = 'limoncho-sevilla';

-- Educa Smile  [privado, NO adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Con dirección en la calle Recaredo, 4 (41003), Educa Smile presta servicio en Sevilla como una escuela infantil privada, con plazas para bebés y niños a partir de los 4 meses y hasta los 3 años.\n\nSu ficha oficial no refleja adhesión al Programa de Ayuda a las Familias; las condiciones económicas y el calendario los establece el centro. Tampoco constan los servicios que ofrece ni cómo distribuye los grupos por edades, información que suele facilitar el propio centro al pedir cita.\n\nEsta ficha reúne datos públicos y no incorpora valoraciones ni opiniones sobre el centro. Una llamada al centro despeja en pocos minutos las dudas sobre plazas, horarios y precios.',
  updated_at = NOW()
WHERE slug = 'educa-smile-sevilla';

-- Menudo Mundo  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Menudo Mundo es una guardería privada de la ciudad de Sevilla. Su local está en la calle Gustavo Gallardo, 10-12, en el 41013, y su actividad se dirige a alumnado de los 4 a los 36 meses.\n\nSu ficha en el registro lo señala como centro adherido al Programa de Ayuda a las Familias, de modo que la cuota puede bonificarse conforme a la normativa andaluza. Nada más se recoge en la fuente oficial, ni horarios ni servicios, así que esta descripción se limita a los datos verificables.\n\nNada de lo anterior sustituye a la información que facilite el propio centro: son datos administrativos, sin más. Concertar una visita permite ver las instalaciones y preguntar por matrícula, horarios y bonificaciones.',
  updated_at = NOW()
WHERE slug = 'menudo-mundo-sevilla';

-- Las Flores  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'En la avenida Ronda de Pío XII, 1B, acceso A (41008, Sevilla) encontramos Las Flores, una escuela de educación infantil de carácter privado dedicada a pequeños desde los cuatro meses hasta los tres años.\n\nEstá acogido al Programa de Ayuda a las Familias, con lo que parte de la cuota mensual puede quedar bonificada en función de los criterios de la convocatoria vigente. El detalle de servicios no consta: en Andalucía, el comedor, el aula matinal y el taller de juego son servicios complementarios que se solicitan junto con la plaza.\n\nEl origen de estos datos es el listado oficial de centros de primer ciclo con alumnado matriculado, de modo que puede estar incompleto. Las familias interesadas pueden dirigirse al centro para conocer vacantes, horario de apertura y tarifas.',
  updated_at = NOW()
WHERE slug = 'las-flores-sevilla';

-- Pino Montano Norte  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Pino Montano Norte figura en el registro andaluz de centros de primer ciclo como una escuela de primer ciclo privada. Está en la calle Agricultores, esquina con la calle Estrella Proción, 41015 de Sevilla, y atiende a niños entre los 4 meses y los 3 años.\n\nConsta acogido al Programa de Ayuda a las Familias, el sistema con el que la Junta de Andalucía bonifica parte del coste de la plaza en la etapa 0-3. Los listados oficiales tampoco recogen el proyecto educativo, un elemento que suele pesar bastante en la elección de escuela infantil.\n\nLos datos anteriores están tomados de fuentes públicas y no reflejan necesariamente la situación actual del centro. Para saber si hay plaza libre, en qué horario y con qué cuota, lo mejor es hablar con el equipo del centro.',
  updated_at = NOW()
WHERE slug = 'pino-montano-norte-sevilla';

-- Camilín  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Dentro del 41018 de Sevilla, en la avenida San Francisco Javier, 20, locales 9 y 10, trabaja Camilín, una guardería de primer ciclo de titularidad privada con niñas y niños desde los 4 meses hasta los 3 años.\n\nConsta la adhesión al Programa de Ayuda a las Familias: las familias pueden pedir la bonificación del precio de la plaza en los plazos que marca cada convocatoria. No se han confirmado servicios concretos en fuente oficial, por lo que esta ficha no los enumera.\n\nLa información mostrada tiene carácter orientativo y procede de registros públicos. Escribir o llamar permite preguntar por las plazas disponibles y por cómo se organiza la jornada.',
  updated_at = NOW()
WHERE slug = 'camilin-sevilla';

-- Kid's Garden  [privado, NO adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Kid''s Garden forma parte de la oferta de primer ciclo de Sevilla. Es un centro de educación infantil de primer ciclo de titularidad privada, con sede en la avenida Reino Unido, 7, locales 3, 4 y 5 (41012), y atiende a bebés y niños de 4 meses a 3 años.\n\nLa fuente oficial no lo recoge como centro adherido al Programa de Ayuda a las Familias; el coste de la plaza, por tanto, se fija sin bonificación autonómica. Falta información oficial sobre comedor, aula matinal y horarios, que en esta etapa varían mucho de una escuela a otra.\n\nEsta descripción se ha elaborado únicamente a partir de datos públicos, sin material promocional del centro. Merece la pena preguntar directamente por el proceso de admisión y por los plazos de solicitud de cada curso.',
  updated_at = NOW()
WHERE slug = 'kid-s-garden-sevilla';

-- Mis Sueños 2  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'La actividad de Mis Sueños 2 se desarrolla en la calle Doña María de Molina, 43, en el distrito postal 41005 de Sevilla. Es un centro de educación infantil privado para alumnado a partir de los 4 meses y hasta los 3 años.\n\nEl registro andaluz lo incluye entre los centros adheridos al Programa de Ayuda a las Familias, de manera que la mensualidad puede reducirse según la bonificación que corresponda a cada unidad familiar. La información pública se detiene ahí: ni el horario de apertura ni los servicios figuran en el registro, de modo que hay que consultarlos al centro.\n\nAl proceder de un listado oficial, esta información no incluye ni el proyecto educativo ni las condiciones concretas de cada curso. Para cualquier detalle sobre matrícula, jornada o precios, la vía adecuada es el contacto con Mis Sueños 2.',
  updated_at = NOW()
WHERE slug = 'mis-suenos-2-sevilla';

-- Sensory Skills Santa Clara  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Sensory Skills Santa Clara es un centro educativo de la etapa 0-3 de titularidad privada que atiende a pequeños de los 4 a los 36 meses en la avenida Santa Clara de Cuba, 4, nave 1, en el polígono industrial Santa Clara de Cuba, 41007, Sevilla.\n\nEl centro está integrado en el Programa de Ayuda a las Familias, la fórmula con la que la administración andaluza subvenciona parte del coste de estas plazas. Sobre el funcionamiento diario no hay datos oficiales; en el primer ciclo la jornada se organiza en torno a rutinas de alimentación, descanso y juego, y cada escuela fija las suyas.\n\nEsta ficha recoge lo que consta en fuentes públicas; el centro puede aportar más detalle o solicitar su actualización. Solicitar información al propio centro es la forma más rápida de conocer vacantes, horarios y cuotas de este curso.',
  updated_at = NOW()
WHERE slug = 'sensory-skills-santa-clara-sevilla';

-- Marta Mateu  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'En el 41003 de Sevilla, concretamente en la calle Amador de los Ríos, 20, planta baja, puerta B2, se encuentra Marta Mateu, un centro educativo privado con alumnado desde los cuatro meses hasta los tres años.\n\nLa Junta de Andalucía lo recoge como centro adherido al Programa de Ayuda a las Familias, la vía habitual de bonificación del coste de la escolarización 0-3 en la comunidad. No aparecen servicios confirmados en la fuente consultada, algo frecuente en los listados administrativos y que no significa que el centro no los ofrezca.\n\nLo que aparece aquí se apoya en datos abiertos de la administración educativa andaluza y puede haber variado desde la última actualización. Ponerse en contacto con Marta Mateu es el paso lógico para resolver dudas sobre admisión, horarios y coste.',
  updated_at = NOW()
WHERE slug = 'marta-mateu-sevilla';

-- El Pequeño Príncipe  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'El Pequeño Príncipe desarrolla su labor educativa con niñas y niños entre los 4 meses y los 3 años en la calle Juan de Oñate, 17, en el 41005 de Sevilla. Su titularidad es privada.\n\nParticipa en el Programa de Ayuda a las Familias, por lo que las familias pueden solicitar la ayuda autonómica que rebaja el precio del servicio de atención socioeducativa. El registro no baja al detalle del día a día: comedor, ampliación de horario o periodo de adaptación quedan fuera de la información publicada.\n\nEl contenido de esta ficha se basa en fuentes públicas y puede quedar desfasado entre actualizaciones del registro. Una consulta directa aclarará plazas, horarios y condiciones económicas mejor que cualquier listado.',
  updated_at = NOW()
WHERE slug = 'el-pequeno-principe-sevilla';

-- Cuatro Pecas  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Una guardería dedicada al tramo de 0 a 3 años de titularidad privada: así consta Cuatro Pecas en el registro autonómico. Está en la calle Urquiza, 16-18, bajo (41003, Sevilla) y trabaja con bebés y niños desde los 4 meses hasta los 3 años.\n\nForma parte del conjunto de centros adheridos al Programa de Ayuda a las Familias, lo que abre la puerta a la bonificación autonómica de la mensualidad. En cambio, no hay constancia oficial de qué servicios presta ni de su horario concreto, dos aspectos que solo el centro puede aclarar.\n\nLos datos publicados provienen de fuentes abiertas y no han sido confirmados por el propio centro. Antes de dar cualquier paso, conviene contactar con Cuatro Pecas y confirmar plazas, calendario y condiciones económicas.',
  updated_at = NOW()
WHERE slug = 'cuatro-pecas-sevilla';

-- El castillo mágico  [privado, NO adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'El castillo mágico tiene su sede en la calle Virgen de Aguas Santas, 9, planta baja, puerta AC, en el 41011 de Sevilla, y funciona como una escuela de educación infantil privada para alumnado de 4 meses a 3 años.\n\nLa documentación pública no lo sitúa entre los centros adheridos al Programa de Ayuda a las Familias, así que las cuotas responden a su propio criterio. La misma fuente no detalla los servicios complementarios —aula matinal, comedor o taller de juego—, que conviene preguntar antes de solicitar plaza.\n\nToda la información de esta ficha procede de registros administrativos de acceso público, que no siempre reflejan los cambios recientes. Para comparar con otras opciones de la zona, pide al centro los datos concretos de horario, servicios y cuota.',
  updated_at = NOW()
WHERE slug = 'el-castillo-magico-sevilla';

-- El tren de chocolate 2  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Entre los centros de primer ciclo de Sevilla se encuentra El tren de chocolate 2, una escuela de primer ciclo privada instalada en la calle Nuestra Señora del Amparo, 2 (locales A2 izquierda y A2 derecha), en la barriada Nuestra Señora del Amparo, en el 41009, que atiende a pequeños a partir de los 4 meses y hasta los 3 años.\n\nSu adhesión al Programa de Ayuda a las Familias implica que el precio de la plaza está sujeto a las bonificaciones que fija cada curso la Junta de Andalucía. En esta etapa la incorporación se hace de forma progresiva y cada centro la organiza a su modo; el registro consultado no precisa cómo lo hace este.\n\nConviene tomar estos datos como punto de partida, ya que proceden de un registro público que se actualiza periódicamente. Antes de decidir, pregunta al centro por el periodo de adaptación, el horario y las cuotas vigentes.',
  updated_at = NOW()
WHERE slug = 'el-tren-de-chocolate-2-sevilla';

-- Don Chupete  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Don Chupete es una guardería privada. Su dirección, el paseo Miguel de Unamuno, 12, local D, corresponde al código postal 41020 de Sevilla, y su oferta se dirige a niños de los 4 a los 36 meses.\n\nSegún el registro autonómico está adherido al Programa de Ayuda a las Familias, de forma que el importe a pagar depende de la bonificación reconocida a cada familia. Más allá de esos datos administrativos, el funcionamiento concreto —horarios, comidas, adaptación— no está documentado en fuentes públicas.\n\nSe trata de información de origen administrativo, útil para situar el centro pero insuficiente para conocerlo a fondo. Si estás valorando esta opción, pide información directamente al centro sobre disponibilidad, jornada y coste mensual.',
  updated_at = NOW()
WHERE slug = 'don-chupete-sevilla';

-- San Carlos  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'En la calle Ligustino, 3, 41008 de Sevilla, San Carlos cubre el tramo anterior al aula de 3 años como un centro de educación infantil de primer ciclo de titularidad privada, con niñas y niños desde los cuatro meses hasta los tres años.\n\nTrabaja dentro del Programa de Ayuda a las Familias, el marco autonómico que abarata la plaza de primer ciclo a las familias que cumplen los requisitos. Tampoco constan los servicios que ofrece ni cómo distribuye los grupos por edades, información que suele facilitar el propio centro al pedir cita.\n\nEsta ficha reúne datos públicos y no incorpora valoraciones ni opiniones sobre el centro. La disponibilidad de plaza, el horario real y el precio final conviene confirmarlos con el centro antes de solicitar.',
  updated_at = NOW()
WHERE slug = 'san-carlos-sevilla';

-- La Colmena  [privado, NO adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'La Colmena pertenece al grupo de escuelas privadas de primer ciclo de Sevilla. Ocupa un local en la avenida Vía Apia, 7, edificio Ágora, local 21, en el 41016, y admite a bebés y niños entre los 4 meses y los 3 años.\n\nLa fuente oficial no lo recoge como centro adherido al Programa de Ayuda a las Familias; el coste de la plaza, por tanto, se fija sin bonificación autonómica. Nada más se recoge en la fuente oficial, ni horarios ni servicios, así que esta descripción se limita a los datos verificables.\n\nNada de lo anterior sustituye a la información que facilite el propio centro: son datos administrativos, sin más. Contactar con el centro permite confirmar si quedan plazas y qué servicios ofrece realmente este curso.',
  updated_at = NOW()
WHERE slug = 'la-colmena-sevilla';

-- La casa del niño "La Oliva"  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'El domicilio de La casa del niño "La Oliva" es la barriada La Oliva, parcela 5/N, 3/E, 41013 de Sevilla. Este centro privado se ocupa del primer ciclo de educación infantil y recibe a alumnado desde los 4 meses hasta los 3 años.\n\nSu condición de centro adherido al Programa de Ayuda a las Familias da acceso a las ayudas que la Junta destina a las plazas de 0 a 3 años. El detalle de servicios no consta: en Andalucía, el comedor, el aula matinal y el taller de juego son servicios complementarios que se solicitan junto con la plaza.\n\nEl origen de estos datos es el listado oficial de centros de primer ciclo con alumnado matriculado, de modo que puede estar incompleto. Una llamada al centro despeja en pocos minutos las dudas sobre plazas, horarios y precios.',
  updated_at = NOW()
WHERE slug = 'la-casa-del-nino-la-oliva-sevilla';

-- Mi Cole Buhaira  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Mi Cole Buhaira es un centro educativo privado que trabaja en la calle Blanco White, 7, planta baja, local A1, dentro del 41018 sevillano, con pequeños de 4 meses a 3 años. En el mismo inmueble consta un segundo centro, Mi Cole Buhaira 2.\n\nSu ficha en el registro lo señala como centro adherido al Programa de Ayuda a las Familias, de modo que la cuota puede bonificarse conforme a la normativa andaluza. Los listados oficiales tampoco recogen el proyecto educativo, un elemento que suele pesar bastante en la elección de escuela infantil.\n\nLos datos anteriores están tomados de fuentes públicas y no reflejan necesariamente la situación actual del centro. Concertar una visita permite ver las instalaciones y preguntar por matrícula, horarios y bonificaciones.',
  updated_at = NOW()
WHERE slug = 'mi-cole-buhaira-sevilla';

-- Mi Cole Buhaira 2  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'A la altura de la calle Blanco White, 7, planta baja, local A2, en el 41018 de Sevilla, se ubica Mi Cole Buhaira 2, una escuela infantil de primer ciclo de titularidad privada para niños a partir de los 4 meses y hasta los 3 años. En el mismo inmueble figura registrado Mi Cole Buhaira, otro centro de primer ciclo.\n\nEstá acogido al Programa de Ayuda a las Familias, con lo que parte de la cuota mensual puede quedar bonificada en función de los criterios de la convocatoria vigente. No se han confirmado servicios concretos en fuente oficial, por lo que esta ficha no los enumera.\n\nLa información mostrada tiene carácter orientativo y procede de registros públicos. Las familias interesadas pueden dirigirse al centro para conocer vacantes, horario de apertura y tarifas.',
  updated_at = NOW()
WHERE slug = 'mi-cole-buhaira-2-sevilla';

-- Chiqui  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Chiqui, una guardería privada de Sevilla, tiene su local en la calle Cueva del Gato, 4, local C (41020) y atiende a niñas y niños de los 4 a los 36 meses.\n\nConsta acogido al Programa de Ayuda a las Familias, el sistema con el que la Junta de Andalucía bonifica parte del coste de la plaza en la etapa 0-3. Falta información oficial sobre comedor, aula matinal y horarios, que en esta etapa varían mucho de una escuela a otra.\n\nEsta descripción se ha elaborado únicamente a partir de datos públicos, sin material promocional del centro. Para saber si hay plaza libre, en qué horario y con qué cuota, lo mejor es hablar con el equipo del centro.',
  updated_at = NOW()
WHERE slug = 'chiqui-sevilla';

-- Pikabú  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'El registro de centros de primer ciclo de Andalucía incluye a Pikabú, una escuela de educación infantil privada con sede en la calle Virgen del Dulce Nombre, 61, planta baja, 41016 de Sevilla, para bebés y niños desde los cuatro meses hasta los tres años.\n\nConsta la adhesión al Programa de Ayuda a las Familias: las familias pueden pedir la bonificación del precio de la plaza en los plazos que marca cada convocatoria. La información pública se detiene ahí: ni el horario de apertura ni los servicios figuran en el registro, de modo que hay que consultarlos al centro.\n\nAl proceder de un listado oficial, esta información no incluye ni el proyecto educativo ni las condiciones concretas de cada curso. Escribir o llamar permite preguntar por las plazas disponibles y por cómo se organiza la jornada.',
  updated_at = NOW()
WHERE slug = 'pikabu-sevilla';

-- Ratón Pérez 1  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Ratón Pérez 1 está inscrito como una escuela de educación infantil de primer ciclo de titularidad privada y trabaja en la avenida Manuel Siurot, 3, bloque 8, local 5, 41013 de Sevilla, con alumnado entre los 4 meses y los 3 años. Comparte dirección con Ratón Pérez 2, igualmente inscrito como centro de primer ciclo.\n\nAl ser un centro adherido al Programa de Ayuda a las Familias, quienes obtienen plaza pueden beneficiarse de la bonificación autonómica del precio. Sobre el funcionamiento diario no hay datos oficiales; en el primer ciclo la jornada se organiza en torno a rutinas de alimentación, descanso y juego, y cada escuela fija las suyas.\n\nEsta ficha recoge lo que consta en fuentes públicas; el centro puede aportar más detalle o solicitar su actualización. Merece la pena preguntar directamente por el proceso de admisión y por los plazos de solicitud de cada curso.',
  updated_at = NOW()
WHERE slug = 'raton-perez-1-sevilla';

-- Pepito  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'En la avenida Ramón y Cajal, 124, planta baja, código postal 41005 de Sevilla, Pepito ofrece plazas de primer ciclo de educación infantil. Es una guardería de primer ciclo de titularidad privada dirigida a pequeños desde los 4 meses hasta los 3 años.\n\nEl registro andaluz lo incluye entre los centros adheridos al Programa de Ayuda a las Familias, de manera que la mensualidad puede reducirse según la bonificación que corresponda a cada unidad familiar. No aparecen servicios confirmados en la fuente consultada, algo frecuente en los listados administrativos y que no significa que el centro no los ofrezca.\n\nLo que aparece aquí se apoya en datos abiertos de la administración educativa andaluza y puede haber variado desde la última actualización. Para cualquier detalle sobre matrícula, jornada o precios, la vía adecuada es el contacto con Pepito.',
  updated_at = NOW()
WHERE slug = 'pepito-sevilla';

-- Mis Mochuelos  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Mis Mochuelos es un centro de educación infantil de primer ciclo de titularidad privada, situado en la calle El Gordito, 1, dentro del código postal 41007 de Sevilla. Trabaja con niños de 4 meses a 3 años.\n\nEl centro está integrado en el Programa de Ayuda a las Familias, la fórmula con la que la administración andaluza subvenciona parte del coste de estas plazas. El registro no baja al detalle del día a día: comedor, ampliación de horario o periodo de adaptación quedan fuera de la información publicada.\n\nEl contenido de esta ficha se basa en fuentes públicas y puede quedar desfasado entre actualizaciones del registro. Solicitar información al propio centro es la forma más rápida de conocer vacantes, horarios y cuotas de este curso.',
  updated_at = NOW()
WHERE slug = 'mis-mochuelos-sevilla';

-- Huellitas de Colores  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'En la calle Concepción Reina Peláez, 34, en el 41016 de Sevilla, desarrolla su actividad Huellitas de Colores, un centro de educación infantil privado orientado a niñas y niños a partir de los 4 meses y hasta los 3 años.\n\nLa Junta de Andalucía lo recoge como centro adherido al Programa de Ayuda a las Familias, la vía habitual de bonificación del coste de la escolarización 0-3 en la comunidad. En cambio, no hay constancia oficial de qué servicios presta ni de su horario concreto, dos aspectos que solo el centro puede aclarar.\n\nLos datos publicados provienen de fuentes abiertas y no han sido confirmados por el propio centro. Ponerse en contacto con Huellitas de Colores es el paso lógico para resolver dudas sobre admisión, horarios y coste.',
  updated_at = NOW()
WHERE slug = 'huellitas-de-colores-sevilla';

-- El Duende Mágico  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'El Duende Mágico ocupa un espacio en la calle Donantes de Sangre, 20 (41020, Sevilla). Es un centro educativo de la etapa 0-3 de gestión privada y atiende a bebés y niños de los 4 a los 36 meses.\n\nParticipa en el Programa de Ayuda a las Familias, por lo que las familias pueden solicitar la ayuda autonómica que rebaja el precio del servicio de atención socioeducativa. La misma fuente no detalla los servicios complementarios —aula matinal, comedor o taller de juego—, que conviene preguntar antes de solicitar plaza.\n\nToda la información de esta ficha procede de registros administrativos de acceso público, que no siempre reflejan los cambios recientes. Una consulta directa aclarará plazas, horarios y condiciones económicas mejor que cualquier listado.',
  updated_at = NOW()
WHERE slug = 'el-duende-magico-sevilla';

-- Baby Moon  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'La sede de Baby Moon está en la avenida Poeta Manuel Benítez Carrasco, 2-4, en la zona del código postal 41013 de Sevilla. Se trata de un centro de primer ciclo de educación infantil de titularidad privada para alumnado desde los cuatro meses hasta los tres años.\n\nForma parte del conjunto de centros adheridos al Programa de Ayuda a las Familias, lo que abre la puerta a la bonificación autonómica de la mensualidad. En esta etapa la incorporación se hace de forma progresiva y cada centro la organiza a su modo; el registro consultado no precisa cómo lo hace este.\n\nConviene tomar estos datos como punto de partida, ya que proceden de un registro público que se actualiza periódicamente. Antes de dar cualquier paso, conviene contactar con Baby Moon y confirmar plazas, calendario y condiciones económicas.',
  updated_at = NOW()
WHERE slug = 'baby-moon-sevilla';

-- Más de Mil Sonrisas  [privado, NO adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Más de Mil Sonrisas, una escuela infantil de primer ciclo de titularidad privada, abre sus puertas en la carretera de Carmona, 30 (41008, Sevilla) y acoge a pequeños entre los 4 meses y los 3 años.\n\nEl registro de la Junta de Andalucía no lo incluye entre los centros adheridos al Programa de Ayuda a las Familias, un dato a tener en cuenta al comparar precios. Más allá de esos datos administrativos, el funcionamiento concreto —horarios, comidas, adaptación— no está documentado en fuentes públicas.\n\nSe trata de información de origen administrativo, útil para situar el centro pero insuficiente para conocerlo a fondo. Para comparar con otras opciones de la zona, pide al centro los datos concretos de horario, servicios y cuota.',
  updated_at = NOW()
WHERE slug = 'mas-de-mil-sonrisas-sevilla';

-- Toyland  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Con sede en la calle Hispano Aviación, 4, local 2, en el 41011 sevillano, Toyland es una guardería privada que escolariza a niños desde los 4 meses hasta los 3 años.\n\nSu adhesión al Programa de Ayuda a las Familias implica que el precio de la plaza está sujeto a las bonificaciones que fija cada curso la Junta de Andalucía. Tampoco constan los servicios que ofrece ni cómo distribuye los grupos por edades, información que suele facilitar el propio centro al pedir cita.\n\nEsta ficha reúne datos públicos y no incorpora valoraciones ni opiniones sobre el centro. Antes de decidir, pregunta al centro por el periodo de adaptación, el horario y las cuotas vigentes.',
  updated_at = NOW()
WHERE slug = 'toyland-sevilla';

-- Lunares  [privado, NO adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Lunares atiende el primer ciclo de educación infantil en la calle Sinai, 18, código postal 41007 de Sevilla. De titularidad privada, recibe a niñas y niños de 4 meses a 3 años.\n\nEn el listado autonómico no aparece con adhesión al Programa de Ayuda a las Familias, por lo que la solicitud de plaza se gestiona en el propio centro. Nada más se recoge en la fuente oficial, ni horarios ni servicios, así que esta descripción se limita a los datos verificables.\n\nNada de lo anterior sustituye a la información que facilite el propio centro: son datos administrativos, sin más. Si estás valorando esta opción, pide información directamente al centro sobre disponibilidad, jornada y coste mensual.',
  updated_at = NOW()
WHERE slug = 'lunares-sevilla';

-- Escuela con Corazón  [privado, NO adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Con dirección en la calle Juan de Pineda, 118, local (41010), Escuela con Corazón presta servicio en Sevilla como una escuela de primer ciclo privada, con plazas para bebés y niños a partir de los 4 meses y hasta los 3 años.\n\nSu ficha oficial no refleja adhesión al Programa de Ayuda a las Familias; las condiciones económicas y el calendario los establece el centro. El detalle de servicios no consta: en Andalucía, el comedor, el aula matinal y el taller de juego son servicios complementarios que se solicitan junto con la plaza.\n\nEl origen de estos datos es el listado oficial de centros de primer ciclo con alumnado matriculado, de modo que puede estar incompleto. La disponibilidad de plaza, el horario real y el precio final conviene confirmarlos con el centro antes de solicitar.',
  updated_at = NOW()
WHERE slug = 'escuela-con-corazon-sevilla';

-- El Patio Pío  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'El Patio Pío es una guardería privada de la ciudad de Sevilla. Su local está en la calle Escuelas Pías, 3, en el 41003, y su actividad se dirige a alumnado de los 4 a los 36 meses.\n\nAparece entre los centros adheridos al Programa de Ayuda a las Familias; la admisión suele canalizarse por el procedimiento anual que convoca la administración educativa andaluza. Los listados oficiales tampoco recogen el proyecto educativo, un elemento que suele pesar bastante en la elección de escuela infantil.\n\nLos datos anteriores están tomados de fuentes públicas y no reflejan necesariamente la situación actual del centro. Contactar con el centro permite confirmar si quedan plazas y qué servicios ofrece realmente este curso.',
  updated_at = NOW()
WHERE slug = 'el-patio-pio-sevilla';

-- ==========================================================
-- MALAGA — 127 centros
-- ==========================================================

-- SAN VICENTE DE PAÚL (san-vicente-de-paul-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'San Vicente de Paúl es una guardería privada de Málaga que trabaja el primer ciclo de educación infantil en la calle Río Gévora, 6, dentro del código postal 29002. Sus aulas se dirigen a niños de 4 meses a 3 años.\n\nEl registro de la Junta de Andalucía lo señala como centro participante en el Programa de Ayuda a las Familias, la vía por la que se bonifica el precio del servicio educativo de 0-3. Más allá de ese dato, la fuente no detalla servicios concretos: comedor, ampliación de horario o actividades complementarias no aparecen confirmados.\n\nLa información de esta ficha se ha compuesto con datos de acceso público y puede quedar desfasada. Para plazas libres, horario real y cuotas del curso, lo más seguro es hablar con San Vicente de Paúl.',
  updated_at = NOW()
WHERE slug = 'san-vicente-de-paul-malaga';

-- SAN PABLO (san-pablo-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'La calle Pizarro, 9, barriada de la Trinidad (29009) es el domicilio de San Pablo, centro malagueño de titularidad privada dedicado al primer ciclo de educación infantil, la etapa que abarca de los 4 meses a los 3 años.\n\nEntre los datos oficiales consta su participación en el Programa de Ayuda a las Familias, el instrumento con el que la Junta de Andalucía rebaja el coste de la plaza a las familias que cumplen los requisitos. La misma fuente no describe servicios adicionales, de forma que cuestiones como la comida, el horario de tarde o el material incluido quedan sin verificar. En esta etapa, la incorporación suele plantearse de manera progresiva: el periodo de adaptación es una práctica habitual del 0-3 en Andalucía, con calendarios que fija cada escuela.\n\nTodo lo anterior procede de fuentes públicas, que no siempre están al día. Antes de decidir, llama a San Pablo y pregunta por disponibilidad, horarios y precio final.',
  updated_at = NOW()
WHERE slug = 'san-pablo-malaga';

-- MAMÁ OCA (mama-oca-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'En la avenida Pepita Durán, 5, dentro del 29010 de Málaga, Mamá Oca desarrolla su labor como escuela infantil privada de primer ciclo para niños de entre 4 meses y 3 años.\n\nLos listados de la Consejería lo sitúan dentro del Programa de Ayuda a las Familias, de modo que la cuota puede reducirse conforme al baremo autonómico vigente. No constan, en cambio, servicios confirmados de forma oficial: ni comedor, ni horario ampliado, ni ningún otro extra figuran documentados. El primer ciclo de educación infantil no es obligatorio, y las plazas y precios varían mucho de un centro a otro dentro de la misma ciudad.\n\nEstos datos salen de registros públicos y pueden estar incompletos; el propio centro es quien puede confirmar plazas, calendario y cuotas actualizadas.',
  updated_at = NOW()
WHERE slug = 'mama-oca-malaga';

-- LOS PICAPIEDRAS (los-picapiedras-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'Los Picapiedras atiende el tramo de 4 a 36 meses en el conjunto Villa María, 3-4, en el código postal 29010 de Málaga. Es un centro de titularidad privada del primer ciclo de educación infantil.\n\nParticipa en el Programa de Ayuda a las Familias de la Junta de Andalucía, el mecanismo autonómico que rebaja el precio de la plaza de primer ciclo según la situación de cada unidad familiar. Sobre el funcionamiento diario, la información pública se queda corta: no hay servicios verificados que podamos enumerar aquí.\n\nEsta ficha se apoya en información pública. Si te interesa Los Picapiedras, contacta directamente para conocer las plazas disponibles, el horario y las condiciones económicas.',
  updated_at = NOW()
WHERE slug = 'los-picapiedras-malaga';

-- ÁBACO (abaco-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'Con dirección en la calle Antonio Jiménez Ruiz, 32 (29009, Málaga), Ábaco escolariza el primer ciclo de educación infantil como centro privado, desde los 4 meses hasta los 3 años.\n\nSe acoge al Programa de Ayuda a las Familias, con lo que la tarifa del servicio educativo puede bonificarse de acuerdo con la normativa andaluza en vigor. Lo que no recoge el registro es el detalle de servicios: comedor, entrada temprana o actividades adicionales no están confirmados en fuente oficial. En Andalucía, la escolarización de 0 a 3 años se solicita curso a curso, y el calendario oficial marca los plazos de admisión de cada año.\n\nLos datos aquí reunidos tienen origen público y no sustituyen a la información del centro: pregunta en Ábaco por plazas, horarios y cuotas antes de matricular.',
  updated_at = NOW()
WHERE slug = 'abaco-malaga';

-- SAN JUAN DE ÁVILA (san-juan-de-avila-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'El censo andaluz de centros de primer ciclo incluye a San Juan de Ávila, guardería privada de Málaga instalada en la calle Bartolomé Pancorbo, 5 (29003) y dirigida a niños de 4 meses a 3 años.\n\nLa fuente oficial lo incluye entre los centros que participan en el Programa de Ayuda a las Familias; esa adhesión es la que abre el acceso a las bonificaciones autonómicas del precio. El apartado de servicios permanece vacío en los datos consultados, así que preferimos no atribuir al centro prestaciones que no podemos verificar. En el primer ciclo, el vínculo con la familia y la comunicación diaria pesan tanto como la propuesta de actividades; es una característica compartida por toda la etapa.\n\nComo esta información procede de fuentes abiertas, puede haber cambiado. Una llamada a San Juan de Ávila resolverá las dudas sobre disponibilidad, jornada y precio.',
  updated_at = NOW()
WHERE slug = 'san-juan-de-avila-malaga';

-- SIERRA BLANCA (sierra-blanca-malaga) [privado, no adherido]
UPDATE centers SET
  long_description = E'Sierra Blanca funciona como escuela infantil privada en la calle Francisco Barbín, 22, código postal 29010 de Málaga, y cubre la franja de edad que va de los 4 meses a los 3 años.\n\nEn la fuente oficial consultada no aparece acogido al Programa de Ayuda a las Familias, el sistema andaluz de bonificación del precio en el primer ciclo, de modo que las condiciones económicas se pactan directamente con el centro. Ninguna fuente oficial detalla su oferta de servicios, por lo que no afirmamos que disponga de comedor, horario ampliado ni actividades complementarias.\n\nEl contenido de esta página se basa en registros públicos. Para saber si hay plaza, qué horario maneja el centro y cuánto cuesta, conviene preguntar directamente.',
  updated_at = NOW()
WHERE slug = 'sierra-blanca-malaga';

-- EL DIVINO PASTOR (el-divino-pastor-malaga) [privado, no adherido]
UPDATE centers SET
  long_description = E'A la altura de la calle Gaucín, s/n, en el 29003 malagueño, se localiza El Divino Pastor: un centro privado de primer ciclo de educación infantil para pequeños de 4 meses a 3 años.\n\nEl registro de la Junta de Andalucía no lo relaciona con el Programa de Ayuda a las Familias, así que conviene preguntar por la tarifa completa y por posibles descuentos propios. Los datos disponibles no especifican qué servicios presta, de modo que ese apartado queda pendiente de confirmación con el propio centro. La etapa 0-3 combina cuidado y aprendizaje: hábitos, lenguaje, motricidad y juego forman el núcleo de la jornada en cualquier escuela infantil.\n\nFicha construida con datos públicos, sujetos a cambios de un curso a otro. El Divino Pastor puede confirmarte plazas, horarios y cuotas con exactitud.',
  updated_at = NOW()
WHERE slug = 'el-divino-pastor-malaga';

-- LA CASITA MÁGICA (la-casita-magica-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'La Casita Mágica es un centro de educación infantil de primer ciclo y gestión privada, con sede en la calle Josefa de los Ríos, 3 (29010), en la ciudad de Málaga. Acoge a niños desde los 4 meses hasta los 3 años.\n\nEstá incorporado al Programa de Ayuda a las Familias, la fórmula por la que la administración andaluza asume una parte del precio del servicio educativo. Del resto de aspectos prácticos —alimentación, horarios, materiales— no hay constancia documental en las fuentes revisadas. Como en el resto de centros del primer ciclo, la matrícula depende de las plazas libres por edad, que cambian cada curso.\n\nLa procedencia de estos datos es pública, de modo que pueden faltar detalles. Contacta con el centro para cerrar los aspectos prácticos: plaza, horario y precio.',
  updated_at = NOW()
WHERE slug = 'la-casita-magica-malaga';

-- NUEVO KINDERGARTEN (nuevo-kindergarten-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'La actividad de Nuevo Kindergarten se desarrolla en la calle Villafuerte, 51, código postal 29017 de Málaga. Hablamos de una guardería privada del primer ciclo de infantil, pensada para la franja de 4 a 36 meses.\n\nLos datos abiertos de la Junta lo recogen como centro acogido al Programa de Ayuda a las Familias, con la bonificación del precio que esa adhesión conlleva. En cuanto a servicios, la ficha oficial no aporta detalle alguno; lo prudente es preguntar y no dar nada por supuesto.\n\nRecogemos aquí lo que consta en fuentes públicas. Lo demás —plazas del curso, horarios concretos, cuotas— hay que consultarlo con Nuevo Kindergarten.',
  updated_at = NOW()
WHERE slug = 'nuevo-kindergarten-malaga';

-- AULA FUTURA (aula-futura-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'Dentro del mapa de guarderías de Málaga capital, Aula Futura ocupa la avenida Los Pascueros, 1 (29013). Es un centro privado de primer ciclo de educación infantil que atiende de los 4 meses a los 3 años.\n\nSu ficha oficial lo asocia al Programa de Ayuda a las Familias; la cuantía finalmente bonificada depende de la renta y de la composición de cada familia. No hemos localizado información oficial sobre comedor, jornada ampliada o actividades, así que ese apartado aparece vacío en esta ficha. El primer ciclo andaluz funciona con solicitud anual y baremo, y la bonificación del precio se resuelve dentro de ese mismo procedimiento.\n\nEsta información es de origen público y puede no reflejar la situación actual del centro. Pregunta en Aula Futura por vacantes, jornada y tarifas.',
  updated_at = NOW()
WHERE slug = 'aula-futura-malaga';

-- LOS 7 ENANITOS (los-7-enanitos-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'Los 7 Enanitos presta servicio educativo a niños de 4 meses a 3 años en la avenida Jenofonte, 1, urbanización El Consul, dentro del código postal 29010 de Málaga, con titularidad privada y autorización para el primer ciclo de infantil.\n\nForma parte del conjunto de centros acogidos al Programa de Ayuda a las Familias de la Junta de Andalucía, lo que permite solicitar la bonificación del precio de la plaza. La fuente consultada no confirma servicios complementarios, un dato que solo el centro puede completar con precisión. Es propio de la etapa que las familias visiten el centro antes de decidir: ver el aula y hablar con el equipo aporta más que cualquier ficha.\n\nLos datos mostrados proceden de fuentes abiertas y se ofrecen a título informativo. Para plazas, horarios y cuotas, dirígete al centro.',
  updated_at = NOW()
WHERE slug = 'los-7-enanitos-malaga';

-- BRINCA 2 (brinca-2-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'Quien busque plaza de 0-3 en el entorno del 29010 de Málaga encontrará Brinca 2 en la avenida Carlos Haya, 104. Es una guardería privada que atiende a niños de 4 meses a 3 años.\n\nAl participar en el Programa de Ayuda a las Familias, admite la tramitación de las bonificaciones autonómicas sobre el precio del servicio educativo. Sobre servicios concretos no hay respaldo documental, por lo que esta ficha se limita a los datos administrativos verificados.\n\nFicha elaborada con información pública. Si estás valorando Brinca 2, pide cita o llama para conocer plazas libres, horario y coste mensual.',
  updated_at = NOW()
WHERE slug = 'brinca-2-malaga';

-- VIRGEN MILAGROSA (virgen-milagrosa-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'Virgen Milagrosa pertenece a la red de centros privados de primer ciclo de educación infantil de Málaga. Su dirección es la plaza Virgen Milagrosa, 11, código postal 29017, y trabaja con niños de 4 a 36 meses.\n\nEl listado oficial lo marca como adherido al Programa de Ayuda a las Familias, la ayuda con la que la Junta de Andalucía abarata la plaza de primer ciclo. El registro no incluye información sobre comedor ni sobre ampliación horaria, de manera que esos puntos quedan abiertos. Las escuelas de primer ciclo suelen abrir en septiembre con el curso escolar, aunque muchas admiten incorporaciones a lo largo del año si hay plaza.\n\nEl contenido procede de registros públicos y puede estar incompleto. El equipo de Virgen Milagrosa podrá detallarte disponibilidad, horarios y condiciones económicas.',
  updated_at = NOW()
WHERE slug = 'virgen-milagrosa-malaga';

-- BRUNET (brunet-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'En pleno 29140 de Málaga, concretamente en el camino del Pilar, 72, Brunet ofrece plazas de primer ciclo de educación infantil para niños de 4 meses a 3 años. Su titularidad es privada.\n\nCuenta con adhesión al Programa de Ayuda a las Familias, de manera que buena parte de las familias puede acceder a un precio bonificado según el baremo autonómico. Falta, sin embargo, la información de servicios: no hay fuente oficial que confirme comedor, horario extendido u otras prestaciones. En esta franja de edad, el proyecto educativo se apoya en rutinas estables y en el acompañamiento individual de cada niño, algo transversal a toda la etapa.\n\nEsta descripción parte de datos públicos. Antes de dar ningún paso, confirma con el centro las plazas, el horario de apertura y la cuota que te correspondería.',
  updated_at = NOW()
WHERE slug = 'brunet-malaga';

-- DONNEGAL (donnegal-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'Donnegal es una escuela infantil de titularidad privada que cubre el primer ciclo, de 4 meses a 3 años, desde la calle Emilio Díaz, 45 (29014, Málaga).\n\nAparece entre los centros acogidos al Programa de Ayuda a las Familias, el programa que regula las bonificaciones del precio en el primer ciclo de infantil en Andalucía. Los servicios que ofrece no aparecen documentados en la fuente utilizada, así que aquí no se enumeran para no inducir a error.\n\nLa base de esta ficha es información pública, no facilitada por el centro. Para plazas, horario y precio actualizado, contacta con Donnegal.',
  updated_at = NOW()
WHERE slug = 'donnegal-malaga';

-- LAS PALMERAS (las-palmeras-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'El centro Las Palmeras tiene su sede en la calle Emilio Díaz, 57, código postal 29014 de Málaga. De carácter privado, se ocupa del primer ciclo de educación infantil: niños de 4 meses a 3 años.\n\nLa adhesión al Programa de Ayuda a las Familias es el dato económico más relevante que recoge la fuente oficial: gracias a ella, la cuota puede bonificarse según normativa. Aparte de los datos administrativos, no se ha podido verificar ninguna prestación concreta del centro. En el 0-3 la organización de la jornada varía notablemente entre centros: por eso el horario es una de las primeras preguntas que hacen las familias.\n\nDatos de origen público, revisables en cualquier momento. La forma más fiable de saber si hay plaza y a qué precio es preguntar directamente en el centro.',
  updated_at = NOW()
WHERE slug = 'las-palmeras-malaga';

-- MONTESSORI PUERTO (montessori-puerto-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'La avenida Manuel Rodríguez, 27, en el código postal 29190 de Málaga, acoge a Montessori Puerto, guardería privada autorizada para el primer ciclo de educación infantil (4 meses a 3 años).\n\nEstá incluido en el Programa de Ayuda a las Familias, con lo que el importe que abona la familia se calcula tras aplicar la bonificación autonómica que corresponda. Ni el comedor ni la flexibilidad horaria constan confirmados oficialmente, por lo que conviene preguntarlos antes de comparar precios. Todos los centros de primer ciclo autorizados deben cumplir requisitos de instalaciones y titulación del personal fijados por la normativa andaluza.\n\nPublicamos aquí solo lo verificable en fuentes públicas. Montessori Puerto puede ampliarlo con la información práctica: vacantes, horarios y cuotas del curso.',
  updated_at = NOW()
WHERE slug = 'montessori-puerto-malaga';

-- LA CASITA MÁGICA II (la-casita-magica-ii-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'La Casita Mágica II trabaja con bebés y niños pequeños, de 4 meses a 3 años, en la calle María de la Cruz, 1 (29010). Es uno de los centros privados de primer ciclo de educación infantil del municipio de Málaga.\n\nSegún los datos de la Consejería de Desarrollo Educativo, participa en el Programa de Ayuda a las Familias y, por tanto, sus plazas pueden acogerse a bonificación. La ausencia de datos sobre servicios en la fuente oficial impide describir aquí cómo se organiza la jornada en este centro.\n\nEsta ficha reúne información pública que conviene contrastar. Llama a La Casita Mágica II para confirmar plazas disponibles, franja horaria y tarifas.',
  updated_at = NOW()
WHERE slug = 'la-casita-magica-ii-malaga';

-- MAITENA II (maitena-ii-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'El local de Maitena II está en la calle Navas de Tolosa, 10, bajo 3-4, código postal 29016 de Málaga. Es una guardería privada dedicada al primer ciclo de educación infantil, la etapa previa al segundo ciclo (3-6 años), y atiende de 4 meses a 3 años.\n\nEl registro andaluz confirma su adhesión al Programa de Ayuda a las Familias, un detalle que conviene tener presente al comparar precios entre centros. No hay información pública que confirme servicios adicionales; esta ficha recoge solo lo que sí está documentado. Conviene recordar que, en el primer ciclo de infantil, la jornada se organiza en torno a rutinas de alimentación, descanso y juego, y que cada centro define su propio horario.\n\nLos datos provienen de fuentes públicas y pueden haber variado. Para resolver plazas, horarios y cuotas, lo práctico es contactar con el centro.',
  updated_at = NOW()
WHERE slug = 'maitena-ii-malaga';

-- MONTESSORI II (montessori-ii-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'Montessori II cubre en Málaga la etapa de 4 a 36 meses. Su local está en la calle Lorenzo Silva, 42, dentro del 29010, y su titularidad es privada.\n\nEs un centro acogido al Programa de Ayuda a las Familias, la herramienta con la que la Junta de Andalucía reduce el coste de la escolarización de 0 a 3 años. Los detalles operativos —qué incluye la cuota, qué horarios maneja, si hay cocina propia— no figuran en los datos consultados. En esta etapa, la incorporación suele plantearse de manera progresiva: el periodo de adaptación es una práctica habitual del 0-3 en Andalucía, con calendarios que fija cada escuela.\n\nToda la información recogida es de acceso público. Si Montessori II te encaja por ubicación, pregúntale por disponibilidad, horario y precio final.',
  updated_at = NOW()
WHERE slug = 'montessori-ii-malaga';

-- NANY (nany-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'Entre los centros de primer ciclo censados en Málaga capital figura Nany, con sede en la calle Diego de Vergara, 15 (29009). Es de titularidad privada y atiende de 4 meses a 3 años.\n\nSu inclusión en el Programa de Ayuda a las Familias permite que el precio del servicio educativo se bonifique con arreglo a la normativa autonómica. El listado autonómico no desglosa servicios por centro, así que ese nivel de detalle solo puede aportarlo el propio equipo.\n\nSe trata de una ficha basada en datos públicos, con las limitaciones que eso implica. El centro es la fuente adecuada para plazas, horarios y cuotas.',
  updated_at = NOW()
WHERE slug = 'nany-malaga';

-- COLORETE (colorete-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'Colorete abre en la calle Alcalde Nicolás Maroto, 11, en el código postal 29014 de Málaga, como centro privado de educación infantil de primer ciclo para niños de entre 4 meses y 3 años.\n\nLa documentación pública lo relaciona con el Programa de Ayuda a las Familias, de modo que la plaza puede salir más económica de lo que indica la tarifa base. Queda fuera de esta ficha todo lo relativo a servicios, porque ninguna fuente fiable los recoge para este centro. Las escuelas de 0-3 trabajan por grupos de edad con ratios reguladas por la administración andaluza, algo común a todos los centros autorizados.\n\nLa información aquí ofrecida tiene carácter orientativo y procede de fuentes públicas. Contacta con Colorete para conocer plazas, jornada y condiciones económicas.',
  updated_at = NOW()
WHERE slug = 'colorete-malaga';

-- PORTADA ALTA (portada-alta-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'La dirección de Portada Alta es la calle Corregidor Nicolás Isidro, 19, 29007 de Málaga. Se trata de una guardería privada que escolariza el primer ciclo de educación infantil, de 4 meses a 3 años.\n\nTrabaja dentro del Programa de Ayuda a las Familias de la Junta de Andalucía; el porcentaje de bonificación se determina en el proceso de solicitud. Más allá de ese dato, la fuente no detalla servicios concretos: comedor, ampliación de horario o actividades complementarias no aparecen confirmados. En Andalucía, la escolarización de 0 a 3 años se solicita curso a curso, y el calendario oficial marca los plazos de admisión de cada año.\n\nEstos contenidos se han redactado a partir de información pública. Para el detalle práctico —plaza, horario, cuota— habla con el centro.',
  updated_at = NOW()
WHERE slug = 'portada-alta-malaga';

-- SANTA PAULA (santa-paula-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'Santa Paula es un centro privado de primer ciclo de educación infantil del término municipal de Málaga. Está en la calle Francisco Pacheco, 9 (29004) y su alumnado va de los 4 meses a los 3 años.\n\nEstá adscrito al Programa de Ayuda a las Familias, por lo que la solicitud de bonificación forma parte habitual del trámite de matrícula en este centro. La misma fuente no describe servicios adicionales, de forma que cuestiones como la comida, el horario de tarde o el material incluido quedan sin verificar.\n\nFicha apoyada en fuentes públicas y sin datos aportados por el centro. Pregunta en Santa Paula por vacantes, horarios y precio antes de decidir.',
  updated_at = NOW()
WHERE slug = 'santa-paula-malaga';

-- SOLETE II (solete-ii-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'Desde la calle Atlántida, 3, en el código postal 29190 de Málaga, Solete II atiende a niños de 4 meses a 3 años como centro privado de educación infantil de primer ciclo.\n\nEl dato de adhesión al Programa de Ayuda a las Familias sí aparece en la fuente oficial: sus plazas admiten la bonificación autonómica del precio. No constan, en cambio, servicios confirmados de forma oficial: ni comedor, ni horario ampliado, ni ningún otro extra figuran documentados. Las aulas de esta etapa se agrupan habitualmente por tramos (menores de 1 año, 1-2 y 2-3), una organización común en los centros autorizados de Andalucía.\n\nLo publicado aquí proviene de registros abiertos. Solete II podrá confirmarte si quedan plazas, qué horario ofrece y cuál sería la cuota mensual.',
  updated_at = NOW()
WHERE slug = 'solete-ii-malaga';

-- SANTA MARÍA GORETTI (santa-maria-goretti-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'Santa María Goretti desarrolla su proyecto de primer ciclo de educación infantil en la calle Corregidor Paz y Guzmán, 13, dentro del 29006 de Málaga. Es privado y admite alumnado de 4 a 36 meses.\n\nLa Junta de Andalucía lo relaciona entre los centros del Programa de Ayuda a las Familias, cuyo objetivo es que el coste no sea una barrera para escolarizar en 0-3. Sobre el funcionamiento diario, la información pública se queda corta: no hay servicios verificados que podamos enumerar aquí. La etapa 0-3 combina cuidado y aprendizaje: hábitos, lenguaje, motricidad y juego forman el núcleo de la jornada en cualquier escuela infantil.\n\nDatos recopilados de fuentes públicas, que pueden no estar completos. Antes de solicitar plaza, contrasta horario y cuotas con el propio centro.',
  updated_at = NOW()
WHERE slug = 'santa-maria-goretti-malaga';

-- TITO JOSE II (tito-jose-ii-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'La avenida Jacinto Benavente, 1- bajo derecha es la ubicación de Tito Jose II, una guardería privada del código postal 29014 de Málaga especializada en el primer ciclo de educación infantil (4 meses a 3 años).\n\nParticipa del sistema andaluz de bonificaciones a través del Programa de Ayuda a las Familias, que ajusta el precio de la plaza a la situación económica del hogar. Lo que no recoge el registro es el detalle de servicios: comedor, entrada temprana o actividades adicionales no están confirmados en fuente oficial.\n\nEsta página se nutre de información pública. Para saber con certeza plazas, horarios y precios, la vía directa es el teléfono del centro.',
  updated_at = NOW()
WHERE slug = 'tito-jose-ii-malaga';

-- SAN PATRICIO (san-patricio-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'San Patricio forma parte del listado de centros de primer ciclo de educación infantil de la Junta de Andalucía. Se ubica en la calle Abogado Federico Orellana Teledano, 7, 29003 de Málaga, y es de titularidad privada, con plazas de 4 meses a 3 años.\n\nEl centro consta acogido al Programa de Ayuda a las Familias, con la consiguiente rebaja del precio del servicio educativo para quienes cumplan los requisitos. El apartado de servicios permanece vacío en los datos consultados, así que preferimos no atribuir al centro prestaciones que no podemos verificar. En este tramo educativo, cada escuela concreta su propuesta pedagógica dentro del marco curricular que fija la administración autonómica.\n\nEl origen de estos datos es público y su exactitud puede variar. Consulta con San Patricio la disponibilidad de plaza, el horario y las cuotas vigentes.',
  updated_at = NOW()
WHERE slug = 'san-patricio-malaga';

-- LUCERITO (lucerito-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'Con local en la calle Mendoza, 24-26 (29003), Lucerito atiende en Málaga a niños de 4 meses a 3 años. Es un centro privado de educación infantil de primer ciclo.\n\nSu adhesión al Programa de Ayuda a las Familias está recogida en la fuente oficial, lo que sitúa este centro dentro del circuito de plazas bonificadas de Andalucía. Ninguna fuente oficial detalla su oferta de servicios, por lo que no afirmamos que disponga de comedor, horario ampliado ni actividades complementarias. El primer ciclo andaluz funciona con solicitud anual y baremo, y la bonificación del precio se resuelve dentro de ese mismo procedimiento.\n\nFicha generada con datos públicos disponibles. Cualquier detalle sobre plazas, horario o precio conviene confirmarlo con el equipo del centro.',
  updated_at = NOW()
WHERE slug = 'lucerito-malaga';

-- GUGULANDIA (gugulandia-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'Gugulandia es una guardería privada malagueña del primer ciclo de educación infantil. Su sede está en la calle Arganda, 60, código postal 29002, y su alumnado tiene entre 4 meses y 3 años.\n\nSe encuentra dentro del Programa de Ayuda a las Familias, el marco autonómico que fija las bonificaciones aplicables al precio del primer ciclo de infantil. Los datos disponibles no especifican qué servicios presta, de modo que ese apartado queda pendiente de confirmación con el propio centro.\n\nAquí solo aparece lo que consta en fuentes públicas. Si necesitas saber si hay hueco, en qué horario y a qué precio, pregunta a Gugulandia.',
  updated_at = NOW()
WHERE slug = 'gugulandia-malaga';

-- EL GLOBO AZUL (el-globo-azul-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'En la calle Rafael María de Labra, 3, edificio Padre Manjón (29007, Málaga) se encuentra El Globo Azul, centro privado que cubre la etapa 0-3 escolarizando a niños desde los 4 meses hasta los 3 años.\n\nEn la relación de la Junta de Andalucía figura acogido al Programa de Ayuda a las Familias; esa condición es la que habilita las bonificaciones del precio. Del resto de aspectos prácticos —alimentación, horarios, materiales— no hay constancia documental en las fuentes revisadas. En 0-3, aspectos como el número de educadoras por aula o el espacio exterior suelen pesar en la decisión familiar; son datos que se comprueban en la visita.\n\nLa información expuesta procede de fuentes de acceso libre. Para plazas, horarios y cuotas actualizadas, contacta con el centro sin intermediarios.',
  updated_at = NOW()
WHERE slug = 'el-globo-azul-malaga';

-- CHURRIANETE (churrianete-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'Churrianete atiende a familias del 29140 de Málaga desde la calle Jilguero, 4. Es un centro privado de primer ciclo de educación infantil con plazas para niños de 4 a 36 meses.\n\nEste centro participa en el Programa de Ayuda a las Familias, de forma que la cuota final depende del tramo de bonificación que reconozca la administración. En cuanto a servicios, la ficha oficial no aporta detalle alguno; lo prudente es preguntar y no dar nada por supuesto. Las escuelas de primer ciclo suelen abrir en septiembre con el curso escolar, aunque muchas admiten incorporaciones a lo largo del año si hay plaza.\n\nRedactamos esta ficha con datos públicos y sin verificación del centro. Churrianete puede aclararte disponibilidad, horarios y condiciones de pago.',
  updated_at = NOW()
WHERE slug = 'churrianete-malaga';

-- OHANA (ohana-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'El primer ciclo de educación infantil es el ámbito de Ohana, guardería privada situada en la avenida Juan Sebastián Elcano, 29, código postal 29017 de Málaga, que trabaja con niños de 4 meses a 3 años.\n\nEl expediente público lo vincula al Programa de Ayuda a las Familias, un aspecto que conviene confirmar al solicitar plaza porque condiciona el precio final. No hemos localizado información oficial sobre comedor, jornada ampliada o actividades, así que ese apartado aparece vacío en esta ficha.\n\nComo los datos son públicos, pueden quedarse cortos. Lo mejor es llamar a Ohana y preguntar por plazas, horario y cuota del curso en marcha.',
  updated_at = NOW()
WHERE slug = 'ohana-malaga';

-- HOLA DON PEPITO (hola-don-pepito-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'Hola Don Pepito es un centro infantil privado de Málaga capital. Ocupa la calle Ibrahim, 9, en el 29010, y atiende el tramo de 4 meses a 3 años del primer ciclo de educación infantil.\n\nSu condición de centro acogido al Programa de Ayuda a las Familias permite tramitar la bonificación del precio del servicio educativo ante la Junta de Andalucía. La fuente consultada no confirma servicios complementarios, un dato que solo el centro puede completar con precisión. El acceso a este ciclo se regula por convocatoria autonómica, con plazos de solicitud y adjudicación publicados cada curso por la Junta de Andalucía.\n\nEsta ficha recoge información pública sobre el centro. Plazas, horarios y cuotas son cuestiones que conviene tratar directamente con Hola Don Pepito.',
  updated_at = NOW()
WHERE slug = 'hola-don-pepito-malaga';

-- CASA DE NIÑOS Y NIÑAS - LA CASITA I (casa-de-ninos-y-ninas-la-casita-i-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'Ubicado en la calle Gómez de Salazar, 13 Bajo, edificio Melgarejo, código postal 29013 de Málaga, Casa de niños y niñas - La Casita I es un centro privado autorizado para impartir el primer ciclo de educación infantil a niños de 4 meses a 3 años.\n\nLa fuente autonómica lo identifica como centro del Programa de Ayuda a las Familias, con acceso a las bonificaciones que regula la normativa vigente. Sobre servicios concretos no hay respaldo documental, por lo que esta ficha se limita a los datos administrativos verificados. En el 0-3 la organización de la jornada varía notablemente entre centros: por eso el horario es una de las primeras preguntas que hacen las familias.\n\nLos contenidos parten de fuentes públicas y pueden estar desactualizados. Contacta con el centro para conocer vacantes, jornada y tarifas.',
  updated_at = NOW()
WHERE slug = 'casa-de-ninos-y-ninas-la-casita-i-malaga';

-- SANTA TERESA (santa-teresa-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'Santa Teresa atiende la etapa 0-3 en Málaga desde la calle Arlanza, 7, barriada La Palma (29011). Es una escuela infantil de titularidad privada, con alumnado de 4 meses a 3 años.\n\nAl figurar en el Programa de Ayuda a las Familias, las familias pueden solicitar que se aplique la bonificación autonómica sobre el precio de la plaza. El registro no incluye información sobre comedor ni sobre ampliación horaria, de manera que esos puntos quedan abiertos.\n\nInformación de procedencia pública, ofrecida para ayudarte a comparar. Para plazas, horarios y precios, dirígete a Santa Teresa.',
  updated_at = NOW()
WHERE slug = 'santa-teresa-malaga';

-- BABY 2 (baby-2-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'La calle Nuestra Señora de las Candelas, 8, esquina calle Canillas del Aceituno, 5, código postal 29004 de Málaga, alberga Baby 2: un centro privado de educación infantil de primer ciclo para niños de 4 a 36 meses.\n\nEstá entre los centros que trabajan con el Programa de Ayuda a las Familias, el sistema andaluz de ayuda al pago de la escolarización de 0 a 3 años. Falta, sin embargo, la información de servicios: no hay fuente oficial que confirme comedor, horario extendido u otras prestaciones. La etapa anterior al segundo ciclo (3-6 años) se caracteriza por grupos reducidos y por una atención muy centrada en los cuidados básicos.\n\nEsta descripción se ha construido con datos públicos. Antes de matricular, confirma con el centro las plazas libres, el horario y la cuota final.',
  updated_at = NOW()
WHERE slug = 'baby-2-malaga';

-- PAHITI (pahiti-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'Pahiti es una de las guarderías privadas registradas en Málaga capital. Atiende a niños de 4 meses a 3 años en el paseo de la Salud, 14-18, código postal 29010.\n\nEl registro de primer ciclo lo marca como participante en el Programa de Ayuda a las Familias, dato que influye directamente en el coste mensual para la familia. Los servicios que ofrece no aparecen documentados en la fuente utilizada, así que aquí no se enumeran para no inducir a error. Conviene recordar que, en el primer ciclo de infantil, la jornada se organiza en torno a rutinas de alimentación, descanso y juego, y que cada centro define su propio horario.\n\nLos datos que ves proceden de fuentes públicas y no han sido validados por el centro. Pregunta a Pahiti por disponibilidad, horarios y coste.',
  updated_at = NOW()
WHERE slug = 'pahiti-malaga';

-- PEQUEÑO AVIÓN (pequeno-avion-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'En el código postal 29004 de Málaga, Pequeño Avión presta servicio de primer ciclo de educación infantil desde la plaza Valentín Ortigosa, 13-14. La titularidad es privada y las edades atendidas van de 4 meses a 3 años.\n\nSe integra en el Programa de Ayuda a las Familias de la Junta de Andalucía, lo que se traduce en un precio bonificado para las familias que cumplan el baremo. Aparte de los datos administrativos, no se ha podido verificar ninguna prestación concreta del centro.\n\nFicha basada en registros públicos. Si te interesa esta ubicación, contacta con el centro para conocer plazas, horario y condiciones económicas.',
  updated_at = NOW()
WHERE slug = 'pequeno-avion-malaga';

-- LA COMETA BLANCA (la-cometa-blanca-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'La Cometa Blanca escolariza a niños de 4 meses a 3 años en la avenida de Europa, 53, 29003 de Málaga. Es un centro privado del primer ciclo de educación infantil.\n\nSu participación en el Programa de Ayuda a las Familias queda reflejada en los datos abiertos de la Junta, junto con la posibilidad de bonificar el precio del servicio. Ni el comedor ni la flexibilidad horaria constan confirmados oficialmente, por lo que conviene preguntarlos antes de comparar precios. El primer ciclo de educación infantil no es obligatorio, y las plazas y precios varían mucho de un centro a otro dentro de la misma ciudad.\n\nLa información publicada es de origen público y puede completarse. La Cometa Blanca es quien mejor puede explicarte plazas, horarios y cuotas.',
  updated_at = NOW()
WHERE slug = 'la-cometa-blanca-malaga';

-- SAGRADA FAMILIA (sagrada-familia-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'El centro privado Sagrada Familia desarrolla el primer ciclo de educación infantil en Málaga, en la avenida Ramón y Cajal, 39 (código postal 29014), con plazas para niños de entre 4 meses y 3 años.\n\nEl registro de la Junta de Andalucía lo señala como centro participante en el Programa de Ayuda a las Familias, la vía por la que se bonifica el precio del servicio educativo de 0-3. La ausencia de datos sobre servicios en la fuente oficial impide describir aquí cómo se organiza la jornada en este centro. Las escuelas de 0-3 trabajan por grupos de edad con ratios reguladas por la administración andaluza, algo común a todos los centros autorizados.\n\nRecogemos datos públicos que pueden no estar actualizados. Para plazas del curso, horario y precio, lo aconsejable es hablar con el centro.',
  updated_at = NOW()
WHERE slug = 'sagrada-familia-malaga';

-- LA CASITA DE PEPA (la-casita-de-pepa-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'La Casita de Pepa tiene su actividad en la avenida Gregorio Diego, Local 50, en el 29004 de Málaga. Es una guardería de titularidad privada que cubre la etapa de 4 a 36 meses.\n\nEntre los datos oficiales consta su participación en el Programa de Ayuda a las Familias, el instrumento con el que la Junta de Andalucía rebaja el coste de la plaza a las familias que cumplen los requisitos. No hay información pública que confirme servicios adicionales; esta ficha recoge solo lo que sí está documentado.\n\nEsta ficha parte de fuentes públicas y se ofrece como punto de partida. Confirma con La Casita de Pepa la disponibilidad de plaza, el horario y la cuota mensual.',
  updated_at = NOW()
WHERE slug = 'la-casita-de-pepa-malaga';

-- EL RINCONCITO DE ATALAYA (el-rinconcito-de-atalaya-malaga) [privado, no adherido]
UPDATE centers SET
  long_description = E'En Málaga capital, la avenida Editor Ángel Caffarena, 28 (29010) es la sede de El Rinconcito de Atalaya, centro privado dedicado al primer ciclo de educación infantil para niños de 4 meses a 3 años.\n\nLos datos abiertos consultados no recogen su participación en el Programa de Ayuda a las Familias; el precio, por tanto, se rige por las condiciones que fije el propio centro. Los detalles operativos —qué incluye la cuota, qué horarios maneja, si hay cocina propia— no figuran en los datos consultados. En el primer ciclo, el vínculo con la familia y la comunicación diaria pesan tanto como la propuesta de actividades; es una característica compartida por toda la etapa.\n\nLa información de esta ficha se ha compuesto con datos de acceso público y puede quedar desfasada. Para plazas libres, horario real y cuotas del curso, lo más seguro es hablar con El Rinconcito de Atalaya.',
  updated_at = NOW()
WHERE slug = 'el-rinconcito-de-atalaya-malaga';

-- BRINCA 3 (brinca-3-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'Brinca 3 es un centro privado del primer ciclo de educación infantil que atiende a niños de 4 meses a 3 años. Se encuentra en la calle Rodríguez de Ledesma, s/n, código postal 29010 de Málaga.\n\nParticipa en el Programa de Ayuda a las Familias de la Junta de Andalucía, el mecanismo autonómico que rebaja el precio de la plaza de primer ciclo según la situación de cada unidad familiar. El listado autonómico no desglosa servicios por centro, así que ese nivel de detalle solo puede aportarlo el propio equipo. Las aulas de esta etapa se agrupan habitualmente por tramos (menores de 1 año, 1-2 y 2-3), una organización común en los centros autorizados de Andalucía.\n\nTodo lo anterior procede de fuentes públicas, que no siempre están al día. Antes de decidir, llama a Brinca 3 y pregunta por disponibilidad, horarios y precio final.',
  updated_at = NOW()
WHERE slug = 'brinca-3-malaga';

-- VICTORIA ELENA II (victoria-elena-ii-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'Con sede en la calle España, 20, dentro del código postal 29017 de Málaga, Victoria Elena II trabaja la etapa 0-3 como centro de titularidad privada, con alumnado de 4 a 36 meses.\n\nSe acoge al Programa de Ayuda a las Familias, con lo que la tarifa del servicio educativo puede bonificarse de acuerdo con la normativa andaluza en vigor. Queda fuera de esta ficha todo lo relativo a servicios, porque ninguna fuente fiable los recoge para este centro.\n\nEstos datos salen de registros públicos y pueden estar incompletos; el propio centro es quien puede confirmar plazas, calendario y cuotas actualizadas.',
  updated_at = NOW()
WHERE slug = 'victoria-elena-ii-malaga';

-- EL COLE DE SILVIA (el-cole-de-silvia-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'El Cole de Silvia aparece en el registro de centros de primer ciclo de educación infantil de Andalucía con domicilio en la calle Alfarnate, 14 (29006, Málaga). Es privado y atiende de 4 meses a 3 años.\n\nLa fuente oficial lo incluye entre los centros que participan en el Programa de Ayuda a las Familias; esa adhesión es la que abre el acceso a las bonificaciones autonómicas del precio. Más allá de ese dato, la fuente no detalla servicios concretos: comedor, ampliación de horario o actividades complementarias no aparecen confirmados. Como en el resto de centros del primer ciclo, la matrícula depende de las plazas libres por edad, que cambian cada curso.\n\nEsta ficha se apoya en información pública. Si te interesa El Cole de Silvia, contacta directamente para conocer las plazas disponibles, el horario y las condiciones económicas.',
  updated_at = NOW()
WHERE slug = 'el-cole-de-silvia-malaga';

-- VIVALDI (vivaldi-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'El día a día de Vivaldi transcurre en la calle María Tubau, 25, código postal 29014 de Málaga. Es una guardería privada de primer ciclo de educación infantil para niños de 4 meses a 3 años.\n\nSu nombre aparece en la relación de centros acogidos al Programa de Ayuda a las Familias, el sistema con el que Andalucía subvenciona parte del coste de la escolarización 0-3. La misma fuente no describe servicios adicionales, de forma que cuestiones como la comida, el horario de tarde o el material incluido quedan sin verificar. En este tramo educativo, cada escuela concreta su propuesta pedagógica dentro del marco curricular que fija la administración autonómica.\n\nLos datos aquí reunidos tienen origen público y no sustituyen a la información del centro: pregunta en Vivaldi por plazas, horarios y cuotas antes de matricular.',
  updated_at = NOW()
WHERE slug = 'vivaldi-malaga';

-- VILLA MARÍA (villa-maria-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'Villa María es una guardería privada de Málaga que trabaja el primer ciclo de educación infantil en la calle Pedro de Quejana, 15, dentro del código postal 29012. Sus aulas se dirigen a niños de 4 meses a 3 años.\n\nConsta dentro del Programa de Ayuda a las Familias, por lo que las familias con derecho pueden ver reducido el importe mensual según el baremo de la Junta de Andalucía. No constan, en cambio, servicios confirmados de forma oficial: ni comedor, ni horario ampliado, ni ningún otro extra figuran documentados.\n\nComo esta información procede de fuentes abiertas, puede haber cambiado. Una llamada a Villa María resolverá las dudas sobre disponibilidad, jornada y precio.',
  updated_at = NOW()
WHERE slug = 'villa-maria-malaga';

-- ELVIRA LINDO (elvira-lindo-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'La calle Charles Dickens, s/n, esquina calle Pablo Bruna (29010) es el domicilio de Elvira Lindo, centro malagueño de titularidad privada dedicado al primer ciclo de educación infantil, la etapa que abarca de los 4 meses a los 3 años.\n\nEstá incorporado al Programa de Ayuda a las Familias, la fórmula por la que la administración andaluza asume una parte del precio del servicio educativo. Sobre el funcionamiento diario, la información pública se queda corta: no hay servicios verificados que podamos enumerar aquí. Es propio de la etapa que las familias visiten el centro antes de decidir: ver el aula y hablar con el equipo aporta más que cualquier ficha.\n\nEl contenido de esta página se basa en registros públicos. Para saber si hay plaza, qué horario maneja el centro y cuánto cuesta, conviene preguntar directamente.',
  updated_at = NOW()
WHERE slug = 'elvira-lindo-malaga';

-- LA TORRETA (la-torreta-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'En la calle Batanes, 3, dentro del 29190 de Málaga, La Torreta desarrolla su labor como escuela infantil privada de primer ciclo para niños de entre 4 meses y 3 años.\n\nLos datos abiertos de la Junta lo recogen como centro acogido al Programa de Ayuda a las Familias, con la bonificación del precio que esa adhesión conlleva. Lo que no recoge el registro es el detalle de servicios: comedor, entrada temprana o actividades adicionales no están confirmados en fuente oficial. En 0-3, aspectos como el número de educadoras por aula o el espacio exterior suelen pesar en la decisión familiar; son datos que se comprueban en la visita.\n\nFicha construida con datos públicos, sujetos a cambios de un curso a otro. La Torreta puede confirmarte plazas, horarios y cuotas con exactitud.',
  updated_at = NOW()
WHERE slug = 'la-torreta-malaga';

-- EL PLANETA DE LULÚ (el-planeta-de-lulu-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'El planeta de Lulú atiende el tramo de 4 a 36 meses en la calle Chaparral, 38, en el código postal 29196 de Málaga. Es un centro de titularidad privada del primer ciclo de educación infantil.\n\nSu ficha oficial lo asocia al Programa de Ayuda a las Familias; la cuantía finalmente bonificada depende de la renta y de la composición de cada familia. El apartado de servicios permanece vacío en los datos consultados, así que preferimos no atribuir al centro prestaciones que no podemos verificar.\n\nLa procedencia de estos datos es pública, de modo que pueden faltar detalles. Contacta con el centro para cerrar los aspectos prácticos: plaza, horario y precio.',
  updated_at = NOW()
WHERE slug = 'el-planeta-de-lulu-malaga';

-- GIBRALFARO (gibralfaro-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'Con dirección en el paseo de Sancha, 43 (29016, Málaga), Gibralfaro escolariza el primer ciclo de educación infantil como centro privado, desde los 4 meses hasta los 3 años.\n\nForma parte del conjunto de centros acogidos al Programa de Ayuda a las Familias de la Junta de Andalucía, lo que permite solicitar la bonificación del precio de la plaza. Ninguna fuente oficial detalla su oferta de servicios, por lo que no afirmamos que disponga de comedor, horario ampliado ni actividades complementarias. En esta franja de edad, el proyecto educativo se apoya en rutinas estables y en el acompañamiento individual de cada niño, algo transversal a toda la etapa.\n\nRecogemos aquí lo que consta en fuentes públicas. Lo demás —plazas del curso, horarios concretos, cuotas— hay que consultarlo con Gibralfaro.',
  updated_at = NOW()
WHERE slug = 'gibralfaro-malaga';

-- MAITENA III (maitena-iii-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'El censo andaluz de centros de primer ciclo incluye a Maitena III, guardería privada de Málaga instalada en la calle Paco Miranda, 5, esquina calle Gordon (29013) y dirigida a niños de 4 meses a 3 años.\n\nAl participar en el Programa de Ayuda a las Familias, admite la tramitación de las bonificaciones autonómicas sobre el precio del servicio educativo. Los datos disponibles no especifican qué servicios presta, de modo que ese apartado queda pendiente de confirmación con el propio centro. El acceso a este ciclo se regula por convocatoria autonómica, con plazos de solicitud y adjudicación publicados cada curso por la Junta de Andalucía.\n\nEsta información es de origen público y puede no reflejar la situación actual del centro. Pregunta en Maitena III por vacantes, jornada y tarifas.',
  updated_at = NOW()
WHERE slug = 'maitena-iii-malaga';

-- COLORETE II - SAN JOSÉ (colorete-ii-san-jose-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'Colorete II - San José funciona como escuela infantil privada en el camino de Casabermeja, 104, urbanización San José, código postal 29014 de Málaga, y cubre la franja de edad que va de los 4 meses a los 3 años.\n\nEl listado oficial lo marca como adherido al Programa de Ayuda a las Familias, la ayuda con la que la Junta de Andalucía abarata la plaza de primer ciclo. Del resto de aspectos prácticos —alimentación, horarios, materiales— no hay constancia documental en las fuentes revisadas.\n\nLos datos mostrados proceden de fuentes abiertas y se ofrecen a título informativo. Para plazas, horarios y cuotas, dirígete al centro.',
  updated_at = NOW()
WHERE slug = 'colorete-ii-san-jose-malaga';

-- PARQUE SEGOVIA (parque-segovia-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'A la altura de la calle Budapest, parcela R-8, Hacienda Segovia, en el 29590 malagueño, se localiza Parque Segovia: un centro privado de primer ciclo de educación infantil para pequeños de 4 meses a 3 años.\n\nCuenta con adhesión al Programa de Ayuda a las Familias, de manera que buena parte de las familias puede acceder a un precio bonificado según el baremo autonómico. En cuanto a servicios, la ficha oficial no aporta detalle alguno; lo prudente es preguntar y no dar nada por supuesto. Todos los centros de primer ciclo autorizados deben cumplir requisitos de instalaciones y titulación del personal fijados por la normativa andaluza.\n\nFicha elaborada con información pública. Si estás valorando Parque Segovia, pide cita o llama para conocer plazas libres, horario y coste mensual.',
  updated_at = NOW()
WHERE slug = 'parque-segovia-malaga';

-- DON MICKEY II (don-mickey-ii-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'Don Mickey II es un centro de educación infantil de primer ciclo y gestión privada, con sede en la calle Decano López Arjona, 15 (29140), en la ciudad de Málaga. Acoge a niños desde los 4 meses hasta los 3 años.\n\nAparece entre los centros acogidos al Programa de Ayuda a las Familias, el programa que regula las bonificaciones del precio en el primer ciclo de infantil en Andalucía. No hemos localizado información oficial sobre comedor, jornada ampliada o actividades, así que ese apartado aparece vacío en esta ficha. La etapa anterior al segundo ciclo (3-6 años) se caracteriza por grupos reducidos y por una atención muy centrada en los cuidados básicos.\n\nEl contenido procede de registros públicos y puede estar incompleto. El equipo de Don Mickey II podrá detallarte disponibilidad, horarios y condiciones económicas.',
  updated_at = NOW()
WHERE slug = 'don-mickey-ii-malaga';

-- MIS LUCERITOS (mis-luceritos-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'La actividad de Mis Luceritos se desarrolla en el carril del Conde, 29, barriada de la Luz, código postal 29004 de Málaga. Hablamos de una guardería privada del primer ciclo de infantil, pensada para la franja de 4 a 36 meses.\n\nLa adhesión al Programa de Ayuda a las Familias es el dato económico más relevante que recoge la fuente oficial: gracias a ella, la cuota puede bonificarse según normativa. La fuente consultada no confirma servicios complementarios, un dato que solo el centro puede completar con precisión.\n\nEsta descripción parte de datos públicos. Antes de dar ningún paso, confirma con el centro las plazas, el horario de apertura y la cuota que te correspondería.',
  updated_at = NOW()
WHERE slug = 'mis-luceritos-malaga';

-- CUCO TEATINOS (cuco-teatinos-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'Dentro del mapa de guarderías de Málaga capital, Cuco Teatinos ocupa el bulevar Louis Pasteur, 11 (29010). Es un centro privado de primer ciclo de educación infantil que atiende de los 4 meses a los 3 años.\n\nEstá incluido en el Programa de Ayuda a las Familias, con lo que el importe que abona la familia se calcula tras aplicar la bonificación autonómica que corresponda. Sobre servicios concretos no hay respaldo documental, por lo que esta ficha se limita a los datos administrativos verificados. En esta etapa, la incorporación suele plantearse de manera progresiva: el periodo de adaptación es una práctica habitual del 0-3 en Andalucía, con calendarios que fija cada escuela.\n\nLa base de esta ficha es información pública, no facilitada por el centro. Para plazas, horario y precio actualizado, contacta con Cuco Teatinos.',
  updated_at = NOW()
WHERE slug = 'cuco-teatinos-malaga';

-- PEKESUR (pekesur-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'Pekesur presta servicio educativo a niños de 4 meses a 3 años en la calle Maese Nicolás, 15, dentro del código postal 29014 de Málaga, con titularidad privada y autorización para el primer ciclo de infantil.\n\nSegún los datos de la Consejería de Desarrollo Educativo, participa en el Programa de Ayuda a las Familias y, por tanto, sus plazas pueden acogerse a bonificación. El registro no incluye información sobre comedor ni sobre ampliación horaria, de manera que esos puntos quedan abiertos. El primer ciclo de educación infantil no es obligatorio, y las plazas y precios varían mucho de un centro a otro dentro de la misma ciudad.\n\nDatos de origen público, revisables en cualquier momento. La forma más fiable de saber si hay plaza y a qué precio es preguntar directamente en el centro.',
  updated_at = NOW()
WHERE slug = 'pekesur-malaga';

-- EL PALACIO DEL BEBÉ (el-palacio-del-bebe-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'Quien busque plaza de 0-3 en el entorno del 29004 de Málaga encontrará El Palacio del Bebé en la calle Villanueva de Algaidas, s/n. Es una guardería privada que atiende a niños de 4 meses a 3 años.\n\nEl registro andaluz confirma su adhesión al Programa de Ayuda a las Familias, un detalle que conviene tener presente al comparar precios entre centros. Falta, sin embargo, la información de servicios: no hay fuente oficial que confirme comedor, horario extendido u otras prestaciones.\n\nPublicamos aquí solo lo verificable en fuentes públicas. El Palacio del Bebé puede ampliarlo con la información práctica: vacantes, horarios y cuotas del curso.',
  updated_at = NOW()
WHERE slug = 'el-palacio-del-bebe-malaga';

-- ABUELA PURI (abuela-puri-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'Abuela Puri pertenece a la red de centros privados de primer ciclo de educación infantil de Málaga. Su dirección es la calle Gaucín y calle Sierra Bermeja, 2, código postal 29003, y trabaja con niños de 4 a 36 meses.\n\nEs un centro acogido al Programa de Ayuda a las Familias, la herramienta con la que la Junta de Andalucía reduce el coste de la escolarización de 0 a 3 años. Los servicios que ofrece no aparecen documentados en la fuente utilizada, así que aquí no se enumeran para no inducir a error. En Andalucía, la escolarización de 0 a 3 años se solicita curso a curso, y el calendario oficial marca los plazos de admisión de cada año.\n\nEsta ficha reúne información pública que conviene contrastar. Llama a Abuela Puri para confirmar plazas disponibles, franja horaria y tarifas.',
  updated_at = NOW()
WHERE slug = 'abuela-puri-malaga';

-- MAYPI (maypi-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'En pleno 29190 de Málaga, concretamente en el camino del Orozco, 13, Maypi ofrece plazas de primer ciclo de educación infantil para niños de 4 meses a 3 años. Su titularidad es privada.\n\nSu inclusión en el Programa de Ayuda a las Familias permite que el precio del servicio educativo se bonifique con arreglo a la normativa autonómica. Aparte de los datos administrativos, no se ha podido verificar ninguna prestación concreta del centro. En el primer ciclo, el vínculo con la familia y la comunicación diaria pesan tanto como la propuesta de actividades; es una característica compartida por toda la etapa.\n\nLos datos provienen de fuentes públicas y pueden haber variado. Para resolver plazas, horarios y cuotas, lo práctico es contactar con el centro.',
  updated_at = NOW()
WHERE slug = 'maypi-malaga';

-- MONTESSORI I (montessori-i-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'Montessori I es una escuela infantil de titularidad privada que cubre el primer ciclo, de 4 meses a 3 años, desde la calle González Anaya, 6 (29009, Málaga).\n\nLa documentación pública lo relaciona con el Programa de Ayuda a las Familias, de modo que la plaza puede salir más económica de lo que indica la tarifa base. Ni el comedor ni la flexibilidad horaria constan confirmados oficialmente, por lo que conviene preguntarlos antes de comparar precios.\n\nToda la información recogida es de acceso público. Si Montessori I te encaja por ubicación, pregúntale por disponibilidad, horario y precio final.',
  updated_at = NOW()
WHERE slug = 'montessori-i-malaga';

-- GARABATO 1 (garabato-1-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'El centro Garabato 1 tiene su sede en la calle Jane Bowles, 2, local 2A, código postal 29011 de Málaga. De carácter privado, se ocupa del primer ciclo de educación infantil: niños de 4 meses a 3 años.\n\nTrabaja dentro del Programa de Ayuda a las Familias de la Junta de Andalucía; el porcentaje de bonificación se determina en el proceso de solicitud. La ausencia de datos sobre servicios en la fuente oficial impide describir aquí cómo se organiza la jornada en este centro. La etapa 0-3 combina cuidado y aprendizaje: hábitos, lenguaje, motricidad y juego forman el núcleo de la jornada en cualquier escuela infantil.\n\nSe trata de una ficha basada en datos públicos, con las limitaciones que eso implica. El centro es la fuente adecuada para plazas, horarios y cuotas.',
  updated_at = NOW()
WHERE slug = 'garabato-1-malaga';

-- GARABATO 2 (garabato-2-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'La calle Jane Bowles, 2, local 2B, en el código postal 29011 de Málaga, acoge a Garabato 2, guardería privada autorizada para el primer ciclo de educación infantil (4 meses a 3 años).\n\nEstá adscrito al Programa de Ayuda a las Familias, por lo que la solicitud de bonificación forma parte habitual del trámite de matrícula en este centro. No hay información pública que confirme servicios adicionales; esta ficha recoge solo lo que sí está documentado. Como en el resto de centros del primer ciclo, la matrícula depende de las plazas libres por edad, que cambian cada curso.\n\nLa información aquí ofrecida tiene carácter orientativo y procede de fuentes públicas. Contacta con Garabato 2 para conocer plazas, jornada y condiciones económicas.',
  updated_at = NOW()
WHERE slug = 'garabato-2-malaga';

-- CARACOLA ANTONIO MACHADO (caracola-antonio-machado-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'Caracola Antonio Machado trabaja con bebés y niños pequeños, de 4 meses a 3 años, en la avenida Sor Teresa Prat, 69 (29004). Es uno de los centros privados de primer ciclo de educación infantil del municipio de Málaga.\n\nEl dato de adhesión al Programa de Ayuda a las Familias sí aparece en la fuente oficial: sus plazas admiten la bonificación autonómica del precio. Los detalles operativos —qué incluye la cuota, qué horarios maneja, si hay cocina propia— no figuran en los datos consultados.\n\nEstos contenidos se han redactado a partir de información pública. Para el detalle práctico —plaza, horario, cuota— habla con el centro.',
  updated_at = NOW()
WHERE slug = 'caracola-antonio-machado-malaga';

-- PIRULETA II (piruleta-ii-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'El local de Piruleta II está en la calle Parras, 39, bajo, esquina con calle Cruz del Molinillo, código postal 29012 de Málaga. Es una guardería privada dedicada al primer ciclo de educación infantil, la etapa previa al segundo ciclo (3-6 años), y atiende de 4 meses a 3 años.\n\nLa Junta de Andalucía lo relaciona entre los centros del Programa de Ayuda a las Familias, cuyo objetivo es que el coste no sea una barrera para escolarizar en 0-3. El listado autonómico no desglosa servicios por centro, así que ese nivel de detalle solo puede aportarlo el propio equipo. El primer ciclo andaluz funciona con solicitud anual y baremo, y la bonificación del precio se resuelve dentro de ese mismo procedimiento.\n\nFicha apoyada en fuentes públicas y sin datos aportados por el centro. Pregunta en Piruleta II por vacantes, horarios y precio antes de decidir.',
  updated_at = NOW()
WHERE slug = 'piruleta-ii-malaga';

-- BANAPI (banapi-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'Banapi cubre en Málaga la etapa de 4 a 36 meses. Su local está en la calle Orfila, 10 Bajo, dentro del 29002, y su titularidad es privada.\n\nParticipa del sistema andaluz de bonificaciones a través del Programa de Ayuda a las Familias, que ajusta el precio de la plaza a la situación económica del hogar. Queda fuera de esta ficha todo lo relativo a servicios, porque ninguna fuente fiable los recoge para este centro. Es propio de la etapa que las familias visiten el centro antes de decidir: ver el aula y hablar con el equipo aporta más que cualquier ficha.\n\nLo publicado aquí proviene de registros abiertos. Banapi podrá confirmarte si quedan plazas, qué horario ofrece y cuál sería la cuota mensual.',
  updated_at = NOW()
WHERE slug = 'banapi-malaga';

-- 5 CHUPETES (5-chupetes-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'Entre los centros de primer ciclo censados en Málaga capital figura 5 Chupetes, con sede en la avenida Imperio Argentina, 4 (29004). Es de titularidad privada y atiende de 4 meses a 3 años.\n\nEl centro consta acogido al Programa de Ayuda a las Familias, con la consiguiente rebaja del precio del servicio educativo para quienes cumplan los requisitos. Más allá de ese dato, la fuente no detalla servicios concretos: comedor, ampliación de horario o actividades complementarias no aparecen confirmados.\n\nDatos recopilados de fuentes públicas, que pueden no estar completos. Antes de solicitar plaza, contrasta horario y cuotas con el propio centro.',
  updated_at = NOW()
WHERE slug = '5-chupetes-malaga';

-- 26 DE FEBRERO (26-de-febrero-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'26 de febrero abre en la calle Francisco Carter, 6, en el código postal 29011 de Málaga, como centro privado de educación infantil de primer ciclo para niños de entre 4 meses y 3 años.\n\nSu adhesión al Programa de Ayuda a las Familias está recogida en la fuente oficial, lo que sitúa este centro dentro del circuito de plazas bonificadas de Andalucía. La misma fuente no describe servicios adicionales, de forma que cuestiones como la comida, el horario de tarde o el material incluido quedan sin verificar. Las escuelas de primer ciclo suelen abrir en septiembre con el curso escolar, aunque muchas admiten incorporaciones a lo largo del año si hay plaza.\n\nEsta página se nutre de información pública. Para saber con certeza plazas, horarios y precios, la vía directa es el teléfono del centro.',
  updated_at = NOW()
WHERE slug = '26-de-febrero-malaga';

-- ACUARELA 2 (acuarela-2-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'La dirección de Acuarela 2 es la calle Lorenzo Silva, 44-Bis, 29010 de Málaga. Se trata de una guardería privada que escolariza el primer ciclo de educación infantil, de 4 meses a 3 años.\n\nSe encuentra dentro del Programa de Ayuda a las Familias, el marco autonómico que fija las bonificaciones aplicables al precio del primer ciclo de infantil. No constan, en cambio, servicios confirmados de forma oficial: ni comedor, ni horario ampliado, ni ningún otro extra figuran documentados. En esta franja de edad, el proyecto educativo se apoya en rutinas estables y en el acompañamiento individual de cada niño, algo transversal a toda la etapa.\n\nEl origen de estos datos es público y su exactitud puede variar. Consulta con Acuarela 2 la disponibilidad de plaza, el horario y las cuotas vigentes.',
  updated_at = NOW()
WHERE slug = 'acuarela-2-malaga';

-- ALAMEDA (alameda-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'Alameda es un centro privado de primer ciclo de educación infantil del término municipal de Málaga. Está en la calle Sigfrido, 1 (29006) y su alumnado va de los 4 meses a los 3 años.\n\nEn la relación de la Junta de Andalucía figura acogido al Programa de Ayuda a las Familias; esa condición es la que habilita las bonificaciones del precio. Sobre el funcionamiento diario, la información pública se queda corta: no hay servicios verificados que podamos enumerar aquí.\n\nFicha generada con datos públicos disponibles. Cualquier detalle sobre plazas, horario o precio conviene confirmarlo con el equipo del centro.',
  updated_at = NOW()
WHERE slug = 'alameda-malaga';

-- FANTASÍA (fantasia-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'Desde la calle Lorenzo Silva, 28, en el código postal 29010 de Málaga, Fantasía atiende a niños de 4 meses a 3 años como centro privado de educación infantil de primer ciclo.\n\nEste centro participa en el Programa de Ayuda a las Familias, de forma que la cuota final depende del tramo de bonificación que reconozca la administración. Lo que no recoge el registro es el detalle de servicios: comedor, entrada temprana o actividades adicionales no están confirmados en fuente oficial. En el 0-3 la organización de la jornada varía notablemente entre centros: por eso el horario es una de las primeras preguntas que hacen las familias.\n\nAquí solo aparece lo que consta en fuentes públicas. Si necesitas saber si hay hueco, en qué horario y a qué precio, pregunta a Fantasía.',
  updated_at = NOW()
WHERE slug = 'fantasia-malaga';

-- TRAVESURAS (travesuras-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'Travesuras desarrolla su proyecto de primer ciclo de educación infantil en la calle Cuernavaca, 28, dentro del 29006 de Málaga. Es privado y admite alumnado de 4 a 36 meses.\n\nEl expediente público lo vincula al Programa de Ayuda a las Familias, un aspecto que conviene confirmar al solicitar plaza porque condiciona el precio final. El apartado de servicios permanece vacío en los datos consultados, así que preferimos no atribuir al centro prestaciones que no podemos verificar. Todos los centros de primer ciclo autorizados deben cumplir requisitos de instalaciones y titulación del personal fijados por la normativa andaluza.\n\nLa información expuesta procede de fuentes de acceso libre. Para plazas, horarios y cuotas actualizadas, contacta con el centro sin intermediarios.',
  updated_at = NOW()
WHERE slug = 'travesuras-malaga';

-- PINGU (pingu-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'La calle Alcalde José María de Llanos, 4 es la ubicación de Pingu, una guardería privada del código postal 29003 de Málaga especializada en el primer ciclo de educación infantil (4 meses a 3 años).\n\nSu condición de centro acogido al Programa de Ayuda a las Familias permite tramitar la bonificación del precio del servicio educativo ante la Junta de Andalucía. Ninguna fuente oficial detalla su oferta de servicios, por lo que no afirmamos que disponga de comedor, horario ampliado ni actividades complementarias.\n\nRedactamos esta ficha con datos públicos y sin verificación del centro. Pingu puede aclararte disponibilidad, horarios y condiciones de pago.',
  updated_at = NOW()
WHERE slug = 'pingu-malaga';

-- MAMÁ LUNA (mama-luna-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'Mamá Luna forma parte del listado de centros de primer ciclo de educación infantil de la Junta de Andalucía. Se ubica en la calle Rodeo, 23, 29018 de Málaga, y es de titularidad privada, con plazas de 4 meses a 3 años.\n\nLa fuente autonómica lo identifica como centro del Programa de Ayuda a las Familias, con acceso a las bonificaciones que regula la normativa vigente. Los datos disponibles no especifican qué servicios presta, de modo que ese apartado queda pendiente de confirmación con el propio centro. Conviene recordar que, en el primer ciclo de infantil, la jornada se organiza en torno a rutinas de alimentación, descanso y juego, y que cada centro define su propio horario.\n\nComo los datos son públicos, pueden quedarse cortos. Lo mejor es llamar a Mamá Luna y preguntar por plazas, horario y cuota del curso en marcha.',
  updated_at = NOW()
WHERE slug = 'mama-luna-malaga';

-- EL PRÍNCIPE E (el-principe-e-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'Con local en la calle Molino, 4, local 4 (29013), El Príncipe E atiende en Málaga a niños de 4 meses a 3 años. Es un centro privado de educación infantil de primer ciclo.\n\nAl figurar en el Programa de Ayuda a las Familias, las familias pueden solicitar que se aplique la bonificación autonómica sobre el precio de la plaza. Del resto de aspectos prácticos —alimentación, horarios, materiales— no hay constancia documental en las fuentes revisadas. En esta etapa, la incorporación suele plantearse de manera progresiva: el periodo de adaptación es una práctica habitual del 0-3 en Andalucía, con calendarios que fija cada escuela.\n\nEsta ficha recoge información pública sobre el centro. Plazas, horarios y cuotas son cuestiones que conviene tratar directamente con El Príncipe E.',
  updated_at = NOW()
WHERE slug = 'el-principe-e-malaga';

-- ABECÉ (abece-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'Abecé es una guardería privada malagueña del primer ciclo de educación infantil. Su sede está en la calle Merlo, 13, código postal 29006, y su alumnado tiene entre 4 meses y 3 años.\n\nEstá entre los centros que trabajan con el Programa de Ayuda a las Familias, el sistema andaluz de ayuda al pago de la escolarización de 0 a 3 años. En cuanto a servicios, la ficha oficial no aporta detalle alguno; lo prudente es preguntar y no dar nada por supuesto.\n\nLos contenidos parten de fuentes públicas y pueden estar desactualizados. Contacta con el centro para conocer vacantes, jornada y tarifas.',
  updated_at = NOW()
WHERE slug = 'abece-malaga';

-- EL TRÉBOL (el-trebol-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'En la avenida Arroyo de los Ángeles, 72 (29011, Málaga) se encuentra El Trébol, centro privado que cubre la etapa 0-3 escolarizando a niños desde los 4 meses hasta los 3 años.\n\nEl registro de primer ciclo lo marca como participante en el Programa de Ayuda a las Familias, dato que influye directamente en el coste mensual para la familia. No hemos localizado información oficial sobre comedor, jornada ampliada o actividades, así que ese apartado aparece vacío en esta ficha. Las escuelas de 0-3 trabajan por grupos de edad con ratios reguladas por la administración andaluza, algo común a todos los centros autorizados.\n\nInformación de procedencia pública, ofrecida para ayudarte a comparar. Para plazas, horarios y precios, dirígete a El Trébol.',
  updated_at = NOW()
WHERE slug = 'el-trebol-malaga';

-- LOS ENANITOS III (los-enanitos-iii-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'Los Enanitos III atiende a familias del 29009 de Málaga desde la calle Sevilla, 11. Es un centro privado de primer ciclo de educación infantil con plazas para niños de 4 a 36 meses.\n\nSe integra en el Programa de Ayuda a las Familias de la Junta de Andalucía, lo que se traduce en un precio bonificado para las familias que cumplan el baremo. La fuente consultada no confirma servicios complementarios, un dato que solo el centro puede completar con precisión. En Andalucía, la escolarización de 0 a 3 años se solicita curso a curso, y el calendario oficial marca los plazos de admisión de cada año.\n\nEsta descripción se ha construido con datos públicos. Antes de matricular, confirma con el centro las plazas libres, el horario y la cuota final.',
  updated_at = NOW()
WHERE slug = 'los-enanitos-iii-malaga';

-- GARABATO 4 (garabato-4-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'El primer ciclo de educación infantil es el ámbito de Garabato 4, guardería privada situada en la calle Jane Bowles, 2, local 3 B, código postal 29011 de Málaga, que trabaja con niños de 4 meses a 3 años.\n\nSu participación en el Programa de Ayuda a las Familias queda reflejada en los datos abiertos de la Junta, junto con la posibilidad de bonificar el precio del servicio. Sobre servicios concretos no hay respaldo documental, por lo que esta ficha se limita a los datos administrativos verificados.\n\nLos datos que ves proceden de fuentes públicas y no han sido validados por el centro. Pregunta a Garabato 4 por disponibilidad, horarios y coste.',
  updated_at = NOW()
WHERE slug = 'garabato-4-malaga';

-- GARABATO 3 (garabato-3-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'Garabato 3 es un centro infantil privado de Málaga capital. Ocupa la calle Jane Bowles, 2, local 3 A, en el 29011, y atiende el tramo de 4 meses a 3 años del primer ciclo de educación infantil.\n\nEl registro de la Junta de Andalucía lo señala como centro participante en el Programa de Ayuda a las Familias, la vía por la que se bonifica el precio del servicio educativo de 0-3. El registro no incluye información sobre comedor ni sobre ampliación horaria, de manera que esos puntos quedan abiertos. Las aulas de esta etapa se agrupan habitualmente por tramos (menores de 1 año, 1-2 y 2-3), una organización común en los centros autorizados de Andalucía.\n\nFicha basada en registros públicos. Si te interesa esta ubicación, contacta con el centro para conocer plazas, horario y condiciones económicas.',
  updated_at = NOW()
WHERE slug = 'garabato-3-malaga';

-- SEÑORITA PEPI (senorita-pepi-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'Ubicado en el paseo de los Tilos, 41, código postal 29006 de Málaga, Señorita Pepi es un centro privado autorizado para impartir el primer ciclo de educación infantil a niños de 4 meses a 3 años.\n\nEntre los datos oficiales consta su participación en el Programa de Ayuda a las Familias, el instrumento con el que la Junta de Andalucía rebaja el coste de la plaza a las familias que cumplen los requisitos. Falta, sin embargo, la información de servicios: no hay fuente oficial que confirme comedor, horario extendido u otras prestaciones. La etapa 0-3 combina cuidado y aprendizaje: hábitos, lenguaje, motricidad y juego forman el núcleo de la jornada en cualquier escuela infantil.\n\nLa información publicada es de origen público y puede completarse. Señorita Pepi es quien mejor puede explicarte plazas, horarios y cuotas.',
  updated_at = NOW()
WHERE slug = 'senorita-pepi-malaga';

-- CUCO (cuco-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'Cuco atiende la etapa 0-3 en Málaga desde la calle Cardo Cuco, 1 (29018). Es una escuela infantil de titularidad privada, con alumnado de 4 meses a 3 años.\n\nLos listados de la Consejería lo sitúan dentro del Programa de Ayuda a las Familias, de modo que la cuota puede reducirse conforme al baremo autonómico vigente. Los servicios que ofrece no aparecen documentados en la fuente utilizada, así que aquí no se enumeran para no inducir a error.\n\nRecogemos datos públicos que pueden no estar actualizados. Para plazas del curso, horario y precio, lo aconsejable es hablar con el centro.',
  updated_at = NOW()
WHERE slug = 'cuco-malaga';

-- BABYNET II (babynet-ii-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'La calle Curtidores, 1, código postal 29006 de Málaga, alberga Babynet II: un centro privado de educación infantil de primer ciclo para niños de 4 a 36 meses.\n\nParticipa en el Programa de Ayuda a las Familias de la Junta de Andalucía, el mecanismo autonómico que rebaja el precio de la plaza de primer ciclo según la situación de cada unidad familiar. Aparte de los datos administrativos, no se ha podido verificar ninguna prestación concreta del centro. En este tramo educativo, cada escuela concreta su propuesta pedagógica dentro del marco curricular que fija la administración autonómica.\n\nEsta ficha parte de fuentes públicas y se ofrece como punto de partida. Confirma con Babynet II la disponibilidad de plaza, el horario y la cuota mensual.',
  updated_at = NOW()
WHERE slug = 'babynet-ii-malaga';

-- BABYNATURA (babynatura-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'Babynatura es una de las guarderías privadas registradas en Málaga capital. Atiende a niños de 4 meses a 3 años en la calle Trombón, 22, código postal 29190.\n\nSe acoge al Programa de Ayuda a las Familias, con lo que la tarifa del servicio educativo puede bonificarse de acuerdo con la normativa andaluza en vigor. Ni el comedor ni la flexibilidad horaria constan confirmados oficialmente, por lo que conviene preguntarlos antes de comparar precios. El primer ciclo andaluz funciona con solicitud anual y baremo, y la bonificación del precio se resuelve dentro de ese mismo procedimiento.\n\nLa información de esta ficha se ha compuesto con datos de acceso público y puede quedar desfasada. Para plazas libres, horario real y cuotas del curso, lo más seguro es hablar con Babynatura.',
  updated_at = NOW()
WHERE slug = 'babynatura-malaga';

-- PATITO AMARILLO (patito-amarillo-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'En el código postal 29013 de Málaga, Patito Amarillo presta servicio de primer ciclo de educación infantil desde la plaza de Celedonio Romero, 5- local 3. La titularidad es privada y las edades atendidas van de 4 meses a 3 años.\n\nLa fuente oficial lo incluye entre los centros que participan en el Programa de Ayuda a las Familias; esa adhesión es la que abre el acceso a las bonificaciones autonómicas del precio. La ausencia de datos sobre servicios en la fuente oficial impide describir aquí cómo se organiza la jornada en este centro.\n\nTodo lo anterior procede de fuentes públicas, que no siempre están al día. Antes de decidir, llama a Patito Amarillo y pregunta por disponibilidad, horarios y precio final.',
  updated_at = NOW()
WHERE slug = 'patito-amarillo-malaga';

-- EL OSITO CARLOS (el-osito-carlos-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'El Osito Carlos escolariza a niños de 4 meses a 3 años en la calle Gómez Ocaña, 14, 29007 de Málaga. Es un centro privado del primer ciclo de educación infantil.\n\nSu nombre aparece en la relación de centros acogidos al Programa de Ayuda a las Familias, el sistema con el que Andalucía subvenciona parte del coste de la escolarización 0-3. No hay información pública que confirme servicios adicionales; esta ficha recoge solo lo que sí está documentado. En 0-3, aspectos como el número de educadoras por aula o el espacio exterior suelen pesar en la decisión familiar; son datos que se comprueban en la visita.\n\nEstos datos salen de registros públicos y pueden estar incompletos; el propio centro es quien puede confirmar plazas, calendario y cuotas actualizadas.',
  updated_at = NOW()
WHERE slug = 'el-osito-carlos-malaga';

-- NUBES DE ALGODÓN (nubes-de-algodon-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'El centro privado Nubes de algodón desarrolla el primer ciclo de educación infantil en Málaga, en la calle Escritor Sancho Guerrero, 13 (código postal 29140), con plazas para niños de entre 4 meses y 3 años.\n\nConsta dentro del Programa de Ayuda a las Familias, por lo que las familias con derecho pueden ver reducido el importe mensual según el baremo de la Junta de Andalucía. Los detalles operativos —qué incluye la cuota, qué horarios maneja, si hay cocina propia— no figuran en los datos consultados. Las escuelas de primer ciclo suelen abrir en septiembre con el curso escolar, aunque muchas admiten incorporaciones a lo largo del año si hay plaza.\n\nEsta ficha se apoya en información pública. Si te interesa Nubes de algodón, contacta directamente para conocer las plazas disponibles, el horario y las condiciones económicas.',
  updated_at = NOW()
WHERE slug = 'nubes-de-algodon-malaga';

-- COLORÍN COLORADO (colorin-colorado-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'Colorín Colorado tiene su actividad en la calle María Martínez Sierra, 19, en el 29140 de Málaga. Es una guardería de titularidad privada que cubre la etapa de 4 a 36 meses.\n\nEstá incorporado al Programa de Ayuda a las Familias, la fórmula por la que la administración andaluza asume una parte del precio del servicio educativo. El listado autonómico no desglosa servicios por centro, así que ese nivel de detalle solo puede aportarlo el propio equipo.\n\nLos datos aquí reunidos tienen origen público y no sustituyen a la información del centro: pregunta en Colorín Colorado por plazas, horarios y cuotas antes de matricular.',
  updated_at = NOW()
WHERE slug = 'colorin-colorado-malaga';

-- MIMOSITOS (mimositos-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'En Málaga capital, la avenida Doctor Marañón, bloque torre, 51 (29009) es la sede de Mimositos, centro privado dedicado al primer ciclo de educación infantil para niños de 4 meses a 3 años.\n\nLos datos abiertos de la Junta lo recogen como centro acogido al Programa de Ayuda a las Familias, con la bonificación del precio que esa adhesión conlleva. Queda fuera de esta ficha todo lo relativo a servicios, porque ninguna fuente fiable los recoge para este centro. El acceso a este ciclo se regula por convocatoria autonómica, con plazos de solicitud y adjudicación publicados cada curso por la Junta de Andalucía.\n\nComo esta información procede de fuentes abiertas, puede haber cambiado. Una llamada a Mimositos resolverá las dudas sobre disponibilidad, jornada y precio.',
  updated_at = NOW()
WHERE slug = 'mimositos-malaga';

-- MAMÁ OCA II (mama-oca-ii-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'Mamá Oca II es un centro privado del primer ciclo de educación infantil que atiende a niños de 4 meses a 3 años. Se encuentra en la calle Carril de la Cordobesa, 13, código postal 29002 de Málaga.\n\nSu ficha oficial lo asocia al Programa de Ayuda a las Familias; la cuantía finalmente bonificada depende de la renta y de la composición de cada familia. Más allá de ese dato, la fuente no detalla servicios concretos: comedor, ampliación de horario o actividades complementarias no aparecen confirmados. En el 0-3 la organización de la jornada varía notablemente entre centros: por eso el horario es una de las primeras preguntas que hacen las familias.\n\nEl contenido de esta página se basa en registros públicos. Para saber si hay plaza, qué horario maneja el centro y cuánto cuesta, conviene preguntar directamente.',
  updated_at = NOW()
WHERE slug = 'mama-oca-ii-malaga';

-- ALAMEDA II (alameda-ii-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'Con sede en la calle Juan de Robles, 59, dentro del código postal 29010 de Málaga, Alameda II trabaja la etapa 0-3 como centro de titularidad privada, con alumnado de 4 a 36 meses.\n\nForma parte del conjunto de centros acogidos al Programa de Ayuda a las Familias de la Junta de Andalucía, lo que permite solicitar la bonificación del precio de la plaza. La misma fuente no describe servicios adicionales, de forma que cuestiones como la comida, el horario de tarde o el material incluido quedan sin verificar.\n\nFicha construida con datos públicos, sujetos a cambios de un curso a otro. Alameda II puede confirmarte plazas, horarios y cuotas con exactitud.',
  updated_at = NOW()
WHERE slug = 'alameda-ii-malaga';

-- BABYLLETAS (babylletas-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'Babylletas aparece en el registro de centros de primer ciclo de educación infantil de Andalucía con domicilio en la avenida Carlos Haya, 5 (29010, Málaga). Es privado y atiende de 4 meses a 3 años.\n\nAl participar en el Programa de Ayuda a las Familias, admite la tramitación de las bonificaciones autonómicas sobre el precio del servicio educativo. No constan, en cambio, servicios confirmados de forma oficial: ni comedor, ni horario ampliado, ni ningún otro extra figuran documentados. La etapa anterior al segundo ciclo (3-6 años) se caracteriza por grupos reducidos y por una atención muy centrada en los cuidados básicos.\n\nLa procedencia de estos datos es pública, de modo que pueden faltar detalles. Contacta con el centro para cerrar los aspectos prácticos: plaza, horario y precio.',
  updated_at = NOW()
WHERE slug = 'babylletas-malaga';

-- LA MARIQUITA (la-mariquita-malaga) [privado, no adherido]
UPDATE centers SET
  long_description = E'El día a día de La Mariquita transcurre en la calle La Regente, 5, código postal 29009 de Málaga. Es una guardería privada de primer ciclo de educación infantil para niños de 4 meses a 3 años.\n\nNo consta acogido al Programa de Ayuda a las Familias de la Junta de Andalucía, un detalle relevante para comparar cuotas con otras opciones de la zona. Sobre el funcionamiento diario, la información pública se queda corta: no hay servicios verificados que podamos enumerar aquí. Conviene recordar que, en el primer ciclo de infantil, la jornada se organiza en torno a rutinas de alimentación, descanso y juego, y que cada centro define su propio horario.\n\nRecogemos aquí lo que consta en fuentes públicas. Lo demás —plazas del curso, horarios concretos, cuotas— hay que consultarlo con La Mariquita.',
  updated_at = NOW()
WHERE slug = 'la-mariquita-malaga';

-- NAZARET (nazaret-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'Nazaret es una guardería privada de Málaga que trabaja el primer ciclo de educación infantil en el pasaje Las Américas, s/n, dentro del código postal 29006. Sus aulas se dirigen a niños de 4 meses a 3 años.\n\nCuenta con adhesión al Programa de Ayuda a las Familias, de manera que buena parte de las familias puede acceder a un precio bonificado según el baremo autonómico. Lo que no recoge el registro es el detalle de servicios: comedor, entrada temprana o actividades adicionales no están confirmados en fuente oficial.\n\nEsta información es de origen público y puede no reflejar la situación actual del centro. Pregunta en Nazaret por vacantes, jornada y tarifas.',
  updated_at = NOW()
WHERE slug = 'nazaret-malaga';

-- BIBITOS (bibitos-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'La calle Nuestra Señora de las Candelas, 17 (29004) es el domicilio de Bibitos, centro malagueño de titularidad privada dedicado al primer ciclo de educación infantil, la etapa que abarca de los 4 meses a los 3 años.\n\nAparece entre los centros acogidos al Programa de Ayuda a las Familias, el programa que regula las bonificaciones del precio en el primer ciclo de infantil en Andalucía. El apartado de servicios permanece vacío en los datos consultados, así que preferimos no atribuir al centro prestaciones que no podemos verificar. El primer ciclo de educación infantil no es obligatorio, y las plazas y precios varían mucho de un centro a otro dentro de la misma ciudad.\n\nLos datos mostrados proceden de fuentes abiertas y se ofrecen a título informativo. Para plazas, horarios y cuotas, dirígete al centro.',
  updated_at = NOW()
WHERE slug = 'bibitos-malaga';

-- DUENDECILLOS (duendecillos-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'En la avenida Juan Sebastián Elcano, 81, dentro del 29017 de Málaga, Duendecillos desarrolla su labor como escuela infantil privada de primer ciclo para niños de entre 4 meses y 3 años.\n\nLa adhesión al Programa de Ayuda a las Familias es el dato económico más relevante que recoge la fuente oficial: gracias a ella, la cuota puede bonificarse según normativa. Ninguna fuente oficial detalla su oferta de servicios, por lo que no afirmamos que disponga de comedor, horario ampliado ni actividades complementarias. Las escuelas de 0-3 trabajan por grupos de edad con ratios reguladas por la administración andaluza, algo común a todos los centros autorizados.\n\nFicha elaborada con información pública. Si estás valorando Duendecillos, pide cita o llama para conocer plazas libres, horario y coste mensual.',
  updated_at = NOW()
WHERE slug = 'duendecillos-malaga';

-- NANNY (nanny-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'Nanny atiende el tramo de 4 a 36 meses en la calle Lope de Rueda, 31, 1ª planta, local 4, barriada Puerto de la Torre, en el código postal 29190 de Málaga. Es un centro de titularidad privada del primer ciclo de educación infantil.\n\nEstá incluido en el Programa de Ayuda a las Familias, con lo que el importe que abona la familia se calcula tras aplicar la bonificación autonómica que corresponda. Los datos disponibles no especifican qué servicios presta, de modo que ese apartado queda pendiente de confirmación con el propio centro.\n\nEl contenido procede de registros públicos y puede estar incompleto. El equipo de Nanny podrá detallarte disponibilidad, horarios y condiciones económicas.',
  updated_at = NOW()
WHERE slug = 'nanny-malaga';

-- AULAGA (aulaga-malaga) [privado, no adherido]
UPDATE centers SET
  long_description = E'Con dirección en la calle Retama, 20, urbanización Puerto Sol, Puerto de la Torre (29190, Málaga), Aulaga escolariza el primer ciclo de educación infantil como centro privado, desde los 4 meses hasta los 3 años.\n\nLa documentación pública no refleja adhesión al Programa de Ayuda a las Familias, por lo que la bonificación autonómica del precio no resulta aplicable según esa fuente. Del resto de aspectos prácticos —alimentación, horarios, materiales— no hay constancia documental en las fuentes revisadas. En el primer ciclo, el vínculo con la familia y la comunicación diaria pesan tanto como la propuesta de actividades; es una característica compartida por toda la etapa.\n\nEsta descripción parte de datos públicos. Antes de dar ningún paso, confirma con el centro las plazas, el horario de apertura y la cuota que te correspondería.',
  updated_at = NOW()
WHERE slug = 'aulaga-malaga';

-- NUBES DE COLORES (nubes-de-colores-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'El censo andaluz de centros de primer ciclo incluye a Nubes de Colores, guardería privada de Málaga instalada en la avenida Manuel Rodríguez, 18 (29190) y dirigida a niños de 4 meses a 3 años.\n\nEl registro andaluz confirma su adhesión al Programa de Ayuda a las Familias, un detalle que conviene tener presente al comparar precios entre centros. En cuanto a servicios, la ficha oficial no aporta detalle alguno; lo prudente es preguntar y no dar nada por supuesto. Las aulas de esta etapa se agrupan habitualmente por tramos (menores de 1 año, 1-2 y 2-3), una organización común en los centros autorizados de Andalucía.\n\nLa base de esta ficha es información pública, no facilitada por el centro. Para plazas, horario y precio actualizado, contacta con Nubes de Colores.',
  updated_at = NOW()
WHERE slug = 'nubes-de-colores-malaga';

-- MARÍA EUGENIA (maria-eugenia-malaga) [privado, no adherido]
UPDATE centers SET
  long_description = E'María Eugenia funciona como escuela infantil privada en la calle Manuel del Palacio, 13, código postal 29017 de Málaga, y cubre la franja de edad que va de los 4 meses a los 3 años.\n\nSegún el listado autonómico, no participa en el Programa de Ayuda a las Familias; el importe mensual dependerá de las tarifas propias del centro. No hemos localizado información oficial sobre comedor, jornada ampliada o actividades, así que ese apartado aparece vacío en esta ficha.\n\nDatos de origen público, revisables en cualquier momento. La forma más fiable de saber si hay plaza y a qué precio es preguntar directamente en el centro.',
  updated_at = NOW()
WHERE slug = 'maria-eugenia-malaga';

-- THE GREEN RAY KINDER (the-green-ray-kinder-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'A la altura del bulevar Louis Pasteur, 47, en el 29010 malagueño, se localiza The Green Ray Kinder: un centro privado de primer ciclo de educación infantil para pequeños de 4 meses a 3 años.\n\nSu inclusión en el Programa de Ayuda a las Familias permite que el precio del servicio educativo se bonifique con arreglo a la normativa autonómica. La fuente consultada no confirma servicios complementarios, un dato que solo el centro puede completar con precisión. Como en el resto de centros del primer ciclo, la matrícula depende de las plazas libres por edad, que cambian cada curso.\n\nPublicamos aquí solo lo verificable en fuentes públicas. The Green Ray Kinder puede ampliarlo con la información práctica: vacantes, horarios y cuotas del curso.',
  updated_at = NOW()
WHERE slug = 'the-green-ray-kinder-malaga';

-- PEMOLO (pemolo-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'Pemolo es un centro de educación infantil de primer ciclo y gestión privada, con sede en la avenida Obispo Ángel Herrera Oria, 78-80 (29007), en la ciudad de Málaga. Acoge a niños desde los 4 meses hasta los 3 años.\n\nLa documentación pública lo relaciona con el Programa de Ayuda a las Familias, de modo que la plaza puede salir más económica de lo que indica la tarifa base. Sobre servicios concretos no hay respaldo documental, por lo que esta ficha se limita a los datos administrativos verificados. En este tramo educativo, cada escuela concreta su propuesta pedagógica dentro del marco curricular que fija la administración autonómica.\n\nEsta ficha reúne información pública que conviene contrastar. Llama a Pemolo para confirmar plazas disponibles, franja horaria y tarifas.',
  updated_at = NOW()
WHERE slug = 'pemolo-malaga';

-- EL COLUMPIO DE CRESPI II (el-columpio-de-crespi-ii-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'La actividad de El Columpio de Crespi II se desarrolla en la calle Félix Gancedo, 19, local 1, código postal 29010 de Málaga. Hablamos de una guardería privada del primer ciclo de infantil, pensada para la franja de 4 a 36 meses.\n\nTrabaja dentro del Programa de Ayuda a las Familias de la Junta de Andalucía; el porcentaje de bonificación se determina en el proceso de solicitud. El registro no incluye información sobre comedor ni sobre ampliación horaria, de manera que esos puntos quedan abiertos.\n\nLos datos provienen de fuentes públicas y pueden haber variado. Para resolver plazas, horarios y cuotas, lo práctico es contactar con el centro.',
  updated_at = NOW()
WHERE slug = 'el-columpio-de-crespi-ii-malaga';

-- TITO JOSE (tito-jose-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'Dentro del mapa de guarderías de Málaga capital, Tito Jose ocupa la avenida Jacinto Benavente, 3 (29014). Es un centro privado de primer ciclo de educación infantil que atiende de los 4 meses a los 3 años.\n\nEstá adscrito al Programa de Ayuda a las Familias, por lo que la solicitud de bonificación forma parte habitual del trámite de matrícula en este centro. Falta, sin embargo, la información de servicios: no hay fuente oficial que confirme comedor, horario extendido u otras prestaciones. Es propio de la etapa que las familias visiten el centro antes de decidir: ver el aula y hablar con el equipo aporta más que cualquier ficha.\n\nToda la información recogida es de acceso público. Si Tito Jose te encaja por ubicación, pregúntale por disponibilidad, horario y precio final.',
  updated_at = NOW()
WHERE slug = 'tito-jose-malaga';

-- LILI Y LALA (lili-y-lala-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'Lili y Lala presta servicio educativo a niños de 4 meses a 3 años en la calle Jacob, 11, dentro del código postal 29590 de Málaga, con titularidad privada y autorización para el primer ciclo de infantil.\n\nEl dato de adhesión al Programa de Ayuda a las Familias sí aparece en la fuente oficial: sus plazas admiten la bonificación autonómica del precio. Los servicios que ofrece no aparecen documentados en la fuente utilizada, así que aquí no se enumeran para no inducir a error. En 0-3, aspectos como el número de educadoras por aula o el espacio exterior suelen pesar en la decisión familiar; son datos que se comprueban en la visita.\n\nSe trata de una ficha basada en datos públicos, con las limitaciones que eso implica. El centro es la fuente adecuada para plazas, horarios y cuotas.',
  updated_at = NOW()
WHERE slug = 'lili-y-lala-malaga';

-- PEPOLA (pepola-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'Quien busque plaza de 0-3 en el entorno del 29190 de Málaga encontrará Pepola en la calle Orquídea, 30. Es una guardería privada que atiende a niños de 4 meses a 3 años.\n\nLa Junta de Andalucía lo relaciona entre los centros del Programa de Ayuda a las Familias, cuyo objetivo es que el coste no sea una barrera para escolarizar en 0-3. Aparte de los datos administrativos, no se ha podido verificar ninguna prestación concreta del centro.\n\nLa información aquí ofrecida tiene carácter orientativo y procede de fuentes públicas. Contacta con Pepola para conocer plazas, jornada y condiciones económicas.',
  updated_at = NOW()
WHERE slug = 'pepola-malaga';

-- WAKE UP (wake-up-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'Wake Up pertenece a la red de centros privados de primer ciclo de educación infantil de Málaga. Su dirección es la calle Fiscal Luis Portero García, 3, locales 15, 17 y 19, código postal 29010, y trabaja con niños de 4 a 36 meses.\n\nParticipa del sistema andaluz de bonificaciones a través del Programa de Ayuda a las Familias, que ajusta el precio de la plaza a la situación económica del hogar. Ni el comedor ni la flexibilidad horaria constan confirmados oficialmente, por lo que conviene preguntarlos antes de comparar precios. En esta franja de edad, el proyecto educativo se apoya en rutinas estables y en el acompañamiento individual de cada niño, algo transversal a toda la etapa.\n\nEstos contenidos se han redactado a partir de información pública. Para el detalle práctico —plaza, horario, cuota— habla con el centro.',
  updated_at = NOW()
WHERE slug = 'wake-up-malaga';

-- SAN IGNACIO GARDEN (san-ignacio-garden-malaga) [privado, no adherido]
UPDATE centers SET
  long_description = E'En pleno 29016 de Málaga, concretamente en el paseo del Limonar, 34, San Ignacio Garden ofrece plazas de primer ciclo de educación infantil para niños de 4 meses a 3 años. Su titularidad es privada.\n\nEn el registro andaluz no figura su adhesión al Programa de Ayuda a las Familias, así que el coste de la plaza no incorpora la bonificación autonómica. La ausencia de datos sobre servicios en la fuente oficial impide describir aquí cómo se organiza la jornada en este centro. El acceso a este ciclo se regula por convocatoria autonómica, con plazos de solicitud y adjudicación publicados cada curso por la Junta de Andalucía.\n\nFicha apoyada en fuentes públicas y sin datos aportados por el centro. Pregunta en San Ignacio Garden por vacantes, horarios y precio antes de decidir.',
  updated_at = NOW()
WHERE slug = 'san-ignacio-garden-malaga';

-- PEQUEÑOS PASITOS (pequenos-pasitos-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'Pequeños Pasitos es una escuela infantil de titularidad privada que cubre el primer ciclo, de 4 meses a 3 años, desde la calle La Trompa, 29, barriada Santa Rosalía (29591, Málaga).\n\nSu adhesión al Programa de Ayuda a las Familias está recogida en la fuente oficial, lo que sitúa este centro dentro del circuito de plazas bonificadas de Andalucía. No hay información pública que confirme servicios adicionales; esta ficha recoge solo lo que sí está documentado.\n\nLo publicado aquí proviene de registros abiertos. Pequeños Pasitos podrá confirmarte si quedan plazas, qué horario ofrece y cuál sería la cuota mensual.',
  updated_at = NOW()
WHERE slug = 'pequenos-pasitos-malaga';

-- DUENDECILLOS DE PLATERO (duendecillos-de-platero-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'El centro Duendecillos de Platero tiene su sede en la calle Baja, 23A, código postal 29018 de Málaga. De carácter privado, se ocupa del primer ciclo de educación infantil: niños de 4 meses a 3 años.\n\nSe encuentra dentro del Programa de Ayuda a las Familias, el marco autonómico que fija las bonificaciones aplicables al precio del primer ciclo de infantil. Los detalles operativos —qué incluye la cuota, qué horarios maneja, si hay cocina propia— no figuran en los datos consultados. Todos los centros de primer ciclo autorizados deben cumplir requisitos de instalaciones y titulación del personal fijados por la normativa andaluza.\n\nDatos recopilados de fuentes públicas, que pueden no estar completos. Antes de solicitar plaza, contrasta horario y cuotas con el propio centro.',
  updated_at = NOW()
WHERE slug = 'duendecillos-de-platero-malaga';

-- MIL SONRISAS (mil-sonrisas-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'La calle Romero, 11 (barriada Santa Rosalía), en el código postal 29591 de Málaga, acoge a Mil Sonrisas, guardería privada autorizada para el primer ciclo de educación infantil (4 meses a 3 años).\n\nEn la relación de la Junta de Andalucía figura acogido al Programa de Ayuda a las Familias; esa condición es la que habilita las bonificaciones del precio. El listado autonómico no desglosa servicios por centro, así que ese nivel de detalle solo puede aportarlo el propio equipo. La etapa anterior al segundo ciclo (3-6 años) se caracteriza por grupos reducidos y por una atención muy centrada en los cuidados básicos.\n\nEsta página se nutre de información pública. Para saber con certeza plazas, horarios y precios, la vía directa es el teléfono del centro.',
  updated_at = NOW()
WHERE slug = 'mil-sonrisas-malaga';

-- RAYUELA (rayuela-malaga) [privado, no adherido]
UPDATE centers SET
  long_description = E'Rayuela trabaja con bebés y niños pequeños, de 4 meses a 3 años, en el carril de Castell, 15 (29016). Es uno de los centros privados de primer ciclo de educación infantil del municipio de Málaga.\n\nLa fuente oficial no lo incluye entre los centros del Programa de Ayuda a las Familias, de manera que las condiciones de pago habrá que revisarlas con el equipo del centro. Queda fuera de esta ficha todo lo relativo a servicios, porque ninguna fuente fiable los recoge para este centro.\n\nEl origen de estos datos es público y su exactitud puede variar. Consulta con Rayuela la disponibilidad de plaza, el horario y las cuotas vigentes.',
  updated_at = NOW()
WHERE slug = 'rayuela-malaga';

-- 5 CHUPETES CIUDAD JARDÍN (5-chupetes-ciudad-jardin-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'El local de 5 Chupetes Ciudad Jardín está en la calle Juan Chamizo Lucas, 1, código postal 29014 de Málaga. Es una guardería privada dedicada al primer ciclo de educación infantil, la etapa previa al segundo ciclo (3-6 años), y atiende de 4 meses a 3 años.\n\nEl expediente público lo vincula al Programa de Ayuda a las Familias, un aspecto que conviene confirmar al solicitar plaza porque condiciona el precio final. Más allá de ese dato, la fuente no detalla servicios concretos: comedor, ampliación de horario o actividades complementarias no aparecen confirmados. En esta etapa, la incorporación suele plantearse de manera progresiva: el periodo de adaptación es una práctica habitual del 0-3 en Andalucía, con calendarios que fija cada escuela.\n\nFicha generada con datos públicos disponibles. Cualquier detalle sobre plazas, horario o precio conviene confirmarlo con el equipo del centro.',
  updated_at = NOW()
WHERE slug = '5-chupetes-ciudad-jardin-malaga';

-- GREEN TREE (green-tree-malaga) [privado, no adherido]
UPDATE centers SET
  long_description = E'Green Tree cubre en Málaga la etapa de 4 a 36 meses. Su local está en la calle Samaria, 3, dentro del 29018, y su titularidad es privada.\n\nNo aparece dentro del Programa de Ayuda a las Familias en los datos publicados por la Junta de Andalucía, un aspecto a tener en cuenta al valorar el presupuesto familiar. La misma fuente no describe servicios adicionales, de forma que cuestiones como la comida, el horario de tarde o el material incluido quedan sin verificar. El primer ciclo de educación infantil no es obligatorio, y las plazas y precios varían mucho de un centro a otro dentro de la misma ciudad.\n\nAquí solo aparece lo que consta en fuentes públicas. Si necesitas saber si hay hueco, en qué horario y a qué precio, pregunta a Green Tree.',
  updated_at = NOW()
WHERE slug = 'green-tree-malaga';

-- COCOLÍN (cocolin-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'Entre los centros de primer ciclo censados en Málaga capital figura Cocolín, con sede en la calle Emilio Thuiller, 105 (29014). Es de titularidad privada y atiende de 4 meses a 3 años.\n\nLa fuente autonómica lo identifica como centro del Programa de Ayuda a las Familias, con acceso a las bonificaciones que regula la normativa vigente. No constan, en cambio, servicios confirmados de forma oficial: ni comedor, ni horario ampliado, ni ningún otro extra figuran documentados.\n\nLa información expuesta procede de fuentes de acceso libre. Para plazas, horarios y cuotas actualizadas, contacta con el centro sin intermediarios.',
  updated_at = NOW()
WHERE slug = 'cocolin-malaga';

-- LA CASITA DE PEQUE (la-casita-de-peque-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'La Casita de Peque abre en la calle Quintanar de la Orden, 3, en el código postal 29014 de Málaga, como centro privado de educación infantil de primer ciclo para niños de entre 4 meses y 3 años.\n\nAl figurar en el Programa de Ayuda a las Familias, las familias pueden solicitar que se aplique la bonificación autonómica sobre el precio de la plaza. Sobre el funcionamiento diario, la información pública se queda corta: no hay servicios verificados que podamos enumerar aquí. En Andalucía, la escolarización de 0 a 3 años se solicita curso a curso, y el calendario oficial marca los plazos de admisión de cada año.\n\nRedactamos esta ficha con datos públicos y sin verificación del centro. La Casita de Peque puede aclararte disponibilidad, horarios y condiciones de pago.',
  updated_at = NOW()
WHERE slug = 'la-casita-de-peque-malaga';

-- OLIVITOS DE SAN AGUSTÍN (olivitos-de-san-agustin-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'La dirección de Olivitos de San Agustín es la calle Sumatra, 32, 29190 de Málaga. Se trata de una guardería privada que escolariza el primer ciclo de educación infantil, de 4 meses a 3 años.\n\nEstá entre los centros que trabajan con el Programa de Ayuda a las Familias, el sistema andaluz de ayuda al pago de la escolarización de 0 a 3 años. Lo que no recoge el registro es el detalle de servicios: comedor, entrada temprana o actividades adicionales no están confirmados en fuente oficial. En el primer ciclo, el vínculo con la familia y la comunicación diaria pesan tanto como la propuesta de actividades; es una característica compartida por toda la etapa.\n\nComo los datos son públicos, pueden quedarse cortos. Lo mejor es llamar a Olivitos de San Agustín y preguntar por plazas, horario y cuota del curso en marcha.',
  updated_at = NOW()
WHERE slug = 'olivitos-de-san-agustin-malaga';

-- CUENTOS Y CUENTAS (cuentos-y-cuentas-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'Cuentos y Cuentas es un centro privado de primer ciclo de educación infantil del término municipal de Málaga. Está en la calle Charles Dickens, 4 (29010) y su alumnado va de los 4 meses a los 3 años.\n\nEl registro de primer ciclo lo marca como participante en el Programa de Ayuda a las Familias, dato que influye directamente en el coste mensual para la familia. El apartado de servicios permanece vacío en los datos consultados, así que preferimos no atribuir al centro prestaciones que no podemos verificar.\n\nEsta ficha recoge información pública sobre el centro. Plazas, horarios y cuotas son cuestiones que conviene tratar directamente con Cuentos y Cuentas.',
  updated_at = NOW()
WHERE slug = 'cuentos-y-cuentas-malaga';

-- MONTESSORI MÁLAGA (montessori-malaga-malaga) [privado, no adherido]
UPDATE centers SET
  long_description = E'Desde la calle Godino, 3, Local 3, en el código postal 29009 de Málaga, Montessori Málaga atiende a niños de 4 meses a 3 años como centro privado de educación infantil de primer ciclo.\n\nEl listado de la Consejería no le atribuye adhesión al Programa de Ayuda a las Familias; el precio se corresponde con la tarifa privada que aplique el centro. Ninguna fuente oficial detalla su oferta de servicios, por lo que no afirmamos que disponga de comedor, horario ampliado ni actividades complementarias. La etapa 0-3 combina cuidado y aprendizaje: hábitos, lenguaje, motricidad y juego forman el núcleo de la jornada en cualquier escuela infantil.\n\nLos contenidos parten de fuentes públicas y pueden estar desactualizados. Contacta con el centro para conocer vacantes, jornada y tarifas.',
  updated_at = NOW()
WHERE slug = 'montessori-malaga-malaga';

-- LA JUNGLA (la-jungla-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'La Jungla desarrolla su proyecto de primer ciclo de educación infantil en la calle Fernando el Católico, 45, dentro del 29013 de Málaga. Es privado y admite alumnado de 4 a 36 meses.\n\nSu participación en el Programa de Ayuda a las Familias queda reflejada en los datos abiertos de la Junta, junto con la posibilidad de bonificar el precio del servicio. Los datos disponibles no especifican qué servicios presta, de modo que ese apartado queda pendiente de confirmación con el propio centro. Como en el resto de centros del primer ciclo, la matrícula depende de las plazas libres por edad, que cambian cada curso.\n\nInformación de procedencia pública, ofrecida para ayudarte a comparar. Para plazas, horarios y precios, dirígete a La Jungla.',
  updated_at = NOW()
WHERE slug = 'la-jungla-malaga';

-- CERRADO DE CALDERÓN (cerrado-de-calderon-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'La calle Los Flamencos, 17 es la ubicación de Cerrado de Calderón, una guardería privada del código postal 29018 de Málaga especializada en el primer ciclo de educación infantil (4 meses a 3 años).\n\nEl registro de la Junta de Andalucía lo señala como centro participante en el Programa de Ayuda a las Familias, la vía por la que se bonifica el precio del servicio educativo de 0-3. Del resto de aspectos prácticos —alimentación, horarios, materiales— no hay constancia documental en las fuentes revisadas.\n\nEsta descripción se ha construido con datos públicos. Antes de matricular, confirma con el centro las plazas libres, el horario y la cuota final.',
  updated_at = NOW()
WHERE slug = 'cerrado-de-calderon-malaga';

-- REINA (reina-malaga) [privado, no adherido]
UPDATE centers SET
  long_description = E'Reina forma parte del listado de centros de primer ciclo de educación infantil de la Junta de Andalucía. Se ubica en la calle Mauricio Moro Pareto, 5, 29006 de Málaga, y es de titularidad privada, con plazas de 4 meses a 3 años.\n\nLos registros consultados no señalan participación en el Programa de Ayuda a las Familias, por lo que las bonificaciones autonómicas no constan disponibles en este caso. En cuanto a servicios, la ficha oficial no aporta detalle alguno; lo prudente es preguntar y no dar nada por supuesto. El primer ciclo andaluz funciona con solicitud anual y baremo, y la bonificación del precio se resuelve dentro de ese mismo procedimiento.\n\nLos datos que ves proceden de fuentes públicas y no han sido validados por el centro. Pregunta a Reina por disponibilidad, horarios y coste.',
  updated_at = NOW()
WHERE slug = 'reina-malaga';

-- COLEGIO INFANTIL CLARET (colegio-infantil-claret-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'Con local en Alamed de Capuchinos, 86 (29013), Colegio Infantil Claret atiende en Málaga a niños de 4 meses a 3 años. Es un centro privado de educación infantil de primer ciclo.\n\nLos listados de la Consejería lo sitúan dentro del Programa de Ayuda a las Familias, de modo que la cuota puede reducirse conforme al baremo autonómico vigente. No hemos localizado información oficial sobre comedor, jornada ampliada o actividades, así que ese apartado aparece vacío en esta ficha. Es propio de la etapa que las familias visiten el centro antes de decidir: ver el aula y hablar con el equipo aporta más que cualquier ficha.\n\nFicha basada en registros públicos. Si te interesa esta ubicación, contacta con el centro para conocer plazas, horario y condiciones económicas.',
  updated_at = NOW()
WHERE slug = 'colegio-infantil-claret-malaga';

-- ACUARELA (acuarela-malaga) [privado, adherido]
UPDATE centers SET
  long_description = E'Acuarela es una guardería privada malagueña del primer ciclo de educación infantil. Su sede está en la calle Lorenzo Silva, 44, código postal 29010, y su alumnado tiene entre 4 meses y 3 años.\n\nParticipa en el Programa de Ayuda a las Familias de la Junta de Andalucía, el mecanismo autonómico que rebaja el precio de la plaza de primer ciclo según la situación de cada unidad familiar. La fuente consultada no confirma servicios complementarios, un dato que solo el centro puede completar con precisión.\n\nLa información publicada es de origen público y puede completarse. Acuarela es quien mejor puede explicarte plazas, horarios y cuotas.',
  updated_at = NOW()
WHERE slug = 'acuarela-malaga';

-- ==========================================================
-- PALMA — 57 centros
-- ==========================================================

-- ASIMA (asima-palma) [privado]
UPDATE centers SET
  long_description = E'Asima es una guardería privada de primer ciclo de educación infantil situada en Carrer GREMI DE BOTERS, 21 (07009), en Palma. Figura en el directorio oficial de centros educativos del Govern de les Illes Balears y atiende a niños de 0 a 3 años.\n\nLa fuente oficial consultada acredita la autorización del centro para esta etapa, pero no detalla servicios. Comedor, ampliación de horario o forma de plantear la adaptación son decisiones que toma cada escuela de 0-3, de modo que conviene trasladar esas preguntas al propio equipo.\n\nLos datos de esta ficha proceden de fuentes públicas y pueden quedar incompletos. Antes de decidir, lo más práctico es llamar a Asima y preguntar por plazas disponibles, horarios y cuotas actualizadas.',
  updated_at = NOW()
WHERE slug = 'asima-palma';

-- ATLAS ESCOLETA (atlas-escoleta-palma) [privado]
UPDATE centers SET
  long_description = E'En Carrer ANDREU TORRENS, 5 (07011), desarrolla su actividad Atlas Escoleta, un centro de titularidad privada dedicado al primer ciclo de educación infantil en Palma. Escolariza a bebés y niños desde los primeros meses hasta los 3 años.\n\nPara funcionar, los centros de 0-3 de las Illes Balears necesitan la autorización de la Conselleria d''Educació i Universitats, requisito que este centro cumple al constar en el directorio oficial. Más allá de ese dato, no hay servicios confirmados: el horario real, la alimentación o el calendario se conocen mejor en una visita.\n\nEsta página se ha elaborado con información de acceso público y puede no reflejar cambios recientes. Para confirmar plazas y condiciones económicas del curso, contacta directamente con el centro.',
  updated_at = NOW()
WHERE slug = 'atlas-escoleta-palma';

-- BABERITOS (baberitos-palma) [privado]
UPDATE centers SET
  long_description = E'Baberitos ocupa el número 72 de Carrer GUASP (07007), en Es Coll d''en Rabassa, uno de los núcleos del término municipal de Palma. Es un centro privado de educación infantil de primer ciclo, para niños de 0 a 3 años.\n\nEl directorio del Govern balear recoge su autorización, pero no describe cómo funciona el día a día. En esta etapa la jornada se articula en torno a rutinas de juego, alimentación y descanso, y cada escuela fija su propio horario y sus servicios, así que merece la pena preguntarlos.\n\nLa información aquí publicada tiene origen en fuentes oficiales de consulta pública. Para conocer disponibilidad de plaza, cuotas y organización del curso, la vía más fiable es el contacto directo con el centro.',
  updated_at = NOW()
WHERE slug = 'baberitos-palma';

-- BABERITOS TENIS (baberitos-tenis-palma) [privado]
UPDATE centers SET
  long_description = E'Con dirección en Carrer CAN BARO, 9 (07014), Baberitos Tenis es una guardería privada de Palma inscrita en el directorio de centros educativos del Govern de les Illes Balears. Su ámbito es el primer ciclo de infantil: de 0 a 3 años.\n\nEn la fuente consultada no constan servicios adicionales confirmados. Cuestiones como el comedor, el horario de apertura o el modo de organizar el periodo de adaptación las define cada centro de esta etapa, por lo que conviene tratarlas con el equipo educativo.\n\nFicha construida a partir de datos públicos, sujeta a actualización. Antes de solicitar plaza, pregunta al centro por las vacantes del curso y por las tarifas vigentes.',
  updated_at = NOW()
WHERE slug = 'baberitos-tenis-palma';

-- CA NOSTRA (ca-nostra-palma) [privado]
UPDATE centers SET
  long_description = E'El directorio de centros educativos de les Illes Balears recoge a Ca Nostra, guardería privada de primer ciclo con sede en Carrer COTLLIURE, 44 (07010), en Palma. Admite a niños de 0 a 3 años.\n\nNo hay servicios verificados en la fuente oficial. En el primer ciclo, la organización de los grupos por edades y el ritmo de la jornada dependen de cada proyecto, y son precisamente los aspectos que mejor se aprecian visitando el centro.\n\nCuanto aparece en esta ficha se ha tomado de registros de acceso público. Recomendamos contactar con Ca Nostra para resolver dudas sobre plazas, horarios y cuotas antes de tomar una decisión.',
  updated_at = NOW()
WHERE slug = 'ca-nostra-palma';

-- CASTELL ENCANTAT (castell-encantat-palma) [privado]
UPDATE centers SET
  long_description = E'Castell Encantat es un centro privado de educación infantil de primer ciclo con dirección en Carrer JERONI POU, 24 (07006), en Palma. Trabaja con niños desde los primeros meses de vida hasta los 3 años.\n\nSu inscripción en el directorio oficial del Govern acredita que está autorizado para esta etapa, aunque la fuente no añade información sobre servicios. Comedor, horario ampliado o idiomas no constan, de manera que son puntos a confirmar con el centro.\n\nEsta ficha reúne información de fuentes públicas y puede completarse con el tiempo. Llamar al centro sigue siendo la mejor forma de saber si hay plaza y en qué condiciones.',
  updated_at = NOW()
WHERE slug = 'castell-encantat-palma';

-- DUES LLUNES, ESCOLA D'INFANTS (dues-llunes-escola-dinfants-palma) [privado]
UPDATE centers SET
  long_description = E'Bajo el nombre de Dues Llunes, Escola d''Infants funciona una guardería privada en Avinguda PICASSO, 59 (07014), en Palma. Atiende el primer ciclo de educación infantil, de 0 a 3 años.\n\nEl registro oficial no detalla el funcionamiento diario del centro. Como referencia de la etapa, la incorporación de los más pequeños suele acompañarse de un periodo de adaptación pactado con la familia, cuya duración y formato decide cada escuela.\n\nLa información de esta página procede de fuentes públicas y puede quedar desactualizada. Para plazas, calendario y precios, lo indicado es hablar directamente con el equipo del centro.',
  updated_at = NOW()
WHERE slug = 'dues-llunes-escola-dinfants-palma';

-- DULCES SUEÑOS (dulces-suenos-palma) [privado]
UPDATE centers SET
  long_description = E'En Carrer LLUIS ALEMANY I PUJOL, 8 (07010), se encuentra Dulces Sueños, centro privado de primer ciclo de educación infantil en Palma. Su alumnado va de los primeros meses a los 3 años.\n\nLa consulta al directorio del Govern balear confirma la autorización del centro, sin más detalle sobre servicios. En los centros 0-3, el horario de entrada y salida, la comida y la siesta se organizan de forma distinta en cada proyecto, por lo que son preguntas útiles para una primera llamada.\n\nDatos obtenidos de fuentes oficiales de consulta abierta. Conviene verificar con el propio centro las plazas libres y las cuotas del curso en marcha.',
  updated_at = NOW()
WHERE slug = 'dulces-suenos-palma';

-- DULCES SUEÑOS CIUDAD JARDÍN (dulces-suenos-ciudad-jardin-palma) [privado]
UPDATE centers SET
  long_description = E'Dulces Sueños Ciudad Jardín desarrolla su actividad en Carrer TRAFALGAR, 23 (07007), en la zona de Ciutat Jardí, dentro del término municipal de Palma. Es un centro privado dedicado al primer ciclo de educación infantil, de 0 a 3 años.\n\nEn la fuente oficial no aparecen servicios confirmados para este centro. La etapa 0-3 se caracteriza por grupos reducidos organizados por edades y por una atención muy centrada en los cuidados, si bien la concreción de horarios y servicios corresponde a cada escuela.\n\nLos datos mostrados provienen de fuentes públicas y pueden estar incompletos. Pregunta directamente al centro por disponibilidad, horarios y condiciones económicas.',
  updated_at = NOW()
WHERE slug = 'dulces-suenos-ciudad-jardin-palma';

-- ESCOLA NOVA (escola-nova-palma) [privado]
UPDATE centers SET
  long_description = E'Escola Nova es una guardería privada de Palma ubicada en Carrer de Pablo Iglesias, 76 (07004). Consta en el directorio oficial de centros educativos del Govern de les Illes Balears como centro de primer ciclo de infantil, para niños de 0 a 3 años.\n\nLa fuente no recoge servicios adicionales. En esta etapa, aspectos como la ampliación de jornada o el servicio de comida varían mucho de un centro a otro y suelen ajustarse cada curso, así que lo razonable es preguntarlos antes de matricular.\n\nEsta ficha se ha elaborado con información pública y no sustituye a la del propio centro. Contacta con Escola Nova para conocer plazas, horarios y tarifas actualizadas.',
  updated_at = NOW()
WHERE slug = 'escola-nova-palma';

-- ESCOLETA INFANTIL GRAN MÓN (escoleta-infantil-gran-mon-palma) [privado]
UPDATE centers SET
  long_description = E'La dirección de Escoleta Infantil Gran Món es Carrer JOSEP D''OLEZA, 5 (07010), en Palma. Se trata de un centro de titularidad privada centrado en el primer ciclo de educación infantil, que abarca de los 0 a los 3 años.\n\nSu presencia en el directorio del Govern acredita la autorización para esta etapa, pero no hay constancia oficial de servicios. Comedor, acogida temprana o actividades complementarias, si existen, deben confirmarse con el equipo educativo.\n\nLa información publicada procede de fuentes de acceso público. Antes de formalizar una solicitud, merece la pena confirmar plazas y cuotas con el propio centro.',
  updated_at = NOW()
WHERE slug = 'escoleta-infantil-gran-mon-palma';

-- ESCOLETA LUIS VIVES (escoleta-luis-vives-palma) [privado]
UPDATE centers SET
  long_description = E'En Carrer de Can Domenge, 3 (07003), en Palma, funciona Escoleta Luis Vives, un centro privado de educación infantil de primer ciclo que acoge a niños de 0 a 3 años.\n\nEl directorio oficial no incluye información sobre servicios ni horarios. En el 0-3 cada escuela define su propio calendario y su forma de trabajar los cuidados y el juego, de ahí que la visita al centro siga siendo la mejor fuente de información.\n\nTodo lo recogido aquí procede de documentación pública. Para plazas disponibles, precios y funcionamiento del día a día, contacta con el centro.',
  updated_at = NOW()
WHERE slug = 'escoleta-luis-vives-palma';

-- ESCOLETA PEQUEÑO DA VINCI (escoleta-pequeno-da-vinci-palma) [privado]
UPDATE centers SET
  long_description = E'Escoleta Pequeño Da Vinci se sitúa en Carrer Maria Agnesi, Parcel·la 53-55 (Parc BIT), 07121, en Palma. Es un centro privado de primer ciclo de educación infantil, dirigido a niños de 0 a 3 años.\n\nLa fuente oficial consultada no confirma servicios concretos para este centro. Como en el resto de escoletas de la etapa, el horario, la comida y la organización de las aulas por edades son aspectos que fija cada proyecto y conviene contrastar directamente.\n\nEsta ficha se ha construido con datos de fuentes públicas y puede completarse. Escribe o llama al centro para conocer plazas, horarios y cuotas del curso.',
  updated_at = NOW()
WHERE slug = 'escoleta-pequeno-da-vinci-palma';

-- ESCOLETA PESSIGOLLES (escoleta-pessigolles-palma) [privado]
UPDATE centers SET
  long_description = E'Escoleta Pessigolles atiende a niños de 0 a 3 años en Carrer GUILLEM MASSOT, 50 (07003), en Palma. Es un centro de titularidad privada inscrito en el directorio de centros educativos del Govern balear.\n\nNo constan servicios verificados en la fuente oficial. En la etapa de primer ciclo, la adaptación de los más pequeños suele plantearse de forma progresiva durante las primeras semanas, con un ritmo que acuerda cada centro con las familias.\n\nInformación recopilada a partir del directorio público de centros educativos. Recomendamos contactar con la escoleta para confirmar disponibilidad de plaza, horarios y precios.',
  updated_at = NOW()
WHERE slug = 'escoleta-pessigolles-palma';

-- ESCOLETA SOMNIS (escoleta-somnis-palma) [privado]
UPDATE centers SET
  long_description = E'Escoleta Somnis tiene su sede en Carrer BASTERA NA, 19 (07010), en Es Secar de la Real, barrio del término municipal de Palma. Ofrece primer ciclo de educación infantil para niños de 0 a 3 años y es de titularidad privada.\n\nEn el directorio oficial no figuran servicios adicionales confirmados. Comedor, horario ampliado o salidas son cuestiones que cada escuela resuelve a su manera en esta etapa, por lo que conviene preguntarlas antes de decidir.\n\nFicha elaborada a partir de datos públicos, susceptible de actualización. El propio centro es quien puede informar sobre plazas, cuotas y organización del curso.',
  updated_at = NOW()
WHERE slug = 'escoleta-somnis-palma';

-- ES LLAÜT (es-llaut-palma) [privado]
UPDATE centers SET
  long_description = E'Es Llaüt es una guardería privada de primer ciclo situada en Carrer XALOC, 9 (07610), en Can Pastilla, dentro del término municipal de Palma. Trabaja con niños desde los primeros meses hasta los 3 años.\n\nEl registro del Govern acredita su autorización como centro de esta etapa, sin detallar servicios. La jornada en el 0-3 combina juego, alimentación y descanso, y su distribución concreta depende del proyecto de cada centro.\n\nLos datos mostrados proceden de fuentes públicas y pueden no estar completos. Para plazas, horarios y tarifas, lo mejor es hablar con el centro.',
  updated_at = NOW()
WHERE slug = 'es-llaut-palma';

-- ES PETIT CASTELL (es-petit-castell-palma) [privado]
UPDATE centers SET
  long_description = E'Con sede en Carrer SOR ELIONOR ORTIZ, 8 (07011), Es Petit Castell es un centro privado de educación infantil de primer ciclo en Palma, para niños de 0 a 3 años.\n\nEn la fuente oficial no hay servicios confirmados. En esta etapa, los grupos se organizan por edades y con ratios reguladas, pero el número de aulas, el horario y los servicios complementarios los define cada escuela.\n\nEl contenido de este perfil se ha reunido a partir de fuentes abiertas. Antes de tomar una decisión, pregunta al centro por vacantes, calendario y condiciones económicas.',
  updated_at = NOW()
WHERE slug = 'es-petit-castell-palma';

-- ES PONTET (es-pontet-palma) [privado]
UPDATE centers SET
  long_description = E'Es Pontet desarrolla su actividad en Carrer GABRIEL MAURA, 8 (07005), en Palma, como centro privado dedicado al primer ciclo de educación infantil, de 0 a 3 años.\n\nEl directorio del Govern balear no añade información sobre horarios ni servicios. Cuestiones prácticas como la hora de entrada, la comida o la posibilidad de recogida flexible se concretan en cada centro, así que conviene consultarlas.\n\nLa información publicada procede de fuentes oficiales de consulta pública. Contacta con Es Pontet para confirmar plazas y cuotas del curso actual.',
  updated_at = NOW()
WHERE slug = 'es-pontet-palma';

-- ESTRELLETES (estrelletes-palma) [privado]
UPDATE centers SET
  long_description = E'Estrelletes es un centro privado de primer ciclo de educación infantil ubicado en Carrer d''Adrià Ferran, 33 (07007), en Palma. Acoge a niños de 0 a 3 años.\n\nNo constan servicios confirmados en la fuente consultada. La escolarización temprana implica un acompañamiento estrecho en la adaptación y en las rutinas diarias, y cada escuela decide cómo articularlo, por lo que es un buen tema para la primera conversación con el equipo.\n\nAquí solo se recogen datos de origen público, que pueden quedar incompletos. Recomendamos llamar al centro para conocer disponibilidad, horarios y precios.',
  updated_at = NOW()
WHERE slug = 'estrelletes-palma';

-- GIANNI RODARI (gianni-rodari-palma) [privado]
UPDATE centers SET
  long_description = E'En Avinguda Arquitecte Gaspar Bennàssar, 46 (07004), en Palma, se encuentra Gianni Rodari, guardería privada de primer ciclo de educación infantil para niños de 0 a 3 años.\n\nLa fuente oficial se limita a acreditar la autorización del centro. No hay constancia de comedor, ampliación horaria ni otros servicios, de modo que esos detalles hay que confirmarlos con el propio equipo educativo.\n\nEsta ficha se ha elaborado con datos públicos y no sustituye a la información del centro. Pregunta directamente por plazas, calendario y cuotas.',
  updated_at = NOW()
WHERE slug = 'gianni-rodari-palma';

-- HAKUNA (hakuna-palma) [privado]
UPDATE centers SET
  long_description = E'Hakuna es una escoleta privada de Palma con dirección en Carrer MIQUEL MARQUES, 19 (07005). Su actividad se dirige al primer ciclo de educación infantil, es decir, a niños de 0 a 3 años.\n\nEl directorio oficial no recoge servicios verificados. En esta etapa el trato es necesariamente cercano y el número de plazas suele ser limitado, aunque la organización concreta de aulas y horarios varía de un centro a otro.\n\nEste perfil puede incluir información procedente de fuentes públicas. Para saber si hay plaza libre y en qué condiciones, lo más directo es contactar con el centro.',
  updated_at = NOW()
WHERE slug = 'hakuna-palma';

-- HAPPY FACES (happy-faces-palma) [privado]
UPDATE centers SET
  long_description = E'Happy Faces está en Carrer ROBERT GRAVES, 91 (07015), en El Terreno, dentro del término municipal de Palma. Es un centro privado de educación infantil de primer ciclo, para niños de 0 a 3 años.\n\nEn la fuente oficial no aparecen servicios confirmados ni información sobre idiomas o metodología. Estos aspectos los define cada escuela de la etapa 0-3, así que conviene preguntarlos directamente antes de decidir.\n\nFicha elaborada con datos de acceso público, sujeta a cambios. El centro es la fuente más fiable para conocer plazas, horarios y tarifas del curso.',
  updated_at = NOW()
WHERE slug = 'happy-faces-palma';

-- HOBBITON (hobbiton-palma) [privado]
UPDATE centers SET
  long_description = E'Hobbiton ocupa el número 4 de Carrer BISBE RAFAEL JOSEP VERGER (07010), en Palma. Se trata de una guardería privada de primer ciclo de educación infantil que atiende de los 0 a los 3 años.\n\nSu autorización consta en el directorio del Govern de les Illes Balears, pero no así los servicios. En el primer ciclo, comedor y horario son los dos elementos que más condicionan la elección de las familias y también los que más varían entre centros.\n\nNada de lo anterior sustituye a la información que facilita el propio centro. Antes de solicitar plaza, confirma con Hobbiton la disponibilidad y las condiciones actualizadas.',
  updated_at = NOW()
WHERE slug = 'hobbiton-palma';

-- ITACA (itaca-palma) [concertado]
UPDATE centers SET
  long_description = E'Itaca es un centro concertado de educación infantil de primer ciclo situado en Carrer VALLDARGENT, 20 (07013), en Palma. Escolariza a niños de 0 a 3 años.\n\nSegún el directorio oficial, cuenta con convenio de colaboración con la Conselleria d''Educació i Universitats, un régimen que suele traducirse en condiciones económicas distintas a las de un centro privado. La fuente no detalla, en cambio, servicios ni horarios, así que esos puntos deben tratarse con el centro.\n\nLa información de esta ficha procede de fuentes públicas y puede quedar incompleta. Para conocer plazas, plazos de solicitud y cuotas, contacta directamente con Itaca.',
  updated_at = NOW()
WHERE slug = 'itaca-palma';

-- ITACA NOVA (itaca-nova-palma) [privado]
UPDATE centers SET
  long_description = E'Itaca Nova es un centro privado de primer ciclo de educación infantil con dirección en Carrer SON ESPANYOLET, 3 (07014), en Palma, para niños de 0 a 3 años.\n\nEl registro oficial acredita su autorización, sin más detalle. La forma de organizar los grupos, el horario de apertura o los servicios de comida son decisiones propias de cada centro de esta etapa y conviene consultarlas antes de matricular.\n\nEsta ficha reúne información de origen público. El centro es quien puede confirmar plazas disponibles, precios y funcionamiento del curso.',
  updated_at = NOW()
WHERE slug = 'itaca-nova-palma';

-- JARDINES DE LA INFANCIA PUREZA DE MARÍA (jardines-de-la-infancia-pureza-de-maria-palma) [concertado]
UPDATE centers SET
  long_description = E'Jardines de la Infancia Pureza de María se encuentra en Carrer De la Mare Alberta, 11 (07010), en Establiments, dentro del término municipal de Palma. Es un centro concertado de educación infantil de primer ciclo, de 0 a 3 años.\n\nEl directorio del Govern lo recoge como centro con convenio de colaboración con la Conselleria d''Educació i Universitats. No especifica servicios, por lo que el horario, el comedor y las condiciones de acceso son cuestiones que hay que confirmar con la secretaría del centro.\n\nLos datos de esta página proceden de fuentes públicas y pueden variar de un curso a otro. Recomendamos contactar con el centro para informarse sobre plazas y cuotas.',
  updated_at = NOW()
WHERE slug = 'jardines-de-la-infancia-pureza-de-maria-palma';

-- KAIA (kaia-palma) [privado]
UPDATE centers SET
  long_description = E'En Carrer ARAGO, 224A (07008), en Palma, funciona Kaia, un centro privado dedicado al primer ciclo de educación infantil. Su alumnado tiene entre 0 y 3 años.\n\nLa fuente oficial consultada no incluye servicios confirmados. En la etapa 0-3 la jornada gira en torno a los cuidados, el juego y el descanso, y cada escuela adapta esos tiempos a su propio proyecto y a su horario.\n\nLo que aparece en esta página sale de registros de consulta pública. Para conocer vacantes, horarios reales y tarifas, lo más práctico es llamar al centro.',
  updated_at = NOW()
WHERE slug = 'kaia-palma';

-- KOALA (koala-palma) [privado]
UPDATE centers SET
  long_description = E'Koala es una guardería privada de Palma instalada en Carrer JOAN MAS, 3 (07010). Atiende el primer ciclo de educación infantil, desde los primeros meses hasta los 3 años.\n\nNo hay servicios verificados en el directorio del Govern balear. Comedor, acogida matinal o actividades complementarias, si el centro los ofrece, no aparecen recogidos en la fuente, de modo que conviene preguntarlos.\n\nLos datos aquí mostrados proceden de registros públicos y pueden estar incompletos. Contacta con Koala para confirmar plazas, calendario y condiciones económicas.',
  updated_at = NOW()
WHERE slug = 'koala-palma';

-- LA SIRENITA (la-sirenita-palma) [privado]
UPDATE centers SET
  long_description = E'La Sirenita desarrolla su actividad en Carrer MARTI COSTA, 4 (07013), en Palma, como centro privado de educación infantil de primer ciclo para niños de 0 a 3 años.\n\nEl directorio oficial acredita la autorización del centro, pero no describe su funcionamiento. En esta etapa el periodo de adaptación al inicio de curso es habitual y cada escuela lo pauta con las familias según su criterio.\n\nPublicamos únicamente datos de origen público, que pueden haber cambiado. Antes de decidir, pregunta al centro por plazas libres, horarios y cuotas del curso.',
  updated_at = NOW()
WHERE slug = 'la-sirenita-palma';

-- LLUNA DE PAPER (lluna-de-paper-palma) [privado]
UPDATE centers SET
  long_description = E'Lluna de Paper es un centro privado de primer ciclo de educación infantil situado en Carrer AMETLER, 16 (07008), en Palma. Trabaja con niños de 0 a 3 años.\n\nEn la fuente oficial no constan servicios adicionales. Los horarios, el servicio de comida y la organización por edades son aspectos que varían entre escoletas y que conviene contrastar directamente con el equipo.\n\nEsta ficha se ha elaborado con información pública y puede completarse con el tiempo. Para plazas y precios, contacta con el centro.',
  updated_at = NOW()
WHERE slug = 'lluna-de-paper-palma';

-- MERAKI (meraki-palma) [privado]
UPDATE centers SET
  long_description = E'Con dirección en Carrer NICETO ALCALA ZAMORA, 24 (07013), Meraki es una escoleta privada de Palma dedicada al primer ciclo de educación infantil, de 0 a 3 años.\n\nSu inscripción en el directorio del Govern confirma que está autorizada para esta etapa; no hay, en cambio, información oficial sobre servicios. Cuestiones como el horario de recogida o la alimentación se resuelven de forma distinta en cada centro.\n\nToda la información de este perfil se ha extraído de fuentes abiertas y puede quedar desactualizada. Recomendamos confirmar con el centro la disponibilidad de plaza y las cuotas.',
  updated_at = NOW()
WHERE slug = 'meraki-palma';

-- MOMO (momo-palma) [privado]
UPDATE centers SET
  long_description = E'Momo es una guardería privada de primer ciclo con sede en Carrer PRIMAVERA, 6 (07010), en Palma, para niños desde los primeros meses hasta los 3 años.\n\nLa fuente consultada no recoge servicios confirmados. En el 0-3, la relación diaria entre el equipo educativo y la familia es una parte importante del funcionamiento, y cada centro la organiza con sus propios canales y horarios.\n\nEsta ficha se apoya en datos de fuentes públicas. Llama al centro para conocer plazas disponibles, horarios y condiciones económicas.',
  updated_at = NOW()
WHERE slug = 'momo-palma';

-- MÓN PETITÓ (mon-petito-palma) [privado]
UPDATE centers SET
  long_description = E'Món Petitó atiende el primer ciclo de educación infantil en Carrer SANT MARC, 20 (07009), en Palma. Es un centro de titularidad privada para niños de 0 a 3 años.\n\nEl directorio oficial no detalla servicios ni horarios de este centro. En esta etapa cada escuela define su calendario y la forma de acompañar la entrada de los más pequeños, así que son preguntas útiles para una primera visita.\n\nEste perfil se ha completado con datos de acceso público. Contacta con Món Petitó para confirmar plazas y tarifas del curso.',
  updated_at = NOW()
WHERE slug = 'mon-petito-palma';

-- NANAI (nanai-palma) [privado]
UPDATE centers SET
  long_description = E'Nanai está en Carrer JOAN MASCARO I FORNES, 84 (07010), en Es Secar de la Real, dentro del término municipal de Palma. Es un centro privado de educación infantil de primer ciclo, de 0 a 3 años.\n\nNo constan servicios verificados en la fuente oficial. La etapa 0-3 se organiza en torno a rutinas estables de alimentación, higiene y descanso, aunque el horario concreto y los servicios los decide cada centro.\n\nFicha elaborada con datos públicos y sujeta a actualización. Para plazas, horarios y cuotas, lo indicado es hablar directamente con el centro.',
  updated_at = NOW()
WHERE slug = 'nanai-palma';

-- NUESTRA SEÑORA DE LA PROVIDENCIA (nuestra-senora-de-la-providencia-palma) [concertado]
UPDATE centers SET
  long_description = E'Nuestra Señora de la Providencia es un centro concertado de primer ciclo de educación infantil con sede en Carrer BISBE, 10 (07003), en Palma. Atiende a niños de 0 a 3 años.\n\nEn el directorio oficial figura con convenio de colaboración con la Conselleria d''Educació i Universitats. La fuente no concreta servicios ni horarios, de modo que el comedor, la jornada y los plazos de solicitud son cuestiones a consultar con el centro.\n\nLos datos de esta ficha proceden de fuentes públicas y pueden estar incompletos. Recomendamos contactar con el centro para conocer plazas y condiciones actualizadas.',
  updated_at = NOW()
WHERE slug = 'nuestra-senora-de-la-providencia-palma';

-- PALMA (palma-palma) [privado]
UPDATE centers SET
  long_description = E'El centro Palma, en Carrer ARAGO, 153 (07005), es una guardería privada de primer ciclo de educación infantil de la propia ciudad de Palma. Su alumnado va de los 0 a los 3 años.\n\nLa fuente oficial acredita la autorización del centro sin entrar en detalles de funcionamiento. Comedor, horario ampliado o idiomas no aparecen confirmados, así que conviene preguntarlos antes de solicitar plaza.\n\nEsta ficha se ha construido con información de acceso público. El propio centro puede informar sobre vacantes, calendario y cuotas del curso.',
  updated_at = NOW()
WHERE slug = 'palma-palma';

-- PATIM-PATAM (patim-patam-palma) [privado]
UPDATE centers SET
  long_description = E'Patim-patam es un centro privado de educación infantil de primer ciclo situado en Carrer TANCA D''ABAIX, 13 (07013), en Palma, para niños de 0 a 3 años.\n\nEn el directorio del Govern no hay servicios confirmados para este centro. En la etapa 0-3, el tamaño reducido de los grupos y el acompañamiento en la adaptación son rasgos comunes, pero la organización concreta corresponde a cada escuela.\n\nCuanto se publica aquí tiene su origen en registros públicos. Antes de decidir, confirma con el centro las plazas disponibles y las condiciones económicas.',
  updated_at = NOW()
WHERE slug = 'patim-patam-palma';

-- PAULA TORRES (paula-torres-palma) [publico - Conselleria]
UPDATE centers SET
  long_description = E'Paula Torres es una escuela infantil pública de primer ciclo situada en Carrer AMER, 53 (07007), en Palma, con alumnado de 0 a 3 años.\n\nA diferencia de las escoles d''infants municipales del Patronat Municipal d''Escoles d''Infants, este centro es de titularidad de la Conselleria d''Educació i Universitats del Govern de les Illes Balears. La fuente consultada no detalla horarios ni servicios, y el acceso a una plaza pública se tramita mediante los procesos de admisión que se convocan cada curso, cuyos plazos conviene consultar con antelación.\n\nLos datos de esta ficha proceden de fuentes oficiales de acceso público. Para confirmar el calendario de admisión, el horario y las cuotas, lo más fiable es contactar directamente con el centro.',
  updated_at = NOW()
WHERE slug = 'paula-torres-palma';

-- PEKES (pekes-palma) [privado]
UPDATE centers SET
  long_description = E'Pekes es una escoleta privada de Palma ubicada en Carrer d''Alfons el Magnànim, 94 (07004). Se dedica al primer ciclo de educación infantil, de 0 a 3 años.\n\nEl directorio oficial no aporta información sobre servicios ni sobre el horario del centro. Estos elementos, junto con el modo de plantear la adaptación, los define cada escuela de la etapa y son los que más conviene preguntar.\n\nEsta ficha se ha elaborado a partir de datos públicos. Contacta con Pekes para conocer disponibilidad de plaza, horarios y tarifas.',
  updated_at = NOW()
WHERE slug = 'pekes-palma';

-- PETIT ANGELET (petit-angelet-palma) [privado]
UPDATE centers SET
  long_description = E'En Carrer de Son Oliva, 7 B (07004), en Palma, desarrolla su actividad Petit Angelet, centro privado de primer ciclo de educación infantil para niños de 0 a 3 años.\n\nLa fuente oficial consultada no confirma servicios. En esta etapa, cada centro organiza su jornada y decide si ofrece comida, ampliación horaria o periodos especiales en verano, así que son preguntas pertinentes para la primera toma de contacto.\n\nDatos tomados de fuentes públicas, que pueden variar de un curso a otro. El centro es quien puede confirmar plazas, calendario y cuotas.',
  updated_at = NOW()
WHERE slug = 'petit-angelet-palma';

-- PINOCHO (pinocho-palma) [concertado]
UPDATE centers SET
  long_description = E'Pinocho es un centro concertado de educación infantil inscrito en el directorio del Govern de les Illes Balears, con dirección en Carrer CARRER DE MAS, 10 (07014), en Palma. Atiende el primer ciclo, de 0 a 3 años.\n\nEl concierto implica un convenio de colaboración con la Conselleria d''Educació i Universitats, aunque la fuente no detalla qué servicios ofrece el centro ni con qué horario. Comedor, jornada y proceso de solicitud son puntos que conviene aclarar con la secretaría.\n\nEsta ficha se apoya en datos de acceso público y puede quedar incompleta. Para plazas y condiciones económicas, contacta directamente con Pinocho.',
  updated_at = NOW()
WHERE slug = 'pinocho-palma';

-- POPEYE (popeye-palma) [concertado]
UPDATE centers SET
  long_description = E'Con sede en Carrer MESTRE CHAPI, 42 (07008), Popeye es un centro concertado de primer ciclo de educación infantil en Palma, para niños de 0 a 3 años.\n\nSu condición de centro concertado supone un convenio con la Conselleria d''Educació i Universitats, dato que consta en el directorio oficial. No hay en cambio información sobre horarios o servicios, de modo que esos aspectos hay que consultarlos con el propio centro.\n\nInformación obtenida de registros oficiales de consulta abierta. Recomendamos contactar con Popeye para conocer plazas, plazos y cuotas del curso.',
  updated_at = NOW()
WHERE slug = 'popeye-palma';

-- RIN TIN TIN (rin-tin-tin-palma) [privado]
UPDATE centers SET
  long_description = E'Rin Tin Tin es una guardería privada de primer ciclo de educación infantil situada en Carrer ARXIDUC LLUIS SALVADOR, 54 (07004), en Palma. Acoge a niños de 0 a 3 años.\n\nEl registro del Govern balear no recoge servicios confirmados. En la etapa 0-3 la continuidad entre casa y escuela es clave, y cada centro establece sus propios canales de comunicación y sus rutinas, por lo que merece la pena conocerlos de primera mano.\n\nLa información aquí reunida procede de fuentes públicas. Antes de solicitar plaza, confirma con el centro la disponibilidad y las tarifas vigentes.',
  updated_at = NOW()
WHERE slug = 'rin-tin-tin-palma';

-- ROPIT (ropit-palma) [privado]
UPDATE centers SET
  long_description = E'Ropit atiende a niños de 0 a 3 años en Carrer RAMON MUNTANER, 10-12 (07003), en Palma. Es un centro de titularidad privada dedicado al primer ciclo de educación infantil.\n\nNo hay servicios verificados en la fuente oficial consultada. El horario de apertura, la comida o la organización de las aulas por edades dependen del proyecto de cada escoleta y son detalles que se conocen mejor visitando el centro.\n\nTrabajamos aquí con datos de origen público, sujetos a cambios. Contacta con Ropit para informarte sobre plazas, horarios y cuotas.',
  updated_at = NOW()
WHERE slug = 'ropit-palma';

-- SA CAPÇANETA (sa-capcaneta-palma) [privado]
UPDATE centers SET
  long_description = E'Sa Capçaneta se encuentra en Carrer CA''S QUITXERO, 25 (07199), en Sant Jordi, uno de los núcleos del término municipal de Palma. Es un centro privado de primer ciclo de educación infantil, de 0 a 3 años.\n\nEl directorio oficial no detalla servicios. En los núcleos y barrios alejados del centro de Palma, la escoleta suele ser un servicio de proximidad para las familias del entorno, aunque el horario y las prestaciones concretas los fija cada centro.\n\nLos datos publicados proceden de fuentes públicas y pueden quedar incompletos. Para plazas, horarios y precios, lo más directo es llamar al centro.',
  updated_at = NOW()
WHERE slug = 'sa-capcaneta-palma';

-- SA MILOCA (sa-miloca-palma) [privado]
UPDATE centers SET
  long_description = E'Sa Miloca es una escoleta privada de Palma con dirección en Carrer de Manacor, 59 (07005). Su actividad se centra en el primer ciclo de educación infantil, de 0 a 3 años.\n\nLa fuente oficial acredita la autorización del centro, pero no describe servicios ni horarios. Como en el resto de escuelas de la etapa, la adaptación inicial y las rutinas diarias se organizan según el criterio de cada equipo educativo.\n\nEsta ficha se ha elaborado con información pública. Recomendamos confirmar con el centro las plazas libres y las condiciones del curso.',
  updated_at = NOW()
WHERE slug = 'sa-miloca-palma';

-- SANT AGUSTÍ (sant-agusti-palma) [privado]
UPDATE centers SET
  long_description = E'En Carrer VICTORIO LUZURIAGA, 14 (07015), en Palma, se encuentra Sant Agustí, centro privado de educación infantil de primer ciclo para niños de 0 a 3 años.\n\nEn el directorio del Govern no constan servicios adicionales. Comedor, acogida temprana o actividades de verano no aparecen confirmados, de modo que conviene preguntarlos directamente antes de solicitar información.\n\nLo recogido en esta ficha viene de fuentes de acceso público y puede completarse. El centro es la vía más fiable para conocer plazas, horarios y cuotas.',
  updated_at = NOW()
WHERE slug = 'sant-agusti-palma';

-- S'ESTEL (sestel-palma) [privado]
UPDATE centers SET
  long_description = E'S''Estel es una guardería privada de primer ciclo situada en Carrer de la Missió, 29 (07003), en Palma, con alumnado de 0 a 3 años.\n\nLa fuente consultada no incluye servicios confirmados para este centro. En la etapa 0-3, cada escuela decide su horario, su calendario y la manera de trabajar con las familias, así que son aspectos a tratar directamente con el equipo.\n\nLos datos de esta ficha tienen origen público y pueden variar. Contacta con el centro para confirmar disponibilidad de plaza y tarifas.',
  updated_at = NOW()
WHERE slug = 'sestel-palma';

-- SIETE ENANITOS (siete-enanitos-palma) [privado]
UPDATE centers SET
  long_description = E'Siete Enanitos ocupa el número 3A de Carrer del Bisbe Cabanelles (07005), en Palma. Es un centro privado dedicado al primer ciclo de educación infantil, de 0 a 3 años.\n\nEl directorio oficial acredita su autorización sin especificar servicios. En esta etapa, el acompañamiento del inicio de curso suele hacerse de forma progresiva y cada centro acuerda con la familia cómo plantearlo.\n\nEsta página se ha elaborado con datos públicos y no sustituye la información del centro. Pregunta directamente por plazas, horarios y cuotas.',
  updated_at = NOW()
WHERE slug = 'siete-enanitos-palma';

-- SOL SOLET (sol-solet-palma) [privado]
UPDATE centers SET
  long_description = E'Sol Solet es un centro privado de educación infantil de primer ciclo con sede en Carrer GENERAL RIERA, 88 (07010), en Palma, para niños de 0 a 3 años.\n\nNo hay constancia oficial de servicios como comedor, ampliación de horario o idiomas. Estas prestaciones varían de una escoleta a otra y suelen revisarse cada curso, por lo que conviene confirmarlas con el centro.\n\nEste perfil se apoya en documentación pública y no recoge todo lo que ofrece el centro. Para conocer vacantes y condiciones económicas actualizadas, contacta con Sol Solet.',
  updated_at = NOW()
WHERE slug = 'sol-solet-palma';

-- SON ESPASES (son-espases-palma) [privado]
UPDATE centers SET
  long_description = E'Son Espases es una escoleta privada de primer ciclo situada en Carretera VALLDEMOSSA, 79 (07120), en Palma. Atiende a niños desde los primeros meses hasta los 3 años.\n\nLa fuente oficial consultada no recoge servicios ni horarios. En el 0-3, la organización de la jornada y los servicios complementarios responden al proyecto de cada centro, de modo que son preguntas útiles para una primera llamada.\n\nFicha construida a partir de información pública, sujeta a actualización. El centro puede confirmar plazas disponibles, horarios y cuotas.',
  updated_at = NOW()
WHERE slug = 'son-espases-palma';

-- SON LLATZER (son-llatzer-palma) [privado]
UPDATE centers SET
  long_description = E'Son Llatzer es un centro privado de educación infantil de primer ciclo ubicado en la Carretera de Manacor, km 4 (07198), en Palma. Escolariza a niños de 0 a 3 años.\n\nEn el directorio del Govern balear no figuran servicios confirmados. Aspectos como el comedor, el horario de entrada o la existencia de servicio de verano dependen de cada escuela y conviene consultarlos directamente.\n\nLos datos aquí publicados proceden de fuentes de acceso público. Antes de decidir, confirma con el centro la disponibilidad de plaza y las tarifas.',
  updated_at = NOW()
WHERE slug = 'son-llatzer-palma';

-- SWEET DREAMS (sweet-dreams-palma) [privado]
UPDATE centers SET
  long_description = E'Sweet Dreams desarrolla su actividad en Carrer ILLA DE MALTA, 4 (07007), en Palma, como centro privado de primer ciclo de educación infantil para niños de 0 a 3 años.\n\nEl registro oficial no detalla servicios. En esta etapa, el descanso, la alimentación y el juego estructuran la jornada, aunque cada centro los organiza con su propio horario y sus propios criterios.\n\nLa información aquí reunida es de origen público y puede quedar incompleta. Para plazas, horarios y precios, contacta directamente con el centro.',
  updated_at = NOW()
WHERE slug = 'sweet-dreams-palma';

-- TERINGA (teringa-palma) [privado]
UPDATE centers SET
  long_description = E'Teringa es una guardería privada de Palma con dirección en Carrer PAU PIFERRER, 7 (07011). Su ámbito es el primer ciclo de educación infantil, de 0 a 3 años.\n\nLa fuente oficial no confirma servicios adicionales. Cada escoleta de la etapa fija su calendario, su horario y la forma de acompañar la incorporación de los más pequeños, así que conviene preguntarlo al equipo.\n\nLa información publicada procede de registros públicos. Recomendamos llamar al centro para conocer plazas libres, cuotas y funcionamiento del curso.',
  updated_at = NOW()
WHERE slug = 'teringa-palma';

-- VIRGEN DE LORETO (virgen-de-loreto-palma) [publico - EIEL segun directorio, no listada en PMEI]
UPDATE centers SET
  long_description = E'Virgen de Loreto es una escuela infantil de titularidad pública dedicada al primer ciclo de educación infantil, con sede en la Carretera de Manacor, km 8 (07199), en Palma. Atiende a niños de 0 a 3 años.\n\nEn el directorio oficial del Govern de les Illes Balears aparece clasificada como escuela de educación infantil de primer ciclo de titularidad pública, si bien no figura entre las escoles d''infants que el Patronat Municipal d''Escoles d''Infants de Palma relaciona en su propia web. La fuente no detalla horarios ni servicios, y el acceso a una plaza pública se articula mediante procesos de admisión con plazos definidos cada curso.\n\nLos datos de esta ficha proceden de fuentes públicas y pueden estar incompletos. Para confirmar la titularidad, el calendario de admisión y las cuotas, lo más fiable es contactar con el centro.',
  updated_at = NOW()
WHERE slug = 'virgen-de-loreto-palma';

-- WABI SABI (wabi-sabi-palma) [privado]
UPDATE centers SET
  long_description = E'Wabi Sabi se sitúa en Carrer BARTOMEU OLIVER DE CAN TUNIS, 39 (07198), en Son Ferriol, dentro del término municipal de Palma. Es un centro privado de primer ciclo de educación infantil, de 0 a 3 años.\n\nEl directorio oficial no recoge servicios confirmados ni información sobre la propuesta educativa. En la etapa 0-3 cada escuela define su forma de trabajar y su horario, por lo que conviene conocerlos de primera mano antes de decidir.\n\nEsta ficha se ha elaborado con datos públicos y puede completarse con el tiempo. Contacta con el centro para informarte sobre plazas, horarios y cuotas.',
  updated_at = NOW()
WHERE slug = 'wabi-sabi-palma';

-- WONDERLAND NURSERY (wonderland-nursery-palma) [privado]
UPDATE centers SET
  long_description = E'Wonderland Nursery es un centro privado de educación infantil de primer ciclo con dirección en Carrer GALIANA, 1 (07013), en Palma. Trabaja con niños de 0 a 3 años.\n\nEn la fuente oficial consultada no constan servicios ni idiomas confirmados. La organización de las aulas, el horario y las prestaciones complementarias son decisiones de cada centro de la etapa y conviene contrastarlas directamente.\n\nFicha basada en datos de consulta pública, susceptibles de cambiar. Para conocer plazas disponibles y condiciones económicas, contacta con el centro.',
  updated_at = NOW()
WHERE slug = 'wonderland-nursery-palma';

-- ==========================================================
-- MURCIA — 36 centros
-- ==========================================================

-- BAMBI (bambi-murcia) [guarderia, privado, capital]
UPDATE centers SET
  long_description = E'Bambi es una guardería de titularidad privada inscrita en el mapa escolar de la Región de Murcia. Ocupa un local en la Calle La Seda, número 1 (edificio Madrid), en el 30009 de Murcia, y trabaja con la franja de 0 a 3 años, el primer ciclo de educación infantil.\n\nEl registro autonómico no detalla cómo organiza su jornada ni qué prestaciones complementarias ofrece. En el primer ciclo, cada centro decide su horario, la manera de agrupar a los niños por edades y el modo de plantear la entrada de los alumnos nuevos, así que esos puntos solo puede aclararlos el propio equipo.\n\nLo que aparece en esta ficha procede de fuentes públicas y puede haber cambiado desde la última actualización. Una llamada al centro es la vía más rápida para preguntar por plazas libres, horario y cuota mensual.',
  updated_at = NOW()
WHERE slug = 'bambi-murcia';

-- FUTURINES, S.L.L. (futurines-s-l-l-murcia) [guarderia, privado, Espinardo]
UPDATE centers SET
  long_description = E'En la Avenida Joven Futura, 29, bajo, dentro de Espinardo (30100), funciona Futurines, S.l.l., un centro privado de educación infantil del municipio de Murcia dedicado al tramo de 0 a 3 años.\n\nConsta autorizado en el mapa escolar de la Consejería de Educación de la Región de Murcia con el código 30020200, si bien esa fuente no recoge servicios como comedor o ampliación de horario. Conviene por tanto tratar directamente con el centro qué incluye la jornada y cómo se organiza el curso.\n\nEsta ficha se ha compuesto con datos de acceso público, que pueden quedar desactualizados de un año a otro. Antes de decidir, merece la pena confirmar con Futurines la disponibilidad de plazas, los horarios reales y las condiciones económicas.',
  updated_at = NOW()
WHERE slug = 'futurines-s-l-l-murcia';

-- VIRGEN DE LA FUENSANTA (virgen-de-la-fuensanta-murcia) [guarderia, privado, Espinardo]
UPDATE centers SET
  long_description = E'Virgen de la Fuensanta atiende el primer ciclo de educación infantil, de 0 a 3 años, en el Paseo de las Moreras, s/n, en Espinardo (30100). Es un centro de titularidad privada que figura en el mapa escolar regional.\n\nLa información oficial disponible se limita a los datos identificativos y de contacto: no constan horario publicado ni servicios verificados. En esta etapa la vida diaria gira en torno al juego, la alimentación y el descanso, y el reparto concreto de esos momentos lo fija cada escuela.\n\nLos datos mostrados provienen de registros públicos y pueden estar incompletos. Para saber si hay plaza este curso, en qué horario abre y qué cuota aplica, lo más fiable es hablar con el centro.',
  updated_at = NOW()
WHERE slug = 'virgen-de-la-fuensanta-murcia';

-- PEQUEÑAS SONRISAS (pequenas-sonrisas-murcia) [guarderia, privado, El Ranero]
UPDATE centers SET
  long_description = E'En el barrio de El Ranero, concretamente en la Calle Reyes Católicos, 26 (30100), se encuentra Pequeñas Sonrisas, una guardería privada del municipio de Murcia autorizada para el primer ciclo de infantil, de 0 a 3 años.\n\nEl mapa escolar de la Región de Murcia la recoge con el código 30018059, pero no publica su horario ni sus servicios. Cuestiones como el comedor, la entrada anticipada o el calendario de adaptación quedan, por tanto, pendientes de confirmar con el equipo educativo.\n\nEsta ficha reúne información de fuentes públicas y no sustituye al contacto con el centro. Si te interesa, pregunta por las plazas disponibles, el horario de apertura y el precio del servicio.',
  updated_at = NOW()
WHERE slug = 'pequenas-sonrisas-murcia';

-- EDUCA (educa-murcia) [guarderia, privado, Espinardo]
UPDATE centers SET
  long_description = E'Educa es un centro privado de educación infantil situado en la Calle Enrique Tierno Galván, en Espinardo (30100), dentro del término municipal de Murcia. Su actividad se centra en el primer ciclo: niños desde los primeros meses hasta los 3 años.\n\nLa fuente oficial consultada no aporta detalles sobre su funcionamiento. Como referencia general, los proyectos de 0 a 3 años suelen organizarse en grupos por edad y acompañar la llegada de los más pequeños con un periodo de adaptación pactado con las familias, aunque el planteamiento concreto varía de un centro a otro.\n\nLa ficha se ha elaborado a partir de datos públicos y puede requerir actualización. Recomendamos llamar al centro para confirmar plazas, horarios y cuotas del curso en marcha.',
  updated_at = NOW()
WHERE slug = 'educa-murcia';

-- ABENARABI (abenarabi-murcia) [guarderia, privado, capital]
UPDATE centers SET
  long_description = E'Abenarabi ocupa un bajo del edificio Granada, en la Calle Abenarabí, número 7 (30007), en Murcia capital. Se trata de una guardería de titularidad privada que trabaja con el primer ciclo de educación infantil, de 0 a 3 años.\n\nEn el mapa escolar de la Consejería de Educación aparece con el código 30017951, sin más detalle sobre horario o prestaciones. Si buscas comedor, ampliación de jornada o alguna actividad concreta, es el propio centro quien puede confirmarlo.\n\nLos datos recogidos aquí proceden de registros de acceso público. Una conversación con el equipo permitirá aclarar disponibilidad de plaza, condiciones de matrícula y funcionamiento del día a día.',
  updated_at = NOW()
WHERE slug = 'abenarabi-murcia';

-- NICO (nico-murcia) [guarderia, privado, capital]
UPDATE centers SET
  long_description = E'La Avenida Antonete Gálvez, 7 (30006), es la dirección de Nico, un centro de educación infantil privado de Murcia dedicado a la etapa de 0 a 3 años.\n\nNo consta en fuente oficial información sobre su horario ni sobre servicios complementarios. En el primer ciclo, cada escuela establece su propio calendario y decide cómo distribuye las aulas y los tiempos de comida y descanso, de modo que ese detalle debe consultarse directamente.\n\nEl contenido de esta ficha procede del mapa escolar de la Región de Murcia y puede estar incompleto. Antes de solicitar plaza, conviene contrastar con el centro horarios, vacantes y precios.',
  updated_at = NOW()
WHERE slug = 'nico-murcia';

-- EL CHUPETE (el-chupete-murcia) [guarderia, privado, Barrio del Progreso]
UPDATE centers SET
  long_description = E'El Chupete desarrolla su actividad en la Calle Mayor, 26, en el Barrio del Progreso (30012), dentro del municipio de Murcia. Es una guardería privada autorizada para el primer ciclo de educación infantil, es decir, de 0 a 3 años.\n\nLa ficha del registro autonómico no incluye horario ni servicios verificados. Lo habitual en esta etapa es que la jornada se apoye en rutinas estables y en una incorporación progresiva de los niños nuevos, pero el modo exacto de aplicarlo corresponde explicarlo al centro.\n\nToda la información publicada aquí tiene origen en fuentes públicas y puede variar. Para confirmar plazas, horario de apertura y cuotas, lo mejor es contactar directamente con El Chupete.',
  updated_at = NOW()
WHERE slug = 'el-chupete-murcia';

-- GIRASOLES (girasoles-murcia) [guarderia, privado, capital]
UPDATE centers SET
  long_description = E'Girasoles es un centro de educación infantil de titularidad privada con sede en la Plaza Carlos III, número 1 (30008), en Murcia. Atiende el primer ciclo, la franja que va de los primeros meses a los 3 años.\n\nSu inscripción en el mapa escolar regional, con el código 30018965, acredita la autorización como centro de esta etapa, aunque no aporta datos de funcionamiento. Servicios como comedor o ampliación horaria no constan confirmados y deben consultarse en el propio centro.\n\nEsta ficha se apoya en información pública y puede quedarse corta. Si estás valorando la opción, pregunta por vacantes, horarios y condiciones económicas antes de dar cualquier paso.',
  updated_at = NOW()
WHERE slug = 'girasoles-murcia';

-- SOLCITOS (solcitos-murcia) [guarderia, privado, capital]
UPDATE centers SET
  long_description = E'Solcitos se ubica en la Calle Fernando Poo, esquina con el paseo Fernández Caballero (30007), en Murcia capital. Es una guardería privada centrada en el primer ciclo de educación infantil, de 0 a 3 años.\n\nLos datos oficiales disponibles no describen ni el horario ni las prestaciones del centro. En la etapa 0-3, aspectos como la organización de las siestas, los menús o el acompañamiento en la adaptación varían mucho entre proyectos, por lo que conviene preguntarlos uno a uno.\n\nLa información de esta ficha procede de fuentes de acceso público y puede haber quedado desfasada. Contactar con Solcitos es la forma más directa de conocer plazas, horario y cuotas.',
  updated_at = NOW()
WHERE slug = 'solcitos-murcia';

-- CHIQUITÍN (chiquitin-murcia) [guarderia, privado, capital]
UPDATE centers SET
  long_description = E'Chiquitín es una guardería privada de Murcia situada en la Avenida Europa, 23 (30007). Figura en el mapa escolar de la Región de Murcia como centro de primer ciclo de educación infantil, para niños de 0 a 3 años.\n\nEl registro no concreta horario ni servicios adicionales de la escuela. Como orientación, en esta etapa el día se estructura en torno a momentos fijos de juego, comida y descanso, y cada centro define su propio ritmo y su calendario anual.\n\nLos datos aquí reunidos son de origen público y no han sido revisados por el centro. Recomendamos llamar para preguntar por disponibilidad, horarios y precio del servicio.',
  updated_at = NOW()
WHERE slug = 'chiquitin-murcia';

-- POMPITAS.COM (pompitas-com-murcia) [guarderia, privado, capital]
UPDATE centers SET
  long_description = E'Con dirección en la Avenida Marina Española, 28, bajo (30007), Pompitas.com es un centro privado de educación infantil de Murcia dedicado al tramo de 0 a 3 años.\n\nEl mapa escolar autonómico lo recoge con el código 30018394 y no añade información sobre comedor, idiomas ni horario ampliado. Esos extremos, igual que el número de aulas o la forma de organizar los grupos, solo puede confirmarlos el equipo del centro.\n\nEsta ficha se ha construido con datos públicos y puede estar incompleta. Antes de decidir, conviene contactar con Pompitas.com para revisar plazas, horarios y condiciones.',
  updated_at = NOW()
WHERE slug = 'pompitas-com-murcia';

-- JC1 (jc1-murcia) [guarderia, privado, Espinardo]
UPDATE centers SET
  long_description = E'JC1 es un centro de educación infantil privado que trabaja con niños de 0 a 3 años en la Calle Monseñor Manuel Lorca, 58, en Espinardo (30100), dentro del término municipal de Murcia.\n\nLa fuente oficial no publica ni horario ni servicios de esta escuela. En el primer ciclo, cada proyecto establece sus tramos de entrada y salida y decide si ofrece comedor o cocina propia, de modo que estos puntos hay que verificarlos directamente.\n\nLos datos que ves proceden de registros públicos y pueden no estar actualizados. Una llamada al centro resolverá dudas sobre plazas libres, jornada y cuotas.',
  updated_at = NOW()
WHERE slug = 'jc1-murcia';

-- INFANTE JUAN MANUEL (infante-juan-manuel-murcia) [escuela-infantil, publico autonomico, capital]
UPDATE centers SET
  long_description = E'Infante Juan Manuel es una escuela de educación infantil de titularidad pública, dependiente de la Consejería de Educación de la Región de Murcia, con sede en la Calle Vicente Aleixandre, s/n (30011), en Murcia. Atiende el primer ciclo de la etapa, de 0 a 3 años.\n\nNo forma parte de la red municipal del Patronato de Escuelas Infantiles del Ayuntamiento de Murcia, sino del conjunto de escuelas públicas autonómicas recogidas en el mapa escolar. En los centros públicos de esta etapa la plaza no se obtiene por contacto directo: se solicita dentro del proceso de admisión que convoca la administración, con plazos y baremo publicados cada curso.\n\nEsta ficha recoge datos de fuentes oficiales de acceso público y puede no reflejar cambios recientes. Para conocer el calendario de solicitud, el horario del centro y los servicios de que dispone, lo indicado es dirigirse a la propia escuela.',
  updated_at = NOW()
WHERE slug = 'infante-juan-manuel-murcia';

-- SAN BASILIO (san-basilio-murcia) [escuela-infantil, publico autonomico, capital]
UPDATE centers SET
  long_description = E'En la Calle Sierra de Peñarrubia, s/n, en el 30009 de Murcia, se encuentra San Basilio, escuela de educación infantil de titularidad pública incluida en el mapa escolar de la Región de Murcia para el primer ciclo, de 0 a 3 años.\n\nEl catálogo oficial no detalla su horario ni los servicios que presta. En la red pública de primer ciclo el acceso se articula mediante convocatorias de admisión con criterios de baremación publicados, y la oferta de plazas se ajusta cada curso, por lo que conviene informarse con antelación.\n\nLa información de esta ficha procede de fuentes públicas y puede estar incompleta. El propio centro es quien mejor puede aclarar edades atendidas, horario y trámites de solicitud.',
  updated_at = NOW()
WHERE slug = 'san-basilio-murcia';

-- SOL Y LUNA (sol-y-luna-murcia) [guarderia, privado, capital]
UPDATE centers SET
  long_description = E'Sol y Luna es una guardería privada del centro de Murcia, en la Calle Raimundo González Frutos, 2, bajo (30001), dedicada al primer ciclo de educación infantil: de 0 a 3 años.\n\nEn el mapa escolar figura con el código 30019635, sin información añadida sobre servicios ni jornada. En esta etapa cada escuela decide cómo agrupa a los niños y qué prestaciones ofrece, así que lo razonable es preguntar por ello en la primera visita.\n\nLos datos de esta ficha son de origen público y pueden variar con el tiempo. Contacta con Sol y Luna para confirmar plazas, horarios y precios actualizados.',
  updated_at = NOW()
WHERE slug = 'sol-y-luna-murcia';

-- EL JARDÍN DE JULIA (el-jardin-de-julia-murcia) [guarderia, privado, capital]
UPDATE centers SET
  long_description = E'El Jardín de Julia abre en la Avenida de la Libertad, 6, bajo J (30009), en Murcia. Es un centro privado de educación infantil autorizado para el primer ciclo, que acoge a niños desde los primeros meses hasta los 3 años.\n\nLa fuente oficial se limita a los datos identificativos: no hay constancia de horario publicado ni de servicios verificados. Comedor, entrada temprana o actividades concretas son cuestiones que corresponde resolver al propio centro.\n\nEsta ficha combina únicamente información de acceso público. Si la ubicación te encaja, pregunta directamente por vacantes, horario y cuota mensual.',
  updated_at = NOW()
WHERE slug = 'el-jardin-de-julia-murcia';

-- CRECEMOS (crecemos-murcia) [guarderia, privado, capital]
UPDATE centers SET
  long_description = E'Crecemos ocupa el bajo 1 del número 10 de la Plaza I. Nicolás Noguera (30007), en Murcia. Se trata de un centro de educación infantil privado orientado al tramo de 0 a 3 años.\n\nEl registro autonómico, donde aparece con el código 30020901, no recoge horario ni servicios. En el primer ciclo de infantil no existe un modelo único de jornada: cada centro fija sus horarios y su oferta, y esa es la información que conviene pedir antes de matricular.\n\nLos datos publicados aquí proceden de fuentes oficiales de acceso libre y pueden estar incompletos. Lo más práctico es hablar con Crecemos para conocer plazas, horarios y condiciones económicas.',
  updated_at = NOW()
WHERE slug = 'crecemos-murcia';

-- EL SITIO DE TU RECREO (el-sitio-de-tu-recreo-murcia) [guarderia, privado, capital]
UPDATE centers SET
  long_description = E'El Sitio de Tu Recreo es un centro de educación infantil de titularidad privada con dirección en la Calle Greco, 5 (30006), en Murcia. Su ámbito es el primer ciclo, de 0 a 3 años.\n\nEl mapa escolar de la Consejería de Educación lo incluye entre los centros autorizados, pero sin especificar prestaciones ni horario. Aspectos como el periodo de adaptación, la alimentación o el descanso se organizan de forma distinta en cada proyecto, de manera que merece la pena preguntarlos con detalle.\n\nLa ficha se basa en datos públicos y no ha sido revisada por el centro. Para confirmar disponibilidad, horario y cuotas, el contacto directo es la vía más segura.',
  updated_at = NOW()
WHERE slug = 'el-sitio-de-tu-recreo-murcia';

-- LOS ROSALES (los-rosales-murcia) [escuela-infantil, publico autonomico, El Palmar]
UPDATE centers SET
  long_description = E'Los Rosales es una escuela de educación infantil pública situada en la Plaza de las Viñas, s/n (30120), en la pedanía de El Palmar, dentro del término municipal de Murcia. Cubre el primer ciclo de la etapa, de 0 a 3 años.\n\nPertenece al grupo de escuelas infantiles públicas de titularidad autonómica que recoge el mapa escolar regional, distinto de la red municipal del Ayuntamiento. La escolarización en centros públicos de 0 a 3 años pasa por un proceso de admisión con calendario y criterios de baremo que la administración publica cada curso.\n\nLos datos de esta ficha proceden de fuentes oficiales abiertas y pueden no estar completos. Para plazos de solicitud, horario y servicios disponibles, lo mejor es preguntar en la propia escuela.',
  updated_at = NOW()
WHERE slug = 'los-rosales-murcia';

-- EL ATELIER DE MARTE (el-atelier-de-marte-murcia) [guarderia, privado, Churra]
UPDATE centers SET
  long_description = E'El Atelier de Marte es una guardería privada de la pedanía de Churra, en la Calle Río Taibilla, 7 (30110), término municipal de Murcia. Trabaja con el primer ciclo de educación infantil, entre los 0 y los 3 años.\n\nEl mapa escolar regional lo registra con el código 30020753 y no añade información sobre horario ni servicios. Lo que ofrece cada centro en esta franja de edad varía bastante, así que estos puntos conviene tratarlos directamente con el equipo.\n\nEsta ficha reúne datos de acceso público, susceptibles de cambio. Si Churra te viene bien por cercanía, pregunta al centro por plazas, horario y cuotas.',
  updated_at = NOW()
WHERE slug = 'el-atelier-de-marte-murcia';

-- VILLAPEQUES (villapeques-murcia) [guarderia, privado, Esparragal]
UPDATE centers SET
  long_description = E'En la Vereda de las Cayuelas, 40 (30163), en la pedanía de Esparragal, funciona Villapeques, un centro infantil privado del municipio de Murcia dedicado a niños de 0 a 3 años.\n\nSu autorización consta en el mapa escolar de la Región de Murcia, aunque la fuente no describe cómo se organiza el curso ni qué servicios incluye. En los centros de esta etapa situados en pedanías, igual que en la capital, el horario y las prestaciones los define cada proyecto.\n\nLa información mostrada es de origen público y puede quedar desactualizada. Una llamada permitirá confirmar vacantes, horario de apertura y precio.',
  updated_at = NOW()
WHERE slug = 'villapeques-murcia';

-- MIRASIERRA (mirasierra-murcia) [guarderia, privado, Santo Ángel]
UPDATE centers SET
  long_description = E'Mirasierra atiende el primer ciclo de educación infantil, de 0 a 3 años, en la carretera de Santa Catalina, s/n (30151), en la pedanía de Santo Ángel. Es un centro de titularidad privada del término municipal de Murcia.\n\nEn el registro de la Consejería de Educación no figuran ni su horario ni los servicios que presta. En la etapa 0-3 la jornada se apoya en rutinas de alimentación, higiene y descanso, y su reparto concreto forma parte del proyecto de cada escuela.\n\nLos datos aquí publicados provienen de fuentes abiertas y pueden estar incompletos. Recomendamos contactar con Mirasierra para revisar plazas, horarios y condiciones económicas.',
  updated_at = NOW()
WHERE slug = 'mirasierra-murcia';

-- REINA VICTORIA (reina-victoria-murcia) [guarderia, privado, Ermita de Patiño]
UPDATE centers SET
  long_description = E'Reina Victoria es un centro privado de educación infantil situado en el Paseo de Florencia, 36, bajo (30012), en la pedanía de Ermita de Patiño, dentro del municipio de Murcia. Su oferta se centra en el primer ciclo, de 0 a 3 años.\n\nEl mapa escolar autonómico lo recoge con el código 30019763, pero no publica su horario ni sus servicios complementarios. Si necesitas comedor o una jornada más amplia, es imprescindible confirmarlo con el centro.\n\nEsta ficha se ha elaborado con información pública y puede requerir actualización. Antes de reservar plaza, contrasta con Reina Victoria disponibilidad, horarios y cuotas.',
  updated_at = NOW()
WHERE slug = 'reina-victoria-murcia';

-- NUBES DE PAPEL (nubes-de-papel-murcia) [guarderia, privado, Cobatillas]
UPDATE centers SET
  long_description = E'Nubes de Papel es una guardería privada del municipio de Murcia con sede en el Paseo Virgen de la Fuensanta, 4, bajo (30163), en la pedanía de Cobatillas. Acoge a niños de 0 a 3 años.\n\nLa fuente oficial no aporta datos sobre su funcionamiento diario. Como en el resto de centros de primer ciclo, cuestiones como el número de grupos, el horario de recogida o la existencia de comedor dependen de cada proyecto y deben preguntarse una a una.\n\nEl contenido de esta ficha procede de registros públicos y puede haber variado. Para saber si hay plaza y en qué condiciones, lo indicado es llamar al centro.',
  updated_at = NOW()
WHERE slug = 'nubes-de-papel-murcia';

-- LA NARANJA (la-naranja-murcia) [escuela-infantil, publico autonomico, Beniaján]
UPDATE centers SET
  long_description = E'La Naranja es una escuela de educación infantil de titularidad pública ubicada en la calle Escuelas, s/n (30570), en Beniaján, pedanía del término municipal de Murcia. Se dedica al primer ciclo de la etapa, de 0 a 3 años.\n\nAparece en el mapa escolar de la Región de Murcia como centro público autonómico, no como escuela de la red municipal del Ayuntamiento. En los centros públicos de 0 a 3 años la plaza se tramita a través de la convocatoria de admisión correspondiente, con calendario y baremo que la administración hace públicos cada curso.\n\nEsta ficha recoge datos de fuentes oficiales abiertas y puede no estar completa. Para conocer horario, servicios y plazos de solicitud, conviene dirigirse directamente a la escuela.',
  updated_at = NOW()
WHERE slug = 'la-naranja-murcia';

-- MI PEQUEÑA ESCUELA (mi-pequena-escuela-murcia) [guarderia, privado, La Alberca]
UPDATE centers SET
  long_description = E'Mi Pequeña Escuela es un centro privado de educación infantil de la pedanía de La Alberca, en la Calle Emilio Macabich, 14, planta baja (30150), municipio de Murcia. Trabaja con la franja de 0 a 3 años.\n\nEl registro autonómico confirma su autorización como centro de primer ciclo, con el código 30013827, pero no describe horario ni servicios. Comedor, ampliación de jornada o actividades específicas son datos que solo el centro puede facilitar.\n\nLo publicado en esta ficha proviene de fuentes de acceso público y puede estar desactualizado. Pregunta al centro por plazas, horario y cuotas antes de tomar una decisión.',
  updated_at = NOW()
WHERE slug = 'mi-pequena-escuela-murcia';

-- EL ARBOLICO (el-arbolico-murcia) [guarderia, privado, La Alberca]
UPDATE centers SET
  long_description = E'En la Calle Calderón de la Barca, 24 (30150), en la pedanía de La Alberca, se encuentra El Arbolico, guardería privada del término municipal de Murcia dedicada al primer ciclo de educación infantil, de 0 a 3 años.\n\nLa información oficial disponible se limita a la identificación del centro: no constan servicios verificados ni horario publicado. En esta etapa la adaptación de los más pequeños suele plantearse de forma gradual y acordada con la familia, aunque cada escuela lo concreta a su manera.\n\nLos datos mostrados proceden de fuentes públicas y pueden no estar al día. Recomendamos contactar con El Arbolico para confirmar vacantes, horarios y precios.',
  updated_at = NOW()
WHERE slug = 'el-arbolico-murcia';

-- LA RIVERA (la-rivera-murcia) [guarderia, privado, La Arboleja]
UPDATE centers SET
  long_description = E'La Rivera es un centro de educación infantil privado situado en el Carril de los Leales, 8 (30009), en la pedanía de La Arboleja, dentro del municipio de Murcia. Atiende a niños de 0 a 3 años.\n\nSu ficha en el mapa escolar de la Región de Murcia, con el código 30018047, no incluye horario ni prestaciones. Puesto que en el primer ciclo cada centro organiza a su modo comidas, siestas y salidas, esos detalles hay que consultarlos directamente.\n\nEsta ficha se apoya en información pública y puede estar incompleta. Una llamada al centro aclarará si hay plazas, en qué horario se trabaja y cuánto cuesta el servicio.',
  updated_at = NOW()
WHERE slug = 'la-rivera-murcia';

-- CAMPANILLA (campanilla-murcia) [guarderia, privado, Cabezo de Torres]
UPDATE centers SET
  long_description = E'Campanilla es una guardería de titularidad privada de la pedanía de Cabezo de Torres, en la Calle Francisco de Quevedo, 15 (30110), término municipal de Murcia. Su actividad corresponde al primer ciclo de educación infantil, de 0 a 3 años.\n\nEl mapa escolar regional acredita su autorización, pero no publica horario ni servicios. En la etapa 0-3 no hay una jornada estándar: cada centro fija la suya y decide qué servicios añade, así que conviene preguntarlo antes de matricular.\n\nLa información de esta ficha procede de registros públicos, con las limitaciones propias de esa fuente. El teléfono del centro es la vía más directa para preguntar por plazas, horarios y cuotas.',
  updated_at = NOW()
WHERE slug = 'campanilla-murcia';

-- GUADALUPE (guadalupe-murcia) [escuela-infantil, publico autonomico, Guadalupe]
UPDATE centers SET
  long_description = E'Guadalupe es una escuela de educación infantil pública del término municipal de Murcia, con sede en la Calle Enrique Tierno Galván, s/n (30107), en la pedanía de Guadalupe. Escolariza a niños de 0 a 3 años, dentro del primer ciclo de la etapa.\n\nFigura en el mapa escolar de la Región de Murcia entre las escuelas públicas de titularidad autonómica, al margen de la red municipal del Ayuntamiento de Murcia. En el sector público de esta etapa la admisión se resuelve mediante convocatoria, con criterios de valoración publicados y plazos concretos cada curso.\n\nLos datos de esta ficha proceden de fuentes oficiales de acceso público y pueden estar incompletos. Para el horario, los servicios y el procedimiento de solicitud, lo más fiable es consultar en la propia escuela.',
  updated_at = NOW()
WHERE slug = 'guadalupe-murcia';

-- TORREAGÜERA (torreaguera-murcia) [escuela-infantil, publico autonomico, Torreagüera]
UPDATE centers SET
  long_description = E'En la Avenida Huerto San Blas, 28 (30579), en Torreagüera, se encuentra la escuela de educación infantil Torreagüera, centro de titularidad pública del municipio de Murcia dedicado al primer ciclo, de 0 a 3 años.\n\nEl catálogo de centros de la Consejería de Educación la identifica con el código 30019611, sin detallar horario ni servicios. Como sucede en toda la red pública de 0 a 3 años, el acceso a una plaza se canaliza por el procedimiento de admisión que se convoca anualmente.\n\nEsta ficha se ha construido con datos abiertos y puede no reflejar la situación actual. Recomendamos contactar con la escuela para conocer edades atendidas, horario y calendario de solicitud.',
  updated_at = NOW()
WHERE slug = 'torreaguera-murcia';

-- AÑITOS FELICES (anitos-felices-murcia) [guarderia, privado, San José de la Montaña]
UPDATE centers SET
  long_description = E'Añitos Felices es un centro privado de educación infantil situado en la Calle Los Ángeles, edificio Los Ángeles (30158), en la pedanía de San José de la Montaña, dentro del término municipal de Murcia. Atiende el tramo de 0 a 3 años.\n\nEl registro autonómico lo recoge con el código 30020819 y no ofrece información sobre horario ni servicios. Si el comedor o una jornada ampliada son requisitos para tu familia, conviene comprobarlo con el centro antes de nada.\n\nLos datos publicados provienen de fuentes de acceso público y pueden variar. El contacto directo con Añitos Felices permitirá confirmar plazas, horarios y condiciones económicas.',
  updated_at = NOW()
WHERE slug = 'anitos-felices-murcia';

-- EL ATELIER DE LA LUNA (el-atelier-de-la-luna-murcia) [guarderia, privado, Santiago y Zaraiche]
UPDATE centers SET
  long_description = E'El Atelier de la Luna trabaja con niños de 0 a 3 años en la Calle Félix Esteban Guerrero, 8 (30007), en Santiago y Zaraiche, pedanía del municipio de Murcia. Es un centro de educación infantil de titularidad privada.\n\nEl mapa escolar de la Región de Murcia lo incluye entre los centros autorizados de primer ciclo, sin más precisiones sobre su funcionamiento. Horario, comedor y forma de organizar los grupos son, por tanto, cuestiones a resolver con el equipo educativo.\n\nEsta ficha se limita a datos de fuentes públicas y puede quedar incompleta. Para saber si hay plaza disponible y en qué condiciones, lo mejor es hablar con el centro.',
  updated_at = NOW()
WHERE slug = 'el-atelier-de-la-luna-murcia';

-- BAMBINO (bambino-murcia) [guarderia, privado, Sangonera la Verde]
UPDATE centers SET
  long_description = E'Bambino es una guardería privada de Sangonera la Verde, pedanía del término municipal de Murcia, con dirección en la Calle Aristóteles, 6 (30833). Se dedica al primer ciclo de educación infantil, de 0 a 3 años.\n\nLa fuente oficial consultada no recoge horario ni servicios de este centro. En la etapa de 0 a 3 años, la organización de la jornada, los grupos por edad y el periodo de adaptación se plantean de manera distinta en cada escuela, de modo que conviene preguntarlo en la visita.\n\nLa ficha se ha elaborado con información pública, sin verificación del propio centro. Llamar es la forma más rápida de conocer vacantes, horario y precio del servicio.',
  updated_at = NOW()
WHERE slug = 'bambino-murcia';

-- NTRA. SRA. DEL CARMEN (ntra-sra-del-carmen-murcia) [escuela-infantil, publico autonomico, Gea y Truyols]
UPDATE centers SET
  long_description = E'Ntra. Sra. del Carmen es una escuela de educación infantil de titularidad pública situada en Gea y Truyols (30590), pedanía del término municipal de Murcia. Su alumnado corresponde al primer ciclo, la franja de 0 a 3 años.\n\nLa dirección que consta en el mapa escolar se limita al nombre de la pedanía, algo frecuente en núcleos pequeños, y la fuente no detalla horario ni servicios. En la red pública de primer ciclo la plaza se solicita a través del proceso de admisión convocado por la administración, con plazos publicados cada curso.\n\nEsta ficha reúne datos oficiales de acceso público que pueden estar incompletos. Para confirmar edades atendidas, horario y trámites, lo indicado es contactar con la escuela.',
  updated_at = NOW()
WHERE slug = 'ntra-sra-del-carmen-murcia';

-- ==========================================================
-- ZARAGOZA — 27 centros
-- ==========================================================

-- PELUCHE (peluche-zaragoza) [privado, Registro de Centros Docentes DGA]
UPDATE centers SET
  long_description = E'Peluche es una guardería de titularidad privada dedicada al primer ciclo de educación infantil, con sede en la calle Pedro Cerbuna, 41, en el código postal 50009 de Zaragoza. Atiende a niños de 0 a 3 años, el tramo previo al segundo ciclo de infantil.\n\nFigura en el Registro de Centros Docentes del Gobierno de Aragón, el listado que recoge los centros autorizados para impartir esta etapa. Más allá de esa autorización, la fuente consultada no detalla el funcionamiento diario: en el primer ciclo cada escuela fija su horario, su calendario y la forma de organizar los grupos por edades, de modo que comedor, ampliación horaria o periodo de adaptación son aspectos que conviene tratar con el equipo.\n\nLa información de esta ficha procede de fuentes públicas y puede quedar incompleta. Para confirmar plazas disponibles, horarios y cuotas del curso, lo más práctico es llamar directamente al centro.',
  updated_at = NOW()
WHERE slug = 'peluche-zaragoza';

-- PEQUEÑOS VENECIANOS (pequenos-venecianos-zaragoza) [privado, Directorio de Centros Educativos de Aragón]
UPDATE centers SET
  long_description = E'En la calle Vaporetto, 4, dentro del código postal 50021 de Zaragoza, desarrolla su actividad Pequeños Venecianos, un centro privado de educación infantil de primer ciclo abierto a niños de 0 a 3 años.\n\nEl Directorio de Centros Educativos de Aragón lo recoge como centro autorizado para esta etapa, pero no aporta información sobre su organización interna. Conviene recordar que el tramo 0-3 no es obligatorio y que cada centro privado gestiona su propia admisión, al margen de los procesos de las redes públicas municipal y autonómica; por eso los plazos y las condiciones se consultan en la propia escuela.\n\nLos datos publicados aquí se han tomado de fuentes oficiales de acceso público. Antes de decidir, merece la pena contactar con el centro, por teléfono o correo electrónico, y preguntar por vacantes, horario y cuotas.',
  updated_at = NOW()
WHERE slug = 'pequenos-venecianos-zaragoza';

-- HEIDI (heidi-zaragoza) [privado, Registro de Centros Docentes DGA]
UPDATE centers SET
  long_description = E'Heidi ocupa el número 12 de la calle Martín Abanto, en el 50013 de Zaragoza. Es una guardería de titularidad privada centrada en el primer ciclo de educación infantil, que abarca de los 0 a los 3 años.\n\nSu presencia en el registro autonómico acredita que está autorizada por el Gobierno de Aragón para impartir esa etapa, sujeta por tanto a los requisitos de instalaciones y ratio que fija la normativa. El resto del proyecto —jornada, alimentación, actividades— queda a criterio de cada escuela y no aparece detallado en la fuente consultada.\n\nEsta ficha se ha construido con datos de origen público y no recoge necesariamente cambios recientes. El propio centro es la mejor referencia para conocer plazas libres, horarios reales y precios.',
  updated_at = NOW()
WHERE slug = 'heidi-zaragoza';

-- JESÚS REPARADOR (jesus-reparador-zaragoza) [privado, Registro de Centros Docentes DGA]
UPDATE centers SET
  long_description = E'Jesús Reparador atiende el primer ciclo de educación infantil, de 0 a 3 años, en la calle Sancho y Gil, 6, código postal 50001 de Zaragoza. Se trata de un centro de titularidad privada incluido en el Registro de Centros Docentes del Gobierno de Aragón.\n\nLa fuente oficial no recoge servicios confirmados ni horario publicado. En esta etapa, la jornada suele organizarse en torno a rutinas de acogida, juego, alimentación y descanso, con un periodo de adaptación al inicio de curso cuyos detalles concreta cada centro junto a las familias.\n\nLos datos aquí reunidos proceden de registros públicos. Para resolver dudas sobre disponibilidad de plaza, calendario y cuotas, lo indicado es hablar directamente con el centro.',
  updated_at = NOW()
WHERE slug = 'jesus-reparador-zaragoza';

-- LA LOCOMOTORA (la-locomotora-zaragoza) [privado, Registro de Centros Docentes DGA]
UPDATE centers SET
  long_description = E'La Locomotora tiene su sede en el local 2 del número 36-38 de la calle Valle de Zuriza (50014), en Zaragoza. Es un centro privado autorizado para el primer ciclo de educación infantil y trabaja con niños de 0 a 3 años.\n\nSu autorización consta en el Registro de Centros Docentes del Gobierno de Aragón, aunque el registro no describe cómo se organiza el día a día. En Zaragoza conviven la red municipal de escuelas infantiles, las escuelas de titularidad autonómica y los centros privados como este; en estos últimos la matrícula se gestiona directamente con la escuela, con sus propios plazos.\n\nLa información mostrada proviene de fuentes públicas y puede estar incompleta. Recomendamos contactar con el centro para confirmar plazas, horarios y condiciones económicas.',
  updated_at = NOW()
WHERE slug = 'la-locomotora-zaragoza';

-- NUESTRA SEÑORA DE LA PAZ (nuestra-senora-de-la-paz-zaragoza) [privado, Registro de Centros Docentes DGA]
UPDATE centers SET
  long_description = E'Con dirección en la calle la Salud, 11 (50007), Nuestra Señora de La Paz es una guardería de titularidad privada de Zaragoza dedicada al primer ciclo de educación infantil, es decir, a niños de 0 a 3 años.\n\nEl centro figura entre los autorizados por el Gobierno de Aragón para impartir esta etapa. No constan, en cambio, servicios verificados: si el comedor, la ampliación de horario o el idioma son criterios importantes para tu familia, conviene preguntarlos expresamente, ya que cada escuela de primer ciclo define su propia oferta.\n\nEsta ficha recoge únicamente datos de fuentes públicas. El centro puede facilitar información actualizada sobre vacantes, horarios y cuotas.',
  updated_at = NOW()
WHERE slug = 'nuestra-senora-de-la-paz-zaragoza';

-- DUENDEDUCA (duendeduca-zaragoza) [privado, Registro de Centros Docentes DGA]
UPDATE centers SET
  long_description = E'Duendeduca se sitúa en la avenida Salvador Allende, 71, dentro del código postal 50015 de Zaragoza. De titularidad privada, su actividad se dirige al primer ciclo de educación infantil, de 0 a 3 años.\n\nAparece en el Registro de Centros Docentes del Gobierno de Aragón como centro autorizado para esa etapa. Nada más consta verificado: el primer ciclo es una etapa voluntaria en la que cada centro establece su horario, su calendario escolar y sus tarifas, de manera que estos puntos solo puede aclararlos el propio equipo.\n\nLos datos que ves proceden de fuentes públicas y pueden completarse con el tiempo. Si te interesa este centro, contacta con él para preguntar por plazas y condiciones.',
  updated_at = NOW()
WHERE slug = 'duendeduca-zaragoza';

-- EL TREN CHU-CHU (el-tren-chu-chu-zaragoza) [privado, Registro de Centros Docentes DGA]
UPDATE centers SET
  long_description = E'El Tren Chu-Chu es un centro privado de educación infantil de primer ciclo ubicado en la calle Matilde Sangüesa, 9-11, en el 50014 de Zaragoza. Acoge a niños de 0 a 3 años.\n\nSu autorización para impartir la etapa consta en el registro autonómico de centros docentes. La fuente no detalla servicios ni horarios; en los centros 0-3 el arranque suele plantearse con una incorporación progresiva y con grupos organizados por edad, pero la manera concreta de hacerlo varía de una escuela a otra.\n\nEsta información se ha obtenido de fuentes públicas. Antes de solicitar plaza, conviene confirmar con el centro la disponibilidad, el horario y el coste mensual.',
  updated_at = NOW()
WHERE slug = 'el-tren-chu-chu-zaragoza';

-- LA VIRGEN NIÑA (la-virgen-nina-zaragoza) [privado, Registro de Centros Docentes DGA]
UPDATE centers SET
  long_description = E'En el camino de Cuarte, 71 (50007), funciona La Virgen Niña, una guardería privada de Zaragoza que se ocupa del primer ciclo de educación infantil, la etapa que va de los 0 a los 3 años.\n\nEl Gobierno de Aragón la incluye en su registro de centros docentes autorizados para el primer ciclo. Más allá de ese dato, no hay servicios confirmados en fuente oficial: comedor, horario ampliado o actividades complementarias son cuestiones que cada centro decide y que conviene preguntar antes de matricular.\n\nLa ficha se ha elaborado con datos de acceso público y puede quedarse corta. Una llamada al centro es la vía más directa para conocer plazas, horarios y cuotas actuales.',
  updated_at = NOW()
WHERE slug = 'la-virgen-nina-zaragoza';

-- BOLANDRINA (bolandrina-zaragoza) [privado, Registro de Centros Docentes DGA]
UPDATE centers SET
  long_description = E'Bolandrina desarrolla su actividad en un local de la calle Refugio, 9, código postal 50001 de Zaragoza. Es un centro de titularidad privada dedicado al primer ciclo de educación infantil, con niños de 0 a 3 años.\n\nConsta como centro autorizado en el Registro de Centros Docentes del Gobierno de Aragón. El registro no publica horarios ni servicios, algo habitual en este tramo educativo: la etapa 0-3 no es obligatoria y cada escuela define su propio proyecto, su jornada y sus tarifas.\n\nLos datos proceden de fuentes públicas. Para conocer de primera mano el funcionamiento del centro, lo mejor es contactar con el equipo y, si es posible, concertar una visita.',
  updated_at = NOW()
WHERE slug = 'bolandrina-zaragoza';

-- EL CARMEN (el-carmen-zaragoza) [privado, Directorio de Centros Educativos de Aragón]
UPDATE centers SET
  long_description = E'El Carmen aparece en el Directorio de Centros Educativos de Aragón como centro privado de primer ciclo de educación infantil, con dirección en el bajo del número 15 de la calle Doctor Fleming (50004), en Zaragoza. Atiende a niños de 0 a 3 años.\n\nEl directorio confirma la autorización del centro para esta etapa, pero no su organización interna. En el primer ciclo, las familias suelen valorar aspectos como el horario de entrada y salida, la alimentación o el tamaño de los grupos; ninguno de ellos figura verificado aquí, así que conviene plantearlos directamente.\n\nEsta ficha se apoya solo en fuentes públicas. El centro puede confirmar plazas disponibles, calendario y cuotas del curso en marcha.',
  updated_at = NOW()
WHERE slug = 'el-carmen-zaragoza';

-- ANDARINES (andarines-zaragoza) [privado, Registro de Centros Docentes DGA]
UPDATE centers SET
  long_description = E'Andarines ocupa los bloques 4-5 del número 2 de la calle Matías Pastor Sancho, en el 50015 de Zaragoza. Se trata de una guardería privada autorizada para impartir el primer ciclo de educación infantil, de 0 a 3 años.\n\nSu inclusión en el registro autonómico acredita esa autorización; el resto queda sin detallar en la fuente. En Aragón, los centros privados de primer ciclo gestionan su admisión al margen de los procesos de las escuelas municipales y autonómicas, por lo que los plazos de matrícula se consultan en el propio centro.\n\nLa información publicada tiene origen en fuentes de acceso público. Recomendamos verificar con el centro las plazas, el horario y las condiciones económicas antes de decidir.',
  updated_at = NOW()
WHERE slug = 'andarines-zaragoza';

-- EDUCANDO (educando-zaragoza) [privado, Registro de Centros Docentes DGA]
UPDATE centers SET
  long_description = E'Educando es un centro privado de educación infantil de primer ciclo con sede en la calle Río Cinca, 35, código postal 50003 de Zaragoza, donde atiende a niños de 0 a 3 años.\n\nFigura en el Registro de Centros Docentes del Gobierno de Aragón, que agrupa los centros autorizados de la comunidad. La fuente no incorpora datos de funcionamiento: en esta etapa, el día a día gira en torno a rutinas de cuidado, juego y descanso, y cada escuela decide cómo distribuye el tiempo y qué servicios ofrece.\n\nLos contenidos de esta ficha provienen de fuentes públicas y pueden estar incompletos. Contactar con el centro permite confirmar vacantes, horarios y precios.',
  updated_at = NOW()
WHERE slug = 'educando-zaragoza';

-- ZAGALINES (zagalines-zaragoza) [privado, Directorio de Centros Educativos de Aragón]
UPDATE centers SET
  long_description = E'La dirección registrada de Zagalines es avenida Puente del Pilar / calle Jesús, 41, en el código postal 50014 de Zaragoza. Es una guardería de titularidad privada dedicada al primer ciclo de educación infantil, para niños de 0 a 3 años.\n\nEl Directorio de Centros Educativos de Aragón la recoge entre los centros autorizados para esta etapa. No hay más información verificada, así que aspectos como la jornada, la comida o el periodo de adaptación, que cada escuela plantea a su manera, deben consultarse con el equipo educativo.\n\nEsta ficha reúne datos de fuentes públicas, sujetos a actualización. Para lo importante, es decir, plazas, horarios y cuotas, la referencia es el propio centro.',
  updated_at = NOW()
WHERE slug = 'zagalines-zaragoza';

-- TIC TAC (tic-tac-zaragoza) [privado, Registro de Centros Docentes DGA]
UPDATE centers SET
  long_description = E'Tic Tac es una guardería privada de Zaragoza que ocupa el número 30 de la calle Pedro Arnal Cavero (50014) y se dedica al primer ciclo de educación infantil, con niños de 0 a 3 años.\n\nEl centro consta autorizado por el Gobierno de Aragón para esta etapa. En la fuente consultada no aparecen datos sobre comedor, horario ampliado o idiomas; son servicios que cada centro privado decide libremente y que suelen pesar bastante en la elección de las familias, de ahí que convenga preguntarlos.\n\nLa información recogida aquí procede de registros públicos. El propio centro puede detallar plazas, horarios y cuotas actualizadas.',
  updated_at = NOW()
WHERE slug = 'tic-tac-zaragoza';

-- ARCO IRIS (arco-iris-zaragoza) [privado, Registro de Centros Docentes DGA, con web y email en el directorio]
UPDATE centers SET
  long_description = E'Arco Iris es un centro privado de educación infantil situado en el número 6 de la calle Amistad, código postal 50002 de Zaragoza, y trabaja con niños del primer ciclo, de 0 a 3 años.\n\nAparece como centro autorizado en el registro de centros docentes del Gobierno de Aragón y, además del teléfono, facilita correo electrónico y una página web propia. La fuente oficial no confirma servicios concretos, de modo que el horario, la alimentación o las actividades del curso conviene contrastarlos con el propio centro.\n\nLos datos publicados provienen de fuentes públicas. Para plazas, calendario y cuotas, lo más fiable es dirigirse directamente al centro.',
  updated_at = NOW()
WHERE slug = 'arco-iris-zaragoza';

-- PEQUEÑOS MAESTROS (pequenos-maestros-zaragoza) [privado, Registro de Centros Docentes DGA, con web y email en el directorio]
UPDATE centers SET
  long_description = E'Pequeños Maestros atiende el primer ciclo de educación infantil en la calle Ludwig van Beethoven, 52, en el 50012 de Zaragoza. Es un centro de titularidad privada y su alumnado tiene entre 0 y 3 años.\n\nSu autorización para impartir la etapa figura en el Registro de Centros Docentes del Gobierno de Aragón. Junto al teléfono, en el directorio constan también un correo electrónico y una web de contacto, aunque no se recogen servicios verificados; en el primer ciclo, cuestiones como la ampliación horaria o el comedor varían mucho de un centro a otro.\n\nEsta ficha se basa en información pública y puede no estar completa. Antes de matricular, conviene confirmar con el centro las plazas libres, los horarios y el coste.',
  updated_at = NOW()
WHERE slug = 'pequenos-maestros-zaragoza';

-- MI COLE (mi-cole-zaragoza) [privado, Directorio de Centros Educativos de Aragón]
UPDATE centers SET
  long_description = E'Mi Cole es una guardería privada de Zaragoza con dirección en la calle Lago de Millares, 48 (50011). Su actividad se centra en el primer ciclo de educación infantil, de 0 a 3 años.\n\nEl Directorio de Centros Educativos de Aragón la incluye entre los centros autorizados para esta etapa, sin detallar su funcionamiento. Al tratarse de una etapa voluntaria, cada escuela organiza su jornada y su calendario con bastante margen, y también fija sus propias tarifas.\n\nLos datos de esta ficha se han obtenido de fuentes públicas. Recomendamos contactar con el centro para conocer plazas, horarios y condiciones económicas.',
  updated_at = NOW()
WHERE slug = 'mi-cole-zaragoza';

-- PATINETE (patinete-zaragoza) [privado, Directorio de Centros Educativos de Aragón]
UPDATE centers SET
  long_description = E'Patinete desarrolla su actividad en la calle Pamplona Escudero, 12, código postal 50005 de Zaragoza. De titularidad privada, escolariza a niños de 0 a 3 años dentro del primer ciclo de educación infantil.\n\nEl centro consta en el directorio autonómico como autorizado para impartir esta etapa. No hay servicios confirmados en la fuente: el comedor, la entrada temprana o las actividades complementarias dependen del proyecto de cada escuela y no siempre están disponibles, así que merece la pena preguntarlo antes.\n\nLa ficha se apoya en datos de acceso público, que pueden variar con el tiempo. Para información actualizada sobre vacantes, horarios y cuotas, lo mejor es hablar con el centro.',
  updated_at = NOW()
WHERE slug = 'patinete-zaragoza';

-- MADRE DE DIOS DE BEGOÑA (madre-de-dios-de-begona-zaragoza) [privado, Directorio de Centros Educativos de Aragón]
UPDATE centers SET
  long_description = E'Madre de Dios de Begoña figura en el Directorio de Centros Educativos de Aragón como centro privado de educación infantil, con sede en la calle Terminillo, 22-24, en el 50017 de Zaragoza. Atiende el primer ciclo, de 0 a 3 años.\n\nEl directorio acredita la autorización del centro, pero no describe su día a día. En el tramo 0-3 el eje son los cuidados y la primera socialización, con grupos organizados por edades; cómo se concreta eso en horarios, comidas o adaptación lo define cada escuela.\n\nLos datos mostrados proceden de fuentes públicas. Para conocer plazas, calendario y cuotas del curso, conviene ponerse en contacto con el centro.',
  updated_at = NOW()
WHERE slug = 'madre-de-dios-de-begona-zaragoza';

-- LENGUATRAPO (lenguatrapo-zaragoza) [privado, Directorio de Centros Educativos de Aragón]
UPDATE centers SET
  long_description = E'Lenguatrapo se encuentra en el bloque 25 del número 181 de la calle San Juan de la Peña, código postal 50015 de Zaragoza. Es un centro privado de primer ciclo de educación infantil y su alumnado va de los 0 a los 3 años.\n\nAparece recogido en el registro autonómico de centros autorizados para impartir esta etapa. Sobre horarios y servicios no hay confirmación oficial; conviene tener en cuenta que en los centros privados la matrícula se tramita directamente con la escuela, con calendarios propios que no tienen por qué coincidir con los de las redes públicas.\n\nLa información publicada tiene origen en fuentes públicas y puede quedar incompleta. Preguntar en el centro despeja lo esencial: plazas, horario y cuotas.',
  updated_at = NOW()
WHERE slug = 'lenguatrapo-zaragoza';

-- EL MANZANO (el-manzano-zaragoza) [privado, Directorio de Centros Educativos de Aragón]
UPDATE centers SET
  long_description = E'El Manzano ocupa un local en la calle Emilia Pardo Bazán, 12, dentro del 50018 de Zaragoza. Se trata de una guardería de titularidad privada que imparte el primer ciclo de educación infantil, para niños de 0 a 3 años.\n\nSu autorización consta en el Directorio de Centros Educativos de Aragón. No se recogen servicios verificados, de modo que el horario de apertura, la comida o la manera de plantear los primeros días de adaptación son puntos a tratar con el equipo del centro.\n\nEsta ficha se ha elaborado exclusivamente con datos públicos. Antes de tomar una decisión, conviene confirmar directamente las plazas disponibles y las condiciones del curso.',
  updated_at = NOW()
WHERE slug = 'el-manzano-zaragoza';

-- CHICOTES (chicotes-zaragoza) [privado, Registro de Centros Docentes DGA]
UPDATE centers SET
  long_description = E'Chicotes es un centro privado de educación infantil de primer ciclo con dirección en la calle Balbino Orensanz, 55, en el código postal 50014 de Zaragoza, donde atiende a niños de 0 a 3 años.\n\nFigura en el Registro de Centros Docentes del Gobierno de Aragón entre los centros autorizados para esta etapa. El registro no incluye información de funcionamiento; en el primer ciclo cada escuela decide su horario y su oferta de servicios, y esos detalles se conocen mejor en una visita o en una conversación con el equipo.\n\nLos datos aquí publicados provienen de fuentes de acceso público. Para plazas, horarios y cuotas, la referencia es el propio centro.',
  updated_at = NOW()
WHERE slug = 'chicotes-zaragoza';

-- SCHOOLHOUSE VÍA IBÉRICA (schoolhouse-via-iberica-zaragoza) [privado, Registro de Centros Docentes DGA]
UPDATE centers SET
  long_description = E'Schoolhouse Vía Ibérica es una guardería de titularidad privada situada en la calle Vía Ibérica, 67, código postal 50012 de Zaragoza, dedicada al primer ciclo de educación infantil, de 0 a 3 años.\n\nEl registro oficial del Gobierno de Aragón la recoge como centro autorizado para impartir esta etapa, sin más detalle sobre su organización. Como en el resto de centros privados de primer ciclo, el horario, el calendario y los servicios se establecen desde el propio proyecto y no aparecen recogidos en fuentes oficiales.\n\nLa ficha se limita a datos de origen público. Recomendamos escribir o llamar al centro para confirmar vacantes, horarios y coste antes de iniciar cualquier trámite.',
  updated_at = NOW()
WHERE slug = 'schoolhouse-via-iberica-zaragoza';

-- CHIP Y CHOP (chip-y-chop-zaragoza) [privado, Registro de Centros Docentes DGA]
UPDATE centers SET
  long_description = E'Chip y Chop se ubica en la avenida Salvador Allende, 44, en el 50015 de Zaragoza. Es un centro privado autorizado para el primer ciclo de educación infantil y trabaja con niños de 0 a 3 años.\n\nSu autorización figura en el Registro de Centros Docentes del Gobierno de Aragón. No constan servicios adicionales verificados: en esta etapa la oferta varía mucho de un centro a otro, y cuestiones como el comedor o la ampliación de horario solo pueden confirmarse preguntando.\n\nLos datos reunidos aquí proceden de fuentes públicas. Una llamada al centro es la forma más directa de conocer plazas, horarios y cuotas.',
  updated_at = NOW()
WHERE slug = 'chip-y-chop-zaragoza';

-- EL BARQUITO DE PAPEL (el-barquito-de-papel-zaragoza) [privado, Directorio de Centros Educativos de Aragón]
UPDATE centers SET
  long_description = E'El Barquito de Papel imparte el primer ciclo de educación infantil en la calle Daroca, 42-44, dentro del código postal 50017 de Zaragoza. Es un centro de titularidad privada y admite a niños de 0 a 3 años.\n\nConsta como autorizado en el Directorio de Centros Educativos de Aragón, aunque el directorio no publica su horario ni sus servicios. Conviene recordar que en el primer ciclo la incorporación de los más pequeños se plantea de forma progresiva y que cada centro acuerda con las familias cómo hacerlo.\n\nEsta información procede de fuentes públicas y puede no reflejar cambios recientes. El centro puede aclarar la disponibilidad de plazas, el horario y las cuotas del curso.',
  updated_at = NOW()
WHERE slug = 'el-barquito-de-papel-zaragoza';

-- CHIQUITINES II (chiquitines-ii-zaragoza) [privado, Registro de Centros Docentes DGA]
UPDATE centers SET
  long_description = E'Chiquitines II está en la avenida Santa Isabel, 20, dentro del código postal 50003 de Zaragoza. Es un centro de titularidad privada centrado en el primer ciclo de educación infantil, de 0 a 3 años.\n\nEl centro está incluido en el registro autonómico de centros docentes autorizados. La fuente no recoge datos sobre comedor, horario ampliado o idiomas; son aspectos que marcan el día a día y que conviene preguntar directamente, porque varían entre escuelas.\n\nLos datos de esta ficha tienen origen público. Antes de decidir, contacta con el centro para confirmar plazas, horarios y condiciones económicas.',
  updated_at = NOW()
WHERE slug = 'chiquitines-ii-zaragoza';

-- ==========================================================
-- ALICANTE — 16 centros
-- ==========================================================

-- EI BENACANTIL (ei-benacantil-alicante) [publico Generalitat]
UPDATE centers SET
  long_description = E'EI Benacantil es una escuela infantil pública de la Generalitat Valenciana dedicada al primer ciclo de educación infantil. Ocupa un edificio en la calle Ejércitos Españoles, s/n (03014), en Alicante, y escolariza a niños desde los primeros meses hasta los 3 años.\n\nEl Registre de Centres Docents de la Comunitat Valenciana, fuente de la que proceden estos datos, acredita la autorización del centro pero no detalla comedor, tramos horarios ni actividades. En la red pública de primer ciclo, la admisión se resuelve mediante un proceso reglado, con plazos oficiales y criterios de baremación que se publican cada curso.\n\nEsta ficha se ha elaborado con información de origen público y puede quedar incompleta. El teléfono del centro es la vía más directa para preguntar por plazas, horario y funcionamiento diario.',
  updated_at = NOW()
WHERE slug = 'ei-benacantil-alicante';

-- VISTAHERMOSA FAMILY SCHOOL (vistahermosa-family-school-alicante) [privado]
UPDATE centers SET
  long_description = E'En la avenida de la Albufereta, 25 (03016), funciona Vistahermosa Family School, un centro privado de Alicante autorizado para el primer ciclo de educación infantil, que abarca de los 0 a los 3 años.\n\nLa fuente oficial consultada acredita esa autorización, pero no recoge servicios concretos: comedor, ampliación de horario o proyecto lingüístico son extremos que conviene contrastar con el propio centro. Otra pregunta práctica es si participa en el Bono Infantil, la ayuda de la Generalitat para la escolarización de 0 a 3 años, ya que ese dato no figura en el registro.\n\nLos contenidos de esta ficha proceden de fuentes públicas y pueden no reflejar cambios recientes. Para plazas del curso, cuotas y horarios, lo más fiable es hablar directamente con la escuela.',
  updated_at = NOW()
WHERE slug = 'vistahermosa-family-school-alicante';

-- NIDO (nido-alicante) [privado]
UPDATE centers SET
  long_description = E'Nido es una escuela infantil privada de primer ciclo situada en la calle El Chopo, 11-13, código postal 03015 de Alicante. Su alumnado va de los 0 a los 3 años.\n\nEn el registro de centros docentes de la Generalitat Valenciana consta como centro autorizado, sin más detalle sobre su organización diaria. Como referencia general de la etapa, las escuelas de primer ciclo suelen agrupar a los niños por edades y estructurar la jornada en torno a la alimentación, el descanso y el juego, con criterios propios de cada proyecto.\n\nLa información recogida aquí procede de fuentes públicas. El centro dispone de teléfono y web propios, y es quien mejor puede aclarar plazas libres, cuotas y periodo de adaptación.',
  updated_at = NOW()
WHERE slug = 'nido-alicante';

-- PRINCESA MERCEDES (princesa-mercedes-alicante) [privado]
UPDATE centers SET
  long_description = E'La calle Princesa Mercedes, 12-14 (03006), da nombre y dirección a Princesa Mercedes, un centro privado de educación infantil de primer ciclo de Alicante que atiende de los 0 a los 3 años.\n\nEl registro autonómico recoge además otro centro con denominación coincidente, Princesa Mercedes Babel, en la plaza Farmacéutico Luis Gisbert; los datos de uno no se han atribuido al otro, porque la fuente no establece relación entre ambos. Sobre esta dirección en concreto no constan servicios, horarios ni proyecto pedagógico.\n\nAl tratarse de una ficha construida a partir de información pública, puede faltar detalle relevante. Una llamada al centro permite confirmar plazas, cuotas y el funcionamiento del curso.',
  updated_at = NOW()
WHERE slug = 'princesa-mercedes-alicante';

-- PICAPIEDRA (picapiedra-alicante) [privado]
UPDATE centers SET
  long_description = E'Picapiedra atiende a niños de 0 a 3 años en la calle Deportistas Hermanos Torres, 12 (03016), en Alicante. Es un centro de titularidad privada dentro del primer ciclo de educación infantil.\n\nSu presencia en el Registre de Centres Docents de la Comunitat Valenciana acredita la autorización administrativa, pero no equivale a un listado de servicios: la fuente consultada no confirma comedor, horario ampliado ni actividades complementarias. Merece la pena revisar esos puntos con el equipo, junto con la organización de las aulas por edades.\n\nFicha elaborada con datos de acceso público, susceptibles de quedar desactualizados. El centro cuenta con teléfono, correo electrónico y web propios para resolver dudas sobre admisión y tarifas.',
  updated_at = NOW()
WHERE slug = 'picapiedra-alicante';

-- PEQUEÑO MUNDO (pequeno-mundo-alicante) [privado]
UPDATE centers SET
  long_description = E'Pequeño Mundo es una guardería privada de Alicante dedicada al primer ciclo de educación infantil. Se encuentra en la calle Padre Recadero de los Ríos, 14 (03005), y admite a niños desde los primeros meses hasta los 3 años.\n\nLos datos disponibles proceden de su autorización ante la Conselleria d''Educació, Universitats i Ocupació, que no describe la actividad del centro. Entre lo que conviene preguntar está si la escuela está adherida al Bono Infantil de la Generalitat, la ayuda destinada a rebajar el coste de la escolarización de 0 a 3 años, algo que no aparece en el registro.\n\nEsta ficha reúne información pública y no sustituye al contacto con la escuela. Llamando al centro se pueden confirmar plazas, horarios y las cuotas vigentes.',
  updated_at = NOW()
WHERE slug = 'pequeno-mundo-alicante';

-- LA COMETA (la-cometa-alicante) [privado]
UPDATE centers SET
  long_description = E'En la avenida de Dénia, 152 (03016), se encuentra La Cometa, escuela infantil privada de Alicante autorizada para el primer ciclo, de 0 a 3 años.\n\nEl registro oficial de centros docentes de la Comunitat Valenciana no añade información sobre su día a día. Como contexto de la etapa, el primer ciclo no es obligatorio y cada centro define su propio calendario, su periodo de adaptación y sus servicios, de modo que dos escuelas próximas pueden funcionar de forma muy distinta.\n\nTodo lo anterior se apoya en fuentes públicas, con las limitaciones que eso implica. La Cometa dispone de teléfono, correo y página web propios donde ampliar la información antes de solicitar plaza.',
  updated_at = NOW()
WHERE slug = 'la-cometa-alicante';

-- PETER PAN (peter-pan-alicante) [privado]
UPDATE centers SET
  long_description = E'Con dirección en la calle Plus Ultra, 50 (03012), Peter Pan es un centro privado de educación infantil de primer ciclo de Alicante. Acoge a niños de 0 a 3 años.\n\nMás allá de su autorización administrativa, las fuentes consultadas no concretan servicios ni horario. Si necesitas cubrir una jornada laboral larga, pregunta expresamente por la hora de apertura y de cierre y por la existencia de comedor: son dos aspectos que varían mucho entre escuelas de la ciudad y que aquí no constan.\n\nLa ficha se ha redactado con datos de origen público y puede estar incompleta. El propio centro, a través de su teléfono, su correo o su web, es la referencia más fiable sobre plazas y cuotas.',
  updated_at = NOW()
WHERE slug = 'peter-pan-alicante';

-- COLORÍN COLORADO (colorin-colorado-alicante) [privado]
UPDATE centers SET
  long_description = E'Colorín Colorado desarrolla su actividad en la calle Doctor Berguez, 37-39 (03012), en Alicante, como centro privado de primer ciclo de educación infantil para niños de 0 a 3 años.\n\nLa información oficial disponible se limita a su autorización como centro docente: no hay constancia de servicios como comedor, ampliación horaria o actividades complementarias. En el primer ciclo, el número máximo de niños por aula está regulado por normativa, mientras que el resto del proyecto lo decide cada escuela, así que compararlas exige preguntar caso por caso.\n\nLo publicado aquí procede de registros públicos y puede quedar desfasado. Escribiendo o llamando al centro se obtiene información actualizada sobre admisión, horarios y precios.',
  updated_at = NOW()
WHERE slug = 'colorin-colorado-alicante';

-- NINÓN (ninon-alicante) [privado]
UPDATE centers SET
  long_description = E'Ninón es un centro privado de educación infantil de primer ciclo con sede en la calle José de Cabo Palomares, 35 (03008), en Alicante, y trabaja con niños de 0 a 3 años.\n\nEn la fuente oficial consultada figura únicamente su autorización, sin detalle de horario, comedor ni proyecto educativo. Tampoco consta si está acogido a las ayudas autonómicas para el primer ciclo, un dato con impacto directo en el coste para la familia que solo el centro puede confirmar.\n\nEsta ficha recoge datos públicos y no ha sido revisada por el centro. Para conocer plazas disponibles, cuotas y funcionamiento, lo más práctico es llamar por teléfono.',
  updated_at = NOW()
WHERE slug = 'ninon-alicante';

-- ACUARELAS (acuarelas-alicante) [privado]
UPDATE centers SET
  long_description = E'Acuarelas es una escuela infantil privada situada en la calle Catral, 3-5 (03007), en Alicante, autorizada para el primer ciclo de educación infantil, de 0 a 3 años.\n\nEn el mismo registro figura Acuarelas 2, en la calle Músico José Alcaraz Pérez, con idéntico teléfono de contacto; aun así, ninguna característica de una dirección se ha dado por válida para la otra. Sobre esta sede, la fuente no aporta servicios, horario ni línea pedagógica.\n\nAl proceder de información pública, la ficha puede resultar parcial. El teléfono del centro es el camino más rápido para preguntar por plazas, tarifas y organización del curso.',
  updated_at = NOW()
WHERE slug = 'acuarelas-alicante';

-- MI COLE - EL SOLET (mi-cole-el-solet-alicante) [privado]
UPDATE centers SET
  long_description = E'Mi Cole - El Solet imparte el primer ciclo de educación infantil, de 0 a 3 años, en la calle Agustín Jiménez Narvalaz, s/n (03010), en Alicante. Su titularidad es privada.\n\nLa consulta al registro autonómico confirma que se trata de un centro autorizado, y nada más. No se han localizado datos verificables sobre comedor, ampliación de horario ni actividades, de modo que esos puntos quedan abiertos hasta que los aclare el propio equipo.\n\nLa ficha se apoya en fuentes públicas y admite correcciones. El contacto directo con el centro, por teléfono o por correo electrónico, resolverá las dudas sobre plazas, cuotas y horarios.',
  updated_at = NOW()
WHERE slug = 'mi-cole-el-solet-alicante';

-- KID'S GARDEN (kid-s-garden-alicante) [privado]
UPDATE centers SET
  long_description = E'Kid''s Garden ocupa un local en la avenida Costa Blanca, 16, local 1 (03540), dentro del término municipal de Alicante. Es un centro privado de primer ciclo de educación infantil, para edades comprendidas entre los 0 y los 3 años.\n\nSu ficha remite a una web propia dentro del portal kidsgarden.edu.es, aunque el registro autonómico no detalla qué servicios presta esta sede en concreto. Antes de decidir, conviene preguntar por el horario de apertura y cierre, por las opciones de comedor y por el calendario del curso.\n\nLos datos aquí reunidos provienen de fuentes públicas y pueden variar con el tiempo. El centro puede confirmar de primera mano plazas libres, cuotas y condiciones de matrícula.',
  updated_at = NOW()
WHERE slug = 'kid-s-garden-alicante';

-- CHILDREN ISLA TABARCA (children-isla-tabarca-alicante) [privado]
UPDATE centers SET
  long_description = E'Children Isla Tabarca es un centro privado de educación infantil de primer ciclo. Su dirección registrada es la calle Ecuador, 2-B, en la urbanización Isla Tabarca, junto a San Gabriel (03008), en Alicante, y atiende a niños de 0 a 3 años.\n\nLa fuente oficial no acompaña esa autorización de ningún dato sobre funcionamiento. En esta etapa, la elección suele depender tanto de la propuesta educativa como de cuestiones logísticas —proximidad al domicilio o al trabajo, hora de entrada y de salida—, y solo la escuela puede precisar cómo resuelve cada una.\n\nEsta ficha se ha compuesto con información pública, sin validación del centro. Para plazas, precios y horarios, conviene contactar directamente por teléfono.',
  updated_at = NOW()
WHERE slug = 'children-isla-tabarca-alicante';

-- ACUARELAS 2 (acuarelas-2-alicante) [privado]
UPDATE centers SET
  long_description = E'En la calle Músico José Alcaraz Pérez, local 1 (03008), opera Acuarelas 2, guardería privada de Alicante dedicada al primer ciclo de educación infantil, de 0 a 3 años.\n\nComparte teléfono de contacto con Acuarelas, en la calle Catral, si bien el registro consultado no describe los servicios de ninguna de las dos direcciones ni establece equivalencias entre ellas. Cualquier detalle sobre horario, comedor o agrupamiento por edades debe confirmarse con el centro.\n\nFicha elaborada a partir de datos públicos, que pueden quedar incompletos o desactualizados. Una llamada basta para conocer la disponibilidad de plazas y las cuotas del curso.',
  updated_at = NOW()
WHERE slug = 'acuarelas-2-alicante';

-- PRINCESA MERCEDES BABEL (princesa-mercedes-babel-alicante) [privado]
UPDATE centers SET
  long_description = E'Princesa Mercedes Babel es una escuela infantil privada de primer ciclo con dirección en la plaza Farmacéutico Luis Gisbert, 1 (03008), en Alicante. Escolariza a niños de 0 a 3 años.\n\nSu nombre coincide con el de otro centro registrado en la calle Princesa Mercedes, pero la fuente oficial no confirma vínculo entre ambos ni describe los servicios de esta dirección. Horario, comedor y proyecto educativo son, por tanto, preguntas pendientes.\n\nLa información procede de registros públicos y puede no estar actualizada. El teléfono del centro es la vía para consultar plazas, tarifas y organización del día a día.',
  updated_at = NOW()
WHERE slug = 'princesa-mercedes-babel-alicante';

COMMIT;
