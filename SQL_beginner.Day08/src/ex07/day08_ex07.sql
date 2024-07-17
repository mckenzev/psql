-- **Session #1**
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;
-- **Session #2**
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;
-- **Session #1**
UPDATE  pizzeria SET rating = 3.2 WHERE id = 1;
-- **Session #2**
UPDATE  pizzeria SET rating = 4.4 WHERE id = 2;
-- **Session #1**
UPDATE  pizzeria SET rating = 4.2 WHERE id = 2;
-- **Session #2**
UPDATE  pizzeria SET rating = 3.4 WHERE id = 1;
-- **Session #1**
COMMIT;
-- **Session #2**
COMMIT;

-- Изменения второй сессии откатились, сохранились изменения по 1 и 2 id только для первой сессии