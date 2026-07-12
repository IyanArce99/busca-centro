-- rollback-granada-centers.sql
-- Revierte insert-granada-centers.sql: elimina exactamente los 60
-- centros de Granada insertados por esa migracion, identificados por slug (no por
-- city_slug='granada', para no arrastrar filas de una carga futura distinta o de
-- otra zona que pudiera compartir city_slug por error). No toca Madrid, Barcelona,
-- Valencia, Zaragoza, Murcia, Sevilla, Palma, Malaga ni Alicante.
--
-- IMPORTANTE: si alguno de estos slugs ya existia en la tabla ANTES de correr
-- insert-granada-centers.sql (poco probable, es la primera carga de Granada, pero
-- el INSERT usa ON CONFLICT DO UPDATE), este rollback lo BORRARIA igualmente en vez
-- de restaurar su valor anterior. Verificar antes de ejecutar si hace falta preservar
-- algun centro con estos slugs que no proceda de este sprint.
--
-- Generado: 2026-07-12. Revisar antes de ejecutar.

BEGIN;

DELETE FROM centers
WHERE slug IN (
  'la-asuncion-granada',
  'nazaret-granada',
  'mami-granada',
  'snoopy-granada',
  'babyschool-granada-granada',
  'san-isidoro-granada',
  'aldeas-infantiles-sos-granada',
  'monaita-granada',
  'garabatos-granada',
  'garabatos-de-arabial-granada',
  'pizarrin-granada',
  'colorines-granada',
  'chiquitines-granada',
  'virgen-de-montserrat-granada',
  'almanjayar-granada',
  'cristo-de-la-yedra-granada',
  'portal-de-belen-granada',
  'el-principe-granada',
  'santo-domingo-granada',
  'virgen-del-carmen-granada',
  'virgen-de-loreto-granada',
  'virgen-inmaculada-granada',
  'luna-lunera-granada',
  'centro-de-atencion-familiar-granada',
  'los-mondragones-granada',
  'bubu-granada',
  'juan-latino-granada',
  'pasito-a-pasito-granada',
  'mi-muneco-granada',
  'caracoles-granada',
  'virgen-del-pilar-granada',
  'virgen-madre-granada',
  'san-francisco-javier-granada',
  'mar-de-agata-granada',
  'bola-de-oro-granada',
  'la-guarde-granada',
  'la-casa-de-oikodoro-granada',
  'mofletes-granada',
  'platero-granada',
  'las-perlas-granada',
  'parchis-granada',
  'piopio-granada',
  'suena-by-nerea-bedmar-granada',
  'erase-una-vez-granada',
  'santa-rosalia-1-granada',
  'n-college-granada',
  'ohana-barbara-molina-valladares-granada',
  'nemomarlin-granada-granada',
  'the-globe-granada',
  'pulpitos-granada',
  'gaviota-granada',
  'arlequin-granada',
  'duende-granada',
  'maria-inmaculada-granada',
  'la-cartuja-granada',
  'amanecer-granada',
  'los-angeles-granada',
  'luna-granada',
  'belen-granada',
  'alqueria-granada'
);

-- No se borra la fila de 'granada' en cities: otras entidades (futuros centros,
-- SEO pages) podrian depender de que la ciudad siga existiendo. Si se quiere revertir
-- tambien eso, hacerlo aparte y a mano.

COMMIT;
