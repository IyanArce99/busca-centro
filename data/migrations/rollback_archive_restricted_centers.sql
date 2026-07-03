-- ROLLBACK ARCHIVE

BEGIN;

UPDATE centers SET status = 'published', updated_at = NOW() WHERE id = '6f230452-1f84-4fec-960b-9718f7feb043';
UPDATE centers SET status = 'published', updated_at = NOW() WHERE id = 'a7289dcb-834b-4ac0-b8d1-1c988fd72d2c';
UPDATE centers SET status = 'published', updated_at = NOW() WHERE id = '29b6ac59-faa4-420c-b2cc-6c2d489195f4';
UPDATE centers SET status = 'published', updated_at = NOW() WHERE id = '3d4736b3-e0d6-43b2-a902-d228200c8981';
UPDATE centers SET status = 'published', updated_at = NOW() WHERE id = '6d354d74-1ad6-4697-a52a-61cc8ce8d574';

COMMIT;