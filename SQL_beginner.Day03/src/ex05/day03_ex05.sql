SELECT visits.name AS pizzeria_name
FROM (
    SELECT pizzeria.name
    FROM pizzeria
    JOIN person_visits ON person_visits.pizzeria_id = pizzeria.id
    JOIN person ON person.id = person_visits.person_id
    WHERE person.name = 'Andrey'
) AS visits
EXCEPT
SELECT ordered.name
FROM (
    SELECT pizzeria.name
    FROM pizzeria
    JOIN menu ON pizzeria.id = menu.pizzeria_id
    JOIN person_order ON person_order.menu_id = menu.id
    JOIN person ON person.id = person_order.person_id
    WHERE person.name = 'Andrey'
) AS ordered
ORDER BY 1;