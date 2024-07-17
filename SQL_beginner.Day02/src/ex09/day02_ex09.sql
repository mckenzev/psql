SELECT person.name
FROM person
FULL JOIN person_order ON person_order.person_id = person.id
INNER JOIN menu ON person_order.menu_id = menu.id AND pizza_name = 'pepperoni pizza'
WHERE person.gender = 'female'
AND person.id IN (
    SELECT person_order.person_id
    FROM person_order
    JOIN menu ON person_order.menu_id = menu.id AND pizza_name = 'cheese pizza'
)
ORDER BY name;