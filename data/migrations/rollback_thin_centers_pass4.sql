-- ROLLBACK 013_enrich_thin_centers_pass4.sql

BEGIN;

UPDATE centers SET services = ARRAY[]::text[], long_description = NULL, pedagogical_approach = ARRAY[]::text[], verification_status = NULL, confidence_level = NULL, verified_at = NULL, updated_at = NOW() WHERE id = '2de776c4-c0c7-42ff-85be-c7dbcfcd41d5';
UPDATE centers SET services = ARRAY[]::text[], long_description = NULL, pedagogical_approach = ARRAY[]::text[], verification_status = NULL, confidence_level = NULL, verified_at = NULL, updated_at = NOW() WHERE id = '61151bb2-0bee-46ea-8e7e-e093f2451934';
UPDATE centers SET services = ARRAY[]::text[], long_description = NULL, pedagogical_approach = ARRAY[]::text[], verification_status = NULL, confidence_level = NULL, verified_at = NULL, updated_at = NOW() WHERE id = '268e0051-c277-4134-aa8c-575f46e0e51c';
UPDATE centers SET services = ARRAY[]::text[], long_description = NULL, pedagogical_approach = ARRAY[]::text[], verification_status = NULL, confidence_level = NULL, verified_at = NULL, updated_at = NOW() WHERE id = '421d8c3d-9eb7-4d79-ab38-b34608e5b5bf';
UPDATE centers SET services = ARRAY[]::text[], long_description = NULL, pedagogical_approach = ARRAY[]::text[], verification_status = NULL, confidence_level = NULL, verified_at = NULL, updated_at = NOW() WHERE id = '7b9517ba-29d0-4fab-a994-929e162e7cd0';
UPDATE centers SET services = ARRAY[]::text[], long_description = NULL, pedagogical_approach = ARRAY[]::text[], verification_status = NULL, confidence_level = NULL, verified_at = NULL, updated_at = NOW() WHERE id = '1839263c-81e7-4862-9faa-4ca973e3bd14';
UPDATE centers SET services = ARRAY[]::text[], long_description = NULL, pedagogical_approach = ARRAY[]::text[], verification_status = NULL, confidence_level = NULL, verified_at = NULL, updated_at = NOW() WHERE id = 'ba9f78ff-fa1a-46ba-9258-a61fd53534f0';

COMMIT;