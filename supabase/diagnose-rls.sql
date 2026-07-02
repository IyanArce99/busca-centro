-- ═══════════════════════════════════════════════════════════════════════════
-- DIAGNÓSTICO RLS — ejecutar en Supabase Dashboard → SQL Editor
-- ═══════════════════════════════════════════════════════════════════════════

-- 1. ¿Qué políticas existen en las tres tablas?
--    Resultado esperado: 3 filas, cmd='INSERT', with_check='true'
SELECT
  tablename,
  policyname,
  permissive,
  roles,        -- vacío = PUBLIC (todos los roles)
  cmd,
  qual,         -- condición USING (solo SELECT/UPDATE/DELETE)
  with_check    -- condición WITH CHECK (INSERT/UPDATE)
FROM pg_policies
WHERE tablename IN ('leads', 'center_submissions', 'center_claims')
ORDER BY tablename, cmd, policyname;

-- 2. ¿RLS está habilitada en las tres tablas?
--    Resultado esperado: rowsecurity = true en los 3
SELECT
  relname  AS table_name,
  relrowsecurity AS rls_enabled,
  relforcerowsecurity AS rls_forced
FROM pg_class
WHERE relname IN ('leads', 'center_submissions', 'center_claims')
  AND relnamespace = 'public'::regnamespace;

-- 3. ¿Qué privilegios tiene el rol anon sobre esas tablas?
--    INSERT debe aparecer en privilege_type
SELECT
  grantee,
  table_name,
  privilege_type
FROM information_schema.role_table_grants
WHERE table_name IN ('leads', 'center_submissions', 'center_claims')
  AND grantee IN ('anon', 'authenticated', 'public', 'service_role')
ORDER BY table_name, grantee, privilege_type;

-- 4. Simular un INSERT como el rol anon (prueba directa)
--    Si devuelve error RLS → la política no está activa para anon
--    Si devuelve éxito     → el problema era el .select() tras insert (RETURNING)
SET LOCAL ROLE anon;
INSERT INTO public.leads (center_slug, name, email, message)
VALUES ('diag-test', 'Diagnóstico', 'diag@test.local', 'Prueba diagnóstico — borrar')
RETURNING id;
RESET ROLE;

-- Si el INSERT anterior funcionó, bórralo:
-- DELETE FROM public.leads WHERE email = 'diag@test.local';
