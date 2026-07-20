-- rollback-enrich-albacete-centers.sql
-- Revierte data/migrations/enrich-albacete-centers.sql: devuelve long_description
-- a NULL en los mismos 8 centros "finos" de Albacete capital que aquella migracion
-- enriquecio (todos tenian long_description NULL antes del enriquecimiento, por lo
-- que NULL restaura exactamente el estado previo).
-- Solo toca long_description y updated_at, identificando cada centro por slug.
-- NO toca: services, verification_status, confidence_level, verified_at, faqs,
-- pedagogical_approach, schedule ni ningun otro campo.
-- Centros afectados: 8.
-- Generado: 2026-07-20. Revisar antes de ejecutar. NO ejecutado.
-- Sin DELETE / DROP / TRUNCATE.

BEGIN;

UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'escuela-infantil-el-tren-azul-albacete';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'escuela-infantil-virgen-de-los-llanos-albacete';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'escuela-infantil-los-girasoles-albacete';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'escuelas-infantiles-aire-libre-i-albacete';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'escuelas-infantiles-aire-libre-ii-albacete';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'guarderia-tulgarita-albacete';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'escuela-infantil-la-escuelita-albacete';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'escuela-infantil-rayuela-albacete';

COMMIT;
