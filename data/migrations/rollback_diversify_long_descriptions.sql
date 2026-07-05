-- ROLLBACK 015_diversify_long_descriptions.sql

BEGIN;

UPDATE centers SET long_description = 'ESCUELA MONTESSORI MADRID es una guardería privada ubicada en el distrito madrileño de Moncloa-Aravaca. Está orientada al primer ciclo de Educación Infantil, la etapa de 0 a 3 años.

El centro ofrece, según la información pública, campamentos de verano. Trabaja con metodología Montessori.

Para detalles sobre el día a día, el horario y el proceso de admisión, lo mejor es ponerse en contacto directamente con el centro.', updated_at = NOW() WHERE id = 'c71ac4d7-6f24-447e-a355-5a5153139676';
UPDATE centers SET long_description = 'ALLEGRA es una escuela infantil de titularidad privada que presta servicio en el barrio de Aravaca, en el distrito de Moncloa-Aravaca (Madrid). Atiende el primer ciclo de Educación Infantil, es decir, la etapa de 0 a 3 años.

Según la información disponible, el centro cuenta con servicio de comedor con cocina propia y patio exterior.

Esta información procede de fuentes públicas y puede no estar completa. Para conocer horarios actualizados, plazas y cuotas, lo recomendable es contactar con el centro.', updated_at = NOW() WHERE id = 'd072830a-ceeb-4d14-8a77-3bca3b5618d4';
UPDATE centers SET long_description = 'PEQUEÑECOS PARQUE NORTE es una escuela infantil privada situada en el barrio de Costillares, en el distrito de Hortaleza (Madrid). Atiende el primer ciclo de Educación Infantil, es decir, la etapa de 0 a 3 años.

Entre los servicios recogidos en fuentes públicas figuran iniciación al inglés. También se mencionan actividades extraescolares y música.

La ficha recopila datos de ubicación, contacto y servicios a partir de fuentes públicas. Antes de solicitar plaza conviene confirmar directamente con el centro los horarios, la disponibilidad y las condiciones de admisión.', updated_at = NOW() WHERE id = 'd45d9ea8-6532-4244-938f-49d639038bb9';
UPDATE centers SET long_description = 'PRESCHOOL FEM es una guardería privada con sede en Madrid, en el barrio de Vallehermoso (distrito de Chamberí). Su actividad se centra en el primer ciclo de Educación Infantil, de 0 a 3 años.

Según la información disponible, el centro cuenta con servicio de comedor con cocina propia.

Esta información procede de fuentes públicas y puede no estar completa. Para conocer horarios actualizados, plazas y cuotas, lo recomendable es contactar con el centro.', updated_at = NOW() WHERE id = '01030122-05cd-49f9-98e0-dbef90390cc9';
UPDATE centers SET long_description = 'COLEGIO MADRID FSM-SOTILLO es una guardería privada con sede en Madrid, en el distrito de Hortaleza. Su actividad se centra en el primer ciclo de Educación Infantil, de 0 a 3 años.

Según la información disponible, el centro cuenta con patio exterior.

Esta información procede de fuentes públicas y puede no estar completa. Para conocer horarios actualizados, plazas y cuotas, lo recomendable es contactar con el centro.', updated_at = NOW() WHERE id = 'd2803c85-fcae-4862-b1b9-5e2617575e24';
UPDATE centers SET long_description = 'ANA DE AUSTRIA es una escuela infantil pública ubicada en el distrito madrileño de Hortaleza, en el barrio de Valdefuentes. Está orientada al primer ciclo de Educación Infantil, la etapa de 0 a 3 años.

Según la información disponible, el centro cuenta con comedor con servicio de catering.

Esta información procede de fuentes públicas y puede no estar completa. Para conocer horarios actualizados, plazas y cuotas, lo recomendable es contactar con el centro.', updated_at = NOW() WHERE id = '91926c07-f673-4623-911e-f4009fee5c9d';
UPDATE centers SET long_description = 'CASA NIDO es una escuela infantil privada ubicada en el distrito madrileño de Arganzuela. Está orientada al primer ciclo de Educación Infantil, la etapa de 0 a 3 años.

El centro ofrece, según la información pública, un proyecto bilingüe. Trabaja con metodología Montessori.

Para detalles sobre el día a día, el horario y el proceso de admisión, lo mejor es ponerse en contacto directamente con el centro.', updated_at = NOW() WHERE id = '0d88e41b-fdb8-4d20-8cb5-f75f3efe609b';
UPDATE centers SET long_description = 'DONDE ESTAN LAS LLAVES, escuela infantil privada, se encuentra en el distrito madrileño de Arganzuela, en el barrio de Delicias. Está orientada al primer ciclo de Educación Infantil, la etapa de 0 a 3 años.

Entre los servicios recogidos en fuentes públicas figuran servicio de comedor y un proyecto bilingüe.

La ficha recopila datos de ubicación, contacto y servicios a partir de fuentes públicas. Antes de solicitar plaza conviene confirmar directamente con el centro los horarios, la disponibilidad y las condiciones de admisión.', updated_at = NOW() WHERE id = 'bed55563-8a3f-4e45-96b6-20159ceecfb8';
UPDATE centers SET long_description = 'EL PARQUE DE LA PIOVERA es una escuela infantil privada situada en el barrio de Palomas, en el distrito de Hortaleza (Madrid). Atiende el primer ciclo de Educación Infantil, es decir, la etapa de 0 a 3 años.

Entre los servicios recogidos en fuentes públicas figuran un proyecto bilingüe. También se mencionan música.

La ficha recopila datos de ubicación, contacto y servicios a partir de fuentes públicas. Antes de solicitar plaza conviene confirmar directamente con el centro los horarios, la disponibilidad y las condiciones de admisión.', updated_at = NOW() WHERE id = '7f6b35ae-f63e-452a-8592-84a69e731e61';
UPDATE centers SET long_description = 'JARDIIMAR es una escuela infantil privada ubicada en el distrito madrileño de Arganzuela. Está orientada al primer ciclo de Educación Infantil, la etapa de 0 a 3 años.

Según la información disponible, el centro cuenta con patio exterior, servicio de comedor y horario ampliado.

Esta información procede de fuentes públicas y puede no estar completa. Para conocer horarios actualizados, plazas y cuotas, lo recomendable es contactar con el centro.', updated_at = NOW() WHERE id = 'bc6d4257-32f4-4138-804d-0205ec100804';
UPDATE centers SET long_description = 'LITTLE FEM es una escuela infantil de titularidad privada que presta servicio en el barrio de Vallehermoso, en el distrito de Chamberí (Madrid). Atiende el primer ciclo de Educación Infantil, es decir, la etapa de 0 a 3 años.

Según la información disponible, el centro cuenta con servicio de comedor con cocina propia.

Esta información procede de fuentes públicas y puede no estar completa. Para conocer horarios actualizados, plazas y cuotas, lo recomendable es contactar con el centro.', updated_at = NOW() WHERE id = '5415af25-14fb-4d27-8988-8d8d3ab31574';
UPDATE centers SET long_description = 'MI PRIMER COLE 4 es una escuela infantil privada situada en el barrio de Piovera, en el distrito de Hortaleza (Madrid). Atiende el primer ciclo de Educación Infantil, es decir, la etapa de 0 a 3 años.

Entre los servicios recogidos en fuentes públicas figuran patio exterior, servicio de comedor y iniciación al inglés. También se mencionan actividades extraescolares, psicomotricidad y campamentos de verano.

La ficha recopila datos de ubicación, contacto y servicios a partir de fuentes públicas. Antes de solicitar plaza conviene confirmar directamente con el centro los horarios, la disponibilidad y las condiciones de admisión.', updated_at = NOW() WHERE id = '9714633c-2f9c-4d3e-80c6-7515cda502c4';
UPDATE centers SET long_description = 'ROSA es una escuela infantil de titularidad pública que presta servicio en el barrio de Valverde, en el distrito de Chamartín (Madrid). Atiende el primer ciclo de Educación Infantil, es decir, la etapa de 0 a 3 años.

El centro ofrece, según la información pública, servicio de comedor y horario ampliado.

Para detalles sobre el día a día, el horario y el proceso de admisión, lo mejor es ponerse en contacto directamente con el centro.', updated_at = NOW() WHERE id = 'ebf1b842-9366-43ea-a76f-108f9b14b459';
UPDATE centers SET long_description = 'BOREAL DREAMING TOGETHER es una guardería privada ubicada en el distrito madrileño de Hortaleza. Está orientada al primer ciclo de Educación Infantil, la etapa de 0 a 3 años.

El centro ofrece, según la información pública, un proyecto bilingüe. Trabaja con la metodología Montessori.

Para detalles sobre el día a día, el horario y el proceso de admisión, lo mejor es ponerse en contacto directamente con el centro.', updated_at = NOW() WHERE id = 'eb0f284a-a6d6-4d31-b80f-711c85e83be7';
UPDATE centers SET long_description = 'ROCIO DURCAL es una escuela infantil pública ubicada en el distrito madrileño de Hortaleza, en el barrio de Valdefuentes. Está orientada al primer ciclo de Educación Infantil, la etapa de 0 a 3 años.

Según la información disponible, el centro cuenta con servicio de comedor y horario ampliado.

Esta información procede de fuentes públicas y puede no estar completa. Para conocer horarios actualizados, plazas y cuotas, lo recomendable es contactar con el centro.', updated_at = NOW() WHERE id = '08591fa0-d00b-4b14-a313-3582865e5084';
UPDATE centers SET long_description = 'MARGARITA SALAS es una escuela infantil de titularidad pública que presta servicio en el barrio de Pacífico, en el distrito de Retiro (Madrid). Atiende el primer ciclo de Educación Infantil, es decir, la etapa de 0 a 3 años.

El centro ofrece, según la información pública, horario ampliado.

Para detalles sobre el día a día, el horario y el proceso de admisión, lo mejor es ponerse en contacto directamente con el centro.', updated_at = NOW() WHERE id = 'aadff91f-1f7f-4e8b-a2bb-ecbcfde37187';
UPDATE centers SET long_description = 'MOWGLI, escuela infantil pública, se encuentra en el distrito madrileño de Arganzuela. Está orientada al primer ciclo de Educación Infantil, la etapa de 0 a 3 años.

Entre los servicios recogidos en fuentes públicas figuran servicio de comedor y horario ampliado.

La ficha recopila datos de ubicación, contacto y servicios a partir de fuentes públicas. Antes de solicitar plaza conviene confirmar directamente con el centro los horarios, la disponibilidad y las condiciones de admisión.', updated_at = NOW() WHERE id = '76eb8258-ce5f-463d-ab50-a71a3a610717';
UPDATE centers SET long_description = 'LUIS BELLO es una escuela infantil de titularidad pública que presta servicio en el barrio de Prosperidad, en el distrito de Chamartín (Madrid). Atiende el primer ciclo de Educación Infantil, es decir, la etapa de 0 a 3 años.

El centro ofrece, según la información pública, horario ampliado y servicio de comedor.

Para detalles sobre el día a día, el horario y el proceso de admisión, lo mejor es ponerse en contacto directamente con el centro.', updated_at = NOW() WHERE id = 'a5f0a48a-102f-45ee-9170-36d984385b43';

COMMIT;