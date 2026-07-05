-- 014_diversify_short_descriptions.sql
-- Reescribe short_description en centros que compartian texto de plantilla
-- identico (meta descriptions duplicadas). Cada texto pasa a ser unico usando
-- datos propios del centro (nombre, ubicacion, edad, servicios reales). Sin
-- inventar datos. Generado: 2026-07-05. Revisar antes de ejecutar.

BEGIN;

-- ANDAL
UPDATE centers SET short_description = 'ANDAL es una escuela infantil privada en el barrio de Niño Jesus (Retiro), orientada al primer ciclo de Educación Infantil (de 4 meses a 3 años). Entre sus servicios registrados figuran comedor y horario ampliado.', updated_at = NOW() WHERE id = '921d8b54-2244-4de8-8c10-bf69806b183b';
-- COCORICO
UPDATE centers SET short_description = 'COCORICO, escuela infantil privada en el barrio de Prosperidad (Chamartín), atiende el primer ciclo de Educación Infantil (de 4 meses a 3 años) y cuenta con comedor, inglés y música según los datos disponibles.', updated_at = NOW() WHERE id = 'a38e2b2e-c080-4906-9b86-90ed0f79b07c';
-- ALARIA ARAVACA NURSERY SCHOOL
UPDATE centers SET short_description = 'ALARIA ARAVACA NURSERY SCHOOL, guardería privada en el barrio de Aravaca (Moncloa-Aravaca), atiende el primer ciclo de Educación Infantil (de 4 meses a 3 años) y cuenta con comedor, cocina propia y horario ampliado según los datos disponibles.', updated_at = NOW() WHERE id = '969bf22e-0d0f-4a3d-b0af-e0b48906ad20';
-- PEDAGOGIA WALDORF DE ARAVACA
UPDATE centers SET short_description = 'PEDAGOGIA WALDORF DE ARAVACA es una escuela infantil privada en el barrio de Aravaca (Moncloa-Aravaca), orientada al primer ciclo de Educación Infantil (de 4 meses a 3 años). Entre sus servicios registrados figuran campamentos de verano.', updated_at = NOW() WHERE id = '7cce9d1a-4a72-456c-9019-4f2157443aa3';
-- ALARIA SERRANO NURSEY SCHOOL
UPDATE centers SET short_description = 'ALARIA SERRANO NURSEY SCHOOL es una escuela infantil privada en el distrito de Chamartín, orientada al primer ciclo de Educación Infantil (de 4 meses a 3 años). Entre sus servicios registrados figuran comedor, cocina propia y horario ampliado.', updated_at = NOW() WHERE id = '91d2d752-5f82-4c64-8379-6a716aedc868';
-- PIPPO
UPDATE centers SET short_description = 'PIPPO es una escuela infantil privada en el barrio de Prosperidad (Chamartín), orientada al primer ciclo de Educación Infantil (de 4 meses a 3 años). Entre sus servicios registrados figuran cocina propia, horario ampliado y inglés.', updated_at = NOW() WHERE id = '72062e3f-8483-4aae-9be8-c69e7e58c6ba';
-- ALICIA
UPDATE centers SET short_description = 'ALICIA, escuela infantil privada en el barrio de Arguelles (Moncloa-Aravaca), atiende el primer ciclo de Educación Infantil (de 4 meses a 3 años) y cuenta con horario ampliado, comedor y actividades extraescolares según los datos disponibles.', updated_at = NOW() WHERE id = '1dab63de-d43d-41bc-9a5d-7257639bb8e5';
-- ALICIA II
UPDATE centers SET short_description = 'En el barrio de Arguelles (Moncloa-Aravaca), ALICIA II es una escuela infantil privada para niños y niñas de 4 meses a 3 años. Su ficha recoge servicios como horario ampliado, comedor y actividades extraescolares.', updated_at = NOW() WHERE id = 'ebde4f53-c43e-46ab-9e18-004bd974d395';
-- MAMA QUECA II
UPDATE centers SET short_description = 'MAMA QUECA II es una escuela infantil privada en el barrio de Pinar Del Rey (Hortaleza), orientada al primer ciclo de Educación Infantil (de 4 meses a 3 años). Entre sus servicios registrados figuran comedor, catering y inglés.', updated_at = NOW() WHERE id = '3746a619-9c08-433e-bf15-51a32d8db0ae';
-- ALLEGRA
UPDATE centers SET short_description = 'ALLEGRA es una escuela infantil privada de primer ciclo (de 4 meses a 3 años) situada en el barrio de Aravaca (Moncloa-Aravaca), con comedor, cocina propia y patio exterior entre sus servicios registrados.', updated_at = NOW() WHERE id = 'd072830a-ceeb-4d14-8a77-3bca3b5618d4';
-- ANDAL II
UPDATE centers SET short_description = 'ANDAL II es una escuela infantil privada en el barrio de Niño Jesus (Retiro), orientada al primer ciclo de Educación Infantil (de 4 meses a 3 años). Entre sus servicios registrados figuran comedor y horario ampliado.', updated_at = NOW() WHERE id = 'b9cb3561-1f71-4873-b2f2-e1d35a0e79e2';
-- PEQUEMUN
UPDATE centers SET short_description = 'PEQUEMUN, escuela infantil privada en el barrio de Vallehermoso (Chamberí), atiende el primer ciclo de Educación Infantil (de 4 meses a 3 años) y cuenta con comedor, catering y inglés según los datos disponibles.', updated_at = NOW() WHERE id = 'ebc0572d-c29e-488a-8ea4-9a11d810a48b';
-- B.R.A. INSTITUCION ORGAZ
UPDATE centers SET short_description = 'B.R.A. INSTITUCION ORGAZ es una escuela infantil privada de primer ciclo (de 4 meses a 3 años) situada en el barrio de Piovera (Hortaleza), con comedor, inglés y música entre sus servicios registrados.', updated_at = NOW() WHERE id = '4c1cb5b6-8a04-47ef-a64e-cbf99fd11d23';
-- PEQUEÑECOS PARQUE NORTE
UPDATE centers SET short_description = 'PEQUEÑECOS PARQUE NORTE es una escuela infantil privada de primer ciclo (de 4 meses a 3 años) situada en el barrio de Costillares (Hortaleza), con inglés, música y actividades extraescolares entre sus servicios registrados.', updated_at = NOW() WHERE id = 'd45d9ea8-6532-4244-938f-49d639038bb9';
-- CARANA VALDEMARIN
UPDATE centers SET short_description = 'CARANA VALDEMARIN es una escuela infantil privada en el barrio de Valdemarin (Moncloa-Aravaca), orientada al primer ciclo de Educación Infantil (de 4 meses a 3 años). Entre sus servicios registrados figuran inglés, psicomotricidad y música.', updated_at = NOW() WHERE id = 'c442d882-1877-49d4-8ac2-3d2ec1039740';
-- CARRUSEL
UPDATE centers SET short_description = 'CARRUSEL es una escuela infantil privada en el barrio de Prosperidad (Chamartín), orientada al primer ciclo de Educación Infantil (de 4 meses a 3 años). Entre sus servicios registrados figuran comedor, cocina propia y inglés.', updated_at = NOW() WHERE id = '45848e76-0aee-4e37-b6d7-5d27adb12633';
-- BUEN CONSEJO
UPDATE centers SET short_description = 'BUEN CONSEJO es una escuela infantil privada de primer ciclo (de 4 meses a 3 años) situada en el barrio de Aravaca (Moncloa-Aravaca), con comedor entre sus servicios registrados.', updated_at = NOW() WHERE id = '4c97ca77-36c7-4a3d-b8d2-8ffa01938c97';
-- CASA DEL NIÑO
UPDATE centers SET short_description = 'CASA DEL NIÑO es una escuela infantil privada de primer ciclo (de 4 meses a 3 años) situada en el barrio de Nueva España (Chamartín), con comedor, cocina propia y proyecto bilingüe entre sus servicios registrados.', updated_at = NOW() WHERE id = 'ad9568f5-bba5-4d47-a083-847cd19d397b';
-- CASITA MARAVILLAS
UPDATE centers SET short_description = 'CASITA MARAVILLAS es una escuela infantil privada de primer ciclo (de 4 meses a 3 años) situada en el barrio de Legazpi (Arganzuela), con horario ampliado, proyecto bilingüe y actividades extraescolares entre sus servicios registrados.', updated_at = NOW() WHERE id = '73ea21b4-8232-4572-8c3e-84723bde2b76';
-- CASITA MARAVILLAS BABY
UPDATE centers SET short_description = 'En el barrio de Legazpi (Arganzuela), CASITA MARAVILLAS BABY es una escuela infantil privada para niños y niñas de 4 meses a 3 años. Su ficha recoge servicios como horario ampliado, proyecto bilingüe y actividades extraescolares.', updated_at = NOW() WHERE id = '5d8654b0-8f87-410e-a593-36c594400195';
-- CHAMBERINES
UPDATE centers SET short_description = 'CHAMBERINES es una escuela infantil privada de primer ciclo (de 4 meses a 3 años) situada en el barrio de Trafalgar (Chamberí), con cocina propia, horario ampliado y patio exterior entre sus servicios registrados.', updated_at = NOW() WHERE id = '30f81571-d3e3-451f-bd88-297a766ab26f';
-- CHIQUI
UPDATE centers SET short_description = 'CHIQUI es una escuela infantil privada en el barrio de Arapiles (Chamberí), orientada al primer ciclo de Educación Infantil (de 4 meses a 3 años). Entre sus servicios registrados figuran comedor, patio exterior y actividades extraescolares.', updated_at = NOW() WHERE id = '208762a5-4d7d-4700-95c3-dd9daa09773f';
-- CHULY
UPDATE centers SET short_description = 'CHULY es una escuela infantil privada en el barrio de Acacias (Arganzuela), orientada al primer ciclo de Educación Infantil (de 4 meses a 3 años). Entre sus servicios registrados figuran comedor, psicomotricidad y música.', updated_at = NOW() WHERE id = '1f94ea42-780a-40a2-9732-3fa25b04b9c1';
-- CIUDAD JARDIN
UPDATE centers SET short_description = 'CIUDAD JARDIN es una escuela infantil privada en el barrio de Hispanoamerica (Chamartín), orientada al primer ciclo de Educación Infantil (de 4 meses a 3 años). Entre sus servicios registrados figuran horario ampliado, patio exterior y campamentos de verano.', updated_at = NOW() WHERE id = 'bf73c21a-2089-40e1-b535-9f25ecf3a006';
-- 2 SEMILLAS
UPDATE centers SET short_description = '2 SEMILLAS, escuela infantil privada en el distrito de Hortaleza, atiende el primer ciclo de Educación Infantil (de 4 meses a 3 años). Solicita información directamente al centro.', updated_at = NOW() WHERE id = '7b9517ba-29d0-4fab-a994-929e162e7cd0';
-- COLEGIO MADRID FSM-SOTILLO
UPDATE centers SET short_description = 'COLEGIO MADRID FSM-SOTILLO, guardería privada en el distrito de Hortaleza, atiende el primer ciclo de Educación Infantil (de 4 meses a 3 años) y cuenta con patio exterior según los datos disponibles.', updated_at = NOW() WHERE id = 'd2803c85-fcae-4862-b1b9-5e2617575e24';
-- CUCOS HOME VALDEBEBAS
UPDATE centers SET short_description = 'CUCOS HOME VALDEBEBAS es una escuela infantil privada de primer ciclo (de 4 meses a 3 años) situada en el distrito de Hortaleza, con cocina propia, inglés y psicomotricidad entre sus servicios registrados.', updated_at = NOW() WHERE id = 'bfb4230d-ac27-4903-a3f9-26e015aea8d4';
-- DALLINGTON INFANTS
UPDATE centers SET short_description = 'DALLINGTON INFANTS es una escuela infantil privada en el barrio de Piovera (Hortaleza), orientada al primer ciclo de Educación Infantil (de 4 meses a 3 años). Entre sus servicios registrados figuran proyecto bilingüe, inglés y comedor.', updated_at = NOW() WHERE id = 'db9ff33b-0248-44a8-9959-ef4f214fc1bb';
-- LALY
UPDATE centers SET short_description = 'LALY es una escuela infantil privada de primer ciclo (de 4 meses a 3 años) situada en el barrio de Nueva España (Chamartín), con inglés, patio exterior y campamentos de verano entre sus servicios registrados.', updated_at = NOW() WHERE id = '1a67afb7-567e-427b-abef-02bc5ed31d51';
-- DIABOLO
UPDATE centers SET short_description = 'DIABOLO es una escuela infantil privada de primer ciclo (de 4 meses a 3 años) situada en el barrio de Delicias (Arganzuela), con proyecto bilingüe y inglés entre sus servicios registrados.', updated_at = NOW() WHERE id = 'b44b6862-5b7b-4a04-84f4-d89ab51d5020';
-- DIONISIA PLAZA
UPDATE centers SET short_description = 'En el barrio de Aravaca (Moncloa-Aravaca), DIONISIA PLAZA es una escuela infantil privada para niños y niñas de 4 meses a 3 años. Su ficha recoge servicios como comedor.', updated_at = NOW() WHERE id = '51abe604-b40c-4235-bca0-3d2578328c34';
-- DOMO
UPDATE centers SET short_description = 'DOMO es una escuela infantil privada en el barrio de Pinar Del Rey (Hortaleza), orientada al primer ciclo de Educación Infantil (de 4 meses a 3 años). Entre sus servicios registrados figuran comedor, cocina propia y inglés.', updated_at = NOW() WHERE id = '42be7897-cacc-4673-baec-cd907b9d10b4';
-- DOÑA FRANCISQUITA
UPDATE centers SET short_description = 'En el barrio de Valdefuentes (Hortaleza), DOÑA FRANCISQUITA es una escuela infantil pública para niños y niñas de 4 meses a 3 años. Su ficha recoge servicios como comedor y horario ampliado.', updated_at = NOW() WHERE id = '8b7d2d9e-b5d2-41e5-a503-d4172e6c05da';
-- EDUCANDO
UPDATE centers SET short_description = 'En el barrio de Adelfas (Retiro), EDUCANDO es una escuela infantil privada para niños y niñas de 4 meses a 3 años. Su ficha recoge servicios como comedor y catering.', updated_at = NOW() WHERE id = 'adf0638e-64c9-4eff-b466-f633c8685806';
-- EDUCANDO JUNTOS
UPDATE centers SET short_description = 'En el barrio de Adelfas (Retiro), EDUCANDO JUNTOS es una escuela infantil privada para niños y niñas de 4 meses a 3 años. Su ficha recoge servicios como comedor, cocina propia y horario ampliado.', updated_at = NOW() WHERE id = '0ab27673-d227-4579-9318-bbb8345393fe';
-- EDUCANDO PITUFOS
UPDATE centers SET short_description = 'En el barrio de Niño Jesus (Retiro), EDUCANDO PITUFOS es una escuela infantil privada para niños y niñas de 4 meses a 3 años. Su ficha recoge servicios como comedor y catering.', updated_at = NOW() WHERE id = 'cc6fdb28-c0e1-49ad-bda8-acdb63efa94f';
-- EDUCANDO V
UPDATE centers SET short_description = 'EDUCANDO V, escuela infantil privada en el barrio de Adelfas (Retiro), atiende el primer ciclo de Educación Infantil (de 4 meses a 3 años) y cuenta con comedor y catering según los datos disponibles.', updated_at = NOW() WHERE id = '6df60e08-f83c-478a-816c-719cda19f66c';
-- EL COLUMPIO DE CLAUDIA
UPDATE centers SET short_description = 'EL COLUMPIO DE CLAUDIA, escuela infantil privada en el distrito de Hortaleza, atiende el primer ciclo de Educación Infantil (de 4 meses a 3 años) y cuenta con proyecto bilingüe, inglés y escuela de padres según los datos disponibles.', updated_at = NOW() WHERE id = '362babbc-12a5-44c7-9a4b-097ef7eaa145';
-- EL DUENDE TRAVIESO II
UPDATE centers SET short_description = 'EL DUENDE TRAVIESO II es una escuela infantil privada en el barrio de Acacias (Arganzuela), orientada al primer ciclo de Educación Infantil (de 4 meses a 3 años). Entre sus servicios registrados figuran proyecto bilingüe, inglés y horario ampliado.', updated_at = NOW() WHERE id = '7bf4feed-7181-4dcb-93be-ad78e0e359ef';
-- DINA CONDADO
UPDATE centers SET short_description = 'DINA CONDADO es una escuela infantil privada en el barrio de Costillares (Hortaleza), orientada al primer ciclo de Educación Infantil (de 4 meses a 3 años). Entre sus servicios registrados figuran comedor, catering y inglés.', updated_at = NOW() WHERE id = 'fa73f2b1-c52c-4870-b9e1-19e0522a0f12';
-- AFUERA III A
UPDATE centers SET short_description = 'AFUERA III A es una escuela infantil privada de primer ciclo (de 4 meses a 3 años) situada en el barrio de Niño Jesus (Retiro), con proyecto bilingüe y inglés entre sus servicios registrados.', updated_at = NOW() WHERE id = 'f54356b4-7c1f-4e31-a653-51e1d198c458';
-- ANA DE AUSTRIA
UPDATE centers SET short_description = 'ANA DE AUSTRIA, escuela infantil pública en el barrio de Valdefuentes (Hortaleza), atiende el primer ciclo de Educación Infantil (de 4 meses a 3 años) y cuenta con comedor y catering según los datos disponibles.', updated_at = NOW() WHERE id = '91926c07-f673-4623-911e-f4009fee5c9d';
-- CASA NIDO
UPDATE centers SET short_description = 'CASA NIDO es una escuela infantil privada de primer ciclo (de 4 meses a 3 años) situada en el distrito de Arganzuela, con proyecto bilingüe y inglés entre sus servicios registrados.', updated_at = NOW() WHERE id = '0d88e41b-fdb8-4d20-8cb5-f75f3efe609b';
-- CUCUTRAS
UPDATE centers SET short_description = 'CUCUTRAS es una escuela infantil privada de primer ciclo (de 4 meses a 3 años) situada en el barrio de Canillas (Hortaleza), con comedor y horario ampliado entre sus servicios registrados.', updated_at = NOW() WHERE id = '2613e96c-9379-4d6d-adeb-d21ceb774fd4';
-- DINA CONDADO-2
UPDATE centers SET short_description = 'DINA CONDADO-2 es una escuela infantil privada de primer ciclo (de 4 meses a 3 años) situada en el barrio de Costillares (Hortaleza), con comedor, catering y inglés entre sus servicios registrados.', updated_at = NOW() WHERE id = '2e007e17-485f-4a2d-9056-b6e948c72c3b';
-- DONDE ESTAN LAS LLAVES
UPDATE centers SET short_description = 'DONDE ESTAN LAS LLAVES es una escuela infantil privada en el barrio de Delicias (Arganzuela), orientada al primer ciclo de Educación Infantil (de 4 meses a 3 años). Entre sus servicios registrados figuran comedor, proyecto bilingüe y inglés.', updated_at = NOW() WHERE id = 'bed55563-8a3f-4e45-96b6-20159ceecfb8';
-- JARDIIMAR
UPDATE centers SET short_description = 'En el distrito de Arganzuela, JARDIIMAR es una escuela infantil privada para niños y niñas de 4 meses a 3 años. Su ficha recoge servicios como comedor, horario ampliado y patio exterior.', updated_at = NOW() WHERE id = 'bc6d4257-32f4-4138-804d-0205ec100804';
-- KIDS RETIRO
UPDATE centers SET short_description = 'En el barrio de Adelfas (Retiro), KIDS RETIRO es una escuela infantil privada para niños y niñas de 4 meses a 3 años. Su ficha recoge servicios como música, actividades extraescolares y campamentos de verano.', updated_at = NOW() WHERE id = '242aa7ba-3c90-4b31-8c3a-3338f154d2c1';
-- LAS ACACIAS
UPDATE centers SET short_description = 'LAS ACACIAS es una escuela infantil privada en el barrio de Ciudad Universitaria (Moncloa-Aravaca), orientada al primer ciclo de Educación Infantil (de 4 meses a 3 años). Entre sus servicios registrados figuran comedor, cocina propia y proyecto bilingüe.', updated_at = NOW() WHERE id = '5469eeb5-dc48-46b2-a0ff-8c59eb832c4e';
-- LITTLE FEM
UPDATE centers SET short_description = 'LITTLE FEM es una escuela infantil privada de primer ciclo (de 4 meses a 3 años) situada en el barrio de Vallehermoso (Chamberí), con comedor y cocina propia entre sus servicios registrados.', updated_at = NOW() WHERE id = '5415af25-14fb-4d27-8988-8d8d3ab31574';
-- EL JARDIN DE LOS GENIOS
UPDATE centers SET short_description = 'En el barrio de Arguelles (Moncloa-Aravaca), EL JARDIN DE LOS GENIOS es una escuela infantil privada para niños y niñas de 4 meses a 3 años. Su ficha recoge servicios como proyecto bilingüe y inglés.', updated_at = NOW() WHERE id = 'fc7f4a34-0646-405f-8330-8e5626f65cd7';
-- MI CASITA
UPDATE centers SET short_description = 'MI CASITA es una escuela infantil privada de primer ciclo (de 4 meses a 3 años) situada en el barrio de Pinar Del Rey (Hortaleza), con inglés entre sus servicios registrados.', updated_at = NOW() WHERE id = '98e7d76c-ea25-42a4-b796-1d1ecacc3970';
-- MI PRIMER COLE 4
UPDATE centers SET short_description = 'En el barrio de Piovera (Hortaleza), MI PRIMER COLE 4 es una escuela infantil privada para niños y niñas de 4 meses a 3 años. Su ficha recoge servicios como comedor, inglés y patio exterior.', updated_at = NOW() WHERE id = '9714633c-2f9c-4d3e-80c6-7515cda502c4';
-- ALBA LUCERO
UPDATE centers SET short_description = 'ALBA LUCERO, escuela infantil privada en el distrito de Chamartín, atiende el primer ciclo de Educación Infantil (de 4 meses a 3 años). Solicita información directamente al centro.', updated_at = NOW() WHERE id = '8ea46217-68eb-4e89-ba86-80f6daefe79e';
-- PLANETA ENANO NIÑO JESUS
UPDATE centers SET short_description = 'PLANETA ENANO NIÑO JESUS es una escuela infantil privada de primer ciclo (de 4 meses a 3 años) situada en el barrio de Niño Jesus (Retiro), con proyecto bilingüe, inglés y psicomotricidad entre sus servicios registrados.', updated_at = NOW() WHERE id = '6e0bf701-b1d1-47d9-b91b-723d1d8499a0';
-- TODO PARA LA INFANCIA
UPDATE centers SET short_description = 'TODO PARA LA INFANCIA, escuela infantil privada en el barrio de Ciudad Universitaria (Moncloa-Aravaca), atiende el primer ciclo de Educación Infantil (de 4 meses a 3 años) y cuenta con comedor, cocina propia y horario ampliado según los datos disponibles.', updated_at = NOW() WHERE id = '0e32a415-31b8-49a0-9cd5-65120c5bd3b3';
-- BOREAL DREAMING TOGETHER
UPDATE centers SET short_description = 'BOREAL DREAMING TOGETHER es una guardería privada de primer ciclo (de 4 meses a 3 años) situada en el distrito de Hortaleza, con proyecto bilingüe y inglés entre sus servicios registrados.', updated_at = NOW() WHERE id = 'eb0f284a-a6d6-4d31-b80f-711c85e83be7';
-- EL BARBERILLO DE LAVAPIES
UPDATE centers SET short_description = 'EL BARBERILLO DE LAVAPIES es una escuela infantil pública de primer ciclo (de 4 meses a 3 años) situada en el barrio de Delicias (Arganzuela), con comedor y horario ampliado entre sus servicios registrados.', updated_at = NOW() WHERE id = '951abe34-4a16-4f7e-8b42-73b27fe7b99d';
-- EL TREN DE LA FRESA
UPDATE centers SET short_description = 'EL TREN DE LA FRESA es una escuela infantil pública en el barrio de Delicias (Arganzuela), orientada al primer ciclo de Educación Infantil (de 4 meses a 3 años). Entre sus servicios registrados figuran comedor, catering y horario ampliado.', updated_at = NOW() WHERE id = '9e1832f5-d017-4c20-95a1-caff7a7fe138';
-- ROCIO DURCAL
UPDATE centers SET short_description = 'En el barrio de Valdefuentes (Hortaleza), ROCIO DURCAL es una escuela infantil pública para niños y niñas de 4 meses a 3 años. Su ficha recoge servicios como comedor y horario ampliado.', updated_at = NOW() WHERE id = '08591fa0-d00b-4b14-a313-3582865e5084';
-- LOS NANOS CHIFLADOS
UPDATE centers SET short_description = 'LOS NANOS CHIFLADOS, escuela infantil privada en el barrio de Ciudad Jardin (Chamartín), atiende el primer ciclo de Educación Infantil (de 4 meses a 3 años) y cuenta con comedor, cocina propia y horario ampliado según los datos disponibles.', updated_at = NOW() WHERE id = '4f2ca8c2-cd7e-4028-9046-253cf659f3a0';
-- EL NIDO DEL BUHO
UPDATE centers SET short_description = 'EL NIDO DEL BUHO es una escuela infantil privada de primer ciclo (de 4 meses a 3 años) ubicada en el barrio de Arapiles (Chamberí). Compara su ficha y contacta para más detalles.', updated_at = NOW() WHERE id = '78ed5308-5c04-4f93-808d-f64d69a2b65e';
-- EL OSITO
UPDATE centers SET short_description = 'En el barrio de Prosperidad (Chamartín), EL OSITO es una escuela infantil privada para niños y niñas de 4 meses a 3 años. Su ficha recoge servicios como actividades extraescolares y campamentos de verano.', updated_at = NOW() WHERE id = 'f8138a09-ba59-4cb7-a8b9-196d03b82c09';
-- EL OSITO 2
UPDATE centers SET short_description = 'EL OSITO 2 es una escuela infantil privada de primer ciclo (de 4 meses a 3 años) situada en el barrio de Prosperidad (Chamartín), con actividades extraescolares y campamentos de verano entre sus servicios registrados.', updated_at = NOW() WHERE id = '3425aacc-416b-4ff2-9d71-85cef21e5be8';
-- ESCUELA INFANTIL BILINGÜE SUS PEQUEÑOS PASOS-ARTURO SORIA
UPDATE centers SET short_description = 'ESCUELA INFANTIL BILINGÜE SUS PEQUEÑOS PASOS-ARTURO SORIA es una escuela infantil privada en el distrito de Hortaleza, orientada al primer ciclo de Educación Infantil (de 4 meses a 3 años). Entre sus servicios registrados figuran proyecto bilingüe, inglés y horario ampliado.', updated_at = NOW() WHERE id = 'ed45e5d8-cef4-4b20-9ae2-fb41ff6090e8';
-- EL REINO DEL REVÉS
UPDATE centers SET short_description = 'En el barrio de Chopera (Arganzuela), EL REINO DEL REVÉS es una escuela infantil privada para niños y niñas de 4 meses a 3 años de primer ciclo de Educación Infantil.', updated_at = NOW() WHERE id = '2de776c4-c0c7-42ff-85be-c7dbcfcd41d5';
-- EL SITIO DE TU RECREO
UPDATE centers SET short_description = 'EL SITIO DE TU RECREO es una escuela infantil privada en el barrio de Trafalgar (Chamberí), orientada al primer ciclo de Educación Infantil (de 4 meses a 3 años). Entre sus servicios registrados figuran inglés, música y actividades extraescolares.', updated_at = NOW() WHERE id = 'f184e72e-5acf-4b7f-a911-1c2c6413a996';
-- EL TREN DE LOS NIÑOS
UPDATE centers SET short_description = 'EL TREN DE LOS NIÑOS es una escuela infantil privada en el barrio de Castilla (Chamartín), orientada al primer ciclo de Educación Infantil (de 4 meses a 3 años). Entre sus servicios registrados figuran proyecto bilingüe, inglés y música.', updated_at = NOW() WHERE id = '3a416091-27e8-427c-86fb-5d8062750a6a';
-- EL TREN DE LOS NIÑOS II
UPDATE centers SET short_description = 'EL TREN DE LOS NIÑOS II, escuela infantil privada en el barrio de Castilla (Chamartín), atiende el primer ciclo de Educación Infantil (de 4 meses a 3 años) y cuenta con proyecto bilingüe, inglés y música según los datos disponibles.', updated_at = NOW() WHERE id = 'b6360786-f44b-4056-8aad-975586709549';
-- EMBAJADORES
UPDATE centers SET short_description = 'EMBAJADORES es una escuela infantil privada en el barrio de Chopera (Arganzuela), orientada al primer ciclo de Educación Infantil (de 4 meses a 3 años). Entre sus servicios registrados figuran inglés y música.', updated_at = NOW() WHERE id = '10fd5c0a-2a91-4aa0-a4e3-3608845e9e83';
-- ESTUDIO CONDE ORGAZ
UPDATE centers SET short_description = 'ESTUDIO CONDE ORGAZ, escuela infantil privada en el distrito de Hortaleza, atiende el primer ciclo de Educación Infantil (de 4 meses a 3 años) y cuenta con servicio de madrugadores, comedor y cocina propia según los datos disponibles.', updated_at = NOW() WHERE id = 'ab3ed14c-8b20-4306-947f-080f6baca7a6';
-- INTERNACIONAL VALDEMARIN
UPDATE centers SET short_description = 'INTERNACIONAL VALDEMARIN es una escuela infantil privada de primer ciclo (de 4 meses a 3 años) situada en el barrio de Valdemarin (Moncloa-Aravaca), con comedor, cocina propia y horario ampliado entre sus servicios registrados.', updated_at = NOW() WHERE id = '4230f252-d7aa-43d5-b116-d3d33cf0a8e5';
-- INTERNATIONAL MONTESSORI KINDERGARTEN
UPDATE centers SET short_description = 'En el distrito de Hortaleza, INTERNATIONAL MONTESSORI KINDERGARTEN es una guardería privada para niños y niñas de 4 meses a 3 años. Su ficha recoge servicios como comedor, inglés y actividades extraescolares.', updated_at = NOW() WHERE id = '88f6271c-7978-48a4-bbbe-43e042e1dd19';
-- IRIS
UPDATE centers SET short_description = 'IRIS es una escuela infantil privada en el barrio de Canillas (Hortaleza), orientada al primer ciclo de Educación Infantil (de 4 meses a 3 años). Entre sus servicios registrados figuran psicomotricidad y actividades extraescolares.', updated_at = NOW() WHERE id = '7fed9cf6-3a8e-4363-aa1b-2b69eb819ddf';
-- IRIS II
UPDATE centers SET short_description = 'En el barrio de Canillas (Hortaleza), IRIS II es una escuela infantil privada para niños y niñas de 4 meses a 3 años. Su ficha recoge servicios como psicomotricidad y actividades extraescolares.', updated_at = NOW() WHERE id = '84766903-944b-49f5-b46c-d155f95b1968';
-- JARDIN DE LAS DELICIAS
UPDATE centers SET short_description = 'En el barrio de Delicias (Arganzuela), JARDIN DE LAS DELICIAS es una escuela infantil privada para niños y niñas de 4 meses a 3 años. Su ficha recoge servicios como inglés.', updated_at = NOW() WHERE id = '7cd39706-b41e-4cff-afab-511643654f7b';
-- JARDIN INFANTIL
UPDATE centers SET short_description = 'JARDIN INFANTIL, escuela infantil privada en el barrio de Delicias (Arganzuela), atiende el primer ciclo de Educación Infantil (de 4 meses a 3 años) y cuenta con cocina propia y patio exterior según los datos disponibles.', updated_at = NOW() WHERE id = '1d1eeb20-8d1f-4756-8c61-a0a5e78e1450';
-- KIKA
UPDATE centers SET short_description = 'En el barrio de Legazpi (Arganzuela), KIKA es una escuela infantil privada para niños y niñas de 4 meses a 3 años. Su ficha recoge servicios como cocina propia, inglés y música.', updated_at = NOW() WHERE id = '44e68835-e79b-453f-a634-280c7f6acf4c';
-- KINDER SANTAMARCA
UPDATE centers SET short_description = 'En el distrito de Chamartín, KINDER SANTAMARCA es una escuela infantil privada para niños y niñas de 4 meses a 3 años. Su ficha recoge servicios como comedor.', updated_at = NOW() WHERE id = '4e626df4-1cad-4935-b8a4-1f117d1f165b';
-- LA ALMUDENA
UPDATE centers SET short_description = 'LA ALMUDENA, escuela infantil pública en el barrio de Canillas (Hortaleza), atiende el primer ciclo de Educación Infantil (de 4 meses a 3 años) y cuenta con comedor y horario ampliado según los datos disponibles.', updated_at = NOW() WHERE id = 'dfc9ceca-50c2-4842-b3e4-070a4527f14e';
-- LA ARDILLA
UPDATE centers SET short_description = 'LA ARDILLA es una escuela infantil pública de primer ciclo (de 4 meses a 3 años) situada en el barrio de Valdefuentes (Hortaleza), con comedor y horario ampliado entre sus servicios registrados.', updated_at = NOW() WHERE id = 'bd48d7a1-e32b-4313-9334-d7a5438714cb';
-- LA ESTRELLA INFANTIL
UPDATE centers SET short_description = 'LA ESTRELLA INFANTIL, escuela infantil privada en el barrio de Estrella (Retiro), atiende el primer ciclo de Educación Infantil (de 4 meses a 3 años). Solicita información directamente al centro.', updated_at = NOW() WHERE id = '61151bb2-0bee-46ea-8e7e-e093f2451934';
-- LA ESTRELLA INFANTIL III
UPDATE centers SET short_description = 'LA ESTRELLA INFANTIL III, escuela infantil privada en el barrio de Estrella (Retiro), atiende el primer ciclo de Educación Infantil (de 4 meses a 3 años). Solicita información directamente al centro.', updated_at = NOW() WHERE id = '268e0051-c277-4134-aa8c-575f46e0e51c';
-- LA GRAN VIA
UPDATE centers SET short_description = 'LA GRAN VIA es una escuela infantil pública de primer ciclo (de 4 meses a 3 años) situada en el barrio de Canillas (Hortaleza), con comedor y horario ampliado entre sus servicios registrados.', updated_at = NOW() WHERE id = '6e2826da-742f-40c0-87d3-6e0ac7a2bbff';
-- LA JIRAFA
UPDATE centers SET short_description = 'LA JIRAFA es una escuela infantil privada en el barrio de Canillas (Hortaleza), orientada al primer ciclo de Educación Infantil (de 4 meses a 3 años). Entre sus servicios registrados figuran proyecto bilingüe, inglés y comedor.', updated_at = NOW() WHERE id = 'a20d8eb1-7b33-45e1-ac2d-da09a0e99651';
-- LAS PLEYADES
UPDATE centers SET short_description = 'LAS PLEYADES es una escuela infantil pública en el barrio de Valdefuentes (Hortaleza), orientada al primer ciclo de Educación Infantil (de 4 meses a 3 años). Entre sus servicios registrados figuran comedor y horario ampliado.', updated_at = NOW() WHERE id = 'aea46d82-c07d-48d6-bfa6-7ac66c2157ba';
-- LITTLE CLOVERS
UPDATE centers SET short_description = 'En el barrio de Canillas (Hortaleza), LITTLE CLOVERS es una escuela infantil privada para niños y niñas de 4 meses a 3 años. Su ficha recoge servicios como proyecto bilingüe, inglés y horario ampliado.', updated_at = NOW() WHERE id = '78e5d5e1-3cab-4db3-b85a-87f775e88fd4';
-- Escuela Infantil Projardín Valdebebas
UPDATE centers SET short_description = 'Escuela Infantil Projardín Valdebebas es una escuela infantil privada de primer ciclo (de 4 meses a 3 años) situada en el distrito de Hortaleza, con comedor, cocina propia y inglés entre sus servicios registrados.', updated_at = NOW() WHERE id = '398431aa-2fa4-43cf-8d3e-5570bb9e2506';
-- MAGOS
UPDATE centers SET short_description = 'MAGOS es una escuela infantil privada en el barrio de Niño Jesus (Retiro), orientada al primer ciclo de Educación Infantil (de 4 meses a 3 años). Entre sus servicios registrados figuran comedor.', updated_at = NOW() WHERE id = '817f33c5-a1df-4352-b3c0-73743327a9db';
-- MAMATINA
UPDATE centers SET short_description = 'MAMATINA es una escuela infantil privada de primer ciclo (de 4 meses a 3 años) situada en el barrio de Aravaca (Moncloa-Aravaca), con comedor, cocina propia y servicio de madrugadores entre sus servicios registrados.', updated_at = NOW() WHERE id = '64012e8b-c8d0-42ae-9a42-a4acc88edd2d';
-- MAFALDA
UPDATE centers SET short_description = 'MAFALDA, escuela infantil privada en el barrio de Trafalgar (Chamberí), atiende el primer ciclo de Educación Infantil (de 4 meses a 3 años). Solicita información directamente al centro.', updated_at = NOW() WHERE id = '421d8c3d-9eb7-4d79-ab38-b34608e5b5bf';
-- NEMOMARLIN CHAMBERÍ
UPDATE centers SET short_description = 'NEMOMARLIN CHAMBERÍ, escuela infantil privada en el barrio de Arapiles (Chamberí), atiende el primer ciclo de Educación Infantil (de 4 meses a 3 años) y cuenta con proyecto bilingüe y inglés según los datos disponibles.', updated_at = NOW() WHERE id = 'e2a012c7-df53-41bf-b263-9f8990e285f5';
-- NEMOMARLIN CIUDAD JARDIN
UPDATE centers SET short_description = 'NEMOMARLIN CIUDAD JARDIN, escuela infantil privada en el barrio de Ciudad Jardin (Chamartín), atiende el primer ciclo de Educación Infantil (de 4 meses a 3 años) y cuenta con proyecto bilingüe y inglés según los datos disponibles.', updated_at = NOW() WHERE id = '566b2631-8266-4a51-8544-d3b322c71767';
-- NEMOMARLIN CONDE DE ORGAZ
UPDATE centers SET short_description = 'NEMOMARLIN CONDE DE ORGAZ es una escuela infantil privada de primer ciclo (de 4 meses a 3 años) situada en el barrio de Piovera (Hortaleza), con proyecto bilingüe y inglés entre sus servicios registrados.', updated_at = NOW() WHERE id = '2f2ccb55-1503-42f8-aa71-3a647f08ce85';
-- NEMOMARLIN PASEO DE LA HABANA
UPDATE centers SET short_description = 'NEMOMARLIN PASEO DE LA HABANA es una escuela infantil privada de primer ciclo (de 4 meses a 3 años) situada en el barrio de Hispanoamerica (Chamartín), con proyecto bilingüe y inglés entre sus servicios registrados.', updated_at = NOW() WHERE id = '5a2ee5b7-5694-4e9d-8020-aaa3c2f28c05';
-- NEMOMARLIN PINTOR ROSALES
UPDATE centers SET short_description = 'NEMOMARLIN PINTOR ROSALES, escuela infantil privada en el barrio de Arguelles (Moncloa-Aravaca), atiende el primer ciclo de Educación Infantil (de 4 meses a 3 años) y cuenta con proyecto bilingüe y inglés según los datos disponibles.', updated_at = NOW() WHERE id = '7073b11f-406b-4156-b350-1fe2cf5ea6f4';
-- NEMOMARLIN RETIRO
UPDATE centers SET short_description = 'NEMOMARLIN RETIRO es una escuela infantil privada de primer ciclo (de 4 meses a 3 años) situada en el barrio de Niño Jesus (Retiro), con proyecto bilingüe y inglés entre sus servicios registrados.', updated_at = NOW() WHERE id = 'cb98103f-3f15-439b-be5f-e3a8641f5911';
-- OSOBUCO II
UPDATE centers SET short_description = 'En el barrio de Prosperidad (Chamartín), OSOBUCO II es una escuela infantil privada para niños y niñas de 4 meses a 3 años. Su ficha recoge servicios como cocina propia, horario ampliado y patio exterior.', updated_at = NOW() WHERE id = 'd84b45f5-b68f-4fab-8125-08076bbce188';
-- OSOBUCO
UPDATE centers SET short_description = 'OSOBUCO es una escuela infantil privada en el barrio de Prosperidad (Chamartín), orientada al primer ciclo de Educación Infantil (de 4 meses a 3 años). Entre sus servicios registrados figuran cocina propia, horario ampliado y patio exterior.', updated_at = NOW() WHERE id = '18560653-1d3f-4fcb-a644-efd32c114c9d';
-- PASO A PASO
UPDATE centers SET short_description = 'En el barrio de Acacias (Arganzuela), PASO A PASO es una escuela infantil privada para niños y niñas de 4 meses a 3 años. Su ficha recoge servicios como inglés.', updated_at = NOW() WHERE id = '669c81c1-3b8e-4fc8-a584-353c0a07bb39';
-- PEQUEANDO
UPDATE centers SET short_description = 'En el barrio de Valdefuentes (Hortaleza), PEQUEANDO es una escuela infantil privada para niños y niñas de 4 meses a 3 años. Su ficha recoge servicios como inglés, música y patio exterior.', updated_at = NOW() WHERE id = '70262e7f-ca4b-4355-8f65-dcc1945ba6f4';
-- PINOCHO
UPDATE centers SET short_description = 'PINOCHO es una escuela infantil privada de primer ciclo (de 4 meses a 3 años) situada en el distrito de Retiro, con proyecto bilingüe, inglés y comedor entre sus servicios registrados.', updated_at = NOW() WHERE id = '04f8c4bd-ceb8-433a-b59a-a70c3fc1015a';
-- PROJARDIN DELICIAS
UPDATE centers SET short_description = 'PROJARDIN DELICIAS, escuela infantil privada en el barrio de Delicias (Arganzuela), atiende el primer ciclo de Educación Infantil (de 4 meses a 3 años) y cuenta con comedor, actividades extraescolares y campamentos de verano según los datos disponibles.', updated_at = NOW() WHERE id = '4ec45fc5-a106-4db9-8db0-d3be5ee6baa4';
-- PROJARDIN MADIBA
UPDATE centers SET short_description = 'PROJARDIN MADIBA, escuela infantil privada en el barrio de Valdefuentes (Hortaleza), atiende el primer ciclo de Educación Infantil (de 4 meses a 3 años) y cuenta con comedor, actividades extraescolares y campamentos de verano según los datos disponibles.', updated_at = NOW() WHERE id = 'a044c23a-ea1c-4449-927e-f79001c9bda9';
-- PROJARDIN RETIRO
UPDATE centers SET short_description = 'PROJARDIN RETIRO, escuela infantil privada en el barrio de Niño Jesus (Retiro), atiende el primer ciclo de Educación Infantil (de 4 meses a 3 años) y cuenta con comedor según los datos disponibles.', updated_at = NOW() WHERE id = 'a397737d-837d-48f7-b108-92767f0a488e';
-- ST. ALICE'S NURSERY GALILEO
UPDATE centers SET short_description = 'ST. ALICE''S NURSERY GALILEO es una escuela infantil privada de primer ciclo (de 4 meses a 3 años) situada en el barrio de Arapiles (Chamberí), con proyecto bilingüe y inglés entre sus servicios registrados.', updated_at = NOW() WHERE id = '660e3319-c883-46a8-a2c1-132d8aec4608';
-- THE LITTLE ONE
UPDATE centers SET short_description = 'THE LITTLE ONE es una escuela infantil privada de primer ciclo (de 4 meses a 3 años) situada en el distrito de Chamartín, con proyecto bilingüe, inglés y patio exterior entre sus servicios registrados.', updated_at = NOW() WHERE id = '13eee06b-766c-4784-9e66-4262c55f73a5';
-- TIERRA LALA
UPDATE centers SET short_description = 'TIERRA LALA, escuela infantil privada en el distrito de Hortaleza, atiende el primer ciclo de Educación Infantil (de 4 meses a 3 años) y cuenta con inglés, música y patio exterior según los datos disponibles.', updated_at = NOW() WHERE id = '687b16a9-8e89-476b-a840-ebb7b773907d';
-- TODO NIÑOS NURSERY
UPDATE centers SET short_description = 'TODO NIÑOS NURSERY es una guardería privada en el barrio de Aravaca (Moncloa-Aravaca), orientada al primer ciclo de Educación Infantil (de 4 meses a 3 años). Entre sus servicios registrados figuran proyecto bilingüe, inglés y horario ampliado.', updated_at = NOW() WHERE id = '3599376e-d55d-4c74-a10c-77a198a71bfe';
-- ULU
UPDATE centers SET short_description = 'ULU es una escuela infantil privada de primer ciclo (de 4 meses a 3 años) situada en el distrito de Retiro, con horario ampliado, música y psicomotricidad entre sus servicios registrados.', updated_at = NOW() WHERE id = 'b9448c81-342f-48b3-8c8e-9662b232fd16';
-- UP! KIDS SCHOOL
UPDATE centers SET short_description = 'UP! KIDS SCHOOL es una escuela infantil privada en el distrito de Hortaleza, orientada al primer ciclo de Educación Infantil (de 4 meses a 3 años). Entre sus servicios registrados figuran proyecto bilingüe, inglés y comedor.', updated_at = NOW() WHERE id = 'efa9caae-d780-4ec5-8fe1-cfd2bee68b97';
-- VIB VALDEBEBAS
UPDATE centers SET short_description = 'VIB VALDEBEBAS, escuela infantil privada en el distrito de Hortaleza, atiende el primer ciclo de Educación Infantil (de 4 meses a 3 años) y cuenta con cocina propia, horario ampliado y música según los datos disponibles.', updated_at = NOW() WHERE id = '440bd2c0-b776-4e7a-ab44-1cff0d29439d';
-- YAKI
UPDATE centers SET short_description = 'YAKI es una escuela infantil privada en el barrio de Hispanoamerica (Chamartín), orientada al primer ciclo de Educación Infantil (de 4 meses a 3 años). Entre sus servicios registrados figuran horario ampliado, patio exterior y psicomotricidad.', updated_at = NOW() WHERE id = '0046c9df-fdbe-41cd-9719-5ed609a69533';

COMMIT;

-- 113 short_descriptions diversificadas. Duplicados restantes: 0.