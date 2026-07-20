-- enrich-salamanca-centers.sql
-- Enriquecimiento de long_description para los 2 centros "finos" de Salamanca capital:
-- centros sin servicios confirmados (services vacio) y sin long_description previa.
-- Los otros 13 centros de Salamanca ya tienen long_description y servicios en
-- data/migrations/insert-salamanca-centers.sql y NO se tocan.
-- Redaccion basada EXCLUSIVAMENTE en datos ya presentes en
-- data/migrations/insert-salamanca-centers.sql y data/enrichment/salamanca-centers.json
-- (nombre, direccion, titularidad privada, edades 4-36 meses, adhesion al programa
-- de gratuidad del primer ciclo de educacion infantil de la Junta de Castilla y Leon
-- y, en el caso de El Tren, gestion por ASDECOBA desde 1995 segun fuentes de prensa
-- e institucionales ya recogidas en la ficha). No se inventan servicios, horarios,
-- barrios ni metodologias; el contexto generico se formula como caracteristica de
-- la etapa 0-3, no del centro.
-- Solo actualiza long_description y updated_at, identificando cada centro por slug.
-- NO toca: services, verification_status, confidence_level, verified_at, faqs,
-- pedagogical_approach, schedule ni ningun otro campo.
-- Centros afectados: 2 (mi-mama-me-mima, el-tren), ambos privados adheridos al
-- programa de gratuidad del primer ciclo de la Junta de Castilla y Leon.
-- Generado: 2026-07-20. Revisar antes de ejecutar. NO ejecutado.
-- Sin DELETE / DROP / TRUNCATE.
-- Rollback disponible en data/migrations/rollback-enrich-salamanca-centers.sql.

BEGIN;

-- MI MAMA ME MIMA (mi-mama-me-mima-salamanca) [privado, adherido a gratuidad JCyL]
UPDATE centers SET
  long_description = E'Mi Mamá Me Mima es una guardería privada de primer ciclo de educación infantil situada en C/ María la Brava, 42 (37003), en Salamanca capital. Escolariza a niños desde los 4 meses hasta los 3 años, la etapa previa al segundo ciclo de infantil.\n\nSegún el registro oficial de centros docentes de la Junta de Castilla y León, participa en el programa de gratuidad del primer ciclo de educación infantil, que desde el curso 2024-2025 ofrece plazas gratuitas de 0 a 3 años en los centros privados adheridos a esta oferta. Más allá de ese dato, la fuente oficial consultada no confirma servicios concretos: horario de apertura, comedor o periodo de adaptación son aspectos que cada centro organiza a su manera y conviene tratarlos con el propio equipo.\n\nEsta ficha se ha elaborado con información de fuentes públicas y puede quedar incompleta. Para confirmar plazas disponibles, horarios y cuotas actualizadas, lo más directo es llamar al centro o consultar su web.',
  updated_at = NOW()
WHERE slug = 'mi-mama-me-mima-salamanca';

-- EL TREN (el-tren-salamanca) [privado, adherido a gratuidad JCyL, gestion ASDECOBA]
UPDATE centers SET
  long_description = E'En la Plaza Extremadura, 5 (37008) de Salamanca desarrolla su actividad El Tren, un centro privado de educación infantil dedicado al primer ciclo, la franja que va de los 4 meses a los 3 años. Según fuentes de prensa e institucionales, está gestionado desde 1995 por ASDECOBA, la Asociación de Desarrollo Comunitario de Buenos Aires.\n\nFigura entre los centros adheridos al programa de gratuidad de las enseñanzas de primer ciclo de la Junta de Castilla y León, de modo que las familias pueden acceder a plazas gratuitas de 0 a 3 años conforme a la normativa vigente. Los servicios específicos no constan en la fuente oficial; como referencia, en esta etapa la jornada suele articularse en torno al juego, las rutinas de alimentación y el descanso, con una organización propia en cada escuela.\n\nLos datos de esta página proceden de registros públicos y pueden no reflejar cambios recientes. Antes de decidir, pregunta directamente al centro por las plazas del curso, el horario y las condiciones económicas.',
  updated_at = NOW()
WHERE slug = 'el-tren-salamanca';

COMMIT;
