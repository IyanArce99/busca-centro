-- ============================================================
-- MIGRACIÓN 001 — Enriquecimiento de centros educativos
-- ============================================================
-- Descripción: Añade columnas de enriquecimiento a la tabla
--              centers para soportar datos verificados, redes
--              sociales, barrios, metodología pedagógica y
--              control de calidad de datos.
--
-- Ejecutar en: Supabase SQL Editor
-- Entorno:     Producción — SOLO después de revisión
-- Seguridad:   Solo añade columnas (no elimina nada). Reversible.
-- Requisito:   No ejecutar con datos de 10 centros actualizados
--              ya aplicados; esta migración debe ir primero.
-- ============================================================

BEGIN;

-- 1. Distrito (Arganzuela, Chamberí, Hortaleza…)
--    NOTA: el campo `neighborhood` actualmente almacena el distrito
--    en los datos importados desde CSV. Esta migración añade la
--    columna correcta y migra los datos existentes.
ALTER TABLE centers
  ADD COLUMN IF NOT EXISTS district text;

-- 2. Barrio real (Acacias, Ríos Rosas, Pinar del Rey…)
--    Diferente del distrito. Se poblará con el enriquecimiento.
ALTER TABLE centers
  ADD COLUMN IF NOT EXISTS neighborhood_barrio text;

-- 3. Redes sociales (JSON flexible)
--    Estructura esperada: {"instagram": "https://...", "facebook": "https://..."}
ALTER TABLE centers
  ADD COLUMN IF NOT EXISTS social_links jsonb DEFAULT '{}';

-- 4. URL de la fuente principal usada para verificar la ficha
ALTER TABLE centers
  ADD COLUMN IF NOT EXISTS source_url text;

-- 5. URLs de fuentes secundarias consultadas
ALTER TABLE centers
  ADD COLUMN IF NOT EXISTS source_urls_secondary text[] DEFAULT '{}';

-- 6. Enfoque o metodología pedagógica detectada
--    Ejemplos: ["bilingue"], ["montessori", "aprendizaje-activo"]
ALTER TABLE centers
  ADD COLUMN IF NOT EXISTS pedagogical_approach text[] DEFAULT '{}';

-- 7. Fecha de la última verificación o enriquecimiento
ALTER TABLE centers
  ADD COLUMN IF NOT EXISTS verified_at timestamptz;

-- 8. Estado de verificación de la ficha
ALTER TABLE centers
  ADD COLUMN IF NOT EXISTS verification_status text DEFAULT 'unverified'
  CONSTRAINT centers_verification_status_check
  CHECK (verification_status IN (
    'unverified',
    'partially_verified',
    'verified',
    'pending_manual_review'
  ));

-- 9. Nivel de confianza global del conjunto de datos
ALTER TABLE centers
  ADD COLUMN IF NOT EXISTS confidence_level text DEFAULT 'unknown'
  CONSTRAINT centers_confidence_level_check
  CHECK (confidence_level IN ('unknown', 'low', 'medium', 'high'));

-- 10. Conflictos de datos pendientes de revisión manual
--     Estructura esperada:
--     {
--       "street": {
--         "current": "Calle X, 4",
--         "proposed": "Calle X, 18",
--         "reason": "La web oficial y varias fuentes indican nº18...",
--         "status": "pending_manual_review"
--       }
--     }
ALTER TABLE centers
  ADD COLUMN IF NOT EXISTS data_conflicts jsonb DEFAULT '{}';

-- ============================================================
-- MIGRACIÓN DE DATOS: poblar `district` desde `neighborhood`
-- ============================================================
-- El campo `neighborhood` de los centros de Madrid importados
-- almacena el nombre del distrito (Arganzuela, Chamberí…).
-- Lo copiamos a la columna correcta `district`.
-- NO borramos `neighborhood` aún para mantener compatibilidad.
UPDATE centers
  SET district = neighborhood
  WHERE city_slug = 'madrid'
    AND district IS NULL
    AND neighborhood IS NOT NULL;

-- ============================================================
-- ÍNDICES
-- ============================================================
CREATE INDEX IF NOT EXISTS idx_centers_district
  ON centers (district);

CREATE INDEX IF NOT EXISTS idx_centers_verification_status
  ON centers (verification_status);

COMMIT;

-- ============================================================
-- ROLLBACK (ejecutar si hay que deshacer esta migración)
-- ============================================================
-- BEGIN;
-- ALTER TABLE centers
--   DROP COLUMN IF EXISTS district,
--   DROP COLUMN IF EXISTS neighborhood_barrio,
--   DROP COLUMN IF EXISTS social_links,
--   DROP COLUMN IF EXISTS source_url,
--   DROP COLUMN IF EXISTS source_urls_secondary,
--   DROP COLUMN IF EXISTS pedagogical_approach,
--   DROP COLUMN IF EXISTS verified_at,
--   DROP COLUMN IF EXISTS verification_status,
--   DROP COLUMN IF EXISTS confidence_level,
--   DROP COLUMN IF EXISTS data_conflicts;
-- DROP INDEX IF EXISTS idx_centers_district;
-- DROP INDEX IF EXISTS idx_centers_verification_status;
-- COMMIT;
