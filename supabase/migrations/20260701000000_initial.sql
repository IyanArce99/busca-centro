-- =============================================================================
-- BuscaCentro — Initial schema
-- =============================================================================
-- Run with: supabase db push  (or paste into the Supabase SQL editor)
-- =============================================================================

-- ─── Extensions ───────────────────────────────────────────────────────────────
CREATE EXTENSION IF NOT EXISTS "pgcrypto";

-- ─── Helpers ──────────────────────────────────────────────────────────────────
CREATE OR REPLACE FUNCTION set_updated_at()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = now();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- =============================================================================
-- CITIES
-- =============================================================================
CREATE TABLE IF NOT EXISTS cities (
  id           UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  slug         TEXT UNIQUE NOT NULL,
  name         TEXT NOT NULL,
  province     TEXT NOT NULL,
  region       TEXT NOT NULL,
  is_featured  BOOLEAN NOT NULL DEFAULT false,
  created_at   TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at   TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS cities_slug_idx       ON cities (slug);
CREATE INDEX IF NOT EXISTS cities_is_featured_idx ON cities (is_featured) WHERE is_featured = true;

CREATE TRIGGER cities_updated_at
  BEFORE UPDATE ON cities
  FOR EACH ROW EXECUTE FUNCTION set_updated_at();

-- =============================================================================
-- CENTERS
-- =============================================================================
CREATE TABLE IF NOT EXISTS centers (
  id                 UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  slug               TEXT UNIQUE NOT NULL,
  name               TEXT NOT NULL,
  -- type: guarderia | escuela-infantil
  type               TEXT NOT NULL CHECK (type IN ('guarderia', 'escuela-infantil')),
  -- ownership: publico | privado | concertado
  ownership          TEXT NOT NULL CHECK (ownership IN ('publico', 'privado', 'concertado')),

  -- address
  street             TEXT,
  postal_code        TEXT,
  city_slug          TEXT NOT NULL REFERENCES cities (slug) ON UPDATE CASCADE,
  city_name          TEXT NOT NULL,
  neighborhood       TEXT,
  latitude           NUMERIC(10, 7),
  longitude          NUMERIC(10, 7),

  -- contact
  phone              TEXT,
  email              TEXT,
  website            TEXT,

  -- ages (stored in months for easy comparison)
  age_min_months     INTEGER NOT NULL DEFAULT 0,
  age_max_months     INTEGER NOT NULL DEFAULT 36,

  schedule           TEXT,
  -- services stored as text array: comedor, horario-ampliado, bilingue, …
  services           TEXT[] NOT NULL DEFAULT '{}',

  short_description  TEXT NOT NULL DEFAULT '',
  long_description   TEXT,
  images             TEXT[] NOT NULL DEFAULT '{}',
  -- per-center FAQ items stored as JSON array [{question, answer}]
  faqs               JSONB NOT NULL DEFAULT '[]',

  is_claimed         BOOLEAN NOT NULL DEFAULT false,
  is_verified        BOOLEAN NOT NULL DEFAULT false,
  -- status: published | draft | pending
  status             TEXT NOT NULL DEFAULT 'draft' CHECK (status IN ('published', 'draft', 'pending')),

  created_at         TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at         TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS centers_slug_idx      ON centers (slug);
CREATE INDEX IF NOT EXISTS centers_city_slug_idx ON centers (city_slug);
CREATE INDEX IF NOT EXISTS centers_type_idx      ON centers (type);
CREATE INDEX IF NOT EXISTS centers_status_idx    ON centers (status);
-- composite index for the most common SEO page query
CREATE INDEX IF NOT EXISTS centers_city_type_status_idx
  ON centers (city_slug, type, status);

CREATE TRIGGER centers_updated_at
  BEFORE UPDATE ON centers
  FOR EACH ROW EXECUTE FUNCTION set_updated_at();

-- =============================================================================
-- SEO PAGES
-- =============================================================================
CREATE TABLE IF NOT EXISTS seo_pages (
  id               UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  slug             TEXT UNIQUE NOT NULL,
  title            TEXT NOT NULL,
  h1               TEXT NOT NULL,
  subtitle         TEXT NOT NULL,
  meta_description TEXT NOT NULL,

  -- mirrors SeoPageFilters
  city_slug        TEXT NOT NULL,
  center_type      TEXT NOT NULL CHECK (center_type IN ('guarderia', 'escuela-infantil')),
  service          TEXT,
  ownership        TEXT,

  intro_text       TEXT NOT NULL DEFAULT '',
  outro_text       TEXT NOT NULL DEFAULT '',
  -- FAQ items: [{question, answer}]
  faqs             JSONB NOT NULL DEFAULT '[]',

  -- status: published | draft
  status           TEXT NOT NULL DEFAULT 'draft' CHECK (status IN ('published', 'draft')),

  created_at       TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at       TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS seo_pages_slug_idx   ON seo_pages (slug);
CREATE INDEX IF NOT EXISTS seo_pages_status_idx ON seo_pages (status);

CREATE TRIGGER seo_pages_updated_at
  BEFORE UPDATE ON seo_pages
  FOR EACH ROW EXECUTE FUNCTION set_updated_at();

-- =============================================================================
-- GUIDES (blog articles / how-to guides)
-- =============================================================================
CREATE TABLE IF NOT EXISTS guides (
  id                    UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  slug                  TEXT UNIQUE NOT NULL,
  title                 TEXT NOT NULL,
  excerpt               TEXT NOT NULL,
  -- array of paragraph strings stored as JSON
  content               JSONB NOT NULL DEFAULT '[]',
  category              TEXT NOT NULL,
  reading_time_minutes  INTEGER NOT NULL DEFAULT 5,
  -- status: published | draft
  status                TEXT NOT NULL DEFAULT 'draft' CHECK (status IN ('published', 'draft')),
  published_at          TIMESTAMPTZ,
  created_at            TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at            TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS guides_slug_idx        ON guides (slug);
CREATE INDEX IF NOT EXISTS guides_status_idx      ON guides (status);
CREATE INDEX IF NOT EXISTS guides_published_at_idx ON guides (published_at DESC NULLS LAST)
  WHERE status = 'published';

CREATE TRIGGER guides_updated_at
  BEFORE UPDATE ON guides
  FOR EACH ROW EXECUTE FUNCTION set_updated_at();

-- =============================================================================
-- FAQS (global / page-level FAQ items)
-- =============================================================================
CREATE TABLE IF NOT EXISTS faqs (
  id            UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  question      TEXT NOT NULL,
  answer        TEXT NOT NULL,
  -- context: 'global' | 'guarderias' | 'escuelas-infantiles' | center slug
  context       TEXT,
  display_order INTEGER NOT NULL DEFAULT 0,
  created_at    TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS faqs_context_idx ON faqs (context);

-- =============================================================================
-- LEADS (contact requests from parents via center detail page)
-- =============================================================================
CREATE TABLE IF NOT EXISTS leads (
  id           UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  center_slug  TEXT NOT NULL,
  name         TEXT NOT NULL,
  email        TEXT NOT NULL,
  phone        TEXT,
  message      TEXT,
  created_at   TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS leads_center_slug_idx ON leads (center_slug);
CREATE INDEX IF NOT EXISTS leads_created_at_idx  ON leads (created_at DESC);

-- =============================================================================
-- CENTER CLAIMS (center representatives claiming their listing)
-- =============================================================================
CREATE TABLE IF NOT EXISTS center_claims (
  id               UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  center_name      TEXT NOT NULL,
  center_url       TEXT NOT NULL,
  applicant_name   TEXT NOT NULL,
  applicant_role   TEXT NOT NULL,
  corporate_email  TEXT NOT NULL,
  phone            TEXT,
  website          TEXT,
  comments         TEXT,
  -- status: pending | verified | rejected
  status           TEXT NOT NULL DEFAULT 'pending' CHECK (status IN ('pending', 'verified', 'rejected')),
  created_at       TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS center_claims_status_idx     ON center_claims (status);
CREATE INDEX IF NOT EXISTS center_claims_created_at_idx ON center_claims (created_at DESC);

-- =============================================================================
-- CENTER SUBMISSIONS (new centers submitted by operators)
-- =============================================================================
CREATE TABLE IF NOT EXISTS center_submissions (
  id           UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name         TEXT NOT NULL,
  city         TEXT NOT NULL,
  address      TEXT NOT NULL,
  contact_name TEXT NOT NULL,
  email        TEXT NOT NULL,
  phone        TEXT,
  website      TEXT,
  center_type  TEXT CHECK (center_type IN ('guarderia', 'escuela-infantil')),
  age_range    TEXT,
  services     TEXT,
  comments     TEXT,
  -- status: pending | published | rejected
  status       TEXT NOT NULL DEFAULT 'pending' CHECK (status IN ('pending', 'published', 'rejected')),
  created_at   TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS center_submissions_status_idx     ON center_submissions (status);
CREATE INDEX IF NOT EXISTS center_submissions_created_at_idx ON center_submissions (created_at DESC);

-- =============================================================================
-- ROW LEVEL SECURITY
-- =============================================================================

-- Enable RLS on all tables
ALTER TABLE cities              ENABLE ROW LEVEL SECURITY;
ALTER TABLE centers             ENABLE ROW LEVEL SECURITY;
ALTER TABLE seo_pages           ENABLE ROW LEVEL SECURITY;
ALTER TABLE guides              ENABLE ROW LEVEL SECURITY;
ALTER TABLE faqs                ENABLE ROW LEVEL SECURITY;
ALTER TABLE leads               ENABLE ROW LEVEL SECURITY;
ALTER TABLE center_claims       ENABLE ROW LEVEL SECURITY;
ALTER TABLE center_submissions  ENABLE ROW LEVEL SECURITY;

-- ─── Content tables: public SELECT for published rows only ────────────────────

CREATE POLICY "cities_public_select"
  ON cities FOR SELECT
  USING (true);

CREATE POLICY "centers_public_select"
  ON centers FOR SELECT
  USING (status = 'published');

CREATE POLICY "seo_pages_public_select"
  ON seo_pages FOR SELECT
  USING (status = 'published');

CREATE POLICY "guides_public_select"
  ON guides FOR SELECT
  USING (status = 'published');

CREATE POLICY "faqs_public_select"
  ON faqs FOR SELECT
  USING (true);

-- ─── Form tables: public INSERT only, no public reads ─────────────────────────

CREATE POLICY "leads_public_insert"
  ON leads FOR INSERT
  WITH CHECK (true);

CREATE POLICY "center_claims_public_insert"
  ON center_claims FOR INSERT
  WITH CHECK (true);

CREATE POLICY "center_submissions_public_insert"
  ON center_submissions FOR INSERT
  WITH CHECK (true);

-- No SELECT / UPDATE / DELETE policies on leads, center_claims, center_submissions
-- → only service-role key (used server-side) can read/update/delete them
