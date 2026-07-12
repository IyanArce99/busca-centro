-- rollback-alicante-centers.sql
-- Revierte insert-alicante-centers.sql: elimina exactamente los 37
-- centros de Alicante insertados por esa migracion, identificados por slug (no por
-- city_slug='alicante', para no arrastrar filas de una carga futura distinta o de
-- otra zona que pudiera compartir city_slug por error). No toca Madrid, Barcelona,
-- Valencia, Zaragoza, Murcia, Sevilla, Palma ni ninguna otra ciudad.
--
-- IMPORTANTE: si alguno de estos slugs ya existia en la tabla ANTES de correr
-- insert-alicante-centers.sql (poco probable, es la primera carga de Alicante, pero
-- el INSERT usa ON CONFLICT DO UPDATE), este rollback lo BORRARIA igualmente en vez
-- de restaurar su valor anterior. Verificar antes de ejecutar si hace falta preservar
-- algun centro con estos slugs que no proceda de este sprint.
--
-- Generado: 2026-07-12. Revisar antes de ejecutar.

BEGIN;

DELETE FROM centers
WHERE slug IN (
  'ei-benacantil-alicante',
  'ei-el-tossalet-alicante',
  'ei-rayuela-alicante',
  'escuela-infantil-municipal-els-xiquets-alicante',
  'escuela-infantil-municipal-siete-enanitos-alicante',
  'ciudad-infantil-san-jorge-alicante',
  'vistahermosa-family-school-alicante',
  'montessori-alicante',
  'angel-de-la-guarda-alicante',
  'elisa-tomas-yusti-alicante',
  'nido-alicante',
  'nuestra-escuela-garabatos-alicante',
  'la-mar-salada-alicante',
  'gran-via-parque-aventura-alicante',
  'princesa-mercedes-alicante',
  'picapiedra-alicante',
  'gran-via-alicante-alicante',
  'pequeno-mundo-alicante',
  'hormiguitas-alicante',
  'la-cometa-alicante',
  'los-olivos-2-alicante',
  'peter-pan-alicante',
  'colorin-colorado-alicante',
  'ninon-alicante',
  'la-mar-salada-condomina-alicante',
  'el-almendro-alicante',
  'acuarelas-alicante',
  'britania-alicante',
  'mi-cole-el-solet-alicante',
  'little-land-alicante',
  'kid-s-garden-alicante',
  'children-isla-tabarca-alicante',
  'acuarelas-2-alicante',
  'princesa-mercedes-babel-alicante',
  'googie-s-alicante',
  'somos-colores-alicante',
  'gran-via-pau-i-alicante'
);

-- No se borra la fila de 'alicante' en cities: otras entidades (futuros centros,
-- SEO pages) podrian depender de que la ciudad siga existiendo. Si se quiere revertir
-- tambien eso, hacerlo aparte y a mano.

COMMIT;
