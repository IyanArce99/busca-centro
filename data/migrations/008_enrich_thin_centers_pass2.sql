-- UPDATE 008 — Enriquecimiento 2ª pasada de centros finos (Madrid)
-- Generado: 2026-07-03. 14 centros. Servicios confirmados por investigación pública.
-- Nota: en las escuelas infantiles MUNICIPALES el comedor (obligatorio) y el horario ampliado
--       provienen del modelo oficial documentado del Ayuntamiento/Comunidad de Madrid.
-- Solo actualiza services, long_description, pedagogical_approach, schedule, verification_status, confidence_level, verified_at, updated_at.
-- Sin DELETE/DROP/TRUNCATE. Revisar antes de ejecutar.

BEGIN;

-- BOREAL DREAMING TOGETHER  [medium] servicios: bilingue, ingles
UPDATE centers SET
  services            = ARRAY['bilingue','ingles']::text[],
  long_description    = E'BOREAL DREAMING TOGETHER es una guardería privada ubicada en el distrito madrileño de Hortaleza. Está orientada al primer ciclo de Educación Infantil, la etapa de 0 a 3 años.\n\nEl centro ofrece, según la información pública, un proyecto bilingüe. Trabaja con la metodología Montessori.\n\nPara detalles sobre el día a día, el horario y el proceso de admisión, lo mejor es ponerse en contacto directamente con el centro.',
  pedagogical_approach = ARRAY['montessori']::text[],
  verification_status = 'partially_verified',
  confidence_level    = 'medium',
  verified_at         = '2026-07-03',
  updated_at          = NOW()
WHERE id = 'eb0f284a-a6d6-4d31-b80f-711c85e83be7';

-- LA VIRGEN NIÑA  [medium] servicios: comedor, ingles, musica
UPDATE centers SET
  services            = ARRAY['comedor','ingles','musica']::text[],
  long_description    = E'LA VIRGEN NIÑA es una escuela infantil privada situada en el barrio de San Juan Bautista, en el distrito de Hortaleza (Madrid). Atiende el primer ciclo de Educación Infantil, es decir, la etapa de 0 a 3 años.\n\nLos datos publicados incluyen servicios como iniciación al inglés y servicio de comedor. También se mencionan música.\n\nLos datos se han recopilado de fuentes públicas; conviene verificar con el propio centro la disponibilidad de plaza, el calendario y las tarifas antes de decidir.',
  schedule            = 'Lunes a viernes de 7:30 a 18:00',
  verification_status = 'partially_verified',
  confidence_level    = 'medium',
  verified_at         = '2026-07-03',
  updated_at          = NOW()
WHERE id = '08490f02-a1c3-43ca-aba3-9a154056d7ea';

-- EIPA ESCUELA INFANTIL PARQUE DE LAS AVENIDAS  [medium] servicios: (ninguno; método reggio-emilia)
UPDATE centers SET
  services            = ARRAY[]::text[],
  long_description    = E'EIPA ESCUELA INFANTIL PARQUE DE LAS AVENIDAS es una escuela infantil privada situada en el distrito de Salamanca, en Madrid. Atiende el primer ciclo de Educación Infantil, es decir, la etapa de 0 a 3 años.\n\nSegún la información pública, su proyecto educativo se basa en la metodología Reggio Emilia.\n\nLa ficha recopila datos de ubicación, contacto y servicios a partir de fuentes públicas. Antes de solicitar plaza conviene confirmar directamente con el centro los horarios, la disponibilidad y las condiciones de admisión.',
  pedagogical_approach = ARRAY['reggio-emilia']::text[],
  verification_status = 'partially_verified',
  confidence_level    = 'medium',
  verified_at         = '2026-07-03',
  updated_at          = NOW()
WHERE id = 'aaf3ad28-9ca8-4985-a4ac-eab39910bf3b';

-- BULARAS INIA  [medium] servicios: comedor, catering, horario-ampliado, ingles
UPDATE centers SET
  services            = ARRAY['comedor','catering','horario-ampliado','ingles']::text[],
  long_description    = E'Situada en Madrid, en el barrio de Ciudad Universitaria (distrito de Moncloa-Aravaca), BULARAS INIA es una escuela infantil pública. Su actividad se centra en el primer ciclo de Educación Infantil, de 0 a 3 años.\n\nEntre los servicios recogidos en fuentes públicas figuran comedor con servicio de catering, iniciación al inglés y horario ampliado.\n\nLa ficha recopila datos de ubicación, contacto y servicios a partir de fuentes públicas. Antes de solicitar plaza conviene confirmar directamente con el centro los horarios, la disponibilidad y las condiciones de admisión.',
  verification_status = 'partially_verified',
  confidence_level    = 'medium',
  verified_at         = '2026-07-03',
  updated_at          = NOW()
WHERE id = '23c85dad-5ef1-4b17-84c8-899098f2a537';

-- EL BARBERILLO DE LAVAPIES  [medium] servicios: comedor, horario-ampliado
UPDATE centers SET
  services            = ARRAY['comedor','horario-ampliado']::text[],
  long_description    = E'EL BARBERILLO DE LAVAPIES es una escuela infantil pública situada en el barrio de Delicias, en el distrito de Arganzuela (Madrid). Atiende el primer ciclo de Educación Infantil, es decir, la etapa de 0 a 3 años.\n\nLos datos publicados incluyen servicios como horario ampliado y servicio de comedor.\n\nLos datos se han recopilado de fuentes públicas; conviene verificar con el propio centro la disponibilidad de plaza, el calendario y las tarifas antes de decidir.',
  verification_status = 'partially_verified',
  confidence_level    = 'medium',
  verified_at         = '2026-07-03',
  updated_at          = NOW()
WHERE id = '951abe34-4a16-4f7e-8b42-73b27fe7b99d';

-- EL TREN DE LA FRESA  [medium] servicios: comedor, catering, horario-ampliado, patio-exterior
UPDATE centers SET
  services            = ARRAY['comedor','catering','horario-ampliado','patio-exterior']::text[],
  long_description    = E'EL TREN DE LA FRESA es una escuela infantil pública ubicada en el distrito madrileño de Arganzuela, en el barrio de Delicias. Está orientada al primer ciclo de Educación Infantil, la etapa de 0 a 3 años.\n\nEl centro ofrece, según la información pública, patio exterior, horario ampliado y comedor con servicio de catering.\n\nPara detalles sobre el día a día, el horario y el proceso de admisión, lo mejor es ponerse en contacto directamente con el centro.',
  verification_status = 'partially_verified',
  confidence_level    = 'medium',
  verified_at         = '2026-07-03',
  updated_at          = NOW()
WHERE id = '9e1832f5-d017-4c20-95a1-caff7a7fe138';

-- ROCIO DURCAL  [medium] servicios: comedor, horario-ampliado
UPDATE centers SET
  services            = ARRAY['comedor','horario-ampliado']::text[],
  long_description    = E'ROCIO DURCAL es una escuela infantil pública ubicada en el distrito madrileño de Hortaleza, en el barrio de Valdefuentes. Está orientada al primer ciclo de Educación Infantil, la etapa de 0 a 3 años.\n\nSegún la información disponible, el centro cuenta con servicio de comedor y horario ampliado.\n\nEsta información procede de fuentes públicas y puede no estar completa. Para conocer horarios actualizados, plazas y cuotas, lo recomendable es contactar con el centro.',
  verification_status = 'partially_verified',
  confidence_level    = 'medium',
  verified_at         = '2026-07-03',
  updated_at          = NOW()
WHERE id = '08591fa0-d00b-4b14-a313-3582865e5084';

-- MARGARITA SALAS  [medium] servicios: horario-ampliado
UPDATE centers SET
  services            = ARRAY['horario-ampliado']::text[],
  long_description    = E'MARGARITA SALAS es una escuela infantil de titularidad pública que presta servicio en el barrio de Pacífico, en el distrito de Retiro (Madrid). Atiende el primer ciclo de Educación Infantil, es decir, la etapa de 0 a 3 años.\n\nEl centro ofrece, según la información pública, horario ampliado.\n\nPara detalles sobre el día a día, el horario y el proceso de admisión, lo mejor es ponerse en contacto directamente con el centro.',
  verification_status = 'partially_verified',
  confidence_level    = 'medium',
  verified_at         = '2026-07-03',
  updated_at          = NOW()
WHERE id = 'aadff91f-1f7f-4e8b-a2bb-ecbcfde37187';

-- MOWGLI  [medium] servicios: comedor, horario-ampliado
UPDATE centers SET
  services            = ARRAY['comedor','horario-ampliado']::text[],
  long_description    = E'MOWGLI, escuela infantil pública, se encuentra en el distrito madrileño de Arganzuela. Está orientada al primer ciclo de Educación Infantil, la etapa de 0 a 3 años.\n\nEntre los servicios recogidos en fuentes públicas figuran servicio de comedor y horario ampliado.\n\nLa ficha recopila datos de ubicación, contacto y servicios a partir de fuentes públicas. Antes de solicitar plaza conviene confirmar directamente con el centro los horarios, la disponibilidad y las condiciones de admisión.',
  verification_status = 'partially_verified',
  confidence_level    = 'medium',
  verified_at         = '2026-07-03',
  updated_at          = NOW()
WHERE id = '76eb8258-ce5f-463d-ab50-a71a3a610717';

-- MUDARRA  [medium] servicios: comedor, horario-ampliado
UPDATE centers SET
  services            = ARRAY['comedor','horario-ampliado']::text[],
  long_description    = E'Situada en Madrid, en el distrito de Hortaleza, MUDARRA es una escuela infantil pública. Su actividad se centra en el primer ciclo de Educación Infantil, de 0 a 3 años.\n\nEntre los servicios recogidos en fuentes públicas figuran horario ampliado y servicio de comedor.\n\nLa ficha recopila datos de ubicación, contacto y servicios a partir de fuentes públicas. Antes de solicitar plaza conviene confirmar directamente con el centro los horarios, la disponibilidad y las condiciones de admisión.',
  verification_status = 'partially_verified',
  confidence_level    = 'medium',
  verified_at         = '2026-07-03',
  updated_at          = NOW()
WHERE id = '41e497ae-f44c-4876-b842-e66c84385abf';

-- ROSA  [medium] servicios: comedor, horario-ampliado
UPDATE centers SET
  services            = ARRAY['comedor','horario-ampliado']::text[],
  long_description    = E'ROSA es una escuela infantil de titularidad pública que presta servicio en el barrio de Valverde, en el distrito de Chamartín (Madrid). Atiende el primer ciclo de Educación Infantil, es decir, la etapa de 0 a 3 años.\n\nEl centro ofrece, según la información pública, servicio de comedor y horario ampliado.\n\nPara detalles sobre el día a día, el horario y el proceso de admisión, lo mejor es ponerse en contacto directamente con el centro.',
  verification_status = 'partially_verified',
  confidence_level    = 'medium',
  verified_at         = '2026-07-03',
  updated_at          = NOW()
WHERE id = 'ebf1b842-9366-43ea-a76f-108f9b14b459';

-- LUIS BELLO  [medium] servicios: comedor, horario-ampliado
UPDATE centers SET
  services            = ARRAY['comedor','horario-ampliado']::text[],
  long_description    = E'LUIS BELLO es una escuela infantil de titularidad pública que presta servicio en el barrio de Prosperidad, en el distrito de Chamartín (Madrid). Atiende el primer ciclo de Educación Infantil, es decir, la etapa de 0 a 3 años.\n\nEl centro ofrece, según la información pública, horario ampliado y servicio de comedor.\n\nPara detalles sobre el día a día, el horario y el proceso de admisión, lo mejor es ponerse en contacto directamente con el centro.',
  verification_status = 'partially_verified',
  confidence_level    = 'medium',
  verified_at         = '2026-07-03',
  updated_at          = NOW()
WHERE id = 'a5f0a48a-102f-45ee-9170-36d984385b43';

-- GUARDILLA INFANTIL  [medium] servicios: comedor, horario-ampliado
UPDATE centers SET
  services            = ARRAY['comedor','horario-ampliado']::text[],
  long_description    = E'GUARDILLA INFANTIL es una escuela infantil pública ubicada en el distrito madrileño de Chamberí, en el barrio de Vallehermoso. Está orientada al primer ciclo de Educación Infantil, la etapa de 0 a 3 años.\n\nSegún la información disponible, el centro cuenta con horario ampliado y servicio de comedor.\n\nEsta información procede de fuentes públicas y puede no estar completa. Para conocer horarios actualizados, plazas y cuotas, lo recomendable es contactar con el centro.',
  verification_status = 'partially_verified',
  confidence_level    = 'medium',
  verified_at         = '2026-07-03',
  updated_at          = NOW()
WHERE id = '4cf5b474-5847-4f5d-9b13-b45dec06a1a9';

-- COLEGIO MADRID FSM-SOTILLO  [medium] servicios: patio-exterior
UPDATE centers SET
  services            = ARRAY['patio-exterior']::text[],
  long_description    = E'COLEGIO MADRID FSM-SOTILLO es una guardería privada con sede en Madrid, en el distrito de Hortaleza. Su actividad se centra en el primer ciclo de Educación Infantil, de 0 a 3 años.\n\nSegún la información disponible, el centro cuenta con patio exterior.\n\nEsta información procede de fuentes públicas y puede no estar completa. Para conocer horarios actualizados, plazas y cuotas, lo recomendable es contactar con el centro.',
  verification_status = 'partially_verified',
  confidence_level    = 'medium',
  verified_at         = '2026-07-03',
  updated_at          = NOW()
WHERE id = 'd2803c85-fcae-4862-b1b9-5e2617575e24';

COMMIT;

-- 14 centros.