SELECT 
    menu.pizza_name,
    menu.price,
    pizzeria.name AS pizzeria_name
FROM menu
LEFT JOIN person_order ON person_order.menu_id = menu.id
INNER JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
WHERE person_order.menu_id IS NULL
ORDER BY 
    pizza_name,
    price;