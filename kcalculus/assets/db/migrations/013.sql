UPDATE edibles
SET created_at = CURRENT_TIMESTAMP
WHERE created_at = '';
