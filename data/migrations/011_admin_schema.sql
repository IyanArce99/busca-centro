-- 011_admin_schema.sql
-- Esquema necesario para completar el panel de administración (Fase 2):
-- notas internas por centro y seguimiento de estado/origen en leads.
-- No destructivo: solo CREATE TABLE / ALTER TABLE ADD COLUMN IF NOT EXISTS.
-- Generado: 2026-07-04. Revisar antes de ejecutar. NO EJECUTAR SIN CONFIRMACION.

BEGIN;

-- ===== admin_notes =====
-- Notas internas del equipo sobre un centro (no visibles públicamente).
CREATE TABLE IF NOT EXISTS admin_notes (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  center_id UUID NOT NULL REFERENCES centers(id) ON DELETE CASCADE,
  note TEXT NOT NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  created_by TEXT
);

CREATE INDEX IF NOT EXISTS idx_admin_notes_center_id ON admin_notes(center_id);

-- ===== leads: columnas de gestión =====
-- La tabla ya existe (id, center_slug, name, email, phone, message, created_at).
-- Se añaden columnas de estado/origen/consentimiento/UTM para poder gestionarlos
-- desde /admin/leads sin tocar las columnas existentes.
ALTER TABLE leads ADD COLUMN IF NOT EXISTS status TEXT NOT NULL DEFAULT 'nuevo';
ALTER TABLE leads ADD COLUMN IF NOT EXISTS lead_type TEXT;
ALTER TABLE leads ADD COLUMN IF NOT EXISTS origin TEXT;
ALTER TABLE leads ADD COLUMN IF NOT EXISTS privacy_consent BOOLEAN NOT NULL DEFAULT false;
ALTER TABLE leads ADD COLUMN IF NOT EXISTS utm_source TEXT;
ALTER TABLE leads ADD COLUMN IF NOT EXISTS utm_medium TEXT;
ALTER TABLE leads ADD COLUMN IF NOT EXISTS utm_campaign TEXT;
ALTER TABLE leads ADD COLUMN IF NOT EXISTS internal_note TEXT;

CREATE INDEX IF NOT EXISTS idx_leads_status ON leads(status);

COMMIT;

-- Tras aplicar esta migración, regenerar src/types/database.ts a mano para
-- reflejar las columnas nuevas (status, lead_type, origin, privacy_consent,
-- utm_source, utm_medium, utm_campaign, internal_note en `leads`; tabla
-- `admin_notes` completa) antes de construir la Fase 2 de /admin/leads.
