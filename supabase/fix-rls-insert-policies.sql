-- ═══════════════════════════════════════════════════════════════════════════
-- FIX: políticas INSERT para formularios públicos
-- Ejecutar en: Supabase Dashboard → SQL Editor → Run
--
-- Idempotente: se puede ejecutar varias veces sin error.
-- No añade SELECT público — solo INSERT.
-- ═══════════════════════════════════════════════════════════════════════════

-- ─── leads ────────────────────────────────────────────────────────────────────
DROP POLICY IF EXISTS "leads_public_insert" ON public.leads;

CREATE POLICY "leads_public_insert"
  ON public.leads
  AS PERMISSIVE
  FOR INSERT
  TO anon, authenticated
  WITH CHECK (true);

-- ─── center_submissions ───────────────────────────────────────────────────────
DROP POLICY IF EXISTS "center_submissions_public_insert" ON public.center_submissions;

CREATE POLICY "center_submissions_public_insert"
  ON public.center_submissions
  AS PERMISSIVE
  FOR INSERT
  TO anon, authenticated
  WITH CHECK (true);

-- ─── center_claims ────────────────────────────────────────────────────────────
DROP POLICY IF EXISTS "center_claims_public_insert" ON public.center_claims;

CREATE POLICY "center_claims_public_insert"
  ON public.center_claims
  AS PERMISSIVE
  FOR INSERT
  TO anon, authenticated
  WITH CHECK (true);

-- ─── Verificación final ───────────────────────────────────────────────────────
-- Resultado esperado: 3 filas con cmd=INSERT, roles={anon,authenticated}
SELECT
  tablename,
  policyname,
  permissive,
  roles,
  cmd,
  with_check
FROM pg_policies
WHERE tablename IN ('leads', 'center_submissions', 'center_claims')
  AND cmd = 'INSERT'
ORDER BY tablename;
