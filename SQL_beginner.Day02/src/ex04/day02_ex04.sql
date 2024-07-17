SELECT menu.pizza_name, pizzeria.name AS pizzeria_name, menu.price 
FROM (
    SELECT * FROM menu 
    WHERE pizza_name = 'mushroom pizza' OR pizza_name = 'pepperoni pizza'
) AS menu
LEFT JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
ORDER BY pizza_name, pizzeria_name;