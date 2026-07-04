-- 010_enrich_thin_centers_pass3.sql
-- Enriquecimiento pasada 3 (14 finas restantes). Solo datos confirmados en
-- fuentes publicas/oficiales o directorios verificados. Sin inventar servicios.
-- Generado: 2026-07-03. Revisar antes de ejecutar. Sin DELETE / DROP / TRUNCATE.

BEGIN;

-- ===== Centros enriquecidos (pasan a indexables) =====
-- MABEROGAN VALDEBEBAS
UPDATE centers SET name = 'Escuela Infantil Projardín Valdebebas', website = 'https://www.projardin.es/escuela-infantil-projardin-valdebebas/', phone = '910663261', services = ARRAY['comedor','cocina-propia','ingles','psicomotricidad','musica','patio-exterior','orientacion-pedagogica']::text[], pedagogical_approach = ARRAY['proyecto-propio']::text[], long_description = 'La Escuela Infantil Projardín Valdebebas es un centro privado de primer ciclo (0-3 años) situado en el barrio de Valdebebas (Hortaleza), integrado en la red de escuelas Projardín. Su programación se organiza por edades a partir del enfoque de las inteligencias múltiples. Cuenta con comedor y cocina propia, donde se elabora a diario comida casera con productos frescos y menús adaptados a alergias e intolerancias. Entre sus actividades incluye iniciación al inglés, talleres de música y un aula preparada para el trabajo de psicomotricidad, además de patio exterior con zona de juegos. Dispone también de orientación especializada en psicología educativa y seguimiento pediátrico. Los servicios y horarios concretos pueden variar por curso: conviene confirmarlos directamente con el centro.', verification_status = 'partially_verified', confidence_level = 'high', verified_at = '2026-07-03', updated_at = NOW() WHERE id = '398431aa-2fa4-43cf-8d3e-5570bb9e2506';

-- LOS NANOS CHIFLADOS
UPDATE centers SET services = ARRAY['comedor','cocina-propia','horario-ampliado']::text[], long_description = 'Los Nanos Chiflados es una escuela infantil privada de primer ciclo (0-3 años) en el barrio de Ciudad Jardín (Chamartín), gestionada por M&G Bosain. Se define por un trato cercano y familiar con las familias. Según su ficha verificada en directorios especializados, ofrece comedor con cocina propia y horario ampliado para facilitar la conciliación. Para conocer plazas, precios y el horario exacto, recomendamos contactar directamente con el centro.', verification_status = 'partially_verified', confidence_level = 'medium', verified_at = '2026-07-03', updated_at = NOW() WHERE id = '4f2ca8c2-cd7e-4028-9046-253cf659f3a0';

-- LALY
UPDATE centers SET website = 'https://www.escuelainfantillaly.es/', services = ARRAY['ingles','patio-exterior','verano-campamentos']::text[], long_description = 'La Escuela Infantil Laly es una guardería privada de primer ciclo (0-3 años) en el barrio de Nueva España (Chamartín), con más de 30 años de trayectoria. Ocupa una casa unifamiliar de dos plantas rodeada de jardín, con unos 250 m² de patio y aulas amplias y luminosas. Su propuesta incluye clases de inglés impartidas por profesionales bilingües y cursos de verano. Parte de esta información procede de fuentes públicas y directorios; recomendamos confirmar servicios y horarios directamente con el centro.', verification_status = 'partially_verified', confidence_level = 'medium', verified_at = '2026-07-03', updated_at = NOW() WHERE id = '1a67afb7-567e-427b-abef-02bc5ed31d51';

-- MARGOT
UPDATE centers SET services = ARRAY[]::text[], pedagogical_approach = ARRAY['proyecto-propio']::text[], long_description = 'El Centro Infantil Margot es una escuela de primer ciclo (0-3 años) situada en el barrio de Valdezarza (Moncloa-Aravaca). Su proyecto educativo se apoya en la crianza respetuosa, la educación positiva y el uso del baby sign (comunicación con bebés mediante signos). Los datos de esta ficha proceden de información pública del propio centro; para confirmar servicios, plazas y horarios recomendamos contactar directamente con Margot.', social_links = '{"instagram":"https://www.instagram.com/educaconsentidocomun/","facebook":"https://www.facebook.com/cimargot/"}'::jsonb, verification_status = 'partially_verified', confidence_level = 'medium', verified_at = '2026-07-03', updated_at = NOW() WHERE id = '84cc85e0-e67a-4a33-b463-87a6c0d195fa';

-- EL NIDO DEL BUHO
UPDATE centers SET website = 'https://www.elnidodelbuho.com', services = ARRAY[]::text[], long_description = 'El Nido del Búho es una escuela infantil de primer ciclo en el barrio de Arapiles (Chamberí) que funciona bajo el modelo de "madre de día": una atención en grupo reducido y de carácter familiar para los primeros años de vida. Mantiene un acuerdo de continuidad con el colegio La Salle-San Rafael. Los servicios y horarios pueden variar; recomendamos confirmarlos directamente con el centro.', verification_status = 'partially_verified', confidence_level = 'medium', verified_at = '2026-07-03', updated_at = NOW() WHERE id = '78ed5308-5c04-4f93-808d-f64d69a2b65e';

-- ===== Solo redes sociales / web (siguen NO indexables) =====
-- 2 SEMILLAS
UPDATE centers SET social_links = '{"instagram":"https://www.instagram.com/2semillas/","facebook":"https://www.facebook.com/2SemillasEscuelaInfantil"}'::jsonb, updated_at = NOW() WHERE id = '7b9517ba-29d0-4fab-a994-929e162e7cd0';

-- EL JARDÍN DE LAS MARIPOSAS
UPDATE centers SET social_links = '{"instagram":"https://www.instagram.com/eljardin_de_las_mariposas/"}'::jsonb, updated_at = NOW() WHERE id = '1839263c-81e7-4862-9faa-4ca973e3bd14';

-- MAFALDA
UPDATE centers SET social_links = '{"instagram":"https://www.instagram.com/mafaldosdechamberi/"}'::jsonb, updated_at = NOW() WHERE id = '421d8c3d-9eb7-4d79-ab38-b34608e5b5bf';

-- MY KIDS
UPDATE centers SET social_links = '{"instagram":"https://www.instagram.com/mykids.escuelainfantil/"}'::jsonb, updated_at = NOW() WHERE id = 'ffd31a56-745d-4dd9-bc6e-19b4e4a63080';

COMMIT;

-- 5 centros enriquecidos + 4 con redes.