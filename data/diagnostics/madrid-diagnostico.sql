-- ============================================================
-- DIAGNÓSTICO MADRID — solo lectura (SELECT). No modifica nada.
-- Ejecutar en el SQL Editor de Supabase (corre como superusuario,
-- ignora RLS, así que muestra la verdad real de la tabla).
-- ============================================================

-- 1) ¿Cuántos centros de Madrid hay y en qué estado?
--    Si aquí NO aparecen ~179 'published', el problema es de datos (status).
SELECT status, COUNT(*) AS n
FROM centers
WHERE city_slug = 'madrid'
GROUP BY status
ORDER BY n DESC;

-- 2) ¿El city_slug es exactamente 'madrid'? (por si hay variantes)
--    Detecta 'Madrid', 'madrid-capital', espacios, mayúsculas, etc.
SELECT city_slug, city_name, COUNT(*) AS n
FROM centers
WHERE city_slug ILIKE '%madrid%' OR city_name ILIKE '%madrid%'
GROUP BY city_slug, city_name
ORDER BY n DESC;

-- 3) De los Madrid 'published', ¿cuántos PASAN el gate isCenterIndexable?
--    Gate = short_description no vacío  Y  (services no vacío O long_description no vacío)
SELECT
  COUNT(*) AS total_published,
  COUNT(*) FILTER (
    WHERE COALESCE(TRIM(short_description), '') <> ''
      AND (COALESCE(array_length(services, 1), 0) > 0
           OR COALESCE(TRIM(long_description), '') <> '')
  ) AS pasan_gate_indexable,
  COUNT(*) FILTER (
    WHERE COALESCE(TRIM(short_description), '') = ''
  ) AS sin_short_description,
  COUNT(*) FILTER (
    WHERE COALESCE(array_length(services, 1), 0) = 0
      AND COALESCE(TRIM(long_description), '') = ''
  ) AS sin_services_ni_long
FROM centers
WHERE city_slug = 'madrid' AND status = 'published';

-- 4) Muestra 10 fichas de Madrid published para inspección visual
SELECT slug, name, status,
       LEFT(COALESCE(short_description, '(vacío)'), 40) AS short_desc,
       COALESCE(array_length(services, 1), 0)          AS n_services,
       (long_description IS NOT NULL
        AND TRIM(long_description) <> '')              AS tiene_long
FROM centers
WHERE city_slug = 'madrid' AND status = 'published'
ORDER BY updated_at DESC
LIMIT 10;

-- 5) CONTROL: comparar con Barcelona (que SÍ sale en el sitemap).
--    Si Barcelona da números sanos y Madrid no, confirma dónde está el corte.
SELECT city_slug, status, COUNT(*) AS n
FROM centers
WHERE city_slug IN ('madrid', 'barcelona')
GROUP BY city_slug, status
ORDER BY city_slug, n DESC;

-- 6) ¿RLS activo en la tabla y qué policies de SELECT existen?
--    Si localhost usa la ANON key, una policy de SELECT restrictiva
--    (o la ausencia de policy permisiva) ocultaría filas al rol anónimo
--    aunque en este editor SÍ se vean.
SELECT relname AS tabla, relrowsecurity AS rls_activo
FROM pg_class
WHERE relname = 'centers';

SELECT policyname, cmd, roles, qual
FROM pg_policies
WHERE tablename = 'centers'
ORDER BY cmd, policyname;
