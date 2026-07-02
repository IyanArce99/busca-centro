-- ============================================================
-- ROLLBACK 003 — Restaura valores anteriores al update 003
-- Generado: 2026-07-02
-- ============================================================
-- Ejecutar SOLO si quieres deshacer 003_update_all_remaining_centers.sql
-- ============================================================

BEGIN;

-- ROLLBACK 2 SEMILLAS
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Hortaleza',
  phone                    = '640081025',
  email                    = '2semillasescuelainfantil@gmail.com',
  website                  = 'WWW.2SEMILLASESCUELAINFANTIL.COM',
  postal_code              = '28043',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Hortaleza, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '7b9517ba-29d0-4fab-a994-929e162e7cd0';

-- ROLLBACK AFUERA III A
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Retiro',
  phone                    = '915516439',
  email                    = 'secretaria@colegioafuera.es',
  website                  = 'http://www.colegioafuera.es',
  postal_code              = '28007',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Retiro, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = 'f54356b4-7c1f-4e31-a653-51e1d198c458';

-- ROLLBACK AFUERA III B
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Retiro',
  phone                    = '915516439',
  email                    = 'secretaria@colegioafuera.es',
  website                  = NULL,
  postal_code              = '28007',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Guardería privada en el distrito de Retiro, Madrid. Centro de educación infantil de primer ciclo (0-3 años).',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '0e00f2d0-538b-4991-97df-88a6bbc966c6';

-- ROLLBACK AGARIMO
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Chamberí',
  phone                    = '915445466',
  email                    = 'palomagonza@yahoo.es',
  website                  = NULL,
  postal_code              = '28015',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Chamberí, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = 'cdcdcd36-1d03-4ec0-a5cf-0a35106cccaa';

-- ROLLBACK ALARIA ARAVACA NURSERY SCHOOL
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Moncloa-Aravaca',
  phone                    = '913570742',
  email                    = 'admisiones@alariaescuelasinfantiles.es',
  website                  = 'http://www.alariaescuelasinfantiles.es',
  postal_code              = '28023',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Guardería privada en el distrito de Moncloa-Aravaca, Madrid. Centro de educación infantil de primer ciclo (0-3 años).',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '969bf22e-0d0f-4a3d-b0af-e0b48906ad20';

-- ROLLBACK ALARIA NUEVOS MINISTERIOS NURSERY SCHOOL
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Chamartín',
  phone                    = '915612837',
  email                    = 'admisiones@alariaescuelasinfantiles.es',
  website                  = 'http://www.alariaescuelasinfantiles.es',
  postal_code              = '28006',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Guardería privada en el distrito de Chamartín, Madrid. Centro de educación infantil de primer ciclo (0-3 años).',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = 'f1f29a13-e243-44e5-a3d1-d6e9ba6053c4';

-- ROLLBACK ALARIA SERRANO NURSEY SCHOOL
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Chamartín',
  phone                    = '910527004',
  email                    = 'admisiones@alariaescuelasinfantiles.es',
  website                  = 'https://www.alariaescuelasinfantiles.es',
  postal_code              = '28002',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Chamartín, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '91d2d752-5f82-4c64-8379-6a716aedc868';

-- ROLLBACK ALBA LUCERO
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Chamartín',
  phone                    = '911666302',
  email                    = 'info@eipralbalucero.com',
  website                  = NULL,
  postal_code              = '28011',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Chamartín, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '8ea46217-68eb-4e89-ba86-80f6daefe79e';

-- ROLLBACK ALICIA
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Moncloa-Aravaca',
  phone                    = '915484132',
  email                    = 'alicia1@escuelainfantilalicia.es',
  website                  = 'http://www.escuelainfantilalicia.es',
  postal_code              = '28008',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Moncloa-Aravaca, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '1dab63de-d43d-41bc-9a5d-7257639bb8e5';

-- ROLLBACK ALICIA II
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Moncloa-Aravaca',
  phone                    = '915503774',
  email                    = 'alicia2@escuelainfantilalicia.es',
  website                  = 'http://www.escuelainfantilalicia.es',
  postal_code              = '28008',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Moncloa-Aravaca, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = 'ebde4f53-c43e-46ab-9e18-004bd974d395';

-- ROLLBACK ALLEGRA
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Moncloa-Aravaca',
  phone                    = '670576286',
  email                    = 'info@escuelalibreallegra.es',
  website                  = 'www.escuelalibreallegra.es',
  postal_code              = '28023',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Moncloa-Aravaca, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = 'd072830a-ceeb-4d14-8a77-3bca3b5618d4';

-- ROLLBACK ANA DE AUSTRIA
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Hortaleza',
  phone                    = '917500832',
  email                    = 'eei.anadeaustria.madrid@educa.madrid.org',
  website                  = 'http://www.educa.madrid.org/eei.anadeaustria.madrid',
  postal_code              = '28050',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil pública en el distrito de Hortaleza, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '91926c07-f673-4623-911e-f4009fee5c9d';

-- ROLLBACK ANDAL
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Retiro',
  phone                    = '915514858',
  email                    = 'info@escuelasinfantilesandal.com',
  website                  = 'www.escuelasinfantilesandal.com',
  postal_code              = '28007',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Retiro, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '921d8b54-2244-4de8-8c10-bf69806b183b';

-- ROLLBACK ANDAL II
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Retiro',
  phone                    = '915523229',
  email                    = 'escuelasinfantilesandal@gmail.com',
  website                  = NULL,
  postal_code              = '28007',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Retiro, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = 'b9cb3561-1f71-4873-b2f2-e1d35a0e79e2';

-- ROLLBACK ANTONIO MERCERO
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Moncloa-Aravaca',
  phone                    = NULL,
  email                    = 'eei.antoniomercero.madrid@educa.madrid.org',
  website                  = 'http://www.educa.madrid.org/eei.antoniomercero.madrid',
  postal_code              = '28008',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos','comedor','horario-ampliado'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil pública en el distrito de Moncloa-Aravaca, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '0a9991e0-dd87-4bb9-ae42-ced9db754ac6';

-- ROLLBACK ARCANGEL
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Retiro',
  phone                    = '915523525',
  email                    = 'cc.arcangel.madrid@educa.madrid.org',
  website                  = 'http://www.colegioconcertadoarcangel.com',
  postal_code              = '28007',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil concertada en el distrito de Retiro, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = 'd0cf3120-bbf4-4207-a85a-1f616f1c951b';

-- ROLLBACK B.R.A. INSTITUCION ORGAZ
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Hortaleza',
  phone                    = '913889355',
  email                    = 'secretaria.ogz@colegiobrains.com',
  website                  = 'https://www.colegiobrains.com/colegios/orgaz/',
  postal_code              = '28043',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Hortaleza, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '4c1cb5b6-8a04-47ef-a64e-cbf99fd11d23';

-- ROLLBACK BOREAL DREAMING TOGETHER
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Hortaleza',
  phone                    = '673403842',
  email                    = 'info@borealmontessori.com',
  website                  = NULL,
  postal_code              = '28043',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Guardería privada en el distrito de Hortaleza, Madrid. Centro de educación infantil de primer ciclo (0-3 años).',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = 'eb0f284a-a6d6-4d31-b80f-711c85e83be7';

-- ROLLBACK BUEN CONSEJO
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Moncloa-Aravaca',
  phone                    = '913571279',
  email                    = 'l.garcia@eibuenconsejo.com',
  website                  = 'eibuenconsejo.com',
  postal_code              = '28023',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Moncloa-Aravaca, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '4c97ca77-36c7-4a3d-b8d2-8ffa01938c97';

-- ROLLBACK BULARAS INIA
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Moncloa-Aravaca',
  phone                    = '913473586',
  email                    = 'anaisabel.bravo@inia.csic.es',
  website                  = 'http://www.educa.madrid.org/eei.bularasinia.madrid',
  postal_code              = '28023',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil pública en el distrito de Moncloa-Aravaca, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '23c85dad-5ef1-4b17-84c8-899098f2a537';

-- ROLLBACK CAN-TA-CHIMUTRI (SOL Y LUNA)
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Moncloa-Aravaca',
  phone                    = '913738282',
  email                    = 'presenciagitana@presenciagitana.org',
  website                  = NULL,
  postal_code              = '28035',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Guardería privada en el distrito de Moncloa-Aravaca, Madrid. Centro de educación infantil de primer ciclo (0-3 años).',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = 'b819f76f-9bb3-4ade-a32f-8854b48a8467';

-- ROLLBACK CARANA VALDEMARIN
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Moncloa-Aravaca',
  phone                    = '609483989',
  email                    = 'Avm@carana.com.es',
  website                  = NULL,
  postal_code              = '28023',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Moncloa-Aravaca, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = 'c442d882-1877-49d4-8ac2-3d2ec1039740';

-- ROLLBACK CARRUSEL
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Chamartín',
  phone                    = '914131350',
  email                    = 'info@carruselescuelainfantil.com',
  website                  = NULL,
  postal_code              = '28002',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Chamartín, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '45848e76-0aee-4e37-b6d7-5d27adb12633';

-- ROLLBACK CASA DEL NIÑO
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Chamartín',
  phone                    = '913591786',
  email                    = 'casadelnino@salusinfirmorum.es',
  website                  = 'www.saluscasadelnino.es',
  postal_code              = '28036',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Chamartín, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = 'ad9568f5-bba5-4d47-a083-847cd19d397b';

-- ROLLBACK CASA NIDO
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Arganzuela',
  phone                    = '910414114',
  email                    = 'info@casanido.es',
  website                  = 'https://casanido.es',
  postal_code              = '28045',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Arganzuela, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '0d88e41b-fdb8-4d20-8cb5-f75f3efe609b';

-- ROLLBACK CASITA MARAVILLAS
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Arganzuela',
  phone                    = '663932715',
  email                    = 'eugenio.robles@casitamaravillas.es',
  website                  = 'https://www.casitamaravillas.es',
  postal_code              = '28045',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Arganzuela, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '73ea21b4-8232-4572-8c3e-84723bde2b76';

-- ROLLBACK CASITA MARAVILLAS BABY
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Arganzuela',
  phone                    = '692807137',
  email                    = 'nebulosas@casitamaravillas.es',
  website                  = 'www.casitamaravillas.es',
  postal_code              = '28045',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Arganzuela, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '5d8654b0-8f87-410e-a593-36c594400195';

-- ROLLBACK CASITA MARAVILLAS NEBULOSAS
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Arganzuela',
  phone                    = '692807137',
  email                    = 'nebulosas@casitamaravillas.es',
  website                  = 'https://www.casitamaravillas.es',
  postal_code              = '28045',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Arganzuela, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '14c7c3a5-c2b3-4f2d-bdb5-5c43fe938c2a';

-- ROLLBACK CHAMBERINES
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Chamberí',
  phone                    = '914452565',
  email                    = 'escuelainfantil@chamberines.com',
  website                  = 'www.chamberines.com',
  postal_code              = '28010',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Chamberí, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '30f81571-d3e3-451f-bd88-297a766ab26f';

-- ROLLBACK CHIQUI
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Chamberí',
  phone                    = '915933096',
  email                    = 'info@escuelainfantilchiqui.es',
  website                  = NULL,
  postal_code              = '28015',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Chamberí, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '208762a5-4d7d-4700-95c3-dd9daa09773f';

-- ROLLBACK CHIQUI TIN ALCANTARA
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Salamanca',
  phone                    = '914028151',
  email                    = 'alcantara@escuelachiquitin.com',
  website                  = 'http://www.escuelachiquitin.com',
  postal_code              = '28006',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Salamanca, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = 'eb42112b-a9d9-4586-b60d-f0c7434889b7';

-- ROLLBACK CHULY
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Arganzuela',
  phone                    = '914743389',
  email                    = 'escuelachuly@gmail.com',
  website                  = 'www.escuelainfantilchuly .com',
  postal_code              = '28005',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Arganzuela, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '1f94ea42-780a-40a2-9732-3fa25b04b9c1';

-- ROLLBACK CIUDAD JARDIN
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Chamartín',
  phone                    = '913506359',
  email                    = 'info@guarderiaciuadadjardin.es',
  website                  = 'www.guarderiaciudadjardin.es',
  postal_code              = '28016',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Chamartín, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = 'bf73c21a-2089-40e1-b535-9f25ecf3a006';

-- ROLLBACK COCOLAN CVE
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Arganzuela',
  phone                    = '914739382',
  email                    = 'cocolan@cve.edu.es',
  website                  = 'cocolan.cve.edu.es',
  postal_code              = '28005',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Arganzuela, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = 'd92d9646-333c-4f58-bdce-5cff334edb33';

-- ROLLBACK COCORICO
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Chamartín',
  phone                    = '912429007',
  email                    = 'escuela_cocorico@yahoo.es',
  website                  = 'http://www.escuelainfantilcocorico.com',
  postal_code              = '28002',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Chamartín, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = 'a38e2b2e-c080-4906-9b86-90ed0f79b07c';

-- ROLLBACK COLEGIO MADRID FSM-SOTILLO
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Hortaleza',
  phone                    = NULL,
  email                    = 'infantil@cm-fsm.es',
  website                  = 'www.chiaravalleschool.es',
  postal_code              = '28043',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Guardería privada en el distrito de Hortaleza, Madrid. Centro de educación infantil de primer ciclo (0-3 años).',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = 'd2803c85-fcae-4862-b1b9-5e2617575e24';

-- ROLLBACK COLEGIO SEI DOS PARQUES
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Arganzuela',
  phone                    = '914739985',
  email                    = 'cc.dosparques.madrid@educa.madrid.org',
  website                  = NULL,
  postal_code              = '28005',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil concertada en el distrito de Arganzuela, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '48f0a4aa-5da7-4f4e-977c-e364c14e57fa';

-- ROLLBACK CONSEJO SUP.INVESTIGACIONES CIENTIFICAS
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Chamartín',
  phone                    = '915681917',
  email                    = 'direccion.escuela.infantil@csic.es',
  website                  = NULL,
  postal_code              = '28006',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil pública en el distrito de Chamartín, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = 'a7289dcb-834b-4ac0-b8d1-1c988fd72d2c';

-- ROLLBACK CUARTEL GENERAL DEL EJERCITO DEL AIRE
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Moncloa-Aravaca',
  phone                    = '915032759',
  email                    = 'cgea@kidsco.es',
  website                  = 'www.kidsco.es',
  postal_code              = '28008',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil pública en el distrito de Moncloa-Aravaca, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '6f230452-1f84-4fec-960b-9718f7feb043';

-- ROLLBACK CUCHITOS
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Salamanca',
  phone                    = '914013958',
  email                    = 'escuelainfantilcuchitos@gmail.com',
  website                  = 'WWW.CUCHITOS.COM',
  postal_code              = '28006',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Salamanca, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '260a708d-6036-44ef-927b-a502fe4c38eb';

-- ROLLBACK CUCOS HOME VALDEBEBAS
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Hortaleza',
  phone                    = '626404523',
  email                    = 'escuelacucosvaldebebas@gmail.com',
  website                  = NULL,
  postal_code              = '28055',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Hortaleza, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = 'bfb4230d-ac27-4903-a3f9-26e015aea8d4';

-- ROLLBACK CUCUTRAS
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Hortaleza',
  phone                    = '913002257',
  email                    = 'cucutras@cucutras.net',
  website                  = NULL,
  postal_code              = '28043',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Hortaleza, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '2613e96c-9379-4d6d-adeb-d21ceb774fd4';

-- ROLLBACK CUNA DE JESUS
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Salamanca',
  phone                    = '917256327',
  email                    = 'cc.cunadejesus.madrid@educa.madrid.org',
  website                  = NULL,
  postal_code              = '28028',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil concertada en el distrito de Salamanca, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = 'a4e9b8f2-24f1-46b2-816d-e553fb95368e';

-- ROLLBACK DALLINGTON INFANTS
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Hortaleza',
  phone                    = '915654989',
  email                    = 'info@dallingtonschool.com',
  website                  = 'www.dallingtonschool.com',
  postal_code              = '28043',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Hortaleza, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = 'db9ff33b-0248-44a8-9959-ef4f214fc1bb';

-- ROLLBACK DE PEQUES
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Retiro',
  phone                    = '915514433',
  email                    = 'depeques@depeques.es',
  website                  = 'http://www.depeques.es',
  postal_code              = '28007',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Retiro, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '9038eb6c-8ab3-4614-8faf-90439fee4a8b';

-- ROLLBACK DIABOLO
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Arganzuela',
  phone                    = '669440272',
  email                    = NULL,
  website                  = NULL,
  postal_code              = '28045',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Arganzuela, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = 'b44b6862-5b7b-4a04-84f4-d89ab51d5020';

-- ROLLBACK DINA CONDADO
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Hortaleza',
  phone                    = '913021746',
  email                    = 'dinacondado@gmail.com',
  website                  = NULL,
  postal_code              = '28033',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Hortaleza, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = 'fa73f2b1-c52c-4870-b9e1-19e0522a0f12';

-- ROLLBACK DINA CONDADO-2
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Hortaleza',
  phone                    = '913021746',
  email                    = 'dinacondado@gmail.com',
  website                  = NULL,
  postal_code              = '28033',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Hortaleza, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '2e007e17-485f-4a2d-9056-b6e948c72c3b';

-- ROLLBACK DIONISIA PLAZA
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Moncloa-Aravaca',
  phone                    = '913079342',
  email                    = 'educacion@crdionisiaplaza.es',
  website                  = 'www.DIONISIAPLAZA.ES',
  postal_code              = '28023',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Moncloa-Aravaca, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '51abe604-b40c-4235-bca0-3d2578328c34';

-- ROLLBACK DOMO
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Hortaleza',
  phone                    = '660492189',
  email                    = 'info@domoescuelainfantil.es',
  website                  = 'www.domoescuelainfantil.es',
  postal_code              = '28043',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Hortaleza, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '42be7897-cacc-4673-baec-cd907b9d10b4';

-- ROLLBACK DOÑA FRANCISQUITA
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Hortaleza',
  phone                    = '917642004',
  email                    = 'eei.donafrancisquita.madrid@educa.madrid.org',
  website                  = 'http://www.educa.madrid.org/eei.donafrancisquita.madrid',
  postal_code              = '28050',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos','comedor','horario-ampliado'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil pública en el distrito de Hortaleza, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '8b7d2d9e-b5d2-41e5-a503-d4172e6c05da';

-- ROLLBACK DONDE ESTAN LAS LLAVES
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Arganzuela',
  phone                    = '638947062',
  email                    = 'dondeestanlasllaves@hotmail.es',
  website                  = 'http://www.dondeestanlasllaves.es',
  postal_code              = '28045',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Arganzuela, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = 'bed55563-8a3f-4e45-96b6-20159ceecfb8';

-- ROLLBACK EDUCANDO
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Retiro',
  phone                    = '915525356',
  email                    = 'educandoconamorjuntos@gmail.com',
  website                  = NULL,
  postal_code              = '28007',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Retiro, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = 'adf0638e-64c9-4eff-b466-f633c8685806';

-- ROLLBACK EDUCANDO JUNTOS
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Retiro',
  phone                    = '915525356',
  email                    = 'direccion@escuelaeducando.com',
  website                  = NULL,
  postal_code              = '28007',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Retiro, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '0ab27673-d227-4579-9318-bbb8345393fe';

-- ROLLBACK EDUCANDO PITUFOS
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Retiro',
  phone                    = '910869437',
  email                    = 'educandoconamorjuntos@gmail.com',
  website                  = NULL,
  postal_code              = '28009',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Retiro, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = 'cc6fdb28-c0e1-49ad-bda8-acdb63efa94f';

-- ROLLBACK EDUCANDO V
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Retiro',
  phone                    = '915525356',
  email                    = 'educandoconamorjuntos@gmail.com',
  website                  = 'www.escuelaeducando.com',
  postal_code              = '28007',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Retiro, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '6df60e08-f83c-478a-816c-719cda19f66c';

-- ROLLBACK EIPA ESCUELA INFANTIL PARQUE DE LAS AVENIDAS
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Salamanca',
  phone                    = '911167470',
  email                    = 'direccion@eipaeducacion.com',
  website                  = NULL,
  postal_code              = '28028',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Salamanca, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = 'aaf3ad28-9ca8-4985-a4ac-eab39910bf3b';

-- ROLLBACK EL BARBERILLO DE LAVAPIES
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Arganzuela',
  phone                    = '915397437',
  email                    = 'eei.elbarberillodelavapies.madrid@educa.madrid.org',
  website                  = 'http://www.educa.madrid.org/eei.elbarberillodelavapies.madrid',
  postal_code              = '28045',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil pública en el distrito de Arganzuela, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '951abe34-4a16-4f7e-8b42-73b27fe7b99d';

-- ROLLBACK EL BOSQUE
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Arganzuela',
  phone                    = '915271590',
  email                    = 'eei.elbosque.madrid@educa.madrid.org',
  website                  = 'http://www.educa.madrid.org/eei.elbosque.madrid',
  postal_code              = '28045',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos','comedor','horario-ampliado'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil pública en el distrito de Arganzuela, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '1921daf0-4a0d-435b-ba0e-cbada96321c0';

-- ROLLBACK EL CARMEN
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Hortaleza',
  phone                    = '913029923',
  email                    = 'eei.elcarmen.madrid@educa.madrid.org',
  website                  = 'http://www.educa.madrid.org/eei.elcarmen.madrid',
  postal_code              = '28033',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil pública en el distrito de Hortaleza, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '282f942f-8512-451c-8db2-2b694a373478';

-- ROLLBACK EL COLUMPIO DE CLAUDIA
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Hortaleza',
  phone                    = '660060957',
  email                    = 'elcolumpiodeclaudia@gmail.com',
  website                  = 'https://www.elcolumpiodeclaudia.com/',
  postal_code              = '28050',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Hortaleza, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '362babbc-12a5-44c7-9a4b-097ef7eaa145';

-- ROLLBACK EL DUENDE TRAVIESO II
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Arganzuela',
  phone                    = '639656728',
  email                    = 'olguina@msn.com',
  website                  = NULL,
  postal_code              = '28005',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Arganzuela, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '7bf4feed-7181-4dcb-93be-ad78e0e359ef';

-- ROLLBACK EL JARDÍN DE LAS MARIPOSAS
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Hortaleza',
  phone                    = '913839795',
  email                    = 'info.jardinmariposas@gmail.com',
  website                  = 'http://jardindelasmariposas.com/',
  postal_code              = '28033',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Hortaleza, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '1839263c-81e7-4862-9faa-4ca973e3bd14';

-- ROLLBACK EL JARDIN DE LOS GENIOS
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Moncloa-Aravaca',
  phone                    = '915478067',
  email                    = 'contacto@eljardindelosgenios.es',
  website                  = 'http://www.eljardindelosgenios.es',
  postal_code              = '28008',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Moncloa-Aravaca, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = 'fc7f4a34-0646-405f-8330-8e5626f65cd7';

-- ROLLBACK EL NIDO DEL BUHO
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Chamberí',
  phone                    = '649736777',
  email                    = 'elnidodelbuho@yahoo.com',
  website                  = 'www.elnidodelbuho.es',
  postal_code              = '28015',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Chamberí, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '78ed5308-5c04-4f93-808d-f64d69a2b65e';

-- ROLLBACK EL OSITO
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Chamartín',
  phone                    = '914134642',
  email                    = 'info@escuelainfantilelosito.com',
  website                  = 'http://www.escuelainfantilelosito.com',
  postal_code              = '28002',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Chamartín, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = 'f8138a09-ba59-4cb7-a8b9-196d03b82c09';

-- ROLLBACK EL OSITO 2
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Chamartín',
  phone                    = '914159758',
  email                    = 'info@escuelainfantilelosito.com',
  website                  = 'http://www.escuelainfantilelosito.com',
  postal_code              = '28002',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Chamartín, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '3425aacc-416b-4ff2-9d71-85cef21e5be8';

-- ROLLBACK EL OSITO DE LUIS DE LARRAINZA
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Chamartín',
  phone                    = '912194455',
  email                    = 'info@escuelainfantilelosito.com',
  website                  = 'www.escuelainfantilelosito.com',
  postal_code              = '28002',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Chamartín, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '9ad9f96f-2c3d-4c10-8d8a-ae55599a24b3';

-- ROLLBACK EL PARQUE
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Chamartín',
  phone                    = '914132798',
  email                    = 'elparque.escuela@gmail.com',
  website                  = NULL,
  postal_code              = '28002',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Chamartín, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '8fa8261d-3430-4387-955d-31459fe9ca11';

-- ROLLBACK EL PARQUE DE LA PIOVERA
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Hortaleza',
  phone                    = '913205697',
  email                    = 'piovera@elparque.net',
  website                  = NULL,
  postal_code              = '28042',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Hortaleza, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '7f6b35ae-f63e-452a-8592-84a69e731e61';

-- ROLLBACK EL REINO DEL REVÉS
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Arganzuela',
  phone                    = '914731295',
  email                    = 'elreinodelreves2016@gmail.com',
  website                  = 'https://escuelaelreinodelreves.com/',
  postal_code              = '28045',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Arganzuela, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '2de776c4-c0c7-42ff-85be-c7dbcfcd41d5';

-- ROLLBACK EL SITIO DE TU RECREO
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Chamberí',
  phone                    = '914268107',
  email                    = 'informacion@elsitiodeturecreo.com',
  website                  = 'https://elsitiodeturecreo.com',
  postal_code              = '28010',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Chamberí, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = 'f184e72e-5acf-4b7f-a911-1c2c6413a996';

-- ROLLBACK EL SOL
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Chamartín',
  phone                    = '913532644',
  email                    = 'eei.elsol.madrid@educa.madrid.org',
  website                  = 'http://www.educa.madrid.org/eei.elsol.madrid',
  postal_code              = '28016',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos','comedor','horario-ampliado'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil pública en el distrito de Chamartín, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '9ca0475a-bac6-48e8-bef3-e5a3b7229d50';

-- ROLLBACK EL TREN DE ARGANDA
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Retiro',
  phone                    = NULL,
  email                    = 'eei.eltrendearganda.madrid@educa.madrid.org',
  website                  = 'http://www.educa.madrid.org/eei.eltrendearganda.madrid',
  postal_code              = '28009',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos','comedor','horario-ampliado'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil pública en el distrito de Retiro, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = 'bb3fa50c-187f-464d-8cdf-6279acedfea6';

-- ROLLBACK EL TREN DE LA FRESA
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Arganzuela',
  phone                    = '915399458',
  email                    = 'eei.trendelafresa.madrid@educa.madrid.org',
  website                  = 'http://www.educa.madrid.org/eei.trendelafresa.madrid',
  postal_code              = '28045',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil pública en el distrito de Arganzuela, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '9e1832f5-d017-4c20-95a1-caff7a7fe138';

-- ROLLBACK EL TREN DE LOS NIÑOS
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Chamartín',
  phone                    = '917660801',
  email                    = 'info@eieltren.es',
  website                  = NULL,
  postal_code              = '28036',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Chamartín, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '3a416091-27e8-427c-86fb-5d8062750a6a';

-- ROLLBACK EL TREN DE LOS NIÑOS II
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Chamartín',
  phone                    = '913025639',
  email                    = 'info@eieltren.es',
  website                  = NULL,
  postal_code              = '28036',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Chamartín, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = 'b6360786-f44b-4056-8aad-975586709549';

-- ROLLBACK EL VALLE
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Chamberí',
  phone                    = '915530388',
  email                    = 'eei.elvalle.madrid@educa.madrid.org',
  website                  = 'http://www.educa.madrid.org/eei.elvalle.madrid',
  postal_code              = '28003',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil pública en el distrito de Chamberí, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = 'ba5c2626-6ac2-430e-9321-7cf2c7cbfeca';

-- ROLLBACK EMBAJADORES
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Arganzuela',
  phone                    = '915285536',
  email                    = 'escuelainfantilembajadores@gmail.com',
  website                  = 'https://www.escuelainfantilembajadores.com/',
  postal_code              = '28012',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Arganzuela, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '10fd5c0a-2a91-4aa0-a4e3-3608845e9e83';

-- ROLLBACK ESCUELA DE EDUCACION INFANTIL DEL COMPLEJO CUZCO
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Chamartín',
  phone                    = '656414096',
  email                    = 'belen_berz@hotmail.com',
  website                  = 'www.planetaenano.com',
  postal_code              = '28046',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil pública en el distrito de Chamartín, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '8e3ec3c2-c8ad-4c71-a0c5-218e10b48a6c';

-- ROLLBACK ESCUELA INFANTIL BILINGÜE SUS PEQUEÑOS PASOS-ARTURO SORIA
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Hortaleza',
  phone                    = '913882377',
  email                    = 'escuela@suspequenospasos.es',
  website                  = NULL,
  postal_code              = '28033',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Hortaleza, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = 'ed45e5d8-cef4-4b20-9ae2-fb41ff6090e8';

-- ROLLBACK ESCUELA INFANTIL BRAINS MADRID
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Salamanca',
  phone                    = '917266400',
  email                    = 'infotoreros@brainsnursery.com',
  website                  = 'www.brainsnursery.com',
  postal_code              = '28028',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Guardería privada en el distrito de Salamanca, Madrid. Centro de educación infantil de primer ciclo (0-3 años).',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '8ade6798-5b66-479d-b987-e433560cf5ce';

-- ROLLBACK ESCUELA INFANTIL DEL CUERPO NACIONAL DE POLICIA
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Hortaleza',
  phone                    = '915822718',
  email                    = NULL,
  website                  = NULL,
  postal_code              = '28043',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil pública en el distrito de Hortaleza, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '29b6ac59-faa4-420c-b2cc-6c2d489195f4';

-- ROLLBACK ESCUELA INFANTIL DELEGACION DE ECONOMIA Y HACIENDA
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Chamberí',
  phone                    = '915450565',
  email                    = 'DEHMadridGuarderia@igae.hacienda.gob.es',
  website                  = NULL,
  postal_code              = '28003',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil pública en el distrito de Chamberí, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '3d4736b3-e0d6-43b2-a902-d228200c8981';

-- ROLLBACK ESCUELA INFANTIL MAEC
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Salamanca',
  phone                    = '602257785',
  email                    = 'eimauc@workandlife.com',
  website                  = 'https://www.workandlife.com/es/',
  postal_code              = '28006',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil pública en el distrito de Salamanca, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '6d354d74-1ad6-4697-a52a-61cc8ce8d574';

-- ROLLBACK ESCUELA MONTESSORI MADRID
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Moncloa-Aravaca',
  phone                    = '913729720',
  email                    = 'casamontessorimadrid@gmail.com',
  website                  = 'www.escuelamontessorimadrid.com',
  postal_code              = '28023',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Guardería privada en el distrito de Moncloa-Aravaca, Madrid. Centro de educación infantil de primer ciclo (0-3 años).',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = 'c71ac4d7-6f24-447e-a355-5a5153139676';

-- ROLLBACK ESTUDIO CONDE ORGAZ
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Hortaleza',
  phone                    = '914135276',
  email                    = 'condeorgaz@colegio-estudio.com',
  website                  = NULL,
  postal_code              = '28043',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Hortaleza, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = 'ab3ed14c-8b20-4306-947f-080f6baca7a6';

-- ROLLBACK GARABATOS Y OCHO PATOS
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Arganzuela',
  phone                    = '914740446',
  email                    = 'secretaria.garabatosyochopatos@gmail.com',
  website                  = NULL,
  postal_code              = '28005',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Arganzuela, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = 'b3c2a25e-7fe0-4700-b515-570ef4880e6c';

-- ROLLBACK GRAN VIA
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Hortaleza',
  phone                    = '913000630',
  email                    = 'marisamoya.4@gmail.com',
  website                  = 'http://www.escuelainfantilgranvia.com',
  postal_code              = '28043',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Hortaleza, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '0dc73047-36fa-45bc-b88a-c8f504da4912';

-- ROLLBACK GREENLEAVES MONTESSORI II
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Moncloa-Aravaca',
  phone                    = '689149437',
  email                    = 'administracion@greenleavesmontessori.com',
  website                  = 'www.greenleavesmontessori.com',
  postal_code              = '28023',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Moncloa-Aravaca, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = 'ac52291f-097c-42de-88ad-936822cadd2c';

-- ROLLBACK GUARDILLA INFANTIL
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Chamberí',
  phone                    = '630205015',
  email                    = 'info@gadleon.es',
  website                  = NULL,
  postal_code              = '28003',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil pública en el distrito de Chamberí, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '4cf5b474-5847-4f5d-9b13-b45dec06a1a9';

-- ROLLBACK INTERNACIONAL VALDEMARIN
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Moncloa-Aravaca',
  phone                    = '674501365',
  email                    = 'ana.casquero@gmail.com',
  website                  = 'www.internacionalvaldemarin.com',
  postal_code              = '28023',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Moncloa-Aravaca, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '4230f252-d7aa-43d5-b116-d3d33cf0a8e5';

-- ROLLBACK INTERNATIONAL MONTESSORI KINDERGARTEN
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Hortaleza',
  phone                    = NULL,
  email                    = 'secretaria.academica@montessori.es',
  website                  = 'http://www.montessoricondeorgaz.es',
  postal_code              = '28043',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Guardería privada en el distrito de Hortaleza, Madrid. Centro de educación infantil de primer ciclo (0-3 años).',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '88f6271c-7978-48a4-bbbe-43e042e1dd19';

-- ROLLBACK IRIS
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Hortaleza',
  phone                    = '913882876',
  email                    = 'escuelairis@telefonica.net',
  website                  = 'www.escuelainfantiliris.es',
  postal_code              = '28043',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Hortaleza, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '7fed9cf6-3a8e-4363-aa1b-2b69eb819ddf';

-- ROLLBACK IRIS II
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Hortaleza',
  phone                    = '917669384',
  email                    = 'informate@escuelainfantiliris2.es',
  website                  = 'www.escuelainfantiliris2.es',
  postal_code              = '28033',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Hortaleza, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '84766903-944b-49f5-b46c-d155f95b1968';

-- ROLLBACK JARDIIMAR
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Arganzuela',
  phone                    = '913658580',
  email                    = 'virginiafdezt@gmail.com',
  website                  = 'www.jardiimar.es',
  postal_code              = '28005',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Arganzuela, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = 'bc6d4257-32f4-4138-804d-0205ec100804';

-- ROLLBACK JARDIN DE LAS DELICIAS
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Arganzuela',
  phone                    = '915304863',
  email                    = 'contacto@jardindelasdelicias.net',
  website                  = 'http://lnx.jardindelasdelicias.net',
  postal_code              = '28045',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Arganzuela, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '7cd39706-b41e-4cff-afab-511643654f7b';

-- ROLLBACK JARDIN INFANTIL
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Arganzuela',
  phone                    = '915278641',
  email                    = 'info@jardininfantil.es',
  website                  = 'http://jardininfantil.es',
  postal_code              = '28045',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Arganzuela, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '1d1eeb20-8d1f-4756-8c61-a0a5e78e1450';

-- ROLLBACK KIDS RETIRO
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Retiro',
  phone                    = '914339379',
  email                    = 'escuela@kidsretiro.com',
  website                  = 'http://www.kidsretiro.com',
  postal_code              = '28007',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Retiro, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '242aa7ba-3c90-4b31-8c3a-3338f154d2c1';

-- ROLLBACK KIKA
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Arganzuela',
  phone                    = '914674492',
  email                    = 'info@escuelainfantilkika.com',
  website                  = 'www.escuelainfantilkika.com',
  postal_code              = '28045',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Arganzuela, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '44e68835-e79b-453f-a634-280c7f6acf4c';

-- ROLLBACK KINDER SANTAMARCA
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Chamartín',
  phone                    = '914158640',
  email                    = 'secretaria@colegiofundacionsantamarca.es',
  website                  = NULL,
  postal_code              = '28002',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Chamartín, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '4e626df4-1cad-4935-b8a4-1f117d1f165b';

-- ROLLBACK LA ALMUDENA
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Hortaleza',
  phone                    = '913003078',
  email                    = 'eei.laalmudena.madrid@educa.madrid.org',
  website                  = 'http://www.educa.madrid.org/eei.laalmudena.madrid',
  postal_code              = '28043',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil pública en el distrito de Hortaleza, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = 'dfc9ceca-50c2-4842-b3e4-070a4527f14e';

-- ROLLBACK LA ARDILLA
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Hortaleza',
  phone                    = NULL,
  email                    = 'eei.laardilla.madrid@educa.madrid.org',
  website                  = 'http://www.educa.madrid.org/eei.laardilla.madrid',
  postal_code              = '28050',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos','comedor','horario-ampliado'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil pública en el distrito de Hortaleza, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = 'bd48d7a1-e32b-4313-9334-d7a5438714cb';

-- ROLLBACK LA BOLA DE CRISTAL
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Moncloa-Aravaca',
  phone                    = NULL,
  email                    = 'eei.laboladecristal.madrid@educa.madrid.org',
  website                  = 'http://www.educa.madrid.org/eei.laboladecristal.madrid',
  postal_code              = '28039',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos','comedor','horario-ampliado'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil pública en el distrito de Moncloa-Aravaca, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '4df1e9bf-2683-4041-ac79-72ee61c1a8ed';

-- ROLLBACK LA CASA DEL RIO - MIRIAM
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Moncloa-Aravaca',
  phone                    = '915423938',
  email                    = 'eicasadelrio@hotmail.com',
  website                  = 'www.ei-miriam.com',
  postal_code              = '28008',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Moncloa-Aravaca, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '5a2d153b-8a20-4438-9d11-eb083ac59ef2';

-- ROLLBACK LA ESTRELLA INFANTIL
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Retiro',
  phone                    = '636492506',
  email                    = 'info@estrellainfantil.com',
  website                  = 'estrellainfantil.com',
  postal_code              = '28007',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Retiro, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '61151bb2-0bee-46ea-8e7e-e093f2451934';

-- ROLLBACK LA ESTRELLA INFANTIL III
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Retiro',
  phone                    = '636492506',
  email                    = 'info@estrellainfantil.com',
  website                  = 'www.estrellainfantil.com',
  postal_code              = '28007',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Retiro, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '268e0051-c277-4134-aa8c-575f46e0e51c';

-- ROLLBACK LA GRAN VIA
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Hortaleza',
  phone                    = '913880412',
  email                    = 'eei.lagranvia.madrid@educa.madrid.org',
  website                  = 'http://www.educa.madrid.org/eei.lagranvia.madrid',
  postal_code              = '28043',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos','comedor','horario-ampliado'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil pública en el distrito de Hortaleza, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '6e2826da-742f-40c0-87d3-6e0ac7a2bbff';

-- ROLLBACK LA JIRAFA
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Hortaleza',
  phone                    = '913003491',
  email                    = 'eilajirafa2025@gmail.com',
  website                  = NULL,
  postal_code              = '28043',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Hortaleza, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = 'a20d8eb1-7b33-45e1-ac2d-da09a0e99651';

-- ROLLBACK LA MELONERA
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Arganzuela',
  phone                    = NULL,
  email                    = 'eei.lamelonera.madrid@educa.madrid.org',
  website                  = 'http://www.educa.madrid.org/eei.lamelonera.madrid',
  postal_code              = '28045',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos','comedor','horario-ampliado'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil pública en el distrito de Arganzuela, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '589089df-12df-48ea-b65a-30fd6830227b';

-- ROLLBACK LA VIRGEN NIÑA
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Hortaleza',
  phone                    = '913003185',
  email                    = 'gelipri@yahoo.es',
  website                  = NULL,
  postal_code              = '28043',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Hortaleza, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '08490f02-a1c3-43ca-aba3-9a154056d7ea';

-- ROLLBACK LALY
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Chamartín',
  phone                    = '913590895',
  email                    = 'jardindelaly@yahoo.com',
  website                  = NULL,
  postal_code              = '28036',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Chamartín, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '1a67afb7-567e-427b-abef-02bc5ed31d51';

-- ROLLBACK LAR
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Arganzuela',
  phone                    = '666938587',
  email                    = 'larescuelainfantillegazpi@gmail.com',
  website                  = NULL,
  postal_code              = '28045',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Guardería privada en el distrito de Arganzuela, Madrid. Centro de educación infantil de primer ciclo (0-3 años).',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '1571c1d9-5254-4312-899d-f5cfccdc5541';

-- ROLLBACK LAS ACACIAS
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Moncloa-Aravaca',
  phone                    = '914502278',
  email                    = 'proacacias@hotmail.com',
  website                  = 'www.escuelainfantilacacias.es',
  postal_code              = '28040',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Moncloa-Aravaca, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '5469eeb5-dc48-46b2-a0ff-8c59eb832c4e';

-- ROLLBACK LAS NUBES
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Retiro',
  phone                    = '915012443',
  email                    = 'eei.lasnubes.madrid@educa.madrid.org',
  website                  = 'http://www.educa.madrid.org/eei.lasnubes.madrid',
  postal_code              = '28007',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos','comedor','horario-ampliado'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil pública en el distrito de Retiro, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '3f51b9d7-3200-418c-a901-0c60095d2f8d';

-- ROLLBACK LAS PLEYADES
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Hortaleza',
  phone                    = NULL,
  email                    = 'eei.laspleyades.madrid@educa.madrid.org',
  website                  = 'http://www.educa.madrid.org/eei.laspleyades.madrid',
  postal_code              = '28055',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos','comedor','horario-ampliado'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil pública en el distrito de Hortaleza, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = 'aea46d82-c07d-48d6-bfa6-7ac66c2157ba';

-- ROLLBACK LAS VIÑAS
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Moncloa-Aravaca',
  phone                    = '913078175',
  email                    = 'eei.lasvinas.madrid@educa.madrid.org',
  website                  = 'http://www.educa.madrid.org/eei.lasvinas.madrid',
  postal_code              = '28023',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos','comedor','horario-ampliado'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil pública en el distrito de Moncloa-Aravaca, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '01366d6b-34b1-4135-8a91-2551e3da3680';

-- ROLLBACK LITTLE CLOVERS
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Hortaleza',
  phone                    = '696991559',
  email                    = 'info@littleclovers.es',
  website                  = NULL,
  postal_code              = '28043',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Hortaleza, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '78e5d5e1-3cab-4db3-b85a-87f775e88fd4';

-- ROLLBACK LITTLE FEM
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Chamberí',
  phone                    = '915335469',
  email                    = 'paloma@colegiofem.es',
  website                  = NULL,
  postal_code              = '28003',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Chamberí, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '5415af25-14fb-4d27-8988-8d8d3ab31574';

-- ROLLBACK LITTLE WITCH
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Chamartín',
  phone                    = '911305715',
  email                    = 'info@escuelalittlewitch.es',
  website                  = 'http://www.escuelalittlewitch.es',
  postal_code              = '28036',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Chamartín, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = 'ebe5ec06-ad85-4ae4-90c9-dd2dcaabde60';

-- ROLLBACK LOS NANOS CHIFLADOS
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Chamartín',
  phone                    = '914150041',
  email                    = 'escuelainfantillosnanos@gmail.com',
  website                  = NULL,
  postal_code              = '28002',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Chamartín, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '4f2ca8c2-cd7e-4028-9046-253cf659f3a0';

-- ROLLBACK LOS NIDOS DE MANOTERAS
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Hortaleza',
  phone                    = '917681773',
  email                    = 'info@losnidos.es',
  website                  = 'http://www.losnidos.es',
  postal_code              = '28050',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Guardería privada en el distrito de Hortaleza, Madrid. Centro de educación infantil de primer ciclo (0-3 años).',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '7bf3662e-c52c-4ec0-a02f-6fd73ab38e1c';

-- ROLLBACK LOS PINOS
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Salamanca',
  phone                    = '917250761',
  email                    = 'nuria@escuelainfantillospinos.com',
  website                  = 'info@escuelainfantillospinos.com',
  postal_code              = '28028',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos','comedor','horario-ampliado'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Salamanca, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = 'e57b8e0f-e1f4-4e47-b801-b5615acf8c2c';

-- ROLLBACK LUIS BELLO
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Chamartín',
  phone                    = '914132979',
  email                    = 'eei.luisbello.madrid@educa.madrid.org',
  website                  = 'http://www.educa.madrid.org/eei.luisbello.madrid',
  postal_code              = '28002',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil pública en el distrito de Chamartín, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = 'a5f0a48a-102f-45ee-9170-36d984385b43';

-- ROLLBACK MABEROGAN VALDEBEBAS
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Hortaleza',
  phone                    = NULL,
  email                    = 'valdebebas@projardin.es',
  website                  = NULL,
  postal_code              = '28055',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Hortaleza, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '398431aa-2fa4-43cf-8d3e-5570bb9e2506';

-- ROLLBACK MAFALDA
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Chamberí',
  phone                    = '680366888',
  email                    = 'mafaldosdechamberi@gmail.com',
  website                  = 'escuelainfantilmafalda.es',
  postal_code              = '28010',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Chamberí, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '421d8c3d-9eb7-4d79-ab38-b34608e5b5bf';

-- ROLLBACK MAGOS
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Retiro',
  phone                    = '640734319',
  email                    = 'escuelamagos@gmail.com',
  website                  = NULL,
  postal_code              = '28009',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Retiro, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '817f33c5-a1df-4352-b3c0-73743327a9db';

-- ROLLBACK MAMA QUECA II
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Hortaleza',
  phone                    = '913887424',
  email                    = 'eimamaqueca@gmail.com',
  website                  = 'http://mamaqueca.es',
  postal_code              = '28043',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Hortaleza, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '3746a619-9c08-433e-bf15-51a32d8db0ae';

-- ROLLBACK MAMATINA
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Moncloa-Aravaca',
  phone                    = '913078519',
  email                    = 'escuelainfantilmamatina@yahoo.es',
  website                  = NULL,
  postal_code              = '28023',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Moncloa-Aravaca, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '64012e8b-c8d0-42ae-9a42-a4acc88edd2d';

-- ROLLBACK MARGARITA SALAS
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Retiro',
  phone                    = NULL,
  email                    = 'eei.margaritasalas.madrid@educa.madrid.org',
  website                  = 'http://www.educa.madrid.org/eei.margaritasalas.madrid',
  postal_code              = '28007',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil pública en el distrito de Retiro, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = 'aadff91f-1f7f-4e8b-a2bb-ecbcfde37187';

-- ROLLBACK MARGOT
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Moncloa-Aravaca',
  phone                    = '913167283',
  email                    = 'informacion@cimargot.com',
  website                  = 'http://cimargot.com',
  postal_code              = '28039',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Moncloa-Aravaca, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '84cc85e0-e67a-4a33-b463-87a6c0d195fa';

-- ROLLBACK MENAGAR
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Chamartín',
  phone                    = '914579026',
  email                    = 'menagar@menagar.com',
  website                  = 'http://www.menagar.com',
  postal_code              = '28016',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Chamartín, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = 'ed231375-a5b8-4fe4-a867-610a3500b107';

-- ROLLBACK MI CASITA
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Hortaleza',
  phone                    = '913825995',
  email                    = 'info@micasitaescuelainfantil.es',
  website                  = 'http://www.micasitaescuelainfantil.es',
  postal_code              = '28033',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Hortaleza, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '98e7d76c-ea25-42a4-b796-1d1ecacc3970';

-- ROLLBACK MI PEQUEÑO PLANETA
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Salamanca',
  phone                    = '677625707',
  email                    = 'e.i.mipequenoplaneta@gmail.com',
  website                  = NULL,
  postal_code              = '28028',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Salamanca, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = 'f041b437-f593-4088-bb79-0388840a503c';

-- ROLLBACK MI PRIMER COLE 2
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Salamanca',
  phone                    = '913560066',
  email                    = 'miprimercole2@hotmail.com',
  website                  = NULL,
  postal_code              = '28028',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Salamanca, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = 'bad591e9-7637-414d-952b-59bd44cc68fd';

-- ROLLBACK MI PRIMER COLE 4
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Hortaleza',
  phone                    = '913881474',
  email                    = 'direccion@miprimercole.es',
  website                  = NULL,
  postal_code              = '28043',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Hortaleza, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '9714633c-2f9c-4d3e-80c6-7515cda502c4';

-- ROLLBACK MICOS, MI PRIMER COLE
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Chamartín',
  phone                    = '917451791',
  email                    = 'micos@micosmiprimercole.com',
  website                  = 'www.micosmiprimercole.com',
  postal_code              = '28002',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Guardería privada en el distrito de Chamartín, Madrid. Centro de educación infantil de primer ciclo (0-3 años).',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = 'f4b7ba3a-8d41-40ca-a807-a92e5b619fcb';

-- ROLLBACK MIS-MIS
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Chamberí',
  phone                    = '629351330',
  email                    = 'mismis@workandlife.com',
  website                  = NULL,
  postal_code              = '28003',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil pública en el distrito de Chamberí, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = 'cac1f1f0-5658-4d44-bb94-d9715d09bcca';

-- ROLLBACK MOWGLI
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Arganzuela',
  phone                    = '910633263',
  email                    = 'eei.mowgli.madrid@educa.madrid.org',
  website                  = 'http://www.educa.madrid.org/eei.mowgli.madrid',
  postal_code              = '28045',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil pública en el distrito de Arganzuela, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '76eb8258-ce5f-463d-ab50-a71a3a610717';

-- ROLLBACK MUDARRA
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Hortaleza',
  phone                    = '638899889',
  email                    = 'eei.mudarra.madrid@educa.madrid.org',
  website                  = 'http://www.educa.madrid.org/eei.mudarra.madrid',
  postal_code              = '28055',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil pública en el distrito de Hortaleza, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '41e497ae-f44c-4876-b842-e66c84385abf';

-- ROLLBACK MY KIDS
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Salamanca',
  phone                    = '630617063',
  email                    = 'direccionmykids@gmail.com',
  website                  = NULL,
  postal_code              = '28006',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Salamanca, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = 'ffd31a56-745d-4dd9-bc6e-19b4e4a63080';

-- ROLLBACK NAZARET
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Chamartín',
  phone                    = '915617244',
  email                    = 'cc.nazaretchamartin.madrid@educa.madrid.org',
  website                  = NULL,
  postal_code              = '28002',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Guardería concertada en el distrito de Chamartín, Madrid. Centro de educación infantil de primer ciclo (0-3 años).',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = 'c562b08b-221d-42c6-885a-c9ee7a8251d8';

-- ROLLBACK NEMOMARLIN CHAMBERÍ
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Chamberí',
  phone                    = '911404528',
  email                    = 'chamberi@escuelanemomarlin.com',
  website                  = NULL,
  postal_code              = '28015',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Chamberí, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = 'e2a012c7-df53-41bf-b263-9f8990e285f5';

-- ROLLBACK NEMOMARLIN CIUDAD JARDIN
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Chamartín',
  phone                    = '914138957',
  email                    = 'ciudadjardin@escuelanemomarlin.com',
  website                  = 'http://www.escuelanemomarlin.com',
  postal_code              = '28002',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Chamartín, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '566b2631-8266-4a51-8544-d3b322c71767';

-- ROLLBACK NEMOMARLIN CONDE DE ORGAZ
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Hortaleza',
  phone                    = '647830449',
  email                    = 'arturosoria@escuelanemomarlin.com',
  website                  = NULL,
  postal_code              = '28043',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Hortaleza, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '2f2ccb55-1503-42f8-aa71-3a647f08ce85';

-- ROLLBACK NEMOMARLIN GUINDALERA
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Salamanca',
  phone                    = '662215720',
  email                    = 'guindalera@escuelanemomarlin.com',
  website                  = NULL,
  postal_code              = '28028',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Salamanca, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '65326fa5-68ac-49be-881c-412d016476c7';

-- ROLLBACK NEMOMARLIN PASEO DE LA HABANA
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Chamartín',
  phone                    = '651721295',
  email                    = 'paseodelahabana@escuelanemomarlin.com',
  website                  = 'http://www.escuelanemomarlin.com',
  postal_code              = '28036',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Chamartín, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '5a2ee5b7-5694-4e9d-8020-aaa3c2f28c05';

-- ROLLBACK NEMOMARLIN PINTOR ROSALES
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Moncloa-Aravaca',
  phone                    = '914557535',
  email                    = 'pintorrosales@escuelanemomarlin.com',
  website                  = NULL,
  postal_code              = '28008',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Moncloa-Aravaca, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '7073b11f-406b-4156-b350-1fe2cf5ea6f4';

-- ROLLBACK NEMOMARLIN RETIRO
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Retiro',
  phone                    = '659894650',
  email                    = 'retiro@escuelanemomarlin.com',
  website                  = 'http://www.escuelanemomarlin.com',
  postal_code              = '28007',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Retiro, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = 'cb98103f-3f15-439b-be5f-e3a8641f5911';

-- ROLLBACK NEMOMARLIN SANCHINARRO
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Hortaleza',
  phone                    = '911733599',
  email                    = 'sanchinarro@escuelanemomarlin.com',
  website                  = NULL,
  postal_code              = '28050',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Hortaleza, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '045aaf43-3142-405c-ac2f-40e18383e31b';

-- ROLLBACK NUESTRA SEÑORA DE LA PAZ
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Retiro',
  phone                    = '915528595',
  email                    = 'cc.nsdelapaz.madrid@educa.madrid.org',
  website                  = 'https://colegionsdelapaz.es/',
  postal_code              = '28007',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil concertada en el distrito de Retiro, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = 'b6243432-bc19-4956-ba03-392a9c2374ac';

-- ROLLBACK NUESTRA SEÑORA DE LOS DOLORES
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Chamberí',
  phone                    = '914483426',
  email                    = 'cc.nsdelosdolores.madrid@educa.madrid.org',
  website                  = NULL,
  postal_code              = '28015',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil concertada en el distrito de Chamberí, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = 'c37dd7fd-151f-4df1-bf4b-b7561a6db6b2';

-- ROLLBACK OSOBUCO
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Chamartín',
  phone                    = '914130443',
  email                    = NULL,
  website                  = NULL,
  postal_code              = '28002',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Chamartín, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '18560653-1d3f-4fcb-a644-efd32c114c9d';

-- ROLLBACK OSOBUCO II
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Chamartín',
  phone                    = '914139286',
  email                    = 'admin@osobuco.net',
  website                  = 'http://OSOBUCO.NET',
  postal_code              = '28002',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Chamartín, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = 'd84b45f5-b68f-4fab-8125-08076bbce188';

-- ROLLBACK PASITOS MAGICOS
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Retiro',
  phone                    = '915521713',
  email                    = 'info@pasitosmagicos.com',
  website                  = 'www.pasitosmagicos.es',
  postal_code              = '28007',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Retiro, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = 'e50dbc69-9f18-4868-b384-857c2e848910';

-- ROLLBACK PASO A PASO
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Arganzuela',
  phone                    = '914741278',
  email                    = 'info@pasoapasoescuela.com',
  website                  = 'pasoapasoescuela.com',
  postal_code              = '28005',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Arganzuela, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '669c81c1-3b8e-4fc8-a584-353c0a07bb39';

-- ROLLBACK PEDAGOGIA WALDORF DE ARAVACA
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Moncloa-Aravaca',
  phone                    = '917402047',
  email                    = 'info@waldorfaravaca.es',
  website                  = 'http://www.waldorfaravaca.es',
  postal_code              = '28023',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Moncloa-Aravaca, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '7cce9d1a-4a72-456c-9019-4f2157443aa3';

-- ROLLBACK PEQUEANDO
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Hortaleza',
  phone                    = '910234712',
  email                    = 'info@pequeando.es',
  website                  = NULL,
  postal_code              = '28050',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Hortaleza, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '70262e7f-ca4b-4355-8f65-dcc1945ba6f4';

-- ROLLBACK PEQUEMUN
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Chamberí',
  phone                    = '915334319',
  email                    = 'info@pequemun.com',
  website                  = 'www.pequemun.com',
  postal_code              = '28003',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Chamberí, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = 'ebc0572d-c29e-488a-8ea4-9a11d810a48b';

-- ROLLBACK PEQUEÑECOS PARQUE NORTE
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Hortaleza',
  phone                    = '913838205',
  email                    = 'pequenecos@pequenecosparquenorte.es',
  website                  = 'www.pequenecosparquenorte.com',
  postal_code              = '28033',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Hortaleza, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = 'd45d9ea8-6532-4244-938f-49d639038bb9';

-- ROLLBACK PINOCHO
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Retiro',
  phone                    = '914334475',
  email                    = 'administracion@colegioinfantilpinocho.com',
  website                  = 'http://www.colegioinfantilpinocho.com',
  postal_code              = '28007',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Retiro, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '04f8c4bd-ceb8-433a-b59a-a70c3fc1015a';

-- ROLLBACK PIPPO
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Chamartín',
  phone                    = '914158793',
  email                    = 'escinfpippo@gmail.com',
  website                  = 'http://www.escuelainfantilpippo.com',
  postal_code              = '28002',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Chamartín, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '72062e3f-8483-4aae-9be8-c69e7e58c6ba';

-- ROLLBACK PLANETA ENANO NIÑO JESUS
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Retiro',
  phone                    = '916256475',
  email                    = 'miguelangel.leal@hotmail.com',
  website                  = 'www.planetaenano.com',
  postal_code              = '28009',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Retiro, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '6e0bf701-b1d1-47d9-b91b-723d1d8499a0';

-- ROLLBACK PRESCHOOL FEM
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Chamberí',
  phone                    = '915352927',
  email                    = 'isabel@colegiofem.es',
  website                  = NULL,
  postal_code              = '28003',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Guardería privada en el distrito de Chamberí, Madrid. Centro de educación infantil de primer ciclo (0-3 años).',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '01030122-05cd-49f9-98e0-dbef90390cc9';

-- ROLLBACK PROJARDIN DELICIAS
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Arganzuela',
  phone                    = '915303010',
  email                    = 'delicias@projardin.es',
  website                  = 'www.projardin.es',
  postal_code              = '28045',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Arganzuela, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '4ec45fc5-a106-4db9-8db0-d3be5ee6baa4';

-- ROLLBACK PROJARDIN MADIBA
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Hortaleza',
  phone                    = '628695527',
  email                    = 'madiba@projardin.es',
  website                  = NULL,
  postal_code              = '28055',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Hortaleza, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = 'a044c23a-ea1c-4449-927e-f79001c9bda9';

-- ROLLBACK PROJARDIN RETIRO
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Retiro',
  phone                    = '914090968',
  email                    = 'retiro@projardin.es',
  website                  = 'www.projardin.es',
  postal_code              = '28009',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Retiro, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = 'a397737d-837d-48f7-b108-92767f0a488e';

-- ROLLBACK RAMON Y CAJAL
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Hortaleza',
  phone                    = '913000288',
  email                    = 'r.cajal@rcajal.es',
  website                  = 'http://www.colegiosramonycajal.es/',
  postal_code              = '28043',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Guardería privada en el distrito de Hortaleza, Madrid. Centro de educación infantil de primer ciclo (0-3 años).',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '4270b43b-2c05-467b-8ae4-ddad6e685ede';

-- ROLLBACK REINA DE LOS ANGELES
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Chamartín',
  phone                    = '915638760',
  email                    = 'info@reinadelosangeles.es',
  website                  = NULL,
  postal_code              = '28002',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Guardería privada en el distrito de Chamartín, Madrid. Centro de educación infantil de primer ciclo (0-3 años).',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '70834c78-3162-438f-903a-621d4eab155f';

-- ROLLBACK ROCIO DURCAL
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Hortaleza',
  phone                    = '913923375',
  email                    = 'eei.rociodurcal.madrid@educa.madrid.org',
  website                  = 'http://www.educa.madrid.org/eei.rociodurcal.madrid',
  postal_code              = '28050',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil pública en el distrito de Hortaleza, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '08591fa0-d00b-4b14-a313-3582865e5084';

-- ROLLBACK ROSA
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Chamartín',
  phone                    = '913501362',
  email                    = 'eei.rosa.madrid@educa.madrid.org',
  website                  = 'http://www.educa.madrid.org/eei.rosa.madrid',
  postal_code              = '28036',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil pública en el distrito de Chamartín, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = 'ebf1b842-9366-43ea-a76f-108f9b14b459';

-- ROLLBACK RUIZ JIMENEZ
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Salamanca',
  phone                    = '911694809',
  email                    = 'eei.ruizjimenez.madrid@educa.madrid.org',
  website                  = 'http://www.educa.madrid.org/eei.ruizjimenez.madrid',
  postal_code              = '28028',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos','comedor','horario-ampliado'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil pública en el distrito de Salamanca, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = 'f37d3024-9b20-48c2-b43f-f334a3a89f67';

-- ROLLBACK SAN ALONSO DE OROZCO
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Chamberí',
  phone                    = '650831333',
  email                    = 'eisanalonso.madrid@agustinas.es',
  website                  = 'http://madrid.agustinas.es',
  postal_code              = '28003',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Chamberí, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '8490e2e8-37bf-4608-9d00-bbc817eec02b';

-- ROLLBACK SAN GABRIEL ARCANGEL
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Moncloa-Aravaca',
  phone                    = '913165945',
  email                    = 'cc.sangabrielarcangel.madrid@educa.madrid.org',
  website                  = NULL,
  postal_code              = '28035',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil concertada en el distrito de Moncloa-Aravaca, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '87e10931-e3a1-44cd-b031-56eee7f154b1';

-- ROLLBACK SAN JOSE DE CLUNY
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Moncloa-Aravaca',
  phone                    = '914597103',
  email                    = 'cc.sanjosedecluny.madrid@educa.madrid.org',
  website                  = 'www.clunyvillaamil.es',
  postal_code              = '28039',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Guardería concertada en el distrito de Moncloa-Aravaca, Madrid. Centro de educación infantil de primer ciclo (0-3 años).',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = 'c755df20-7f87-4611-a806-815f4c8db1d6';

-- ROLLBACK SAN MIGUEL
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Hortaleza',
  phone                    = '913820145',
  email                    = 'cn.sanmiguel.madrid@educa.madrid.org',
  website                  = 'http://www.educa.madrid.org/cn.sanmiguel.madrid',
  postal_code              = '28033',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil pública en el distrito de Hortaleza, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = 'ba9f78ff-fa1a-46ba-9258-a61fd53534f0';

-- ROLLBACK SAN PATRICIO
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Chamartín',
  phone                    = '915638420',
  email                    = 'infoserrano@colegiosanpatricio.es',
  website                  = NULL,
  postal_code              = '28002',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Chamartín, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '6fb1382c-2ed3-47b3-a947-55b962f9dbea';

-- ROLLBACK SANTA BERNARDITA
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Salamanca',
  phone                    = '913093322',
  email                    = 'cc.santabernardita.madrid@educa.madrid.org',
  website                  = 'http://www.santabernardita.es',
  postal_code              = '28006',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Guardería concertada en el distrito de Salamanca, Madrid. Centro de educación infantil de primer ciclo (0-3 años).',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = 'a46d7d07-158b-4330-9fb5-c6c0c0ecce72';

-- ROLLBACK SANTA ROSALIA
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Hortaleza',
  phone                    = '913001988',
  email                    = 'cc.santarosalia.madrid@educa.madrid.org',
  website                  = NULL,
  postal_code              = '28043',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil concertada en el distrito de Hortaleza, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = 'c4123daa-aec8-431f-bb2e-7b43bf106f7f';

-- ROLLBACK ST. ALICE'S NURSERY GALILEO
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Chamberí',
  phone                    = NULL,
  email                    = NULL,
  website                  = NULL,
  postal_code              = '28015',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Chamberí, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '660e3319-c883-46a8-a2c1-132d8aec4608';

-- ROLLBACK TEO
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Chamberí',
  phone                    = NULL,
  email                    = 'info@escuelainfantilteo.es',
  website                  = 'http://www.escuelainfantilteo.es',
  postal_code              = '28010',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Chamberí, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '921a11e3-0008-48fd-ab4a-d2b03bc3095d';

-- ROLLBACK TEO BRETON
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Chamberí',
  phone                    = '686364244',
  email                    = 'info@escuelainfantilteo.es',
  website                  = 'www.escuelainfantilteo.es',
  postal_code              = '28003',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Chamberí, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '91e6b9be-43aa-4c18-9cd5-e9d0f6e817f4';

-- ROLLBACK THE LITTLE ONE
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Chamartín',
  phone                    = '914571203',
  email                    = 'tloescuelainfantil@gmail.com',
  website                  = NULL,
  postal_code              = '28036',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Chamartín, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '13eee06b-766c-4784-9e66-4262c55f73a5';

-- ROLLBACK TIERRA LALA
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Hortaleza',
  phone                    = '625712267',
  email                    = 'info@tierralala.com',
  website                  = NULL,
  postal_code              = '28043',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Hortaleza, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '687b16a9-8e89-476b-a840-ebb7b773907d';

-- ROLLBACK TODO NIÑOS NURSERY
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Moncloa-Aravaca',
  phone                    = '913070588',
  email                    = 'agatacareaga@gmail.com',
  website                  = NULL,
  postal_code              = '28023',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Guardería privada en el distrito de Moncloa-Aravaca, Madrid. Centro de educación infantil de primer ciclo (0-3 años).',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '3599376e-d55d-4c74-a10c-77a198a71bfe';

-- ROLLBACK TODO PARA LA INFANCIA
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Moncloa-Aravaca',
  phone                    = '914507782',
  email                    = 'todoparalainfancia@gmail.com',
  website                  = 'http://www.todoparalainfancia.es',
  postal_code              = '28039',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Moncloa-Aravaca, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '0e32a415-31b8-49a0-9cd5-65120c5bd3b3';

-- ROLLBACK TRAZOS
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Salamanca',
  phone                    = '915743094',
  email                    = NULL,
  website                  = NULL,
  postal_code              = '28028',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Salamanca, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '130327c1-c4b0-49a3-a27c-d9a18d9b64c9';

-- ROLLBACK TRILEMA SAFA
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Salamanca',
  phone                    = '915733154',
  email                    = 'cc.sagradafamilia-salamanca.madrid@educa.madrid.org',
  website                  = 'http://www.colegio-sagradafamilia.es',
  postal_code              = '28028',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil concertada en el distrito de Salamanca, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = 'eb4dff3e-5eea-41b0-818a-cd78e59f419b';

-- ROLLBACK ULU
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Retiro',
  phone                    = '689399565',
  email                    = 'escuelainfantilulu@gmail.com',
  website                  = NULL,
  postal_code              = '28014',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Retiro, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = 'b9448c81-342f-48b3-8c8e-9662b232fd16';

-- ROLLBACK UP! KIDS SCHOOL
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Hortaleza',
  phone                    = '630081809',
  email                    = 'direction@upkidsschool.es',
  website                  = 'https://www.upkidsschool.com',
  postal_code              = '28043',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Hortaleza, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = 'efa9caae-d780-4ec5-8fe1-cfd2bee68b97';

-- ROLLBACK VALLEHERMOSO
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Chamberí',
  phone                    = '915941326',
  email                    = 'eei.vallehermoso.madrid@educa.madrid.org',
  website                  = 'http://www.educa.madrid.org/eei.vallehermoso.madrid',
  postal_code              = '28015',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil pública en el distrito de Chamberí, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '781601b2-aecb-4e1e-b456-9f862f02961c';

-- ROLLBACK VIB VALDEBEBAS
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Hortaleza',
  phone                    = '913813993',
  email                    = 'info@vibvaldebebas.com',
  website                  = 'http://vibescuelainfantil.com/valdebebas/',
  postal_code              = '28050',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Hortaleza, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '440bd2c0-b776-4e7a-ab44-1cff0d29439d';

-- ROLLBACK VIRGEN MILAGROSA
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Hortaleza',
  phone                    = '917638756',
  email                    = 'cc.virgenmilagrosa.madrid@educa.madrid.org',
  website                  = 'http://www.colegiovirgenmilagrosa.com',
  postal_code              = '28033',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil concertada en el distrito de Hortaleza, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '4a5f6617-8356-46e8-86ee-9653d81b4775';

-- ROLLBACK YAKI
UPDATE centers SET
  neighborhood_barrio      = NULL,
  district                 = 'Chamartín',
  phone                    = '915190127',
  email                    = 'info@eiyaki.com',
  website                  = 'www.eiyaki.com',
  postal_code              = '28016',
  services                 = ARRAY['aula-0-1-anos','aula-1-2-anos','aula-2-3-anos'],
  age_min_months           = 4,
  age_max_months           = 36,
  source_url               = NULL,
  short_description        = 'Escuela infantil privada en el distrito de Chamartín, Madrid. Centro de primer ciclo de educación infantil para niños de 0 a 3 años.',
  verification_status      = 'unverified',
  confidence_level         = 'unknown',
  verified_at              = NULL,
  data_conflicts           = '{}'::jsonb,
  updated_at              = NOW()
WHERE id = '0046c9df-fdbe-41cd-9719-5ed609a69533';

COMMIT;