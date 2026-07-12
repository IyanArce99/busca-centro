-- rollback-jerez-centers.sql
-- Revierte insert-jerez-centers.sql: elimina exactamente los 37
-- centros de Jerez de la Frontera insertados por esa migracion, identificados por slug (no
-- por city_slug='jerez-de-la-frontera', para no arrastrar filas de una carga futura distinta
-- o de otra zona que pudiera compartir city_slug por error). No toca Madrid, Barcelona,
-- Valencia, Zaragoza, Murcia, Sevilla, Palma, Malaga, Alicante, Las Palmas, Cordoba ni Granada.
--
-- IMPORTANTE: si alguno de estos slugs ya existia en la tabla ANTES de correr
-- insert-jerez-centers.sql (poco probable, es la primera carga de Jerez de la Frontera, pero
-- el INSERT usa ON CONFLICT DO UPDATE), este rollback lo BORRARIA igualmente en vez
-- de restaurar su valor anterior. Verificar antes de ejecutar si hace falta preservar
-- algun centro con estos slugs que no proceda de este sprint.
--
-- Generado: 2026-07-12. Revisar antes de ejecutar.

BEGIN;

DELETE FROM centers
WHERE slug IN (
  'el-salvador-jerez',
  'mundo-nuevo-jerez',
  'el-centro-jerez',
  'el-pastorcito-divino-jerez',
  'la-tortuga-jerez',
  'blanca-paloma-jerez',
  'virgen-del-valle-jerez',
  'santa-maria-jerez',
  'san-carlos-jerez',
  'rocinante-jerez',
  'primavera-jerez',
  'pita-pita-jerez',
  'perezoso-jerez',
  'la-granja-jerez',
  'pipos-jerez',
  'el-paje-jerez',
  'el-recreo-jerez',
  'bugui-bugui-jerez',
  'lolita-jerez',
  'el-golfillo-2-jerez',
  'montealto-jerez',
  'pequenos-pasitos-jerez',
  'bambu-jerez',
  'el-sonajero-jerez',
  'montealto-ii-jerez',
  'el-nido-jerez',
  'baby-ilusiones-jerez',
  'colorines-house-jerez',
  'educa-jerez',
  'pequeno-pony-jerez',
  'la-ardilla-pilla-jerez',
  'sol-y-luna-jerez',
  'veo-veo-jerez',
  'luna-de-caramelo-jerez',
  'nazaret-jerez',
  'chupetes-jerez',
  'attendis-preschool-jerez'
);

COMMIT;
