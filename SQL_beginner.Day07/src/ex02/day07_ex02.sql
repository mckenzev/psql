SELECT *
FROM (
    SELECT 
        pi.name,
        COUNT(*),
        'order' AS action_type
    FROM person_order po
    JOIN menu m ON m.id = po.menu_id
    JOIN pizzeria pi ON pi.id = m.pizzeria_id
    GROUP BY(m.pizzeria_id, pi.name)
    ORDER BY 
        action_type ASC,
        count DESC,
        name ASC
    LIMIT 3
) AS order_table
UNION ALL
SELECT *
FROM (
    SELECT
        pi.name,
        COUNT(*),
        'visit' AS action_type
    FROM person_visits pv
    JOIN pizzeria pi ON pv.pizzeria_id = pi.id
    GROUP BY(pv.pizzeria_id, pi.name)
    ORDER BY 
        action_type ASC,
        count DESC,
        name ASC
    LIMIT 3
) AS visit_table
ORDER BY 
        action_type ASC,
        count DESC,
        name ASC;