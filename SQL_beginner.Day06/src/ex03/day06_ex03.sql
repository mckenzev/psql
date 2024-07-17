SET enable_seqscan = OFF;

CREATE UNIQUE INDEX IF NOT EXISTS idx_person_discounts_unique ON person_discounts(person_id, pizzeria_id, discount);

EXPLAIN ANALYZE

SELECT
    p.name,
    m.pizza_name,
    m.price,
    ROUND(price*(100-pd.discount)/100) AS discount_price,
    pi.name AS pizzeria_name
FROM person p
JOIN person_order po ON po.person_id = p.id
JOIN menu m ON m.id = po.menu_id
JOIN pizzeria pi ON pi.id = m.pizzeria_id
JOIN person_discounts pd ON pd.person_id = p.id AND pd.pizzeria_id = pi.id
ORDER BY 1, 2;