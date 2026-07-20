-- enrich-castellon-centers.sql
-- Enriquecimiento de long_description para los 7 centros "finos" de Castellon de la Plana:
-- centros sin long_description previa (NULL) y sin servicios confirmados (services vacio),
-- que por ello quedan en noindex. Con esta long_description pasan a tener prosa util.
-- Redaccion basada EXCLUSIVAMENTE en datos ya presentes en
-- data/migrations/insert-castellon-centers.sql y data/enrichment/castellon-centers.json
-- (nombre, direccion, titularidad, edades 0-3, autorizacion en el Registre de Centres
-- Docents de la Comunitat Valenciana y, en su caso, titular comun documentado en el dataset).
-- En el dataset NO consta adhesion de ningun centro al Bono Infantil / gratuidad 0-3 de la
-- Generalitat, por lo que NO se afirma; solo se menciona como pregunta a trasladar al centro.
-- No se inventan servicios, horarios, barrios ni metodologias; el contexto generico se
-- formula como caracteristica de la etapa 0-3, no del centro.
-- Solo actualiza long_description y updated_at, identificando cada centro por slug.
-- NO toca: services, verification_status, confidence_level, verified_at, faqs,
-- pedagogical_approach, schedule ni ningun otro campo.
-- Centros afectados: 7 (1 publico municipal: escuela-infantil-municipal-los-duendes;
-- 6 privados: mikole, la-papallona-menuda, la-marieta, sirius, primers-passos-censal-ii,
-- contam-un-conte).
-- Nota: lom-castellon-de-la-plana tiene services vacio pero long_description previa,
-- por lo que NO se incluye en esta pasada.
-- Generado: 2026-07-20. Revisar antes de ejecutar. NO ejecutado.
-- Sin DELETE / DROP / TRUNCATE.
-- Rollback disponible en data/migrations/rollback-enrich-castellon-centers.sql.

BEGIN;

-- ESCUELA INFANTIL MUNICIPAL LOS DUENDES (escuela-infantil-municipal-los-duendes-castellon-de-la-plana) [publico municipal]
UPDATE centers SET
  long_description = E'La Escuela Infantil Municipal Los Duendes forma parte de la oferta pública de primer ciclo del Ajuntament de Castelló de la Plana. Está situada en el grupo San Lorenzo, junto a la carretera de Ribesalbes (12006), y escolariza a niños desde los primeros meses hasta los 3 años.\n\nComo centro autorizado, figura en el Registre de Centres Docents de la Comunitat Valenciana, aunque la fuente oficial consultada no detalla sus servicios: comedor, horario ampliado o actividades complementarias son cuestiones que deben confirmarse con el propio equipo. En esta etapa, la jornada suele organizarse en torno a rutinas de juego, alimentación y descanso, con grupos separados por edades.\n\nLos datos de esta ficha proceden de fuentes públicas y pueden quedar incompletos. Para conocer el proceso de admisión, las plazas disponibles y las cuotas vigentes, lo más directo es contactar con la escuela.',
  updated_at = NOW()
WHERE slug = 'escuela-infantil-municipal-los-duendes-castellon-de-la-plana';

-- MIKOLE (mikole-castellon-de-la-plana) [privado]
UPDATE centers SET
  long_description = E'En la calle Cuadra Saboner, 4 (12006) desarrolla su actividad Mikole, un centro privado de Castellón de la Plana autorizado para el primer ciclo de educación infantil, que abarca de los 0 a los 3 años.\n\nEl Registre de Centres Docents de la Comunitat Valenciana lo recoge como centro autorizado, pero no aporta detalle sobre su funcionamiento diario. Un aspecto práctico que merece la pena preguntar es si participa en el Bono Infantil, el programa de ayudas de la Generalitat para la escolarización 0-3, ya que ese extremo no figura en el registro.\n\nFicha redactada a partir de información de origen público. El equipo de Mikole puede concretar de primera mano su horario, sus servicios, las plazas libres y las cuotas actuales.',
  updated_at = NOW()
WHERE slug = 'mikole-castellon-de-la-plana';

-- LA PAPALLONA MENUDA (la-papallona-menuda-castellon-de-la-plana) [privado]
UPDATE centers SET
  long_description = E'La Papallona Menuda es un centro privado de educación infantil de primer ciclo con sede en la calle Calderón de la Barca, 15 (12004), en Castellón de la Plana. Acoge a niños de 0 a 3 años, la etapa previa al segundo ciclo de infantil.\n\nMás allá de su autorización en el registro oficial de centros docentes de la Generalitat Valenciana, no constan servicios confirmados en las fuentes consultadas. Como referencia general de la etapa, la incorporación al primer ciclo suele acompañarse de un periodo de adaptación progresivo, cuyos detalles fija cada escuela junto con las familias.\n\nLa información publicada procede de registros públicos y puede evolucionar. Antes de solicitar plaza, pregunta directamente al centro por su horario, sus servicios y las condiciones económicas del curso.',
  updated_at = NOW()
WHERE slug = 'la-papallona-menuda-castellon-de-la-plana';

-- LA MARIETA (la-marieta-castellon-de-la-plana) [privado]
UPDATE centers SET
  long_description = E'La calle Illa Baleato, 5, en el código postal 12006 de Castellón de la Plana, es la dirección de La Marieta, una guardería de titularidad privada dedicada al primer ciclo de educación infantil, de los 0 a los 3 años.\n\nSu autorización aparece recogida en el registro de la Conselleria d''Educació, que sin embargo no especifica nada sobre comedor, tramos horarios u organización de las aulas por edades: son aspectos que cambian de una escuela a otra y que se aclaran mejor en una visita o por teléfono.\n\nFicha construida con datos de acceso público. El equipo de La Marieta es la referencia para resolver dudas sobre plazas disponibles, tarifas y funcionamiento del día a día.',
  updated_at = NOW()
WHERE slug = 'la-marieta-castellon-de-la-plana';

-- SIRIUS (sirius-castellon-de-la-plana) [privado]
UPDATE centers SET
  long_description = E'Sirius atiende a niños de entre 0 y 3 años en la calle Gumbau, 19 bis (12001), en Castellón de la Plana. Se trata de un centro privado autorizado dentro del primer ciclo de educación infantil.\n\nLa fuente oficial consultada, el registro de centros docentes de la Generalitat Valenciana, confirma su autorización pero no describe servicios concretos. Antes de comprometerte, repasa con el equipo cómo organizan la jornada, qué opciones de alimentación ofrecen y qué ayudas autonómicas admiten, puntos que esta ficha no recoge.\n\nLo publicado aquí tiene origen en fuentes públicas y puede no reflejar cambios recientes. Una llamada al centro permite confirmar plazas, cuotas y organización antes de tomar una decisión.',
  updated_at = NOW()
WHERE slug = 'sirius-castellon-de-la-plana';

-- PRIMERS PASSOS CENSAL II (primers-passos-censal-ii-castellon-de-la-plana) [privado]
UPDATE centers SET
  long_description = E'Primers Passos Censal II es un centro privado de primer ciclo de educación infantil situado en la calle Río Nervión, 9 (12005), en Castellón de la Plana. Su alumnado va de los 0 a los 3 años y comparte titularidad con las escuelas Primers Passos y Primers Passos Sensal de la misma ciudad.\n\nConviene tener en cuenta que los servicios confirmados de esas otras sedes no se han atribuido a esta dirección, porque la fuente oficial consultada no los recoge para este centro en concreto. Horario, comedor, actividades o periodo de adaptación son, por tanto, cuestiones a verificar directamente con el equipo.\n\nEsta ficha se apoya en registros públicos y queda pendiente de contraste con el propio centro. Para plazas, cuotas y detalles de funcionamiento, lo más fiable es el contacto directo.',
  updated_at = NOW()
WHERE slug = 'primers-passos-censal-ii-castellon-de-la-plana';

-- CONTA'M UN CONTE (contam-un-conte-castellon-de-la-plana) [privado]
UPDATE centers SET
  long_description = E'Bajo el nombre de Conta''m un Conte funciona un centro privado de educación infantil en la avenida Vicente Sos Baynat, 31 (12006), en Castellón de la Plana. Su ámbito es el primer ciclo, de los 0 a los 3 años.\n\nEstá autorizado por la Conselleria d''Educació de la Generalitat Valenciana e inscrito en el registro oficial de centros docentes, que no detalla en cambio sus servicios ni su horario. En el primer ciclo, el trabajo diario gira en torno al juego, los hábitos y el desarrollo de la autonomía, con una propuesta específica en cada escuela.\n\nLos contenidos de esta ficha se han extraído de fuentes públicas. Si el centro encaja con lo que buscas, pregunta por plazas del curso actual, cuotas y funcionamiento antes de decidirte.',
  updated_at = NOW()
WHERE slug = 'contam-un-conte-castellon-de-la-plana';

COMMIT;
