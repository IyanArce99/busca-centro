-- 020_publish_valencia_centers.sql
-- Publica los 162 centros de Valencia cambiando status de 'draft' a
-- 'published'. A diferencia de Barcelona, no hay ningun centro conocido
-- como cerrado o descartado (0 centros con recommended_indexable=false),
-- asi que se publican los 162 sin excepciones.
-- Solo afecta a city_slug='valencia'; no toca Madrid, Barcelona ni
-- ninguna otra ciudad.
--
-- Generado: 2026-07-11. Revisar antes de ejecutar.
-- Requiere que 019_insert_valencia_centers.sql ya se haya ejecutado.

BEGIN;

UPDATE centers
SET status = 'published', updated_at = NOW()
WHERE city_slug = 'valencia';

COMMIT;
