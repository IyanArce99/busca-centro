-- rollback_insert_murcia_centers.sql
-- Revierte insert-murcia-centers.sql: elimina exactamente los 52 centros de
-- Murcia insertados por esa migracion, identificados por slug (no por
-- city_slug='murcia', para no arrastrar filas de una carga futura distinta).
-- No toca Madrid, Barcelona, Valencia ni ninguna otra ciudad.
--
-- IMPORTANTE: si alguno de estos slugs ya existia en la tabla ANTES de correr
-- insert-murcia-centers.sql (poco probable, era la primera carga de Murcia,
-- pero el INSERT usa ON CONFLICT DO UPDATE), este rollback lo BORRARIA
-- igualmente en vez de restaurar su valor anterior. Verificar antes de
-- ejecutar si hace falta preservar algun centro con estos slugs que no
-- proceda de este sprint.
--
-- Generado: 2026-07-12. Revisar antes de ejecutar. NO EJECUTADO por el
-- agente que lo genero.

BEGIN;

DELETE FROM centers
WHERE slug IN (
  'bambi-murcia',
  'futurines-s-l-l-murcia',
  'virgen-de-la-fuensanta-murcia',
  'ntra-sra-de-la-fuensanta-murcia',
  'los-molinos-murcia',
  'pequenas-sonrisas-murcia',
  'educa-murcia',
  'abenarabi-murcia',
  'nico-murcia',
  'el-chupete-murcia',
  'las-claras-de-la-flota-murcia',
  'girasoles-murcia',
  'solcitos-murcia',
  'la-paz-murcia',
  'chiquitin-murcia',
  'pompitas-com-murcia',
  'jc1-murcia',
  'arco-iris-murcia',
  'infante-juan-manuel-murcia',
  'san-basilio-murcia',
  'sol-y-luna-murcia',
  'nice-day-school-murcia',
  'el-jardin-de-julia-murcia',
  'initial-school-murcia',
  'crecemos-murcia',
  'escuela-murciana-de-primera-infancia-murcia',
  'el-sitio-de-tu-recreo-murcia',
  'el-lugarico-murcia',
  'los-rosales-murcia',
  'el-atelier-de-marte-murcia',
  'villapeques-murcia',
  'mirasierra-murcia',
  'reina-victoria-murcia',
  'nubes-de-papel-murcia',
  'erase-una-vez-murcia',
  'la-naranja-murcia',
  'beniajan-murcia',
  'aepio-murcia',
  'la-ermita-murcia',
  'mi-pequena-escuela-murcia',
  'el-arbolico-murcia',
  'san-roque-murcia',
  'la-rivera-murcia',
  'campanilla-murcia',
  'guadalupe-murcia',
  'origami-centro-de-educacion-infantil-bilingue-murcia',
  'torreaguera-murcia',
  'anitos-felices-murcia',
  'el-atelier-de-la-luna-murcia',
  'bambino-murcia',
  'ntra-sra-de-los-angeles-murcia',
  'ntra-sra-del-carmen-murcia'
);

-- No se borra la fila de 'murcia' en cities: otras entidades (futuros
-- centros, SEO pages) podrian depender de que la ciudad siga existiendo.
-- Si se quiere revertir tambien eso, hacerlo aparte y a mano.

COMMIT;
