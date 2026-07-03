-- ROLLBACK 006 — Restaura los centros "finos" a su estado previo
-- Generado: 2026-07-03

BEGIN;

UPDATE centers SET
  services            = ARRAY[]::text[],
  long_description    = NULL,
  pedagogical_approach = ARRAY[]::text[],
  schedule            = NULL,
  verification_status = 'partially_verified',
  confidence_level    = 'medium',
  updated_at          = NOW()
WHERE id = 'd0cf3120-bbf4-4207-a85a-1f616f1c951b';

UPDATE centers SET
  services            = ARRAY[]::text[],
  long_description    = NULL,
  pedagogical_approach = ARRAY[]::text[],
  schedule            = NULL,
  verification_status = 'partially_verified',
  confidence_level    = 'medium',
  updated_at          = NOW()
WHERE id = '0d88e41b-fdb8-4d20-8cb5-f75f3efe609b';

UPDATE centers SET
  services            = ARRAY[]::text[],
  long_description    = NULL,
  pedagogical_approach = ARRAY[]::text[],
  schedule            = NULL,
  verification_status = 'partially_verified',
  confidence_level    = 'medium',
  updated_at          = NOW()
WHERE id = 'a38e2b2e-c080-4906-9b86-90ed0f79b07c';

UPDATE centers SET
  services            = ARRAY[]::text[],
  long_description    = NULL,
  pedagogical_approach = ARRAY[]::text[],
  schedule            = NULL,
  verification_status = 'pending_manual_review',
  confidence_level    = 'medium',
  updated_at          = NOW()
WHERE id = '9038eb6c-8ab3-4614-8faf-90439fee4a8b';

UPDATE centers SET
  services            = ARRAY[]::text[],
  long_description    = NULL,
  pedagogical_approach = ARRAY[]::text[],
  schedule            = NULL,
  verification_status = 'partially_verified',
  confidence_level    = 'medium',
  updated_at          = NOW()
WHERE id = 'c71ac4d7-6f24-447e-a355-5a5153139676';

UPDATE centers SET
  services            = ARRAY[]::text[],
  long_description    = NULL,
  pedagogical_approach = ARRAY[]::text[],
  schedule            = NULL,
  verification_status = 'partially_verified',
  confidence_level    = 'medium',
  updated_at          = NOW()
WHERE id = '242aa7ba-3c90-4b31-8c3a-3338f154d2c1';

UPDATE centers SET
  services            = ARRAY[]::text[],
  long_description    = NULL,
  pedagogical_approach = ARRAY[]::text[],
  schedule            = NULL,
  verification_status = 'partially_verified',
  confidence_level    = 'medium',
  updated_at          = NOW()
WHERE id = '5a2d153b-8a20-4438-9d11-eb083ac59ef2';

UPDATE centers SET
  services            = ARRAY[]::text[],
  long_description    = NULL,
  pedagogical_approach = ARRAY[]::text[],
  schedule            = NULL,
  verification_status = 'partially_verified',
  confidence_level    = 'medium',
  updated_at          = NOW()
WHERE id = '5469eeb5-dc48-46b2-a0ff-8c59eb832c4e';

UPDATE centers SET
  services            = ARRAY[]::text[],
  long_description    = NULL,
  pedagogical_approach = ARRAY[]::text[],
  schedule            = NULL,
  verification_status = 'partially_verified',
  confidence_level    = 'medium',
  updated_at          = NOW()
WHERE id = '98e7d76c-ea25-42a4-b796-1d1ecacc3970';

UPDATE centers SET
  services            = ARRAY[]::text[],
  long_description    = NULL,
  pedagogical_approach = ARRAY[]::text[],
  schedule            = NULL,
  verification_status = 'pending_manual_review',
  confidence_level    = 'medium',
  updated_at          = NOW()
WHERE id = '7cce9d1a-4a72-456c-9019-4f2157443aa3';

UPDATE centers SET
  services            = ARRAY[]::text[],
  long_description    = NULL,
  pedagogical_approach = ARRAY[]::text[],
  schedule            = NULL,
  verification_status = 'partially_verified',
  confidence_level    = 'medium',
  updated_at          = NOW()
WHERE id = '72062e3f-8483-4aae-9be8-c69e7e58c6ba';

UPDATE centers SET
  services            = ARRAY[]::text[],
  long_description    = NULL,
  pedagogical_approach = ARRAY[]::text[],
  schedule            = NULL,
  verification_status = 'partially_verified',
  confidence_level    = 'medium',
  updated_at          = NOW()
WHERE id = '6e0bf701-b1d1-47d9-b91b-723d1d8499a0';

UPDATE centers SET
  services            = ARRAY[]::text[],
  long_description    = NULL,
  pedagogical_approach = ARRAY[]::text[],
  schedule            = NULL,
  verification_status = 'partially_verified',
  confidence_level    = 'medium',
  updated_at          = NOW()
WHERE id = '7bf3662e-c52c-4ec0-a02f-6fd73ab38e1c';

UPDATE centers SET
  services            = ARRAY[]::text[],
  long_description    = NULL,
  pedagogical_approach = ARRAY[]::text[],
  schedule            = NULL,
  verification_status = 'partially_verified',
  confidence_level    = 'medium',
  updated_at          = NOW()
WHERE id = '260a708d-6036-44ef-927b-a502fe4c38eb';

UPDATE centers SET
  services            = ARRAY[]::text[],
  long_description    = NULL,
  pedagogical_approach = ARRAY[]::text[],
  schedule            = NULL,
  verification_status = 'pending_manual_review',
  confidence_level    = 'medium',
  updated_at          = NOW()
WHERE id = 'bed55563-8a3f-4e45-96b6-20159ceecfb8';

UPDATE centers SET
  services            = ARRAY[]::text[],
  long_description    = NULL,
  pedagogical_approach = ARRAY[]::text[],
  schedule            = NULL,
  verification_status = 'pending_manual_review',
  confidence_level    = 'medium',
  updated_at          = NOW()
WHERE id = 'e50dbc69-9f18-4868-b384-857c2e848910';

UPDATE centers SET
  services            = ARRAY[]::text[],
  long_description    = NULL,
  pedagogical_approach = ARRAY[]::text[],
  schedule            = NULL,
  verification_status = 'pending_manual_review',
  confidence_level    = 'medium',
  updated_at          = NOW()
WHERE id = '3746a619-9c08-433e-bf15-51a32d8db0ae';

UPDATE centers SET
  services            = ARRAY[]::text[],
  long_description    = NULL,
  pedagogical_approach = ARRAY[]::text[],
  schedule            = NULL,
  verification_status = 'partially_verified',
  confidence_level    = 'medium',
  updated_at          = NOW()
WHERE id = 'ebc0572d-c29e-488a-8ea4-9a11d810a48b';

UPDATE centers SET
  services            = ARRAY[]::text[],
  long_description    = NULL,
  pedagogical_approach = ARRAY[]::text[],
  schedule            = NULL,
  verification_status = 'partially_verified',
  confidence_level    = 'medium',
  updated_at          = NOW()
WHERE id = 'd45d9ea8-6532-4244-938f-49d639038bb9';

UPDATE centers SET
  services            = ARRAY[]::text[],
  long_description    = NULL,
  pedagogical_approach = ARRAY[]::text[],
  schedule            = NULL,
  verification_status = 'partially_verified',
  confidence_level    = 'medium',
  updated_at          = NOW()
WHERE id = 'bc6d4257-32f4-4138-804d-0205ec100804';

UPDATE centers SET
  services            = ARRAY[]::text[],
  long_description    = NULL,
  pedagogical_approach = ARRAY[]::text[],
  schedule            = NULL,
  verification_status = 'partially_verified',
  confidence_level    = 'medium',
  updated_at          = NOW()
WHERE id = '0e32a415-31b8-49a0-9cd5-65120c5bd3b3';

UPDATE centers SET
  services            = ARRAY[]::text[],
  long_description    = NULL,
  pedagogical_approach = ARRAY[]::text[],
  schedule            = NULL,
  verification_status = 'partially_verified',
  confidence_level    = 'high',
  updated_at          = NOW()
WHERE id = '91926c07-f673-4623-911e-f4009fee5c9d';

UPDATE centers SET
  services            = ARRAY[]::text[],
  long_description    = NULL,
  pedagogical_approach = ARRAY[]::text[],
  schedule            = NULL,
  verification_status = 'pending_manual_review',
  confidence_level    = 'medium',
  updated_at          = NOW()
WHERE id = '9714633c-2f9c-4d3e-80c6-7515cda502c4';

UPDATE centers SET
  services            = ARRAY[]::text[],
  long_description    = NULL,
  pedagogical_approach = ARRAY[]::text[],
  schedule            = NULL,
  verification_status = 'pending_manual_review',
  confidence_level    = 'medium',
  updated_at          = NOW()
WHERE id = '7f6b35ae-f63e-452a-8592-84a69e731e61';

UPDATE centers SET
  services            = ARRAY[]::text[],
  long_description    = NULL,
  pedagogical_approach = ARRAY[]::text[],
  schedule            = NULL,
  verification_status = 'pending_manual_review',
  confidence_level    = 'medium',
  updated_at          = NOW()
WHERE id = '2613e96c-9379-4d6d-adeb-d21ceb774fd4';

UPDATE centers SET
  services            = ARRAY[]::text[],
  long_description    = NULL,
  pedagogical_approach = ARRAY[]::text[],
  schedule            = NULL,
  verification_status = 'unverified',
  confidence_level    = 'unknown',
  updated_at          = NOW()
WHERE id = 'f041b437-f593-4088-bb79-0388840a503c';

UPDATE centers SET
  services            = ARRAY[]::text[],
  long_description    = NULL,
  pedagogical_approach = ARRAY[]::text[],
  schedule            = NULL,
  verification_status = 'partially_verified',
  confidence_level    = 'medium',
  updated_at          = NOW()
WHERE id = '01030122-05cd-49f9-98e0-dbef90390cc9';

UPDATE centers SET
  services            = ARRAY[]::text[],
  long_description    = NULL,
  pedagogical_approach = ARRAY[]::text[],
  schedule            = NULL,
  verification_status = 'partially_verified',
  confidence_level    = 'medium',
  updated_at          = NOW()
WHERE id = '5415af25-14fb-4d27-8988-8d8d3ab31574';

UPDATE centers SET
  services            = ARRAY[]::text[],
  long_description    = NULL,
  pedagogical_approach = ARRAY[]::text[],
  schedule            = NULL,
  verification_status = 'pending_manual_review',
  confidence_level    = 'medium',
  updated_at          = NOW()
WHERE id = 'fa73f2b1-c52c-4870-b9e1-19e0522a0f12';

UPDATE centers SET
  services            = ARRAY[]::text[],
  long_description    = NULL,
  pedagogical_approach = ARRAY[]::text[],
  schedule            = NULL,
  verification_status = 'pending_manual_review',
  confidence_level    = 'medium',
  updated_at          = NOW()
WHERE id = '2e007e17-485f-4a2d-9056-b6e948c72c3b';

COMMIT;