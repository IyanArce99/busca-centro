-- ============================================================
-- UPDATE 006 — Enriquecimiento de centros "finos" (Madrid)
-- Generado: 2026-07-03
-- ============================================================
-- 30 centros que estaban sin servicios ni long_description.
-- Servicios CONFIRMADOS por investigación (web oficial / Ayuntamiento / CAM /
-- directorios públicos). No se inventan servicios; solo lo indicado explícitamente.
-- Actualiza: services, long_description, pedagogical_approach, schedule,
--           verification_status, confidence_level, verified_at, updated_at.
-- No toca: id, slug, city_slug, status, name, street, phone, email, website, images, faqs.
-- Sin DELETE / DROP / TRUNCATE. Revisar antes de ejecutar. NO ejecutado.
-- ============================================================

BEGIN;

-- ARCANGEL  [high] servicios: comedor, catering, horario-ampliado, ingles, patio-exterior, musica, actividades-extraescolares
UPDATE centers SET
  services            = ARRAY['comedor','catering','horario-ampliado','ingles','patio-exterior','musica','actividades-extraescolares']::text[],
  long_description    = E'ARCANGEL es una escuela infantil de titularidad concertada que presta servicio en el barrio de Niño Jesús, en el distrito de Retiro (Madrid). Atiende el primer ciclo de Educación Infantil, es decir, la etapa de 0 a 3 años.\n\nEl centro ofrece, según la información pública, patio exterior, horario ampliado, iniciación al inglés y comedor con servicio de catering. A ello se suman música y actividades extraescolares.\n\nPara detalles sobre el día a día, el horario y el proceso de admisión, lo mejor es ponerse en contacto directamente con el centro.',
  verification_status = 'partially_verified',
  confidence_level    = 'high',
  verified_at         = '2026-07-03',
  updated_at          = NOW()
WHERE id = 'd0cf3120-bbf4-4207-a85a-1f616f1c951b';

-- CASA NIDO  [high] servicios: bilingue, ingles
UPDATE centers SET
  services            = ARRAY['bilingue','ingles']::text[],
  long_description    = E'CASA NIDO es una escuela infantil privada ubicada en el distrito madrileño de Arganzuela. Está orientada al primer ciclo de Educación Infantil, la etapa de 0 a 3 años.\n\nEl centro ofrece, según la información pública, un proyecto bilingüe. Trabaja con metodología Montessori.\n\nPara detalles sobre el día a día, el horario y el proceso de admisión, lo mejor es ponerse en contacto directamente con el centro.',
  pedagogical_approach = ARRAY['montessori']::text[],
  verification_status = 'partially_verified',
  confidence_level    = 'high',
  verified_at         = '2026-07-03',
  updated_at          = NOW()
WHERE id = '0d88e41b-fdb8-4d20-8cb5-f75f3efe609b';

-- COCORICO  [high] servicios: comedor, ingles, musica, psicomotricidad, actividades-extraescolares
UPDATE centers SET
  services            = ARRAY['comedor','ingles','musica','psicomotricidad','actividades-extraescolares']::text[],
  long_description    = E'COCORICO es una escuela infantil privada situada en el barrio de Prosperidad, en el distrito de Chamartín (Madrid). Atiende el primer ciclo de Educación Infantil, es decir, la etapa de 0 a 3 años.\n\nLos datos publicados incluyen servicios como servicio de comedor y iniciación al inglés. También se mencionan música, psicomotricidad y actividades extraescolares.\n\nLos datos se han recopilado de fuentes públicas; conviene verificar con el propio centro la disponibilidad de plaza, el calendario y las tarifas antes de decidir.',
  verification_status = 'partially_verified',
  confidence_level    = 'high',
  verified_at         = '2026-07-03',
  updated_at          = NOW()
WHERE id = 'a38e2b2e-c080-4906-9b86-90ed0f79b07c';

-- DE PEQUES  [high] servicios: comedor, cocina-propia, bilingue, ingles, patio-exterior, verano-campamentos
UPDATE centers SET
  services            = ARRAY['comedor','cocina-propia','bilingue','ingles','patio-exterior','verano-campamentos']::text[],
  long_description    = E'DE PEQUES es una escuela infantil de titularidad privada que presta servicio en el barrio de Casco Histórico de Vallecas, en el distrito de Retiro (Madrid). Atiende el primer ciclo de Educación Infantil, es decir, la etapa de 0 a 3 años.\n\nSegún la información disponible, el centro cuenta con servicio de comedor con cocina propia, patio exterior y un proyecto bilingüe. A ello se suman campamentos de verano.\n\nEsta información procede de fuentes públicas y puede no estar completa. Para conocer horarios actualizados, plazas y cuotas, lo recomendable es contactar con el centro.',
  schedule            = 'Lunes a viernes de 8:00 a 18:15',
  verification_status = 'partially_verified',
  confidence_level    = 'high',
  verified_at         = '2026-07-03',
  updated_at          = NOW()
WHERE id = '9038eb6c-8ab3-4614-8faf-90439fee4a8b';

-- ESCUELA MONTESSORI MADRID  [high] servicios: verano-campamentos
UPDATE centers SET
  services            = ARRAY['verano-campamentos']::text[],
  long_description    = E'ESCUELA MONTESSORI MADRID es una guardería privada ubicada en el distrito madrileño de Moncloa-Aravaca. Está orientada al primer ciclo de Educación Infantil, la etapa de 0 a 3 años.\n\nEl centro ofrece, según la información pública, campamentos de verano. Trabaja con metodología Montessori.\n\nPara detalles sobre el día a día, el horario y el proceso de admisión, lo mejor es ponerse en contacto directamente con el centro.',
  pedagogical_approach = ARRAY['montessori']::text[],
  verification_status = 'partially_verified',
  confidence_level    = 'high',
  verified_at         = '2026-07-03',
  updated_at          = NOW()
WHERE id = 'c71ac4d7-6f24-447e-a355-5a5153139676';

-- KIDS RETIRO  [high] servicios: musica, actividades-extraescolares, verano-campamentos, orientacion-pedagogica, escuela-de-padres
UPDATE centers SET
  services            = ARRAY['musica','actividades-extraescolares','verano-campamentos','orientacion-pedagogica','escuela-de-padres']::text[],
  long_description    = E'Situada en Madrid, en el barrio de Adelfas (distrito de Retiro), KIDS RETIRO es una escuela infantil privada. Su actividad se centra en el primer ciclo de Educación Infantil, de 0 a 3 años.\n\nEntre los servicios recogidos en fuentes públicas figuran música, orientación pedagógica, campamentos de verano, escuela de familias y actividades extraescolares.\n\nLa ficha recopila datos de ubicación, contacto y servicios a partir de fuentes públicas. Antes de solicitar plaza conviene confirmar directamente con el centro los horarios, la disponibilidad y las condiciones de admisión.',
  verification_status = 'partially_verified',
  confidence_level    = 'high',
  verified_at         = '2026-07-03',
  updated_at          = NOW()
WHERE id = '242aa7ba-3c90-4b31-8c3a-3338f154d2c1';

-- LA CASA DEL RIO - MIRIAM  [high] servicios: patio-exterior
UPDATE centers SET
  services            = ARRAY['patio-exterior']::text[],
  long_description    = E'LA CASA DEL RIO - MIRIAM, escuela infantil privada, se encuentra en el distrito madrileño de Moncloa-Aravaca, en el barrio de Casa de Campo. Está orientada al primer ciclo de Educación Infantil, la etapa de 0 a 3 años.\n\nLos datos publicados incluyen servicios como patio exterior.\n\nLos datos se han recopilado de fuentes públicas; conviene verificar con el propio centro la disponibilidad de plaza, el calendario y las tarifas antes de decidir.',
  schedule            = 'Lunes a viernes de 7:30 a 18:00',
  verification_status = 'partially_verified',
  confidence_level    = 'high',
  verified_at         = '2026-07-03',
  updated_at          = NOW()
WHERE id = '5a2d153b-8a20-4438-9d11-eb083ac59ef2';

-- LAS ACACIAS  [high] servicios: comedor, cocina-propia, bilingue, ingles, patio-exterior, actividades-extraescolares, verano-campamentos, escuela-de-padres
UPDATE centers SET
  services            = ARRAY['comedor','cocina-propia','bilingue','ingles','patio-exterior','actividades-extraescolares','verano-campamentos','escuela-de-padres']::text[],
  long_description    = E'LAS ACACIAS es una escuela infantil de titularidad privada que presta servicio en el barrio de Ciudad Universitaria, en el distrito de Moncloa-Aravaca (Madrid). Atiende el primer ciclo de Educación Infantil, es decir, la etapa de 0 a 3 años.\n\nEl centro ofrece, según la información pública, patio exterior, servicio de comedor con cocina propia y un proyecto bilingüe. A ello se suman actividades extraescolares, campamentos de verano y escuela de familias.\n\nPara detalles sobre el día a día, el horario y el proceso de admisión, lo mejor es ponerse en contacto directamente con el centro.',
  schedule            = 'Lunes a viernes de 7:30 a 19:00',
  verification_status = 'partially_verified',
  confidence_level    = 'high',
  verified_at         = '2026-07-03',
  updated_at          = NOW()
WHERE id = '5469eeb5-dc48-46b2-a0ff-8c59eb832c4e';

-- MI CASITA  [high] servicios: ingles
UPDATE centers SET
  services            = ARRAY['ingles']::text[],
  long_description    = E'MI CASITA, escuela infantil privada, se encuentra en el distrito madrileño de Hortaleza, en el barrio de Pinar del Rey. Está orientada al primer ciclo de Educación Infantil, la etapa de 0 a 3 años.\n\nLos datos publicados incluyen servicios como iniciación al inglés.\n\nLos datos se han recopilado de fuentes públicas; conviene verificar con el propio centro la disponibilidad de plaza, el calendario y las tarifas antes de decidir.',
  verification_status = 'partially_verified',
  confidence_level    = 'high',
  verified_at         = '2026-07-03',
  updated_at          = NOW()
WHERE id = '98e7d76c-ea25-42a4-b796-1d1ecacc3970';

-- PEDAGOGIA WALDORF DE ARAVACA  [high] servicios: verano-campamentos
UPDATE centers SET
  services            = ARRAY['verano-campamentos']::text[],
  long_description    = E'PEDAGOGIA WALDORF DE ARAVACA, escuela infantil privada, se encuentra en el distrito madrileño de Moncloa-Aravaca, en el barrio de Aravaca. Está orientada al primer ciclo de Educación Infantil, la etapa de 0 a 3 años.\n\nEntre los servicios recogidos en fuentes públicas figuran campamentos de verano. Trabaja con pedagogía Waldorf.\n\nLa ficha recopila datos de ubicación, contacto y servicios a partir de fuentes públicas. Antes de solicitar plaza conviene confirmar directamente con el centro los horarios, la disponibilidad y las condiciones de admisión.',
  pedagogical_approach = ARRAY['waldorf']::text[],
  verification_status = 'partially_verified',
  confidence_level    = 'high',
  verified_at         = '2026-07-03',
  updated_at          = NOW()
WHERE id = '7cce9d1a-4a72-456c-9019-4f2157443aa3';

-- PIPPO  [high] servicios: cocina-propia, horario-ampliado, ingles, psicomotricidad, musica, actividades-extraescolares, escuela-de-padres
UPDATE centers SET
  services            = ARRAY['cocina-propia','horario-ampliado','ingles','psicomotricidad','musica','actividades-extraescolares','escuela-de-padres']::text[],
  long_description    = E'PIPPO, escuela infantil privada, se encuentra en el distrito madrileño de Chamartín, en el barrio de Prosperidad. Está orientada al primer ciclo de Educación Infantil, la etapa de 0 a 3 años.\n\nEntre los servicios recogidos en fuentes públicas figuran horario ampliado, iniciación al inglés y cocina propia. También se mencionan actividades extraescolares, música, escuela de familias y psicomotricidad.\n\nLa ficha recopila datos de ubicación, contacto y servicios a partir de fuentes públicas. Antes de solicitar plaza conviene confirmar directamente con el centro los horarios, la disponibilidad y las condiciones de admisión.',
  verification_status = 'partially_verified',
  confidence_level    = 'high',
  verified_at         = '2026-07-03',
  updated_at          = NOW()
WHERE id = '72062e3f-8483-4aae-9be8-c69e7e58c6ba';

-- PLANETA ENANO NIÑO JESUS  [high] servicios: bilingue, ingles, psicomotricidad, actividades-extraescolares, verano-campamentos, orientacion-pedagogica, horario-ampliado
UPDATE centers SET
  services            = ARRAY['bilingue','ingles','psicomotricidad','actividades-extraescolares','verano-campamentos','orientacion-pedagogica','horario-ampliado']::text[],
  long_description    = E'Situada en Madrid, en el barrio de Niño Jesús (distrito de Retiro), PLANETA ENANO NIÑO JESUS es una escuela infantil privada. Su actividad se centra en el primer ciclo de Educación Infantil, de 0 a 3 años.\n\nEntre los servicios recogidos en fuentes públicas figuran un proyecto bilingüe y horario ampliado. También se mencionan psicomotricidad, orientación pedagógica, campamentos de verano y actividades extraescolares.\n\nLa ficha recopila datos de ubicación, contacto y servicios a partir de fuentes públicas. Antes de solicitar plaza conviene confirmar directamente con el centro los horarios, la disponibilidad y las condiciones de admisión.',
  verification_status = 'partially_verified',
  confidence_level    = 'high',
  verified_at         = '2026-07-03',
  updated_at          = NOW()
WHERE id = '6e0bf701-b1d1-47d9-b91b-723d1d8499a0';

-- LOS NIDOS DE MANOTERAS  [medium] servicios: comedor, cocina-propia, patio-exterior, ingles, bilingue, escuela-de-padres, horario-ampliado, orientacion-pedagogica
UPDATE centers SET
  services            = ARRAY['comedor','cocina-propia','patio-exterior','ingles','bilingue','escuela-de-padres','horario-ampliado','orientacion-pedagogica']::text[],
  long_description    = E'LOS NIDOS DE MANOTERAS es una guardería privada ubicada en el distrito madrileño de Hortaleza, en el barrio de Valdefuentes. Está orientada al primer ciclo de Educación Infantil, la etapa de 0 a 3 años.\n\nEl centro ofrece, según la información pública, horario ampliado, servicio de comedor con cocina propia, un proyecto bilingüe y patio exterior. A ello se suman escuela de familias y orientación pedagógica.\n\nPara detalles sobre el día a día, el horario y el proceso de admisión, lo mejor es ponerse en contacto directamente con el centro.',
  schedule            = 'Lunes a viernes de 7:30 a 19:00',
  verification_status = 'partially_verified',
  confidence_level    = 'medium',
  verified_at         = '2026-07-03',
  updated_at          = NOW()
WHERE id = '7bf3662e-c52c-4ec0-a02f-6fd73ab38e1c';

-- CUCHITOS  [medium] servicios: comedor, ingles, psicomotricidad, patio-exterior
UPDATE centers SET
  services            = ARRAY['comedor','ingles','psicomotricidad','patio-exterior']::text[],
  long_description    = E'CUCHITOS es una escuela infantil privada con sede en Madrid, en el barrio de Lista (distrito de Salamanca). Su actividad se centra en el primer ciclo de Educación Infantil, de 0 a 3 años.\n\nEl centro ofrece, según la información pública, iniciación al inglés, patio exterior y servicio de comedor. A ello se suman psicomotricidad.\n\nPara detalles sobre el día a día, el horario y el proceso de admisión, lo mejor es ponerse en contacto directamente con el centro.',
  verification_status = 'partially_verified',
  confidence_level    = 'medium',
  verified_at         = '2026-07-03',
  updated_at          = NOW()
WHERE id = '260a708d-6036-44ef-927b-a502fe4c38eb';

-- DONDE ESTAN LAS LLAVES  [medium] servicios: comedor, bilingue, ingles
UPDATE centers SET
  services            = ARRAY['comedor','bilingue','ingles']::text[],
  long_description    = E'DONDE ESTAN LAS LLAVES, escuela infantil privada, se encuentra en el distrito madrileño de Arganzuela, en el barrio de Delicias. Está orientada al primer ciclo de Educación Infantil, la etapa de 0 a 3 años.\n\nEntre los servicios recogidos en fuentes públicas figuran servicio de comedor y un proyecto bilingüe.\n\nLa ficha recopila datos de ubicación, contacto y servicios a partir de fuentes públicas. Antes de solicitar plaza conviene confirmar directamente con el centro los horarios, la disponibilidad y las condiciones de admisión.',
  verification_status = 'partially_verified',
  confidence_level    = 'medium',
  verified_at         = '2026-07-03',
  updated_at          = NOW()
WHERE id = 'bed55563-8a3f-4e45-96b6-20159ceecfb8';

-- PASITOS MAGICOS  [medium] servicios: comedor, patio-exterior
UPDATE centers SET
  services            = ARRAY['comedor','patio-exterior']::text[],
  long_description    = E'Situada en Madrid, en el barrio de Canillas (distrito de Retiro), PASITOS MAGICOS es una escuela infantil privada. Su actividad se centra en el primer ciclo de Educación Infantil, de 0 a 3 años.\n\nLos datos publicados incluyen servicios como patio exterior y servicio de comedor.\n\nLos datos se han recopilado de fuentes públicas; conviene verificar con el propio centro la disponibilidad de plaza, el calendario y las tarifas antes de decidir.',
  verification_status = 'partially_verified',
  confidence_level    = 'medium',
  verified_at         = '2026-07-03',
  updated_at          = NOW()
WHERE id = 'e50dbc69-9f18-4868-b384-857c2e848910';

-- MAMA QUECA II  [medium] servicios: comedor, catering, ingles, verano-campamentos
UPDATE centers SET
  services            = ARRAY['comedor','catering','ingles','verano-campamentos']::text[],
  long_description    = E'MAMA QUECA II es una escuela infantil de titularidad privada que presta servicio en el barrio de Pinar del Rey, en el distrito de Hortaleza (Madrid). Atiende el primer ciclo de Educación Infantil, es decir, la etapa de 0 a 3 años.\n\nSegún la información disponible, el centro cuenta con iniciación al inglés y comedor con servicio de catering. A ello se suman campamentos de verano.\n\nEsta información procede de fuentes públicas y puede no estar completa. Para conocer horarios actualizados, plazas y cuotas, lo recomendable es contactar con el centro.',
  schedule            = 'Lunes a viernes de 7:30 a 18:00',
  verification_status = 'partially_verified',
  confidence_level    = 'medium',
  verified_at         = '2026-07-03',
  updated_at          = NOW()
WHERE id = '3746a619-9c08-433e-bf15-51a32d8db0ae';

-- PEQUEMUN  [medium] servicios: comedor, catering, ingles, musica
UPDATE centers SET
  services            = ARRAY['comedor','catering','ingles','musica']::text[],
  long_description    = E'PEQUEMUN es una escuela infantil privada con sede en Madrid, en el barrio de Vallehermoso (distrito de Chamberí). Su actividad se centra en el primer ciclo de Educación Infantil, de 0 a 3 años.\n\nEl centro ofrece, según la información pública, iniciación al inglés y comedor con servicio de catering. A ello se suman música.\n\nPara detalles sobre el día a día, el horario y el proceso de admisión, lo mejor es ponerse en contacto directamente con el centro.',
  schedule            = 'Lunes a viernes de 8:00 a 18:00',
  verification_status = 'partially_verified',
  confidence_level    = 'medium',
  verified_at         = '2026-07-03',
  updated_at          = NOW()
WHERE id = 'ebc0572d-c29e-488a-8ea4-9a11d810a48b';

-- PEQUEÑECOS PARQUE NORTE  [medium] servicios: ingles, musica, actividades-extraescolares
UPDATE centers SET
  services            = ARRAY['ingles','musica','actividades-extraescolares']::text[],
  long_description    = E'PEQUEÑECOS PARQUE NORTE es una escuela infantil privada situada en el barrio de Costillares, en el distrito de Hortaleza (Madrid). Atiende el primer ciclo de Educación Infantil, es decir, la etapa de 0 a 3 años.\n\nEntre los servicios recogidos en fuentes públicas figuran iniciación al inglés. También se mencionan actividades extraescolares y música.\n\nLa ficha recopila datos de ubicación, contacto y servicios a partir de fuentes públicas. Antes de solicitar plaza conviene confirmar directamente con el centro los horarios, la disponibilidad y las condiciones de admisión.',
  verification_status = 'partially_verified',
  confidence_level    = 'medium',
  verified_at         = '2026-07-03',
  updated_at          = NOW()
WHERE id = 'd45d9ea8-6532-4244-938f-49d639038bb9';

-- JARDIIMAR  [medium] servicios: comedor, horario-ampliado, patio-exterior
UPDATE centers SET
  services            = ARRAY['comedor','horario-ampliado','patio-exterior']::text[],
  long_description    = E'JARDIIMAR es una escuela infantil privada ubicada en el distrito madrileño de Arganzuela. Está orientada al primer ciclo de Educación Infantil, la etapa de 0 a 3 años.\n\nSegún la información disponible, el centro cuenta con patio exterior, servicio de comedor y horario ampliado.\n\nEsta información procede de fuentes públicas y puede no estar completa. Para conocer horarios actualizados, plazas y cuotas, lo recomendable es contactar con el centro.',
  schedule            = 'Lunes a viernes de 7:00 a 18:00',
  verification_status = 'partially_verified',
  confidence_level    = 'medium',
  verified_at         = '2026-07-03',
  updated_at          = NOW()
WHERE id = 'bc6d4257-32f4-4138-804d-0205ec100804';

-- TODO PARA LA INFANCIA  [medium] servicios: comedor, cocina-propia, horario-ampliado, actividades-extraescolares
UPDATE centers SET
  services            = ARRAY['comedor','cocina-propia','horario-ampliado','actividades-extraescolares']::text[],
  long_description    = E'TODO PARA LA INFANCIA es una escuela infantil privada con sede en Madrid, en el barrio de Ciudad Universitaria (distrito de Moncloa-Aravaca). Su actividad se centra en el primer ciclo de Educación Infantil, de 0 a 3 años.\n\nSegún la información disponible, el centro cuenta con horario ampliado y servicio de comedor con cocina propia. A ello se suman actividades extraescolares.\n\nEsta información procede de fuentes públicas y puede no estar completa. Para conocer horarios actualizados, plazas y cuotas, lo recomendable es contactar con el centro.',
  verification_status = 'partially_verified',
  confidence_level    = 'medium',
  verified_at         = '2026-07-03',
  updated_at          = NOW()
WHERE id = '0e32a415-31b8-49a0-9cd5-65120c5bd3b3';

-- ANA DE AUSTRIA  [medium] servicios: comedor, catering
UPDATE centers SET
  services            = ARRAY['comedor','catering']::text[],
  long_description    = E'ANA DE AUSTRIA es una escuela infantil pública ubicada en el distrito madrileño de Hortaleza, en el barrio de Valdefuentes. Está orientada al primer ciclo de Educación Infantil, la etapa de 0 a 3 años.\n\nSegún la información disponible, el centro cuenta con comedor con servicio de catering.\n\nEsta información procede de fuentes públicas y puede no estar completa. Para conocer horarios actualizados, plazas y cuotas, lo recomendable es contactar con el centro.',
  verification_status = 'partially_verified',
  confidence_level    = 'medium',
  verified_at         = '2026-07-03',
  updated_at          = NOW()
WHERE id = '91926c07-f673-4623-911e-f4009fee5c9d';

-- MI PRIMER COLE 4  [medium] servicios: comedor, ingles, patio-exterior, psicomotricidad, actividades-extraescolares, verano-campamentos
UPDATE centers SET
  services            = ARRAY['comedor','ingles','patio-exterior','psicomotricidad','actividades-extraescolares','verano-campamentos']::text[],
  long_description    = E'MI PRIMER COLE 4 es una escuela infantil privada situada en el barrio de Piovera, en el distrito de Hortaleza (Madrid). Atiende el primer ciclo de Educación Infantil, es decir, la etapa de 0 a 3 años.\n\nEntre los servicios recogidos en fuentes públicas figuran patio exterior, servicio de comedor y iniciación al inglés. También se mencionan actividades extraescolares, psicomotricidad y campamentos de verano.\n\nLa ficha recopila datos de ubicación, contacto y servicios a partir de fuentes públicas. Antes de solicitar plaza conviene confirmar directamente con el centro los horarios, la disponibilidad y las condiciones de admisión.',
  schedule            = 'Lunes a viernes de 7:00 a 17:30',
  verification_status = 'partially_verified',
  confidence_level    = 'medium',
  verified_at         = '2026-07-03',
  updated_at          = NOW()
WHERE id = '9714633c-2f9c-4d3e-80c6-7515cda502c4';

-- EL PARQUE DE LA PIOVERA  [medium] servicios: bilingue, ingles, musica
UPDATE centers SET
  services            = ARRAY['bilingue','ingles','musica']::text[],
  long_description    = E'EL PARQUE DE LA PIOVERA es una escuela infantil privada situada en el barrio de Palomas, en el distrito de Hortaleza (Madrid). Atiende el primer ciclo de Educación Infantil, es decir, la etapa de 0 a 3 años.\n\nEntre los servicios recogidos en fuentes públicas figuran un proyecto bilingüe. También se mencionan música.\n\nLa ficha recopila datos de ubicación, contacto y servicios a partir de fuentes públicas. Antes de solicitar plaza conviene confirmar directamente con el centro los horarios, la disponibilidad y las condiciones de admisión.',
  verification_status = 'partially_verified',
  confidence_level    = 'medium',
  verified_at         = '2026-07-03',
  updated_at          = NOW()
WHERE id = '7f6b35ae-f63e-452a-8592-84a69e731e61';

-- CUCUTRAS  [medium] servicios: comedor, horario-ampliado
UPDATE centers SET
  services            = ARRAY['comedor','horario-ampliado']::text[],
  long_description    = E'CUCUTRAS es una escuela infantil privada ubicada en el distrito madrileño de Hortaleza, en el barrio de Canillas. Está orientada al primer ciclo de Educación Infantil, la etapa de 0 a 3 años.\n\nEl centro ofrece, según la información pública, horario ampliado y servicio de comedor.\n\nPara detalles sobre el día a día, el horario y el proceso de admisión, lo mejor es ponerse en contacto directamente con el centro.',
  verification_status = 'partially_verified',
  confidence_level    = 'medium',
  verified_at         = '2026-07-03',
  updated_at          = NOW()
WHERE id = '2613e96c-9379-4d6d-adeb-d21ceb774fd4';

-- MI PEQUEÑO PLANETA  [medium] servicios: comedor, cocina-propia, bilingue, ingles
UPDATE centers SET
  services            = ARRAY['comedor','cocina-propia','bilingue','ingles']::text[],
  long_description    = E'MI PEQUEÑO PLANETA, escuela infantil privada, se encuentra en el distrito madrileño de Salamanca. Está orientada al primer ciclo de Educación Infantil, la etapa de 0 a 3 años.\n\nLos datos publicados incluyen servicios como un proyecto bilingüe y servicio de comedor con cocina propia.\n\nLos datos se han recopilado de fuentes públicas; conviene verificar con el propio centro la disponibilidad de plaza, el calendario y las tarifas antes de decidir.',
  schedule            = 'Lunes a viernes de 7:30 a 18:00',
  verification_status = 'partially_verified',
  confidence_level    = 'medium',
  verified_at         = '2026-07-03',
  updated_at          = NOW()
WHERE id = 'f041b437-f593-4088-bb79-0388840a503c';

-- PRESCHOOL FEM  [medium] servicios: comedor, cocina-propia
UPDATE centers SET
  services            = ARRAY['comedor','cocina-propia']::text[],
  long_description    = E'PRESCHOOL FEM es una guardería privada con sede en Madrid, en el barrio de Vallehermoso (distrito de Chamberí). Su actividad se centra en el primer ciclo de Educación Infantil, de 0 a 3 años.\n\nSegún la información disponible, el centro cuenta con servicio de comedor con cocina propia.\n\nEsta información procede de fuentes públicas y puede no estar completa. Para conocer horarios actualizados, plazas y cuotas, lo recomendable es contactar con el centro.',
  verification_status = 'partially_verified',
  confidence_level    = 'medium',
  verified_at         = '2026-07-03',
  updated_at          = NOW()
WHERE id = '01030122-05cd-49f9-98e0-dbef90390cc9';

-- LITTLE FEM  [medium] servicios: comedor, cocina-propia
UPDATE centers SET
  services            = ARRAY['comedor','cocina-propia']::text[],
  long_description    = E'LITTLE FEM es una escuela infantil de titularidad privada que presta servicio en el barrio de Vallehermoso, en el distrito de Chamberí (Madrid). Atiende el primer ciclo de Educación Infantil, es decir, la etapa de 0 a 3 años.\n\nSegún la información disponible, el centro cuenta con servicio de comedor con cocina propia.\n\nEsta información procede de fuentes públicas y puede no estar completa. Para conocer horarios actualizados, plazas y cuotas, lo recomendable es contactar con el centro.',
  verification_status = 'partially_verified',
  confidence_level    = 'medium',
  verified_at         = '2026-07-03',
  updated_at          = NOW()
WHERE id = '5415af25-14fb-4d27-8988-8d8d3ab31574';

-- DINA CONDADO  [medium] servicios: comedor, catering, ingles, musica, psicomotricidad, horario-ampliado
UPDATE centers SET
  services            = ARRAY['comedor','catering','ingles','musica','psicomotricidad','horario-ampliado']::text[],
  long_description    = E'DINA CONDADO, escuela infantil privada, se encuentra en el distrito madrileño de Hortaleza, en el barrio de Costillares. Está orientada al primer ciclo de Educación Infantil, la etapa de 0 a 3 años.\n\nEntre los servicios recogidos en fuentes públicas figuran horario ampliado, iniciación al inglés y comedor con servicio de catering. También se mencionan música y psicomotricidad. Trabaja con metodología Montessori.\n\nLa ficha recopila datos de ubicación, contacto y servicios a partir de fuentes públicas. Antes de solicitar plaza conviene confirmar directamente con el centro los horarios, la disponibilidad y las condiciones de admisión.',
  pedagogical_approach = ARRAY['montessori']::text[],
  schedule            = 'Lunes a viernes de 7:30 a 18:00',
  verification_status = 'partially_verified',
  confidence_level    = 'medium',
  verified_at         = '2026-07-03',
  updated_at          = NOW()
WHERE id = 'fa73f2b1-c52c-4870-b9e1-19e0522a0f12';

-- DINA CONDADO-2  [medium] servicios: comedor, catering, ingles, musica, psicomotricidad, horario-ampliado
UPDATE centers SET
  services            = ARRAY['comedor','catering','ingles','musica','psicomotricidad','horario-ampliado']::text[],
  long_description    = E'Situada en Madrid, en el barrio de Costillares (distrito de Hortaleza), DINA CONDADO-2 es una escuela infantil privada. Su actividad se centra en el primer ciclo de Educación Infantil, de 0 a 3 años.\n\nEntre los servicios recogidos en fuentes públicas figuran comedor con servicio de catering, horario ampliado y iniciación al inglés. También se mencionan música y psicomotricidad. Trabaja con metodología Montessori.\n\nLa ficha recopila datos de ubicación, contacto y servicios a partir de fuentes públicas. Antes de solicitar plaza conviene confirmar directamente con el centro los horarios, la disponibilidad y las condiciones de admisión.',
  pedagogical_approach = ARRAY['montessori']::text[],
  schedule            = 'Lunes a viernes de 7:30 a 18:00',
  verification_status = 'partially_verified',
  confidence_level    = 'medium',
  verified_at         = '2026-07-03',
  updated_at          = NOW()
WHERE id = '2e007e17-485f-4a2d-9056-b6e948c72c3b';

COMMIT;

-- 30 centros enriquecidos.