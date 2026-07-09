-- rollback_017_publish_barcelona_centers.sql
-- Revierte 017: vuelve a poner en 'draft' todos los centros de Barcelona.
--
-- IMPORTANTE: esto afecta a TODOS los centros con city_slug='barcelona',
-- sin distinguir si alguno se publico o despublico manualmente despues
-- por otra via. Revisar antes de ejecutar si ha habido cambios de status
-- posteriores a 017.
--
-- Generado: 2026-07-09. Revisar antes de ejecutar.

BEGIN;

UPDATE centers
SET status = 'draft', updated_at = NOW()
WHERE city_slug = 'barcelona';

COMMIT;
