-- publish-ronda2-centers.sql
-- Publica los 391 centros de las 9 ciudades de la Ronda 2 de expansion
-- (Cordoba 129, Granada 60, Valladolid 42, Las Palmas de Gran Canaria 37,
-- Jerez de la Frontera 37, Albacete 27, Castellon de la Plana 27,
-- Cartagena 17, Salamanca 15), cambiando status de 'draft' a 'published'.
--
-- REQUISITO: haber ejecutado antes los 9 INSERT correspondientes:
--   insert-cordoba-centers.sql, insert-granada-centers.sql,
--   insert-valladolid-centers.sql, insert-las-palmas-centers.sql,
--   insert-jerez-centers.sql, insert-albacete-centers.sql,
--   insert-castellon-centers.sql, insert-cartagena-centers.sql,
--   insert-salamanca-centers.sql
--
-- Ninguna de las 9 zonas tiene centros excluidos de publicacion: los
-- datasets finales solo contienen centros aprobados por auditoria, asi que
-- se publican todos por city_slug.
-- No toca Madrid, Barcelona, Valencia, ni las 6 ciudades de la Ronda 1
-- (Zaragoza, Murcia, Sevilla, Palma, Malaga, Alicante).
--
-- Generado: 2026-07-20. Revisar antes de ejecutar.

BEGIN;

UPDATE centers SET status = 'published', updated_at = NOW() WHERE city_slug = 'cordoba';
UPDATE centers SET status = 'published', updated_at = NOW() WHERE city_slug = 'granada';
UPDATE centers SET status = 'published', updated_at = NOW() WHERE city_slug = 'valladolid';
UPDATE centers SET status = 'published', updated_at = NOW() WHERE city_slug = 'las-palmas-de-gran-canaria';
UPDATE centers SET status = 'published', updated_at = NOW() WHERE city_slug = 'jerez-de-la-frontera';
UPDATE centers SET status = 'published', updated_at = NOW() WHERE city_slug = 'albacete';
UPDATE centers SET status = 'published', updated_at = NOW() WHERE city_slug = 'castellon-de-la-plana';
UPDATE centers SET status = 'published', updated_at = NOW() WHERE city_slug = 'cartagena';
UPDATE centers SET status = 'published', updated_at = NOW() WHERE city_slug = 'salamanca';

COMMIT;
