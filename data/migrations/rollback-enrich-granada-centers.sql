-- rollback-enrich-granada-centers.sql
-- Revierte data/migrations/enrich-granada-centers.sql: devuelve long_description
-- a NULL en los mismos 31 centros "finos" de Granada capital que aquella migracion
-- enriquecio (todos tenian long_description NULL antes del enriquecimiento, por lo
-- que NULL restaura exactamente el estado previo).
-- Solo toca long_description y updated_at, identificando cada centro por slug.
-- NO toca: services, verification_status, confidence_level, verified_at, faqs,
-- pedagogical_approach, schedule ni ningun otro campo.
-- Centros afectados: 31.
-- Generado: 2026-07-20. Revisar antes de ejecutar. NO ejecutado.
-- Sin DELETE / DROP / TRUNCATE.

BEGIN;

UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'la-asuncion-granada';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'mami-granada';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'snoopy-granada';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'aldeas-infantiles-sos-granada';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'garabatos-granada';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'garabatos-de-arabial-granada';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'colorines-granada';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'virgen-de-montserrat-granada';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'luna-lunera-granada';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'centro-de-atencion-familiar-granada';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'bubu-granada';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'pasito-a-pasito-granada';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'mi-muneco-granada';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'caracoles-granada';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'virgen-madre-granada';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'san-francisco-javier-granada';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'mar-de-agata-granada';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'la-guarde-granada';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'la-casa-de-oikodoro-granada';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'mofletes-granada';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'platero-granada';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'parchis-granada';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'piopio-granada';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'suena-by-nerea-bedmar-granada';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'santa-rosalia-1-granada';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'n-college-granada';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'nemomarlin-granada-granada';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'maria-inmaculada-granada';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'la-cartuja-granada';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'amanecer-granada';
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'alqueria-granada';

COMMIT;
