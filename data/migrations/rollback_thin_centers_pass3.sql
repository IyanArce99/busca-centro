-- ROLLBACK 010_enrich_thin_centers_pass3.sql
BEGIN;

UPDATE centers SET name = 'MABEROGAN VALDEBEBAS', website = NULL, phone = NULL, services = ARRAY[]::text[], pedagogical_approach = ARRAY[]::text[], long_description = NULL, verification_status = 'partially_verified', confidence_level = NULL, verified_at = NULL, updated_at = NOW() WHERE id = '398431aa-2fa4-43cf-8d3e-5570bb9e2506';
UPDATE centers SET services = ARRAY[]::text[], long_description = NULL, verification_status = 'partially_verified', confidence_level = NULL, verified_at = NULL, updated_at = NOW() WHERE id = '4f2ca8c2-cd7e-4028-9046-253cf659f3a0';
UPDATE centers SET website = NULL, services = ARRAY[]::text[], long_description = NULL, verification_status = 'partially_verified', confidence_level = NULL, verified_at = NULL, updated_at = NOW() WHERE id = '1a67afb7-567e-427b-abef-02bc5ed31d51';
UPDATE centers SET services = ARRAY[]::text[], pedagogical_approach = ARRAY[]::text[], long_description = NULL, social_links = '{}'::jsonb, verification_status = 'partially_verified', confidence_level = NULL, verified_at = NULL, updated_at = NOW() WHERE id = '84cc85e0-e67a-4a33-b463-87a6c0d195fa';
UPDATE centers SET website = 'www.elnidodelbuho.es', services = ARRAY[]::text[], long_description = NULL, verification_status = 'partially_verified', confidence_level = NULL, verified_at = NULL, updated_at = NOW() WHERE id = '78ed5308-5c04-4f93-808d-f64d69a2b65e';
UPDATE centers SET social_links = '{}'::jsonb, updated_at = NOW() WHERE id = '7b9517ba-29d0-4fab-a994-929e162e7cd0';
UPDATE centers SET social_links = '{}'::jsonb, updated_at = NOW() WHERE id = '1839263c-81e7-4862-9faa-4ca973e3bd14';
UPDATE centers SET social_links = '{}'::jsonb, updated_at = NOW() WHERE id = '421d8c3d-9eb7-4d79-ab38-b34608e5b5bf';
UPDATE centers SET social_links = '{}'::jsonb, updated_at = NOW() WHERE id = 'ffd31a56-745d-4dd9-bc6e-19b4e4a63080';

COMMIT;