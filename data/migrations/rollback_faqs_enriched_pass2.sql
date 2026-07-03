-- ROLLBACK 009

BEGIN;

UPDATE centers SET faqs = '[]'::jsonb, updated_at = NOW() WHERE id = 'eb0f284a-a6d6-4d31-b80f-711c85e83be7';
UPDATE centers SET faqs = '[]'::jsonb, updated_at = NOW() WHERE id = '08490f02-a1c3-43ca-aba3-9a154056d7ea';
UPDATE centers SET faqs = '[]'::jsonb, updated_at = NOW() WHERE id = 'aaf3ad28-9ca8-4985-a4ac-eab39910bf3b';
UPDATE centers SET faqs = '[]'::jsonb, updated_at = NOW() WHERE id = '23c85dad-5ef1-4b17-84c8-899098f2a537';
UPDATE centers SET faqs = '[]'::jsonb, updated_at = NOW() WHERE id = '951abe34-4a16-4f7e-8b42-73b27fe7b99d';
UPDATE centers SET faqs = '[]'::jsonb, updated_at = NOW() WHERE id = '9e1832f5-d017-4c20-95a1-caff7a7fe138';
UPDATE centers SET faqs = '[]'::jsonb, updated_at = NOW() WHERE id = '08591fa0-d00b-4b14-a313-3582865e5084';
UPDATE centers SET faqs = '[]'::jsonb, updated_at = NOW() WHERE id = 'aadff91f-1f7f-4e8b-a2bb-ecbcfde37187';
UPDATE centers SET faqs = '[]'::jsonb, updated_at = NOW() WHERE id = '76eb8258-ce5f-463d-ab50-a71a3a610717';
UPDATE centers SET faqs = '[]'::jsonb, updated_at = NOW() WHERE id = '41e497ae-f44c-4876-b842-e66c84385abf';
UPDATE centers SET faqs = '[]'::jsonb, updated_at = NOW() WHERE id = 'ebf1b842-9366-43ea-a76f-108f9b14b459';
UPDATE centers SET faqs = '[]'::jsonb, updated_at = NOW() WHERE id = 'a5f0a48a-102f-45ee-9170-36d984385b43';
UPDATE centers SET faqs = '[]'::jsonb, updated_at = NOW() WHERE id = '4cf5b474-5847-4f5d-9b13-b45dec06a1a9';
UPDATE centers SET faqs = '[]'::jsonb, updated_at = NOW() WHERE id = 'd2803c85-fcae-4862-b1b9-5e2617575e24';

COMMIT;