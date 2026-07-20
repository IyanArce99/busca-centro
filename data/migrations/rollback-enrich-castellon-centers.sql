-- rollback-enrich-castellon-centers.sql
-- Revierte data/migrations/enrich-castellon-centers.sql: devuelve long_description
-- a NULL en los mismos 7 centros "finos" de Castellon de la Plana que aquella migracion
-- enriquecio (todos tenian long_description NULL antes del enriquecimiento, por lo
-- que NULL restaura exactamente el estado previo).
-- Solo toca long_description y updated_at, identificando cada centro por slug.
-- NO toca: services, verification_status, confidence_level, verified_at, faqs,
-- pedagogical_approach, schedule ni ningun otro campo.
-- Centros afectados: 7.
-- Generado: 2026-07-20. Revisar antes de ejecutar. NO ejecutado.
-- Sin DELETE / DROP / TRUNCATE.

BEGIN;

UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'escuela-infantil-municipal-los-duendes-castellon-de-la-plana';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'mikole-castellon-de-la-plana';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'la-papallona-menuda-castellon-de-la-plana';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'la-marieta-castellon-de-la-plana';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'sirius-castellon-de-la-plana';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'primers-passos-censal-ii-castellon-de-la-plana';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'contam-un-conte-castellon-de-la-plana';

COMMIT;
