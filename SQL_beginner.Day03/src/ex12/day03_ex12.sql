INSERT INTO person_order
SELECT 
    (SELECT COALESCE(MAX(id), 0) + series FROM person_order),
    series,
    (SELECT id FROM menu WHERE pizza_name = 'greek pizza'),
    '2022-02-25'
FROM generate_series(1, (SELECT MAX(id) FROM person)) AS series;