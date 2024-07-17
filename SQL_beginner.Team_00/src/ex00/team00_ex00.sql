CREATE TABLE nodes
(
    point1 VARCHAR,
    point2 VARCHAR,
    cost   FLOAT
);

INSERT INTO nodes (point1, point2, cost)
VALUES ('a', 'b', 10),
       ('b', 'a', 10),
       ('a', 'c', 15),
       ('c', 'a', 15),
       ('a', 'd', 20),
       ('d', 'a', 20),
       ('b', 'c', 35),
       ('c', 'b', 35),
       ('b', 'd', 25),
       ('d', 'b', 25),
       ('c', 'd', 30),
       ('d', 'c', 30);

WITH RECURSIVE travel_path(point1, point2, visited, total_cost, cities_count) AS (
    SELECT point1, point2, ARRAY [point1, point2], cost, 1
    FROM nodes
    WHERE point1 = 'a'

    UNION ALL

    SELECT n.point1, n.point2, array_append(tp.visited, n.point2), tp.total_cost + n.cost, tp.cities_count + 1
    FROM nodes AS n
    JOIN travel_path AS tp ON tp.point2 = n.point1
    WHERE NOT n.point2 = ANY (tp.visited)
      AND tp.cities_count < 4
),

completed_tours AS (
    SELECT tp.total_cost + n.cost AS total_cost, '{' || array_to_string(array_append(tp.visited, 'a'), ',') || '}' AS tour
    FROM travel_path AS tp
    JOIN nodes AS n ON tp.point2 = n.point2 AND n.point1 = 'a'
    WHERE tp.cities_count = 3
)

SELECT total_cost, tour
FROM completed_tours
WHERE total_cost = (SELECT MIN(total_cost) FROM completed_tours)
ORDER BY total_cost, tour;