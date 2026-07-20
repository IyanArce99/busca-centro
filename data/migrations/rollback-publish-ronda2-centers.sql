-- rollback-publish-ronda2-centers.sql
-- Revierte publish-ronda2-centers.sql: vuelve a poner en 'draft' todos los
-- centros de las 9 ciudades de la Ronda 2.
--
-- IMPORTANTE: afecta a TODOS los centros de esos city_slug, sin distinguir si
-- alguno cambio de status manualmente despues. Revisar antes de ejecutar si ha
-- habido cambios posteriores.
--
-- Generado: 2026-07-20. Revisar antes de ejecutar.

BEGIN;

UPDATE centers SET status = 'draft', updated_at = NOW() WHERE city_slug = 'cordoba';
UPDATE centers SET status = 'draft', updated_at = NOW() WHERE city_slug = 'granada';
UPDATE centers SET status = 'draft', updated_at = NOW() WHERE city_slug = 'valladolid';
UPDATE centers SET status = 'draft', updated_at = NOW() WHERE city_slug = 'las-palmas-de-gran-canaria';
UPDATE centers SET status = 'draft', updated_at = NOW() WHERE city_slug = 'jerez-de-la-frontera';
UPDATE centers SET status = 'draft', updated_at = NOW() WHERE city_slug = 'albacete';
UPDATE centers SET status = 'draft', updated_at = NOW() WHERE city_slug = 'castellon-de-la-plana';
UPDATE centers SET status = 'draft', updated_at = NOW() WHERE city_slug = 'cartagena';
UPDATE centers SET status = 'draft', updated_at = NOW() WHERE city_slug = 'salamanca';

COMMIT;
