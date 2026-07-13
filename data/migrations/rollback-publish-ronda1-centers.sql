-- rollback-publish-ronda1-centers.sql
-- Revierte publish-ronda1-centers.sql: vuelve a poner en 'draft' todos los
-- centros de las 6 ciudades de la Ronda 1.
--
-- IMPORTANTE: afecta a TODOS los centros de esos city_slug, sin distinguir si
-- alguno cambió de status manualmente después. Revisar antes de ejecutar si ha
-- habido cambios posteriores.
--
-- Generado: 2026-07-13. Revisar antes de ejecutar.

BEGIN;

UPDATE centers SET status = 'draft', updated_at = NOW() WHERE city_slug = 'zaragoza';
UPDATE centers SET status = 'draft', updated_at = NOW() WHERE city_slug = 'murcia';
UPDATE centers SET status = 'draft', updated_at = NOW() WHERE city_slug = 'sevilla';
UPDATE centers SET status = 'draft', updated_at = NOW() WHERE city_slug = 'palma';
UPDATE centers SET status = 'draft', updated_at = NOW() WHERE city_slug = 'malaga';
UPDATE centers SET status = 'draft', updated_at = NOW() WHERE city_slug = 'alicante';

COMMIT;
