-- publish-ronda1-centers.sql
-- Publica los 593 centros de las 6 ciudades de la Ronda 1 de expansión
-- (Zaragoza 59, Murcia 52, Sevilla 218, Palma 75, Málaga 152, Alicante 37),
-- cambiando status de 'draft' a 'published'.
--
-- REQUISITO: haber ejecutado antes los 6 INSERT correspondientes:
--   insert-zaragoza-centers.sql, insert-murcia-centers.sql,
--   insert-sevilla-centers.sql, insert-palma-centers.sql,
--   insert-malaga-centers.sql, insert-alicante-centers.sql
--
-- Ninguna de las 6 zonas tiene centros excluidos de publicación (a diferencia
-- del caso de Barcelona): los datasets finales solo contienen centros
-- aprobados por auditoría, así que se publican todos por city_slug.
-- No toca Madrid, Barcelona, Valencia ni ninguna otra ciudad.
--
-- Generado: 2026-07-13. Revisar antes de ejecutar.

BEGIN;

UPDATE centers SET status = 'published', updated_at = NOW() WHERE city_slug = 'zaragoza';
UPDATE centers SET status = 'published', updated_at = NOW() WHERE city_slug = 'murcia';
UPDATE centers SET status = 'published', updated_at = NOW() WHERE city_slug = 'sevilla';
UPDATE centers SET status = 'published', updated_at = NOW() WHERE city_slug = 'palma';
UPDATE centers SET status = 'published', updated_at = NOW() WHERE city_slug = 'malaga';
UPDATE centers SET status = 'published', updated_at = NOW() WHERE city_slug = 'alicante';

COMMIT;
