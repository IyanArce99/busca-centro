-- rollback-valladolid-centers.sql
-- Revierte insert-valladolid-centers.sql: elimina exactamente los 42
-- centros de Valladolid insertados por esa migracion, identificados por slug (no por
-- city_slug='valladolid', para no arrastrar filas de una carga futura distinta o de
-- otra zona que pudiera compartir city_slug por error). No toca Madrid, Barcelona,
-- Valencia, Zaragoza, Murcia, Sevilla, Palma, Malaga, Alicante, Las Palmas, Granada
-- ni Cordoba.
--
-- IMPORTANTE: si alguno de estos slugs ya existia en la tabla ANTES de correr
-- insert-valladolid-centers.sql (poco probable, es la primera carga de Valladolid,
-- pero el INSERT usa ON CONFLICT DO UPDATE), este rollback lo BORRARIA igualmente en
-- vez de restaurar su valor anterior. Verificar antes de ejecutar si hace falta
-- preservar algun centro con estos slugs que no proceda de este sprint.
--
-- Generado: 2026-07-12. Revisar antes de ejecutar. NO EJECUTADO POR EL AGENTE.

BEGIN;

DELETE FROM centers
WHERE slug IN (
  'amanecer-valladolid',
  'arbol-sabio-valladolid',
  'arco-iris-valladolid',
  'argentinas-valladolid',
  'caballito-blanco-valladolid',
  'campanilla-valladolid',
  'casa-de-ninas-y-ninos-maestro-claudio-lopez-serrano-valladolid',
  'casa-de-ninas-y-ninos-pajarillos-valladolid',
  'cascabel-valladolid',
  'cascanueces-valladolid',
  'chupetin-valladolid',
  'cubillas-jardin-de-recreo-valladolid',
  'el-despertador-infantil-2010-valladolid',
  'el-globo-valladolid',
  'el-principito-valladolid',
  'el-tobogan-valladolid',
  'fantasia-valladolid',
  'hakuna-matata-valladolid',
  'happy-kids-house-valladolid',
  'kid-s-garden-2-valladolid',
  'kid-s-garden-3-valladolid',
  'la-abeja-maya-valladolid',
  'la-casa-de-los-ninos-valladolid',
  'la-ciguena-valladolid',
  'la-cometa-valladolid',
  'la-luna-azul-bilingue-valladolid',
  'la-suite-infantil-valladolid',
  'luna-magica-valladolid',
  'mafalda-y-guille-valladolid',
  'mama-kokeshi-valladolid',
  'mi-bosque-encantado-valladolid',
  'mi-pequeno-cole-valladolid',
  'mis-primeros-pasitos-valladolid',
  'noelia-valladolid',
  'okapi-valladolid',
  'pequena-luna-valladolid',
  'platero-valladolid',
  'romer-valladolid',
  'san-antonio-valladolid',
  'santa-monica-valladolid',
  'trastes-san-cristobal-valladolid',
  'trastes-valladolid'
);

-- No se borra la fila de 'valladolid' en cities: otras entidades (futuros centros,
-- SEO pages) podrian depender de que la ciudad siga existiendo. Si se quiere revertir
-- tambien eso, hacerlo aparte y a mano.

COMMIT;
