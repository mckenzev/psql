CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
SELECT pi.name AS pizzeria_name
FROM pizzeria AS pi
JOIN person_visits AS pv ON pv.pizzeria_id = pi.id
JOIN person AS p ON p.id = pv.person_id
JOIN menu AS m ON m.pizzeria_id = pi.id
WHERE 
    p.name = 'Dmitriy'
    AND m.price < 800
    AND pv.visit_date = '2022-01-08'
ORDER BY 1;