-- enrich-cartagena-centers.sql
-- Enriquecimiento de long_description para los 4 centros "finos" de Cartagena:
-- centros con long_description NULL y services vacio, que por ello quedan en
-- noindex. Con esta long_description pasan a ser indexables.
-- Redaccion basada EXCLUSIVAMENTE en datos ya presentes en
-- data/migrations/insert-cartagena-centers.sql y data/enrichment/cartagena-centers.json
-- (nombre, direccion, pedania, titularidad privada, edades 0-36 meses, web propia
-- cuando consta, codigo de centro CARM del mapa escolar de la Region de Murcia).
-- No se inventan servicios, horarios, metodologias ni barrios; el contexto
-- generico se formula como caracteristica de la etapa 0-3, no del centro.
-- Ninguno de los 4 pertenece a la red municipal de Escuelas Infantiles de
-- Cartagena, por lo que no se menciona pertenencia a red alguna.
-- Solo actualiza long_description y updated_at, identificando cada centro por slug.
-- NO toca: services, verification_status, confidence_level, verified_at, faqs,
-- pedagogical_approach, schedule ni ningun otro campo.
-- Centros afectados: 4 (todos privados: alevines, pepico-paluco,
-- el-pais-de-nunca-jamas, la-cometa-de-los-dolores).
-- Quedan fuera los 11 EIM municipales y nice-day (ya tienen long_description y
-- servicios) y mediterraneo-cartagena (long_description NULL pero con servicio
-- 'comedor' confirmado, por lo que no cumple la definicion de centro fino).
-- Generado: 2026-07-20. Revisar antes de ejecutar. NO ejecutado.
-- Sin DELETE / DROP / TRUNCATE.
-- Rollback disponible en data/migrations/rollback-enrich-cartagena-centers.sql.

BEGIN;

-- ALEVINES (alevines-cartagena) [guarderia, privado]
UPDATE centers SET
  long_description = E'Alevines figura inscrita como guardería privada de primer ciclo en el mapa escolar de la Región de Murcia. Su sede está en la Calle Subida del Nazareno, s/n (código postal 30202), en Cartagena, y acoge a pequeños desde el nacimiento hasta los 3 años.\n\nEl registro autonómico no aporta horario ni prestaciones concretas de esta guardería. A modo de orientación, los proyectos que trabajan con el grupo 0-3 estructuran el día alrededor del juego, la comida y el descanso, y cada uno fija su calendario, la distribución de las aulas y la manera de plantear los primeros días de los recién llegados.\n\nLos datos de esta ficha provienen de fuentes de acceso público y podrían no estar completos. Una llamada basta para aclarar si hay plaza, qué horario ofrece, si dispone de comedor y cuánto cuesta el servicio.',
  updated_at = NOW()
WHERE slug = 'alevines-cartagena';

-- PEPICO PALUCO (pepico-paluco-cartagena) [guarderia, privado]
UPDATE centers SET
  long_description = E'En la Calle Jiménez de la Espada, 21 - B (30205) desarrolla su actividad Pepico Paluco, un centro privado de educación infantil de Cartagena dedicado al primer ciclo, la franja de 0 a 3 años, con más de una década de trayectoria según los datos recogidos en esta ficha.\n\nConsta como centro autorizado en el mapa escolar de la Consejería de Educación murciana, si bien esa fuente no especifica servicios complementarios (comedor, ampliación horaria u otros). Dispone además de página web propia, pepicopaluco.es, útil para conocer su propuesta antes de acercarse a verlo.\n\nLo publicado aquí procede de registros oficiales y de la información disponible en línea, y puede cambiar de un curso a otro. Conviene por ello contrastar con el equipo la existencia de plazas, las tarifas y el resto de condiciones antes de decidir.',
  updated_at = NOW()
WHERE slug = 'pepico-paluco-cartagena';

-- EL PAIS DE NUNCA JAMAS (el-pais-de-nunca-jamas-cartagena) [guarderia, privado]
UPDATE centers SET
  long_description = E'El País de Nunca Jamás atiende a niños de 0 a 3 años en la pedanía de La Palma, dentro del término municipal de Cartagena. Esta guardería de titularidad privada ocupa un local en la Calle Antonio Serrano, esquina con Tomás Ferro (30593), y aparece en el mapa escolar regional como centro de primer ciclo.\n\nSobre su funcionamiento diario no existe información confirmada en fuente oficial. Lo habitual en esta etapa es agrupar a los alumnos por tramos de edad y acompañar la incorporación con un periodo de adaptación pautado junto a las familias; el detalle concreto en este caso corresponde explicárselo al propio equipo.\n\nFicha elaborada a partir de datos públicos, sujeta a actualización. Si esta opción encaja con lo que buscas en La Palma, pregunta directamente por plazas libres, horarios y condiciones económicas del curso.',
  updated_at = NOW()
WHERE slug = 'el-pais-de-nunca-jamas-cartagena';

-- LA COMETA DE LOS DOLORES (la-cometa-de-los-dolores-cartagena) [guarderia, privado]
UPDATE centers SET
  long_description = E'La Cometa de los Dolores es un centro de educación infantil privado autorizado para el primer ciclo (0-3 años), situado en la Calle Turín, 3, en el Polígono Residencial Santa Ana, dentro de la pedanía cartagenera de Los Dolores.\n\nSu código en el registro de la Consejería de Educación es el 30013611 y cuenta con web propia, ceilacometa.es, que en el momento de la consulta no detallaba prestaciones concretas. Comedor, ampliación de horario o actividades cotidianas son, por tanto, cuestiones que resolver con el equipo educativo.\n\nLa información mostrada combina fuentes públicas y la web del centro. Para valorar la opción con calma, lo recomendable es concertar una visita y repasar allí plazas, cuotas y organización de la jornada.',
  updated_at = NOW()
WHERE slug = 'la-cometa-de-los-dolores-cartagena';

COMMIT;
