SELECT
    pi.name,
    COUNT(*) AS count_of_orders,
    ROUND(AVG(m.price), 2) AS average_price,
    MAX(m.price) AS max_price,
    MIN(m.price) AS min_price
FROM pizzeria pi
JOIN menu m on m.pizzeria_id = pi.id
JOIN person_order po ON po.menu_id = m.id
GROUP BY(pi.name)
ORDER BY 1;