-- enrich-jerez-centers.sql
-- Enriquecimiento de long_description para los 27 centros "finos" de Jerez de la Frontera
-- (city_slug='jerez-de-la-frontera'): centros sin long_description previa y sin servicios
-- confirmados (services vacio), que por ello quedan en noindex. Los otros 10 centros del
-- municipio (6 escuelas infantiles publicas de la Junta de Andalucia y 4 privados con
-- servicios confirmados) ya tienen long_description y NO se tocan.
-- Redaccion basada EXCLUSIVAMENTE en datos ya presentes en
-- data/migrations/insert-jerez-centers.sql y data/enrichment/jerez-centers.json
-- (nombre, direccion, pedania cuando consta, titularidad privada, edades 4-36 meses,
-- adhesion o no al Programa de Ayuda a las Familias de la Junta de Andalucia).
-- No se inventan servicios, horarios, metodologias ni barrios; el contexto generico se
-- formula como caracteristica de la etapa 0-3, no del centro.
-- Solo actualiza long_description y updated_at, identificando cada centro por slug.
-- NO toca: services, verification_status, confidence_level, verified_at, faqs,
-- pedagogical_approach, schedule ni ningun otro campo.
-- Centros afectados: 27 (25 privados adheridos al Programa de Ayuda a las Familias,
-- 2 privados no adheridos: pipos-jerez, nazaret-jerez).
-- Generado: 2026-07-20. Revisar antes de ejecutar. NO ejecutado.
-- Sin DELETE / DROP / TRUNCATE.
-- Rollback disponible en data/migrations/rollback-enrich-jerez-centers.sql.

BEGIN;

-- EL SALVADOR (el-salvador-jerez) [privado, adherido]
UPDATE centers SET
  long_description = E'El Salvador es una guardería privada de Jerez de la Frontera dedicada al primer ciclo de educación infantil. Tiene su sede en la Plaza Ponce de León, 1 (código postal 11403) y escolariza a niños desde los 4 meses hasta los 3 años.\n\nEn el registro de centros de primer ciclo de la Junta de Andalucía figura adherido al Programa de Ayuda a las Familias, por lo que las familias matriculadas pueden solicitar la bonificación del precio de la plaza en los términos que fija la normativa autonómica. Más allá de este dato, la fuente oficial no confirma servicios concretos: comedor, horarios o actividades son cuestiones que gestiona directamente el equipo del centro.\n\nEsta ficha se ha elaborado a partir de fuentes públicas y puede quedar incompleta. Para conocer plazas disponibles, horarios y cuotas del curso actual, lo más práctico es contactar con el propio centro.',
  updated_at = NOW()
WHERE slug = 'el-salvador-jerez';

-- MUNDO NUEVO (mundo-nuevo-jerez) [privado, adherido]
UPDATE centers SET
  long_description = E'En la calle Ventura Misa, 18, dentro del código postal 11401 de Jerez de la Frontera, trabaja Mundo Nuevo, un centro privado autorizado para el primer ciclo de educación infantil que recibe a pequeños de entre 4 meses y 3 años.\n\nSu adhesión al Programa de Ayuda a las Familias de la Junta de Andalucía abre la puerta a las reducciones de cuota previstas para esta etapa. El registro consultado no aporta detalle sobre otros servicios; como en cualquier escuela 0-3, la organización de la jornada, el calendario y el periodo de adaptación los define cada centro con sus propios criterios.\n\nLos datos mostrados proceden de registros oficiales de acceso público. Antes de decidir, merece la pena preguntar en el centro por la disponibilidad de plaza, el horario real y las condiciones económicas.',
  updated_at = NOW()
WHERE slug = 'mundo-nuevo-jerez';

-- EL CENTRO (el-centro-jerez) [privado, adherido]
UPDATE centers SET
  long_description = E'La Plaza Quemada, 9 (11402) es la dirección de El Centro, una guardería de titularidad privada situada en Jerez de la Frontera. Su actividad se centra en el primer ciclo de educación infantil, de los 4 meses a los 3 años.\n\nSegún el registro oficial andaluz, está adherido al Programa de Ayuda a las Familias, el mecanismo con el que la Junta de Andalucía bonifica parte del coste de la escolarización temprana. No constan en cambio servicios verificados adicionales, de modo que aspectos prácticos como la alimentación o la ampliación de horario conviene tratarlos con el equipo educativo.\n\nFicha construida con información de origen público, sujeta a actualización. El propio centro puede confirmar de primera mano sus plazas, tarifas y funcionamiento diario.',
  updated_at = NOW()
WHERE slug = 'el-centro-jerez';

-- EL PASTORCITO DIVINO (el-pastorcito-divino-jerez) [privado, adherido]
UPDATE centers SET
  long_description = E'El Pastorcito Divino acoge a bebés y niños de 4 meses a 3 años en la calle Guindo, 6, en la zona del código postal 11406 de Jerez de la Frontera. Es un centro privado inscrito para impartir el primer ciclo de educación infantil.\n\nConsta adherido al Programa de Ayuda a las Familias, así que las familias pueden tramitar las bonificaciones de precio que regula la Junta de Andalucía para el 0-3. Sobre horarios, comedor u otros servicios no hay confirmación en la fuente consultada; en esta etapa, cada escuela estructura el día en torno a rutinas de juego, descanso y alimentación adaptadas a cada edad.\n\nLa información recogida aquí tiene origen en fuentes públicas. Si valoras este centro, pregunta directamente por el proceso de matrícula, las cuotas y las plazas del curso vigente.',
  updated_at = NOW()
WHERE slug = 'el-pastorcito-divino-jerez';

-- LA TORTUGA (la-tortuga-jerez) [privado, adherido]
UPDATE centers SET
  long_description = E'Quien busque plaza de 0 a 3 años cerca de la avenida de Las Delicias encontrará en el número 58, esquina con la calle Galápago (11406), a La Tortuga, guardería privada de Jerez de la Frontera dedicada al primer ciclo de educación infantil, con niños desde los 4 meses.\n\nEl centro aparece adherido al Programa de Ayuda a las Familias de la Junta de Andalucía, lo que permite bonificar la cuota mensual según la normativa en vigor. La fuente oficial no detalla servicios complementarios; el periodo de adaptación, habitual al inicio de curso en el primer ciclo, se pauta en cada escuela junto con las familias.\n\nEstos datos provienen de registros públicos y pueden variar. Una llamada al centro es la vía más fiable para confirmar plazas libres, horario y precios actualizados.',
  updated_at = NOW()
WHERE slug = 'la-tortuga-jerez';

-- BLANCA PALOMA (blanca-paloma-jerez) [privado, adherido]
UPDATE centers SET
  long_description = E'Blanca Paloma es un centro privado de primer ciclo de educación infantil con domicilio en Polígo San Telmo, s/n (11408), según el registro oficial de la Junta de Andalucía, en Jerez de la Frontera. Atiende a niños de entre 4 meses y 3 años.\n\nFigura adherido al Programa de Ayuda a las Familias, de manera que el precio del servicio puede bonificarse conforme a las condiciones que marca la administración andaluza. No hay constancia oficial de servicios concretos; cuestiones como el comedor, la jornada o la organización de los grupos por edades corresponden al proyecto propio de cada centro.\n\nEsta ficha reúne información de acceso público y puede no reflejar cambios recientes. Para resolver dudas sobre matrícula, cuotas y disponibilidad, contacta directamente con el equipo.',
  updated_at = NOW()
WHERE slug = 'blanca-paloma-jerez';

-- PITA-PITA (pita-pita-jerez) [privado, adherido]
UPDATE centers SET
  long_description = E'En la calle Tajo, 19 (11406, Jerez de la Frontera) desarrolla su labor Pita-Pita, una guardería privada del primer ciclo de educación infantil. Admite a pequeños desde los 4 meses hasta que cumplen los 3 años.\n\nDe acuerdo con el registro andaluz de centros de primer ciclo, está adherida al Programa de Ayuda a las Familias, la vía autonómica para reducir el coste de la plaza. Al margen de la titularidad y la dirección, la fuente no confirma más detalles de funcionamiento, algo frecuente en centros cuyo día a día se conoce mejor en una visita.\n\nInformación obtenida de fuentes públicas y susceptible de ampliarse. El equipo del centro es la referencia para horarios, comedor, plazas y tarifas de cada curso.',
  updated_at = NOW()
WHERE slug = 'pita-pita-jerez';

-- PEREZOSO (perezoso-jerez) [privado, adherido, pedania Guadalcacin]
UPDATE centers SET
  long_description = E'En la pedanía jerezana de Guadalcacín, en la calle Real, 11 (11591), se encuentra Perezoso, un centro privado que imparte el primer ciclo de educación infantil para niños de 4 meses a 3 años.\n\nSu presencia en el Programa de Ayuda a las Familias de la Junta de Andalucía permite a las familias solicitar la bonificación del precio del servicio educativo. El registro no especifica servicios adicionales confirmados; para quienes viven en Guadalcacín y su entorno, contar con un centro en la propia pedanía puede evitar desplazamientos diarios hasta el núcleo urbano de Jerez de la Frontera.\n\nDatos procedentes de fuentes oficiales de acceso público. Conviene verificar con el propio centro las plazas, el horario y las cuotas antes de tomar una decisión.',
  updated_at = NOW()
WHERE slug = 'perezoso-jerez';

-- LA GRANJA (la-granja-jerez) [privado, adherido]
UPDATE centers SET
  long_description = E'La Granja comparte nombre con la barriada en la que se ubica: su sede está en la Plaza Ronda, s/n, en la Bda. La Granja (11405) de Jerez de la Frontera. Es una guardería privada de primer ciclo de educación infantil para edades de 4 meses a 3 años.\n\nEl registro de la Junta de Andalucía la recoge como centro adherido al Programa de Ayuda a las Familias, con las bonificaciones de precio que ello conlleva para las familias matriculadas. No figuran servicios confirmados en la fuente; el horario concreto, la comida o las actividades se organizan según los criterios de cada escuela infantil.\n\nEsta información procede de registros públicos. Para plazas del curso actual y condiciones económicas, lo recomendable es hablar directamente con el centro.',
  updated_at = NOW()
WHERE slug = 'la-granja-jerez';

-- PIPOS (pipos-jerez) [privado, NO adherido]
UPDATE centers SET
  long_description = E'Pipos es una guardería privada de Jerez de la Frontera con sede en la avenida Cruz Roja, 1 (11407). Imparte el primer ciclo de educación infantil y acoge a niños desde los 4 meses hasta los 3 años.\n\nEn el registro consultado de la Junta de Andalucía no aparece adherida al Programa de Ayuda a las Familias; con la información disponible, las bonificaciones autonómicas de cuota no serían aplicables, aunque la adhesión puede variar entre cursos y lo prudente es preguntarlo al propio centro. Tampoco constan servicios verificados en la fuente oficial.\n\nFicha elaborada con datos de acceso público. El equipo del centro puede aclarar cualquier duda sobre horarios, comedor, plazas y tarifas vigentes.',
  updated_at = NOW()
WHERE slug = 'pipos-jerez';

-- BUGUI BUGUI (bugui-bugui-jerez) [privado, adherido, pedania Torrecera]
UPDATE centers SET
  long_description = E'Las familias de Torrecera, pedanía del término municipal de Jerez de la Frontera, cuentan con Bugui Bugui, un centro privado de primer ciclo de educación infantil situado en la calle La Ina, s/n (11595). Atiende a niños de entre 4 meses y 3 años.\n\nEstá adherido al Programa de Ayuda a las Familias, el sistema de la Junta de Andalucía que bonifica parte del precio de la escolarización 0-3. En la fuente oficial no se recogen servicios adicionales; en el medio rural, disponer de una escuela infantil en la propia pedanía facilita la conciliación sin traslados diarios al casco urbano.\n\nLos datos de esta ficha proceden de fuentes públicas. Para matrícula, horarios y cuotas, la referencia es el contacto directo con el centro.',
  updated_at = NOW()
WHERE slug = 'bugui-bugui-jerez';

-- LOLITA (lolita-jerez) [privado, adherido]
UPDATE centers SET
  long_description = E'La guardería Lolita ocupa un inmueble de la calle San Justo, 6, en el código postal 11402 de Jerez de la Frontera. De titularidad privada, escolariza el primer ciclo de educación infantil: bebés desde los 4 meses y niños hasta los 3 años.\n\nAparece en el registro oficial como centro adherido al Programa de Ayuda a las Familias, lo que da acceso a las reducciones de cuota reguladas por la Junta de Andalucía. Otros aspectos del funcionamiento no están confirmados en la fuente; en el 0-3, elementos como los grupos por edad, la siesta o el menú dependen del proyecto de cada escuela.\n\nContenido elaborado a partir de información pública. Pregunta al centro por su disponibilidad de plazas, su jornada y sus precios antes de formalizar una solicitud.',
  updated_at = NOW()
WHERE slug = 'lolita-jerez';

-- EL GOLFILLO 2 (el-golfillo-2-jerez) [privado, adherido]
UPDATE centers SET
  long_description = E'El Golfillo 2 imparte el primer ciclo de educación infantil en la calle Martín Ferrador, 6 (11405), en Jerez de la Frontera. Se trata de un centro privado cuyo alumnado abarca de los 4 meses a los 3 años.\n\nLa Junta de Andalucía lo incluye entre los centros adheridos al Programa de Ayuda a las Familias, de modo que la cuota puede bonificarse con arreglo a la normativa vigente. El registro no añade servicios confirmados; la incorporación de los más pequeños en esta etapa suele hacerse de forma progresiva, con pautas que cada escuela acuerda con las familias.\n\nEsta ficha usa exclusivamente datos de fuentes públicas. El centro puede detallar por teléfono o en una visita sus horarios, servicios reales y plazas libres.',
  updated_at = NOW()
WHERE slug = 'el-golfillo-2-jerez';

-- MONTEALTO (montealto-jerez) [privado, adherido]
UPDATE centers SET
  long_description = E'En la avenida Carrascal, 34 (11407) de Jerez de la Frontera presta servicio Montealto, guardería de titularidad privada especializada en el primer ciclo de educación infantil. Sus aulas reciben a niños de 4 meses a 3 años.\n\nAl estar adherida al Programa de Ayuda a las Familias, las familias pueden acogerse a las bonificaciones de precio de la Junta de Andalucía. No constan más servicios en el registro consultado; el calendario, la jornada y el modo de organizar la adaptación son decisiones propias de cada centro de esta etapa.\n\nInformación procedente de fuentes de acceso público, que puede completarse con el tiempo. Contactar con el centro es la forma más segura de conocer plazas, horario y cuotas al día.',
  updated_at = NOW()
WHERE slug = 'montealto-jerez';

-- PEQUENOS PASITOS (pequenos-pasitos-jerez) [privado, adherido]
UPDATE centers SET
  long_description = E'Pequeños pasitos es el nombre de un centro privado de educación infantil de primer ciclo abierto en la calle Abderramán, 16 (11406), en Jerez de la Frontera. Su franja de edad va de los 4 meses a los 3 años.\n\nFigura adherido al Programa de Ayuda a las Familias, por lo que el coste de la plaza puede reducirse mediante las bonificaciones que gestiona la Junta de Andalucía. No hay más servicios acreditados en la fuente oficial; como referencia general, en el 0-3 el juego es la principal herramienta de aprendizaje y cada escuela lo articula a su manera.\n\nDatos tomados de registros públicos, sujetos a revisión. Para información de primera mano sobre matrícula, horarios y precios, dirígete al propio centro.',
  updated_at = NOW()
WHERE slug = 'pequenos-pasitos-jerez';

-- BAMBU (bambu-jerez) [privado, adherido]
UPDATE centers SET
  long_description = E'La Plaza de la Albahaca, 3, en el 11407 de Jerez de la Frontera, alberga a Bambú, un centro infantil privado autorizado para el primer ciclo de educación infantil. Escolariza desde los 4 meses hasta los 3 años.\n\nSu adhesión al Programa de Ayuda a las Familias permite solicitar las bonificaciones sobre la cuota que contempla la Junta de Andalucía para esta etapa educativa. La fuente oficial consultada no concreta servicios adicionales, así que horario ampliado, comedor o actividades complementarias deben confirmarse con el equipo.\n\nFicha basada en datos públicos. Cualquier decisión de matrícula conviene apoyarla en una consulta directa al centro sobre plazas, jornada y tarifas.',
  updated_at = NOW()
WHERE slug = 'bambu-jerez';

-- EL SONAJERO (el-sonajero-jerez) [privado, adherido]
UPDATE centers SET
  long_description = E'El Sonajero atiende a la infancia de 0 a 3 años (desde los 4 meses de edad) en la barriada Ciudasol, s/n, código postal 11405 de Jerez de la Frontera. Es un centro de titularidad privada dedicado al primer ciclo de educación infantil.\n\nConsta adherido al Programa de Ayuda a las Familias de la Junta de Andalucía, lo que se traduce en posibles bonificaciones del precio para las familias matriculadas. Del resto de servicios no hay confirmación oficial; en esta etapa, la alimentación, el descanso y el juego marcan la rutina diaria, con una organización que cada escuela adapta a sus grupos.\n\nLa información de esta ficha procede de fuentes públicas. Plazas disponibles, horarios y cuotas actualizadas se consultan directamente en el centro.',
  updated_at = NOW()
WHERE slug = 'el-sonajero-jerez';

-- MONTEALTO II (montealto-ii-jerez) [privado, adherido]
UPDATE centers SET
  long_description = E'Montealto II es una guardería privada de primer ciclo emplazada en la calle Tilo, 11, dentro de la urbanización Montealto (11407), en Jerez de la Frontera. Trabaja con niños de entre 4 meses y 3 años.\n\nEl registro andaluz la señala como centro adherido al Programa de Ayuda a las Familias, requisito para que las familias tramiten la bonificación del precio de la atención socioeducativa. No se recogen otros servicios en la fuente; visitar el centro sigue siendo la mejor manera de conocer sus instalaciones y su forma de trabajar.\n\nDatos reunidos a partir de registros oficiales públicos. Ante cualquier duda sobre plazas, jornada o cuotas, el equipo del centro puede dar respuesta directa.',
  updated_at = NOW()
WHERE slug = 'montealto-ii-jerez';

-- EL NIDO (el-nido-jerez) [privado, adherido]
UPDATE centers SET
  long_description = E'En el número 16 de la calle Bruselas (11405) se sitúa El Nido, centro privado de educación infantil de primer ciclo de Jerez de la Frontera. Recibe a bebés a partir de los 4 meses y acompaña a los niños hasta los 3 años.\n\nEstá incluido en el Programa de Ayuda a las Familias, la línea de la Junta de Andalucía que abarata la escolarización temprana mediante bonificaciones de cuota. Más allá de eso, la fuente oficial no confirma servicios; el arranque del curso en el 0-3 acostumbra a incluir una adaptación gradual cuyos detalles fija cada escuela.\n\nEsta ficha puede incluir información de fuentes públicas pendiente de ampliar. Habla con el centro para confirmar disponibilidad, horarios reales y condiciones económicas.',
  updated_at = NOW()
WHERE slug = 'el-nido-jerez';

-- BABY ILUSIONES (baby-ilusiones-jerez) [privado, adherido]
UPDATE centers SET
  long_description = E'Baby Ilusiones desarrolla su actividad educativa en la calle Amadeo Vives, 9 (11406), en Jerez de la Frontera. Este centro privado cubre el primer ciclo de educación infantil y matricula a niños de 4 meses a 3 años.\n\nDe cara a las familias, su dato administrativo más relevante es la adhesión al Programa de Ayuda a las Familias, que permite aplicar las bonificaciones de precio previstas por la Junta de Andalucía. Servicios como comedor u horario ampliado no aparecen confirmados en el registro, por lo que deben preguntarse directamente.\n\nLos contenidos de esta ficha se apoyan en fuentes de acceso público. Para plazas, calendario y cuotas del curso, contacta con el equipo del centro.',
  updated_at = NOW()
WHERE slug = 'baby-ilusiones-jerez';

-- COLORINES' HOUSE (colorines-house-jerez) [privado, adherido]
UPDATE centers SET
  long_description = E'Colorines'' House es un centro infantil privado localizado en la calle Tilo, 164, en la zona de Montealto (11407), Jerez de la Frontera. Ofrece primer ciclo de educación infantil a pequeños de entre 4 meses y 3 años.\n\nSegún la información registral de la Junta de Andalucía, participa en el Programa de Ayuda a las Familias, con las bonificaciones de cuota asociadas para quienes se matriculan. No hay servicios adicionales verificados; conocer el proyecto educativo, los espacios y la rutina diaria requiere una toma de contacto con el propio centro.\n\nFicha redactada con datos de origen público. Cuotas, plazas y horarios concretos se confirman llamando o visitando el centro.',
  updated_at = NOW()
WHERE slug = 'colorines-house-jerez';

-- EDUCA (educa-jerez) [privado, adherido]
UPDATE centers SET
  long_description = E'La avenida de Francia, 20 (11408) acoge a Educa, guardería privada del primer ciclo de educación infantil en Jerez de la Frontera. Su alumnado comprende edades desde los 4 meses hasta los 3 años.\n\nEl centro figura adherido al Programa de Ayuda a las Familias de la Junta de Andalucía, lo que posibilita bonificar parte del precio de la plaza conforme a la normativa autonómica. Sobre el resto del funcionamiento no hay datos oficiales confirmados; cada escuela de esta etapa define su calendario, sus horarios y la composición de sus grupos de edad.\n\nEsta información procede de fuentes públicas y puede evolucionar. El contacto directo con el centro resuelve las dudas sobre matrícula, tarifas y disponibilidad.',
  updated_at = NOW()
WHERE slug = 'educa-jerez';

-- PEQUENO PONY (pequeno-pony-jerez) [privado, adherido]
UPDATE centers SET
  long_description = E'Pequeño Pony escolariza el tramo 0-3 en la calle Nuestra Señora de la "O", 46 (11406), en Jerez de la Frontera. Es un centro de educación infantil de titularidad privada que admite a niños desde los 4 meses de edad hasta los 3 años.\n\nEn el registro de la Junta de Andalucía consta su adhesión al Programa de Ayuda a las Familias, por lo que las familias pueden solicitar las bonificaciones autonómicas de precio. La fuente no confirma servicios complementarios; como en toda escuela infantil de primer ciclo, las rutinas de cuidado y juego estructuran la jornada, con fórmulas propias de cada centro.\n\nDatos extraídos de registros oficiales abiertos. Antes de matricular, verifica con el centro las plazas libres, la jornada y las cuotas en vigor.',
  updated_at = NOW()
WHERE slug = 'pequeno-pony-jerez';

-- LA ARDILLA PILLA (la-ardilla-pilla-jerez) [privado, adherido]
UPDATE centers SET
  long_description = E'La Ardilla Pilla tiene su local en la calle Leones, 8, dentro del código postal 11401 de Jerez de la Frontera. Estamos ante un centro privado de primer ciclo de educación infantil con alumnado de 4 meses a 3 años.\n\nSu inscripción como centro adherido al Programa de Ayuda a las Familias hace posible que las familias reduzcan la cuota mediante las ayudas de la Junta de Andalucía. Ningún otro servicio aparece acreditado en la fuente oficial; los detalles cotidianos, como entradas y salidas, comidas o siestas, se concretan con el equipo educativo.\n\nFicha nutrida con información pública. La vía más directa para saber si hay plaza y cuánto cuesta es preguntar en el propio centro.',
  updated_at = NOW()
WHERE slug = 'la-ardilla-pilla-jerez';

-- VEO VEO (veo-veo-jerez) [privado, adherido]
UPDATE centers SET
  long_description = E'Veo Veo forma parte de la oferta privada de educación infantil 0-3 de Jerez de la Frontera, con dirección en la avenida Limonar, 8, en Montealto (11407). Atiende el primer ciclo, desde los 4 meses hasta los 3 años.\n\nAl figurar adherido al Programa de Ayuda a las Familias, las familias usuarias pueden pedir la bonificación del precio que regula la Junta de Andalucía. El registro consultado no incluye servicios confirmados; una visita al centro permite valorar aspectos que ninguna ficha recoge, como el ambiente de las aulas o el trato del equipo.\n\nInformación basada en fuentes de acceso público. Consulta en el centro las plazas del curso, el horario y las condiciones económicas.',
  updated_at = NOW()
WHERE slug = 'veo-veo-jerez';

-- NAZARET (nazaret-jerez) [privado, NO adherido]
UPDATE centers SET
  long_description = E'Nazaret es un centro privado de educación infantil situado en la avenida homónima, número 19 (11406), en Jerez de la Frontera. Imparte el primer ciclo y acoge a niños con edades comprendidas entre los 4 meses y los 3 años.\n\nEn el registro consultado de la Junta de Andalucía no figura adherido al Programa de Ayuda a las Familias; con esos datos, las bonificaciones autonómicas de cuota no serían aplicables, aunque la adhesión puede variar de un curso a otro y lo aconsejable es confirmarlo con el centro. Tampoco constan servicios verificados en la fuente oficial.\n\nEsta ficha se ha compuesto con información pública. Horarios, comedor, plazas y tarifas se consultan directamente con el equipo del centro.',
  updated_at = NOW()
WHERE slug = 'nazaret-jerez';

-- CHUPETES (chupetes-jerez) [privado, adherido]
UPDATE centers SET
  long_description = E'Chupetes presta servicio en el edificio de usos múltiples Ciudad de los Niños, en la calle Hijuela de la Marquesa, s/n (11406), en Jerez de la Frontera. Este centro privado se dedica al primer ciclo de educación infantil, con alumnado de 4 meses a 3 años.\n\nEl registro oficial andaluz lo recoge entre los centros adheridos al Programa de Ayuda a las Familias, lo que abre a las familias la posibilidad de bonificar el precio de la plaza. No se especifican servicios adicionales en la fuente; el ritmo diario del 0-3, con acogida, juego, alimentación y descanso, se organiza según el criterio pedagógico de cada escuela.\n\nDatos recopilados de fuentes públicas, pendientes de posibles actualizaciones. Para plazas, cuotas y horario del curso vigente, dirígete al propio centro.',
  updated_at = NOW()
WHERE slug = 'chupetes-jerez';

COMMIT;
