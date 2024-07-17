SELECT menu.pizza_name, pizzeria.name AS pizzeria_name
FROM person_order
FULL JOIN menu ON person_order.menu_id = menu.id
FULL JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
FULL JOIN person ON person.id = person_order.person_id
    WHERE person.name = 'Denis' OR person.name = 'Anna'
ORDER BY pizza_name, pizzeria_name;
