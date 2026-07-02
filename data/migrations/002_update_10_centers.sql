-- ============================================================
-- UPDATE 002 — Actualización de 10 centros de prueba (Madrid)
-- ============================================================
-- REQUIERE: 001_enrich_centers.sql ya ejecutado en Supabase.
--
-- QUÉ HACE:
--   Actualiza solo los 10 centros listados, por UUID exacto.
--   Solo modifica los campos de la columna SET.
--   No toca: id, slug, city_slug, status, is_verified,
--             is_claimed, latitude, longitude, name, faqs.
--
-- NEMOMARLIN: la calle NO se cambia.
--   El conflicto (nº4 vs nº18) queda en data_conflicts
--   con status=pending_manual_review para revisión manual.
--
-- Seguridad:
--   - Todo dentro de una transacción. Si algún UPDATE falla
--     (p.ej. valor de CHECK constraint no válido), se hace
--     ROLLBACK completo y ningún centro queda a medias.
--   - Puedes hacer ROLLBACK manual antes del COMMIT si
--     quieres cancelar tras revisión.
-- ============================================================

BEGIN;

-- ── 1. ALEGRE KOALA ──────────────────────────────────────────
-- Cambios: barrio, distrito, horario, edades, servicios,
--          descripción, fuentes, estado verificación
UPDATE centers SET
  neighborhood_barrio   = 'Acacias',
  district              = 'Arganzuela',
  schedule              = 'Lunes a viernes de 7:30 a 17:30',
  age_min_months        = 0,
  age_max_months        = 72,
  services              = ARRAY['comedor','horario-ampliado','ingles'],
  short_description     = 'Escuela infantil privada ubicada en el barrio de Acacias, distrito Arganzuela. El centro imparte el primer y segundo ciclo de educación infantil en un entorno accesible desde la estación de metro Acacias. No dispone de web oficial conocida; la información proviene de directorios públicos.',
  source_url            = 'https://www.micole.net/madrid/madrid/escuela-infantil-alegre-koala',
  source_urls_secondary = ARRAY[
    'https://www.madrid.es/portales/munimadrid/es/Inicio/Educacion-y-empleo/Educacion/Direcciones-y-telefonos/Escuela-Infantil-Alegre-Koala/',
    'https://www.buscocolegio.com/School/school-details.action?id=28061602',
    'https://infoguarderias.com/guarderias-madrid/alegre-koala-escuela-infantil/'
  ],
  verification_status   = 'partially_verified',
  confidence_level      = 'low',
  verified_at           = '2026-07-02T00:00:00Z',
  updated_at            = NOW()
WHERE id = '81bef1fb-58ae-40c8-a323-058c1f917e9d';

-- ── 2. PIPO'S ────────────────────────────────────────────────
-- Cambios: email (oficial vs gmail), website (bug: era un email),
--          barrio, distrito, servicios, Facebook, descripción, fuentes
UPDATE centers SET
  email                 = 'info@escuelainfantilpipos.es',
  website               = 'https://www.escuelainfantilpipos.es',
  neighborhood_barrio   = 'La Chopera',
  district              = 'Arganzuela',
  age_min_months        = 0,
  age_max_months        = 72,
  services              = ARRAY['comedor','horario-ampliado','ingles','musica','psicomotricidad','actividades-extraescolares'],
  social_links          = '{"facebook": "https://www.facebook.com/Escuela.Infantil.Pipos"}'::jsonb,
  short_description     = 'Escuela infantil privada sin concierto, con autorización definitiva desde 1978, ubicada en el barrio de La Chopera, distrito Arganzuela. Ofrece comedor con servicio de catering externo, clases de inglés, música, psicomotricidad y actividades extraescolares. Atiende el primer y segundo ciclo de educación infantil (0 a 6 años).',
  source_url            = 'https://www.escuelainfantilpipos.es',
  source_urls_secondary = ARRAY[
    'https://www.micole.net/madrid/madrid/escuela-infantil-pipos-1',
    'https://www.madrid.es/portales/munimadrid/es/Inicio/Educacion-y-empleo/Educacion/Direcciones-y-telefonos/Escuela-Infantil-Pipo-s-Calle-Caceres/'
  ],
  verification_status   = 'partially_verified',
  confidence_level      = 'high',
  verified_at           = '2026-07-02T00:00:00Z',
  updated_at            = NOW()
WHERE id = '49e1fb72-4b07-4bec-b52d-6d53fc3f66fa';

-- ── 3. VERBO ENCARNADO ───────────────────────────────────────
-- Cambios: type (guarderia→escuela-infantil), ownership (→concertado),
--          email, website (URL 404 → activa), barrio, distrito,
--          edades, servicios, metodología, descripción, fuentes
UPDATE centers SET
  type                  = 'escuela-infantil',
  ownership             = 'concertado',
  email                 = 'vemad@planalfa.es',
  website               = 'https://verboencarnado.es',
  neighborhood_barrio   = 'Ríos Rosas',
  district              = 'Chamberí',
  age_min_months        = 12,
  age_max_months        = 72,
  services              = ARRAY['comedor','cocina-propia','horario-ampliado','verano-campamentos'],
  pedagogical_approach  = ARRAY['orientacion-pedagogica'],
  short_description     = 'Centro de educación infantil concertado de inspiración católica, ubicado en el barrio de Ríos Rosas, distrito Chamberí. Imparte el primer y segundo ciclo de educación infantil (de 1 a 6 años aproximadamente). Dispone de comedor con cocina propia y horario ampliado. La ficha está pendiente de verificación por parte del centro.',
  source_url            = 'https://verboencarnado.es',
  source_urls_secondary = ARRAY[
    'https://www.micole.net/madrid/madrid/escuela-infantil-verbo-encarnado',
    'https://www.guarderia.net/guarderia/escuela-infantil-verbo-encarnado'
  ],
  verification_status   = 'partially_verified',
  confidence_level      = 'medium',
  verified_at           = '2026-07-02T00:00:00Z',
  updated_at            = NOW()
WHERE id = '843c6622-c091-4b26-b069-b0764200ecb5';

-- ── 4. EL ALBA ───────────────────────────────────────────────
-- Cambios: email, website (URL 404 → activa), barrio, distrito,
--          age_max (0-3 años), horario, servicios, Facebook, descripción, fuentes
UPDATE centers SET
  email                 = 'eielalba@madrid.es',
  website               = 'https://elalbaescuela.es',
  neighborhood_barrio   = 'Acacias',
  district              = 'Arganzuela',
  age_min_months        = 0,
  age_max_months        = 36,
  schedule              = 'Lunes a viernes de 9:00 a 16:00; horario ampliado de 7:00 a 9:00 y de 16:00 a 17:30',
  services              = ARRAY['comedor','cocina-propia','horario-ampliado','psicomotricidad','musica'],
  pedagogical_approach  = ARRAY['orientacion-pedagogica'],
  social_links          = '{"facebook": "https://www.facebook.com/albaescuelainfantil"}'::jsonb,
  short_description     = 'Escuela infantil municipal perteneciente a la Red Municipal de Escuelas Infantiles del Ayuntamiento de Madrid, ubicada en el barrio de Acacias, distrito Arganzuela. Atiende el primer ciclo de educación infantil (0 a 3 años) y cuenta con servicio de comedor con cocina propia, horario ampliado y actividades de psicomotricidad y música.',
  source_url            = 'https://elalbaescuela.es',
  source_urls_secondary = ARRAY[
    'https://www.madrid.es/portales/munimadrid/es/Inicio/El-Ayuntamiento/Arganzuela/Direcciones-y-telefonos/Escuela-infantil-municipal-El-Alba/',
    'https://www.comunidad.madrid/centros/escuela-educacion-infantil-alba',
    'https://www.colesyguardes.es/guarderia/el-alba/140'
  ],
  verification_status   = 'partially_verified',
  confidence_level      = 'high',
  verified_at           = '2026-07-02T00:00:00Z',
  updated_at            = NOW()
WHERE id = '4fb5d8d8-d11c-431f-8acc-73cc33ec1e53';

-- ── 5. PARQUE DE HORTALEZA ───────────────────────────────────
-- Cambios: website (URL redirección → destino final), barrio,
--          distrito, age_max (0-3), servicios, descripción, fuentes
UPDATE centers SET
  website               = 'http://www.educa2.madrid.org/web/centro.eei.parquehortaleza.madrid',
  neighborhood_barrio   = 'Pinar del Rey',
  district              = 'Hortaleza',
  age_min_months        = 0,
  age_max_months        = 36,
  services              = ARRAY['comedor','horario-ampliado','ingles','escuela-de-padres'],
  short_description     = 'Escuela de educación infantil pública de la Comunidad de Madrid, ubicada en el barrio de Pinar del Rey, distrito Hortaleza. Atiende el primer ciclo de educación infantil (0 a 3 años) y cuenta con comedor, horario ampliado e inglés. El centro dispone de huerto escolar y programa de escuela de familias.',
  source_url            = 'http://www.educa2.madrid.org/web/centro.eei.parquehortaleza.madrid',
  source_urls_secondary = ARRAY[
    'https://www.comunidad.madrid/centros/escuela-educacion-infantil-parque-hortaleza',
    'https://www.micole.net/madrid/madrid/escuela-infantil-parque-de-hortaleza',
    'https://www.colesyguardes.es/escuelas-infantiles/parque-de-hortaleza/'
  ],
  verification_status   = 'partially_verified',
  confidence_level      = 'medium',
  verified_at           = '2026-07-02T00:00:00Z',
  updated_at            = NOW()
WHERE id = '375bcd5b-f1ad-421d-a62e-33671df573ba';

-- ── 6. FERNANDO EL CATÓLICO ──────────────────────────────────
-- Cambios: barrio, distrito, age_max, horario,
--          servicios ampliados, descripción, fuentes
UPDATE centers SET
  neighborhood_barrio   = 'Gaztambide',
  district              = 'Chamberí',
  age_min_months        = 0,
  age_max_months        = 36,
  schedule              = 'Lunes a viernes de 9:00 a 16:00; horario ampliado de 7:00 a 9:00 y de 16:00 a 18:00; abierto hasta julio, agosto con demanda suficiente',
  services              = ARRAY['comedor','horario-ampliado','ingles','psicomotricidad','musica','escuela-de-padres','patio-exterior'],
  short_description     = 'Escuela infantil pública de la Comunidad de Madrid, ubicada en la calle Fernando el Católico, distrito Chamberí. Atiende el primer ciclo (0 a 3 años) con servicio de comedor, horario ampliado, inglés nativo, psicomotricidad, música y patio exterior con jardín. El centro comparte edificio con el CEIP Fernando el Católico.',
  source_url            = 'https://www.colesyguardes.es/guarderia/fernando-el-catlico/163',
  source_urls_secondary = ARRAY[
    'https://www.madrid.es/portales/munimadrid/es/Inicio/Educacion-y-empleo/Educacion/Direcciones-y-telefonos/Escuela-Infantil-Algo/'
  ],
  verification_status   = 'partially_verified',
  confidence_level      = 'medium',
  verified_at           = '2026-07-02T00:00:00Z',
  updated_at            = NOW()
WHERE id = '674b04e9-fef5-4432-a4fc-338aad58acc7';

-- ── 7. NEMOMARLIN ARGANZUELA ─────────────────────────────────
-- ATENCIÓN: la calle (nº4) NO se modifica.
-- El conflicto nº4 vs nº18 queda en data_conflicts.
-- verification_status = pending_manual_review por este motivo.
-- Cambios: website (dominio inactivo → activo), barrio, distrito,
--          age_max, horario, servicios, metodología, redes sociales,
--          descripción, fuentes, data_conflicts con conflicto de calle
UPDATE centers SET
  website               = 'https://www.escuelanemomarlin.com',
  neighborhood_barrio   = 'Acacias',
  district              = 'Arganzuela',
  age_min_months        = 0,
  age_max_months        = 36,
  schedule              = 'Lunes a viernes de 9:00 a 17:00; horario ampliado de 7:00 a 9:00 y de 17:00 a 21:00; abierto todo el año',
  services              = ARRAY['comedor','cocina-propia','horario-ampliado','bilingue','psicomotricidad','verano-campamentos','orientacion-pedagogica'],
  pedagogical_approach  = ARRAY['aprendizaje-activo'],
  social_links          = '{"instagram": "https://www.instagram.com/escuelasinfantilesnemomarlin/", "facebook": "https://www.facebook.com/EscuelaInfantilNemomarlin"}'::jsonb,
  short_description     = 'Escuela infantil privada bilingüe (español-inglés) ubicada en el barrio de Acacias, distrito Arganzuela. Aplica una metodología basada en las Inteligencias Múltiples y cuenta con cocina propia, horario muy ampliado (7:00 a 21:00), campamentos de verano y acceso mediante webcam para las familias. Atiende el primer ciclo de educación infantil (0 a 3 años).',
  source_url            = 'https://www.escuelanemomarlin.com/escuelas/escuela-infantil-arganzuela/',
  source_urls_secondary = ARRAY[
    'https://www.colesyguardes.es/guarderia/nemomarlin-arganzuela/292',
    'https://www.micole.net/madrid/madrid/escuela-infantil-nemomarlin-arganzuela'
  ],
  verification_status   = 'pending_manual_review',
  confidence_level      = 'high',
  verified_at           = '2026-07-02T00:00:00Z',
  data_conflicts        = '{"street": {"current": "Calle de Carmen Cobeña, 4", "proposed": "Calle de Carmen Cobeña, 18", "reason": "La web oficial del centro y múltiples directorios (micole.net, colesyguardes.es) indican el número 18. La DB registra el número 4. Posible error en la importación original del CSV. Requiere verificación presencial o llamada al centro.", "status": "pending_manual_review"}}'::jsonb,
  updated_at            = NOW()
WHERE id = 'f8909853-cf9e-434e-8951-3ed004176dcb';

-- ── 8. ST. ALICE'S NURSERY ───────────────────────────────────
-- Cambios: website (dominio inactivo → stalices.es), barrio, distrito,
--          age_max, horario anual, servicios, metodología 8MINDS,
--          Instagram, descripción, fuentes
UPDATE centers SET
  website               = 'https://stalices.es',
  neighborhood_barrio   = 'Almagro',
  district              = 'Chamberí',
  age_min_months        = 0,
  age_max_months        = 36,
  schedule              = 'Abierto todos los días laborables del año, incluido agosto y navidades',
  services              = ARRAY['comedor','horario-ampliado','bilingue','orientacion-pedagogica'],
  pedagogical_approach  = ARRAY['bilingue','8minds'],
  social_links          = '{"instagram": "https://www.instagram.com/st.alices_nursery/"}'::jsonb,
  short_description     = 'Escuela infantil privada bilingüe (español-inglés) ubicada en el barrio de Almagro, distrito Chamberí. El proyecto educativo 8MINDS se basa en la teoría de las Inteligencias Múltiples de Gardner y el inglés se integra en todas las rutinas diarias mediante metodología Jolly Phonics. Atiende el primer ciclo (0 a 3 años) y permanece abierta todo el año.',
  source_url            = 'https://stalices.es',
  source_urls_secondary = ARRAY[
    'https://www.buscocolegio.com/School/school-details.action?id=28073987',
    'https://www.colesyguardes.es/escuelas-infantiles/st-alices-nursery-fernandez-de-la-hoz/'
  ],
  verification_status   = 'partially_verified',
  confidence_level      = 'high',
  verified_at           = '2026-07-02T00:00:00Z',
  updated_at            = NOW()
WHERE id = 'a41cfb3d-e7d6-4c1b-8122-41295776a71c';

-- ── 9. OLAVIDE ───────────────────────────────────────────────
-- Cambios: email (uppercase → minúsculas), barrio, distrito,
--          age_max, horario, servicios ampliados, metodología,
--          Instagram + Facebook, descripción, fuentes
UPDATE centers SET
  email                 = 'direccion@escuelaolavide.com',
  neighborhood_barrio   = 'Trafalgar',
  district              = 'Chamberí',
  age_min_months        = 0,
  age_max_months        = 36,
  schedule              = 'Lunes a viernes de 9:00 a 16:00; horario ampliado de 7:30 a 9:00 y de 16:00 a 19:30 sin recargo; abierto todo el año',
  services              = ARRAY['comedor','horario-ampliado','ingles','musica','psicomotricidad','actividades-extraescolares','orientacion-pedagogica'],
  pedagogical_approach  = ARRAY['aprendizaje-activo'],
  social_links          = '{"instagram": "https://www.instagram.com/escuelaolavide/", "facebook": "https://www.facebook.com/escuelaolavide/"}'::jsonb,
  short_description     = 'Escuela infantil privada con más de 35 años de historia, ubicada junto a la Plaza de Olavide en el barrio de Trafalgar, distrito Chamberí. Ofrece inglés, música, psicomotricidad y chino como actividades incluidas en la cuota, horario muy ampliado (7:30 a 19:30) sin recargo adicional, y permanece abierta todo el año. Atiende el primer ciclo de educación infantil (0 a 3 años).',
  source_url            = 'https://www.colesyguardes.es/guarderia/olavide/72',
  source_urls_secondary = ARRAY[
    'https://www.micole.net/madrid/madrid/escuela-infantil-olavide',
    'https://www.instagram.com/escuelaolavide/',
    'https://www.facebook.com/escuelaolavide/'
  ],
  verification_status   = 'partially_verified',
  confidence_level      = 'high',
  verified_at           = '2026-07-02T00:00:00Z',
  updated_at            = NOW()
WHERE id = 'e82f1941-c68a-4ddd-a8e6-0c6d56a77c7f';

-- ── 10. ALARIA BERNABÉU ──────────────────────────────────────
-- Cambios: barrio, distrito, age_min (4 meses), age_max (hasta 6 años),
--          horario todo el año, servicios completos,
--          metodología bilingüe, Instagram, descripción, fuentes
UPDATE centers SET
  neighborhood_barrio   = 'El Viso',
  district              = 'Chamartín',
  age_min_months        = 4,
  age_max_months        = 72,
  schedule              = 'Lunes a viernes de 7:30 a 19:00; abierto todo el año incluido julio, agosto, navidades y semana santa',
  services              = ARRAY['comedor','cocina-propia','horario-ampliado','bilingue','patio-exterior','psicomotricidad','musica','verano-campamentos','uniformes','orientacion-pedagogica','actividades-extraescolares'],
  pedagogical_approach  = ARRAY['bilingue'],
  social_links          = '{"instagram": "https://www.instagram.com/alariaescuelasinfantilesmadrid/"}'::jsonb,
  short_description     = 'Escuela infantil y de primer ciclo bilingüe (español-inglés) ubicada en la Colonia de El Viso, distrito Chamartín, junto al Estadio Santiago Bernabéu. Cuenta con cocina propia, jardines de más de 200 m², horario muy ampliado (7:30 a 19:00) incluido en la cuota, y permanece abierta todo el año. Atiende desde los 4 meses hasta los 6 años y aplica una metodología de Inteligencias Múltiples con certificación Trinity College de inglés.',
  source_url            = 'https://www.alariaescuelasinfantiles.es/alaria-bernabeu/',
  source_urls_secondary = ARRAY[
    'https://www.colesyguardes.es/guarderia/alaria-bernabu-escuela-infantil/1077',
    'https://www.madrid.es/portales/munimadrid/es/Inicio/Infancia-y-familia/Direcciones-y-telefonos/Escuela-Infantil-Alaria-Bernabeu-Nursery-School/'
  ],
  verification_status   = 'partially_verified',
  confidence_level      = 'high',
  verified_at           = '2026-07-02T00:00:00Z',
  updated_at            = NOW()
WHERE id = '698058e0-e2c0-4bd5-b324-f4441ab4bbf8';

COMMIT;

-- ============================================================
-- VERIFICACIÓN post-apply (ejecutar después del COMMIT)
-- ============================================================
-- SELECT id, slug, name, type, ownership, district,
--        neighborhood_barrio, website, email,
--        verification_status, confidence_level, verified_at,
--        array_length(services, 1) AS num_servicios,
--        data_conflicts
-- FROM centers
-- WHERE id IN (
--   '81bef1fb-58ae-40c8-a323-058c1f917e9d',
--   '49e1fb72-4b07-4bec-b52d-6d53fc3f66fa',
--   '843c6622-c091-4b26-b069-b0764200ecb5',
--   '4fb5d8d8-d11c-431f-8acc-73cc33ec1e53',
--   '375bcd5b-f1ad-421d-a62e-33671df573ba',
--   '674b04e9-fef5-4432-a4fc-338aad58acc7',
--   'f8909853-cf9e-434e-8951-3ed004176dcb',
--   'a41cfb3d-e7d6-4c1b-8122-41295776a71c',
--   'e82f1941-c68a-4ddd-a8e6-0c6d56a77c7f',
--   '698058e0-e2c0-4bd5-b324-f4441ab4bbf8'
-- )
-- ORDER BY name;
