-- rollback-enrich-salamanca-centers.sql
-- Revierte data/migrations/enrich-salamanca-centers.sql: devuelve long_description
-- a NULL en los mismos 2 centros "finos" de Salamanca capital que aquella migracion
-- enriquecio (ambos tenian long_description NULL antes del enriquecimiento, por lo
-- que NULL restaura exactamente el estado previo).
-- Solo toca long_description y updated_at, identificando cada centro por slug.
-- NO toca: services, verification_status, confidence_level, verified_at, faqs,
-- pedagogical_approach, schedule ni ningun otro campo.
-- Centros afectados: 2.
-- Generado: 2026-07-20. Revisar antes de ejecutar. NO ejecutado.
-- Sin DELETE / DROP / TRUNCATE.

BEGIN;

UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'mi-mama-me-mima-salamanca';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'el-tren-salamanca';

COMMIT;
