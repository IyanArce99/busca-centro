-- enrich-cordoba-centers.sql
-- Enriquecimiento de long_description para los centros "finos" de Cordoba capital:
-- los que no tienen servicios reales confirmados (services vacio o solo entradas
-- "aula-") ni long_description previa, y que por tanto son noindex/thin content.
-- Con una long_description redactada pasan a ser indexables.
--
-- Afecta a 100 centros de la ciudad de Cordoba (city_slug='cordoba'),
-- identificados por slug (los id son generados por la base y no se conocen).
-- Cada texto es prosa unica (3 parrafos) redactada EXCLUSIVAMENTE a partir de
-- datos ya presentes en data/migrations/insert-cordoba-centers.sql y
-- data/enrichment/cordoba-centers.json (nombre, direccion, codigo postal,
-- titularidad privada, adhesion o no al Programa de Ayuda a las Familias de la
-- Junta de Andalucia, edades 4-36 meses). No se inventan servicios, horarios,
-- metodologias ni datos nuevos; no se confirman hechos nuevos.
--
-- Solo actualiza: long_description, updated_at.
-- NO toca: services, verification_status, confidence_level, verified_at, faqs,
-- short_description, pedagogical_approach, schedule ni ningun otro campo.
-- Rollback disponible en rollback-enrich-cordoba-centers.sql.
-- Generado: 2026-07-20. Revisar antes de ejecutar. NO ejecutado.
-- Sin DELETE / DROP / TRUNCATE.

BEGIN;

-- El Tablerillo  [privado, NO adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'El Tablerillo es un centro privado de educación infantil de primer ciclo situado en la carretera de Las Ermitas, 48 (14012, Córdoba). Atiende a niños desde los 4 meses hasta los 3 años, la etapa previa al segundo ciclo de Infantil.\n\nSegún el registro de centros de la Junta de Andalucía, no figura adherido al Programa de Ayuda a las Familias, de modo que las condiciones económicas y el horario se acuerdan directamente con el centro. La fuente oficial tampoco detalla servicios como comedor o aula matinal, por lo que es recomendable preguntarlos al solicitar información.\n\nLos datos de esta ficha proceden de fuentes públicas y pueden no estar completos. Antes de decidir, conviene contactar con El Tablerillo para confirmar plazas disponibles, horarios y cuotas actualizadas.',
  updated_at = NOW()
WHERE slug = 'el-tablerillo-cordoba';

-- El Nido  [privado, NO adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'En la calle Ciudad de Moncada, 7, dentro del código postal 14012 de Córdoba, se encuentra El Nido, una escuela infantil privada dedicada al primer ciclo de Educación Infantil (de 4 meses a 3 años).\n\nEl registro oficial de la Junta de Andalucía lo recoge como centro privado no adherido al Programa de Ayuda a las Familias, así que las cuotas y la admisión dependen directamente de su dirección. No constan en la fuente consultada servicios concretos como comedor, horario ampliado o patio, algo habitual en los listados administrativos y que no descarta que el centro los ofrezca.\n\nRecomendamos llamar o escribir a El Nido para conocer su proyecto educativo, los servicios reales que presta y la disponibilidad de plaza en cada curso.',
  updated_at = NOW()
WHERE slug = 'el-nido-cordoba';

-- El Jardincito  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'El Jardincito atiende a bebés y niños de 4 meses a 3 años en la calle Libertador Sucre, 8, en la zona del código postal 14013 de Córdoba. Es un centro de educación infantil de primer ciclo de titularidad privada.\n\nFigura adherido al Programa de Ayuda a las Familias de la Junta de Andalucía, el sistema que bonifica el precio del servicio educativo según la normativa vigente; la solicitud de plaza se tramita directamente en el propio centro. Más allá de esa adhesión, la fuente oficial no especifica servicios adicionales, de modo que aspectos como el comedor o el aula matinal conviene consultarlos personalmente.\n\nEsta ficha se ha elaborado con datos de fuentes públicas. Para cuotas, bonificaciones aplicables y visitas, lo más fiable es hablar directamente con El Jardincito.',
  updated_at = NOW()
WHERE slug = 'el-jardincito-cordoba';

-- Los Azahares  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Los Azahares es una escuela infantil privada de primer ciclo que presta servicio en la calle Compositor Gómez Navarro, 30 (código postal 14005, Córdoba), acogiendo a pequeños desde los 4 meses hasta los 3 años.\n\nEstá adherido al Programa de Ayuda a las Familias, por lo que las familias pueden acceder a las bonificaciones del precio que establece la Junta de Andalucía según la normativa en vigor. Como en el resto de centros autorizados de primer ciclo, la actividad diaria se organiza en torno a rutinas de juego, alimentación y descanso, aunque el detalle de servicios concretos no consta en el registro consultado.\n\nSi estás valorando este centro, te sugerimos contactar con Los Azahares para confirmar horario, plazas libres y el importe final tras aplicar las bonificaciones.',
  updated_at = NOW()
WHERE slug = 'los-azahares-cordoba';

-- Supli  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Con sede en la calle Baena, 1 (14009, Córdoba), Supli es un centro privado de educación infantil que trabaja con el primer ciclo, es decir, con niños de entre 4 meses y 3 años.\n\nEl registro de la Junta de Andalucía lo incluye entre los centros adheridos al Programa de Ayuda a las Familias, cuya bonificación reduce el precio del servicio educativo conforme a la normativa vigente. En Córdoba figuran también otros centros con el nombre Supli (Supli Levante y Supli Levante II), cada uno con su propia gestión de plazas. Los servicios específicos de esta dirección no aparecen detallados en la fuente oficial.\n\nLos datos proceden de registros públicos; para horarios, comedor y disponibilidad de plaza, lo mejor es preguntar directamente en el centro.',
  updated_at = NOW()
WHERE slug = 'supli-cordoba';

-- San José  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'En la plaza Ángel de Torres, 5 (14003), San José escolariza el primer ciclo de Educación Infantil en Córdoba: bebés desde los 4 meses y niños hasta los 3 años. Es un centro de titularidad privada.\n\nAl estar adherido al Programa de Ayuda a las Familias de la Junta de Andalucía, las familias que cumplan los requisitos pueden beneficiarse de bonificaciones en el precio del servicio, tramitando la solicitud de plaza en el propio centro. La fuente oficial consultada no recoge información sobre comedor, horarios ampliados u otros servicios, así que conviene confirmarlos antes de matricular.\n\nFicha elaborada a partir de fuentes públicas. Contacta con San José para resolver dudas sobre cuotas, calendario y proceso de admisión.',
  updated_at = NOW()
WHERE slug = 'san-jose-cordoba';

-- María Auxiliadora  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'María Auxiliadora es un centro de educación infantil privado que ocupa el número 6 de la calle Cisne, en el código postal 14002 de Córdoba. Su actividad se centra en el primer ciclo, de los 4 meses a los 3 años.\n\nAparece en el registro oficial como centro adherido al Programa de Ayuda a las Familias, lo que permite aplicar las bonificaciones de la Junta de Andalucía sobre el precio del servicio educativo. Sobre su funcionamiento diario —horario, alimentación, período de adaptación— la fuente consultada no aporta detalle, algo frecuente en los listados administrativos.\n\nAntes de solicitar plaza, recomendamos visitar el centro y contrastar con su equipo los servicios disponibles, las cuotas y la documentación necesaria.',
  updated_at = NOW()
WHERE slug = 'maria-auxiliadora-cordoba';

-- El Tren  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'El Tren presta servicio en la calle Cronista Salcedo Hierro, s/n, dentro del código postal 14001 de Córdoba. Se trata de una escuela infantil privada de primer ciclo, pensada para niños de 4 meses a 3 años.\n\nEstá adherida al Programa de Ayuda a las Familias, de manera que el precio del servicio puede bonificarse según la normativa de la Junta de Andalucía; la plaza se solicita directamente en el centro. En el registro consultado no constan servicios adicionales confirmados, por lo que cuestiones como el comedor o el aula matinal deben preguntarse a su equipo.\n\nLa información procede de fuentes públicas y puede variar de un curso a otro. Llama a El Tren para confirmar plazas, horarios y tarifas actualizadas.',
  updated_at = NOW()
WHERE slug = 'el-tren-cordoba';

-- Mi Granja  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'En plena calle Puerta Osario, 11 (14001), Mi Granja acoge a niños de 4 meses a 3 años como centro privado de educación infantil de primer ciclo. En el registro oficial figuran además otros dos centros con el mismo nombre en la ciudad, Mi Granja II y Mi Granja III.\n\nEl centro está adherido al Programa de Ayuda a las Familias de la Junta de Andalucía, que bonifica el precio del servicio educativo conforme a la normativa vigente. Como ocurre con la mayoría de fichas procedentes de registros administrativos, no hay servicios concretos confirmados: comedor, horario ampliado o actividades deben verificarse con el propio centro.\n\nSi esta ubicación te encaja, contacta con Mi Granja para conocer su día a día, las plazas disponibles y el coste final con bonificación aplicada.',
  updated_at = NOW()
WHERE slug = 'mi-granja-cordoba';

-- Cerro Muriano  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Cerro Muriano es una escuela infantil privada situada en la barriada cordobesa del mismo nombre, al norte del término municipal. Tiene su sede en la calle Acera de Santa Bárbara, s/n (14350) y atiende a pequeños de 4 meses a 3 años.\n\nFigura adherida al Programa de Ayuda a las Familias, así que las familias de la zona pueden solicitar las bonificaciones de la Junta de Andalucía sobre el precio del servicio. La fuente oficial no detalla servicios complementarios; para conocer horario, comedor o período de adaptación es necesario dirigirse al centro.\n\nLos datos se han recopilado de registros públicos. Recomendamos confirmar cualquier detalle práctico directamente con el equipo del centro antes de solicitar plaza.',
  updated_at = NOW()
WHERE slug = 'cerro-muriano-cordoba';

-- Teddy  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'La escuela infantil Teddy se encuentra en la calle Naranjal de Almagro, 1, código postal 14004 de Córdoba. De titularidad privada, se dedica al primer ciclo de Educación Infantil y admite a niños desde los 4 meses de edad hasta los 3 años.\n\nConsta como centro adherido al Programa de Ayuda a las Familias de la Junta de Andalucía; esto significa que, cumpliendo los requisitos de la convocatoria, el precio del servicio educativo se bonifica según la normativa vigente. El registro no incluye información sobre sus instalaciones ni servicios, así que ese detalle hay que pedirlo al centro.\n\nFicha basada en fuentes públicas. Para visitar las instalaciones, preguntar por plazas o conocer las cuotas, ponte en contacto con Teddy.',
  updated_at = NOW()
WHERE slug = 'teddy-cordoba';

-- Mamá Osa  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Mamá Osa ocupa un local del bloque 14 de la calle Nuestra Señora de La Merced, 9, en el código postal 14014 de Córdoba. Es un centro privado de primer ciclo de Educación Infantil que recibe a niños de entre 4 meses y 3 años.\n\nSu adhesión al Programa de Ayuda a las Familias permite que las familias soliciten la bonificación del precio que regula la Junta de Andalucía, gestionando la plaza directamente con el centro. En esta etapa educativa el día a día gira en torno al juego, la alimentación y el descanso; el registro oficial, no obstante, no concreta los servicios que ofrece esta escuela en particular.\n\nTe recomendamos contactar con Mamá Osa para confirmar su horario, los servicios reales y la disponibilidad de plaza en el curso actual.',
  updated_at = NOW()
WHERE slug = 'mama-osa-cordoba';

-- Espinete  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'En la avenida Agrupación de Córdoba (14007) desarrolla su actividad Espinete, centro privado de educación infantil de primer ciclo. Atiende la franja de edad que va de los 4 meses a los 3 años.\n\nEstá adherido al Programa de Ayuda a las Familias de la Junta de Andalucía, cuya bonificación abarata el precio del servicio educativo según la normativa aplicable. Los servicios concretos del centro —comedor, aula matinal, patio— no aparecen en la fuente oficial consultada, por lo que es aconsejable preguntarlos durante la visita.\n\nLos datos de esta página proceden de registros públicos y pueden quedarse cortos. El equipo de Espinete puede completarlos con horarios, cuotas y plazas actualizadas.',
  updated_at = NOW()
WHERE slug = 'espinete-cordoba';

-- Giner de los Ríos  [privado, NO adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Giner de los Ríos es una escuela infantil privada de la calle Teólogo Núñez Delgadillo, 8 (14012, Córdoba), dedicada al primer ciclo de Educación Infantil: bebés desde los 4 meses y niños hasta los 3 años.\n\nEn el registro de la Junta de Andalucía no figura adherida al Programa de Ayuda a las Familias, de modo que sus condiciones económicas se fijan de forma independiente y se consultan directamente con la dirección. Tampoco constan servicios detallados en la fuente oficial, lo que no significa que el centro no los ofrezca: simplemente no están recogidos en el listado administrativo.\n\nPara conocer proyecto educativo, precios y plazas, contacta con Giner de los Ríos; es la vía más segura de obtener información al día.',
  updated_at = NOW()
WHERE slug = 'giner-de-los-rios-cordoba';

-- Jardinalba  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Jardinalba abre sus puertas en la carretera de Alba, 14, dentro del código postal 14012 de Córdoba. Este centro privado de educación infantil escolariza el primer ciclo, de los 4 meses a los 3 años.\n\nAparece como centro adherido al Programa de Ayuda a las Familias, el mecanismo de la Junta de Andalucía que bonifica el precio del servicio educativo según la normativa vigente; la solicitud de plaza se presenta en el propio centro. No hay constancia oficial de sus servicios complementarios, así que conviene repasarlos con el equipo antes de matricular.\n\nEsta información procede de fuentes públicas. Jardinalba puede confirmarte cuotas con bonificación, horarios y disponibilidad para el próximo curso.',
  updated_at = NOW()
WHERE slug = 'jardinalba-cordoba';

-- La Alegría  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'La Alegría es un centro de educación infantil privado situado en la calle Menéndez Pelayo, 3, en el código postal 14008 de Córdoba. Trabaja con el primer ciclo de Infantil y acoge a pequeños de 4 meses a 3 años.\n\nSu adhesión al Programa de Ayuda a las Familias de la Junta de Andalucía permite aplicar bonificaciones sobre el precio del servicio educativo conforme a la normativa. Como el resto de centros autorizados de primer ciclo, debe cumplir los requisitos de espacios, ratios y personal cualificado que marca la administración andaluza; los servicios propios de esta escuela no constan en el registro.\n\nAntes de decidirte, habla con La Alegría: te podrán detallar horario, período de adaptación, comedor y el resto de condiciones del curso.',
  updated_at = NOW()
WHERE slug = 'la-alegria-cordoba';

-- Los Peques  [privado, NO adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Los Peques se encuentra en los números 10-12 de la calle Ciudad de Moncada (14012, Córdoba). Es un centro privado de primer ciclo de Educación Infantil que atiende a niños desde los 4 meses hasta cumplir los 3 años.\n\nEl registro oficial de la Junta de Andalucía no lo recoge como adherido al Programa de Ayuda a las Familias, así que la matrícula, las cuotas y los servicios se acuerdan directamente con el centro. La fuente administrativa tampoco detalla prestaciones como comedor o ampliación horaria; es un dato que conviene pedir de primera mano.\n\nRecomendamos visitar Los Peques y confirmar con su equipo la información práctica: plazas libres, precios y organización del día a día.',
  updated_at = NOW()
WHERE slug = 'los-peques-cordoba';

-- Érase una vez II  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Érase una vez II ocupa el local 4 del edificio Alegranza, en la calle Isla Fuerteventura, 52 (14011, Córdoba). Es una escuela infantil privada de primer ciclo —de 4 meses a 3 años— y comparte nombre con Erase una vez III, también en la ciudad.\n\nEstá adherida al Programa de Ayuda a las Familias, por lo que el precio del servicio educativo puede bonificarse de acuerdo con la normativa de la Junta de Andalucía. El listado oficial no precisa los servicios de esta sede; cuestiones como la alimentación, el horario o la adaptación inicial deben tratarse con el centro.\n\nDatos recopilados de fuentes públicas. Para una foto completa y actualizada, lo más práctico es llamar o acercarse al centro.',
  updated_at = NOW()
WHERE slug = 'erase-una-vez-ii-cordoba';

-- Chiquitines  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Chiquitines atiende el primer ciclo de Educación Infantil en la calle Machaquito, 20 (código postal 14005 de Córdoba). Este centro privado recibe a bebés desde los 4 meses y acompaña a los niños hasta los 3 años. Muy cerca, en la misma calle, opera también Chiquitines Guay.\n\nFigura adherido al Programa de Ayuda a las Familias de la Junta de Andalucía, que bonifica el precio del servicio según la normativa vigente. Sus servicios concretos no aparecen en el registro consultado; en el primer ciclo, aspectos como las rutinas de sueño y comida o el período de adaptación se organizan de forma propia en cada centro, así que conviene conocerlos in situ.\n\nSi buscas plaza en la zona, pregunta en Chiquitines por horarios, cuotas bonificadas y disponibilidad del curso en marcha.',
  updated_at = NOW()
WHERE slug = 'chiquitines-cordoba';

-- Los Soletes  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Los Soletes es una escuela infantil privada del código postal 14011 de Córdoba, con sede en la calle Isla Formentera, 24. Su alumnado pertenece al primer ciclo de Educación Infantil: desde los 4 meses hasta los 3 años.\n\nConsta su adhesión al Programa de Ayuda a las Familias, lo que abre la puerta a bonificaciones del precio reguladas por la Junta de Andalucía; la solicitud se gestiona en el propio centro. Sobre servicios complementarios el registro no aporta información, de modo que comedor, horarios y actividades deben confirmarse con el equipo.\n\nFicha construida con datos públicos. Contacta con Los Soletes para resolver cualquier duda sobre plazas, tarifas o funcionamiento diario.',
  updated_at = NOW()
WHERE slug = 'los-soletes-cordoba';

-- Jardylandia  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'En la calle Platero Pedro Sánchez de Luque, dentro del código postal 14007 de Córdoba, Jardylandia desarrolla su labor como centro privado de educación infantil de primer ciclo, dirigido a niños de 4 meses a 3 años.\n\nAdherido al Programa de Ayuda a las Familias, ofrece a las familias la posibilidad de bonificar el precio del servicio educativo según la normativa de la Junta de Andalucía. El registro administrativo no describe sus servicios ni instalaciones; para valorar el centro conviene concertar una visita y verlo de primera mano.\n\nLos datos disponibles proceden de fuentes oficiales y pueden ampliarse hablando con el propio centro: horario, comedor, adaptación y cuotas.',
  updated_at = NOW()
WHERE slug = 'jardylandia-cordoba';

-- El Patito Colorín  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'El Patito Colorín se sitúa en la avenida de las Ollerías, 44 (14001, Córdoba). Es un centro de primer ciclo de Educación Infantil, de titularidad privada, que escolariza a pequeños de entre 4 meses y 3 años.\n\nSe encuentra adherido al Programa de Ayuda a las Familias de la Junta de Andalucía y, por tanto, sus plazas pueden beneficiarse de la bonificación del precio prevista en la normativa. Los servicios de la escuela —alimentación, horarios ampliados, patio u otros— no figuran en la fuente oficial y es mejor consultarlos directamente.\n\nAntes de matricular, acércate o llama a El Patito Colorín para conocer las condiciones del curso: plazas, cuotas resultantes y calendario.',
  updated_at = NOW()
WHERE slug = 'el-patito-colorin-cordoba';

-- Mickey  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Mickey es una escuela infantil privada instalada en la avenida Manolete, 3, junto a la plaza Los Azahares (14005, Córdoba). Atiende el tramo educativo de 0 a 3 años, admitiendo bebés a partir de los 4 meses.\n\nEstá adherida al Programa de Ayuda a las Familias, el programa de la Junta de Andalucía que bonifica el precio del servicio educativo con arreglo a la normativa vigente. Ningún servicio adicional aparece confirmado en el registro; la propia escuela es quien puede detallar comedor, horarios y actividades.\n\nLa información mostrada procede de fuentes públicas. Para datos de matrícula y disponibilidad real de plazas, contacta con Mickey directamente.',
  updated_at = NOW()
WHERE slug = 'mickey-cordoba';

-- Mi Granja II  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Mi Granja II ocupa el local E de la calle Atlántico, esquina con Isla Fuerteventura, en el 14011 de Córdoba. Es uno de los centros que operan bajo el nombre Mi Granja en la ciudad y atiende el primer ciclo de Educación Infantil, de 4 meses a 3 años.\n\nComo centro adherido al Programa de Ayuda a las Familias, permite tramitar las bonificaciones del precio del servicio educativo que regula la Junta de Andalucía. El registro oficial no concreta sus servicios; los detalles del día a día —comidas, siestas, adaptación— conviene conocerlos en una visita.\n\nFicha elaborada con datos administrativos públicos. El equipo de Mi Granja II puede confirmarte horario, cuotas y plazas del curso actual.',
  updated_at = NOW()
WHERE slug = 'mi-granja-ii-cordoba';

-- El Vial  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'En un local de la calle Francisco Rabal, 11 (14006, Córdoba), El Vial presta servicio como centro privado de educación infantil de primer ciclo para niños de entre 4 meses y 3 años.\n\nSu presencia en el registro de la Junta de Andalucía incluye la adhesión al Programa de Ayuda a las Familias, con la consiguiente bonificación del precio según la normativa. No hay servicios adicionales documentados en la fuente oficial; la escuela puede informar sobre comedor, horario ampliado o actividades al solicitar plaza.\n\nRecomendamos verificar cualquier dato práctico —tarifas, calendario, disponibilidad— hablando directamente con El Vial antes de tomar una decisión.',
  updated_at = NOW()
WHERE slug = 'el-vial-cordoba';

-- Cuenta Cuentos II  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Cuenta Cuentos II es un centro privado de primer ciclo de Educación Infantil situado en la calle María Auxiliadora, 5 (14002, Córdoba). Recibe a niños de 4 meses a 3 años y comparte denominación con otras dos escuelas de la ciudad, Cuenta Cuentos I y Cuenta Cuentos III.\n\nEstá adherido al Programa de Ayuda a las Familias, así que el precio del servicio educativo puede bonificarse según la normativa de la Junta de Andalucía, tramitándolo en el propio centro. El registro oficial no especifica los servicios de esta sede en particular.\n\nLos datos proceden de fuentes públicas; para confirmar horarios, comedor y plazas del curso, lo mejor es dirigirse directamente al centro.',
  updated_at = NOW()
WHERE slug = 'cuenta-cuentos-ii-cordoba';

-- Chocolate  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'La escuela infantil Chocolate tiene su sede en la calle López Amo, 4, código postal 14006 de Córdoba. De carácter privado, se ocupa del primer ciclo de Educación Infantil y acoge a pequeños desde los 4 meses hasta los 3 años.\n\nAparece en el registro andaluz como centro adherido al Programa de Ayuda a las Familias, cuya bonificación reduce el precio del servicio educativo conforme a la normativa vigente. En esta etapa cada escuela organiza a su manera la adaptación, las rutinas y la comunicación con las familias; el registro no recoge cómo lo hace este centro, así que merece la pena preguntarlo.\n\nFicha basada en información pública. Contacta con Chocolate para conocer sus instalaciones, servicios y condiciones de matrícula.',
  updated_at = NOW()
WHERE slug = 'chocolate-cordoba';

-- Los Compis  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Los Compis desarrolla su actividad en la calle Del Campo, s/n (14005, Córdoba), como centro privado de educación infantil de primer ciclo. Su alumnado va de los 4 meses a los 3 años.\n\nFigura adherido al Programa de Ayuda a las Familias de la Junta de Andalucía, lo que permite bonificar el precio del servicio según la normativa aplicable; la plaza se solicita directamente en el centro. Los servicios complementarios no constan en la fuente oficial consultada.\n\nSi te interesa esta zona, pregunta en Los Compis por su horario, la organización del día a día y las plazas disponibles antes de decidir.',
  updated_at = NOW()
WHERE slug = 'los-compis-cordoba';

-- Mi Granja III  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Tercero de los centros que llevan el nombre Mi Granja en Córdoba, Mi Granja III se encuentra en la calle Atlántico, esquina con Isla de Hierro (portal 1, local 5), en el código postal 14011. Atiende el primer ciclo de Educación Infantil, de 4 meses a 3 años.\n\nComo el resto de centros adheridos al Programa de Ayuda a las Familias, ofrece acceso a las bonificaciones del precio del servicio educativo previstas por la Junta de Andalucía. La fuente oficial no detalla los servicios de este local concreto; cada sede puede organizarse de forma distinta, por lo que conviene informarse en la propia escuela.\n\nDatos procedentes de registros públicos. El centro puede facilitarte la información práctica que falta: cuotas, horarios y disponibilidad.',
  updated_at = NOW()
WHERE slug = 'mi-granja-iii-cordoba';

-- Mimos II  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'En el local 1 de la avenida Carlos III, 45 (14014, Córdoba) se ubica Mimos II, escuela infantil privada de primer ciclo para niños de entre 4 meses y 3 años. En la ciudad funciona también el centro Mimos, con el que comparte nombre.\n\nSu adhesión al Programa de Ayuda a las Familias de la Junta de Andalucía posibilita la bonificación del precio del servicio con arreglo a la normativa. Sobre comedor, horarios o actividades no hay constancia en el registro; son cuestiones que la escuela resuelve de primera mano.\n\nTe animamos a contactar con Mimos II para confirmar plazas, tarifas tras bonificación y el funcionamiento diario del centro.',
  updated_at = NOW()
WHERE slug = 'mimos-ii-cordoba';

-- Piratas  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Piratas es un centro de educación infantil privado del código postal 14002 de Córdoba, en la calle Conde de Cárdenas, 16. Se dedica al primer ciclo, la etapa comprendida entre los 4 meses y los 3 años.\n\nEl registro de la Junta de Andalucía lo recoge como adherido al Programa de Ayuda a las Familias, que bonifica el precio del servicio educativo según la normativa vigente. Al margen de esa adhesión, la fuente no describe servicios adicionales de la escuela.\n\nComo los datos proceden de listados públicos, recomendamos confirmar con Piratas cualquier detalle importante: horario, comedor, adaptación y cuotas.',
  updated_at = NOW()
WHERE slug = 'piratas-cordoba';

-- El Jardincito II  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'El Jardincito II se encuentra en la avenida de Cádiz, 64 (14013, Córdoba). Este centro privado de primer ciclo atiende a niños de 4 meses a 3 años y comparte nombre con El Jardincito y Jardincito III, también en la ciudad.\n\nEstá adherido al Programa de Ayuda a las Familias de la Junta de Andalucía, por lo que el precio del servicio educativo admite bonificación según la normativa. Sus servicios concretos no aparecen en el registro consultado; la avenida de Cádiz concentra, de hecho, varias escuelas infantiles y comparar visitándolas puede ser útil.\n\nLa ficha se nutre de fuentes públicas. Para plazas, cuotas y horarios de El Jardincito II, contacta directamente con el centro.',
  updated_at = NOW()
WHERE slug = 'el-jardincito-ii-cordoba';

-- Burbujas  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'En la avenida de Cádiz, 66 (14013) abre Burbujas, escuela infantil privada cordobesa dedicada al primer ciclo de Educación Infantil: admite bebés desde los 4 meses y acompaña a los niños hasta los 3 años.\n\nConsta como centro adherido al Programa de Ayuda a las Familias, el sistema de bonificación del precio regulado por la Junta de Andalucía; la solicitud de plaza se realiza en el propio centro. El registro oficial no informa de servicios complementarios como comedor o aula matinal.\n\nRecomendamos llamar a Burbujas para verificar la oferta real de servicios, las plazas libres y las condiciones económicas del curso.',
  updated_at = NOW()
WHERE slug = 'burbujas-cordoba';

-- El Arbolito  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'El Arbolito es un centro privado de educación infantil de primer ciclo con domicilio en la avenida de la Pedanía, 212, en el código postal 14710 del término municipal de Córdoba. Escolariza a niños de entre 4 meses y 3 años.\n\nFigura adherido al Programa de Ayuda a las Familias de la Junta de Andalucía, de modo que las familias pueden acogerse a la bonificación del precio del servicio según la normativa vigente. La fuente administrativa no aporta información sobre sus servicios o instalaciones.\n\nAntes de solicitar plaza, conviene ponerse en contacto con El Arbolito para conocer horario, comedor, período de adaptación y cuotas actualizadas.',
  updated_at = NOW()
WHERE slug = 'el-arbolito-cordoba';

-- Goofy  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Goofy atiende a niños de 4 meses a 3 años en la avenida Agrupación Córdoba, 20 (14014). Es una escuela infantil privada incluida en el registro de centros de primer ciclo de la Junta de Andalucía.\n\nSu adhesión al Programa de Ayuda a las Familias permite bonificar el precio del servicio educativo conforme a la normativa. Más allá de este dato, el listado oficial no concreta servicios: la organización del comedor, el horario y las actividades dependen de cada centro y se consultan directamente.\n\nLos datos mostrados tienen origen en fuentes públicas y pueden estar incompletos; el equipo de Goofy puede ofrecerte la información al día.',
  updated_at = NOW()
WHERE slug = 'goofy-cordoba';

-- Supli Levante  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Supli Levante ocupa el local 7 de la calle Poeta Blanco Criado, 10, en el código postal 14007 de Córdoba. Comparte nombre con Supli y Supli Levante II, también presentes en la ciudad, y trabaja con el primer ciclo de Educación Infantil (4 meses a 3 años).\n\nEstá adherido al Programa de Ayuda a las Familias, con la bonificación del precio del servicio educativo que regula la Junta de Andalucía. Los servicios de esta sede no constan en el registro oficial consultado; cada centro gestiona su propia matrícula y organización.\n\nFicha elaborada a partir de datos públicos. Contacta con Supli Levante para confirmar horarios, alimentación, plazas y tarifas.',
  updated_at = NOW()
WHERE slug = 'supli-levante-cordoba';

-- Tréboles  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'En los locales 45 y 50 del pasaje Sagrada Familia (14011, Córdoba) presta servicio Tréboles, un centro privado de primer ciclo de Educación Infantil para pequeños de 4 meses a 3 años.\n\nAparece adherido al Programa de Ayuda a las Familias de la Junta de Andalucía, cuya bonificación se aplica sobre el precio del servicio según la normativa vigente. La fuente oficial no describe los servicios del centro; en el primer ciclo, detalles como la comida, la siesta o la adaptación inicial marcan la diferencia y conviene conocerlos en persona.\n\nRecomendamos concertar una visita con Tréboles para ver las instalaciones y aclarar cuotas, horario y disponibilidad de plaza.',
  updated_at = NOW()
WHERE slug = 'treboles-cordoba';

-- Luna Lunera  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Luna Lunera es una escuela infantil privada situada en el local 2 de la calle Corto Maltés, 8 (14004, Córdoba). Atiende el primer ciclo de Educación Infantil, desde los 4 meses hasta los 3 años.\n\nEl registro de la Junta de Andalucía la incluye entre los centros adheridos al Programa de Ayuda a las Familias, lo que da acceso a bonificaciones del precio conforme a la normativa. No constan en esa fuente servicios adicionales de la escuela.\n\nPara completar la información de esta ficha —horarios, comedor, plazas, tarifas—, lo más directo es hablar con el propio centro.',
  updated_at = NOW()
WHERE slug = 'luna-lunera-cordoba';

-- Parvulario Fátima  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Parvulario Fátima escolariza el primer ciclo de Educación Infantil en la calle Escritor Julio Cortázar, 2 (14014, Córdoba). Es un centro de titularidad privada que recibe a niños de entre 4 meses y 3 años.\n\nSe encuentra adherido al Programa de Ayuda a las Familias, el programa de la Junta de Andalucía que bonifica el precio del servicio educativo según la normativa en vigor; la plaza se tramita en el propio centro. Sus servicios concretos no figuran en el registro consultado.\n\nLos datos proceden de fuentes públicas. Si valoras este centro, pregunta directamente por su proyecto, sus horarios y las cuotas resultantes.',
  updated_at = NOW()
WHERE slug = 'parvulario-fatima-cordoba';

-- El Puzzle II  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'El Puzzle II comparte nombre con la escuela El Puzzle, también en Córdoba. Tiene acceso por la calle Ronda de la Manca, 6 y la calle Murcia, 8 (14010) y, como centro privado de primer ciclo, atiende a niños de 4 meses a 3 años.\n\nEstá adherido al Programa de Ayuda a las Familias, de manera que el precio del servicio educativo puede bonificarse según la normativa de la Junta de Andalucía. El registro no detalla los servicios de esta sede; su equipo puede explicar cómo organizan la jornada, la alimentación y la adaptación.\n\nFicha construida con información pública. Confirma con El Puzzle II las plazas del curso, el horario y las condiciones económicas.',
  updated_at = NOW()
WHERE slug = 'el-puzzle-ii-cordoba';

-- Chiquitines Guay  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'En el bajo del número 26 de la calle Machaquito (14005, Córdoba) se encuentra Chiquitines Guay, centro privado de educación infantil de primer ciclo para edades de 4 meses a 3 años. A pocos portales, en la misma calle, funciona también Chiquitines.\n\nFigura adherido al Programa de Ayuda a las Familias de la Junta de Andalucía, que permite bonificar el precio del servicio conforme a la normativa vigente. Los servicios complementarios de la escuela no constan en la fuente oficial.\n\nAntes de matricular, recomendamos contactar con Chiquitines Guay y, si es posible, visitar el centro para conocer su día a día y sus cuotas.',
  updated_at = NOW()
WHERE slug = 'chiquitines-guay-cordoba';

-- Dumbi  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Dumbi tiene su sede en la avenida de los Almogávares, 45 (14006, Córdoba). Es una escuela infantil privada de primer ciclo —de 4 meses a 3 años— y en la ciudad existe un segundo centro homónimo, Dumbi II.\n\nSu adhesión al Programa de Ayuda a las Familias hace posible la bonificación del precio del servicio educativo que regula la Junta de Andalucía. En el registro oficial no aparecen servicios detallados de este centro; la información sobre comedor, horario y actividades la facilita la propia escuela.\n\nDatos obtenidos de fuentes públicas. Llama a Dumbi para resolver dudas concretas sobre plazas, calendario y tarifas.',
  updated_at = NOW()
WHERE slug = 'dumbi-cordoba';

-- La Cometa  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'La Cometa es un centro privado de primer ciclo de Educación Infantil situado en la calle Francisco Azorín Izquierdo, 1, dentro del código postal 14011 de Córdoba. Su alumnado tiene entre 4 meses y 3 años.\n\nConsta adherido al Programa de Ayuda a las Familias, por lo que las familias pueden solicitar la bonificación del precio prevista por la Junta de Andalucía, gestionando la plaza en el propio centro. La fuente oficial no incluye información sobre sus servicios.\n\nTe sugerimos preguntar en La Cometa por horario, alimentación, período de adaptación y cuotas antes de tomar una decisión.',
  updated_at = NOW()
WHERE slug = 'la-cometa-cordoba';

-- Los Girasoles  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'En la calle Isla del Hierro, 14, esquina con Isla Madeíra (14011, Córdoba), Los Girasoles ejerce como escuela infantil privada de primer ciclo, con niños desde los 4 meses hasta los 3 años.\n\nEstá adherida al Programa de Ayuda a las Familias de la Junta de Andalucía, cuyo sistema de bonificaciones reduce el precio del servicio educativo según la normativa. No hay servicios adicionales documentados en el registro consultado.\n\nLa información de esta ficha procede de fuentes públicas; el propio centro puede completarla con datos de matrícula, horarios y plazas.',
  updated_at = NOW()
WHERE slug = 'los-girasoles-cordoba';

-- Acuarelas  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Acuarelas se localiza en la calle Estocolmo, 38, dentro del polígono Tecno-Córdoba (14014), una ubicación que puede resultar práctica para familias que trabajan en la zona. Es un centro privado de educación infantil de primer ciclo, de 4 meses a 3 años.\n\nAparece adherido al Programa de Ayuda a las Familias, con la consiguiente posibilidad de bonificar el precio del servicio educativo según la normativa de la Junta de Andalucía. El registro no concreta servicios como comedor o ampliación de horario.\n\nRecomendamos contactar con Acuarelas para confirmar su horario —especialmente si buscas conciliar—, las cuotas y la disponibilidad de plaza.',
  updated_at = NOW()
WHERE slug = 'acuarelas-cordoba';

-- Pasitos  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Pasitos da la bienvenida a bebés desde los 4 meses y a niños hasta los 3 años en la calle Marte, 11 (14014, Córdoba), donde funciona como escuela infantil privada de primer ciclo.\n\nSu inclusión en el registro de la Junta de Andalucía como centro adherido al Programa de Ayuda a las Familias implica que el precio del servicio puede bonificarse conforme a la normativa vigente. Los servicios propios del centro no aparecen recogidos en esa fuente.\n\nAntes de decidir, habla con Pasitos: podrán detallarte la organización del día a día, el calendario y las condiciones económicas.',
  updated_at = NOW()
WHERE slug = 'pasitos-cordoba';

-- Tom Sawyer  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Tom Sawyer atiende el primer ciclo de Educación Infantil en la avenida del Aeropuerto, 39 (14004, Córdoba). Es un centro de titularidad privada que acoge a pequeños de entre 4 meses y 3 años.\n\nFigura adherido al Programa de Ayuda a las Familias de la Junta de Andalucía, lo que abre la posibilidad de bonificar el precio del servicio educativo según la normativa; la solicitud de plaza se hace en el propio centro. Sobre comedor, horarios o actividades la fuente oficial no aporta datos.\n\nFicha basada en registros públicos. Para información actualizada de plazas y cuotas, contacta directamente con Tom Sawyer.',
  updated_at = NOW()
WHERE slug = 'tom-sawyer-cordoba';

-- Pequeños exploradores  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'En el local 2 de la calle Periodista Quesada Chacón, 2 (14005, Córdoba) desarrolla su actividad Pequeños exploradores, centro privado de primer ciclo para niños de 4 meses a 3 años. En la misma calle opera también la escuela Tutuá.\n\nEstá adherido al Programa de Ayuda a las Familias, que bonifica el precio del servicio educativo con arreglo a la normativa de la Junta de Andalucía. El registro oficial no detalla los servicios de la escuela.\n\nComo siempre que los datos proceden de fuentes administrativas, conviene contrastarlos: pregunta en Pequeños exploradores por horario, comedor y plazas libres.',
  updated_at = NOW()
WHERE slug = 'pequenos-exploradores-cordoba';

-- Erase una vez III  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Erase una vez III se sitúa en la calle Santa Eufemia, s/n, esquina con Acera Fuente de la Salud (14006, Córdoba). Este centro privado de educación infantil de primer ciclo —relacionado por nombre con Érase una vez II— atiende de los 4 meses a los 3 años.\n\nSu adhesión al Programa de Ayuda a las Familias de la Junta de Andalucía permite aplicar bonificaciones sobre el precio del servicio según la normativa vigente. No constan servicios adicionales en el listado oficial consultado.\n\nLos datos pueden quedar incompletos; el equipo del centro puede confirmarte servicios reales, horarios y condiciones de matrícula.',
  updated_at = NOW()
WHERE slug = 'erase-una-vez-iii-cordoba';

-- El Duende Travieso  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'El Duende Travieso es una escuela infantil privada con entrada por la calle Alfonso X El Sabio, 50, esquina con la calle Esperanza (14001, Córdoba). Trabaja con el primer ciclo de Educación Infantil, de 4 meses a 3 años.\n\nConsta como centro adherido al Programa de Ayuda a las Familias, cuya bonificación abarata el precio del servicio educativo conforme a la normativa de la Junta de Andalucía. Sus servicios concretos no figuran en el registro; es la propia escuela quien puede detallar comedor, horario y actividades.\n\nRecomendamos una llamada o visita a El Duende Travieso para confirmar la información práctica del curso: plazas, cuotas y calendario.',
  updated_at = NOW()
WHERE slug = 'el-duende-travieso-cordoba';

-- Melodías  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Melodías acoge a niños de 4 meses a 3 años en la calle Fernando Camacho, 46 (14014, Córdoba), como centro privado de educación infantil de primer ciclo.\n\nAparece en el registro de la Junta de Andalucía adherido al Programa de Ayuda a las Familias, que bonifica el precio del servicio educativo según la normativa vigente. Al tratarse de un listado administrativo, no incluye detalles de funcionamiento: comedor, aula matinal o actividades deben consultarse con el centro.\n\nAntes de solicitar plaza conviene verificar los datos con Melodías; su equipo puede informarte de horarios, cuotas y disponibilidad.',
  updated_at = NOW()
WHERE slug = 'melodias-cordoba';

-- DO RE MI  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'DO RE MI es un centro privado de primer ciclo de Educación Infantil en la calle Rubí, 3 (14014, Córdoba), que escolariza a pequeños desde los 4 meses hasta los 3 años. En la ciudad opera también Do Re Mi II, con el que comparte nombre.\n\nEstá adherido al Programa de Ayuda a las Familias, de modo que las familias pueden acceder a la bonificación del precio regulada por la Junta de Andalucía tramitando la plaza en el propio centro. El registro no aporta información sobre servicios complementarios.\n\nDatos recopilados de fuentes públicas. Contacta con DO RE MI para conocer sus instalaciones, horario y condiciones del curso.',
  updated_at = NOW()
WHERE slug = 'do-re-mi-cordoba';

-- San Cayetano  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'San Cayetano presta servicio en la calle Alonso El Sabio, 16 (14001, Córdoba), como escuela infantil privada de primer ciclo para niños de entre 4 meses y 3 años. Dos portales más allá, en el número 18, se encuentra San Cayetano II.\n\nFigura adherido al Programa de Ayuda a las Familias de la Junta de Andalucía, con la bonificación del precio del servicio educativo que marca la normativa. La fuente oficial no detalla los servicios propios de esta sede.\n\nLa ficha procede de registros públicos; recomendamos confirmar con San Cayetano el horario, la oferta de comedor y las plazas disponibles.',
  updated_at = NOW()
WHERE slug = 'san-cayetano-cordoba';

-- Mimos  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'En la calle Blas Infante, 4 (14014, Córdoba) abre sus puertas Mimos, centro privado de educación infantil que atiende el primer ciclo, desde los 4 meses hasta los 3 años. En la avenida Carlos III se encuentra también Mimos II, que comparte nombre con esta escuela.\n\nSu adhesión al Programa de Ayuda a las Familias permite bonificar el precio del servicio educativo según la normativa de la Junta de Andalucía. Los servicios concretos del centro no constan en el registro oficial.\n\nPara saber cómo organizan la adaptación, la alimentación o el horario, y qué cuotas resultan tras la bonificación, contacta con Mimos directamente.',
  updated_at = NOW()
WHERE slug = 'mimos-cordoba';

-- Jesús Salvador  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Jesús Salvador es un centro de educación infantil de primer ciclo, de titularidad privada, con domicilio en la calle Levante, s/n (14007, Córdoba). Recibe a niños de 4 meses a 3 años.\n\nEstá adherido al Programa de Ayuda a las Familias, el mecanismo de la Junta de Andalucía que bonifica el precio del servicio educativo conforme a la normativa vigente. En el registro consultado no aparecen servicios adicionales confirmados de esta escuela.\n\nRecomendamos ponerse en contacto con Jesús Salvador para preguntar por plazas, horario y condiciones económicas antes de matricular.',
  updated_at = NOW()
WHERE slug = 'jesus-salvador-cordoba';

-- Cuenta Cuentos I  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Cuenta Cuentos I atiende el primer ciclo de Educación Infantil en la plaza El Moreal, 1 (14010, Córdoba). Es el primero de los tres centros que llevan este nombre en la ciudad y acoge a niños de 4 meses a 3 años.\n\nComo centro adherido al Programa de Ayuda a las Familias, ofrece la posibilidad de bonificar el precio del servicio educativo según la normativa de la Junta de Andalucía; la solicitud se presenta en el propio centro. Sus servicios no están detallados en la fuente oficial.\n\nLos datos de esta página tienen origen administrativo. El centro puede completarlos con la información práctica de cada curso: cuotas, horarios y plazas.',
  updated_at = NOW()
WHERE slug = 'cuenta-cuentos-i-cordoba';

-- Fantasía  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Fantasía es una escuela infantil privada de la calle El Avellano, 6 (14006, Córdoba), centrada en el primer ciclo de Educación Infantil: desde bebés de 4 meses hasta niños de 3 años.\n\nConsta su adhesión al Programa de Ayuda a las Familias de la Junta de Andalucía, que permite bonificaciones del precio del servicio conforme a la normativa. Como en la mayoría de fichas de origen administrativo, no hay servicios concretos documentados.\n\nSi estás valorando Fantasía, lo más útil es concertar una visita y preguntar por horario, comedor, período de adaptación y tarifas.',
  updated_at = NOW()
WHERE slug = 'fantasia-cordoba';

-- Mundo de Peques  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Mundo de Peques ocupa un local de la calle San Acisclo, 20, en el código postal 14007 de Córdoba. Este centro privado escolariza el primer ciclo de Educación Infantil, de los 4 meses a los 3 años.\n\nFigura adherido al Programa de Ayuda a las Familias, así que las familias pueden solicitar la bonificación del precio del servicio educativo prevista por la Junta de Andalucía. El registro oficial consultado no informa sobre sus servicios complementarios.\n\nAntes de formalizar la matrícula, contrasta con Mundo de Peques los datos que necesites: plazas, horario y cuotas con bonificación aplicada.',
  updated_at = NOW()
WHERE slug = 'mundo-de-peques-cordoba';

-- Pompitas  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'En los locales 2 y 3 de la avenida de Cádiz, 66 (14013, Córdoba) se encuentra Pompitas, centro privado de educación infantil de primer ciclo para pequeños de 4 meses a 3 años. La misma avenida reúne otras escuelas infantiles, como Burbujas o El Jardincito II.\n\nEstá adherido al Programa de Ayuda a las Familias de la Junta de Andalucía, cuya bonificación se aplica al precio del servicio según la normativa vigente. No constan servicios detallados en el registro.\n\nComparar varias opciones de la zona visitándolas puede ayudarte a decidir; en Pompitas podrán informarte de su proyecto, horario y plazas.',
  updated_at = NOW()
WHERE slug = 'pompitas-cordoba';

-- Ratón Pérez  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Ratón Pérez es un centro privado de primer ciclo de Educación Infantil situado en la calle Historiador Jaén Morente, 18 (14014, Córdoba). Atiende a niños desde los 4 meses hasta los 3 años.\n\nAparece adherido al Programa de Ayuda a las Familias, con acceso a las bonificaciones del precio del servicio educativo que regula la Junta de Andalucía. La fuente oficial no describe los servicios del centro; el detalle del día a día se conoce mejor en una visita.\n\nRecomendamos contactar con Ratón Pérez para confirmar horarios, alimentación y disponibilidad de plaza en el curso actual.',
  updated_at = NOW()
WHERE slug = 'raton-perez-cordoba';

-- Supli Levante II  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Supli Levante II comparte nombre con Supli y Supli Levante, también presentes en Córdoba. Se ubica en el local comercial 9 del pasaje Pintor Matisse (14007) y atiende el primer ciclo de Educación Infantil, de 4 meses a 3 años.\n\nComo centro adherido al Programa de Ayuda a las Familias, da acceso a la bonificación del precio del servicio educativo según la normativa de la Junta de Andalucía. Sus servicios concretos no figuran en el registro consultado.\n\nFicha elaborada con datos públicos; el equipo del centro puede facilitarte la información de matrícula, horarios y cuotas.',
  updated_at = NOW()
WHERE slug = 'supli-levante-ii-cordoba';

-- Babis  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Babis desarrolla su labor educativa en un local de la avenida Virgen de los Dolores, 1-3 (14004, Córdoba). Es una escuela infantil privada de primer ciclo que acoge a niños de entre 4 meses y 3 años.\n\nSu presencia en el registro de la Junta de Andalucía incluye la adhesión al Programa de Ayuda a las Familias, que bonifica el precio del servicio conforme a la normativa vigente. Sobre comedor, horarios ampliados u otras prestaciones no hay constancia oficial.\n\nPara resolver esas dudas y conocer las plazas disponibles, lo más rápido es llamar a Babis o acercarse al centro.',
  updated_at = NOW()
WHERE slug = 'babis-cordoba';

-- Center Baby  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Center Baby es un centro privado de educación infantil situado en la calle Joaquín Sama Naharro, 2, esquina con Doña Berenguela (14006, Córdoba). Se dedica al primer ciclo, con alumnado de 4 meses a 3 años.\n\nEstá adherido al Programa de Ayuda a las Familias de la Junta de Andalucía, lo que permite a las familias bonificar el precio del servicio educativo según la normativa; la plaza se tramita en el propio centro. Los servicios complementarios no aparecen en el listado oficial.\n\nComo la información procede de registros públicos, conviene confirmarla con Center Baby antes de decidir: horario, comedor y condiciones económicas.',
  updated_at = NOW()
WHERE slug = 'center-baby-cordoba';

-- Manolo Álvaro II  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'En la calle Escritor Rafael Pavón, 6 (14007, Córdoba) se sitúa Manolo Álvaro II, escuela infantil privada de primer ciclo para niños de 4 meses a 3 años. Unos números más abajo, en el 2 de la misma calle, funciona Manolo Alvaro I.\n\nFigura adherido al Programa de Ayuda a las Familias, que abre la puerta a bonificaciones del precio del servicio educativo con arreglo a la normativa de la Junta de Andalucía. El registro no recoge servicios concretos de esta sede.\n\nRecomendamos hablar con Manolo Álvaro II para confirmar su horario, la oferta de comedor y las plazas del curso en marcha.',
  updated_at = NOW()
WHERE slug = 'manolo-alvaro-ii-cordoba';

-- Manolo Alvaro I  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Manolo Alvaro I ocupa un local en la calle Escritor Rafael Pavón, 2 (14007, Córdoba), a pocos metros de Manolo Álvaro II, con el que comparte nombre. Atiende el primer ciclo de Educación Infantil, desde los 4 meses hasta los 3 años.\n\nSu adhesión al Programa de Ayuda a las Familias de la Junta de Andalucía posibilita la bonificación del precio del servicio educativo según la normativa vigente. La fuente oficial consultada no detalla servicios adicionales.\n\nDatos procedentes de registros públicos; para información actualizada sobre plazas, horarios y cuotas, contacta con el centro.',
  updated_at = NOW()
WHERE slug = 'manolo-alvaro-i-cordoba';

-- Arco Iris  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Arco Iris es una escuela infantil privada del código postal 14014 de Córdoba, en la calle Escritor Aguayo Godoy, 2. Su actividad se concentra en el primer ciclo de Educación Infantil, de 4 meses a 3 años.\n\nConsta como centro adherido al Programa de Ayuda a las Familias, cuya bonificación reduce el precio del servicio educativo según la normativa de la Junta de Andalucía. En el registro no figuran servicios complementarios confirmados.\n\nSi te interesa Arco Iris, pregunta directamente por el horario, la alimentación, el período de adaptación y las tarifas del curso.',
  updated_at = NOW()
WHERE slug = 'arco-iris-cordoba';

-- Globaluna  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Globaluna atiende a niños de entre 4 meses y 3 años en la calle Acera del Arrecife, 5 (14009, Córdoba), como centro privado de educación infantil de primer ciclo.\n\nEstá adherido al Programa de Ayuda a las Familias de la Junta de Andalucía, de modo que el precio del servicio puede bonificarse conforme a la normativa; la solicitud de plaza se gestiona en el propio centro. Sus servicios no constan en la fuente oficial.\n\nFicha basada en datos públicos, que pueden quedarse incompletos. El equipo de Globaluna puede detallarte su funcionamiento y sus cuotas.',
  updated_at = NOW()
WHERE slug = 'globaluna-cordoba';

-- Happy Children 1  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Happy Children 1 se encuentra en el local 6-1 de la calle Isla de Tabarca, 4 (14011, Córdoba). Este centro privado de primer ciclo de Educación Infantil escolariza a pequeños desde los 4 meses hasta los 3 años.\n\nAparece en el registro andaluz como adherido al Programa de Ayuda a las Familias, que bonifica el precio del servicio educativo según la normativa vigente. Los servicios propios del centro no están documentados en esa fuente.\n\nAntes de decidirte, contacta con Happy Children 1 para conocer su proyecto educativo, los horarios y la disponibilidad de plaza.',
  updated_at = NOW()
WHERE slug = 'happy-children-1-cordoba';

-- Mis pequeños muñecos  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'En la confluencia de las calles Gonzalo Ximénez de Quesada, 9, y Virrey Caballero Góngora (14004, Córdoba) presta servicio Mis pequeños muñecos, escuela infantil privada dedicada al primer ciclo, de 4 meses a 3 años.\n\nFigura adherida al Programa de Ayuda a las Familias, lo que permite aplicar la bonificación del precio del servicio educativo regulada por la Junta de Andalucía. El listado oficial no incluye detalle de servicios.\n\nLos datos mostrados proceden de fuentes públicas; recomendamos confirmarlos con el centro, que podrá informarte también de plazas y cuotas.',
  updated_at = NOW()
WHERE slug = 'mis-pequenos-munecos-cordoba';

-- El Bosque  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'El Bosque es un centro privado de educación infantil instalado en el local 3 de la avenida Cruz de Juárez, 2 (14006, Córdoba). Atiende el primer ciclo, con niños de entre 4 meses y 3 años.\n\nSu adhesión al Programa de Ayuda a las Familias de la Junta de Andalucía da acceso a bonificaciones del precio del servicio conforme a la normativa vigente. No hay servicios adicionales recogidos en el registro consultado.\n\nPara conocer el día a día del centro —rutinas, comedor, horario— y las condiciones de matrícula, lo mejor es dirigirse a El Bosque.',
  updated_at = NOW()
WHERE slug = 'el-bosque-cordoba';

-- Dumbi II  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Dumbi II, segundo centro que lleva el nombre Dumbi en Córdoba, ocupa los locales 3 y 4 de la calle Isla Alegranza, s/n (14008). Es un centro privado de primer ciclo de Educación Infantil para edades de 4 meses a 3 años.\n\nEstá adherido al Programa de Ayuda a las Familias, que bonifica el precio del servicio educativo según la normativa de la Junta de Andalucía; la plaza se solicita directamente en el centro. Sus servicios concretos no constan en la fuente oficial.\n\nFicha elaborada con información administrativa pública. Contacta con Dumbi II para confirmar horarios, servicios reales y disponibilidad.',
  updated_at = NOW()
WHERE slug = 'dumbi-ii-cordoba';

-- Chuitos  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Chuitos es una escuela infantil privada situada en el local 4 de la calle Soprano María Callas (14012, Córdoba). Trabaja con el primer ciclo de Educación Infantil y admite a niños desde los 4 meses hasta los 3 años.\n\nConsta adherida al Programa de Ayuda a las Familias de la Junta de Andalucía, con la posibilidad de bonificar el precio del servicio conforme a la normativa. El registro oficial no aporta información sobre comedor, horarios u otros servicios.\n\nRecomendamos llamar a Chuitos o visitarlo para completar los datos de esta ficha con la información del curso actual.',
  updated_at = NOW()
WHERE slug = 'chuitos-cordoba';

-- El Arenal  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'En la Cuesta de la Pólvora, 22 (14010, Córdoba) se encuentra El Arenal, centro privado de educación infantil de primer ciclo que acoge a pequeños de 4 meses a 3 años.\n\nAparece adherido al Programa de Ayuda a las Familias, el programa de la Junta de Andalucía que bonifica el precio del servicio educativo según la normativa vigente. La fuente consultada no concreta los servicios de la escuela.\n\nAntes de solicitar plaza, contrasta con El Arenal los detalles prácticos: horario, alimentación, adaptación y cuota resultante.',
  updated_at = NOW()
WHERE slug = 'el-arenal-cordoba';

-- Los Duendecillos  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'La carretera Madrid-Cádiz, 130 (código postal 14610, dentro del término municipal de Córdoba) es la dirección de Los Duendecillos, una escuela infantil privada que escolariza el primer ciclo: niños de entre 4 meses y 3 años.\n\nFigura adherido al Programa de Ayuda a las Familias de la Junta de Andalucía, cuyo sistema de bonificación abarata el precio del servicio educativo según la normativa. No constan servicios adicionales en el registro oficial.\n\nLos datos proceden de fuentes públicas. Para confirmar plazas, horario y condiciones económicas, contacta con Los Duendecillos.',
  updated_at = NOW()
WHERE slug = 'los-duendecillos-cordoba';

-- La Casa del Árbol  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'La Casa del Árbol presta servicio en la calle Escritor Fernández Franco, esquina con Escritor Cortés Ruano (14007, Córdoba). Es una escuela infantil privada centrada en el primer ciclo, de los 4 meses a los 3 años.\n\nEstá adherida al Programa de Ayuda a las Familias, así que las familias pueden acogerse a la bonificación del precio del servicio educativo prevista por la Junta de Andalucía. En el registro no aparecen detallados sus servicios.\n\nTe sugerimos concertar una visita con La Casa del Árbol para conocer sus espacios y aclarar horario, comedor y cuotas.',
  updated_at = NOW()
WHERE slug = 'la-casa-del-arbol-cordoba';

-- La Tribu  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'La Tribu ocupa un local de la avenida Barcelona, 9 (14010, Córdoba). Este centro privado de educación infantil de primer ciclo recibe a niños desde los 4 meses hasta los 3 años.\n\nSu adhesión al Programa de Ayuda a las Familias de la Junta de Andalucía permite bonificar el precio del servicio educativo con arreglo a la normativa vigente; la solicitud de plaza se realiza en el propio centro. Los servicios concretos no figuran en la fuente oficial.\n\nFicha construida a partir de datos públicos. La Tribu puede completarla con su horario, su oferta de servicios y las plazas del curso.',
  updated_at = NOW()
WHERE slug = 'la-tribu-cordoba';

-- Isla Fantasía  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'En el local 6 del edificio Santa Isabel, en la calle Isla Alegranza (14011, Córdoba), abre Isla Fantasía, escuela infantil privada de primer ciclo para niños de 4 meses a 3 años.\n\nConsta como centro adherido al Programa de Ayuda a las Familias, que bonifica el precio del servicio educativo según la normativa de la Junta de Andalucía. Sobre sus servicios complementarios el registro no ofrece información.\n\nRecomendamos preguntar en Isla Fantasía por el horario, la alimentación y las cuotas antes de tomar una decisión de matrícula.',
  updated_at = NOW()
WHERE slug = 'isla-fantasia-cordoba';

-- Mi Casita  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Mi Casita es un centro privado de primer ciclo de Educación Infantil situado en los locales 16-17 de la carretera Trassierra, 41 (14011, Córdoba). Su alumnado tiene entre 4 meses y 3 años.\n\nAparece adherido al Programa de Ayuda a las Familias de la Junta de Andalucía, lo que posibilita bonificaciones sobre el precio del servicio conforme a la normativa. El registro consultado no detalla servicios como comedor o aula matinal.\n\nComo los datos tienen origen administrativo, conviene confirmarlos con Mi Casita, que además podrá informarte de plazas y tarifas.',
  updated_at = NOW()
WHERE slug = 'mi-casita-cordoba';

-- Tutuá  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Tutuá se encuentra en la calle Periodista Quesada Chacón, 1, esquina con Escritora Dulcenombre Chacón (14005, Córdoba), donde ejerce como escuela infantil privada de primer ciclo, de 4 meses a 3 años.\n\nEstá adherida al Programa de Ayuda a las Familias, con la bonificación del precio del servicio educativo que regula la Junta de Andalucía. Ningún servicio adicional consta en la fuente oficial; el equipo del centro es quien mejor puede describir su día a día.\n\nAntes de decidir, llama a Tutuá o visita el centro para conocer sus espacios, su horario y las condiciones del curso.',
  updated_at = NOW()
WHERE slug = 'tutua-cordoba';

-- Cuenta Cuentos III  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Cuenta Cuentos III cierra la terna de centros con este nombre en Córdoba. Se sitúa en la calle Jesús del Calvario, 3 (14002) y atiende el primer ciclo de Educación Infantil, desde los 4 meses hasta los 3 años.\n\nComo centro privado adherido al Programa de Ayuda a las Familias, permite tramitar la bonificación del precio del servicio educativo prevista por la Junta de Andalucía. Sus servicios propios no aparecen en el registro.\n\nLos datos de esta ficha son de origen público; el centro puede confirmarte horario, comedor, plazas y cuotas actualizadas.',
  updated_at = NOW()
WHERE slug = 'cuenta-cuentos-iii-cordoba';

-- Santa Victoria 1  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Santa Victoria 1 es un centro de educación infantil privado de la calle Téllez de Meneses, s/n (14012, Córdoba), dedicado al primer ciclo: bebés desde los 4 meses y niños hasta los 3 años.\n\nFigura adherido al Programa de Ayuda a las Familias de la Junta de Andalucía, que bonifica el precio del servicio educativo según la normativa vigente; la plaza se solicita en el propio centro. La fuente oficial no recoge servicios complementarios.\n\nRecomendamos contactar con Santa Victoria 1 para verificar la información y preguntar por horarios, alimentación y disponibilidad.',
  updated_at = NOW()
WHERE slug = 'santa-victoria-1-cordoba';

-- Jesús Divino Obrero  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'En el pasaje Cristo del Amor, s/n (14009, Córdoba) desarrolla su actividad Jesús Divino Obrero, centro privado de primer ciclo de Educación Infantil para pequeños de entre 4 meses y 3 años.\n\nEstá adherido al Programa de Ayuda a las Familias, de manera que las familias pueden beneficiarse de la bonificación del precio del servicio que establece la Junta de Andalucía. El registro consultado no informa de servicios adicionales.\n\nFicha basada en fuentes públicas. Para detalles de matrícula, horario y cuotas, dirígete directamente al centro.',
  updated_at = NOW()
WHERE slug = 'jesus-divino-obrero-cordoba';

-- Virgen de la Fuensanta  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Virgen de la Fuensanta atiende el primer ciclo de Educación Infantil en la calle Melilla, s/n (14010, Córdoba). Es una escuela infantil de titularidad privada que acoge a niños de 4 meses a 3 años.\n\nSu adhesión al Programa de Ayuda a las Familias de la Junta de Andalucía abre la posibilidad de bonificar el precio del servicio educativo conforme a la normativa. Los servicios concretos del centro no constan en el listado oficial.\n\nAntes de matricular, pregunta en Virgen de la Fuensanta por su proyecto, su horario y las plazas libres del curso.',
  updated_at = NOW()
WHERE slug = 'virgen-de-la-fuensanta-cordoba';

-- Nubes de Algodón  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Nubes de Algodón es una escuela infantil privada de la calle Jazmín, 2 (14014, Córdoba), orientada al primer ciclo de Educación Infantil, desde los 4 meses hasta los 3 años.\n\nConsta adherida al Programa de Ayuda a las Familias, cuyo sistema de bonificaciones reduce el precio del servicio educativo según la normativa de la Junta de Andalucía. No hay servicios documentados en la fuente administrativa.\n\nLos datos pueden ampliarse contactando con Nubes de Algodón: su equipo podrá detallarte horarios, comedor y condiciones económicas.',
  updated_at = NOW()
WHERE slug = 'nubes-de-algodon-cordoba';

-- Zaida  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Zaida presta servicio como centro privado de educación infantil de primer ciclo en la calle Previsión, 5 (14004, Córdoba), con alumnado de entre 4 meses y 3 años.\n\nAparece en el registro de la Junta de Andalucía como adherido al Programa de Ayuda a las Familias, que permite bonificar el precio del servicio educativo con arreglo a la normativa vigente. Sus servicios complementarios no figuran en esa fuente.\n\nPara confirmar plazas, horario y cuotas, y para conocer el centro por dentro, lo mejor es contactar directamente con Zaida.',
  updated_at = NOW()
WHERE slug = 'zaida-cordoba';

-- Nuestra Señora de la Piedad  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Nuestra Señora de la Piedad se encuentra en la plaza de las Cañas, s/n (14002, Córdoba). Este centro privado escolariza el primer ciclo de Educación Infantil y admite a niños desde los 4 meses hasta los 3 años.\n\nEstá adherido al Programa de Ayuda a las Familias de la Junta de Andalucía, lo que permite a las familias tramitar la bonificación del precio del servicio según la normativa; la solicitud se presenta en el propio centro. El registro no detalla sus servicios.\n\nRecomendamos confirmar con Nuestra Señora de la Piedad los datos prácticos del curso: horario, comedor, adaptación y tarifas.',
  updated_at = NOW()
WHERE slug = 'nuestra-senora-de-la-piedad-cordoba';

-- El Bosque Encantado  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'El Bosque Encantado es un centro privado de primer ciclo de Educación Infantil situado en la calle Músico Cristóbal de Morales, 2 (14006, Córdoba). Acoge a pequeños de 4 meses a 3 años.\n\nFigura adherido al Programa de Ayuda a las Familias, con la consiguiente bonificación del precio del servicio educativo regulada por la Junta de Andalucía. Los servicios de la escuela no constan en el registro oficial consultado.\n\nFicha elaborada con datos públicos; contacta con El Bosque Encantado para conocer su funcionamiento diario y sus condiciones de matrícula.',
  updated_at = NOW()
WHERE slug = 'el-bosque-encantado-cordoba';

-- Sonrisas  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'En la avenida del Brillante, 125 (14012, Córdoba) abre sus puertas Sonrisas, escuela infantil privada dedicada al primer ciclo de Educación Infantil, de los 4 meses a los 3 años.\n\nSu adhesión al Programa de Ayuda a las Familias de la Junta de Andalucía hace posible la bonificación del precio del servicio educativo según la normativa vigente. La fuente oficial no aporta detalle sobre comedor, horarios o actividades.\n\nSi Sonrisas está entre tus opciones, acércate o llama para resolver esas dudas y preguntar por plazas y cuotas actualizadas.',
  updated_at = NOW()
WHERE slug = 'sonrisas-cordoba';

-- Montessori Dream  [privado, NO adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Montessori Dream es una escuela infantil privada situada en la calle Poeta Antonio Machado, 8 (14012, Córdoba), que atiende el primer ciclo de Educación Infantil: niños de entre 4 meses y 3 años.\n\nAunque su nombre alude a la pedagogía Montessori, las fuentes oficiales consultadas no recogen información sobre su proyecto educativo, así que conviene preguntarlo directamente. En el registro de la Junta de Andalucía no figura adherida al Programa de Ayuda a las Familias, por lo que sus condiciones económicas se consultan con el propio centro.\n\nRecomendamos contactar con Montessori Dream para conocer su metodología, sus servicios reales, el horario y la disponibilidad de plaza.',
  updated_at = NOW()
WHERE slug = 'montessori-dream-cordoba';

-- Elefantil  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Elefantil ocupa el local 3 de la calle Escritora María Teresa de León (14004, Córdoba). Es un centro privado de educación infantil de primer ciclo que recibe a niños de 4 meses a 3 años.\n\nEstá adherido al Programa de Ayuda a las Familias, así que el precio del servicio educativo puede bonificarse conforme a la normativa de la Junta de Andalucía; la plaza se gestiona en el propio centro. Sus servicios no aparecen detallados en el registro.\n\nLos datos de esta ficha proceden de fuentes públicas. Elefantil puede confirmarte horarios, servicios y cuotas del curso en vigor.',
  updated_at = NOW()
WHERE slug = 'elefantil-cordoba';

-- Gente Menuda  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Gente Menuda es una escuela infantil privada de la calle Escritora Cecilia Böhl de Faber, s/n (14005, Córdoba), centrada en el primer ciclo de Educación Infantil, de 4 meses a 3 años.\n\nConsta como centro adherido al Programa de Ayuda a las Familias de la Junta de Andalucía, cuya bonificación se aplica sobre el precio del servicio educativo según la normativa. En la fuente oficial no hay servicios adicionales documentados.\n\nAntes de decidir, contrasta la información con Gente Menuda: podrán explicarte su día a día, el horario y las condiciones económicas.',
  updated_at = NOW()
WHERE slug = 'gente-menuda-cordoba';

-- San Cayetano II  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'San Cayetano II se sitúa en la calle Alonso el Sabio, 18 (14001, Córdoba), junto al centro que comparte nombre en el número 16. Este centro privado atiende el primer ciclo de Educación Infantil, desde los 4 meses hasta los 3 años.\n\nFigura adherido al Programa de Ayuda a las Familias, que bonifica el precio del servicio educativo con arreglo a la normativa de la Junta de Andalucía. El registro consultado no concreta sus servicios.\n\nFicha basada en registros públicos; recomendamos preguntar en San Cayetano II por horario, comedor, plazas y cuotas antes de matricular.',
  updated_at = NOW()
WHERE slug = 'san-cayetano-ii-cordoba';

-- Do Re Mi II  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Do Re Mi II es un centro privado de primer ciclo de Educación Infantil con domicilio en la calle Escritor Leiva Muñoz, 7, código postal 14193 del término municipal de Córdoba. Escolariza a niños de entre 4 meses y 3 años y comparte nombre con DO RE MI.\n\nEstá adherido al Programa de Ayuda a las Familias de la Junta de Andalucía, con la posibilidad de bonificar el precio del servicio educativo según la normativa vigente. No constan servicios detallados en la fuente oficial.\n\nPara plazas, horario y condiciones del curso, contacta directamente con Do Re Mi II; es la vía más fiable de información actualizada.',
  updated_at = NOW()
WHERE slug = 'do-re-mi-ii-cordoba';

-- La Morenita  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'La Morenita atiende a niños de 4 meses a 3 años en la calle Periodista José Luis de Córdoba, 12 (14010). Es una escuela infantil privada incluida en el registro andaluz de centros de primer ciclo.\n\nSu adhesión al Programa de Ayuda a las Familias permite tramitar la bonificación del precio del servicio educativo que regula la Junta de Andalucía; la solicitud de plaza se hace en el propio centro. Sus servicios concretos no figuran en el listado.\n\nRecomendamos llamar a La Morenita para completar la información: horario, alimentación, período de adaptación y cuotas.',
  updated_at = NOW()
WHERE slug = 'la-morenita-cordoba';

-- Flori  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'En el bloque 2, local 1, de la carretera Santa María de Trassierra, 47 (14011, Córdoba) se encuentra Flori, centro privado de educación infantil de primer ciclo para pequeños de entre 4 meses y 3 años.\n\nAparece adherido al Programa de Ayuda a las Familias, el sistema de la Junta de Andalucía que bonifica el precio del servicio educativo según la normativa. El registro oficial no detalla comedor, horarios ni otros servicios.\n\nLos datos proceden de fuentes administrativas; el equipo de Flori puede confirmarte la oferta real de servicios y las plazas disponibles.',
  updated_at = NOW()
WHERE slug = 'flori-cordoba';

-- Sueños de colores  [privado, NO adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Sueños de colores es una escuela infantil privada situada en el local D del bloque A2 de la calle Francisco Gracia Trenas, 4 (14011, Córdoba). Atiende el primer ciclo de Educación Infantil, de 4 meses a 3 años.\n\nSegún el registro de la Junta de Andalucía, no figura adherida al Programa de Ayuda a las Familias, así que sus cuotas y condiciones se establecen de manera independiente y deben consultarse con el centro. Tampoco constan servicios detallados en la fuente oficial, lo que no implica que no existan.\n\nPara una información completa —proyecto, horario, precios y plazas—, contacta directamente con Sueños de colores.',
  updated_at = NOW()
WHERE slug = 'suenos-de-colores-cordoba';

-- El Patriarca  [privado, NO adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'El Patriarca es un centro privado de educación infantil de primer ciclo con sede en la calle Mejorana, 10 (14012, Córdoba). Acoge a niños desde los 4 meses hasta los 3 años.\n\nEn el registro oficial andaluz no consta adherido al Programa de Ayuda a las Familias, de modo que la matrícula y las cuotas se acuerdan directamente con la dirección. La fuente tampoco recoge servicios concretos del centro; conviene preguntarlos al pedir información.\n\nLos datos de esta ficha tienen origen público y pueden estar incompletos. El Patriarca puede facilitarte el detalle de su oferta y sus plazas.',
  updated_at = NOW()
WHERE slug = 'el-patriarca-cordoba';

-- Jardincito III  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'Jardincito III ocupa el local 3 de la avenida de Cádiz, 64 (14013, Córdoba), en el mismo número donde también figura El Jardincito II. Es un centro privado de primer ciclo que atiende a niños de 4 meses a 3 años.\n\nEstá adherido al Programa de Ayuda a las Familias de la Junta de Andalucía, lo que permite bonificar el precio del servicio educativo conforme a la normativa vigente. Sus servicios propios no aparecen en el registro consultado.\n\nRecomendamos dirigirse a Jardincito III para confirmar plazas, horario y cuotas, y para distinguir la oferta de cada escuela de la avenida.',
  updated_at = NOW()
WHERE slug = 'jardincito-iii-cordoba';

-- El Cuco  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'El Cuco es una escuela infantil privada de la calle Alfaros, 8 (14001, Córdoba), dedicada al primer ciclo de Educación Infantil: bebés desde los 4 meses y niños hasta los 3 años.\n\nFigura adherido al Programa de Ayuda a las Familias, cuya bonificación reduce el precio del servicio educativo según la normativa de la Junta de Andalucía; la plaza se solicita en el propio centro. El registro no informa sobre servicios complementarios.\n\nAntes de decidir, habla con El Cuco para conocer su horario, la organización de las comidas y el descanso, y las tarifas del curso.',
  updated_at = NOW()
WHERE slug = 'el-cuco-cordoba';

-- La Sierra  [privado, adherido al Programa de Ayuda a las Familias]
UPDATE centers SET
  long_description = E'La Sierra presta servicio en la calle Poeta Miguel Hernández, 30, en la urbanización El Tablero (14012, Córdoba). Este centro privado de educación infantil de primer ciclo escolariza a niños de entre 4 meses y 3 años.\n\nConsta adherido al Programa de Ayuda a las Familias de la Junta de Andalucía, que bonifica el precio del servicio educativo con arreglo a la normativa vigente. Sobre comedor, horario ampliado u otros servicios la fuente oficial no aporta datos.\n\nFicha elaborada a partir de registros públicos. La Sierra puede confirmarte los servicios reales, las plazas libres y las cuotas.',
  updated_at = NOW()
WHERE slug = 'la-sierra-cordoba';

COMMIT;
