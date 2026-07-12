-- rollback-zaragoza-centers.sql
-- Revierte insert-zaragoza-centers.sql: elimina exactamente los 59
-- centros de Zaragoza insertados por esa migracion, identificados por slug (no por
-- city_slug='zaragoza', para no arrastrar filas de una carga futura distinta o de
-- otra zona que pudiera compartir city_slug por error). No toca Madrid, Barcelona,
-- Valencia ni ninguna otra ciudad.
--
-- IMPORTANTE: si alguno de estos slugs ya existia en la tabla ANTES de correr
-- insert-zaragoza-centers.sql (poco probable, es la primera carga de Zaragoza, pero
-- el INSERT usa ON CONFLICT DO UPDATE), este rollback lo BORRARIA igualmente en vez
-- de restaurar su valor anterior. Verificar antes de ejecutar si hace falta preservar
-- algun centro con estos slugs que no proceda de este sprint.
--
-- Generado: 2026-07-12. Revisar antes de ejecutar.

BEGIN;

DELETE FROM centers
WHERE slug IN (
  'escuela-infantil-municipal-los-vientos-zaragoza',
  'escuela-infantil-municipal-maria-urrea-zaragoza',
  'escuela-infantil-municipal-el-bosque-zaragoza',
  'escuela-infantil-municipal-parque-bruil-zaragoza',
  'escuela-infantil-municipal-el-anden-zaragoza',
  'escuela-infantil-municipal-pirineos-zaragoza',
  'escuela-infantil-municipal-villacampa-zaragoza',
  'escuela-infantil-municipal-el-tren-zaragoza',
  'escuela-infantil-municipal-la-pirana-zaragoza',
  'escuela-infantil-municipal-los-ibones-zaragoza',
  'escuela-infantil-municipal-brioletas-zaragoza',
  'escuela-infantil-municipal-la-paz-zaragoza',
  'escuela-infantil-municipal-parque-venecia-zaragoza',
  'escuela-de-educacion-infantil-aragon-zaragoza',
  'escuela-de-educacion-infantil-inmaculada-concepcion-zaragoza',
  'escuela-de-educacion-infantil-monsalud-zaragoza',
  'escuela-de-educacion-infantil-santa-maria-del-pilar-zaragoza',
  'escuela-de-educacion-infantil-nuestra-senora-de-loreto-zaragoza',
  'nanyland-san-francisco-zaragoza',
  'bosque-ternura-zaragoza',
  'peluche-zaragoza',
  'zarapeques-zaragoza',
  'pequenos-venecianos-zaragoza',
  'las-torres-de-montecanal-zaragoza',
  'heidi-zaragoza',
  'divina-pastora-zaragoza',
  'virgen-de-guadalupe-zaragoza',
  'jesus-reparador-zaragoza',
  'la-locomotora-zaragoza',
  'nuestra-senora-de-la-paz-zaragoza',
  'duendeduca-zaragoza',
  'el-tren-chu-chu-zaragoza',
  'la-virgen-nina-zaragoza',
  'el-arka-zaragoza',
  'fundacion-el-refugio-zaragoza',
  'bolandrina-zaragoza',
  'el-carmen-zaragoza',
  'andarines-zaragoza',
  'educando-zaragoza',
  'ntra-sra-de-los-dolores-zaragoza',
  'zagalines-zaragoza',
  'nanyland-puerto-venecia-zaragoza',
  'nemomarlin-paseo-de-sagasta-zaragoza',
  'tic-tac-zaragoza',
  'fundacion-la-caridad-zaragoza',
  'nanyland-hispanidad-zaragoza',
  'arco-iris-zaragoza',
  'pequenos-maestros-zaragoza',
  'mi-cole-zaragoza',
  'patinete-zaragoza',
  'madre-de-dios-de-begona-zaragoza',
  'lenguatrapo-zaragoza',
  'el-manzano-zaragoza',
  'chicotes-zaragoza',
  'cu-cu-tas-tas-zaragoza',
  'schoolhouse-via-iberica-zaragoza',
  'chip-y-chop-zaragoza',
  'el-barquito-de-papel-zaragoza',
  'chiquitines-ii-zaragoza'
);

-- No se borra la fila de 'zaragoza' en cities: otras entidades (futuros centros,
-- SEO pages) podrian depender de que la ciudad siga existiendo. Si se quiere revertir
-- tambien eso, hacerlo aparte y a mano.

COMMIT;
