-- rollback-castellon-centers.sql
-- Revierte insert-castellon-centers.sql: elimina exactamente los 27
-- centros de Castello de la Plana insertados por esa migracion, identificados por slug (no por
-- city_slug='castellon-de-la-plana', para no arrastrar filas de una carga futura distinta o de
-- otra zona que pudiera compartir city_slug por error). No toca Madrid, Barcelona, Valencia,
-- Zaragoza, Murcia, Sevilla, Palma, Alicante, Malaga, Las Palmas, Cordoba, Granada ni ninguna
-- otra ciudad.
--
-- IMPORTANTE: si alguno de estos slugs ya existia en la tabla ANTES de correr
-- insert-castellon-centers.sql (poco probable, es la primera carga de Castello de la Plana, pero
-- el INSERT usa ON CONFLICT DO UPDATE), este rollback lo BORRARIA igualmente en vez
-- de restaurar su valor anterior. Verificar antes de ejecutar si hace falta preservar
-- algun centro con estos slugs que no proceda de este sprint.
--
-- Generado: 2026-07-12. Revisar antes de ejecutar.

BEGIN;

DELETE FROM centers
WHERE slug IN (
  'ei-nuestra-senora-de-lourdes-castellon-de-la-plana',
  'ei-mar-de-somnis-castellon-de-la-plana',
  'escuela-infantil-municipal-los-duendes-castellon-de-la-plana',
  'escuela-infantil-municipal-chupetes-castellon-de-la-plana',
  'escuela-infantil-municipal-biberons-castellon-de-la-plana',
  'escuela-infantil-municipal-peucs-castellon-de-la-plana',
  'escuela-infantil-san-cristobal-castellon-de-la-plana',
  'cei-los-angeles-castellon-de-la-plana',
  'mikole-castellon-de-la-plana',
  'lom-castellon-de-la-plana',
  'la-jirafa-castellon-de-la-plana',
  'iep-bebes-castellon-de-la-plana',
  'fabulinus-castellon-de-la-plana',
  'la-papallona-menuda-castellon-de-la-plana',
  'picarol-castellon-de-la-plana',
  'la-jirafa-ii-castellon-de-la-plana',
  'kids-garden-castellon-de-la-plana',
  'la-lluna-uji-castellon-de-la-plana',
  'fabulinus-ribalta-castellon-de-la-plana',
  'apapachoa-castellon-de-la-plana',
  'la-marieta-castellon-de-la-plana',
  'els-sentits-castellon-de-la-plana',
  'primers-passos-castellon-de-la-plana',
  'primers-passos-sensal-castellon-de-la-plana',
  'sirius-castellon-de-la-plana',
  'primers-passos-censal-ii-castellon-de-la-plana',
  'contam-un-conte-castellon-de-la-plana'
);

-- No se borra la fila de 'castellon-de-la-plana' en cities: otras entidades (futuros centros,
-- SEO pages) podrian depender de que la ciudad siga existiendo. Si se quiere revertir
-- tambien eso, hacerlo aparte y a mano.

COMMIT;
