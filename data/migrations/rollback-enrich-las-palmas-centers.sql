-- rollback-enrich-las-palmas-centers.sql
-- Revierte data/migrations/enrich-las-palmas-centers.sql: devuelve
-- long_description a NULL en los mismos 12 centros "finos" de Las Palmas de
-- Gran Canaria que aquella migracion enriquecio (todos tenian
-- long_description NULL antes del enriquecimiento, por lo que NULL restaura
-- exactamente el estado previo).
-- Solo toca long_description y updated_at, identificando cada centro por slug.
-- NO toca: services, verification_status, confidence_level, verified_at,
-- faqs, pedagogical_approach, schedule ni ningun otro campo.
-- Centros afectados: 12.
-- Generado: 2026-07-20. Revisar antes de ejecutar. NO ejecutado.
-- Sin DELETE / DROP / TRUNCATE.

BEGIN;

UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'la-gallina-turuleta-las-palmas-de-gran-canaria';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'el-barquito-las-palmas-de-gran-canaria';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'first-steps-las-palmas-de-gran-canaria';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'domingo-alonso-las-palmas-de-gran-canaria';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'la-piruleta-las-palmas-de-gran-canaria';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'el-patio-de-mi-casa-las-palmas-de-gran-canaria';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'el-patio-de-mi-casa-7-palmas-las-palmas-de-gran-canaria';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'little-star-las-palmas-de-gran-canaria';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'mafalda-las-palmas-de-gran-canaria';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'la-blanca-paloma-las-palmas-de-gran-canaria';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'el-arbolito-las-palmas-de-gran-canaria';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'mis-peques-las-palmas-de-gran-canaria';

COMMIT;
