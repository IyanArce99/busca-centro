-- rollback-enrich-valladolid-centers.sql
-- Revierte data/migrations/enrich-valladolid-centers.sql: devuelve long_description
-- a NULL en los mismos 19 centros "finos" de Valladolid capital que aquella migracion
-- enriquecio (todos tenian long_description NULL antes del enriquecimiento, por lo
-- que NULL restaura exactamente el estado previo).
-- Solo toca long_description y updated_at, identificando cada centro por slug.
-- NO toca: services, verification_status, confidence_level, verified_at, faqs,
-- pedagogical_approach, schedule ni ningun otro campo.
-- Centros afectados: 19.
-- Generado: 2026-07-20. Revisar antes de ejecutar. NO ejecutado.
-- Sin DELETE / DROP / TRUNCATE.

BEGIN;

UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'arco-iris-valladolid';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'argentinas-valladolid';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'casa-de-ninas-y-ninos-maestro-claudio-lopez-serrano-valladolid';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'casa-de-ninas-y-ninos-pajarillos-valladolid';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'chupetin-valladolid';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'cubillas-jardin-de-recreo-valladolid';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'hakuna-matata-valladolid';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'la-abeja-maya-valladolid';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'la-luna-azul-bilingue-valladolid';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'la-suite-infantil-valladolid';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'mi-bosque-encantado-valladolid';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'mi-pequeno-cole-valladolid';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'mis-primeros-pasitos-valladolid';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'noelia-valladolid';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'okapi-valladolid';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'pequena-luna-valladolid';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'romer-valladolid';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'san-antonio-valladolid';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'trastes-san-cristobal-valladolid';

COMMIT;
