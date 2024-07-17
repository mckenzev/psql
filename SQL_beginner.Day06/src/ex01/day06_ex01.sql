INSERT INTO person_discounts
SELECT
    ROW_NUMBER() OVER(ORDER BY person_id, pizzeria_id) AS id,
    person_id,
    pizzeria_id,
    CASE
        WHEN COUNT(*) = 1 THEN 10.5
        WHEN COUNT(*) = 2 THEN 22
        ELSE 30
    END AS discount
FROM person_order
JOIN menu ON person_order.menu_id = menu.id
GROUP BY person_id, pizzeria_id;