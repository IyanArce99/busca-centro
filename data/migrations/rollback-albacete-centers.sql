-- rollback-albacete-centers.sql
-- Revierte insert-albacete-centers.sql: elimina exactamente los 27
-- centros de Albacete capital insertados por esa migracion, identificados por slug (no por
-- city_slug='albacete', para no arrastrar filas de una carga futura distinta o de otra zona
-- que pudiera compartir city_slug por error). No toca Madrid, Barcelona, Valencia, Zaragoza,
-- Murcia, Sevilla, Palma, Alicante, Malaga, Las Palmas, Cordoba, Granada, Valladolid, Jerez de
-- la Frontera, Castellon de la Plana ni ninguna otra ciudad.
--
-- IMPORTANTE: si alguno de estos slugs ya existia en la tabla ANTES de correr
-- insert-albacete-centers.sql (poco probable, es la primera carga de Albacete, pero el INSERT
-- usa ON CONFLICT DO UPDATE), este rollback lo BORRARIA igualmente en vez de restaurar su valor
-- anterior. Verificar antes de ejecutar si hace falta preservar algun centro con estos slugs
-- que no proceda de este sprint.
--
-- Generado: 2026-07-12. Revisar antes de ejecutar.

BEGIN;

DELETE FROM centers
WHERE slug IN (
  'escuela-infantil-ensanche-albacete',
  'escuela-infantil-hermanos-falco-albacete',
  'escuela-infantil-san-pablo-albacete',
  'escuela-infantil-paseo-de-la-cuba-albacete',
  'escuela-infantil-los-almendros-albacete',
  'escuela-infantil-vereda-albacete',
  'escuela-infantil-san-pedro-mortero-albacete',
  'escuela-infantil-el-tren-azul-albacete',
  'escuela-infantil-virgen-de-los-llanos-albacete',
  'escuela-infantil-los-girasoles-albacete',
  'escuela-infantil-el-pilar-albacete',
  'escuela-infantil-mitete-albacete',
  'escuela-infantil-blabla-albacete',
  'bambini-trazos-albacete',
  'escuela-bambini-albacete',
  'escuela-infantil-mundo-de-color-albacete',
  'guarderia-sonrisas-albacete',
  'escuela-infantil-carrusel-albacete',
  'colegio-san-cristobal-escuela-infantil-albacete',
  'escuela-infantil-la-cometa-albacete',
  'los-mundos-de-noa-albacete',
  'escuela-infantil-ludus-albacete',
  'escuelas-infantiles-aire-libre-i-albacete',
  'escuelas-infantiles-aire-libre-ii-albacete',
  'guarderia-tulgarita-albacete',
  'escuela-infantil-la-escuelita-albacete',
  'escuela-infantil-rayuela-albacete'
);

-- No se borra la fila de 'albacete' en cities: otras entidades (futuros centros, SEO pages)
-- podrian depender de que la ciudad siga existiendo. Si se quiere revertir tambien eso,
-- hacerlo aparte y a mano.

COMMIT;
