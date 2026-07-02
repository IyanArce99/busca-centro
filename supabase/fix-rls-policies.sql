-- Fix: add public INSERT policies for form tables.
-- The tables already exist (created via migration) but the INSERT policies
-- were not applied because `supabase db push` requires CLI login.
--
-- Paste this entire file into:
-- Supabase Dashboard → SQL Editor → New query → Run
--
-- Safe to run multiple times (IF NOT EXISTS / DROP IF EXISTS guards).

-- leads -----------------------------------------------------------------------
DROP POLICY IF EXISTS "leads_public_insert" ON leads;
CREATE POLICY "leads_public_insert"
  ON leads FOR INSERT
  WITH CHECK (true);

-- center_submissions ----------------------------------------------------------
DROP POLICY IF EXISTS "center_submissions_public_insert" ON center_submissions;
CREATE POLICY "center_submissions_public_insert"
  ON center_submissions FOR INSERT
  WITH CHECK (true);

-- center_claims ---------------------------------------------------------------
DROP POLICY IF EXISTS "center_claims_public_insert" ON center_claims;
CREATE POLICY "center_claims_public_insert"
  ON center_claims FOR INSERT
  WITH CHECK (true);

-- Verify: list all policies on form tables
SELECT tablename, policyname, cmd, qual
FROM pg_policies
WHERE tablename IN ('leads', 'center_submissions', 'center_claims')
ORDER BY tablename, policyname;
