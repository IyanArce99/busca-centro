-- rollback_020_publish_valencia_centers.sql
-- Revierte 020: vuelve a poner en 'draft' todos los centros de Valencia.
--
-- IMPORTANTE: esto afecta a TODOS los centros con city_slug='valencia',
-- sin distinguir si alguno se publico o despublico manualmente despues
-- por otra via. Revisar antes de ejecutar si ha habido cambios de status
-- posteriores a 020.
--
-- Generado: 2026-07-11. Revisar antes de ejecutar.

BEGIN;

UPDATE centers
SET status = 'draft', updated_at = NOW()
WHERE city_slug = 'valencia';

COMMIT;
