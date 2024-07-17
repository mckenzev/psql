SELECT p.name
FROM person p
WHERE EXISTS (
    SELECT person_id
    FROM person_order po
    WHERE po.person_id = p.id
)
ORDER BY p.name;