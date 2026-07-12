-- rollback-salamanca-centers.sql
-- Revierte insert-salamanca-centers.sql: elimina exactamente los 15
-- centros de Salamanca insertados por esa migracion, identificados por slug (no por
-- city_slug='salamanca', para no arrastrar filas de una carga futura distinta o de
-- otra zona que pudiera compartir city_slug por error). No toca Madrid, Barcelona,
-- Valencia, Zaragoza, Murcia, Sevilla, Palma, Malaga, Alicante, Las Palmas, Cordoba,
-- Granada, Valladolid, Jerez de la Frontera ni Castellon de la Plana.
--
-- IMPORTANTE: si alguno de estos slugs ya existia en la tabla ANTES de correr
-- insert-salamanca-centers.sql (poco probable, es la primera carga de Salamanca,
-- pero el INSERT usa ON CONFLICT DO UPDATE), este rollback lo BORRARIA igualmente en
-- vez de restaurar su valor anterior. Verificar antes de ejecutar si hace falta
-- preservar algun centro con estos slugs que no proceda de este sprint.
--
-- Generado: 2026-07-12. Revisar antes de ejecutar. NO EJECUTADO POR EL AGENTE.

BEGIN;

DELETE FROM centers
WHERE slug IN (
  'lazarillo-de-tormes-salamanca',
  'san-bernardo-salamanca',
  'virgen-de-la-vega-salamanca',
  'los-pizarrales-salamanca',
  'el-rollo-salamanca',
  'garrido-salamanca',
  'el-zurguen-salamanca',
  'psn-bicos-salamanca',
  'chispitinas-salamanca',
  'educa-babys-salamanca',
  'tebeo-salamanca',
  'aula-pimenton-maestro-avila-salamanca',
  'mumakids-salamanca',
  'mi-mama-me-mima-salamanca',
  'el-tren-salamanca'
);

-- No se borra la fila de 'salamanca' en cities: otras entidades (futuros centros,
-- SEO pages) podrian depender de que la ciudad siga existiendo. Si se quiere revertir
-- tambien eso, hacerlo aparte y a mano.

COMMIT;
