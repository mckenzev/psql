WITH ws AS (
    SELECT pi.id
    FROM pizzeria AS pi
    JOIN mv_dmitriy_visits_and_eats AS mv ON pi.name = mv.pizzeria_name
), nw AS (
    SELECT pi.id 
    FROM pizzeria AS pi
    JOIN menu AS m ON m.pizzeria_id = pi.id
    WHERE price < 800 
    EXCEPT
    SELECT * FROM ws
    )

INSERT INTO person_visits
VALUES (
    (SELECT (MAX(id) + 1) FROM person_visits),
    (SELECT id FROM person WHERE name = 'Dmitriy'),
    (SELECT * FROM nw ORDER BY RANDOM() LIMIT 1),
    '2022-01-08'
);

REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;