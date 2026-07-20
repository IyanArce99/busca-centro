-- rollback-enrich-jerez-centers.sql
-- Revierte data/migrations/enrich-jerez-centers.sql: devuelve long_description
-- a NULL en los mismos 27 centros "finos" de Jerez de la Frontera que aquella
-- migracion enriquecio (todos tenian long_description NULL antes del
-- enriquecimiento, por lo que NULL restaura exactamente el estado previo).
-- Solo toca long_description y updated_at, identificando cada centro por slug.
-- NO toca: services, verification_status, confidence_level, verified_at, faqs,
-- pedagogical_approach, schedule ni ningun otro campo.
-- Centros afectados: 27.
-- Generado: 2026-07-20. Revisar antes de ejecutar. NO ejecutado.
-- Sin DELETE / DROP / TRUNCATE.

BEGIN;

UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'el-salvador-jerez';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'mundo-nuevo-jerez';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'el-centro-jerez';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'el-pastorcito-divino-jerez';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'la-tortuga-jerez';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'blanca-paloma-jerez';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'pita-pita-jerez';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'perezoso-jerez';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'la-granja-jerez';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'pipos-jerez';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'bugui-bugui-jerez';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'lolita-jerez';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'el-golfillo-2-jerez';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'montealto-jerez';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'pequenos-pasitos-jerez';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'bambu-jerez';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'el-sonajero-jerez';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'montealto-ii-jerez';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'el-nido-jerez';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'baby-ilusiones-jerez';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'colorines-house-jerez';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'educa-jerez';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'pequeno-pony-jerez';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'la-ardilla-pilla-jerez';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'veo-veo-jerez';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'nazaret-jerez';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'chupetes-jerez';

COMMIT;
