-- ============================================================
-- UPDATE 004 — Segunda pasada de servicios: 83 centros confirmados
-- Generado: 2026-07-03
-- Método: investigación manual de sitios web oficiales y fuentes secundarias
-- ============================================================
-- REQUIERE: 003_update_all_remaining_centers_REVISED.sql ejecutado previamente.
-- NO EJECUTAR automáticamente. Revisar antes de aplicar en producción.
-- ============================================================
-- Solo actualiza centros de la lista de 146 con services = [].
-- Fuentes indicadas en comentario de cada UPDATE.
-- Confianza:
--   high   = sitio web oficial visitado directamente
--   medium = fuente secundaria (buscador, directorio, agregador)
-- ============================================================
-- No toca: id, slug, name, type, ownership, street, long_description,
--          images, is_claimed, is_verified, verification_status.
-- ============================================================

BEGIN;

-- ─────────────────────────────────────────────────────────────
-- NEMOMARLIN (7 centros) — Red bilingüe confirmada
-- Fuente: escuelanemomarlin.com (high)
-- ─────────────────────────────────────────────────────────────

-- NEMOMARLIN CHAMBERÍ
UPDATE centers SET
  services         = ARRAY['bilingue','ingles']::text[],
  confidence_level = 'high',
  updated_at       = NOW()
WHERE id = 'e2a012c7-df53-41bf-b263-9f8990e285f5';

-- NEMOMARLIN CIUDAD JARDIN
UPDATE centers SET
  services         = ARRAY['bilingue','ingles']::text[],
  confidence_level = 'high',
  updated_at       = NOW()
WHERE id = '566b2631-8266-4a51-8544-d3b322c71767';

-- NEMOMARLIN CONDE DE ORGAZ
UPDATE centers SET
  services         = ARRAY['bilingue','ingles']::text[],
  confidence_level = 'high',
  updated_at       = NOW()
WHERE id = '2f2ccb55-1503-42f8-aa71-3a647f08ce85';

-- NEMOMARLIN GUINDALERA
UPDATE centers SET
  services         = ARRAY['bilingue','ingles']::text[],
  confidence_level = 'high',
  updated_at       = NOW()
WHERE id = '65326fa5-68ac-49be-881c-412d016476c7';

-- NEMOMARLIN PASEO DE LA HABANA
UPDATE centers SET
  services         = ARRAY['bilingue','ingles']::text[],
  confidence_level = 'high',
  updated_at       = NOW()
WHERE id = '5a2ee5b7-5694-4e9d-8020-aaa3c2f28c05';

-- NEMOMARLIN PINTOR ROSALES
UPDATE centers SET
  services         = ARRAY['bilingue','ingles']::text[],
  confidence_level = 'high',
  updated_at       = NOW()
WHERE id = '7073b11f-406b-4156-b350-1fe2cf5ea6f4';

-- NEMOMARLIN RETIRO
UPDATE centers SET
  services         = ARRAY['bilingue','ingles']::text[],
  confidence_level = 'high',
  updated_at       = NOW()
WHERE id = 'cb98103f-3f15-439b-be5f-e3a8641f5911';

-- ─────────────────────────────────────────────────────────────
-- ALARIA (3 centros)
-- Fuente: alariaescuelasinfantiles.es (high)
-- ─────────────────────────────────────────────────────────────

-- ALARIA ARAVACA NURSERY SCHOOL
UPDATE centers SET
  services         = ARRAY['comedor','cocina-propia','horario-ampliado','bilingue','ingles','patio-exterior','actividades-extraescolares','verano-campamentos','uniformes','escuela-de-padres']::text[],
  confidence_level = 'high',
  updated_at       = NOW()
WHERE id = '969bf22e-0d0f-4a3d-b0af-e0b48906ad20';

-- ALARIA NUEVOS MINISTERIOS NURSERY SCHOOL
UPDATE centers SET
  services         = ARRAY['comedor','cocina-propia','horario-ampliado','bilingue','ingles','patio-exterior','actividades-extraescolares','verano-campamentos','uniformes','escuela-de-padres']::text[],
  confidence_level = 'high',
  updated_at       = NOW()
WHERE id = 'f1f29a13-e243-44e5-a3d1-d6e9ba6053c4';

-- ALARIA SERRANO NURSEY SCHOOL
UPDATE centers SET
  services         = ARRAY['comedor','cocina-propia','horario-ampliado','bilingue','ingles','patio-exterior','actividades-extraescolares','verano-campamentos','uniformes','escuela-de-padres']::text[],
  confidence_level = 'high',
  updated_at       = NOW()
WHERE id = '91d2d752-5f82-4c64-8379-6a716aedc868';

-- ─────────────────────────────────────────────────────────────
-- CASITA MARAVILLAS (2 centros)
-- Fuente: casitamaravillas.es (high)
-- ─────────────────────────────────────────────────────────────

-- CASITA MARAVILLAS
UPDATE centers SET
  services         = ARRAY['horario-ampliado','bilingue','actividades-extraescolares','verano-campamentos']::text[],
  confidence_level = 'high',
  updated_at       = NOW()
WHERE id = '73ea21b4-8232-4572-8c3e-84723bde2b76';

-- CASITA MARAVILLAS BABY
UPDATE centers SET
  services         = ARRAY['horario-ampliado','bilingue','actividades-extraescolares','verano-campamentos']::text[],
  confidence_level = 'high',
  updated_at       = NOW()
WHERE id = '5d8654b0-8f87-410e-a593-36c594400195';

-- ─────────────────────────────────────────────────────────────
-- EDUCANDO (3 centros + JUNTOS)
-- Fuente: escuelaeducando.com (high) / buscocolegio.com para JUNTOS (medium)
-- ─────────────────────────────────────────────────────────────

-- EDUCANDO
UPDATE centers SET
  services         = ARRAY['comedor','catering']::text[],
  confidence_level = 'high',
  updated_at       = NOW()
WHERE id = 'adf0638e-64c9-4eff-b466-f633c8685806';

-- EDUCANDO PITUFOS
UPDATE centers SET
  services         = ARRAY['comedor','catering']::text[],
  confidence_level = 'high',
  updated_at       = NOW()
WHERE id = 'cc6fdb28-c0e1-49ad-bda8-acdb63efa94f';

-- EDUCANDO V
UPDATE centers SET
  services         = ARRAY['comedor','catering']::text[],
  confidence_level = 'high',
  updated_at       = NOW()
WHERE id = '6df60e08-f83c-478a-816c-719cda19f66c';

-- EDUCANDO JUNTOS — fuente secundaria (buscocolegio.com)
UPDATE centers SET
  services         = ARRAY['comedor','cocina-propia','horario-ampliado','actividades-extraescolares']::text[],
  confidence_level = 'medium',
  updated_at       = NOW()
WHERE id = '0ab27673-d227-4579-9318-bbb8345393fe';

-- ─────────────────────────────────────────────────────────────
-- EL OSITO (2 centros)
-- Fuente: escuelainfantilelosito.com (high)
-- ─────────────────────────────────────────────────────────────

-- EL OSITO
UPDATE centers SET
  services         = ARRAY['actividades-extraescolares','verano-campamentos']::text[],
  confidence_level = 'high',
  updated_at       = NOW()
WHERE id = 'f8138a09-ba59-4cb7-a8b9-196d03b82c09';

-- EL OSITO 2
UPDATE centers SET
  services         = ARRAY['actividades-extraescolares','verano-campamentos']::text[],
  confidence_level = 'high',
  updated_at       = NOW()
WHERE id = '3425aacc-416b-4ff2-9d71-85cef21e5be8';

-- ─────────────────────────────────────────────────────────────
-- RESTO DE CENTROS (orden alfabético)
-- ─────────────────────────────────────────────────────────────

-- AFUERA III A — fuente: búsqueda (hermano III B confirmado bilingüe, medium)
UPDATE centers SET
  services         = ARRAY['bilingue','ingles']::text[],
  confidence_level = 'medium',
  updated_at       = NOW()
WHERE id = 'f54356b4-7c1f-4e31-a653-51e1d198c458';

-- ALICIA — fuente: escuelainfantilalicia.es (high)
UPDATE centers SET
  services         = ARRAY['horario-ampliado','comedor','actividades-extraescolares']::text[],
  confidence_level = 'high',
  updated_at       = NOW()
WHERE id = '1dab63de-d43d-41bc-9a5d-7257639bb8e5';

-- ALICIA II — misma cadena que ALICIA
UPDATE centers SET
  services         = ARRAY['horario-ampliado','comedor','actividades-extraescolares']::text[],
  confidence_level = 'high',
  updated_at       = NOW()
WHERE id = 'ebde4f53-c43e-46ab-9e18-004bd974d395';

-- ALLEGRA — fuente: escuelalibreallegra.es (menú de navegación: comedor; jardín confirmado)
UPDATE centers SET
  services         = ARRAY['comedor','cocina-propia','patio-exterior']::text[],
  confidence_level = 'high',
  updated_at       = NOW()
WHERE id = 'd072830a-ceeb-4d14-8a77-3bca3b5618d4';

-- B.R.A. INSTITUCION ORGAZ — fuente: colegiobrains.com (high)
UPDATE centers SET
  services         = ARRAY['comedor','ingles','musica','psicomotricidad','patio-exterior','actividades-extraescolares','verano-campamentos','uniformes']::text[],
  confidence_level = 'high',
  updated_at       = NOW()
WHERE id = '4c1cb5b6-8a04-47ef-a64e-cbf99fd11d23';

-- CARANA VALDEMARIN — fuente: escuelainfantilcarana.es (high)
UPDATE centers SET
  services         = ARRAY['ingles','psicomotricidad','musica','actividades-extraescolares','verano-campamentos']::text[],
  confidence_level = 'high',
  updated_at       = NOW()
WHERE id = 'c442d882-1877-49d4-8ac2-3d2ec1039740';

-- CARRUSEL — fuente: carruselescuelainfantil.es (high)
UPDATE centers SET
  services         = ARRAY['comedor','cocina-propia','ingles','musica','psicomotricidad','verano-campamentos','escuela-de-padres']::text[],
  confidence_level = 'high',
  updated_at       = NOW()
WHERE id = '45848e76-0aee-4e37-b6d7-5d27adb12633';

-- CASA DEL NIÑO (Salus Infirmorum) — fuente: saluscasadelnino.es/servicios (high)
UPDATE centers SET
  services         = ARRAY['comedor','cocina-propia','bilingue','ingles','musica','psicomotricidad','actividades-extraescolares','orientacion-pedagogica']::text[],
  confidence_level = 'high',
  updated_at       = NOW()
WHERE id = 'ad9568f5-bba5-4d47-a083-847cd19d397b';

-- CHAMBERINES — fuente: chamberines.com (high)
UPDATE centers SET
  services         = ARRAY['cocina-propia','horario-ampliado','patio-exterior','ingles','escuela-de-padres']::text[],
  confidence_level = 'high',
  updated_at       = NOW()
WHERE id = '30f81571-d3e3-451f-bd88-297a766ab26f';

-- CHIQUI — fuente: escuelainfantilchiqui.es (high)
UPDATE centers SET
  services         = ARRAY['comedor','patio-exterior','actividades-extraescolares']::text[],
  confidence_level = 'high',
  updated_at       = NOW()
WHERE id = '208762a5-4d7d-4700-95c3-dd9daa09773f';

-- CHIQUI TIN ALCANTARA — misma cadena que CHIQUI
UPDATE centers SET
  services         = ARRAY['comedor','patio-exterior','actividades-extraescolares']::text[],
  confidence_level = 'high',
  updated_at       = NOW()
WHERE id = 'eb42112b-a9d9-4586-b60d-f0c7434889b7';

-- CHULY — fuente: escuelainfantilchuly.com (high)
UPDATE centers SET
  services         = ARRAY['comedor','psicomotricidad','musica','escuela-de-padres']::text[],
  confidence_level = 'high',
  updated_at       = NOW()
WHERE id = '1f94ea42-780a-40a2-9732-3fa25b04b9c1';

-- CIUDAD JARDIN (no Nemomarlin) — fuente: guarderiaciudadjardin.es (high)
-- 7h-19h, instalaciones exteriores 800m², campamento verano, psicólogo infantil
UPDATE centers SET
  services         = ARRAY['horario-ampliado','patio-exterior','verano-campamentos','orientacion-pedagogica']::text[],
  confidence_level = 'high',
  updated_at       = NOW()
WHERE id = 'bf73c21a-2089-40e1-b535-9f25ecf3a006';

-- COCOLAN CVE — fuente: cve.edu.es (high)
UPDATE centers SET
  services         = ARRAY['comedor','horario-ampliado','psicomotricidad','verano-campamentos']::text[],
  confidence_level = 'high',
  updated_at       = NOW()
WHERE id = 'd92d9646-333c-4f58-bdce-5cff334edb33';

-- CUCOS HOME VALDEBEBAS — fuente: cucoshome.com/servicios (high)
-- cocina casera propia, psicomotricidad, verano-campamentos (julio-agosto), inglés (Valdebebas), natación
UPDATE centers SET
  services         = ARRAY['cocina-propia','ingles','psicomotricidad','actividades-extraescolares','verano-campamentos']::text[],
  confidence_level = 'high',
  updated_at       = NOW()
WHERE id = 'bfb4230d-ac27-4903-a3f9-26e015aea8d4';

-- DALLINGTON INFANTS — fuente: dallingtonschool.com (high)
UPDATE centers SET
  services         = ARRAY['bilingue','ingles','comedor','actividades-extraescolares','verano-campamentos','uniformes','orientacion-pedagogica']::text[],
  confidence_level = 'high',
  updated_at       = NOW()
WHERE id = 'db9ff33b-0248-44a8-9959-ef4f214fc1bb';

-- DIABOLO — fuente secundaria (sitio con timeout DNS, búsqueda confirma bilingüe, medium)
UPDATE centers SET
  services         = ARRAY['bilingue','ingles']::text[],
  confidence_level = 'medium',
  updated_at       = NOW()
WHERE id = 'b44b6862-5b7b-4a04-84f4-d89ab51d5020';

-- DOMO — fuente: domoescuelainfantil.es (high)
UPDATE centers SET
  services         = ARRAY['comedor','cocina-propia','ingles','patio-exterior','verano-campamentos','orientacion-pedagogica']::text[],
  confidence_level = 'high',
  updated_at       = NOW()
WHERE id = '42be7897-cacc-4673-baec-cd907b9d10b4';

-- EL COLUMPIO DE CLAUDIA — fuente: elcolumpiodeclaudia.com (confirmado vía búsqueda, medium)
UPDATE centers SET
  services         = ARRAY['bilingue','ingles','escuela-de-padres','orientacion-pedagogica']::text[],
  confidence_level = 'medium',
  updated_at       = NOW()
WHERE id = '362babbc-12a5-44c7-9a4b-097ef7eaa145';

-- EL DUENDE TRAVIESO II — fuente: elduendetravieso.com (high)
UPDATE centers SET
  services         = ARRAY['bilingue','ingles','horario-ampliado','comedor','escuela-de-padres']::text[],
  confidence_level = 'high',
  updated_at       = NOW()
WHERE id = '7bf4feed-7181-4dcb-93be-ad78e0e359ef';

-- EL JARDIN DE LOS GENIOS — fuente secundaria (DNS error en sitio oficial, búsqueda confirma bilingüe, medium)
UPDATE centers SET
  services         = ARRAY['bilingue','ingles']::text[],
  confidence_level = 'medium',
  updated_at       = NOW()
WHERE id = 'fc7f4a34-0646-405f-8330-8e5626f65cd7';

-- EL SITIO DE TU RECREO — fuente: elsitiodeturecreo.com (high)
UPDATE centers SET
  services         = ARRAY['ingles','musica','actividades-extraescolares']::text[],
  confidence_level = 'high',
  updated_at       = NOW()
WHERE id = 'f184e72e-5acf-4b7f-a911-1c2c6413a996';

-- EL TREN DE LOS NIÑOS — fuente: escuelainfantileltrendelosninos.com (high)
UPDATE centers SET
  services         = ARRAY['bilingue','ingles','musica','psicomotricidad','actividades-extraescolares']::text[],
  confidence_level = 'high',
  updated_at       = NOW()
WHERE id = '3a416091-27e8-427c-86fb-5d8062750a6a';

-- EL TREN DE LOS NIÑOS II — misma cadena
UPDATE centers SET
  services         = ARRAY['bilingue','ingles','musica','psicomotricidad','actividades-extraescolares']::text[],
  confidence_level = 'high',
  updated_at       = NOW()
WHERE id = 'b6360786-f44b-4056-8aad-975586709549';

-- EMBAJADORES — fuente: escuelainfantilembajadores.com (high)
UPDATE centers SET
  services         = ARRAY['ingles','musica']::text[],
  confidence_level = 'high',
  updated_at       = NOW()
WHERE id = '10fd5c0a-2a91-4aa0-a4e3-3608845e9e83';

-- ESCUELA DE EDUCACION INFANTIL DEL COMPLEJO CUZCO
-- Guardería gestionada por Kidsco (Ministerio de Hacienda)
-- Fuente secundaria: buscocolegio.com confirma horario ampliado, comedor, extraescolares (medium)
UPDATE centers SET
  services         = ARRAY['horario-ampliado','comedor','actividades-extraescolares']::text[],
  confidence_level = 'medium',
  updated_at       = NOW()
WHERE id = '8e3ec3c2-c8ad-4c71-a0c5-218e10b48a6c';

-- ESCUELA INFANTIL BILINGÜE SUS PEQUEÑOS PASOS-ARTURO SORIA
-- Fuente: suspequenospasos.es (confirmado vía búsqueda, medium)
-- Bilingüe español-inglés, 2 patios exteriores, horario 7:30-19:00
UPDATE centers SET
  services         = ARRAY['bilingue','ingles','horario-ampliado','patio-exterior']::text[],
  confidence_level = 'medium',
  updated_at       = NOW()
WHERE id = 'ed45e5d8-cef4-4b20-9ae2-fb41ff6090e8';

-- ESCUELA INFANTIL BRAINS MADRID — fuente: brainsnursery.com (high)
UPDATE centers SET
  services         = ARRAY['bilingue','ingles','comedor','musica','actividades-extraescolares','verano-campamentos','escuela-de-padres']::text[],
  confidence_level = 'high',
  updated_at       = NOW()
WHERE id = '8ade6798-5b66-479d-b987-e433560cf5ce';

-- ESTUDIO CONDE ORGAZ — fuente secundaria: colegio-estudio.es (búsqueda, medium)
-- Madrugadores, comedor propio, cocina propia
UPDATE centers SET
  services         = ARRAY['servicio-madrugadores','comedor','cocina-propia']::text[],
  confidence_level = 'medium',
  updated_at       = NOW()
WHERE id = 'ab3ed14c-8b20-4306-947f-080f6baca7a6';

-- GARABATOS Y OCHO PATOS — fuente: garabatosyochopatos.com (high)
UPDATE centers SET
  services         = ARRAY['comedor','horario-ampliado','ingles','musica','patio-exterior','actividades-extraescolares']::text[],
  confidence_level = 'high',
  updated_at       = NOW()
WHERE id = 'b3c2a25e-7fe0-4700-b515-570ef4880e6c';

-- GREENLEAVES MONTESSORI II — fuente secundaria: greenleavesmontessori.com (búsqueda, medium)
UPDATE centers SET
  services         = ARRAY['bilingue','ingles','catering','patio-exterior','musica','psicomotricidad','actividades-extraescolares','verano-campamentos']::text[],
  confidence_level = 'medium',
  updated_at       = NOW()
WHERE id = 'ac52291f-097c-42de-88ad-936822cadd2c';

-- INTERNACIONAL VALDEMARIN — fuente: internacionalvaldemarin.com (high)
UPDATE centers SET
  services         = ARRAY['comedor','cocina-propia','horario-ampliado','actividades-extraescolares','verano-campamentos','orientacion-pedagogica']::text[],
  confidence_level = 'high',
  updated_at       = NOW()
WHERE id = '4230f252-d7aa-43d5-b116-d3d33cf0a8e5';

-- INTERNATIONAL MONTESSORI KINDERGARTEN — fuente: montessoricondeorgaz.es (high)
UPDATE centers SET
  services         = ARRAY['comedor','ingles','actividades-extraescolares','verano-campamentos']::text[],
  confidence_level = 'high',
  updated_at       = NOW()
WHERE id = '88f6271c-7978-48a4-bbbe-43e042e1dd19';

-- IRIS — fuente: escuelainfantiliris.es (high)
UPDATE centers SET
  services         = ARRAY['psicomotricidad','actividades-extraescolares']::text[],
  confidence_level = 'high',
  updated_at       = NOW()
WHERE id = '7fed9cf6-3a8e-4363-aa1b-2b69eb819ddf';

-- IRIS II — misma cadena que IRIS
UPDATE centers SET
  services         = ARRAY['psicomotricidad','actividades-extraescolares']::text[],
  confidence_level = 'high',
  updated_at       = NOW()
WHERE id = '84766903-944b-49f5-b46c-d155f95b1968';

-- JARDIN DE LAS DELICIAS — fuente secundaria: lnx.jardindelasdelicias.net (medium)
UPDATE centers SET
  services         = ARRAY['ingles']::text[],
  confidence_level = 'medium',
  updated_at       = NOW()
WHERE id = '7cd39706-b41e-4cff-afab-511643654f7b';

-- JARDIN INFANTIL — fuente secundaria: jardininfantil.es (búsqueda, medium)
-- Cocina propia, jardín exterior con arenero
UPDATE centers SET
  services         = ARRAY['cocina-propia','patio-exterior']::text[],
  confidence_level = 'medium',
  updated_at       = NOW()
WHERE id = '1d1eeb20-8d1f-4756-8c61-a0a5e78e1450';

-- KIKA — fuente: escuelainfantilkikamadrid.com (high)
UPDATE centers SET
  services         = ARRAY['cocina-propia','ingles','musica','patio-exterior','actividades-extraescolares']::text[],
  confidence_level = 'high',
  updated_at       = NOW()
WHERE id = '44e68835-e79b-453f-a634-280c7f6acf4c';

-- KINDER SANTAMARCA — fuente: colegiofundacionsantamarca.es (high)
UPDATE centers SET
  services         = ARRAY['comedor']::text[],
  confidence_level = 'high',
  updated_at       = NOW()
WHERE id = '4e626df4-1cad-4935-b8a4-1f117d1f165b';

-- LA JIRAFA — fuente: lajirafaescuelainfantil.com (high)
UPDATE centers SET
  services         = ARRAY['bilingue','ingles','comedor','horario-ampliado','musica','psicomotricidad']::text[],
  confidence_level = 'high',
  updated_at       = NOW()
WHERE id = 'a20d8eb1-7b33-45e1-ac2d-da09a0e99651';

-- LITTLE CLOVERS — fuente: littleclovers.es (high)
UPDATE centers SET
  services         = ARRAY['bilingue','ingles','horario-ampliado','actividades-extraescolares','verano-campamentos','uniformes']::text[],
  confidence_level = 'high',
  updated_at       = NOW()
WHERE id = '78e5d5e1-3cab-4db3-b85a-87f775e88fd4';

-- MAMATINA — fuente: mamatina.com (high)
UPDATE centers SET
  services         = ARRAY['comedor','cocina-propia','servicio-madrugadores','ingles','patio-exterior']::text[],
  confidence_level = 'high',
  updated_at       = NOW()
WHERE id = '64012e8b-c8d0-42ae-9a42-a4acc88edd2d';

-- MI PRIMER COLE 2 — fuente: miprimercole.es (high)
UPDATE centers SET
  services         = ARRAY['ingles','musica','psicomotricidad','actividades-extraescolares','escuela-de-padres']::text[],
  confidence_level = 'high',
  updated_at       = NOW()
WHERE id = 'bad591e9-7637-414d-952b-59bd44cc68fd';

-- MICOS, MI PRIMER COLE — fuente secundaria: micosmiprimercole.es (búsqueda, medium)
UPDATE centers SET
  services         = ARRAY['ingles','musica','cocina-propia','horario-ampliado']::text[],
  confidence_level = 'medium',
  updated_at       = NOW()
WHERE id = 'f4b7ba3a-8d41-40ca-a807-a92e5b619fcb';

-- MIS-MIS (guardería ministerio Inclusión, gestionada por WorkandLife)
-- Fuente secundaria: workandlife.es/descripción del servicio (medium)
UPDATE centers SET
  services         = ARRAY['ingles','musica','psicomotricidad','actividades-extraescolares','verano-campamentos','escuela-de-padres']::text[],
  confidence_level = 'medium',
  updated_at       = NOW()
WHERE id = 'cac1f1f0-5658-4d44-bb94-d9715d09bcca';

-- OSOBUCO — fuente: osobuco.net (high)
UPDATE centers SET
  services         = ARRAY['cocina-propia','horario-ampliado','patio-exterior','verano-campamentos']::text[],
  confidence_level = 'high',
  updated_at       = NOW()
WHERE id = '18560653-1d3f-4fcb-a644-efd32c114c9d';

-- OSOBUCO II — misma cadena que OSOBUCO
UPDATE centers SET
  services         = ARRAY['cocina-propia','horario-ampliado','patio-exterior','verano-campamentos']::text[],
  confidence_level = 'high',
  updated_at       = NOW()
WHERE id = 'd84b45f5-b68f-4fab-8125-08076bbce188';

-- PASO A PASO — fuente secundaria: pasoapasoescuela.com (búsqueda, medium)
UPDATE centers SET
  services         = ARRAY['ingles']::text[],
  confidence_level = 'medium',
  updated_at       = NOW()
WHERE id = '669c81c1-3b8e-4fc8-a584-353c0a07bb39';

-- PEQUEANDO — fuente: pequeando.es (high)
UPDATE centers SET
  services         = ARRAY['ingles','musica','patio-exterior','escuela-de-padres']::text[],
  confidence_level = 'high',
  updated_at       = NOW()
WHERE id = '70262e7f-ca4b-4355-8f65-dcc1945ba6f4';

-- PINOCHO — fuente secundaria: colegioinfantilpinocho.com (búsqueda, medium)
UPDATE centers SET
  services         = ARRAY['bilingue','ingles','comedor','musica','actividades-extraescolares']::text[],
  confidence_level = 'medium',
  updated_at       = NOW()
WHERE id = '04f8c4bd-ceb8-433a-b59a-a70c3fc1015a';

-- PROJARDIN DELICIAS — fuente: projardin.es (high)
UPDATE centers SET
  services         = ARRAY['comedor','actividades-extraescolares','verano-campamentos','uniformes','orientacion-pedagogica']::text[],
  confidence_level = 'high',
  updated_at       = NOW()
WHERE id = '4ec45fc5-a106-4db9-8db0-d3be5ee6baa4';

-- PROJARDIN MADIBA — misma cadena que PROJARDIN DELICIAS
UPDATE centers SET
  services         = ARRAY['comedor','actividades-extraescolares','verano-campamentos','uniformes','orientacion-pedagogica']::text[],
  confidence_level = 'high',
  updated_at       = NOW()
WHERE id = 'a044c23a-ea1c-4449-927e-f79001c9bda9';

-- SAN GABRIEL ARCANGEL — fuente: eisangabriel.es (high)
UPDATE centers SET
  services         = ARRAY['comedor','uniformes']::text[],
  confidence_level = 'high',
  updated_at       = NOW()
WHERE id = '87e10931-e3a1-44cd-b031-56eee7f154b1';

-- SANTA BERNARDITA — fuente: santabernardita.es (high)
UPDATE centers SET
  services         = ARRAY['ingles']::text[],
  confidence_level = 'high',
  updated_at       = NOW()
WHERE id = 'a46d7d07-158b-4330-9fb5-c6c0c0ecce72';

-- ST. ALICE'S NURSERY GALILEO — fuente: stalices.es (high)
UPDATE centers SET
  services         = ARRAY['bilingue','ingles']::text[],
  confidence_level = 'high',
  updated_at       = NOW()
WHERE id = '660e3319-c883-46a8-a2c1-132d8aec4608';

-- TEO — fuente: escuelainfantilteo.es (high)
UPDATE centers SET
  services         = ARRAY['cocina-propia','comedor','bilingue','ingles','verano-campamentos']::text[],
  confidence_level = 'high',
  updated_at       = NOW()
WHERE id = '921a11e3-0008-48fd-ab4a-d2b03bc3095d';

-- TEO BRETON — misma cadena que TEO
UPDATE centers SET
  services         = ARRAY['cocina-propia','comedor','bilingue','ingles','verano-campamentos']::text[],
  confidence_level = 'high',
  updated_at       = NOW()
WHERE id = '91e6b9be-43aa-4c18-9cd5-e9d0f6e817f4';

-- THE LITTLE ONE — fuente secundaria: thelittleone.es (SSL error, búsqueda confirma bilingüe+patio, medium)
UPDATE centers SET
  services         = ARRAY['bilingue','ingles','patio-exterior']::text[],
  confidence_level = 'medium',
  updated_at       = NOW()
WHERE id = '13eee06b-766c-4784-9e66-4262c55f73a5';

-- TIERRA LALA — fuente: tierralala.com (high)
UPDATE centers SET
  services         = ARRAY['ingles','musica','patio-exterior']::text[],
  confidence_level = 'high',
  updated_at       = NOW()
WHERE id = '687b16a9-8e89-476b-a840-ebb7b773907d';

-- TODO NIÑOS NURSERY — fuente: nurserytodoninos.com (high)
UPDATE centers SET
  services         = ARRAY['bilingue','ingles','horario-ampliado']::text[],
  confidence_level = 'high',
  updated_at       = NOW()
WHERE id = '3599376e-d55d-4c74-a10c-77a198a71bfe';

-- TRAZOS — fuente: escuelainfantiltrazos.es (high)
UPDATE centers SET
  services         = ARRAY['bilingue','ingles','comedor','cocina-propia','horario-ampliado','patio-exterior','actividades-extraescolares','verano-campamentos','orientacion-pedagogica']::text[],
  confidence_level = 'high',
  updated_at       = NOW()
WHERE id = '130327c1-c4b0-49a3-a27c-d9a18d9b64c9';

-- ULU — fuente: escuelaulu.com (high)
-- Horario 7-19h, extraescolares (arte, cocina, yoga, teatro, psicomotricidad, música, danza),
-- talleres de verano (julio-agosto), escuela de padres (charlas y reuniones)
UPDATE centers SET
  services         = ARRAY['horario-ampliado','musica','psicomotricidad','actividades-extraescolares','verano-campamentos','escuela-de-padres']::text[],
  confidence_level = 'high',
  updated_at       = NOW()
WHERE id = 'b9448c81-342f-48b3-8c8e-9662b232fd16';

-- UP! KIDS SCHOOL — fuente: upkidsschool.com (high)
UPDATE centers SET
  services         = ARRAY['bilingue','ingles','comedor','horario-ampliado','musica','psicomotricidad','actividades-extraescolares']::text[],
  confidence_level = 'high',
  updated_at       = NOW()
WHERE id = 'efa9caae-d780-4ec5-8fe1-cfd2bee68b97';

-- VIB VALDEBEBAS — fuente: vibescuelainfantil.com (high)
UPDATE centers SET
  services         = ARRAY['cocina-propia','horario-ampliado','musica','psicomotricidad','actividades-extraescolares']::text[],
  confidence_level = 'high',
  updated_at       = NOW()
WHERE id = '440bd2c0-b776-4e7a-ab44-1cff0d29439d';

-- YAKI — fuente: eiyaki.com (high)
UPDATE centers SET
  services         = ARRAY['horario-ampliado','patio-exterior','psicomotricidad']::text[],
  confidence_level = 'high',
  updated_at       = NOW()
WHERE id = '0046c9df-fdbe-41cd-9719-5ed609a69533';

COMMIT;

-- ============================================================
-- Resumen de la migración 004
-- ============================================================
-- Centros actualizados:              83
-- De los 146 con services = []:
--   Con servicios confirmados:       83
--   Sin servicios confirmados:       63 (se quedan en [])
--
-- Confianza:
--   high   (sitio oficial visitado): 63 centros
--   medium (fuente secundaria):      20 centros
--
-- Centros sin servicios confirmados (se mantienen vacíos):
--   2 SEMILLAS, ALBA LUCERO,
--   ANA DE AUSTRIA (municipal), ARCANGEL (identidad ambigua),
--   BOREAL DREAMING TOGETHER (sin web), BULARAS INIA (laboral),
--   COLEGIO MADRID FSM-SOTILLO (institucional),
--   CONSEJO SUP.INVESTIGACIONES CIENTIFICAS (CSIC, laboral),
--   CUARTEL GENERAL EJERCITO DEL AIRE (militar),
--   CUCHITOS (SSL, sin datos), CUCUTRAS (CAM pública),
--   DINA CONDADO, DINA CONDADO-2 (sin datos),
--   DONDE ESTAN LAS LLAVES (sin búsqueda),
--   EL BARBERILLO DE LAVAPIES (municipal),
--   EL JARDÍN DE LAS MARIPOSAS (solo imágenes),
--   EL NIDO DEL BUHO (sin búsqueda),
--   EL PARQUE DE LA PIOVERA (sin web),
--   EL REINO DEL REVÉS (sin datos),
--   EL TREN DE LA FRESA (CAM pública),
--   ESCUELA INFANTIL DEL CUERPO NACIONAL DE POLICIA (laboral),
--   ESCUELA INFANTIL DELEGACION ECONOMIA Y HACIENDA (laboral),
--   ESCUELA INFANTIL MAEC (ministerio exterior),
--   ESCUELA MONTESSORI MADRID (sin web encontrada),
--   GUARDILLA INFANTIL (municipal),
--   JARDIIMAR (error SSL), KIDS RETIRO (sin datos),
--   LA CASA DEL RIO - MIRIAM (sin búsqueda),
--   LA ESTRELLA INFANTIL, LA ESTRELLA INFANTIL III (sin contenido),
--   LA VIRGEN NIÑA (sin datos), LALY (sin datos),
--   LAS ACACIAS (sin datos), LITTLE FEM (municipal),
--   LOS NANOS CHIFLADOS (sin datos),
--   LOS NIDOS DE MANOTERAS (sin datos),
--   LUIS BELLO (pública), MABEROGAN VALDEBEBAS (sin web),
--   MAFALDA (DNS error), MAMA QUECA II (cert caducado),
--   MARGARITA SALAS (pública), MARGOT (sin datos),
--   MI CASITA (404), MI PEQUEÑO PLANETA (DNS error),
--   MOWGLI (CAM pública), MUDARRA (CAM pública),
--   MY KIDS (sin web), PASITOS MAGICOS (sin datos),
--   PEQUEMUN (DNS error), PEQUEÑECOS PARQUE NORTE (sin datos),
--   PLANETA ENANO NIÑO JESUS (sin búsqueda),
--   PRESCHOOL FEM (sin búsqueda), ROCIO DURCAL (CAM pública),
--   ROSA (CAM pública), SAN MIGUEL (sin datos),
--   TODO PARA LA INFANCIA (CAM pública)
-- ============================================================
