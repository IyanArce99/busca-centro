-- ============================================================
-- UPDATE 003 — Enriquecimiento de 194 centros restantes de Madrid
-- Generado: 2026-07-02
-- Fuentes: ayto-escuelas-infantiles.csv, ayto-centros-educativos.csv,
--          cam-centros-educativos.csv
-- REQUIERE: 001_enrich_centers.sql y 002_update_10_centers.sql ejecutados.
-- ============================================================
-- Solo modifica los 194 centros excluidos del update 002.
-- No toca: id, slug, city_slug, status, name, is_verified,
--          is_claimed, street (dirección), long_description, images.
-- ============================================================

BEGIN;

-- 2 SEMILLAS [cam]
UPDATE centers SET
  short_description        = 'Escuela infantil privada ubicada en el distrito de Hortaleza. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = '7b9517ba-29d0-4fab-a994-929e162e7cd0';

-- AFUERA III A [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Niño Jesus',
  latitude                 = 40.40776454467921,
  longitude                = -3.673033880862709,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=32b47b503a71c010VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Niño Jesus, distrito Retiro. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = 'f54356b4-7c1f-4e31-a653-51e1d198c458';

-- AFUERA III B [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Niño Jesus',
  latitude                 = 40.40862111078754,
  longitude                = -3.67291277265501,
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos','comedor','horario-ampliado'],
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=e4c47b503a71c010VgnVCM1000000b205a0aRCRD',
  short_description        = 'Guardería privada ubicada en el barrio de Niño Jesus, distrito Retiro. Atiende el primer ciclo (0 a 3 años). Cuenta con comedor, horario ampliado según la información pública disponible.',
  verification_status      = 'pending_manual_review',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  data_conflicts           = '{"phone":{"current":"915516439","proposed":"915528554","reason":"ayto-infant indica teléfono diferente","status":"pending_manual_review"}}'::jsonb,
  updated_at              = NOW()
WHERE id = '0e00f2d0-538b-4991-97df-88a6bbc966c6';

-- AGARIMO [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Gaztambide',
  latitude                 = 40.43426126799022,
  longitude                = -3.714869605740796,
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos','comedor'],
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=8edb13db5b71c010VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Gaztambide, distrito Chamberí. Atiende el primer ciclo (0 a 3 años). Cuenta con comedor según la información pública disponible.',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = 'cdcdcd36-1d03-4ec0-a5cf-0a35106cccaa';

-- ALARIA ARAVACA NURSERY SCHOOL [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Aravaca',
  latitude                 = 40.4629920353333,
  longitude                = -3.7933309478248125,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=411f80428daf1610VgnVCM1000001d4a900aRCRD',
  short_description        = 'Guardería privada ubicada en el barrio de Aravaca, distrito Moncloa-Aravaca. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = '969bf22e-0d0f-4a3d-b0af-e0b48906ad20';

-- ALARIA NUEVOS MINISTERIOS NURSERY SCHOOL [cam]
UPDATE centers SET
  short_description        = 'Guardería privada ubicada en el distrito de Chamartín. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = 'f1f29a13-e243-44e5-a3d1-d6e9ba6053c4';

-- ALARIA SERRANO NURSEY SCHOOL [cam]
UPDATE centers SET
  short_description        = 'Escuela infantil privada ubicada en el distrito de Chamartín. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = '91d2d752-5f82-4c64-8379-6a716aedc868';

-- ALBA LUCERO [cam]
UPDATE centers SET
  short_description        = 'Escuela infantil privada ubicada en el distrito de Chamartín. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = '8ea46217-68eb-4e89-ba86-80f6daefe79e';

-- ALICIA [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Arguelles',
  latitude                 = 40.42793901360149,
  longitude                = -3.7188934091365997,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=85648899fc81c010VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Arguelles, distrito Moncloa-Aravaca. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = '1dab63de-d43d-41bc-9a5d-7257639bb8e5';

-- ALICIA II [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Arguelles',
  latitude                 = 40.42793901360149,
  longitude                = -3.7188934091365997,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=85648899fc81c010VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Arguelles, distrito Moncloa-Aravaca. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'pending_manual_review',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  data_conflicts           = '{"phone":{"current":"915503774","proposed":"915484132","reason":"ayto-infant indica teléfono diferente","status":"pending_manual_review"}}'::jsonb,
  updated_at              = NOW()
WHERE id = 'ebde4f53-c43e-46ab-9e18-004bd974d395';

-- ALLEGRA [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Aravaca',
  latitude                 = 40.45635178594441,
  longitude                = -3.7728559783314006,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=70d4782a95eb2610VgnVCM1000001d4a900aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Aravaca, distrito Moncloa-Aravaca. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = 'd072830a-ceeb-4d14-8a77-3bca3b5618d4';

-- ANA DE AUSTRIA [ayto-municipal]
UPDATE centers SET
  neighborhood_barrio      = 'Valdefuentes',
  latitude                 = 40.49552153813781,
  longitude                = -3.655736850911649,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=8d4006112d3b7210VgnVCM2000000c205a0aRCRD',
  short_description        = 'Escuela infantil pública ubicada en el barrio de Valdefuentes, distrito Hortaleza. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'partially_verified',
  confidence_level         = 'high',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = '91926c07-f673-4623-911e-f4009fee5c9d';

-- ANDAL [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Niño Jesus',
  latitude                 = 40.408487217027755,
  longitude                = -3.672699299598766,
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos','comedor','horario-ampliado'],
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=a2bc7589f451c010VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Niño Jesus, distrito Retiro. Atiende el primer ciclo (0 a 3 años). Cuenta con comedor, horario ampliado según la información pública disponible.',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = '921d8b54-2244-4de8-8c10-bf69806b183b';

-- ANDAL II [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Niño Jesus',
  latitude                 = 40.408487217027755,
  longitude                = -3.672699299598766,
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos','comedor','horario-ampliado'],
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=a2bc7589f451c010VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Niño Jesus, distrito Retiro. Atiende el primer ciclo (0 a 3 años). Cuenta con comedor, horario ampliado según la información pública disponible.',
  verification_status      = 'pending_manual_review',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  data_conflicts           = '{"phone":{"current":"915523229","proposed":"915514858","reason":"ayto-infant indica teléfono diferente","status":"pending_manual_review"}}'::jsonb,
  updated_at              = NOW()
WHERE id = 'b9cb3561-1f71-4873-b2f2-e1d35a0e79e2';

-- ANTONIO MERCERO [ayto-municipal]
UPDATE centers SET
  neighborhood_barrio      = 'Casa De Campo',
  phone                    = '915400319',
  latitude                 = 40.42943683896261,
  longitude                = -3.731764974179636,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=fdf343c4d873e610VgnVCM2000001f4a900aRCRD',
  short_description        = 'Escuela infantil pública ubicada en el barrio de Casa De Campo, distrito Moncloa-Aravaca. Atiende el primer ciclo (0 a 3 años). Cuenta con comedor, horario ampliado según la información pública disponible.',
  verification_status      = 'partially_verified',
  confidence_level         = 'high',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = '0a9991e0-dd87-4bb9-ae42-ced9db754ac6';

-- ARCANGEL [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Niño Jesus',
  latitude                 = 40.408968326456666,
  longitude                = -3.673623367576611,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=1d657b503a71c010VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil concertada ubicada en el barrio de Niño Jesus, distrito Retiro. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = 'd0cf3120-bbf4-4207-a85a-1f616f1c951b';

-- B.R.A. INSTITUCION ORGAZ [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Piovera',
  latitude                 = 40.45444784463797,
  longitude                = -3.6453366825114863,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=329499d98fc2b610VgnVCM1000001d4a900aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Piovera, distrito Hortaleza. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = '4c1cb5b6-8a04-47ef-a64e-cbf99fd11d23';

-- BOREAL DREAMING TOGETHER [cam]
UPDATE centers SET
  short_description        = 'Guardería privada ubicada en el distrito de Hortaleza. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = 'eb0f284a-a6d6-4d31-b80f-711c85e83be7';

-- BUEN CONSEJO [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Aravaca',
  latitude                 = 40.45864003177543,
  longitude                = -3.7668103979030385,
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos','comedor'],
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=5b5e13db5b71c010VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Aravaca, distrito Moncloa-Aravaca. Atiende el primer ciclo (0 a 3 años). Cuenta con comedor según la información pública disponible.',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = '4c97ca77-36c7-4a3d-b8d2-8ffa01938c97';

-- BULARAS INIA [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Ciudad Universitaria',
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=d87b2961c05a6110VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil pública ubicada en el barrio de Ciudad Universitaria, distrito Moncloa-Aravaca. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = '23c85dad-5ef1-4b17-84c8-899098f2a537';

-- CAN-TA-CHIMUTRI (SOL Y LUNA) [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Valdezarza',
  latitude                 = 40.46754013448187,
  longitude                = -3.723609179087372,
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos','comedor'],
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=0a14f3216571c010VgnVCM1000000b205a0aRCRD',
  short_description        = 'Guardería privada ubicada en el barrio de Valdezarza, distrito Moncloa-Aravaca. Atiende el primer ciclo (0 a 3 años). Cuenta con comedor según la información pública disponible.',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = 'b819f76f-9bb3-4ade-a32f-8854b48a8467';

-- CARANA VALDEMARIN [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Valdemarin',
  latitude                 = 40.46575530116354,
  longitude                = -3.781871585924663,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=84e7d4bf8117d110VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Valdemarin, distrito Moncloa-Aravaca. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'pending_manual_review',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  data_conflicts           = '{"phone":{"current":"609483989","proposed":"913573789","reason":"ayto-infant indica teléfono diferente","status":"pending_manual_review"}}'::jsonb,
  updated_at              = NOW()
WHERE id = 'c442d882-1877-49d4-8ac2-3d2ec1039740';

-- CARRUSEL [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Prosperidad',
  latitude                 = 40.44773694661014,
  longitude                = -3.666934862729459,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=bc24f3216571c010VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Prosperidad, distrito Chamartín. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = '45848e76-0aee-4e37-b6d7-5d27adb12633';

-- CASA DEL NIÑO [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Nueva España',
  latitude                 = 40.46707998240384,
  longitude                = -3.683769986965903,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=c5e7f3216571c010VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Nueva España, distrito Chamartín. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = 'ad9568f5-bba5-4d47-a083-847cd19d397b';

-- CASA NIDO [cam]
UPDATE centers SET
  short_description        = 'Escuela infantil privada ubicada en el distrito de Arganzuela. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = '0d88e41b-fdb8-4d20-8cb5-f75f3efe609b';

-- CASITA MARAVILLAS [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Legazpi',
  latitude                 = 40.390792114910155,
  longitude                = -3.691245484883511,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=63776cafc88a5110VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Legazpi, distrito Arganzuela. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'pending_manual_review',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  data_conflicts           = '{"phone":{"current":"663932715","proposed":"916494353","reason":"ayto-infant indica teléfono diferente","status":"pending_manual_review"}}'::jsonb,
  updated_at              = NOW()
WHERE id = '73ea21b4-8232-4572-8c3e-84723bde2b76';

-- CASITA MARAVILLAS BABY [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Legazpi',
  latitude                 = 40.390792114910155,
  longitude                = -3.691245484883511,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=63776cafc88a5110VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Legazpi, distrito Arganzuela. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'pending_manual_review',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  data_conflicts           = '{"phone":{"current":"692807137","proposed":"916494353","reason":"ayto-infant indica teléfono diferente","status":"pending_manual_review"}}'::jsonb,
  updated_at              = NOW()
WHERE id = '5d8654b0-8f87-410e-a593-36c594400195';

-- CASITA MARAVILLAS NEBULOSAS [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Delicias',
  latitude                 = 40.39478248963883,
  longitude                = -3.6853004598120984,
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos','comedor'],
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=3bd26fd3249de410VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Delicias, distrito Arganzuela. Atiende el primer ciclo (0 a 3 años). Cuenta con comedor según la información pública disponible.',
  verification_status      = 'pending_manual_review',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  data_conflicts           = '{"phone":{"current":"692807137","proposed":"911726059","reason":"ayto-infant indica teléfono diferente","status":"pending_manual_review"}}'::jsonb,
  updated_at              = NOW()
WHERE id = '14c7c3a5-c2b3-4f2d-bdb5-5c43fe938c2a';

-- CHAMBERINES [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Trafalgar',
  latitude                 = 40.43685480495305,
  longitude                = -3.7018096586040827,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=2393e2ea83a30110VgnVCM2000000c205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Trafalgar, distrito Chamberí. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = '30f81571-d3e3-451f-bd88-297a766ab26f';

-- CHIQUI [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Arapiles',
  latitude                 = 40.43379239446997,
  longitude                = -3.707613833815629,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=1254f3216571c010VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Arapiles, distrito Chamberí. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = '208762a5-4d7d-4700-95c3-dd9daa09773f';

-- CHIQUI TIN ALCANTARA [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Arapiles',
  latitude                 = 40.43379239446997,
  longitude                = -3.707613833815629,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=1254f3216571c010VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Arapiles, distrito Salamanca. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'pending_manual_review',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  data_conflicts           = '{"phone":{"current":"914028151","proposed":"915933096","reason":"ayto-infant indica teléfono diferente","status":"pending_manual_review"}}'::jsonb,
  updated_at              = NOW()
WHERE id = 'eb42112b-a9d9-4586-b60d-f0c7434889b7';

-- CHULY [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Acacias',
  latitude                 = 40.39948693077921,
  longitude                = -3.7059818534223012,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=ab5be0e1f181c010VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Acacias, distrito Arganzuela. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = '1f94ea42-780a-40a2-9732-3fa25b04b9c1';

-- CIUDAD JARDIN [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Hispanoamerica',
  latitude                 = 40.456816072250916,
  longitude                = -3.6703859136466317,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=9721b79d7c67d110VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Hispanoamerica, distrito Chamartín. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = 'bf73c21a-2089-40e1-b535-9f25ecf3a006';

-- COCOLAN CVE [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Vista Alegre',
  latitude                 = 40.38268180414603,
  longitude                = -3.746651126405099,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=3d85d7e01a5c2210VgnVCM2000000c205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Vista Alegre, distrito Arganzuela. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'pending_manual_review',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  data_conflicts           = '{"phone":{"current":"914739382","proposed":"914660840","reason":"ayto-infant indica teléfono diferente","status":"pending_manual_review"}}'::jsonb,
  updated_at              = NOW()
WHERE id = 'd92d9646-333c-4f58-bdce-5cff334edb33';

-- COCORICO [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Prosperidad',
  latitude                 = 40.44129497691426,
  longitude                = -3.6716938167924216,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=5221b7aad30b7110VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Prosperidad, distrito Chamartín. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = 'a38e2b2e-c080-4906-9b86-90ed0f79b07c';

-- COLEGIO MADRID FSM-SOTILLO [cam]
UPDATE centers SET
  short_description        = 'Guardería privada ubicada en el distrito de Hortaleza. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = 'd2803c85-fcae-4862-b1b9-5e2617575e24';

-- COLEGIO SEI DOS PARQUES [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Acacias',
  latitude                 = 40.3973494112018,
  longitude                = -3.7034142744354863,
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos','comedor','horario-ampliado'],
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=109bae10c471c010VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil concertada ubicada en el barrio de Acacias, distrito Arganzuela. Atiende el primer ciclo (0 a 3 años). Cuenta con comedor, horario ampliado según la información pública disponible.',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = '48f0a4aa-5da7-4f4e-977c-e364c14e57fa';

-- CONSEJO SUP.INVESTIGACIONES CIENTIFICAS [cam]
UPDATE centers SET
  short_description        = 'Escuela infantil pública ubicada en el distrito de Chamartín. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = 'a7289dcb-834b-4ac0-b8d1-1c988fd72d2c';

-- CUARTEL GENERAL DEL EJERCITO DEL AIRE [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Arguelles',
  latitude                 = 40.432593580178384,
  longitude                = -3.719390985599627,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=a74978a79da4f110VgnVCM2000000c205a0aRCRD',
  short_description        = 'Escuela infantil pública ubicada en el barrio de Arguelles, distrito Moncloa-Aravaca. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = '6f230452-1f84-4fec-960b-9718f7feb043';

-- CUCHITOS [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Lista',
  latitude                 = 40.434807286078666,
  longitude                = -3.676533942680635,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=39a458304648a210VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Lista, distrito Salamanca. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = '260a708d-6036-44ef-927b-a502fe4c38eb';

-- CUCOS HOME VALDEBEBAS [cam]
UPDATE centers SET
  short_description        = 'Escuela infantil privada ubicada en el distrito de Hortaleza. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = 'bfb4230d-ac27-4903-a3f9-26e015aea8d4';

-- CUCUTRAS [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Canillas',
  latitude                 = 40.46426562497467,
  longitude                = -3.637091129196918,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=80174b6faa61c010VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Canillas, distrito Hortaleza. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'pending_manual_review',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  data_conflicts           = '{"phone":{"current":"913002257","proposed":"625350143","reason":"ayto-infant indica teléfono diferente","status":"pending_manual_review"}}'::jsonb,
  updated_at              = NOW()
WHERE id = '2613e96c-9379-4d6d-adeb-d21ceb774fd4';

-- CUNA DE JESUS [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Guindalera',
  latitude                 = 40.43498241594533,
  longitude                = -3.671218339550121,
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos','comedor'],
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=8fa4f3216571c010VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil concertada ubicada en el barrio de Guindalera, distrito Salamanca. Atiende el primer ciclo (0 a 3 años). Cuenta con comedor según la información pública disponible.',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = 'a4e9b8f2-24f1-46b2-816d-e553fb95368e';

-- DALLINGTON INFANTS [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Piovera',
  latitude                 = 40.45209551419661,
  longitude                = -3.6417877842979554,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=d8278d4432e9e510VgnVCM1000001d4a900aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Piovera, distrito Hortaleza. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = 'db9ff33b-0248-44a8-9959-ef4f214fc1bb';

-- DE PEQUES [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Casco H.vallecas',
  latitude                 = 40.37797688217212,
  longitude                = -3.618842875177412,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=ac28e2c057e03210VgnVCM2000000c205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Casco H.vallecas, distrito Retiro. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'pending_manual_review',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  data_conflicts           = '{"phone":{"current":"915514433","proposed":"913315966","reason":"ayto-infant indica teléfono diferente","status":"pending_manual_review"}}'::jsonb,
  updated_at              = NOW()
WHERE id = '9038eb6c-8ab3-4614-8faf-90439fee4a8b';

-- DIABOLO [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Delicias',
  email                    = 'diaboloei@hotmail.es',
  latitude                 = 40.398666517536626,
  longitude                = -3.695674239964103,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=a51a3604759de410VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Delicias, distrito Arganzuela. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'pending_manual_review',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  data_conflicts           = '{"phone":{"current":"669440272","proposed":"911301510","reason":"ayto-infant indica teléfono diferente","status":"pending_manual_review"}}'::jsonb,
  updated_at              = NOW()
WHERE id = 'b44b6862-5b7b-4a04-84f4-d89ab51d5020';

-- DINA CONDADO [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Costillares',
  latitude                 = 40.480698522143776,
  longitude                = -3.668889109311785,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=e4d4f3216571c010VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Costillares, distrito Hortaleza. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'pending_manual_review',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  data_conflicts           = '{"phone":{"current":"913021746","proposed":"913027574","reason":"ayto-infant indica teléfono diferente","status":"pending_manual_review"}}'::jsonb,
  updated_at              = NOW()
WHERE id = 'fa73f2b1-c52c-4870-b9e1-19e0522a0f12';

-- DINA CONDADO-2 [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Costillares',
  latitude                 = 40.480698522143776,
  longitude                = -3.668889109311785,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=e4d4f3216571c010VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Costillares, distrito Hortaleza. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'pending_manual_review',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  data_conflicts           = '{"phone":{"current":"913021746","proposed":"913027574","reason":"ayto-infant indica teléfono diferente","status":"pending_manual_review"}}'::jsonb,
  updated_at              = NOW()
WHERE id = '2e007e17-485f-4a2d-9056-b6e948c72c3b';

-- DIONISIA PLAZA [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Aravaca',
  latitude                 = 40.462178140857326,
  longitude                = -3.776616778579928,
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos','comedor'],
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=92f43b54d771c010VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Aravaca, distrito Moncloa-Aravaca. Atiende el primer ciclo (0 a 3 años). Cuenta con comedor según la información pública disponible.',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = '51abe604-b40c-4235-bca0-3d2578328c34';

-- DOMO [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Pinar Del Rey',
  latitude                 = 40.4718533201172,
  longitude                = -3.648051105759709,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=fd674b6faa61c010VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Pinar Del Rey, distrito Hortaleza. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'pending_manual_review',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  data_conflicts           = '{"phone":{"current":"660492189","proposed":"911383601","reason":"ayto-infant indica teléfono diferente","status":"pending_manual_review"}}'::jsonb,
  updated_at              = NOW()
WHERE id = '42be7897-cacc-4673-baec-cd907b9d10b4';

-- DOÑA FRANCISQUITA [ayto-municipal]
UPDATE centers SET
  neighborhood_barrio      = 'Valdefuentes',
  latitude                 = 40.47868156347292,
  longitude                = -3.6302312847478593,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=22fa44dd9d3b7210VgnVCM2000000c205a0aRCRD',
  short_description        = 'Escuela infantil pública ubicada en el barrio de Valdefuentes, distrito Hortaleza. Atiende el primer ciclo (0 a 3 años). Cuenta con comedor, horario ampliado según la información pública disponible.',
  verification_status      = 'partially_verified',
  confidence_level         = 'high',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = '8b7d2d9e-b5d2-41e5-a503-d4172e6c05da';

-- DONDE ESTAN LAS LLAVES [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Delicias',
  latitude                 = 40.39647748432474,
  longitude                = -3.691138657498989,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=e64df2836bd63310VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Delicias, distrito Arganzuela. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'pending_manual_review',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  data_conflicts           = '{"phone":{"current":"638947062","proposed":"915396444","reason":"ayto-infant indica teléfono diferente","status":"pending_manual_review"}}'::jsonb,
  updated_at              = NOW()
WHERE id = 'bed55563-8a3f-4e45-96b6-20159ceecfb8';

-- EDUCANDO [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Adelfas',
  latitude                 = 40.40475688861089,
  longitude                = -3.6712479758825918,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=65e3a1c78317d110VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Adelfas, distrito Retiro. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = 'adf0638e-64c9-4eff-b466-f633c8685806';

-- EDUCANDO JUNTOS [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Adelfas',
  latitude                 = 40.40308585723576,
  longitude                = -3.6719973746197607,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=441ae1d8d2401310VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Adelfas, distrito Retiro. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = '0ab27673-d227-4579-9318-bbb8345393fe';

-- EDUCANDO PITUFOS [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Niño Jesus',
  latitude                 = 40.41168265136974,
  longitude                = -3.6747229665527876,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=3639c05ef571c010VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Niño Jesus, distrito Retiro. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = 'cc6fdb28-c0e1-49ad-bda8-acdb63efa94f';

-- EDUCANDO V [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Adelfas',
  latitude                 = 40.40475688861089,
  longitude                = -3.6712479758825918,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=65e3a1c78317d110VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Adelfas, distrito Retiro. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = '6df60e08-f83c-478a-816c-719cda19f66c';

-- EIPA ESCUELA INFANTIL PARQUE DE LAS AVENIDAS [cam]
UPDATE centers SET
  short_description        = 'Escuela infantil privada ubicada en el distrito de Salamanca. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = 'aaf3ad28-9ca8-4985-a4ac-eab39910bf3b';

-- EL BARBERILLO DE LAVAPIES [ayto-municipal]
UPDATE centers SET
  neighborhood_barrio      = 'Delicias',
  latitude                 = 40.39371756597044,
  longitude                = -3.6901560198197485,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=d96b9b6d163b7210VgnVCM2000000c205a0aRCRD',
  short_description        = 'Escuela infantil pública ubicada en el barrio de Delicias, distrito Arganzuela. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'pending_manual_review',
  confidence_level         = 'high',
  verified_at              = '2026-07-02T00:00:00Z',
  data_conflicts           = '{"phone":{"current":"915397437","proposed":"910739659","reason":"ayto-municipal indica teléfono diferente","status":"pending_manual_review"}}'::jsonb,
  updated_at              = NOW()
WHERE id = '951abe34-4a16-4f7e-8b42-73b27fe7b99d';

-- EL BOSQUE [ayto-municipal]
UPDATE centers SET
  neighborhood_barrio      = 'Palos De Moguer',
  latitude                 = 40.4043520221113,
  longitude                = -3.695544214066272,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=c40ce0e1f181c010VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil pública ubicada en el barrio de Palos De Moguer, distrito Arganzuela. Atiende el primer ciclo (0 a 3 años). Cuenta con comedor, horario ampliado según la información pública disponible.',
  verification_status      = 'partially_verified',
  confidence_level         = 'high',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = '1921daf0-4a0d-435b-ba0e-cbada96321c0';

-- EL CARMEN [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Pinar Del Rey',
  latitude                 = 40.474027977949675,
  longitude                = -3.653828943198728,
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos','comedor'],
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=e24eae10c471c010VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil pública ubicada en el barrio de Pinar Del Rey, distrito Hortaleza. Atiende el primer ciclo (0 a 3 años). Cuenta con comedor según la información pública disponible.',
  verification_status      = 'pending_manual_review',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  data_conflicts           = '{"phone":{"current":"913029923","proposed":"917634509","reason":"ayto-infant indica teléfono diferente","status":"pending_manual_review"}}'::jsonb,
  updated_at              = NOW()
WHERE id = '282f942f-8512-451c-8db2-2b694a373478';

-- EL COLUMPIO DE CLAUDIA [cam]
UPDATE centers SET
  short_description        = 'Escuela infantil privada ubicada en el distrito de Hortaleza. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = '362babbc-12a5-44c7-9a4b-097ef7eaa145';

-- EL DUENDE TRAVIESO II [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Acacias',
  latitude                 = 40.4034400591062,
  longitude                = -3.709228572338776,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=8fe3c5b12798a210VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Acacias, distrito Arganzuela. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'pending_manual_review',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  data_conflicts           = '{"phone":{"current":"639656728","proposed":"915303265","reason":"ayto-infant indica teléfono diferente","status":"pending_manual_review"}}'::jsonb,
  updated_at              = NOW()
WHERE id = '7bf4feed-7181-4dcb-93be-ad78e0e359ef';

-- EL JARDÍN DE LAS MARIPOSAS [sin match]
UPDATE centers SET
  short_description        = 'Escuela infantil privada ubicada en el distrito de Hortaleza. Atiende el primer ciclo (0 a 3 años). La ficha está pendiente de verificación.',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = '1839263c-81e7-4862-9faa-4ca973e3bd14';

-- EL JARDIN DE LOS GENIOS [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Arguelles',
  latitude                 = 40.42628925884782,
  longitude                = -3.715837097545746,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=18e56da0aa81c010VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Arguelles, distrito Moncloa-Aravaca. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = 'fc7f4a34-0646-405f-8330-8e5626f65cd7';

-- EL NIDO DEL BUHO [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Arapiles',
  latitude                 = 40.43614870935858,
  longitude                = -3.705327629417968,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=5c12beedef73e510VgnVCM2000001f4a900aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Arapiles, distrito Chamberí. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = '78ed5308-5c04-4f93-808d-f64d69a2b65e';

-- EL OSITO [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Prosperidad',
  latitude                 = 40.44967203671333,
  longitude                = -3.6656921711778954,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=a84873f0b6e8a210VgnVCM2000000c205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Prosperidad, distrito Chamartín. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = 'f8138a09-ba59-4cb7-a8b9-196d03b82c09';

-- EL OSITO 2 [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Prosperidad',
  latitude                 = 40.44967203671333,
  longitude                = -3.6656921711778954,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=a84873f0b6e8a210VgnVCM2000000c205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Prosperidad, distrito Chamartín. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'pending_manual_review',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  data_conflicts           = '{"phone":{"current":"914159758","proposed":"914134642","reason":"ayto-infant indica teléfono diferente","status":"pending_manual_review"}}'::jsonb,
  updated_at              = NOW()
WHERE id = '3425aacc-416b-4ff2-9d71-85cef21e5be8';

-- EL OSITO DE LUIS DE LARRAINZA [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Ciudad Jardin',
  latitude                 = 40.45076081408548,
  longitude                = -3.669040308958262,
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos','comedor'],
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=1c1bc05ef571c010VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Ciudad Jardin, distrito Chamartín. Atiende el primer ciclo (0 a 3 años). Cuenta con comedor según la información pública disponible.',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = '9ad9f96f-2c3d-4c10-8d8a-ae55599a24b3';

-- EL PARQUE [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Piovera',
  latitude                 = 40.450207848823084,
  longitude                = -3.6393994682111694,
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos','comedor'],
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=d497ae10c471c010VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Piovera, distrito Chamartín. Atiende el primer ciclo (0 a 3 años). Cuenta con comedor según la información pública disponible.',
  verification_status      = 'pending_manual_review',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  data_conflicts           = '{"phone":{"current":"914132798","proposed":"913000058","reason":"ayto-infant indica teléfono diferente","status":"pending_manual_review"}}'::jsonb,
  updated_at              = NOW()
WHERE id = '8fa8261d-3430-4387-955d-31459fe9ca11';

-- EL PARQUE DE LA PIOVERA [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Palomas',
  latitude                 = 40.4510512165605,
  longitude                = -3.61513751410999,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=cbd30a2b706c2210VgnVCM2000000c205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Palomas, distrito Hortaleza. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'pending_manual_review',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  data_conflicts           = '{"phone":{"current":"913205697","proposed":"91320569","reason":"ayto-infant indica teléfono diferente","status":"pending_manual_review"}}'::jsonb,
  updated_at              = NOW()
WHERE id = '7f6b35ae-f63e-452a-8592-84a69e731e61';

-- EL REINO DEL REVÉS [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Chopera',
  latitude                 = 40.399291456037886,
  longitude                = -3.699604715730976,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=bf2fef854c8e7110VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Chopera, distrito Arganzuela. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = '2de776c4-c0c7-42ff-85be-c7dbcfcd41d5';

-- EL SITIO DE TU RECREO [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Trafalgar',
  latitude                 = 40.43214902349191,
  longitude                = -3.699343855523591,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=2e05cb8cc0663510VgnVCM2000001f4a900aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Trafalgar, distrito Chamberí. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = 'f184e72e-5acf-4b7f-a911-1c2c6413a996';

-- EL SOL [ayto-municipal]
UPDATE centers SET
  neighborhood_barrio      = 'Nueva España',
  latitude                 = 40.46091554103502,
  longitude                = -3.670320512563348,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=afaea4ea6871c010VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil pública ubicada en el barrio de Nueva España, distrito Chamartín. Atiende el primer ciclo (0 a 3 años). Cuenta con comedor, horario ampliado según la información pública disponible.',
  verification_status      = 'pending_manual_review',
  confidence_level         = 'high',
  verified_at              = '2026-07-02T00:00:00Z',
  data_conflicts           = '{"phone":{"current":"913532644","proposed":"913532642","reason":"ayto-municipal indica teléfono diferente","status":"pending_manual_review"}}'::jsonb,
  updated_at              = NOW()
WHERE id = '9ca0475a-bac6-48e8-bef3-e5a3b7229d50';

-- EL TREN DE ARGANDA [ayto-municipal]
UPDATE centers SET
  neighborhood_barrio      = 'Niño Jesus',
  phone                    = '690180359',
  latitude                 = 40.41471562186326,
  longitude                = -3.673091236764771,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=677352fb94cd8610VgnVCM1000001d4a900aRCRD',
  short_description        = 'Escuela infantil pública ubicada en el barrio de Niño Jesus, distrito Retiro. Atiende el primer ciclo (0 a 3 años). Cuenta con comedor, horario ampliado según la información pública disponible.',
  verification_status      = 'partially_verified',
  confidence_level         = 'high',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = 'bb3fa50c-187f-464d-8cdf-6279acedfea6';

-- EL TREN DE LA FRESA [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Delicias',
  latitude                 = 40.39924356726499,
  longitude                = -3.6880677759300298,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=ab4f448d87b8d110VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil pública ubicada en el barrio de Delicias, distrito Arganzuela. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = '9e1832f5-d017-4c20-95a1-caff7a7fe138';

-- EL TREN DE LOS NIÑOS [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Castilla',
  latitude                 = 40.480060668322494,
  longitude                = -3.674781796395457,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=101d7589f451c010VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Castilla, distrito Chamartín. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = '3a416091-27e8-427c-86fb-5d8062750a6a';

-- EL TREN DE LOS NIÑOS II [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Castilla',
  latitude                 = 40.480060668322494,
  longitude                = -3.674781796395457,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=101d7589f451c010VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Castilla, distrito Chamartín. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'pending_manual_review',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  data_conflicts           = '{"phone":{"current":"913025639","proposed":"917660801","reason":"ayto-infant indica teléfono diferente","status":"pending_manual_review"}}'::jsonb,
  updated_at              = NOW()
WHERE id = 'b6360786-f44b-4056-8aad-975586709549';

-- EL VALLE [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Vallehermoso',
  latitude                 = 40.443852530502504,
  longitude                = -3.7154075006615277,
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos','comedor','horario-ampliado'],
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=ce1ea4ea6871c010VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil pública ubicada en el barrio de Vallehermoso, distrito Chamberí. Atiende el primer ciclo (0 a 3 años). Cuenta con comedor, horario ampliado según la información pública disponible.',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = 'ba5c2626-6ac2-430e-9321-7cf2c7cbfeca';

-- EMBAJADORES [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Chopera',
  latitude                 = 40.396246560150374,
  longitude                = -3.6965920027934485,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=89706da0aa81c010VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Chopera, distrito Arganzuela. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'pending_manual_review',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  data_conflicts           = '{"phone":{"current":"915285536","proposed":"914739150","reason":"ayto-infant indica teléfono diferente","status":"pending_manual_review"}}'::jsonb,
  updated_at              = NOW()
WHERE id = '10fd5c0a-2a91-4aa0-a4e3-3608845e9e83';

-- ESCUELA DE EDUCACION INFANTIL DEL COMPLEJO CUZCO [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Hispanoamerica',
  latitude                 = 40.45833513149752,
  longitude                = -3.6893543428087257,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=d6fc02c3c2b09310VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil pública ubicada en el barrio de Hispanoamerica, distrito Chamartín. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'pending_manual_review',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  data_conflicts           = '{"phone":{"current":"656414096","proposed":"915835449","reason":"ayto-infant indica teléfono diferente","status":"pending_manual_review"}}'::jsonb,
  updated_at              = NOW()
WHERE id = '8e3ec3c2-c8ad-4c71-a0c5-218e10b48a6c';

-- ESCUELA INFANTIL BILINGÜE SUS PEQUEÑOS PASOS-ARTURO SORIA [cam]
UPDATE centers SET
  website                  = 'http://www.colegioarturosoria.org',
  short_description        = 'Escuela infantil privada ubicada en el distrito de Hortaleza. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'pending_manual_review',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  data_conflicts           = '{"phone":{"current":"913882377","proposed":"914157295","reason":"cam indica teléfono diferente","status":"pending_manual_review"}}'::jsonb,
  updated_at              = NOW()
WHERE id = 'ed45e5d8-cef4-4b20-9ae2-fb41ff6090e8';

-- ESCUELA INFANTIL BRAINS MADRID [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Guindalera',
  latitude                 = 40.43203330251085,
  longitude                = -3.670210475227037,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=42d9e9fde2932310VgnVCM2000000c205a0aRCRD',
  short_description        = 'Guardería privada ubicada en el barrio de Guindalera, distrito Salamanca. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = '8ade6798-5b66-479d-b987-e433560cf5ce';

-- ESCUELA INFANTIL DEL CUERPO NACIONAL DE POLICIA [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Canillas',
  latitude                 = 40.467518780269025,
  longitude                = -3.6482689488983264,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=7ebf02c3c2b09310VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil pública ubicada en el barrio de Canillas, distrito Hortaleza. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = '29b6ac59-faa4-420c-b2cc-6c2d489195f4';

-- ESCUELA INFANTIL DELEGACION DE ECONOMIA Y HACIENDA [cam]
UPDATE centers SET
  short_description        = 'Escuela infantil pública ubicada en el distrito de Chamberí. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = '3d4736b3-e0d6-43b2-a902-d228200c8981';

-- ESCUELA INFANTIL MAEC [cam]
UPDATE centers SET
  short_description        = 'Escuela infantil pública ubicada en el distrito de Salamanca. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = '6d354d74-1ad6-4697-a52a-61cc8ce8d574';

-- ESCUELA MONTESSORI MADRID [cam]
UPDATE centers SET
  short_description        = 'Guardería privada ubicada en el distrito de Moncloa-Aravaca. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = 'c71ac4d7-6f24-447e-a355-5a5153139676';

-- ESTUDIO CONDE ORGAZ [cam]
UPDATE centers SET
  short_description        = 'Escuela infantil privada ubicada en el distrito de Hortaleza. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = 'ab3ed14c-8b20-4306-947f-080f6baca7a6';

-- GARABATOS Y OCHO PATOS [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Peña Grande',
  latitude                 = 40.4770033270959,
  longitude                = -3.7230029213484,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=1c1f7d448b51c010VgnVCM2000000c205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Peña Grande, distrito Arganzuela. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'pending_manual_review',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  data_conflicts           = '{"phone":{"current":"914740446","proposed":"913163140","reason":"ayto-infant indica teléfono diferente","status":"pending_manual_review"}}'::jsonb,
  updated_at              = NOW()
WHERE id = 'b3c2a25e-7fe0-4700-b515-570ef4880e6c';

-- GRAN VIA [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Canillas',
  latitude                 = 40.46653241928136,
  longitude                = -3.6490497753986935,
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos','comedor'],
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=b421059cb751c010VgnVCM2000000c205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Canillas, distrito Hortaleza. Atiende el primer ciclo (0 a 3 años). Cuenta con comedor según la información pública disponible.',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = '0dc73047-36fa-45bc-b88a-c8f504da4912';

-- GREENLEAVES MONTESSORI II [cam]
UPDATE centers SET
  short_description        = 'Escuela infantil privada ubicada en el distrito de Moncloa-Aravaca. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = 'ac52291f-097c-42de-88ad-936822cadd2c';

-- GUARDILLA INFANTIL [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Vallehermoso',
  latitude                 = 40.44454745648486,
  longitude                = -3.7122900396933813,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=2b6fed5952a1d110VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil pública ubicada en el barrio de Vallehermoso, distrito Chamberí. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'pending_manual_review',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  data_conflicts           = '{"phone":{"current":"630205015","proposed":"913422147","reason":"ayto-infant indica teléfono diferente","status":"pending_manual_review"}}'::jsonb,
  updated_at              = NOW()
WHERE id = '4cf5b474-5847-4f5d-9b13-b45dec06a1a9';

-- INTERNACIONAL VALDEMARIN [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Valdemarin',
  latitude                 = 40.47117565698537,
  longitude                = -3.7729455659015843,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=7b1292f4cfe8a210VgnVCM2000000c205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Valdemarin, distrito Moncloa-Aravaca. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'pending_manual_review',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  data_conflicts           = '{"phone":{"current":"674501365","proposed":"635220910","reason":"ayto-infant indica teléfono diferente","status":"pending_manual_review"}}'::jsonb,
  updated_at              = NOW()
WHERE id = '4230f252-d7aa-43d5-b116-d3d33cf0a8e5';

-- INTERNATIONAL MONTESSORI KINDERGARTEN [cam]
UPDATE centers SET
  short_description        = 'Guardería privada ubicada en el distrito de Hortaleza. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = '88f6271c-7978-48a4-bbbe-43e042e1dd19';

-- IRIS [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Canillas',
  latitude                 = 40.46099412130099,
  longitude                = -3.643818591045767,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=0c8eeccb20856110VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Canillas, distrito Hortaleza. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = '7fed9cf6-3a8e-4363-aa1b-2b69eb819ddf';

-- IRIS II [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Canillas',
  latitude                 = 40.46099412130099,
  longitude                = -3.643818591045767,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=0c8eeccb20856110VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Canillas, distrito Hortaleza. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'pending_manual_review',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  data_conflicts           = '{"phone":{"current":"917669384","proposed":"913882876","reason":"ayto-infant indica teléfono diferente","status":"pending_manual_review"}}'::jsonb,
  updated_at              = NOW()
WHERE id = '84766903-944b-49f5-b46c-d155f95b1968';

-- JARDIIMAR [cam]
UPDATE centers SET
  short_description        = 'Escuela infantil privada ubicada en el distrito de Arganzuela. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = 'bc6d4257-32f4-4138-804d-0205ec100804';

-- JARDIN DE LAS DELICIAS [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Delicias',
  latitude                 = 40.397389163900975,
  longitude                = -3.692349905497899,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=d26d6245502a3310VgnVCM2000000c205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Delicias, distrito Arganzuela. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = '7cd39706-b41e-4cff-afab-511643654f7b';

-- JARDIN INFANTIL [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Delicias',
  latitude                 = 40.39365769384023,
  longitude                = -3.6941380398407517,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=ea27f3216571c010VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Delicias, distrito Arganzuela. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = '1d1eeb20-8d1f-4756-8c61-a0a5e78e1450';

-- KIDS RETIRO [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Adelfas',
  latitude                 = 40.40357432149011,
  longitude                = -3.670104900262818,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=d805def5ab41c010VgnVCM2000000c205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Adelfas, distrito Retiro. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = '242aa7ba-3c90-4b31-8c3a-3338f154d2c1';

-- KIKA [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Legazpi',
  latitude                 = 40.39082521056264,
  longitude                = -3.6872044462696443,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=f327ad606cc49110VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Legazpi, distrito Arganzuela. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = '44e68835-e79b-453f-a634-280c7f6acf4c';

-- KINDER SANTAMARCA [cam]
UPDATE centers SET
  short_description        = 'Escuela infantil privada ubicada en el distrito de Chamartín. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = '4e626df4-1cad-4935-b8a4-1f117d1f165b';

-- LA ALMUDENA [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Canillas',
  latitude                 = 40.46634990040974,
  longitude                = -3.6332300542597373,
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos','comedor','horario-ampliado'],
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=143ea4ea6871c010VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil pública ubicada en el barrio de Canillas, distrito Hortaleza. Atiende el primer ciclo (0 a 3 años). Cuenta con comedor, horario ampliado según la información pública disponible.',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = 'dfc9ceca-50c2-4842-b3e4-070a4527f14e';

-- LA ARDILLA [ayto-municipal]
UPDATE centers SET
  neighborhood_barrio      = 'Valdefuentes',
  phone                    = '673614692',
  latitude                 = 40.48584075407322,
  longitude                = -3.651798143659265,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=f958fb0b31849610VgnVCM1000001d4a900aRCRD',
  short_description        = 'Escuela infantil pública ubicada en el barrio de Valdefuentes, distrito Hortaleza. Atiende el primer ciclo (0 a 3 años). Cuenta con comedor, horario ampliado según la información pública disponible.',
  verification_status      = 'partially_verified',
  confidence_level         = 'high',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = 'bd48d7a1-e32b-4313-9334-d7a5438714cb';

-- LA BOLA DE CRISTAL [ayto-municipal]
UPDATE centers SET
  neighborhood_barrio      = 'Valdezarza',
  phone                    = '914347262',
  latitude                 = 40.46769867537168,
  longitude                = -3.7156569423684775,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=695552fb94cd8610VgnVCM1000001d4a900aRCRD',
  short_description        = 'Escuela infantil pública ubicada en el barrio de Valdezarza, distrito Moncloa-Aravaca. Atiende el primer ciclo (0 a 3 años). Cuenta con comedor, horario ampliado según la información pública disponible.',
  verification_status      = 'partially_verified',
  confidence_level         = 'high',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = '4df1e9bf-2683-4041-ac79-72ee61c1a8ed';

-- LA CASA DEL RIO - MIRIAM [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Casa De Campo',
  latitude                 = 40.429371584815904,
  longitude                = -3.734635390084493,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=78f7f3216571c010VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Casa De Campo, distrito Moncloa-Aravaca. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = '5a2d153b-8a20-4438-9d11-eb083ac59ef2';

-- LA ESTRELLA INFANTIL [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Estrella',
  latitude                 = 40.41085823340638,
  longitude                = -3.6661934969691106,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=43a8f77644473510VgnVCM2000001f4a900aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Estrella, distrito Retiro. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'pending_manual_review',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  data_conflicts           = '{"phone":{"current":"636492506","proposed":"917653087","reason":"ayto-infant indica teléfono diferente","status":"pending_manual_review"}}'::jsonb,
  updated_at              = NOW()
WHERE id = '61151bb2-0bee-46ea-8e7e-e093f2451934';

-- LA ESTRELLA INFANTIL III [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Estrella',
  latitude                 = 40.41542140804669,
  longitude                = -3.6677749076720123,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=7c3ba269c42fd610VgnVCM1000001d4a900aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Estrella, distrito Retiro. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = '268e0051-c277-4134-aa8c-575f46e0e51c';

-- LA GRAN VIA [ayto-municipal]
UPDATE centers SET
  neighborhood_barrio      = 'Canillas',
  latitude                 = 40.462802758823514,
  longitude                = -3.634435221406373,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=60e944dd9d3b7210VgnVCM2000000c205a0aRCRD',
  short_description        = 'Escuela infantil pública ubicada en el barrio de Canillas, distrito Hortaleza. Atiende el primer ciclo (0 a 3 años). Cuenta con comedor, horario ampliado según la información pública disponible.',
  verification_status      = 'partially_verified',
  confidence_level         = 'high',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = '6e2826da-742f-40c0-87d3-6e0ac7a2bbff';

-- LA JIRAFA [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Canillas',
  latitude                 = 40.46360780794781,
  longitude                = -3.6371202995176346,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=19bbe0e1f181c010VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Canillas, distrito Hortaleza. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = 'a20d8eb1-7b33-45e1-ac2d-da09a0e99651';

-- LA MELONERA [ayto-municipal]
UPDATE centers SET
  neighborhood_barrio      = 'Legazpi',
  phone                    = '910707655',
  latitude                 = 40.39390298324836,
  longitude                = -3.680551491708351,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=a86936d08b9ea610VgnVCM2000001f4a900aRCRD',
  short_description        = 'Escuela infantil pública ubicada en el barrio de Legazpi, distrito Arganzuela. Atiende el primer ciclo (0 a 3 años). Cuenta con comedor, horario ampliado según la información pública disponible.',
  verification_status      = 'partially_verified',
  confidence_level         = 'high',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = '589089df-12df-48ea-b65a-30fd6830227b';

-- LA VIRGEN NIÑA [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'San Juan Bautista',
  latitude                 = 40.44991728603662,
  longitude                = -3.649503120718717,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=a868c05ef571c010VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de San Juan Bautista, distrito Hortaleza. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = '08490f02-a1c3-43ca-aba3-9a154056d7ea';

-- LALY [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Nueva España',
  latitude                 = 40.466098480407766,
  longitude                = -3.6852108903876797,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=62a185a67dac2210VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Nueva España, distrito Chamartín. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = '1a67afb7-567e-427b-abef-02bc5ed31d51';

-- LAR [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Butarque',
  latitude                 = 40.351288540068175,
  longitude                = -3.6803734958787406,
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos','comedor','horario-ampliado'],
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=4ae47b503a71c010VgnVCM1000000b205a0aRCRD',
  short_description        = 'Guardería privada ubicada en el barrio de Butarque, distrito Arganzuela. Atiende el primer ciclo (0 a 3 años). Cuenta con comedor, horario ampliado según la información pública disponible.',
  verification_status      = 'pending_manual_review',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  data_conflicts           = '{"phone":{"current":"666938587","proposed":"917955158","reason":"ayto-infant indica teléfono diferente","status":"pending_manual_review"}}'::jsonb,
  updated_at              = NOW()
WHERE id = '1571c1d9-5254-4312-899d-f5cfccdc5541';

-- LAS ACACIAS [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Ciudad Universitaria',
  latitude                 = 40.456732784350756,
  longitude                = -3.7158271592363117,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=5b78c05ef571c010VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Ciudad Universitaria, distrito Moncloa-Aravaca. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = '5469eeb5-dc48-46b2-a0ff-8c59eb832c4e';

-- LAS NUBES [ayto-municipal]
UPDATE centers SET
  neighborhood_barrio      = 'Pacifico',
  latitude                 = 40.40365358728283,
  longitude                = -3.6842590892111273,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=96b66da0aa81c010VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil pública ubicada en el barrio de Pacifico, distrito Retiro. Atiende el primer ciclo (0 a 3 años). Cuenta con comedor, horario ampliado según la información pública disponible.',
  verification_status      = 'partially_verified',
  confidence_level         = 'high',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = '3f51b9d7-3200-418c-a901-0c60095d2f8d';

-- LAS PLEYADES [ayto-municipal]
UPDATE centers SET
  neighborhood_barrio      = 'Valdefuentes',
  phone                    = '915285261',
  latitude                 = 40.49496785628896,
  longitude                = -3.6201774927951726,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=947c36d08b9ea610VgnVCM2000001f4a900aRCRD',
  short_description        = 'Escuela infantil pública ubicada en el barrio de Valdefuentes, distrito Hortaleza. Atiende el primer ciclo (0 a 3 años). Cuenta con comedor, horario ampliado según la información pública disponible.',
  verification_status      = 'partially_verified',
  confidence_level         = 'high',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = 'aea46d82-c07d-48d6-bfa6-7ac66c2157ba';

-- LAS VIÑAS [ayto-municipal]
UPDATE centers SET
  neighborhood_barrio      = 'Aravaca',
  latitude                 = 40.460576198420775,
  longitude                = -3.7857037462052063,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=ecd66da0aa81c010VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil pública ubicada en el barrio de Aravaca, distrito Moncloa-Aravaca. Atiende el primer ciclo (0 a 3 años). Cuenta con comedor, horario ampliado según la información pública disponible.',
  verification_status      = 'partially_verified',
  confidence_level         = 'high',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = '01366d6b-34b1-4135-8a91-2551e3da3680';

-- LITTLE CLOVERS [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Canillas',
  latitude                 = 40.462742278633314,
  longitude                = -3.654969774618477,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=a86b2521ec8de410VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Canillas, distrito Hortaleza. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'pending_manual_review',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  data_conflicts           = '{"phone":{"current":"696991559","proposed":"911734262","reason":"ayto-infant indica teléfono diferente","status":"pending_manual_review"}}'::jsonb,
  updated_at              = NOW()
WHERE id = '78e5d5e1-3cab-4db3-b85a-87f775e88fd4';

-- LITTLE FEM [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Vallehermoso',
  latitude                 = 40.44515701913572,
  longitude                = -3.718605147983596,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=edd6def5ab41c010VgnVCM2000000c205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Vallehermoso, distrito Chamberí. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = '5415af25-14fb-4d27-8988-8d8d3ab31574';

-- LITTLE WITCH [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Castilla',
  latitude                 = 40.47146653101387,
  longitude                = -3.676252904032727,
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos','comedor'],
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=a2316a62aa8de410VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Castilla, distrito Chamartín. Atiende el primer ciclo (0 a 3 años). Cuenta con comedor según la información pública disponible.',
  verification_status      = 'pending_manual_review',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  data_conflicts           = '{"phone":{"current":"911305715","proposed":"911640682","reason":"ayto-infant indica teléfono diferente","status":"pending_manual_review"}}'::jsonb,
  updated_at              = NOW()
WHERE id = 'ebe5ec06-ad85-4ae4-90c9-dd2dcaabde60';

-- LOS NANOS CHIFLADOS [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Ciudad Jardin',
  latitude                 = 40.44850859843297,
  longitude                = -3.673687810461961,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=a1c7786244932310VgnVCM2000000c205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Ciudad Jardin, distrito Chamartín. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = '4f2ca8c2-cd7e-4028-9046-253cf659f3a0';

-- LOS NIDOS DE MANOTERAS [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Valdefuentes',
  latitude                 = 40.48811638358004,
  longitude                = -3.6713934372168335,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=d092243c1d8e7110VgnVCM1000000b205a0aRCRD',
  short_description        = 'Guardería privada ubicada en el barrio de Valdefuentes, distrito Hortaleza. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = '7bf3662e-c52c-4ec0-a02f-6fd73ab38e1c';

-- LOS PINOS [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Fuente Del Berro',
  latitude                 = 40.42316364191438,
  longitude                = -3.663226401946775,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=d019c05ef571c010VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Fuente Del Berro, distrito Salamanca. Atiende el primer ciclo (0 a 3 años). Cuenta con comedor, horario ampliado según la información pública disponible.',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = 'e57b8e0f-e1f4-4e47-b801-b5615acf8c2c';

-- LUIS BELLO [ayto-municipal]
UPDATE centers SET
  neighborhood_barrio      = 'Prosperidad',
  latitude                 = 40.443633085040005,
  longitude                = -3.6739692982111727,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=8a48d2bec675e010VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil pública ubicada en el barrio de Prosperidad, distrito Chamartín. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'pending_manual_review',
  confidence_level         = 'high',
  verified_at              = '2026-07-02T00:00:00Z',
  data_conflicts           = '{"phone":{"current":"914132979","proposed":"914341779","reason":"ayto-municipal indica teléfono diferente","status":"pending_manual_review"}}'::jsonb,
  updated_at              = NOW()
WHERE id = 'a5f0a48a-102f-45ee-9170-36d984385b43';

-- MABEROGAN VALDEBEBAS [cam]
UPDATE centers SET
  short_description        = 'Escuela infantil privada ubicada en el distrito de Hortaleza. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = '398431aa-2fa4-43cf-8d3e-5570bb9e2506';

-- MAFALDA [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Trafalgar',
  latitude                 = 40.431866199756236,
  longitude                = -3.7014158945794455,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=d66f7d448b51c010VgnVCM2000000c205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Trafalgar, distrito Chamberí. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'pending_manual_review',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  data_conflicts           = '{"phone":{"current":"680366888","proposed":"914475258","reason":"ayto-infant indica teléfono diferente","status":"pending_manual_review"}}'::jsonb,
  updated_at              = NOW()
WHERE id = '421d8c3d-9eb7-4d79-ab38-b34608e5b5bf';

-- MAGOS [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Niño Jesus',
  latitude                 = 40.41577940003545,
  longitude                = -3.6751292792758115,
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos','comedor'],
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=f089c05ef571c010VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Niño Jesus, distrito Retiro. Atiende el primer ciclo (0 a 3 años). Cuenta con comedor según la información pública disponible.',
  verification_status      = 'pending_manual_review',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  data_conflicts           = '{"phone":{"current":"640734319","proposed":"914090609","reason":"ayto-infant indica teléfono diferente","status":"pending_manual_review"}}'::jsonb,
  updated_at              = NOW()
WHERE id = '817f33c5-a1df-4352-b3c0-73743327a9db';

-- MAMA QUECA II [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Pinar Del Rey',
  latitude                 = 40.469151820515734,
  longitude                = -3.651044947288839,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=7e06def5ab41c010VgnVCM2000000c205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Pinar Del Rey, distrito Hortaleza. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'pending_manual_review',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  data_conflicts           = '{"phone":{"current":"913887424","proposed":"913814463","reason":"ayto-infant indica teléfono diferente","status":"pending_manual_review"}}'::jsonb,
  updated_at              = NOW()
WHERE id = '3746a619-9c08-433e-bf15-51a32d8db0ae';

-- MAMATINA [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Aravaca',
  latitude                 = 40.44942071532564,
  longitude                = -3.7820713984695913,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=38ad7589f451c010VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Aravaca, distrito Moncloa-Aravaca. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = '64012e8b-c8d0-42ae-9a42-a4acc88edd2d';

-- MARGARITA SALAS [ayto-municipal]
UPDATE centers SET
  neighborhood_barrio      = 'Pacifico',
  phone                    = '623412950',
  latitude                 = 40.40438324670531,
  longitude                = -3.6729005068427316,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=647fa8d65f0d8710VgnVCM2000001f4a900aRCRD',
  short_description        = 'Escuela infantil pública ubicada en el barrio de Pacifico, distrito Retiro. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'partially_verified',
  confidence_level         = 'high',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = 'aadff91f-1f7f-4e8b-a2bb-ecbcfde37187';

-- MARGOT [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Valdezarza',
  latitude                 = 40.46908701170943,
  longitude                = -3.71680763852872,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=ea666da0aa81c010VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Valdezarza, distrito Moncloa-Aravaca. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = '84cc85e0-e67a-4a33-b463-87a6c0d195fa';

-- MENAGAR [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Hispanoamerica',
  latitude                 = 40.45624445719778,
  longitude                = -3.675722854513903,
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos','comedor'],
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=6ed9c05ef571c010VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Hispanoamerica, distrito Chamartín. Atiende el primer ciclo (0 a 3 años). Cuenta con comedor según la información pública disponible.',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = 'ed231375-a5b8-4fe4-a867-610a3500b107';

-- MI CASITA [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Pinar Del Rey',
  latitude                 = 40.47353371682618,
  longitude                = -3.635845667385439,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=59afd08d3e819110VgnVCM2000000c205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Pinar Del Rey, distrito Hortaleza. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = '98e7d76c-ea25-42a4-b796-1d1ecacc3970';

-- MI PEQUEÑO PLANETA [sin match]
UPDATE centers SET
  short_description        = 'Escuela infantil privada ubicada en el distrito de Salamanca. Atiende el primer ciclo (0 a 3 años). La ficha está pendiente de verificación.',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = 'f041b437-f593-4088-bb79-0388840a503c';

-- MI PRIMER COLE 2 [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Piovera',
  latitude                 = 40.462457851341924,
  longitude                = -3.6249842042981855,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=eabd7589f451c010VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Piovera, distrito Salamanca. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'pending_manual_review',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  data_conflicts           = '{"phone":{"current":"913560066","proposed":"913881215","reason":"ayto-infant indica teléfono diferente","status":"pending_manual_review"}}'::jsonb,
  updated_at              = NOW()
WHERE id = 'bad591e9-7637-414d-952b-59bd44cc68fd';

-- MI PRIMER COLE 4 [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Piovera',
  latitude                 = 40.462457851341924,
  longitude                = -3.6249842042981855,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=eabd7589f451c010VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Piovera, distrito Hortaleza. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'pending_manual_review',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  data_conflicts           = '{"phone":{"current":"913881474","proposed":"913881215","reason":"ayto-infant indica teléfono diferente","status":"pending_manual_review"}}'::jsonb,
  updated_at              = NOW()
WHERE id = '9714633c-2f9c-4d3e-80c6-7515cda502c4';

-- MICOS, MI PRIMER COLE [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'El Viso',
  latitude                 = 40.4468543253188,
  longitude                = -3.686890375186424,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=7edbe0e1f181c010VgnVCM1000000b205a0aRCRD',
  short_description        = 'Guardería privada ubicada en el barrio de El Viso, distrito Chamartín. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = 'f4b7ba3a-8d41-40ca-a807-a92e5b619fcb';

-- MIS-MIS [cam]
UPDATE centers SET
  short_description        = 'Escuela infantil pública ubicada en el distrito de Chamberí. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = 'cac1f1f0-5658-4d44-bb94-d9715d09bcca';

-- MOWGLI [cam]
UPDATE centers SET
  short_description        = 'Escuela infantil pública ubicada en el distrito de Arganzuela. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = '76eb8258-ce5f-463d-ab50-a71a3a610717';

-- MUDARRA [cam]
UPDATE centers SET
  short_description        = 'Escuela infantil pública ubicada en el distrito de Hortaleza. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = '41e497ae-f44c-4876-b842-e66c84385abf';

-- MY KIDS [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Delicias',
  latitude                 = 40.392942618106495,
  longitude                = -3.6916916558271247,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=0f9ceb6159be0210VgnVCM2000000c205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Delicias, distrito Salamanca. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'pending_manual_review',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  data_conflicts           = '{"phone":{"current":"630617063","proposed":"915300127","reason":"ayto-infant indica teléfono diferente","status":"pending_manual_review"}}'::jsonb,
  updated_at              = NOW()
WHERE id = 'ffd31a56-745d-4dd9-bc6e-19b4e4a63080';

-- NAZARET [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Simancas',
  latitude                 = 40.42737829810719,
  longitude                = -3.6263569598518295,
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos','comedor','horario-ampliado'],
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=f2c77b503a71c010VgnVCM1000000b205a0aRCRD',
  short_description        = 'Guardería concertada ubicada en el barrio de Simancas, distrito Chamartín. Atiende el primer ciclo (0 a 3 años). Cuenta con comedor, horario ampliado según la información pública disponible.',
  verification_status      = 'pending_manual_review',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  data_conflicts           = '{"phone":{"current":"915617244","proposed":"913049368","reason":"ayto-infant indica teléfono diferente","status":"pending_manual_review"}}'::jsonb,
  updated_at              = NOW()
WHERE id = 'c562b08b-221d-42c6-885a-c9ee7a8251d8';

-- NEMOMARLIN CHAMBERÍ [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Arapiles',
  latitude                 = 40.433031783064294,
  longitude                = -3.7111781689083876,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=9b00764529301310VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Arapiles, distrito Chamberí. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'pending_manual_review',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  data_conflicts           = '{"phone":{"current":"911404528","proposed":"91404528","reason":"ayto-infant indica teléfono diferente","status":"pending_manual_review"}}'::jsonb,
  updated_at              = NOW()
WHERE id = 'e2a012c7-df53-41bf-b263-9f8990e285f5';

-- NEMOMARLIN CIUDAD JARDIN [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Ciudad Jardin',
  latitude                 = 40.44743126498061,
  longitude                = -3.671495472342756,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=eda3025ffd3ee410VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Ciudad Jardin, distrito Chamartín. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = '566b2631-8266-4a51-8544-d3b322c71767';

-- NEMOMARLIN CONDE DE ORGAZ [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Piovera',
  latitude                 = 40.45648024974503,
  longitude                = -3.6503211271902916,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=4137309364b83310VgnVCM2000000c205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Piovera, distrito Hortaleza. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'pending_manual_review',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  data_conflicts           = '{"phone":{"current":"647830449","proposed":"912812424","reason":"ayto-infant indica teléfono diferente","status":"pending_manual_review"}}'::jsonb,
  updated_at              = NOW()
WHERE id = '2f2ccb55-1503-42f8-aa71-3a647f08ce85';

-- NEMOMARLIN GUINDALERA [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Guindalera',
  latitude                 = 40.43594245302815,
  longitude                = -3.6687872901321534,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=ea18da947d3ee410VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Guindalera, distrito Salamanca. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = '65326fa5-68ac-49be-881c-412d016476c7';

-- NEMOMARLIN PASEO DE LA HABANA [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Hispanoamerica',
  latitude                 = 40.457317667265,
  longitude                = -3.6816660158526244,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=f77aa1f55a301310VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Hispanoamerica, distrito Chamartín. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'pending_manual_review',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  data_conflicts           = '{"phone":{"current":"651721295","proposed":"911166576","reason":"ayto-infant indica teléfono diferente","status":"pending_manual_review"}}'::jsonb,
  updated_at              = NOW()
WHERE id = '5a2ee5b7-5694-4e9d-8020-aaa3c2f28c05';

-- NEMOMARLIN PINTOR ROSALES [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Arguelles',
  latitude                 = 40.42732035257515,
  longitude                = -3.7198652917862693,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=112ac1bdcc3ee410VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Arguelles, distrito Moncloa-Aravaca. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'pending_manual_review',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  data_conflicts           = '{"phone":{"current":"914557535","proposed":"666593130","reason":"ayto-infant indica teléfono diferente","status":"pending_manual_review"}}'::jsonb,
  updated_at              = NOW()
WHERE id = '7073b11f-406b-4156-b350-1fe2cf5ea6f4';

-- NEMOMARLIN RETIRO [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Niño Jesus',
  latitude                 = 40.41094407811531,
  longitude                = -3.6762359780329117,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=b6d69a2929cec310VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Niño Jesus, distrito Retiro. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'pending_manual_review',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  data_conflicts           = '{"phone":{"current":"659894650","proposed":"911733893","reason":"ayto-infant indica teléfono diferente","status":"pending_manual_review"}}'::jsonb,
  updated_at              = NOW()
WHERE id = 'cb98103f-3f15-439b-be5f-e3a8641f5911';

-- NEMOMARLIN SANCHINARRO [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Valdefuentes',
  latitude                 = 40.49094540144197,
  longitude                = -3.6540757111531885,
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos','comedor'],
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=4a55da947d3ee410VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Valdefuentes, distrito Hortaleza. Atiende el primer ciclo (0 a 3 años). Cuenta con comedor según la información pública disponible.',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = '045aaf43-3142-405c-ac2f-40e18383e31b';

-- NUESTRA SEÑORA DE LA PAZ [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Pacifico',
  latitude                 = 40.404845091517394,
  longitude                = -3.6762102912144026,
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos','comedor','horario-ampliado'],
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=c3a2ae10c471c010VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil concertada ubicada en el barrio de Pacifico, distrito Retiro. Atiende el primer ciclo (0 a 3 años). Cuenta con comedor, horario ampliado según la información pública disponible.',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = 'b6243432-bc19-4956-ba03-392a9c2374ac';

-- NUESTRA SEÑORA DE LOS DOLORES [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Arapiles',
  latitude                 = 40.43060607142658,
  longitude                = -3.7056705556061242,
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos','comedor'],
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=51dac05ef571c010VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil concertada ubicada en el barrio de Arapiles, distrito Chamberí. Atiende el primer ciclo (0 a 3 años). Cuenta con comedor según la información pública disponible.',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = 'c37dd7fd-151f-4df1-bf4b-b7561a6db6b2';

-- OSOBUCO [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Prosperidad',
  email                    = 'osobuco1@osobuco.net',
  latitude                 = 40.44919601242804,
  longitude                = -3.665439828669336,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=40ed7589f451c010VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Prosperidad, distrito Chamartín. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = '18560653-1d3f-4fcb-a644-efd32c114c9d';

-- OSOBUCO II [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Prosperidad',
  latitude                 = 40.44919601242804,
  longitude                = -3.665439828669336,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=40ed7589f451c010VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Prosperidad, distrito Chamartín. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'pending_manual_review',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  data_conflicts           = '{"phone":{"current":"914139286","proposed":"914130443","reason":"ayto-infant indica teléfono diferente","status":"pending_manual_review"}}'::jsonb,
  updated_at              = NOW()
WHERE id = 'd84b45f5-b68f-4fab-8125-08076bbce188';

-- PASITOS MAGICOS [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Canillas',
  latitude                 = 40.46228659899211,
  longitude                = -3.64629607235588,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=b1964cba83e03210VgnVCM2000000c205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Canillas, distrito Retiro. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'pending_manual_review',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  data_conflicts           = '{"phone":{"current":"915521713","proposed":"917592288","reason":"ayto-infant indica teléfono diferente","status":"pending_manual_review"}}'::jsonb,
  updated_at              = NOW()
WHERE id = 'e50dbc69-9f18-4868-b384-857c2e848910';

-- PASO A PASO [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Acacias',
  latitude                 = 40.39805083749249,
  longitude                = -3.706579604414225,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=9e3792f4cfe8a210VgnVCM2000000c205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Acacias, distrito Arganzuela. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = '669c81c1-3b8e-4fc8-a584-353c0a07bb39';

-- PEDAGOGIA WALDORF DE ARAVACA [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Aravaca',
  latitude                 = 40.46327554248207,
  longitude                = -3.7901583423651743,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=96958899fc81c010VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Aravaca, distrito Moncloa-Aravaca. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'pending_manual_review',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  data_conflicts           = '{"phone":{"current":"917402047","proposed":"913071210","reason":"ayto-infant indica teléfono diferente","status":"pending_manual_review"}}'::jsonb,
  updated_at              = NOW()
WHERE id = '7cce9d1a-4a72-456c-9019-4f2157443aa3';

-- PEQUEANDO [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Valdefuentes',
  latitude                 = 40.49017980288805,
  longitude                = -3.6492539527578467,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=3b94059b4f1c6510VgnVCM1000001d4a900aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Valdefuentes, distrito Hortaleza. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'pending_manual_review',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  data_conflicts           = '{"phone":{"current":"910234712","proposed":"911376130","reason":"ayto-infant indica teléfono diferente","status":"pending_manual_review"}}'::jsonb,
  updated_at              = NOW()
WHERE id = '70262e7f-ca4b-4355-8f65-dcc1945ba6f4';

-- PEQUEMUN [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Vallehermoso',
  latitude                 = 40.44443736929686,
  longitude                = -3.7169820090268524,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=3bc6def5ab41c010VgnVCM2000000c205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Vallehermoso, distrito Chamberí. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = 'ebc0572d-c29e-488a-8ea4-9a11d810a48b';

-- PEQUEÑECOS PARQUE NORTE [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Costillares',
  latitude                 = 40.4766271394155,
  longitude                = -3.671880642864413,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=b12d581fc57e6110VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Costillares, distrito Hortaleza. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = 'd45d9ea8-6532-4244-938f-49d639038bb9';

-- PINOCHO [cam]
UPDATE centers SET
  short_description        = 'Escuela infantil privada ubicada en el distrito de Retiro. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = '04f8c4bd-ceb8-433a-b59a-a70c3fc1015a';

-- PIPPO [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Prosperidad',
  latitude                 = 40.44210971288812,
  longitude                = -3.671018025319304,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=0b2e7589f451c010VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Prosperidad, distrito Chamartín. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = '72062e3f-8483-4aae-9be8-c69e7e58c6ba';

-- PLANETA ENANO NIÑO JESUS [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Niño Jesus',
  latitude                 = 40.413865110086746,
  longitude                = -3.67697406298161,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=a1f5a71beadb2610VgnVCM2000001f4a900aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Niño Jesus, distrito Retiro. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = '6e0bf701-b1d1-47d9-b91b-723d1d8499a0';

-- PRESCHOOL FEM [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Vallehermoso',
  latitude                 = 40.444308544951745,
  longitude                = -3.717416935434051,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=e80ad5839c52c110VgnVCM1000000b205a0aRCRD',
  short_description        = 'Guardería privada ubicada en el barrio de Vallehermoso, distrito Chamberí. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = '01030122-05cd-49f9-98e0-dbef90390cc9';

-- PROJARDIN DELICIAS [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Delicias',
  latitude                 = 40.39870352710208,
  longitude                = -3.694013103489115,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=0f0cc05ef571c010VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Delicias, distrito Arganzuela. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = '4ec45fc5-a106-4db9-8db0-d3be5ee6baa4';

-- PROJARDIN MADIBA [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Valdefuentes',
  latitude                 = 40.49247416660146,
  longitude                = -3.6118103492686924,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=376bdb909f3ee410VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Valdefuentes, distrito Hortaleza. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'pending_manual_review',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  data_conflicts           = '{"phone":{"current":"628695527","proposed":"912774633","reason":"ayto-infant indica teléfono diferente","status":"pending_manual_review"}}'::jsonb,
  updated_at              = NOW()
WHERE id = 'a044c23a-ea1c-4449-927e-f79001c9bda9';

-- PROJARDIN RETIRO [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Niño Jesus',
  latitude                 = 40.41551531622078,
  longitude                = -3.6725217673452337,
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos','comedor'],
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=aec58899fc81c010VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Niño Jesus, distrito Retiro. Atiende el primer ciclo (0 a 3 años). Cuenta con comedor según la información pública disponible.',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = 'a397737d-837d-48f7-b108-92767f0a488e';

-- RAMON Y CAJAL [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Canillas',
  latitude                 = 40.46132384331896,
  longitude                = -3.658848269617723,
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos','comedor'],
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=605e7589f451c010VgnVCM1000000b205a0aRCRD',
  short_description        = 'Guardería privada ubicada en el barrio de Canillas, distrito Hortaleza. Atiende el primer ciclo (0 a 3 años). Cuenta con comedor según la información pública disponible.',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = '4270b43b-2c05-467b-8ae4-ddad6e685ede';

-- REINA DE LOS ANGELES [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'El Viso',
  latitude                 = 40.450888105604584,
  longitude                = -3.6857521533403865,
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos','comedor'],
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=5bae13db5b71c010VgnVCM1000000b205a0aRCRD',
  short_description        = 'Guardería privada ubicada en el barrio de El Viso, distrito Chamartín. Atiende el primer ciclo (0 a 3 años). Cuenta con comedor según la información pública disponible.',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = '70834c78-3162-438f-903a-621d4eab155f';

-- ROCIO DURCAL [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Valdefuentes',
  latitude                 = 40.490161265717425,
  longitude                = -3.654138896646944,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=456619bcf5e1d110VgnVCM2000000c205a0aRCRD',
  short_description        = 'Escuela infantil pública ubicada en el barrio de Valdefuentes, distrito Hortaleza. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = '08591fa0-d00b-4b14-a313-3582865e5084';

-- ROSA [ayto-municipal]
UPDATE centers SET
  neighborhood_barrio      = 'Valverde',
  latitude                 = 40.50050331171224,
  longitude                = -3.68829881383211,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=d3670dde9b3b7210VgnVCM2000000c205a0aRCRD',
  short_description        = 'Escuela infantil pública ubicada en el barrio de Valverde, distrito Chamartín. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'pending_manual_review',
  confidence_level         = 'high',
  verified_at              = '2026-07-02T00:00:00Z',
  data_conflicts           = '{"phone":{"current":"913501362","proposed":"917344966","reason":"ayto-municipal indica teléfono diferente","status":"pending_manual_review"}}'::jsonb,
  updated_at              = NOW()
WHERE id = 'ebf1b842-9366-43ea-a76f-108f9b14b459';

-- RUIZ JIMENEZ [ayto-municipal]
UPDATE centers SET
  neighborhood_barrio      = 'Guindalera',
  latitude                 = 40.435092812438825,
  longitude                = -3.672374874199507,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=7086def5ab41c010VgnVCM2000000c205a0aRCRD',
  short_description        = 'Escuela infantil pública ubicada en el barrio de Guindalera, distrito Salamanca. Atiende el primer ciclo (0 a 3 años). Cuenta con comedor, horario ampliado según la información pública disponible.',
  verification_status      = 'pending_manual_review',
  confidence_level         = 'high',
  verified_at              = '2026-07-02T00:00:00Z',
  data_conflicts           = '{"phone":{"current":"911694809","proposed":"910590901","reason":"ayto-municipal indica teléfono diferente","status":"pending_manual_review"}}'::jsonb,
  updated_at              = NOW()
WHERE id = 'f37d3024-9b20-48c2-b43f-f334a3a89f67';

-- SAN ALONSO DE OROZCO [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Vallehermoso',
  latitude                 = 40.44574165407967,
  longitude                = -3.717891477757883,
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos','comedor'],
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=53de13db5b71c010VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Vallehermoso, distrito Chamberí. Atiende el primer ciclo (0 a 3 años). Cuenta con comedor según la información pública disponible.',
  verification_status      = 'pending_manual_review',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  data_conflicts           = '{"phone":{"current":"650831333","proposed":"915531097","reason":"ayto-infant indica teléfono diferente","status":"pending_manual_review"}}'::jsonb,
  updated_at              = NOW()
WHERE id = '8490e2e8-37bf-4608-9d00-bbc817eec02b';

-- SAN GABRIEL ARCANGEL [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Valdezarza',
  latitude                 = 40.4650206738044,
  longitude                = -3.7231221198865745,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=51e58899fc81c010VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil concertada ubicada en el barrio de Valdezarza, distrito Moncloa-Aravaca. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = '87e10931-e3a1-44cd-b031-56eee7f154b1';

-- SAN JOSE DE CLUNY [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Valdezarza',
  latitude                 = 40.46505463319585,
  longitude                = -3.711846089608026,
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos','comedor'],
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=7c6cc05ef571c010VgnVCM1000000b205a0aRCRD',
  short_description        = 'Guardería concertada ubicada en el barrio de Valdezarza, distrito Moncloa-Aravaca. Atiende el primer ciclo (0 a 3 años). Cuenta con comedor según la información pública disponible.',
  verification_status      = 'pending_manual_review',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  data_conflicts           = '{"phone":{"current":"914597103","proposed":"914502332","reason":"ayto-infant indica teléfono diferente","status":"pending_manual_review"}}'::jsonb,
  updated_at              = NOW()
WHERE id = 'c755df20-7f87-4611-a806-815f4c8db1d6';

-- SAN MIGUEL [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Lucero',
  latitude                 = 40.40120451568239,
  longitude                = -3.748034160091499,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=e1aab501b5313210VgnVCM2000000c205a0aRCRD',
  short_description        = 'Escuela infantil pública ubicada en el barrio de Lucero, distrito Hortaleza. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'pending_manual_review',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  data_conflicts           = '{"phone":{"current":"913820145","proposed":"915261184","reason":"ayto-infant indica teléfono diferente","status":"pending_manual_review"}}'::jsonb,
  updated_at              = NOW()
WHERE id = 'ba9f78ff-fa1a-46ba-9258-a61fd53534f0';

-- SAN PATRICIO [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'El Viso',
  latitude                 = 40.45038912189774,
  longitude                = -3.681772893890903,
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos','comedor','horario-ampliado'],
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=d788f3216571c010VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de El Viso, distrito Chamartín. Atiende el primer ciclo (0 a 3 años). Cuenta con comedor, horario ampliado según la información pública disponible.',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = '6fb1382c-2ed3-47b3-a947-55b962f9dbea';

-- SANTA BERNARDITA [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Goya',
  latitude                 = 40.42800688550452,
  longitude                = -3.671655909864363,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=e49de3874c922310VgnVCM1000000b205a0aRCRD',
  short_description        = 'Guardería concertada ubicada en el barrio de Goya, distrito Salamanca. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = 'a46d7d07-158b-4330-9fb5-c6c0c0ecce72';

-- SANTA ROSALIA [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Canillas',
  latitude                 = 40.46610045821224,
  longitude                = -3.6310691153446317,
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos','comedor'],
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=bc4dc05ef571c010VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil concertada ubicada en el barrio de Canillas, distrito Hortaleza. Atiende el primer ciclo (0 a 3 años). Cuenta con comedor según la información pública disponible.',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = 'c4123daa-aec8-431f-bb2e-7b43bf106f7f';

-- ST. ALICE'S NURSERY GALILEO [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Arapiles',
  phone                    = '915503994',
  email                    = 'arapiles@staelices.es',
  latitude                 = 40.43469426332555,
  longitude                = -3.710393958866762,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=0229e56d5d066410VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Arapiles, distrito Chamberí. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = '660e3319-c883-46a8-a2c1-132d8aec4608';

-- TEO [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Alameda De Osuna',
  phone                    = '917414436',
  latitude                 = 40.45115316018945,
  longitude                = -3.5921656725702142,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=16ec2739d73b7210VgnVCM2000000c205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Alameda De Osuna, distrito Chamberí. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = '921a11e3-0008-48fd-ab4a-d2b03bc3095d';

-- TEO BRETON [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Rios Rosas',
  latitude                 = 40.439175536288815,
  longitude                = -3.695011596754243,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=1b3bc98cae2c8310VgnVCM2000000c205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Rios Rosas, distrito Chamberí. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'pending_manual_review',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  data_conflicts           = '{"phone":{"current":"686364244","proposed":"913994857","reason":"ayto-infant indica teléfono diferente","status":"pending_manual_review"}}'::jsonb,
  updated_at              = NOW()
WHERE id = '91e6b9be-43aa-4c18-9cd5-e9d0f6e817f4';

-- THE LITTLE ONE [cam]
UPDATE centers SET
  short_description        = 'Escuela infantil privada ubicada en el distrito de Chamartín. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = '13eee06b-766c-4784-9e66-4262c55f73a5';

-- TIERRA LALA [cam]
UPDATE centers SET
  short_description        = 'Escuela infantil privada ubicada en el distrito de Hortaleza. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = '687b16a9-8e89-476b-a840-ebb7b773907d';

-- TODO NIÑOS NURSERY [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Aravaca',
  latitude                 = 40.46137796145396,
  longitude                = -3.791351087126207,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=7c6ede1ef6313210VgnVCM2000000c205a0aRCRD',
  short_description        = 'Guardería privada ubicada en el barrio de Aravaca, distrito Moncloa-Aravaca. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = '3599376e-d55d-4c74-a10c-77a198a71bfe';

-- TODO PARA LA INFANCIA [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Ciudad Universitaria',
  latitude                 = 40.456140819288066,
  longitude                = -3.713945657070304,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=b6068899fc81c010VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Ciudad Universitaria, distrito Moncloa-Aravaca. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = '0e32a415-31b8-49a0-9cd5-65120c5bd3b3';

-- TRAZOS [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Fuente Del Berro',
  email                    = 'info@escuelainfantiltrazos.es',
  latitude                 = 40.42159910213041,
  longitude                = -3.6673957115252365,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=25b5f3216571c010VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Fuente Del Berro, distrito Salamanca. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = '130327c1-c4b0-49a3-a27c-d9a18d9b64c9';

-- TRILEMA SAFA [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Fuente Del Berro',
  latitude                 = 40.42193498103712,
  longitude                = -3.6646899465324823,
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos','comedor','horario-ampliado'],
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=6c95ae10c471c010VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil concertada ubicada en el barrio de Fuente Del Berro, distrito Salamanca. Atiende el primer ciclo (0 a 3 años). Cuenta con comedor, horario ampliado según la información pública disponible.',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = 'eb4dff3e-5eea-41b0-818a-cd78e59f419b';

-- ULU [cam]
UPDATE centers SET
  short_description        = 'Escuela infantil privada ubicada en el distrito de Retiro. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = 'b9448c81-342f-48b3-8c8e-9662b232fd16';

-- UP! KIDS SCHOOL [cam]
UPDATE centers SET
  short_description        = 'Escuela infantil privada ubicada en el distrito de Hortaleza. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = 'efa9caae-d780-4ec5-8fe1-cfd2bee68b97';

-- VALLEHERMOSO [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Arapiles',
  latitude                 = 40.435198773514514,
  longitude                = -3.7089254967629195,
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos','comedor','horario-ampliado'],
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=fdfe13db5b71c010VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil pública ubicada en el barrio de Arapiles, distrito Chamberí. Atiende el primer ciclo (0 a 3 años). Cuenta con comedor, horario ampliado según la información pública disponible.',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = '781601b2-aecb-4e1e-b456-9f862f02961c';

-- VIB VALDEBEBAS [cam]
UPDATE centers SET
  short_description        = 'Escuela infantil privada ubicada en el distrito de Hortaleza. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = '440bd2c0-b776-4e7a-ab44-1cff0d29439d';

-- VIRGEN MILAGROSA [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Pinar Del Rey',
  latitude                 = 40.47554292906961,
  longitude                = -3.6407014970018707,
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos','comedor'],
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=202df3216571c010VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil concertada ubicada en el barrio de Pinar Del Rey, distrito Hortaleza. Atiende el primer ciclo (0 a 3 años). Cuenta con comedor según la información pública disponible.',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = '4a5f6617-8356-46e8-86ee-9653d81b4775';

-- YAKI [ayto-infant]
UPDATE centers SET
  neighborhood_barrio      = 'Hispanoamerica',
  latitude                 = 40.452481011972715,
  longitude                = -3.670684832902975,
  source_url               = 'http://www.madrid.es/sites/v/index.jsp?vgnextchannel=bfa48ab43d6bb410VgnVCM100000171f5a0aRCRD&vgnextoid=42076da0aa81c010VgnVCM1000000b205a0aRCRD',
  short_description        = 'Escuela infantil privada ubicada en el barrio de Hispanoamerica, distrito Chamartín. Atiende el primer ciclo (0 a 3 años).',
  verification_status      = 'partially_verified',
  confidence_level         = 'medium',
  verified_at              = '2026-07-02T00:00:00Z',
  updated_at              = NOW()
WHERE id = '0046c9df-fdbe-41cd-9719-5ed609a69533';

COMMIT;

-- 194 centros actualizados de 194 totales.