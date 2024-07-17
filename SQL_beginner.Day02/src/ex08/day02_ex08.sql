SELECT person.name 
FROM (
    SELECT * 
    FROM menu 
    WHERE pizza_name = 'mushroom pizza' OR pizza_name = 'pepperoni pizza'
    ) AS menu
INNER JOIN person_order ON person_order.menu_id = menu.id
INNER JOIN person ON person.id = person_order.id 
WHERE (address = 'Moscow' OR address = 'Samara') AND gender = 'male'
ORDER BY name DESC;