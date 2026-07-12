-- rollback-cartagena-centers.sql
-- Revierte insert-cartagena-centers.sql: elimina exactamente los 17 centros
-- de Cartagena insertados por esa migracion, identificados por slug (no por
-- city_slug='cartagena', para no arrastrar filas de una carga futura
-- distinta). No toca Madrid, Barcelona, Valencia, Murcia ni ninguna otra
-- ciudad ya integrada.
--
-- IMPORTANTE: si alguno de estos slugs ya existia en la tabla ANTES de
-- correr insert-cartagena-centers.sql (poco probable, era la primera carga
-- de Cartagena, pero el INSERT usa ON CONFLICT DO UPDATE), este rollback lo
-- BORRARIA igualmente en vez de restaurar su valor anterior. Verificar
-- antes de ejecutar si hace falta preservar algun centro con estos slugs
-- que no proceda de este sprint.
--
-- Generado: 2026-07-12. Revisar antes de ejecutar. NO EJECUTADO por el
-- agente que lo genero.

BEGIN;

DELETE FROM centers
WHERE slug IN (
  'eim-barrio-peral-cartagena',
  'eim-la-concepcion-cartagena',
  'eim-la-milagrosa-cartagena',
  'eim-la-palma-cartagena',
  'eim-pozo-estrecho-cartagena',
  'eim-san-isidoro-cartagena',
  'eim-villalba-cartagena',
  'eim-virgen-de-la-caridad-cartagena',
  'eim-vista-alegre-cartagena',
  'eim-bambi-cartagena',
  'eim-la-aljorra-cartagena',
  'alevines-cartagena',
  'pepico-paluco-cartagena',
  'nice-day-cartagena',
  'mediterraneo-cartagena',
  'el-pais-de-nunca-jamas-cartagena',
  'la-cometa-de-los-dolores-cartagena'
);

-- No se borra la fila de 'cartagena' en cities: otras entidades (futuros
-- centros, SEO pages) podrian depender de que la ciudad siga existiendo.
-- Si se quiere revertir tambien eso, hacerlo aparte y a mano.

COMMIT;
