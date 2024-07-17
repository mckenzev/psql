SELECT name, SUM(count) AS total_count
FROM (
    SELECT *
    FROM (
        SELECT 
            pi.name,
            COUNT(*)
        FROM person_order po
        JOIN menu m ON m.id = po.menu_id
        JOIN pizzeria pi ON pi.id = m.pizzeria_id
        GROUP BY(pi.name)
    ) AS order_table
    UNION ALL
    SELECT *
    FROM (
        SELECT
            pi.name,
            COUNT(*)
        FROM person_visits pv
        JOIN pizzeria pi ON pv.pizzeria_id = pi.id
        GROUP BY(pi.name)
    ) AS visit_table
) AS general_table
GROUP BY(name)
ORDER BY 2 DESC, 1 ASC;