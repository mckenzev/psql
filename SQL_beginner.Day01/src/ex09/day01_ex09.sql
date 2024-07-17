SELECT name
FROM pizzeria
EXCEPT
SELECT 
(
    SELECT 
    (
        SELECT name
        FROM pizzeria
        WHERE id = pizzeria_id
    )
)
FROM person_visits;

SELECT name
FROM pizzeria 
WHERE name NOT IN 
(
    SELECT 
    (
        SELECT name
        FROM pizzeria
        WHERE id = pizzeria_id
    )
    FROM person_visits
);
