SET enable_seqscan = OFF;

CREATE INDEX IF NOT EXISTS idx_person_name ON person(UPPER(name));

EXPLAIN ANALYZE
SELECT name FROM person
WHERE UPPER(name) = 'PETER';