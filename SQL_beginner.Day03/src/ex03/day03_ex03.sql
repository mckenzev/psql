SELECT female.name AS pizzeria_name
FROM (
    SELECT pizzeria.name
    FROM person_visits
    INNER JOIN person ON person.id = person_visits.person_id
    INNER JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id
    WHERE gender = 'female'
    EXCEPT ALL
    SELECT pizzeria.name AS pizzeria_name
    FROM person_visits
    INNER JOIN person ON person.id = person_visits.person_id
    INNER JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id
    WHERE gender = 'male'
) AS female
UNION
SELECT male.name
FROM (
    SELECT pizzeria.name
    FROM person_visits
    INNER JOIN person ON person.id = person_visits.person_id
    INNER JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id
    WHERE gender = 'male'
    EXCEPT ALL
    SELECT pizzeria.name AS pizzeria_name
    FROM person_visits
    INNER JOIN person ON person.id = person_visits.person_id
    INNER JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id
    WHERE gender = 'female'
) AS male
ORDER BY 1;