SELECT
    menu1.pizza_name,
    pizzeria1.name AS pizzeria_name_1,
    pizzeria2.name AS pizzeria_name_2,
    menu1.price
FROM
    menu AS menu1
INNER JOIN menu AS menu2 ON menu1.pizza_name = menu2.pizza_name AND menu1.price = menu2.price
INNER JOIN pizzeria AS pizzeria1 ON pizzeria1.id = menu1.pizzeria_id
INNER JOIN pizzeria AS pizzeria2 ON pizzeria2.id = menu2.pizzeria_id AND pizzeria2.name != pizzeria1.name
WHERE menu1.pizzeria_id > menu2.pizzeria_id;