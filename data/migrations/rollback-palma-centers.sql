-- rollback-palma-centers.sql
-- Revierte insert-palma-centers.sql: elimina exactamente los 75
-- centros de Palma insertados por esa migracion, identificados por slug (no
-- por city_slug='palma', para no arrastrar filas de una carga futura
-- distinta bajo el mismo city_slug).
-- No toca Madrid, Barcelona, Valencia, Zaragoza ni Murcia.
--
-- IMPORTANTE: si alguno de estos slugs ya existia en la tabla ANTES de correr
-- insert-palma-centers.sql (poco probable, era la primera carga de Palma,
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
  'angelets-de-llum-palma',
  'asima-palma',
  'atlas-escoleta-palma',
  'baberitos-palma',
  'baberitos-tenis-palma',
  'can-alonso-palma',
  'ca-nostra-palma',
  'castell-encantat-palma',
  'ciutat-antiga-palma',
  'dues-llunes-escola-dinfants-palma',
  'dulces-suenos-palma',
  'dulces-suenos-ciudad-jardin-palma',
  'escola-nova-palma',
  'escoleta-infantil-gran-mon-palma',
  'escoleta-luis-vives-palma',
  'escoleta-pequeno-da-vinci-palma',
  'escoleta-pessigolles-palma',
  'escoleta-somnis-palma',
  'es-llaut-palma',
  'es-molinar-palma',
  'es-petit-castell-palma',
  'es-pontet-palma',
  'estrelletes-palma',
  'gianni-rodari-palma',
  'hakuna-palma',
  'happy-faces-palma',
  'hobbiton-palma',
  'itaca-palma',
  'itaca-nova-palma',
  'jardines-de-la-infancia-pureza-de-maria-palma',
  'kaia-palma',
  'koala-palma',
  'koala-poligon-palma',
  'la-sirenita-palma',
  'lluna-de-paper-palma',
  'mama-osa-palma',
  'maria-mut-i-mandilego-palma',
  'meraki-palma',
  'momo-palma',
  'mon-petito-palma',
  'nanai-palma',
  'nuestra-senora-de-la-providencia-palma',
  'nuestra-senora-de-la-providencia-palma-2',
  'palma-palma',
  'patim-patam-palma',
  'paula-torres-palma',
  'pekes-palma',
  'petit-angelet-palma',
  'pinocho-palma',
  'popeye-palma',
  'rin-tin-tin-palma',
  'ropit-palma',
  'sa-capcaneta-palma',
  'sa-miloca-palma',
  'santa-catalina-palma',
  'santa-creu-palma',
  'sant-agusti-palma',
  'sant-francesc-dassis-palma',
  'sarenal-palma',
  'sestel-palma',
  'siervas-de-jesus-sagrado-corazon-palma',
  'siete-enanitos-palma',
  'sol-solet-palma',
  'son-espanyolet-palma',
  'son-espases-palma',
  'son-ferriol-palma',
  'son-fuster-nou-palma',
  'son-llatzer-palma',
  'son-roca-palma',
  'sweet-dreams-palma',
  'teringa-palma',
  'verge-de-la-salut-palma',
  'virgen-de-loreto-palma',
  'wabi-sabi-palma',
  'wonderland-nursery-palma'
);

-- No se borra la fila de 'palma' en cities: otras entidades (futuros
-- centros, SEO pages) podrian depender de que la ciudad siga existiendo.
-- Si se quiere revertir tambien eso, hacerlo aparte y a mano.

COMMIT;
