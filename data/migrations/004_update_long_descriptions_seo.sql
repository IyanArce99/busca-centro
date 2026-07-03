-- ============================================================
-- UPDATE 004 SEO — long_description editorial para centros de Madrid
-- Generado: 2026-07-03
-- ============================================================
-- Alcance: 141 centros de Madrid (city_slug='madrid', status='published')
--   Caso A (rica):  109
--   Caso B (media): 32
--   Caso C (pobre): 63  → SIN long_description (no incluidos aquí)
-- ------------------------------------------------------------
-- Solo actualiza: long_description, updated_at.
-- No toca: id, slug, city_slug, status, name, street, phone, email,
--          website, services, age_min_months, age_max_months, latitude,
--          longitude, images, faqs, short_description.
-- Sin DELETE / DROP / TRUNCATE. Texto derivado solo de campos ya verificados.
-- Revisar manualmente antes de ejecutar. NO ejecutado automáticamente.
-- ============================================================

BEGIN;

-- AFUERA III A  [caso A · escuela-infantil · privado · servicios: 2]
UPDATE centers SET
  long_description = E'AFUERA III A es una escuela infantil privada con sede en el barrio de Niño Jesús, en el distrito de Retiro (Madrid). Está orientada al primer ciclo de Educación Infantil, la etapa de 0 a 3 años.\n\nEntre los servicios recogidos en fuentes públicas figuran un proyecto bilingüe.\n\nEsta información procede de fuentes públicas y puede no estar completa. Para conocer horarios actualizados, plazas y cuotas, lo recomendable es contactar con el centro.',
  updated_at       = NOW()
WHERE id = 'f54356b4-7c1f-4e31-a653-51e1d198c458';

-- AFUERA III B  [caso A · guarderia · privado · servicios: 2]
UPDATE centers SET
  long_description = E'AFUERA III B es una guardería privada situada en el barrio de Niño Jesús, en el distrito de Retiro (Madrid). Su actividad se centra en el primer ciclo de Educación Infantil, de 0 a 3 años.\n\nLa ficha recoge servicios como servicio de comedor y horario ampliado.\n\nAntes de matricular, es aconsejable contrastar con el centro los servicios vigentes, el horario y las condiciones de cada curso.',
  updated_at       = NOW()
WHERE id = '0e00f2d0-538b-4991-97df-88a6bbc966c6';

-- AGARIMO  [caso B · escuela-infantil · privado · servicios: 1]
UPDATE centers SET
  long_description = E'AGARIMO es una escuela infantil privada ubicada en el distrito madrileño de Chamberí, en el barrio de Gaztambide. Trabaja con niños y niñas del primer ciclo de Educación Infantil (0 a 3 años). El centro ofrece, según los datos publicados, servicio de comedor.\n\nAntes de decidir, confirma con el centro horarios, plazas y condiciones de admisión.',
  updated_at       = NOW()
WHERE id = 'cdcdcd36-1d03-4ec0-a5cf-0a35106cccaa';

-- ALARIA ARAVACA NURSERY SCHOOL  [caso A · guarderia · privado · servicios: 10]
UPDATE centers SET
  long_description = E'ALARIA ARAVACA NURSERY SCHOOL es una guardería privada ubicada en Madrid, en el barrio de Aravaca (distrito de Moncloa-Aravaca). Su actividad se centra en el primer ciclo de Educación Infantil, de 0 a 3 años.\n\nEl centro ofrece, según la información pública, horario ampliado, patio exterior, servicio de comedor con cocina propia y un proyecto bilingüe. También se mencionan uniforme, escuela de familias, actividades extraescolares y campamentos de verano. Contar con cocina propia permite elaborar los menús en el propio centro.\n\nLa ficha recopila datos de ubicación, contacto y servicios a partir de fuentes públicas. Antes de solicitar plaza conviene confirmar directamente con el centro los horarios, la disponibilidad y las condiciones de admisión.',
  updated_at       = NOW()
WHERE id = '969bf22e-0d0f-4a3d-b0af-e0b48906ad20';

-- ALARIA BERNABEU NURSERY SCHOOL  [caso A · escuela-infantil · privado · servicios: 11]
UPDATE centers SET
  long_description = E'ALARIA BERNABEU NURSERY SCHOOL es una escuela infantil privada con sede en Madrid, en el barrio de El Viso (distrito de Chamartín). Atiende tanto el primer como el segundo ciclo de Educación Infantil, la etapa que va de los 0 a los 6 años.\n\nEl centro ofrece, según la información pública, patio exterior, servicio de comedor con cocina propia, un proyecto bilingüe y horario ampliado. También se mencionan actividades extraescolares, uniforme, música, psicomotricidad, orientación pedagógica y campamentos de verano. Contar con cocina propia permite elaborar los menús en el propio centro.\n\nEsta información procede de fuentes públicas y puede no estar completa. Para conocer horarios actualizados, plazas y cuotas, lo recomendable es contactar con el centro.',
  updated_at       = NOW()
WHERE id = '698058e0-e2c0-4bd5-b324-f4441ab4bbf8';

-- ALARIA NUEVOS MINISTERIOS NURSERY SCHOOL  [caso A · guarderia · privado · servicios: 10]
UPDATE centers SET
  long_description = E'ALARIA NUEVOS MINISTERIOS NURSERY SCHOOL es una guardería privada situada en Madrid, en el distrito de Chamartín. Trabaja con niños y niñas del primer ciclo de Educación Infantil (0 a 3 años).\n\nSegún la información disponible, el centro cuenta con patio exterior, horario ampliado, un proyecto bilingüe y servicio de comedor con cocina propia. Además, la ficha recoge campamentos de verano, uniforme, escuela de familias y actividades extraescolares.\n\nPara obtener información concreta sobre el día a día, el horario y el proceso de admisión, lo mejor es ponerse en contacto directamente con el centro.',
  updated_at       = NOW()
WHERE id = 'f1f29a13-e243-44e5-a3d1-d6e9ba6053c4';

-- ALARIA SERRANO NURSEY SCHOOL  [caso A · escuela-infantil · privado · servicios: 10]
UPDATE centers SET
  long_description = E'ALARIA SERRANO NURSEY SCHOOL es una escuela infantil de titularidad privada que presta servicio en el distrito madrileño de Chamartín. Atiende el primer ciclo de Educación Infantil, es decir, la etapa de 0 a 3 años.\n\nEntre los servicios recogidos en fuentes públicas figuran un proyecto bilingüe, patio exterior, horario ampliado y servicio de comedor con cocina propia. A ello se suman actividades extraescolares, uniforme, escuela de familias y campamentos de verano. La presencia del inglés puede interesar a quienes buscan un contacto temprano con el idioma.\n\nLos datos que se muestran se han recopilado de fuentes públicas; conviene verificar con el propio centro la disponibilidad de plaza, el calendario y las tarifas antes de decidir.',
  updated_at       = NOW()
WHERE id = '91d2d752-5f82-4c64-8379-6a716aedc868';

-- ALEGRE KOALA  [caso A · escuela-infantil · privado · servicios: 3]
UPDATE centers SET
  long_description = E'ALEGRE KOALA es una escuela infantil privada ubicada en el barrio de Acacias, en el distrito de Arganzuela (Madrid). Cubre la etapa de Educación Infantil desde los primeros meses hasta los 6 años, incluyendo el segundo ciclo.\n\nDe acuerdo con las fuentes consultadas, dispone de horario ampliado, servicio de comedor y iniciación al inglés.\n\nLa ficha recopila datos de ubicación, contacto y servicios a partir de fuentes públicas. Antes de solicitar plaza conviene confirmar directamente con el centro los horarios, la disponibilidad y las condiciones de admisión.',
  updated_at       = NOW()
WHERE id = '81bef1fb-58ae-40c8-a323-058c1f917e9d';

-- ALICIA  [caso A · escuela-infantil · privado · servicios: 3]
UPDATE centers SET
  long_description = E'ALICIA es una escuela infantil de titularidad privada que presta servicio en el barrio de Argüelles, en el distrito de Moncloa-Aravaca (Madrid). Atiende el primer ciclo de Educación Infantil, es decir, la etapa de 0 a 3 años.\n\nEl centro ofrece, según la información pública, servicio de comedor y horario ampliado. También se mencionan actividades extraescolares. El horario ampliado suele ser relevante para las familias que necesitan conciliar durante el curso.\n\nAntes de matricular, es aconsejable contrastar con el centro los servicios vigentes, el horario y las condiciones de cada curso.',
  updated_at       = NOW()
WHERE id = '1dab63de-d43d-41bc-9a5d-7257639bb8e5';

-- ALICIA II  [caso A · escuela-infantil · privado · servicios: 3]
UPDATE centers SET
  long_description = E'Situada en el barrio de Argüelles, en el distrito de Moncloa-Aravaca (Madrid), ALICIA II es una escuela infantil privada. Su actividad se centra en el primer ciclo de Educación Infantil, de 0 a 3 años.\n\nSegún la información disponible, el centro cuenta con servicio de comedor y horario ampliado. Además, la ficha recoge actividades extraescolares.\n\nEsta información procede de fuentes públicas y puede no estar completa. Para conocer horarios actualizados, plazas y cuotas, lo recomendable es contactar con el centro.',
  updated_at       = NOW()
WHERE id = 'ebde4f53-c43e-46ab-9e18-004bd974d395';

-- ALLEGRA  [caso A · escuela-infantil · privado · servicios: 3]
UPDATE centers SET
  long_description = E'ALLEGRA es una escuela infantil de titularidad privada que presta servicio en el barrio de Aravaca, en el distrito de Moncloa-Aravaca (Madrid). Atiende el primer ciclo de Educación Infantil, es decir, la etapa de 0 a 3 años.\n\nSegún la información disponible, el centro cuenta con servicio de comedor con cocina propia y patio exterior.\n\nEsta información procede de fuentes públicas y puede no estar completa. Para conocer horarios actualizados, plazas y cuotas, lo recomendable es contactar con el centro.',
  updated_at       = NOW()
WHERE id = 'd072830a-ceeb-4d14-8a77-3bca3b5618d4';

-- ANDAL  [caso A · escuela-infantil · privado · servicios: 2]
UPDATE centers SET
  long_description = E'ANDAL es una escuela infantil privada con sede en el barrio de Niño Jesús, en el distrito de Retiro (Madrid). Atiende el primer ciclo de Educación Infantil, es decir, la etapa de 0 a 3 años.\n\nEl centro ofrece, según la información pública, servicio de comedor y horario ampliado. El horario ampliado suele ser relevante para las familias que necesitan conciliar durante el curso.\n\nComo la ficha todavía no ha sido reclamada por el centro, conviene confirmar con el equipo los detalles de funcionamiento, horarios y admisión.',
  updated_at       = NOW()
WHERE id = '921d8b54-2244-4de8-8c10-bf69806b183b';

-- ANDAL II  [caso A · escuela-infantil · privado · servicios: 2]
UPDATE centers SET
  long_description = E'ANDAL II, escuela infantil privada, se encuentra en el distrito madrileño de Retiro, en el barrio de Niño Jesús. Su actividad se centra en el primer ciclo de Educación Infantil, de 0 a 3 años.\n\nSegún la información disponible, el centro cuenta con horario ampliado y servicio de comedor. El horario ampliado suele ser relevante para las familias que necesitan conciliar durante el curso.\n\nLos datos que se muestran se han recopilado de fuentes públicas; conviene verificar con el propio centro la disponibilidad de plaza, el calendario y las tarifas antes de decidir.',
  updated_at       = NOW()
WHERE id = 'b9cb3561-1f71-4873-b2f2-e1d35a0e79e2';

-- ANTONIO MERCERO  [caso A · escuela-infantil · publico · servicios: 2]
UPDATE centers SET
  long_description = E'Con presencia en el distrito madrileño de Moncloa-Aravaca, en el barrio de Casa de Campo, ANTONIO MERCERO funciona como escuela infantil pública. Atiende el primer ciclo de Educación Infantil, es decir, la etapa de 0 a 3 años.\n\nLa ficha recoge servicios como servicio de comedor y horario ampliado. El horario ampliado suele ser relevante para las familias que necesitan conciliar durante el curso.\n\nLa ficha recopila datos de ubicación, contacto y servicios a partir de fuentes públicas. Antes de solicitar plaza conviene confirmar directamente con el centro los horarios, la disponibilidad y las condiciones de admisión.',
  updated_at       = NOW()
WHERE id = '0a9991e0-dd87-4bb9-ae42-ced9db754ac6';

-- B.R.A. INSTITUCION ORGAZ  [caso A · escuela-infantil · privado · servicios: 8]
UPDATE centers SET
  long_description = E'B.R.A. INSTITUCION ORGAZ, escuela infantil privada, se encuentra en el barrio de Piovera, en el distrito de Hortaleza (Madrid). Atiende el primer ciclo de Educación Infantil, es decir, la etapa de 0 a 3 años.\n\nLa ficha recoge servicios como iniciación al inglés, servicio de comedor y patio exterior. Además, la ficha recoge música, psicomotricidad, campamentos de verano, actividades extraescolares y uniforme. La presencia del inglés puede interesar a quienes buscan un contacto temprano con el idioma.\n\nLa ficha recopila datos de ubicación, contacto y servicios a partir de fuentes públicas. Antes de solicitar plaza conviene confirmar directamente con el centro los horarios, la disponibilidad y las condiciones de admisión.',
  updated_at       = NOW()
WHERE id = '4c1cb5b6-8a04-47ef-a64e-cbf99fd11d23';

-- BUEN CONSEJO  [caso B · escuela-infantil · privado · servicios: 1]
UPDATE centers SET
  long_description = E'BUEN CONSEJO es una escuela infantil privada con sede en Madrid, en el barrio de Aravaca (distrito de Moncloa-Aravaca). Está orientada al primer ciclo de Educación Infantil, la etapa de 0 a 3 años. La información disponible recoge servicio de comedor.\n\nRecomendamos verificar la disponibilidad y las condiciones con el propio centro.',
  updated_at       = NOW()
WHERE id = '4c97ca77-36c7-4a3d-b8d2-8ffa01938c97';

-- CAN-TA-CHIMUTRI (SOL Y LUNA)  [caso B · guarderia · privado · servicios: 1]
UPDATE centers SET
  long_description = E'CAN-TA-CHIMUTRI (SOL Y LUNA) es una guardería privada ubicada en Madrid, en el barrio de Valdezarza (distrito de Moncloa-Aravaca). Trabaja con niños y niñas del primer ciclo de Educación Infantil (0 a 3 años). La información disponible recoge servicio de comedor.\n\nConviene confirmar horarios, plazas y condiciones directamente con el centro.',
  updated_at       = NOW()
WHERE id = 'b819f76f-9bb3-4ade-a32f-8854b48a8467';

-- CARANA VALDEMARIN  [caso A · escuela-infantil · privado · servicios: 5]
UPDATE centers SET
  long_description = E'CARANA VALDEMARIN es una escuela infantil privada con sede en Madrid, en el barrio de Valdemarín (distrito de Moncloa-Aravaca). Atiende el primer ciclo de Educación Infantil, es decir, la etapa de 0 a 3 años.\n\nEntre los servicios recogidos en fuentes públicas figuran iniciación al inglés. A ello se suman actividades extraescolares, música, campamentos de verano y psicomotricidad.\n\nLos datos que se muestran se han recopilado de fuentes públicas; conviene verificar con el propio centro la disponibilidad de plaza, el calendario y las tarifas antes de decidir.',
  updated_at       = NOW()
WHERE id = 'c442d882-1877-49d4-8ac2-3d2ec1039740';

-- CARRUSEL  [caso A · escuela-infantil · privado · servicios: 7]
UPDATE centers SET
  long_description = E'CARRUSEL es una escuela infantil privada ubicada en el distrito madrileño de Chamartín, en el barrio de Prosperidad. Está orientada al primer ciclo de Educación Infantil, la etapa de 0 a 3 años.\n\nEntre los servicios recogidos en fuentes públicas figuran iniciación al inglés y servicio de comedor con cocina propia. A ello se suman escuela de familias, campamentos de verano, música y psicomotricidad.\n\nLa ficha recopila datos de ubicación, contacto y servicios a partir de fuentes públicas. Antes de solicitar plaza conviene confirmar directamente con el centro los horarios, la disponibilidad y las condiciones de admisión.',
  updated_at       = NOW()
WHERE id = '45848e76-0aee-4e37-b6d7-5d27adb12633';

-- CASA DEL NIÑO  [caso A · escuela-infantil · privado · servicios: 8]
UPDATE centers SET
  long_description = E'CASA DEL NIÑO, escuela infantil privada, se encuentra en el distrito madrileño de Chamartín, en el barrio de Nueva España. Trabaja con niños y niñas del primer ciclo de Educación Infantil (0 a 3 años).\n\nSegún la información disponible, el centro cuenta con servicio de comedor con cocina propia y un proyecto bilingüe. Además, la ficha recoge orientación pedagógica, actividades extraescolares, música y psicomotricidad.\n\nLos datos que se muestran se han recopilado de fuentes públicas; conviene verificar con el propio centro la disponibilidad de plaza, el calendario y las tarifas antes de decidir.',
  updated_at       = NOW()
WHERE id = 'ad9568f5-bba5-4d47-a083-847cd19d397b';

-- CASITA MARAVILLAS  [caso A · escuela-infantil · privado · servicios: 4]
UPDATE centers SET
  long_description = E'CASITA MARAVILLAS es una escuela infantil de titularidad privada que presta servicio en Madrid, en el barrio de Legazpi (distrito de Arganzuela). Su actividad se centra en el primer ciclo de Educación Infantil, de 0 a 3 años.\n\nLos datos publicados incluyen servicios como un proyecto bilingüe y horario ampliado. También se mencionan actividades extraescolares y campamentos de verano. El horario ampliado suele ser relevante para las familias que necesitan conciliar durante el curso.\n\nLa ficha recopila datos de ubicación, contacto y servicios a partir de fuentes públicas. Antes de solicitar plaza conviene confirmar directamente con el centro los horarios, la disponibilidad y las condiciones de admisión.',
  updated_at       = NOW()
WHERE id = '73ea21b4-8232-4572-8c3e-84723bde2b76';

-- CASITA MARAVILLAS BABY  [caso A · escuela-infantil · privado · servicios: 4]
UPDATE centers SET
  long_description = E'Situada en Madrid, en el barrio de Legazpi (distrito de Arganzuela), CASITA MARAVILLAS BABY es una escuela infantil privada. Trabaja con niños y niñas del primer ciclo de Educación Infantil (0 a 3 años).\n\nLa ficha recoge servicios como horario ampliado y un proyecto bilingüe. Además, la ficha recoge actividades extraescolares y campamentos de verano.\n\nLos datos que se muestran se han recopilado de fuentes públicas; conviene verificar con el propio centro la disponibilidad de plaza, el calendario y las tarifas antes de decidir.',
  updated_at       = NOW()
WHERE id = '5d8654b0-8f87-410e-a593-36c594400195';

-- CASITA MARAVILLAS NEBULOSAS  [caso B · escuela-infantil · privado · servicios: 1]
UPDATE centers SET
  long_description = E'CASITA MARAVILLAS NEBULOSAS es una escuela infantil de titularidad privada que presta servicio en el distrito madrileño de Arganzuela, en el barrio de Delicias. Su actividad se centra en el primer ciclo de Educación Infantil, de 0 a 3 años. Según los datos públicos, dispone de servicio de comedor.\n\nAntes de decidir, confirma con el centro horarios, plazas y condiciones de admisión.',
  updated_at       = NOW()
WHERE id = '14c7c3a5-c2b3-4f2d-bdb5-5c43fe938c2a';

-- CHAMBERINES  [caso A · escuela-infantil · privado · servicios: 5]
UPDATE centers SET
  long_description = E'CHAMBERINES es una escuela infantil privada con sede en Madrid, en el barrio de Trafalgar (distrito de Chamberí). Su actividad se centra en el primer ciclo de Educación Infantil, de 0 a 3 años.\n\nEl centro ofrece, según la información pública, patio exterior, horario ampliado, cocina propia y iniciación al inglés. También se mencionan escuela de familias. Contar con cocina propia permite elaborar los menús en el propio centro.\n\nLos datos que se muestran se han recopilado de fuentes públicas; conviene verificar con el propio centro la disponibilidad de plaza, el calendario y las tarifas antes de decidir.',
  updated_at       = NOW()
WHERE id = '30f81571-d3e3-451f-bd88-297a766ab26f';

-- CHIQUI  [caso A · escuela-infantil · privado · servicios: 3]
UPDATE centers SET
  long_description = E'CHIQUI es una escuela infantil privada ubicada en el barrio de Arapiles, en el distrito de Chamberí (Madrid). Trabaja con niños y niñas del primer ciclo de Educación Infantil (0 a 3 años).\n\nEl centro ofrece, según la información pública, servicio de comedor y patio exterior. También se mencionan actividades extraescolares.\n\nComo la ficha todavía no ha sido reclamada por el centro, conviene confirmar con el equipo los detalles de funcionamiento, horarios y admisión.',
  updated_at       = NOW()
WHERE id = '208762a5-4d7d-4700-95c3-dd9daa09773f';

-- CHIQUI TIN ALCANTARA  [caso A · escuela-infantil · privado · servicios: 3]
UPDATE centers SET
  long_description = E'CHIQUI TIN ALCANTARA es una escuela infantil privada situada en Madrid, en el barrio de Arapiles (distrito de Salamanca). Está orientada al primer ciclo de Educación Infantil, la etapa de 0 a 3 años.\n\nLos datos publicados incluyen servicios como patio exterior y servicio de comedor. También se mencionan actividades extraescolares.\n\nLos datos que se muestran se han recopilado de fuentes públicas; conviene verificar con el propio centro la disponibilidad de plaza, el calendario y las tarifas antes de decidir.',
  updated_at       = NOW()
WHERE id = 'eb42112b-a9d9-4586-b60d-f0c7434889b7';

-- CHULY  [caso A · escuela-infantil · privado · servicios: 4]
UPDATE centers SET
  long_description = E'Situada en Madrid, en el barrio de Acacias (distrito de Arganzuela), CHULY es una escuela infantil privada. Atiende el primer ciclo de Educación Infantil, es decir, la etapa de 0 a 3 años.\n\nSegún la información disponible, el centro cuenta con servicio de comedor. Además, la ficha recoge psicomotricidad, música y escuela de familias.\n\nPara obtener información concreta sobre el día a día, el horario y el proceso de admisión, lo mejor es ponerse en contacto directamente con el centro.',
  updated_at       = NOW()
WHERE id = '1f94ea42-780a-40a2-9732-3fa25b04b9c1';

-- CIUDAD JARDIN  [caso A · escuela-infantil · privado · servicios: 4]
UPDATE centers SET
  long_description = E'CIUDAD JARDIN es una escuela infantil de titularidad privada que presta servicio en el barrio de Hispanoamérica, en el distrito de Chamartín (Madrid). Está orientada al primer ciclo de Educación Infantil, la etapa de 0 a 3 años.\n\nEl centro ofrece, según la información pública, horario ampliado y patio exterior. También se mencionan campamentos de verano y orientación pedagógica. El horario ampliado suele ser relevante para las familias que necesitan conciliar durante el curso.\n\nAntes de matricular, es aconsejable contrastar con el centro los servicios vigentes, el horario y las condiciones de cada curso.',
  updated_at       = NOW()
WHERE id = 'bf73c21a-2089-40e1-b535-9f25ecf3a006';

-- COCOLAN CVE  [caso A · escuela-infantil · privado · servicios: 4]
UPDATE centers SET
  long_description = E'COCOLAN CVE es una escuela infantil privada con sede en el barrio de Vista Alegre, en el distrito de Arganzuela (Madrid). Está orientada al primer ciclo de Educación Infantil, la etapa de 0 a 3 años.\n\nDe acuerdo con las fuentes consultadas, dispone de horario ampliado y servicio de comedor. A ello se suman campamentos de verano y psicomotricidad.\n\nEsta información procede de fuentes públicas y puede no estar completa. Para conocer horarios actualizados, plazas y cuotas, lo recomendable es contactar con el centro.',
  updated_at       = NOW()
WHERE id = 'd92d9646-333c-4f58-bdce-5cff334edb33';

-- COLEGIO SEI DOS PARQUES  [caso A · escuela-infantil · concertado · servicios: 2]
UPDATE centers SET
  long_description = E'COLEGIO SEI DOS PARQUES, escuela infantil concertada, se encuentra en el barrio de Acacias, en el distrito de Arganzuela (Madrid). Su actividad se centra en el primer ciclo de Educación Infantil, de 0 a 3 años.\n\nLos datos publicados incluyen servicios como horario ampliado y servicio de comedor. El horario ampliado suele ser relevante para las familias que necesitan conciliar durante el curso.\n\nPara obtener información concreta sobre el día a día, el horario y el proceso de admisión, lo mejor es ponerse en contacto directamente con el centro.',
  updated_at       = NOW()
WHERE id = '48f0a4aa-5da7-4f4e-977c-e364c14e57fa';

-- CUCOS HOME VALDEBEBAS  [caso B · escuela-infantil · privado · servicios: 5]
UPDATE centers SET
  long_description = E'CUCOS HOME VALDEBEBAS es una escuela infantil privada situada en el distrito madrileño de Hortaleza. Trabaja con niños y niñas del primer ciclo de Educación Infantil (0 a 3 años). Según los datos públicos, dispone de cocina propia, campamentos de verano, psicomotricidad, actividades extraescolares y iniciación al inglés.\n\nPara detalles de horario, plazas y admisión, lo mejor es contactar con el centro.',
  updated_at       = NOW()
WHERE id = 'bfb4230d-ac27-4903-a3f9-26e015aea8d4';

-- CUNA DE JESUS  [caso B · escuela-infantil · concertado · servicios: 1]
UPDATE centers SET
  long_description = E'Situada en el distrito madrileño de Salamanca, en el barrio de Guindalera, CUNA DE JESUS es una escuela infantil concertada. Está orientada al primer ciclo de Educación Infantil, la etapa de 0 a 3 años. Según los datos públicos, dispone de servicio de comedor.\n\nRecomendamos verificar la disponibilidad y las condiciones con el propio centro.',
  updated_at       = NOW()
WHERE id = 'a4e9b8f2-24f1-46b2-816d-e553fb95368e';

-- DALLINGTON INFANTS  [caso A · escuela-infantil · privado · servicios: 7]
UPDATE centers SET
  long_description = E'DALLINGTON INFANTS figura como escuela infantil privada en el barrio de Piovera, en el distrito de Hortaleza (Madrid). Está orientada al primer ciclo de Educación Infantil, la etapa de 0 a 3 años.\n\nLos datos publicados incluyen servicios como servicio de comedor y un proyecto bilingüe. También se mencionan uniforme, orientación pedagógica, campamentos de verano y actividades extraescolares.\n\nPara obtener información concreta sobre el día a día, el horario y el proceso de admisión, lo mejor es ponerse en contacto directamente con el centro.',
  updated_at       = NOW()
WHERE id = 'db9ff33b-0248-44a8-9959-ef4f214fc1bb';

-- DIABOLO  [caso A · escuela-infantil · privado · servicios: 2]
UPDATE centers SET
  long_description = E'DIABOLO, escuela infantil privada, se encuentra en el barrio de Delicias, en el distrito de Arganzuela (Madrid). Atiende el primer ciclo de Educación Infantil, es decir, la etapa de 0 a 3 años.\n\nLos datos publicados incluyen servicios como un proyecto bilingüe.\n\nPara obtener información concreta sobre el día a día, el horario y el proceso de admisión, lo mejor es ponerse en contacto directamente con el centro.',
  updated_at       = NOW()
WHERE id = 'b44b6862-5b7b-4a04-84f4-d89ab51d5020';

-- DIONISIA PLAZA  [caso B · escuela-infantil · privado · servicios: 1]
UPDATE centers SET
  long_description = E'DIONISIA PLAZA es una escuela infantil privada situada en el distrito madrileño de Moncloa-Aravaca, en el barrio de Aravaca. Está orientada al primer ciclo de Educación Infantil, la etapa de 0 a 3 años. El centro ofrece, según los datos publicados, servicio de comedor.\n\nConviene confirmar horarios, plazas y condiciones directamente con el centro.',
  updated_at       = NOW()
WHERE id = '51abe604-b40c-4235-bca0-3d2578328c34';

-- DOMO  [caso A · escuela-infantil · privado · servicios: 6]
UPDATE centers SET
  long_description = E'Con presencia en el barrio de Pinar del Rey, en el distrito de Hortaleza (Madrid), DOMO funciona como escuela infantil privada. Trabaja con niños y niñas del primer ciclo de Educación Infantil (0 a 3 años).\n\nLa ficha recoge servicios como iniciación al inglés, patio exterior y servicio de comedor con cocina propia. Además, la ficha recoge campamentos de verano y orientación pedagógica.\n\nComo la ficha todavía no ha sido reclamada por el centro, conviene confirmar con el equipo los detalles de funcionamiento, horarios y admisión.',
  updated_at       = NOW()
WHERE id = '42be7897-cacc-4673-baec-cd907b9d10b4';

-- DOÑA FRANCISQUITA  [caso A · escuela-infantil · publico · servicios: 2]
UPDATE centers SET
  long_description = E'DOÑA FRANCISQUITA es una escuela infantil pública con sede en el barrio de Valdefuentes, en el distrito de Hortaleza (Madrid). Su actividad se centra en el primer ciclo de Educación Infantil, de 0 a 3 años.\n\nEntre los servicios recogidos en fuentes públicas figuran servicio de comedor y horario ampliado.\n\nPara obtener información concreta sobre el día a día, el horario y el proceso de admisión, lo mejor es ponerse en contacto directamente con el centro.',
  updated_at       = NOW()
WHERE id = '8b7d2d9e-b5d2-41e5-a503-d4172e6c05da';

-- EDUCANDO  [caso A · escuela-infantil · privado · servicios: 2]
UPDATE centers SET
  long_description = E'EDUCANDO, escuela infantil privada, se encuentra en Madrid, en el barrio de Adelfas (distrito de Retiro). Su actividad se centra en el primer ciclo de Educación Infantil, de 0 a 3 años.\n\nEntre los servicios recogidos en fuentes públicas figuran comedor con servicio de catering.\n\nEsta información procede de fuentes públicas y puede no estar completa. Para conocer horarios actualizados, plazas y cuotas, lo recomendable es contactar con el centro.',
  updated_at       = NOW()
WHERE id = 'adf0638e-64c9-4eff-b466-f633c8685806';

-- EDUCANDO JUNTOS  [caso A · escuela-infantil · privado · servicios: 4]
UPDATE centers SET
  long_description = E'EDUCANDO JUNTOS es una escuela infantil privada situada en Madrid, en el barrio de Adelfas (distrito de Retiro). Atiende el primer ciclo de Educación Infantil, es decir, la etapa de 0 a 3 años.\n\nLos datos publicados incluyen servicios como servicio de comedor con cocina propia y horario ampliado. También se mencionan actividades extraescolares. El horario ampliado suele ser relevante para las familias que necesitan conciliar durante el curso.\n\nPara obtener información concreta sobre el día a día, el horario y el proceso de admisión, lo mejor es ponerse en contacto directamente con el centro.',
  updated_at       = NOW()
WHERE id = '0ab27673-d227-4579-9318-bbb8345393fe';

-- EDUCANDO PITUFOS  [caso A · escuela-infantil · privado · servicios: 2]
UPDATE centers SET
  long_description = E'EDUCANDO PITUFOS figura como escuela infantil privada en el barrio de Niño Jesús, en el distrito de Retiro (Madrid). Trabaja con niños y niñas del primer ciclo de Educación Infantil (0 a 3 años).\n\nLos datos publicados incluyen servicios como comedor con servicio de catering.\n\nPara obtener información concreta sobre el día a día, el horario y el proceso de admisión, lo mejor es ponerse en contacto directamente con el centro.',
  updated_at       = NOW()
WHERE id = 'cc6fdb28-c0e1-49ad-bda8-acdb63efa94f';

-- EDUCANDO V  [caso A · escuela-infantil · privado · servicios: 2]
UPDATE centers SET
  long_description = E'EDUCANDO V es una escuela infantil de titularidad privada que presta servicio en el barrio de Adelfas, en el distrito de Retiro (Madrid). Está orientada al primer ciclo de Educación Infantil, la etapa de 0 a 3 años.\n\nEl centro ofrece, según la información pública, comedor con servicio de catering.\n\nComo la ficha todavía no ha sido reclamada por el centro, conviene confirmar con el equipo los detalles de funcionamiento, horarios y admisión.',
  updated_at       = NOW()
WHERE id = '6df60e08-f83c-478a-816c-719cda19f66c';

-- EL ALBA  [caso A · escuela-infantil · publico · servicios: 5]
UPDATE centers SET
  long_description = E'EL ALBA es una escuela infantil pública con sede en Madrid, en el barrio de Acacias (distrito de Arganzuela). Su actividad se centra en el primer ciclo de Educación Infantil, de 0 a 3 años.\n\nLos datos publicados incluyen servicios como servicio de comedor con cocina propia y horario ampliado. También se mencionan música y psicomotricidad. El horario ampliado suele ser relevante para las familias que necesitan conciliar durante el curso.\n\nLos datos que se muestran se han recopilado de fuentes públicas; conviene verificar con el propio centro la disponibilidad de plaza, el calendario y las tarifas antes de decidir.',
  updated_at       = NOW()
WHERE id = '4fb5d8d8-d11c-431f-8acc-73cc33ec1e53';

-- EL BOSQUE  [caso A · escuela-infantil · publico · servicios: 2]
UPDATE centers SET
  long_description = E'EL BOSQUE, escuela infantil pública, se encuentra en el distrito madrileño de Arganzuela, en el barrio de Palos de Moguer. Trabaja con niños y niñas del primer ciclo de Educación Infantil (0 a 3 años).\n\nLos datos publicados incluyen servicios como servicio de comedor y horario ampliado.\n\nComo la ficha todavía no ha sido reclamada por el centro, conviene confirmar con el equipo los detalles de funcionamiento, horarios y admisión.',
  updated_at       = NOW()
WHERE id = '1921daf0-4a0d-435b-ba0e-cbada96321c0';

-- EL CARMEN  [caso B · escuela-infantil · publico · servicios: 1]
UPDATE centers SET
  long_description = E'EL CARMEN es una escuela infantil pública con sede en Madrid, en el barrio de Pinar del Rey (distrito de Hortaleza). Trabaja con niños y niñas del primer ciclo de Educación Infantil (0 a 3 años). El centro ofrece, según los datos publicados, servicio de comedor.\n\nConviene confirmar horarios, plazas y condiciones directamente con el centro.',
  updated_at       = NOW()
WHERE id = '282f942f-8512-451c-8db2-2b694a373478';

-- EL COLUMPIO DE CLAUDIA  [caso A · escuela-infantil · privado · servicios: 4]
UPDATE centers SET
  long_description = E'EL COLUMPIO DE CLAUDIA es una escuela infantil privada con sede en el distrito de Hortaleza, en Madrid. Trabaja con niños y niñas del primer ciclo de Educación Infantil (0 a 3 años).\n\nDe acuerdo con las fuentes consultadas, dispone de un proyecto bilingüe. A ello se suman escuela de familias y orientación pedagógica. La presencia del inglés puede interesar a quienes buscan un contacto temprano con el idioma.\n\nLos datos que se muestran se han recopilado de fuentes públicas; conviene verificar con el propio centro la disponibilidad de plaza, el calendario y las tarifas antes de decidir.',
  updated_at       = NOW()
WHERE id = '362babbc-12a5-44c7-9a4b-097ef7eaa145';

-- EL DUENDE TRAVIESO II  [caso A · escuela-infantil · privado · servicios: 5]
UPDATE centers SET
  long_description = E'EL DUENDE TRAVIESO II es una escuela infantil privada ubicada en Madrid, en el barrio de Acacias (distrito de Arganzuela). Su actividad se centra en el primer ciclo de Educación Infantil, de 0 a 3 años.\n\nSegún la información disponible, el centro cuenta con servicio de comedor, horario ampliado y un proyecto bilingüe. Además, la ficha recoge escuela de familias.\n\nLos datos que se muestran se han recopilado de fuentes públicas; conviene verificar con el propio centro la disponibilidad de plaza, el calendario y las tarifas antes de decidir.',
  updated_at       = NOW()
WHERE id = '7bf4feed-7181-4dcb-93be-ad78e0e359ef';

-- EL JARDIN DE LOS GENIOS  [caso A · escuela-infantil · privado · servicios: 2]
UPDATE centers SET
  long_description = E'EL JARDIN DE LOS GENIOS figura como escuela infantil privada en el barrio de Argüelles, en el distrito de Moncloa-Aravaca (Madrid). Su actividad se centra en el primer ciclo de Educación Infantil, de 0 a 3 años.\n\nLa ficha recoge servicios como un proyecto bilingüe.\n\nComo la ficha todavía no ha sido reclamada por el centro, conviene confirmar con el equipo los detalles de funcionamiento, horarios y admisión.',
  updated_at       = NOW()
WHERE id = 'fc7f4a34-0646-405f-8330-8e5626f65cd7';

-- EL OSITO  [caso A · escuela-infantil · privado · servicios: 2]
UPDATE centers SET
  long_description = E'EL OSITO figura como escuela infantil privada en Madrid, en el barrio de Prosperidad (distrito de Chamartín). Está orientada al primer ciclo de Educación Infantil, la etapa de 0 a 3 años.\n\nSegún la información disponible, el centro cuenta con campamentos de verano y actividades extraescolares.\n\nEsta información procede de fuentes públicas y puede no estar completa. Para conocer horarios actualizados, plazas y cuotas, lo recomendable es contactar con el centro.',
  updated_at       = NOW()
WHERE id = 'f8138a09-ba59-4cb7-a8b9-196d03b82c09';

-- EL OSITO 2  [caso A · escuela-infantil · privado · servicios: 2]
UPDATE centers SET
  long_description = E'EL OSITO 2 es una escuela infantil de titularidad privada que presta servicio en Madrid, en el barrio de Prosperidad (distrito de Chamartín). Atiende el primer ciclo de Educación Infantil, es decir, la etapa de 0 a 3 años.\n\nDe acuerdo con las fuentes consultadas, dispone de actividades extraescolares y campamentos de verano.\n\nPara obtener información concreta sobre el día a día, el horario y el proceso de admisión, lo mejor es ponerse en contacto directamente con el centro.',
  updated_at       = NOW()
WHERE id = '3425aacc-416b-4ff2-9d71-85cef21e5be8';

-- EL OSITO DE LUIS DE LARRAINZA  [caso B · escuela-infantil · privado · servicios: 1]
UPDATE centers SET
  long_description = E'EL OSITO DE LUIS DE LARRAINZA, escuela infantil privada, se encuentra en Madrid, en el barrio de Ciudad Jardín (distrito de Chamartín). Atiende el primer ciclo de Educación Infantil, es decir, la etapa de 0 a 3 años. El centro cuenta con servicio de comedor, según la información pública.\n\nPara detalles de horario, plazas y admisión, lo mejor es contactar con el centro.',
  updated_at       = NOW()
WHERE id = '9ad9f96f-2c3d-4c10-8d8a-ae55599a24b3';

-- EL PARQUE  [caso B · escuela-infantil · privado · servicios: 1]
UPDATE centers SET
  long_description = E'Situada en el barrio de Piovera, en el distrito de Chamartín (Madrid), EL PARQUE es una escuela infantil privada. Trabaja con niños y niñas del primer ciclo de Educación Infantil (0 a 3 años). El centro ofrece, según los datos publicados, servicio de comedor.\n\nAntes de decidir, confirma con el centro horarios, plazas y condiciones de admisión.',
  updated_at       = NOW()
WHERE id = '8fa8261d-3430-4387-955d-31459fe9ca11';

-- EL SITIO DE TU RECREO  [caso A · escuela-infantil · privado · servicios: 3]
UPDATE centers SET
  long_description = E'EL SITIO DE TU RECREO es una escuela infantil privada con sede en Madrid, en el barrio de Trafalgar (distrito de Chamberí). Su actividad se centra en el primer ciclo de Educación Infantil, de 0 a 3 años.\n\nEntre los servicios recogidos en fuentes públicas figuran iniciación al inglés. A ello se suman música y actividades extraescolares.\n\nEsta información procede de fuentes públicas y puede no estar completa. Para conocer horarios actualizados, plazas y cuotas, lo recomendable es contactar con el centro.',
  updated_at       = NOW()
WHERE id = 'f184e72e-5acf-4b7f-a911-1c2c6413a996';

-- EL SOL  [caso A · escuela-infantil · publico · servicios: 2]
UPDATE centers SET
  long_description = E'EL SOL figura como escuela infantil pública en el distrito madrileño de Chamartín, en el barrio de Nueva España. Está orientada al primer ciclo de Educación Infantil, la etapa de 0 a 3 años.\n\nEl centro ofrece, según la información pública, horario ampliado y servicio de comedor.\n\nEsta información procede de fuentes públicas y puede no estar completa. Para conocer horarios actualizados, plazas y cuotas, lo recomendable es contactar con el centro.',
  updated_at       = NOW()
WHERE id = '9ca0475a-bac6-48e8-bef3-e5a3b7229d50';

-- EL TREN DE ARGANDA  [caso A · escuela-infantil · publico · servicios: 2]
UPDATE centers SET
  long_description = E'EL TREN DE ARGANDA es una escuela infantil de titularidad pública que presta servicio en el distrito madrileño de Retiro, en el barrio de Niño Jesús. Atiende el primer ciclo de Educación Infantil, es decir, la etapa de 0 a 3 años.\n\nSegún la información disponible, el centro cuenta con horario ampliado y servicio de comedor.\n\nAntes de matricular, es aconsejable contrastar con el centro los servicios vigentes, el horario y las condiciones de cada curso.',
  updated_at       = NOW()
WHERE id = 'bb3fa50c-187f-464d-8cdf-6279acedfea6';

-- EL TREN DE LOS NIÑOS  [caso A · escuela-infantil · privado · servicios: 5]
UPDATE centers SET
  long_description = E'EL TREN DE LOS NIÑOS es una escuela infantil privada ubicada en el barrio de Castilla, en el distrito de Chamartín (Madrid). Trabaja con niños y niñas del primer ciclo de Educación Infantil (0 a 3 años).\n\nSegún la información disponible, el centro cuenta con un proyecto bilingüe. Además, la ficha recoge actividades extraescolares, música y psicomotricidad.\n\nEsta información procede de fuentes públicas y puede no estar completa. Para conocer horarios actualizados, plazas y cuotas, lo recomendable es contactar con el centro.',
  updated_at       = NOW()
WHERE id = '3a416091-27e8-427c-86fb-5d8062750a6a';

-- EL TREN DE LOS NIÑOS II  [caso A · escuela-infantil · privado · servicios: 5]
UPDATE centers SET
  long_description = E'EL TREN DE LOS NIÑOS II es una escuela infantil privada situada en Madrid, en el barrio de Castilla (distrito de Chamartín). Está orientada al primer ciclo de Educación Infantil, la etapa de 0 a 3 años.\n\nLa ficha recoge servicios como un proyecto bilingüe. Además, la ficha recoge psicomotricidad, actividades extraescolares y música. La presencia del inglés puede interesar a quienes buscan un contacto temprano con el idioma.\n\nPara obtener información concreta sobre el día a día, el horario y el proceso de admisión, lo mejor es ponerse en contacto directamente con el centro.',
  updated_at       = NOW()
WHERE id = 'b6360786-f44b-4056-8aad-975586709549';

-- EL VALLE  [caso A · escuela-infantil · publico · servicios: 2]
UPDATE centers SET
  long_description = E'Situada en Madrid, en el barrio de Vallehermoso (distrito de Chamberí), EL VALLE es una escuela infantil pública. Su actividad se centra en el primer ciclo de Educación Infantil, de 0 a 3 años.\n\nDe acuerdo con las fuentes consultadas, dispone de servicio de comedor y horario ampliado.\n\nLa ficha recopila datos de ubicación, contacto y servicios a partir de fuentes públicas. Antes de solicitar plaza conviene confirmar directamente con el centro los horarios, la disponibilidad y las condiciones de admisión.',
  updated_at       = NOW()
WHERE id = 'ba5c2626-6ac2-430e-9321-7cf2c7cbfeca';

-- EMBAJADORES  [caso A · escuela-infantil · privado · servicios: 2]
UPDATE centers SET
  long_description = E'EMBAJADORES, escuela infantil privada, se encuentra en Madrid, en el barrio de Chopera (distrito de Arganzuela). Su actividad se centra en el primer ciclo de Educación Infantil, de 0 a 3 años.\n\nLa ficha recoge servicios como iniciación al inglés. Además, la ficha recoge música.\n\nPara obtener información concreta sobre el día a día, el horario y el proceso de admisión, lo mejor es ponerse en contacto directamente con el centro.',
  updated_at       = NOW()
WHERE id = '10fd5c0a-2a91-4aa0-a4e3-3608845e9e83';

-- ESCUELA DE EDUCACION INFANTIL DEL COMPLEJO CUZCO  [caso A · escuela-infantil · publico · servicios: 3]
UPDATE centers SET
  long_description = E'ESCUELA DE EDUCACION INFANTIL DEL COMPLEJO CUZCO es una escuela infantil pública situada en el distrito madrileño de Chamartín, en el barrio de Hispanoamérica. Está orientada al primer ciclo de Educación Infantil, la etapa de 0 a 3 años.\n\nLos datos publicados incluyen servicios como servicio de comedor y horario ampliado. También se mencionan actividades extraescolares. El horario ampliado suele ser relevante para las familias que necesitan conciliar durante el curso.\n\nLos datos que se muestran se han recopilado de fuentes públicas; conviene verificar con el propio centro la disponibilidad de plaza, el calendario y las tarifas antes de decidir.',
  updated_at       = NOW()
WHERE id = '8e3ec3c2-c8ad-4c71-a0c5-218e10b48a6c';

-- ESCUELA INFANTIL BILINGÜE SUS PEQUEÑOS PASOS-ARTURO SORIA  [caso A · escuela-infantil · privado · servicios: 4]
UPDATE centers SET
  long_description = E'ESCUELA INFANTIL BILINGÜE SUS PEQUEÑOS PASOS-ARTURO SORIA es una escuela infantil privada situada en el distrito madrileño de Hortaleza. Atiende el primer ciclo de Educación Infantil, es decir, la etapa de 0 a 3 años.\n\nEntre los servicios recogidos en fuentes públicas figuran un proyecto bilingüe, patio exterior y horario ampliado.\n\nAntes de matricular, es aconsejable contrastar con el centro los servicios vigentes, el horario y las condiciones de cada curso.',
  updated_at       = NOW()
WHERE id = 'ed45e5d8-cef4-4b20-9ae2-fb41ff6090e8';

-- ESCUELA INFANTIL BRAINS MADRID  [caso A · guarderia · privado · servicios: 7]
UPDATE centers SET
  long_description = E'ESCUELA INFANTIL BRAINS MADRID figura como guardería privada en Madrid, en el barrio de Guindalera (distrito de Salamanca). Su actividad se centra en el primer ciclo de Educación Infantil, de 0 a 3 años.\n\nEntre los servicios recogidos en fuentes públicas figuran servicio de comedor y un proyecto bilingüe. A ello se suman campamentos de verano, actividades extraescolares, música y escuela de familias. La presencia del inglés puede interesar a quienes buscan un contacto temprano con el idioma.\n\nAntes de matricular, es aconsejable contrastar con el centro los servicios vigentes, el horario y las condiciones de cada curso.',
  updated_at       = NOW()
WHERE id = '8ade6798-5b66-479d-b987-e433560cf5ce';

-- ESTUDIO CONDE ORGAZ  [caso B · escuela-infantil · privado · servicios: 3]
UPDATE centers SET
  long_description = E'ESTUDIO CONDE ORGAZ es una escuela infantil de titularidad privada que presta servicio en el distrito madrileño de Hortaleza. Atiende el primer ciclo de Educación Infantil, es decir, la etapa de 0 a 3 años. La información disponible recoge servicio de madrugadores y servicio de comedor con cocina propia.\n\nRecomendamos verificar la disponibilidad y las condiciones con el propio centro.',
  updated_at       = NOW()
WHERE id = 'ab3ed14c-8b20-4306-947f-080f6baca7a6';

-- FERNANDO EL CATOLICO  [caso A · escuela-infantil · publico · servicios: 7]
UPDATE centers SET
  long_description = E'Con presencia en el distrito madrileño de Chamberí, en el barrio de Gaztambide, FERNANDO EL CATOLICO funciona como escuela infantil pública. Está orientada al primer ciclo de Educación Infantil, la etapa de 0 a 3 años.\n\nLa ficha recoge servicios como patio exterior, horario ampliado, servicio de comedor y iniciación al inglés. Además, la ficha recoge música, psicomotricidad y escuela de familias. El horario ampliado suele ser relevante para las familias que necesitan conciliar durante el curso.\n\nPara obtener información concreta sobre el día a día, el horario y el proceso de admisión, lo mejor es ponerse en contacto directamente con el centro.',
  updated_at       = NOW()
WHERE id = '674b04e9-fef5-4432-a4fc-338aad58acc7';

-- GARABATOS Y OCHO PATOS  [caso A · escuela-infantil · privado · servicios: 6]
UPDATE centers SET
  long_description = E'GARABATOS Y OCHO PATOS, escuela infantil privada, se encuentra en Madrid, en el barrio de Peña Grande (distrito de Arganzuela). Atiende el primer ciclo de Educación Infantil, es decir, la etapa de 0 a 3 años.\n\nLa ficha recoge servicios como horario ampliado, patio exterior, iniciación al inglés y servicio de comedor. Además, la ficha recoge música y actividades extraescolares.\n\nAntes de matricular, es aconsejable contrastar con el centro los servicios vigentes, el horario y las condiciones de cada curso.',
  updated_at       = NOW()
WHERE id = 'b3c2a25e-7fe0-4700-b515-570ef4880e6c';

-- GRAN VIA  [caso B · escuela-infantil · privado · servicios: 1]
UPDATE centers SET
  long_description = E'Con presencia en el barrio de Canillas, en el distrito de Hortaleza (Madrid), GRAN VIA funciona como escuela infantil privada. Está orientada al primer ciclo de Educación Infantil, la etapa de 0 a 3 años. La información disponible recoge servicio de comedor.\n\nRecomendamos verificar la disponibilidad y las condiciones con el propio centro.',
  updated_at       = NOW()
WHERE id = '0dc73047-36fa-45bc-b88a-c8f504da4912';

-- GREENLEAVES MONTESSORI II  [caso A · escuela-infantil · privado · servicios: 8]
UPDATE centers SET
  long_description = E'GREENLEAVES MONTESSORI II figura como escuela infantil privada en Madrid, en el distrito de Moncloa-Aravaca. Atiende el primer ciclo de Educación Infantil, es decir, la etapa de 0 a 3 años.\n\nEl centro ofrece, según la información pública, patio exterior, servicio de catering y un proyecto bilingüe. También se mencionan actividades extraescolares, campamentos de verano, psicomotricidad y música. La presencia del inglés puede interesar a quienes buscan un contacto temprano con el idioma.\n\nLos datos que se muestran se han recopilado de fuentes públicas; conviene verificar con el propio centro la disponibilidad de plaza, el calendario y las tarifas antes de decidir.',
  updated_at       = NOW()
WHERE id = 'ac52291f-097c-42de-88ad-936822cadd2c';

-- INTERNACIONAL VALDEMARIN  [caso A · escuela-infantil · privado · servicios: 6]
UPDATE centers SET
  long_description = E'Situada en el distrito madrileño de Moncloa-Aravaca, en el barrio de Valdemarín, INTERNACIONAL VALDEMARIN es una escuela infantil privada. Está orientada al primer ciclo de Educación Infantil, la etapa de 0 a 3 años.\n\nDe acuerdo con las fuentes consultadas, dispone de horario ampliado y servicio de comedor con cocina propia. A ello se suman orientación pedagógica, actividades extraescolares y campamentos de verano.\n\nPara obtener información concreta sobre el día a día, el horario y el proceso de admisión, lo mejor es ponerse en contacto directamente con el centro.',
  updated_at       = NOW()
WHERE id = '4230f252-d7aa-43d5-b116-d3d33cf0a8e5';

-- INTERNATIONAL MONTESSORI KINDERGARTEN  [caso A · guarderia · privado · servicios: 4]
UPDATE centers SET
  long_description = E'Con presencia en el distrito de Hortaleza, en Madrid, INTERNATIONAL MONTESSORI KINDERGARTEN funciona como guardería privada. Su actividad se centra en el primer ciclo de Educación Infantil, de 0 a 3 años.\n\nDe acuerdo con las fuentes consultadas, dispone de servicio de comedor y iniciación al inglés. A ello se suman campamentos de verano y actividades extraescolares.\n\nLos datos que se muestran se han recopilado de fuentes públicas; conviene verificar con el propio centro la disponibilidad de plaza, el calendario y las tarifas antes de decidir.',
  updated_at       = NOW()
WHERE id = '88f6271c-7978-48a4-bbbe-43e042e1dd19';

-- IRIS  [caso A · escuela-infantil · privado · servicios: 2]
UPDATE centers SET
  long_description = E'IRIS es una escuela infantil privada situada en Madrid, en el barrio de Canillas (distrito de Hortaleza). Su actividad se centra en el primer ciclo de Educación Infantil, de 0 a 3 años.\n\nEl centro ofrece, según la información pública, psicomotricidad y actividades extraescolares.\n\nAntes de matricular, es aconsejable contrastar con el centro los servicios vigentes, el horario y las condiciones de cada curso.',
  updated_at       = NOW()
WHERE id = '7fed9cf6-3a8e-4363-aa1b-2b69eb819ddf';

-- IRIS II  [caso A · escuela-infantil · privado · servicios: 2]
UPDATE centers SET
  long_description = E'Con presencia en Madrid, en el barrio de Canillas (distrito de Hortaleza), IRIS II funciona como escuela infantil privada. Su actividad se centra en el primer ciclo de Educación Infantil, de 0 a 3 años.\n\nSegún la información disponible, el centro cuenta con actividades extraescolares y psicomotricidad.\n\nEsta información procede de fuentes públicas y puede no estar completa. Para conocer horarios actualizados, plazas y cuotas, lo recomendable es contactar con el centro.',
  updated_at       = NOW()
WHERE id = '84766903-944b-49f5-b46c-d155f95b1968';

-- JARDIN DE LAS DELICIAS  [caso B · escuela-infantil · privado · servicios: 1]
UPDATE centers SET
  long_description = E'JARDIN DE LAS DELICIAS es una escuela infantil privada situada en el barrio de Delicias, en el distrito de Arganzuela (Madrid). Atiende el primer ciclo de Educación Infantil, es decir, la etapa de 0 a 3 años. La información disponible recoge iniciación al inglés.\n\nRecomendamos verificar la disponibilidad y las condiciones con el propio centro.',
  updated_at       = NOW()
WHERE id = '7cd39706-b41e-4cff-afab-511643654f7b';

-- JARDIN INFANTIL  [caso A · escuela-infantil · privado · servicios: 2]
UPDATE centers SET
  long_description = E'JARDIN INFANTIL figura como escuela infantil privada en el distrito madrileño de Arganzuela, en el barrio de Delicias. Trabaja con niños y niñas del primer ciclo de Educación Infantil (0 a 3 años).\n\nEl centro ofrece, según la información pública, patio exterior y cocina propia. Contar con cocina propia permite elaborar los menús en el propio centro.\n\nAntes de matricular, es aconsejable contrastar con el centro los servicios vigentes, el horario y las condiciones de cada curso.',
  updated_at       = NOW()
WHERE id = '1d1eeb20-8d1f-4756-8c61-a0a5e78e1450';

-- KIKA  [caso A · escuela-infantil · privado · servicios: 5]
UPDATE centers SET
  long_description = E'KIKA es una escuela infantil de titularidad privada que presta servicio en el barrio de Legazpi, en el distrito de Arganzuela (Madrid). Trabaja con niños y niñas del primer ciclo de Educación Infantil (0 a 3 años).\n\nDe acuerdo con las fuentes consultadas, dispone de patio exterior, iniciación al inglés y cocina propia. A ello se suman actividades extraescolares y música. La presencia del inglés puede interesar a quienes buscan un contacto temprano con el idioma.\n\nLa ficha recopila datos de ubicación, contacto y servicios a partir de fuentes públicas. Antes de solicitar plaza conviene confirmar directamente con el centro los horarios, la disponibilidad y las condiciones de admisión.',
  updated_at       = NOW()
WHERE id = '44e68835-e79b-453f-a634-280c7f6acf4c';

-- KINDER SANTAMARCA  [caso B · escuela-infantil · privado · servicios: 1]
UPDATE centers SET
  long_description = E'KINDER SANTAMARCA figura como escuela infantil privada en Madrid, en el distrito de Chamartín. Su actividad se centra en el primer ciclo de Educación Infantil, de 0 a 3 años. Según los datos públicos, dispone de servicio de comedor.\n\nAntes de decidir, confirma con el centro horarios, plazas y condiciones de admisión.',
  updated_at       = NOW()
WHERE id = '4e626df4-1cad-4935-b8a4-1f117d1f165b';

-- LA ALMUDENA  [caso A · escuela-infantil · publico · servicios: 2]
UPDATE centers SET
  long_description = E'LA ALMUDENA es una escuela infantil pública ubicada en el barrio de Canillas, en el distrito de Hortaleza (Madrid). Trabaja con niños y niñas del primer ciclo de Educación Infantil (0 a 3 años).\n\nEl centro ofrece, según la información pública, servicio de comedor y horario ampliado.\n\nLos datos que se muestran se han recopilado de fuentes públicas; conviene verificar con el propio centro la disponibilidad de plaza, el calendario y las tarifas antes de decidir.',
  updated_at       = NOW()
WHERE id = 'dfc9ceca-50c2-4842-b3e4-070a4527f14e';

-- LA ARDILLA  [caso A · escuela-infantil · publico · servicios: 2]
UPDATE centers SET
  long_description = E'LA ARDILLA es una escuela infantil pública situada en el distrito madrileño de Hortaleza, en el barrio de Valdefuentes. Está orientada al primer ciclo de Educación Infantil, la etapa de 0 a 3 años.\n\nLos datos publicados incluyen servicios como servicio de comedor y horario ampliado.\n\nComo la ficha todavía no ha sido reclamada por el centro, conviene confirmar con el equipo los detalles de funcionamiento, horarios y admisión.',
  updated_at       = NOW()
WHERE id = 'bd48d7a1-e32b-4313-9334-d7a5438714cb';

-- LA BOLA DE CRISTAL  [caso A · escuela-infantil · publico · servicios: 2]
UPDATE centers SET
  long_description = E'Con presencia en el barrio de Valdezarza, en el distrito de Moncloa-Aravaca (Madrid), LA BOLA DE CRISTAL funciona como escuela infantil pública. Está orientada al primer ciclo de Educación Infantil, la etapa de 0 a 3 años.\n\nLa ficha recoge servicios como horario ampliado y servicio de comedor. El horario ampliado suele ser relevante para las familias que necesitan conciliar durante el curso.\n\nEsta información procede de fuentes públicas y puede no estar completa. Para conocer horarios actualizados, plazas y cuotas, lo recomendable es contactar con el centro.',
  updated_at       = NOW()
WHERE id = '4df1e9bf-2683-4041-ac79-72ee61c1a8ed';

-- LA GRAN VIA  [caso A · escuela-infantil · publico · servicios: 2]
UPDATE centers SET
  long_description = E'LA GRAN VIA es una escuela infantil pública con sede en Madrid, en el barrio de Canillas (distrito de Hortaleza). Atiende el primer ciclo de Educación Infantil, es decir, la etapa de 0 a 3 años.\n\nEntre los servicios recogidos en fuentes públicas figuran servicio de comedor y horario ampliado. El horario ampliado suele ser relevante para las familias que necesitan conciliar durante el curso.\n\nAntes de matricular, es aconsejable contrastar con el centro los servicios vigentes, el horario y las condiciones de cada curso.',
  updated_at       = NOW()
WHERE id = '6e2826da-742f-40c0-87d3-6e0ac7a2bbff';

-- LA JIRAFA  [caso A · escuela-infantil · privado · servicios: 6]
UPDATE centers SET
  long_description = E'Con presencia en Madrid, en el barrio de Canillas (distrito de Hortaleza), LA JIRAFA funciona como escuela infantil privada. Trabaja con niños y niñas del primer ciclo de Educación Infantil (0 a 3 años).\n\nLa ficha recoge servicios como un proyecto bilingüe, servicio de comedor y horario ampliado. Además, la ficha recoge música y psicomotricidad. El horario ampliado suele ser relevante para las familias que necesitan conciliar durante el curso.\n\nPara obtener información concreta sobre el día a día, el horario y el proceso de admisión, lo mejor es ponerse en contacto directamente con el centro.',
  updated_at       = NOW()
WHERE id = 'a20d8eb1-7b33-45e1-ac2d-da09a0e99651';

-- LA MELONERA  [caso A · escuela-infantil · publico · servicios: 2]
UPDATE centers SET
  long_description = E'LA MELONERA, escuela infantil pública, se encuentra en el barrio de Legazpi, en el distrito de Arganzuela (Madrid). Su actividad se centra en el primer ciclo de Educación Infantil, de 0 a 3 años.\n\nLos datos publicados incluyen servicios como servicio de comedor y horario ampliado. El horario ampliado suele ser relevante para las familias que necesitan conciliar durante el curso.\n\nLa ficha recopila datos de ubicación, contacto y servicios a partir de fuentes públicas. Antes de solicitar plaza conviene confirmar directamente con el centro los horarios, la disponibilidad y las condiciones de admisión.',
  updated_at       = NOW()
WHERE id = '589089df-12df-48ea-b65a-30fd6830227b';

-- LAR  [caso A · guarderia · privado · servicios: 2]
UPDATE centers SET
  long_description = E'Con presencia en el distrito madrileño de Arganzuela, en el barrio de Butarque, LAR funciona como guardería privada. Su actividad se centra en el primer ciclo de Educación Infantil, de 0 a 3 años.\n\nEntre los servicios recogidos en fuentes públicas figuran horario ampliado y servicio de comedor. El horario ampliado suele ser relevante para las familias que necesitan conciliar durante el curso.\n\nEsta información procede de fuentes públicas y puede no estar completa. Para conocer horarios actualizados, plazas y cuotas, lo recomendable es contactar con el centro.',
  updated_at       = NOW()
WHERE id = '1571c1d9-5254-4312-899d-f5cfccdc5541';

-- LAS NUBES  [caso A · escuela-infantil · publico · servicios: 2]
UPDATE centers SET
  long_description = E'LAS NUBES figura como escuela infantil pública en el barrio de Pacífico, en el distrito de Retiro (Madrid). Trabaja con niños y niñas del primer ciclo de Educación Infantil (0 a 3 años).\n\nLa ficha recoge servicios como horario ampliado y servicio de comedor.\n\nLos datos que se muestran se han recopilado de fuentes públicas; conviene verificar con el propio centro la disponibilidad de plaza, el calendario y las tarifas antes de decidir.',
  updated_at       = NOW()
WHERE id = '3f51b9d7-3200-418c-a901-0c60095d2f8d';

-- LAS PLEYADES  [caso A · escuela-infantil · publico · servicios: 2]
UPDATE centers SET
  long_description = E'LAS PLEYADES es una escuela infantil de titularidad pública que presta servicio en el distrito madrileño de Hortaleza, en el barrio de Valdefuentes. Está orientada al primer ciclo de Educación Infantil, la etapa de 0 a 3 años.\n\nSegún la información disponible, el centro cuenta con horario ampliado y servicio de comedor.\n\nComo la ficha todavía no ha sido reclamada por el centro, conviene confirmar con el equipo los detalles de funcionamiento, horarios y admisión.',
  updated_at       = NOW()
WHERE id = 'aea46d82-c07d-48d6-bfa6-7ac66c2157ba';

-- LAS VIÑAS  [caso A · escuela-infantil · publico · servicios: 2]
UPDATE centers SET
  long_description = E'Situada en el barrio de Aravaca, en el distrito de Moncloa-Aravaca (Madrid), LAS VIÑAS es una escuela infantil pública. Atiende el primer ciclo de Educación Infantil, es decir, la etapa de 0 a 3 años.\n\nDe acuerdo con las fuentes consultadas, dispone de horario ampliado y servicio de comedor. El horario ampliado suele ser relevante para las familias que necesitan conciliar durante el curso.\n\nEsta información procede de fuentes públicas y puede no estar completa. Para conocer horarios actualizados, plazas y cuotas, lo recomendable es contactar con el centro.',
  updated_at       = NOW()
WHERE id = '01366d6b-34b1-4135-8a91-2551e3da3680';

-- LITTLE CLOVERS  [caso A · escuela-infantil · privado · servicios: 6]
UPDATE centers SET
  long_description = E'LITTLE CLOVERS, escuela infantil privada, se encuentra en el distrito madrileño de Hortaleza, en el barrio de Canillas. Su actividad se centra en el primer ciclo de Educación Infantil, de 0 a 3 años.\n\nDe acuerdo con las fuentes consultadas, dispone de horario ampliado y un proyecto bilingüe. A ello se suman campamentos de verano, uniforme y actividades extraescolares. El horario ampliado suele ser relevante para las familias que necesitan conciliar durante el curso.\n\nAntes de matricular, es aconsejable contrastar con el centro los servicios vigentes, el horario y las condiciones de cada curso.',
  updated_at       = NOW()
WHERE id = '78e5d5e1-3cab-4db3-b85a-87f775e88fd4';

-- LITTLE WITCH  [caso B · escuela-infantil · privado · servicios: 1]
UPDATE centers SET
  long_description = E'LITTLE WITCH es una escuela infantil privada ubicada en el barrio de Castilla, en el distrito de Chamartín (Madrid). Está orientada al primer ciclo de Educación Infantil, la etapa de 0 a 3 años. El centro ofrece, según los datos publicados, servicio de comedor.\n\nConviene confirmar horarios, plazas y condiciones directamente con el centro.',
  updated_at       = NOW()
WHERE id = 'ebe5ec06-ad85-4ae4-90c9-dd2dcaabde60';

-- LOS PINOS  [caso A · escuela-infantil · privado · servicios: 2]
UPDATE centers SET
  long_description = E'LOS PINOS figura como escuela infantil privada en el barrio de Fuente del Berro, en el distrito de Salamanca (Madrid). Trabaja con niños y niñas del primer ciclo de Educación Infantil (0 a 3 años).\n\nDe acuerdo con las fuentes consultadas, dispone de horario ampliado y servicio de comedor.\n\nAntes de matricular, es aconsejable contrastar con el centro los servicios vigentes, el horario y las condiciones de cada curso.',
  updated_at       = NOW()
WHERE id = 'e57b8e0f-e1f4-4e47-b801-b5615acf8c2c';

-- MAGOS  [caso B · escuela-infantil · privado · servicios: 1]
UPDATE centers SET
  long_description = E'MAGOS es una escuela infantil privada con sede en el distrito madrileño de Retiro, en el barrio de Niño Jesús. Atiende el primer ciclo de Educación Infantil, es decir, la etapa de 0 a 3 años. El centro cuenta con servicio de comedor, según la información pública.\n\nPara detalles de horario, plazas y admisión, lo mejor es contactar con el centro.',
  updated_at       = NOW()
WHERE id = '817f33c5-a1df-4352-b3c0-73743327a9db';

-- MAMATINA  [caso A · escuela-infantil · privado · servicios: 5]
UPDATE centers SET
  long_description = E'Situada en el distrito madrileño de Moncloa-Aravaca, en el barrio de Aravaca, MAMATINA es una escuela infantil privada. Trabaja con niños y niñas del primer ciclo de Educación Infantil (0 a 3 años).\n\nEntre los servicios recogidos en fuentes públicas figuran iniciación al inglés, patio exterior, servicio de comedor con cocina propia y servicio de madrugadores.\n\nComo la ficha todavía no ha sido reclamada por el centro, conviene confirmar con el equipo los detalles de funcionamiento, horarios y admisión.',
  updated_at       = NOW()
WHERE id = '64012e8b-c8d0-42ae-9a42-a4acc88edd2d';

-- MENAGAR  [caso B · escuela-infantil · privado · servicios: 1]
UPDATE centers SET
  long_description = E'MENAGAR es una escuela infantil de titularidad privada que presta servicio en Madrid, en el barrio de Hispanoamérica (distrito de Chamartín). Trabaja con niños y niñas del primer ciclo de Educación Infantil (0 a 3 años). El centro ofrece, según los datos publicados, servicio de comedor.\n\nAntes de decidir, confirma con el centro horarios, plazas y condiciones de admisión.',
  updated_at       = NOW()
WHERE id = 'ed231375-a5b8-4fe4-a867-610a3500b107';

-- MI PRIMER COLE 2  [caso A · escuela-infantil · privado · servicios: 5]
UPDATE centers SET
  long_description = E'MI PRIMER COLE 2 es una escuela infantil privada situada en Madrid, en el barrio de Piovera (distrito de Salamanca). Trabaja con niños y niñas del primer ciclo de Educación Infantil (0 a 3 años).\n\nEntre los servicios recogidos en fuentes públicas figuran iniciación al inglés. A ello se suman música, psicomotricidad, actividades extraescolares y escuela de familias.\n\nComo la ficha todavía no ha sido reclamada por el centro, conviene confirmar con el equipo los detalles de funcionamiento, horarios y admisión.',
  updated_at       = NOW()
WHERE id = 'bad591e9-7637-414d-952b-59bd44cc68fd';

-- MICOS, MI PRIMER COLE  [caso A · guarderia · privado · servicios: 4]
UPDATE centers SET
  long_description = E'Situada en el distrito madrileño de Chamartín, en el barrio de El Viso, MICOS, MI PRIMER COLE es una guardería privada. Atiende el primer ciclo de Educación Infantil, es decir, la etapa de 0 a 3 años.\n\nSegún la información disponible, el centro cuenta con cocina propia, horario ampliado y iniciación al inglés. Además, la ficha recoge música.\n\nAntes de matricular, es aconsejable contrastar con el centro los servicios vigentes, el horario y las condiciones de cada curso.',
  updated_at       = NOW()
WHERE id = 'f4b7ba3a-8d41-40ca-a807-a92e5b619fcb';

-- MIS-MIS  [caso B · escuela-infantil · publico · servicios: 6]
UPDATE centers SET
  long_description = E'MIS-MIS es una escuela infantil pública situada en el distrito de Chamberí, en Madrid. Está orientada al primer ciclo de Educación Infantil, la etapa de 0 a 3 años. La información disponible recoge actividades extraescolares, psicomotricidad, iniciación al inglés, escuela de familias, música y campamentos de verano.\n\nConviene confirmar horarios, plazas y condiciones directamente con el centro.',
  updated_at       = NOW()
WHERE id = 'cac1f1f0-5658-4d44-bb94-d9715d09bcca';

-- NAZARET  [caso A · guarderia · concertado · servicios: 2]
UPDATE centers SET
  long_description = E'Con presencia en Madrid, en el barrio de Simancas (distrito de Chamartín), NAZARET funciona como guardería concertada. Trabaja con niños y niñas del primer ciclo de Educación Infantil (0 a 3 años).\n\nDe acuerdo con las fuentes consultadas, dispone de horario ampliado y servicio de comedor.\n\nLos datos que se muestran se han recopilado de fuentes públicas; conviene verificar con el propio centro la disponibilidad de plaza, el calendario y las tarifas antes de decidir.',
  updated_at       = NOW()
WHERE id = 'c562b08b-221d-42c6-885a-c9ee7a8251d8';

-- NEMOMARLIN ARGANZUELA  [caso A · escuela-infantil · privado · servicios: 7]
UPDATE centers SET
  long_description = E'NEMOMARLIN ARGANZUELA figura como escuela infantil privada en el distrito madrileño de Arganzuela, en el barrio de Acacias. Está orientada al primer ciclo de Educación Infantil, la etapa de 0 a 3 años.\n\nSegún la información disponible, el centro cuenta con servicio de comedor con cocina propia, horario ampliado y un proyecto bilingüe. Además, la ficha recoge campamentos de verano, orientación pedagógica y psicomotricidad. La presencia del inglés puede interesar a quienes buscan un contacto temprano con el idioma.\n\nLos datos que se muestran se han recopilado de fuentes públicas; conviene verificar con el propio centro la disponibilidad de plaza, el calendario y las tarifas antes de decidir.',
  updated_at       = NOW()
WHERE id = 'f8909853-cf9e-434e-8951-3ed004176dcb';

-- NEMOMARLIN CHAMBERÍ  [caso A · escuela-infantil · privado · servicios: 2]
UPDATE centers SET
  long_description = E'NEMOMARLIN CHAMBERÍ es una escuela infantil de titularidad privada que presta servicio en el distrito madrileño de Chamberí, en el barrio de Arapiles. Trabaja con niños y niñas del primer ciclo de Educación Infantil (0 a 3 años).\n\nEntre los servicios recogidos en fuentes públicas figuran un proyecto bilingüe. La presencia del inglés puede interesar a quienes buscan un contacto temprano con el idioma.\n\nLos datos que se muestran se han recopilado de fuentes públicas; conviene verificar con el propio centro la disponibilidad de plaza, el calendario y las tarifas antes de decidir.',
  updated_at       = NOW()
WHERE id = 'e2a012c7-df53-41bf-b263-9f8990e285f5';

-- NEMOMARLIN CIUDAD JARDIN  [caso A · escuela-infantil · privado · servicios: 2]
UPDATE centers SET
  long_description = E'Situada en Madrid, en el barrio de Ciudad Jardín (distrito de Chamartín), NEMOMARLIN CIUDAD JARDIN es una escuela infantil privada. Está orientada al primer ciclo de Educación Infantil, la etapa de 0 a 3 años.\n\nDe acuerdo con las fuentes consultadas, dispone de un proyecto bilingüe.\n\nAntes de matricular, es aconsejable contrastar con el centro los servicios vigentes, el horario y las condiciones de cada curso.',
  updated_at       = NOW()
WHERE id = '566b2631-8266-4a51-8544-d3b322c71767';

-- NEMOMARLIN CONDE DE ORGAZ  [caso A · escuela-infantil · privado · servicios: 2]
UPDATE centers SET
  long_description = E'NEMOMARLIN CONDE DE ORGAZ es una escuela infantil privada ubicada en el distrito madrileño de Hortaleza, en el barrio de Piovera. Atiende el primer ciclo de Educación Infantil, es decir, la etapa de 0 a 3 años.\n\nEl centro ofrece, según la información pública, un proyecto bilingüe. La presencia del inglés puede interesar a quienes buscan un contacto temprano con el idioma.\n\nLa ficha recopila datos de ubicación, contacto y servicios a partir de fuentes públicas. Antes de solicitar plaza conviene confirmar directamente con el centro los horarios, la disponibilidad y las condiciones de admisión.',
  updated_at       = NOW()
WHERE id = '2f2ccb55-1503-42f8-aa71-3a647f08ce85';

-- NEMOMARLIN GUINDALERA  [caso A · escuela-infantil · privado · servicios: 2]
UPDATE centers SET
  long_description = E'NEMOMARLIN GUINDALERA es una escuela infantil privada situada en el barrio de Guindalera, en el distrito de Salamanca (Madrid). Su actividad se centra en el primer ciclo de Educación Infantil, de 0 a 3 años.\n\nSegún la información disponible, el centro cuenta con un proyecto bilingüe. La presencia del inglés puede interesar a quienes buscan un contacto temprano con el idioma.\n\nPara obtener información concreta sobre el día a día, el horario y el proceso de admisión, lo mejor es ponerse en contacto directamente con el centro.',
  updated_at       = NOW()
WHERE id = '65326fa5-68ac-49be-881c-412d016476c7';

-- NEMOMARLIN PASEO DE LA HABANA  [caso A · escuela-infantil · privado · servicios: 2]
UPDATE centers SET
  long_description = E'Con presencia en el distrito madrileño de Chamartín, en el barrio de Hispanoamérica, NEMOMARLIN PASEO DE LA HABANA funciona como escuela infantil privada. Su actividad se centra en el primer ciclo de Educación Infantil, de 0 a 3 años.\n\nDe acuerdo con las fuentes consultadas, dispone de un proyecto bilingüe. La presencia del inglés puede interesar a quienes buscan un contacto temprano con el idioma.\n\nComo la ficha todavía no ha sido reclamada por el centro, conviene confirmar con el equipo los detalles de funcionamiento, horarios y admisión.',
  updated_at       = NOW()
WHERE id = '5a2ee5b7-5694-4e9d-8020-aaa3c2f28c05';

-- NEMOMARLIN PINTOR ROSALES  [caso A · escuela-infantil · privado · servicios: 2]
UPDATE centers SET
  long_description = E'NEMOMARLIN PINTOR ROSALES es una escuela infantil privada con sede en Madrid, en el barrio de Argüelles (distrito de Moncloa-Aravaca). Trabaja con niños y niñas del primer ciclo de Educación Infantil (0 a 3 años).\n\nEl centro ofrece, según la información pública, un proyecto bilingüe. La presencia del inglés puede interesar a quienes buscan un contacto temprano con el idioma.\n\nEsta información procede de fuentes públicas y puede no estar completa. Para conocer horarios actualizados, plazas y cuotas, lo recomendable es contactar con el centro.',
  updated_at       = NOW()
WHERE id = '7073b11f-406b-4156-b350-1fe2cf5ea6f4';

-- NEMOMARLIN RETIRO  [caso A · escuela-infantil · privado · servicios: 2]
UPDATE centers SET
  long_description = E'NEMOMARLIN RETIRO, escuela infantil privada, se encuentra en el barrio de Niño Jesús, en el distrito de Retiro (Madrid). Está orientada al primer ciclo de Educación Infantil, la etapa de 0 a 3 años.\n\nLos datos publicados incluyen servicios como un proyecto bilingüe. La presencia del inglés puede interesar a quienes buscan un contacto temprano con el idioma.\n\nAntes de matricular, es aconsejable contrastar con el centro los servicios vigentes, el horario y las condiciones de cada curso.',
  updated_at       = NOW()
WHERE id = 'cb98103f-3f15-439b-be5f-e3a8641f5911';

-- NEMOMARLIN SANCHINARRO  [caso B · escuela-infantil · privado · servicios: 1]
UPDATE centers SET
  long_description = E'NEMOMARLIN SANCHINARRO es una escuela infantil privada situada en el barrio de Valdefuentes, en el distrito de Hortaleza (Madrid). Atiende el primer ciclo de Educación Infantil, es decir, la etapa de 0 a 3 años. La información disponible recoge servicio de comedor.\n\nRecomendamos verificar la disponibilidad y las condiciones con el propio centro.',
  updated_at       = NOW()
WHERE id = '045aaf43-3142-405c-ac2f-40e18383e31b';

-- NUESTRA SEÑORA DE LA PAZ  [caso A · escuela-infantil · concertado · servicios: 2]
UPDATE centers SET
  long_description = E'NUESTRA SEÑORA DE LA PAZ figura como escuela infantil concertada en Madrid, en el barrio de Pacífico (distrito de Retiro). Trabaja con niños y niñas del primer ciclo de Educación Infantil (0 a 3 años).\n\nLa ficha recoge servicios como servicio de comedor y horario ampliado.\n\nComo la ficha todavía no ha sido reclamada por el centro, conviene confirmar con el equipo los detalles de funcionamiento, horarios y admisión.',
  updated_at       = NOW()
WHERE id = 'b6243432-bc19-4956-ba03-392a9c2374ac';

-- NUESTRA SEÑORA DE LOS DOLORES  [caso B · escuela-infantil · concertado · servicios: 1]
UPDATE centers SET
  long_description = E'Con presencia en Madrid, en el barrio de Arapiles (distrito de Chamberí), NUESTRA SEÑORA DE LOS DOLORES funciona como escuela infantil concertada. Atiende el primer ciclo de Educación Infantil, es decir, la etapa de 0 a 3 años. La información disponible recoge servicio de comedor.\n\nPara detalles de horario, plazas y admisión, lo mejor es contactar con el centro.',
  updated_at       = NOW()
WHERE id = 'c37dd7fd-151f-4df1-bf4b-b7561a6db6b2';

-- OLAVIDE  [caso A · escuela-infantil · privado · servicios: 7]
UPDATE centers SET
  long_description = E'OLAVIDE es una escuela infantil privada ubicada en el distrito madrileño de Chamberí, en el barrio de Trafalgar. Atiende el primer ciclo de Educación Infantil, es decir, la etapa de 0 a 3 años.\n\nSegún la información disponible, el centro cuenta con horario ampliado, iniciación al inglés y servicio de comedor. Además, la ficha recoge orientación pedagógica, psicomotricidad, música y actividades extraescolares. El horario ampliado suele ser relevante para las familias que necesitan conciliar durante el curso.\n\nEsta información procede de fuentes públicas y puede no estar completa. Para conocer horarios actualizados, plazas y cuotas, lo recomendable es contactar con el centro.',
  updated_at       = NOW()
WHERE id = 'e82f1941-c68a-4ddd-a8e6-0c6d56a77c7f';

-- OSOBUCO  [caso A · escuela-infantil · privado · servicios: 4]
UPDATE centers SET
  long_description = E'OSOBUCO figura como escuela infantil privada en el distrito madrileño de Chamartín, en el barrio de Prosperidad. Trabaja con niños y niñas del primer ciclo de Educación Infantil (0 a 3 años).\n\nSegún la información disponible, el centro cuenta con cocina propia, patio exterior y horario ampliado. Además, la ficha recoge campamentos de verano. El horario ampliado suele ser relevante para las familias que necesitan conciliar durante el curso.\n\nComo la ficha todavía no ha sido reclamada por el centro, conviene confirmar con el equipo los detalles de funcionamiento, horarios y admisión.',
  updated_at       = NOW()
WHERE id = '18560653-1d3f-4fcb-a644-efd32c114c9d';

-- OSOBUCO II  [caso A · escuela-infantil · privado · servicios: 4]
UPDATE centers SET
  long_description = E'OSOBUCO II es una escuela infantil de titularidad privada que presta servicio en el barrio de Prosperidad, en el distrito de Chamartín (Madrid). Está orientada al primer ciclo de Educación Infantil, la etapa de 0 a 3 años.\n\nLa ficha recoge servicios como cocina propia, horario ampliado y patio exterior. Además, la ficha recoge campamentos de verano. El horario ampliado suele ser relevante para las familias que necesitan conciliar durante el curso.\n\nEsta información procede de fuentes públicas y puede no estar completa. Para conocer horarios actualizados, plazas y cuotas, lo recomendable es contactar con el centro.',
  updated_at       = NOW()
WHERE id = 'd84b45f5-b68f-4fab-8125-08076bbce188';

-- PARQUE DE HORTALEZA  [caso A · escuela-infantil · publico · servicios: 4]
UPDATE centers SET
  long_description = E'PARQUE DE HORTALEZA es una escuela infantil de titularidad pública que presta servicio en Madrid, en el barrio de Pinar del Rey (distrito de Hortaleza). Está orientada al primer ciclo de Educación Infantil, la etapa de 0 a 3 años.\n\nLos datos publicados incluyen servicios como horario ampliado, servicio de comedor y iniciación al inglés. También se mencionan escuela de familias.\n\nComo la ficha todavía no ha sido reclamada por el centro, conviene confirmar con el equipo los detalles de funcionamiento, horarios y admisión.',
  updated_at       = NOW()
WHERE id = '375bcd5b-f1ad-421d-a62e-33671df573ba';

-- PASO A PASO  [caso B · escuela-infantil · privado · servicios: 1]
UPDATE centers SET
  long_description = E'PASO A PASO, escuela infantil privada, se encuentra en el barrio de Acacias, en el distrito de Arganzuela (Madrid). Su actividad se centra en el primer ciclo de Educación Infantil, de 0 a 3 años. Según los datos públicos, dispone de iniciación al inglés.\n\nAntes de decidir, confirma con el centro horarios, plazas y condiciones de admisión.',
  updated_at       = NOW()
WHERE id = '669c81c1-3b8e-4fc8-a584-353c0a07bb39';

-- PEQUEANDO  [caso A · escuela-infantil · privado · servicios: 4]
UPDATE centers SET
  long_description = E'Con presencia en el barrio de Valdefuentes, en el distrito de Hortaleza (Madrid), PEQUEANDO funciona como escuela infantil privada. Su actividad se centra en el primer ciclo de Educación Infantil, de 0 a 3 años.\n\nLos datos publicados incluyen servicios como iniciación al inglés y patio exterior. También se mencionan escuela de familias y música. La presencia del inglés puede interesar a quienes buscan un contacto temprano con el idioma.\n\nComo la ficha todavía no ha sido reclamada por el centro, conviene confirmar con el equipo los detalles de funcionamiento, horarios y admisión.',
  updated_at       = NOW()
WHERE id = '70262e7f-ca4b-4355-8f65-dcc1945ba6f4';

-- PINOCHO  [caso A · escuela-infantil · privado · servicios: 5]
UPDATE centers SET
  long_description = E'PINOCHO es una escuela infantil privada situada en el distrito madrileño de Retiro. Su actividad se centra en el primer ciclo de Educación Infantil, de 0 a 3 años.\n\nLos datos publicados incluyen servicios como servicio de comedor y un proyecto bilingüe. También se mencionan actividades extraescolares y música.\n\nLos datos que se muestran se han recopilado de fuentes públicas; conviene verificar con el propio centro la disponibilidad de plaza, el calendario y las tarifas antes de decidir.',
  updated_at       = NOW()
WHERE id = '04f8c4bd-ceb8-433a-b59a-a70c3fc1015a';

-- PIPO'S  [caso A · guarderia · privado · servicios: 6]
UPDATE centers SET
  long_description = E'PIPO''S es una guardería privada situada en el distrito madrileño de Arganzuela, en el barrio de La Chopera. Cubre la etapa de Educación Infantil desde los primeros meses hasta los 6 años, incluyendo el segundo ciclo.\n\nDe acuerdo con las fuentes consultadas, dispone de servicio de comedor, iniciación al inglés y horario ampliado. A ello se suman psicomotricidad, actividades extraescolares y música. El horario ampliado suele ser relevante para las familias que necesitan conciliar durante el curso.\n\nLa ficha recopila datos de ubicación, contacto y servicios a partir de fuentes públicas. Antes de solicitar plaza conviene confirmar directamente con el centro los horarios, la disponibilidad y las condiciones de admisión.',
  updated_at       = NOW()
WHERE id = '49e1fb72-4b07-4bec-b52d-6d53fc3f66fa';

-- PROJARDIN DELICIAS  [caso A · escuela-infantil · privado · servicios: 5]
UPDATE centers SET
  long_description = E'PROJARDIN DELICIAS es una escuela infantil de titularidad privada que presta servicio en Madrid, en el barrio de Delicias (distrito de Arganzuela). Trabaja con niños y niñas del primer ciclo de Educación Infantil (0 a 3 años).\n\nEl centro ofrece, según la información pública, servicio de comedor. También se mencionan campamentos de verano, uniforme, actividades extraescolares y orientación pedagógica.\n\nPara obtener información concreta sobre el día a día, el horario y el proceso de admisión, lo mejor es ponerse en contacto directamente con el centro.',
  updated_at       = NOW()
WHERE id = '4ec45fc5-a106-4db9-8db0-d3be5ee6baa4';

-- PROJARDIN MADIBA  [caso A · escuela-infantil · privado · servicios: 5]
UPDATE centers SET
  long_description = E'Situada en el distrito madrileño de Hortaleza, en el barrio de Valdefuentes, PROJARDIN MADIBA es una escuela infantil privada. Está orientada al primer ciclo de Educación Infantil, la etapa de 0 a 3 años.\n\nLos datos publicados incluyen servicios como servicio de comedor. También se mencionan orientación pedagógica, campamentos de verano, actividades extraescolares y uniforme.\n\nLa ficha recopila datos de ubicación, contacto y servicios a partir de fuentes públicas. Antes de solicitar plaza conviene confirmar directamente con el centro los horarios, la disponibilidad y las condiciones de admisión.',
  updated_at       = NOW()
WHERE id = 'a044c23a-ea1c-4449-927e-f79001c9bda9';

-- PROJARDIN RETIRO  [caso B · escuela-infantil · privado · servicios: 1]
UPDATE centers SET
  long_description = E'PROJARDIN RETIRO, escuela infantil privada, se encuentra en Madrid, en el barrio de Niño Jesús (distrito de Retiro). Su actividad se centra en el primer ciclo de Educación Infantil, de 0 a 3 años. Según los datos públicos, dispone de servicio de comedor.\n\nAntes de decidir, confirma con el centro horarios, plazas y condiciones de admisión.',
  updated_at       = NOW()
WHERE id = 'a397737d-837d-48f7-b108-92767f0a488e';

-- RAMON Y CAJAL  [caso B · guarderia · privado · servicios: 1]
UPDATE centers SET
  long_description = E'RAMON Y CAJAL es una guardería privada con sede en el distrito madrileño de Hortaleza, en el barrio de Canillas. Está orientada al primer ciclo de Educación Infantil, la etapa de 0 a 3 años. El centro cuenta con servicio de comedor, según la información pública.\n\nPara detalles de horario, plazas y admisión, lo mejor es contactar con el centro.',
  updated_at       = NOW()
WHERE id = '4270b43b-2c05-467b-8ae4-ddad6e685ede';

-- REINA DE LOS ANGELES  [caso B · guarderia · privado · servicios: 1]
UPDATE centers SET
  long_description = E'REINA DE LOS ANGELES es una guardería de titularidad privada que presta servicio en el distrito madrileño de Chamartín, en el barrio de El Viso. Su actividad se centra en el primer ciclo de Educación Infantil, de 0 a 3 años. El centro ofrece, según los datos publicados, servicio de comedor.\n\nAntes de decidir, confirma con el centro horarios, plazas y condiciones de admisión.',
  updated_at       = NOW()
WHERE id = '70834c78-3162-438f-903a-621d4eab155f';

-- RUIZ JIMENEZ  [caso A · escuela-infantil · publico · servicios: 2]
UPDATE centers SET
  long_description = E'RUIZ JIMENEZ es una escuela infantil pública ubicada en Madrid, en el barrio de Guindalera (distrito de Salamanca). Su actividad se centra en el primer ciclo de Educación Infantil, de 0 a 3 años.\n\nEl centro ofrece, según la información pública, servicio de comedor y horario ampliado. El horario ampliado suele ser relevante para las familias que necesitan conciliar durante el curso.\n\nPara obtener información concreta sobre el día a día, el horario y el proceso de admisión, lo mejor es ponerse en contacto directamente con el centro.',
  updated_at       = NOW()
WHERE id = 'f37d3024-9b20-48c2-b43f-f334a3a89f67';

-- SAN ALONSO DE OROZCO  [caso B · escuela-infantil · privado · servicios: 1]
UPDATE centers SET
  long_description = E'Situada en Madrid, en el barrio de Vallehermoso (distrito de Chamberí), SAN ALONSO DE OROZCO es una escuela infantil privada. Está orientada al primer ciclo de Educación Infantil, la etapa de 0 a 3 años. El centro ofrece, según los datos publicados, servicio de comedor.\n\nConviene confirmar horarios, plazas y condiciones directamente con el centro.',
  updated_at       = NOW()
WHERE id = '8490e2e8-37bf-4608-9d00-bbc817eec02b';

-- SAN GABRIEL ARCANGEL  [caso A · escuela-infantil · concertado · servicios: 2]
UPDATE centers SET
  long_description = E'Con presencia en el distrito madrileño de Moncloa-Aravaca, en el barrio de Valdezarza, SAN GABRIEL ARCANGEL funciona como escuela infantil concertada. Trabaja con niños y niñas del primer ciclo de Educación Infantil (0 a 3 años).\n\nEl centro ofrece, según la información pública, servicio de comedor. También se mencionan uniforme.\n\nEsta información procede de fuentes públicas y puede no estar completa. Para conocer horarios actualizados, plazas y cuotas, lo recomendable es contactar con el centro.',
  updated_at       = NOW()
WHERE id = '87e10931-e3a1-44cd-b031-56eee7f154b1';

-- SAN JOSE DE CLUNY  [caso B · guarderia · concertado · servicios: 1]
UPDATE centers SET
  long_description = E'Situada en Madrid, en el barrio de Valdezarza (distrito de Moncloa-Aravaca), SAN JOSE DE CLUNY es una guardería concertada. Está orientada al primer ciclo de Educación Infantil, la etapa de 0 a 3 años. El centro ofrece, según los datos publicados, servicio de comedor.\n\nRecomendamos verificar la disponibilidad y las condiciones con el propio centro.',
  updated_at       = NOW()
WHERE id = 'c755df20-7f87-4611-a806-815f4c8db1d6';

-- SAN PATRICIO  [caso A · escuela-infantil · privado · servicios: 2]
UPDATE centers SET
  long_description = E'SAN PATRICIO es una escuela infantil de titularidad privada que presta servicio en el barrio de El Viso, en el distrito de Chamartín (Madrid). Está orientada al primer ciclo de Educación Infantil, la etapa de 0 a 3 años.\n\nEntre los servicios recogidos en fuentes públicas figuran servicio de comedor y horario ampliado.\n\nEsta información procede de fuentes públicas y puede no estar completa. Para conocer horarios actualizados, plazas y cuotas, lo recomendable es contactar con el centro.',
  updated_at       = NOW()
WHERE id = '6fb1382c-2ed3-47b3-a947-55b962f9dbea';

-- SANTA BERNARDITA  [caso B · guarderia · concertado · servicios: 1]
UPDATE centers SET
  long_description = E'SANTA BERNARDITA, guardería concertada, se encuentra en el barrio de Goya, en el distrito de Salamanca (Madrid). Su actividad se centra en el primer ciclo de Educación Infantil, de 0 a 3 años. Según los datos públicos, dispone de iniciación al inglés.\n\nRecomendamos verificar la disponibilidad y las condiciones con el propio centro.',
  updated_at       = NOW()
WHERE id = 'a46d7d07-158b-4330-9fb5-c6c0c0ecce72';

-- SANTA ROSALIA  [caso B · escuela-infantil · concertado · servicios: 1]
UPDATE centers SET
  long_description = E'SANTA ROSALIA figura como escuela infantil concertada en el distrito madrileño de Hortaleza, en el barrio de Canillas. Trabaja con niños y niñas del primer ciclo de Educación Infantil (0 a 3 años). Según los datos públicos, dispone de servicio de comedor.\n\nConviene confirmar horarios, plazas y condiciones directamente con el centro.',
  updated_at       = NOW()
WHERE id = 'c4123daa-aec8-431f-bb2e-7b43bf106f7f';

-- ST. ALICE'S NURSERY  [caso A · escuela-infantil · privado · servicios: 4]
UPDATE centers SET
  long_description = E'ST. ALICE''S NURSERY, escuela infantil privada, se encuentra en el distrito madrileño de Chamberí, en el barrio de Almagro. Su actividad se centra en el primer ciclo de Educación Infantil, de 0 a 3 años.\n\nLos datos publicados incluyen servicios como horario ampliado, servicio de comedor y un proyecto bilingüe. También se mencionan orientación pedagógica.\n\nPara obtener información concreta sobre el día a día, el horario y el proceso de admisión, lo mejor es ponerse en contacto directamente con el centro.',
  updated_at       = NOW()
WHERE id = 'a41cfb3d-e7d6-4c1b-8122-41295776a71c';

-- ST. ALICE'S NURSERY GALILEO  [caso A · escuela-infantil · privado · servicios: 2]
UPDATE centers SET
  long_description = E'ST. ALICE''S NURSERY GALILEO figura como escuela infantil privada en el barrio de Arapiles, en el distrito de Chamberí (Madrid). Atiende el primer ciclo de Educación Infantil, es decir, la etapa de 0 a 3 años.\n\nLa ficha recoge servicios como un proyecto bilingüe.\n\nLa ficha recopila datos de ubicación, contacto y servicios a partir de fuentes públicas. Antes de solicitar plaza conviene confirmar directamente con el centro los horarios, la disponibilidad y las condiciones de admisión.',
  updated_at       = NOW()
WHERE id = '660e3319-c883-46a8-a2c1-132d8aec4608';

-- TEO  [caso A · escuela-infantil · privado · servicios: 5]
UPDATE centers SET
  long_description = E'Situada en Madrid, en el barrio de Alameda de Osuna (distrito de Chamberí), TEO es una escuela infantil privada. Atiende el primer ciclo de Educación Infantil, es decir, la etapa de 0 a 3 años.\n\nDe acuerdo con las fuentes consultadas, dispone de servicio de comedor con cocina propia y un proyecto bilingüe. A ello se suman campamentos de verano.\n\nPara obtener información concreta sobre el día a día, el horario y el proceso de admisión, lo mejor es ponerse en contacto directamente con el centro.',
  updated_at       = NOW()
WHERE id = '921a11e3-0008-48fd-ab4a-d2b03bc3095d';

-- TEO BRETON  [caso A · escuela-infantil · privado · servicios: 5]
UPDATE centers SET
  long_description = E'TEO BRETON es una escuela infantil privada ubicada en Madrid, en el barrio de Ríos Rosas (distrito de Chamberí). Su actividad se centra en el primer ciclo de Educación Infantil, de 0 a 3 años.\n\nEl centro ofrece, según la información pública, un proyecto bilingüe y servicio de comedor con cocina propia. También se mencionan campamentos de verano.\n\nComo la ficha todavía no ha sido reclamada por el centro, conviene confirmar con el equipo los detalles de funcionamiento, horarios y admisión.',
  updated_at       = NOW()
WHERE id = '91e6b9be-43aa-4c18-9cd5-e9d0f6e817f4';

-- THE LITTLE ONE  [caso B · escuela-infantil · privado · servicios: 3]
UPDATE centers SET
  long_description = E'THE LITTLE ONE es una escuela infantil privada ubicada en Madrid, en el distrito de Chamartín. Trabaja con niños y niñas del primer ciclo de Educación Infantil (0 a 3 años). La información disponible recoge un proyecto bilingüe y patio exterior.\n\nConviene confirmar horarios, plazas y condiciones directamente con el centro.',
  updated_at       = NOW()
WHERE id = '13eee06b-766c-4784-9e66-4262c55f73a5';

-- TIERRA LALA  [caso B · escuela-infantil · privado · servicios: 3]
UPDATE centers SET
  long_description = E'TIERRA LALA es una escuela infantil privada situada en el distrito de Hortaleza, en Madrid. Atiende el primer ciclo de Educación Infantil, es decir, la etapa de 0 a 3 años. El centro cuenta con música, patio exterior y iniciación al inglés, según la información pública.\n\nAntes de decidir, confirma con el centro horarios, plazas y condiciones de admisión.',
  updated_at       = NOW()
WHERE id = '687b16a9-8e89-476b-a840-ebb7b773907d';

-- TODO NIÑOS NURSERY  [caso A · guarderia · privado · servicios: 3]
UPDATE centers SET
  long_description = E'TODO NIÑOS NURSERY figura como guardería privada en el barrio de Aravaca, en el distrito de Moncloa-Aravaca (Madrid). Su actividad se centra en el primer ciclo de Educación Infantil, de 0 a 3 años.\n\nDe acuerdo con las fuentes consultadas, dispone de un proyecto bilingüe y horario ampliado. El horario ampliado suele ser relevante para las familias que necesitan conciliar durante el curso.\n\nEsta información procede de fuentes públicas y puede no estar completa. Para conocer horarios actualizados, plazas y cuotas, lo recomendable es contactar con el centro.',
  updated_at       = NOW()
WHERE id = '3599376e-d55d-4c74-a10c-77a198a71bfe';

-- TRAZOS  [caso A · escuela-infantil · privado · servicios: 9]
UPDATE centers SET
  long_description = E'TRAZOS, escuela infantil privada, se encuentra en el distrito madrileño de Salamanca, en el barrio de Fuente del Berro. Trabaja con niños y niñas del primer ciclo de Educación Infantil (0 a 3 años).\n\nEl centro ofrece, según la información pública, un proyecto bilingüe, patio exterior, horario ampliado y servicio de comedor con cocina propia. También se mencionan orientación pedagógica, actividades extraescolares y campamentos de verano. La presencia del inglés puede interesar a quienes buscan un contacto temprano con el idioma.\n\nComo la ficha todavía no ha sido reclamada por el centro, conviene confirmar con el equipo los detalles de funcionamiento, horarios y admisión.',
  updated_at       = NOW()
WHERE id = '130327c1-c4b0-49a3-a27c-d9a18d9b64c9';

-- TRILEMA SAFA  [caso A · escuela-infantil · concertado · servicios: 2]
UPDATE centers SET
  long_description = E'TRILEMA SAFA es una escuela infantil de titularidad concertada que presta servicio en el distrito madrileño de Salamanca, en el barrio de Fuente del Berro. Está orientada al primer ciclo de Educación Infantil, la etapa de 0 a 3 años.\n\nSegún la información disponible, el centro cuenta con horario ampliado y servicio de comedor. El horario ampliado suele ser relevante para las familias que necesitan conciliar durante el curso.\n\nLos datos que se muestran se han recopilado de fuentes públicas; conviene verificar con el propio centro la disponibilidad de plaza, el calendario y las tarifas antes de decidir.',
  updated_at       = NOW()
WHERE id = 'eb4dff3e-5eea-41b0-818a-cd78e59f419b';

-- ULU  [caso B · escuela-infantil · privado · servicios: 6]
UPDATE centers SET
  long_description = E'Con presencia en Madrid, en el distrito de Retiro, ULU funciona como escuela infantil privada. Está orientada al primer ciclo de Educación Infantil, la etapa de 0 a 3 años. El centro ofrece, según los datos publicados, campamentos de verano, psicomotricidad, horario ampliado, actividades extraescolares, música y escuela de familias.\n\nAntes de decidir, confirma con el centro horarios, plazas y condiciones de admisión.',
  updated_at       = NOW()
WHERE id = 'b9448c81-342f-48b3-8c8e-9662b232fd16';

-- UP! KIDS SCHOOL  [caso A · escuela-infantil · privado · servicios: 7]
UPDATE centers SET
  long_description = E'UP! KIDS SCHOOL figura como escuela infantil privada en Madrid, en el distrito de Hortaleza. Trabaja con niños y niñas del primer ciclo de Educación Infantil (0 a 3 años).\n\nLa ficha recoge servicios como un proyecto bilingüe, servicio de comedor y horario ampliado. Además, la ficha recoge psicomotricidad, actividades extraescolares y música.\n\nAntes de matricular, es aconsejable contrastar con el centro los servicios vigentes, el horario y las condiciones de cada curso.',
  updated_at       = NOW()
WHERE id = 'efa9caae-d780-4ec5-8fe1-cfd2bee68b97';

-- VALLEHERMOSO  [caso A · escuela-infantil · publico · servicios: 2]
UPDATE centers SET
  long_description = E'VALLEHERMOSO es una escuela infantil pública situada en el distrito madrileño de Chamberí, en el barrio de Arapiles. Trabaja con niños y niñas del primer ciclo de Educación Infantil (0 a 3 años).\n\nSegún la información disponible, el centro cuenta con horario ampliado y servicio de comedor.\n\nLa ficha recopila datos de ubicación, contacto y servicios a partir de fuentes públicas. Antes de solicitar plaza conviene confirmar directamente con el centro los horarios, la disponibilidad y las condiciones de admisión.',
  updated_at       = NOW()
WHERE id = '781601b2-aecb-4e1e-b456-9f862f02961c';

-- VERBO ENCARNADO  [caso A · escuela-infantil · concertado · servicios: 4]
UPDATE centers SET
  long_description = E'VERBO ENCARNADO es una escuela infantil concertada ubicada en el distrito madrileño de Chamberí, en el barrio de Ríos Rosas. Su oferta abarca el primer ciclo de Educación Infantil y se extiende hasta el segundo ciclo, de 0 a 6 años.\n\nSegún la información disponible, el centro cuenta con horario ampliado y servicio de comedor con cocina propia. Además, la ficha recoge campamentos de verano.\n\nLos datos que se muestran se han recopilado de fuentes públicas; conviene verificar con el propio centro la disponibilidad de plaza, el calendario y las tarifas antes de decidir.',
  updated_at       = NOW()
WHERE id = '843c6622-c091-4b26-b069-b0764200ecb5';

-- VIB VALDEBEBAS  [caso A · escuela-infantil · privado · servicios: 5]
UPDATE centers SET
  long_description = E'VIB VALDEBEBAS es una escuela infantil de titularidad privada que presta servicio en el distrito de Hortaleza, en Madrid. Está orientada al primer ciclo de Educación Infantil, la etapa de 0 a 3 años.\n\nEntre los servicios recogidos en fuentes públicas figuran horario ampliado y cocina propia. A ello se suman música, actividades extraescolares y psicomotricidad.\n\nLos datos que se muestran se han recopilado de fuentes públicas; conviene verificar con el propio centro la disponibilidad de plaza, el calendario y las tarifas antes de decidir.',
  updated_at       = NOW()
WHERE id = '440bd2c0-b776-4e7a-ab44-1cff0d29439d';

-- VIRGEN MILAGROSA  [caso B · escuela-infantil · concertado · servicios: 1]
UPDATE centers SET
  long_description = E'VIRGEN MILAGROSA es una escuela infantil concertada ubicada en el barrio de Pinar del Rey, en el distrito de Hortaleza (Madrid). Atiende el primer ciclo de Educación Infantil, es decir, la etapa de 0 a 3 años. El centro ofrece, según los datos publicados, servicio de comedor.\n\nRecomendamos verificar la disponibilidad y las condiciones con el propio centro.',
  updated_at       = NOW()
WHERE id = '4a5f6617-8356-46e8-86ee-9653d81b4775';

-- YAKI  [caso A · escuela-infantil · privado · servicios: 3]
UPDATE centers SET
  long_description = E'YAKI es una escuela infantil privada ubicada en el barrio de Hispanoamérica, en el distrito de Chamartín (Madrid). Trabaja con niños y niñas del primer ciclo de Educación Infantil (0 a 3 años).\n\nDe acuerdo con las fuentes consultadas, dispone de horario ampliado y patio exterior. A ello se suman psicomotricidad. El horario ampliado suele ser relevante para las familias que necesitan conciliar durante el curso.\n\nLa ficha recopila datos de ubicación, contacto y servicios a partir de fuentes públicas. Antes de solicitar plaza conviene confirmar directamente con el centro los horarios, la disponibilidad y las condiciones de admisión.',
  updated_at       = NOW()
WHERE id = '0046c9df-fdbe-41cd-9719-5ed609a69533';

COMMIT;

-- 141 centros actualizados.