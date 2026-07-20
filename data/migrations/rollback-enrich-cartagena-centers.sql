-- rollback-enrich-cartagena-centers.sql
-- Revierte data/migrations/enrich-cartagena-centers.sql: devuelve long_description
-- a NULL en los mismos 4 centros "finos" de Cartagena que aquella migracion
-- enriquecio (todos tenian long_description NULL antes del enriquecimiento, por lo
-- que NULL restaura exactamente el estado previo).
-- Solo toca long_description y updated_at, identificando cada centro por slug.
-- NO toca: services, verification_status, confidence_level, verified_at, faqs,
-- pedagogical_approach, schedule ni ningun otro campo.
-- Centros afectados: 4.
-- Generado: 2026-07-20. Revisar antes de ejecutar. NO ejecutado.
-- Sin DELETE / DROP / TRUNCATE.

BEGIN;

UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'alevines-cartagena';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'pepico-paluco-cartagena';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'el-pais-de-nunca-jamas-cartagena';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'la-cometa-de-los-dolores-cartagena';

COMMIT;
