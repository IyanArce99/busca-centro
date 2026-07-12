-- rollback-las-palmas-centers.sql
-- Revierte insert-las-palmas-centers.sql: elimina exactamente los 37
-- centros de Las Palmas de Gran Canaria insertados por esa migracion, identificados
-- por slug (no por city_slug='las-palmas-de-gran-canaria', para no arrastrar filas
-- de una carga futura distinta o de otra zona que pudiera compartir city_slug por
-- error). No toca ninguna de las 9 zonas ya integradas (Madrid, Barcelona,
-- Valencia, Zaragoza, Murcia, Sevilla, Palma, Malaga, Alicante).
--
-- IMPORTANTE: si alguno de estos slugs ya existia en la tabla ANTES de correr
-- insert-las-palmas-centers.sql (poco probable, es la primera carga de Las Palmas
-- de Gran Canaria, pero el INSERT usa ON CONFLICT DO UPDATE), este rollback lo
-- BORRARIA igualmente en vez de restaurar su valor anterior. Verificar antes de
-- ejecutar si hace falta preservar algun centro con estos slugs que no proceda de
-- este sprint.
--
-- Generado: 2026-07-12. Revisar antes de ejecutar.

BEGIN;

DELETE FROM centers
WHERE slug IN (
  'escuela-infantil-municipal-pocahontas-las-palmas-de-gran-canaria',
  'escuela-infantil-municipal-heidi-las-palmas-de-gran-canaria',
  'escuela-infantil-municipal-la-sirenita-las-palmas-de-gran-canaria',
  'escuela-infantil-municipal-pluto-las-palmas-de-gran-canaria',
  'escuela-infantil-municipal-bambi-las-palmas-de-gran-canaria',
  'escuela-infantil-municipal-dumbo-las-palmas-de-gran-canaria',
  'escuela-infantil-municipal-la-carrucha-las-palmas-de-gran-canaria',
  'escuela-infantil-municipal-pinocho-las-palmas-de-gran-canaria',
  'escuela-infantil-municipal-blancanieves-las-palmas-de-gran-canaria',
  'escuela-infantil-municipal-princesa-tenesoya-las-palmas-de-gran-canaria',
  'escuela-infantil-municipal-los-pitufos-las-palmas-de-gran-canaria',
  'anita-conrad-las-palmas-de-gran-canaria',
  'garabato-las-palmas-de-gran-canaria',
  'la-gallina-turuleta-las-palmas-de-gran-canaria',
  'el-barquito-las-palmas-de-gran-canaria',
  'first-steps-las-palmas-de-gran-canaria',
  'pizquito-las-palmas-de-gran-canaria',
  'micole-de-vegueta-las-palmas-de-gran-canaria',
  'domingo-alonso-las-palmas-de-gran-canaria',
  'la-piruleta-las-palmas-de-gran-canaria',
  'marpe-infantil-las-palmas-de-gran-canaria',
  'el-patio-de-mi-casa-las-palmas-de-gran-canaria',
  'tambi-1-las-palmas-de-gran-canaria',
  'tambi-2-las-palmas-de-gran-canaria',
  'el-patio-de-mi-casa-7-palmas-las-palmas-de-gran-canaria',
  'nueva-atlantida-las-palmas-de-gran-canaria',
  'little-star-las-palmas-de-gran-canaria',
  'mafalda-las-palmas-de-gran-canaria',
  'la-blanca-paloma-las-palmas-de-gran-canaria',
  'cascaron-las-palmas-de-gran-canaria',
  'los-jaimitos-las-palmas-de-gran-canaria',
  'la-manzana-arenales-las-palmas-de-gran-canaria',
  'el-arbolito-las-palmas-de-gran-canaria',
  'mis-peques-las-palmas-de-gran-canaria',
  'la-casita-de-los-ninos-las-palmas-de-gran-canaria',
  'children-s-world-las-palmas-de-gran-canaria',
  'montessori-tafira-las-palmas-de-gran-canaria'
);

-- No se borra la fila de 'las-palmas-de-gran-canaria' en cities: otras entidades
-- (futuros centros, SEO pages) podrian depender de que la ciudad siga existiendo.
-- Si se quiere revertir tambien eso, hacerlo aparte y a mano.

COMMIT;
