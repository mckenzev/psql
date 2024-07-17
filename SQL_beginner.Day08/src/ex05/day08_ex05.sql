-- **Session #1**
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;
-- **Session #2**
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;
-- **Session #1**
SELECT SUM(rating) FROM pizzeria;
-- **Session #2**
UPDATE  pizzeria SET rating = 1 WHERE name = 'Pizza Hut';
COMMIT;
-- **Session #1**
SELECT SUM(rating) FROM pizzeria;
COMMIT;
SELECT * FROM pizzeria WHERE name  = 'Pizza Hut';
-- **Session #2**
SELECT * FROM pizzeria WHERE name  = 'Pizza Hut';