SELECT female.name AS pizzeria_name
FROM (
    SELECT pizzeria.name
    FROM pizzeria
    JOIN menu ON menu.pizzeria_id = pizzeria.id
    JOIN person_order ON person_order.menu_id = menu.id
    JOIN person ON person.id = person_order.person_id
    WHERE gender = 'female'
    EXCEPT
    SELECT pizzeria.name AS pizzeria_name
    FROM pizzeria
    JOIN menu ON menu.pizzeria_id = pizzeria.id
    JOIN person_order ON person_order.menu_id = menu.id
    JOIN person ON person.id = person_order.person_id
    WHERE gender = 'male'
    ) AS female
UNION
SELECT male.name
FROM (
    SELECT pizzeria.name
    FROM pizzeria
    JOIN menu ON menu.pizzeria_id = pizzeria.id
    JOIN person_order ON person_order.menu_id = menu.id
    JOIN person ON person.id = person_order.person_id
    WHERE gender = 'male'
    EXCEPT
    SELECT pizzeria.name AS pizzeria_name
    FROM pizzeria
    JOIN menu ON menu.pizzeria_id = pizzeria.id
    JOIN person_order ON person_order.menu_id = menu.id
    JOIN person ON person.id = person_order.person_id
    WHERE gender = 'female'
    ) AS male
ORDER BY 1;