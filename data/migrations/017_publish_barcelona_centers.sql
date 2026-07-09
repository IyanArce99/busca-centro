-- 017_publish_barcelona_centers.sql
-- Publica los centros de Barcelona (260 de 261) cambiando status a
-- 'published'. Excluye 'sant-francesc-xavier-barcelona' (colegio confirmado
-- como cerrado permanentemente al final del curso 2023-2024, segun prensa
-- y el portal Agora de la Generalitat), que se mantiene en 'draft' sin
-- borrarse de la tabla. Solo afecta a city_slug='barcelona'; no toca
-- Madrid ni ninguna otra ciudad.
--
-- Generado: 2026-07-09. Revisar antes de ejecutar.
-- Requiere que 016_insert_barcelona_centers.sql ya se haya ejecutado.

BEGIN;

UPDATE centers
SET status = 'published', updated_at = NOW()
WHERE city_slug = 'barcelona'
  AND slug != 'sant-francesc-xavier-barcelona';

COMMIT;
