SELECT pizzeria.name AS pizzeria_name
FROM pizzeria
INNER JOIN (
    SELECT *
    FROM person_visits
    WHERE visit_date = '2022-01-08'
    ) AS person_visits ON person_visits.pizzeria_id = pizzeria.id
FULL JOIN (
    SELECT * FROM person WHERE name = 'Denis'
    ) AS person ON person.id = person_visits.person_id
INNER JOIN menu ON menu.pizzeria_id = pizzeria.id
WHERE price < 800;
