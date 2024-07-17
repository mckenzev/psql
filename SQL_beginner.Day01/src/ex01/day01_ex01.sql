SELECT object_name
FROM (
    SELECT name AS object_name, 1 AS sorted FROM person
    UNION ALL
    SELECT pizza_name AS object_name, 2 AS sorted FROM menu
) AS new_table
ORDER BY sorted, object_name;