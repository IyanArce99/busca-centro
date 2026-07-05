-- 015_diversify_long_descriptions.sql
-- Reescribe long_description en centros cuyas descripciones eran casi
-- duplicadas (>55% de solapamiento). Se reestructura el texto variando orden y
-- redaccion, manteniendo los mismos hechos. Sin inventar datos.
-- Generado: 2026-07-05. Revisar antes de ejecutar.

BEGIN;

-- ESCUELA MONTESSORI MADRID
UPDATE centers SET long_description = 'ESCUELA MONTESSORI MADRID es una guardería privada del distrito de Moncloa-Aravaca, orientada a niños y niñas de 4 meses a 3 años dentro del primer ciclo de Educación Infantil.

Entre los servicios que constan en su ficha se encuentran campamentos de verano.

Al tratarse de un centro privado, la admisión, las cuotas y el horario se acuerdan directamente con la dirección. Recomendamos verificar los datos actualizados directamente con la dirección del centro.', updated_at = NOW() WHERE id = 'c71ac4d7-6f24-447e-a355-5a5153139676';
-- ALLEGRA
UPDATE centers SET long_description = 'ALLEGRA, escuela infantil privada ubicada en Aravaca, en el distrito de Moncloa-Aravaca, trabaja con el primer ciclo de Educación Infantil, dirigido a la etapa de 4 meses a 3 años.

undefined

Al tratarse de un centro privado, la admisión, las cuotas y el horario se acuerdan directamente con la dirección. Los datos proceden de fuentes públicas y conviene confirmarlos con el propio centro.', updated_at = NOW() WHERE id = 'd072830a-ceeb-4d14-8a77-3bca3b5618d4';
-- PEQUEÑECOS PARQUE NORTE
UPDATE centers SET long_description = 'PEQUEÑECOS PARQUE NORTE, escuela infantil privada ubicada en Costillares, en el distrito de Hortaleza, trabaja con el primer ciclo de Educación Infantil, dirigido a la etapa de 4 meses a 3 años.

Según la información disponible, ofrece iniciación al inglés, música y actividades extraescolares.

Al tratarse de un centro privado, la admisión, las cuotas y el horario se acuerdan directamente con la dirección. Recomendamos verificar los datos actualizados directamente con la dirección del centro.', updated_at = NOW() WHERE id = 'd45d9ea8-6532-4244-938f-49d639038bb9';
-- PRESCHOOL FEM
UPDATE centers SET long_description = 'Situada en Vallehermoso, en el distrito de Chamberí, PRESCHOOL FEM es una guardería privada dedicada al primer ciclo de Educación Infantil, la etapa que va de 4 meses a 3 años.

Entre los servicios que constan en su ficha se encuentran comedor y cocina propia.

Antes de decidir, recomendamos confirmar horarios, plazas y condiciones con el centro. Al tratarse de un centro privado, la admisión, las cuotas y el horario se acuerdan directamente con la dirección.', updated_at = NOW() WHERE id = '01030122-05cd-49f9-98e0-dbef90390cc9';
-- COLEGIO MADRID FSM-SOTILLO
UPDATE centers SET long_description = 'COLEGIO MADRID FSM-SOTILLO es una guardería privada del distrito de Hortaleza, orientada a niños y niñas de 4 meses a 3 años dentro del primer ciclo de Educación Infantil.

Entre los servicios que constan en su ficha se encuentran patio exterior.

Al tratarse de un centro privado, la admisión, las cuotas y el horario se acuerdan directamente con la dirección. Los datos proceden de fuentes públicas y conviene confirmarlos con el propio centro.', updated_at = NOW() WHERE id = 'd2803c85-fcae-4862-b1b9-5e2617575e24';
-- ANA DE AUSTRIA
UPDATE centers SET long_description = 'ANA DE AUSTRIA es una escuela infantil pública del barrio de Valdefuentes, orientada a niños y niñas de 4 meses a 3 años dentro del primer ciclo de Educación Infantil.

undefined

undefined', updated_at = NOW() WHERE id = '91926c07-f673-4623-911e-f4009fee5c9d';
-- CASA NIDO
UPDATE centers SET long_description = 'CASA NIDO, escuela infantil privada ubicada en Arganzuela, trabaja con el primer ciclo de Educación Infantil, dirigido a la etapa de 4 meses a 3 años.

Cuenta, según los datos registrados, con proyecto bilingüe y iniciación al inglés.

Al tratarse de un centro privado, la admisión, las cuotas y el horario se acuerdan directamente con la dirección. Recomendamos verificar los datos actualizados directamente con la dirección del centro.', updated_at = NOW() WHERE id = '0d88e41b-fdb8-4d20-8cb5-f75f3efe609b';
-- DONDE ESTAN LAS LLAVES
UPDATE centers SET long_description = 'Situada en Delicias, en el distrito de Arganzuela, DONDE ESTAN LAS LLAVES es una escuela infantil privada dedicada al primer ciclo de Educación Infantil, la etapa que va de 4 meses a 3 años.

undefined

undefined', updated_at = NOW() WHERE id = 'bed55563-8a3f-4e45-96b6-20159ceecfb8';
-- EL PARQUE DE LA PIOVERA
UPDATE centers SET long_description = 'EL PARQUE DE LA PIOVERA es una escuela infantil privada del barrio de Palomas, orientada a niños y niñas de 4 meses a 3 años dentro del primer ciclo de Educación Infantil.

Entre los servicios que constan en su ficha se encuentran proyecto bilingüe, iniciación al inglés y música.

undefined', updated_at = NOW() WHERE id = '7f6b35ae-f63e-452a-8592-84a69e731e61';
-- JARDIIMAR
UPDATE centers SET long_description = 'En Arganzuela, JARDIIMAR atiende el primer ciclo de Educación Infantil (de 4 meses a 3 años) como escuela infantil privada.

Entre los servicios que constan en su ficha se encuentran comedor, horario ampliado y patio exterior.

Al tratarse de un centro privado, la admisión, las cuotas y el horario se acuerdan directamente con la dirección. Los datos proceden de fuentes públicas y conviene confirmarlos con el propio centro.', updated_at = NOW() WHERE id = 'bc6d4257-32f4-4138-804d-0205ec100804';
-- LITTLE FEM
UPDATE centers SET long_description = 'LITTLE FEM, escuela infantil privada ubicada en Vallehermoso, en el distrito de Chamberí, trabaja con el primer ciclo de Educación Infantil, dirigido a la etapa de 4 meses a 3 años.

Según la información disponible, ofrece comedor y cocina propia.

Antes de decidir, recomendamos confirmar horarios, plazas y condiciones con el centro. Al tratarse de un centro privado, la admisión, las cuotas y el horario se acuerdan directamente con la dirección.', updated_at = NOW() WHERE id = '5415af25-14fb-4d27-8988-8d8d3ab31574';
-- MI PRIMER COLE 4
UPDATE centers SET long_description = 'En Piovera, en el distrito de Hortaleza, MI PRIMER COLE 4 atiende el primer ciclo de Educación Infantil (de 4 meses a 3 años) como escuela infantil privada.

Según la información disponible, ofrece comedor, iniciación al inglés, patio exterior y psicomotricidad.

Al tratarse de un centro privado, la admisión, las cuotas y el horario se acuerdan directamente con la dirección. Los datos proceden de fuentes públicas y conviene confirmarlos con el propio centro.', updated_at = NOW() WHERE id = '9714633c-2f9c-4d3e-80c6-7515cda502c4';
-- ROSA
UPDATE centers SET long_description = 'En Valverde, en el distrito de Chamartín, ROSA atiende el primer ciclo de Educación Infantil (de 4 meses a 3 años) como escuela infantil pública.

undefined

undefined', updated_at = NOW() WHERE id = 'ebf1b842-9366-43ea-a76f-108f9b14b459';
-- BOREAL DREAMING TOGETHER
UPDATE centers SET long_description = 'Situada en Hortaleza, BOREAL DREAMING TOGETHER es una guardería privada dedicada al primer ciclo de Educación Infantil, la etapa que va de 4 meses a 3 años.

Su ficha recoge servicios como proyecto bilingüe y iniciación al inglés.

Al tratarse de un centro privado, la admisión, las cuotas y el horario se acuerdan directamente con la dirección. Recomendamos verificar los datos actualizados directamente con la dirección del centro.', updated_at = NOW() WHERE id = 'eb0f284a-a6d6-4d31-b80f-711c85e83be7';
-- ROCIO DURCAL
UPDATE centers SET long_description = 'ROCIO DURCAL, escuela infantil pública ubicada en Valdefuentes, en el distrito de Hortaleza, trabaja con el primer ciclo de Educación Infantil, dirigido a la etapa de 4 meses a 3 años.

Entre los servicios que constan en su ficha se encuentran comedor y horario ampliado.

Como centro público de primer ciclo, la admisión de plazas suele gestionarse mediante el proceso oficial de escolarización de la Comunidad de Madrid. Los datos proceden de fuentes públicas y conviene confirmarlos con el propio centro.', updated_at = NOW() WHERE id = '08591fa0-d00b-4b14-a313-3582865e5084';
-- MARGARITA SALAS
UPDATE centers SET long_description = 'MARGARITA SALAS, escuela infantil pública ubicada en Pacifico, en el distrito de Retiro, trabaja con el primer ciclo de Educación Infantil, dirigido a la etapa de 4 meses a 3 años.

Entre los servicios que constan en su ficha se encuentran horario ampliado.

undefined', updated_at = NOW() WHERE id = 'aadff91f-1f7f-4e8b-a2bb-ecbcfde37187';
-- MOWGLI
UPDATE centers SET long_description = 'En Arganzuela, MOWGLI atiende el primer ciclo de Educación Infantil (de 4 meses a 3 años) como escuela infantil pública.

Entre los servicios que constan en su ficha se encuentran comedor y horario ampliado.

undefined', updated_at = NOW() WHERE id = '76eb8258-ce5f-463d-ab50-a71a3a610717';
-- LUIS BELLO
UPDATE centers SET long_description = 'LUIS BELLO es una escuela infantil pública del barrio de Prosperidad, orientada a niños y niñas de 4 meses a 3 años dentro del primer ciclo de Educación Infantil.

Entre los servicios que constan en su ficha se encuentran comedor y horario ampliado.

undefined', updated_at = NOW() WHERE id = 'a5f0a48a-102f-45ee-9170-36d984385b43';

COMMIT;

-- 18 long_descriptions diversificadas. Similitud maxima final (global): 54%.