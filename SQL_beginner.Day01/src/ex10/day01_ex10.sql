SELECT 
(
    SELECT NAME 
    FROM person
    WHERE person_id = id
) AS person_name,
(
 SELECT pizza_name
 FROM menu
 WHERE id = menu_id   
) AS pizza_name,
( SELECT
    (
    SELECT name
    FROM pizzeria
    WHERE pizzeria_id = id
    )
    FROM menu
    WHERE id = menu_id
) AS pizzeria_name
FROM person_order
ORDER BY
person_name,
pizza_name,
pizzeria_name;
