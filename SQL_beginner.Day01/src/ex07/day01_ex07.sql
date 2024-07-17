SELECT
    order_date,
    (
    SELECT
        concat
        (
            name,
            ' (age:',
            person.age, 
            ')'
        ) AS person_information
    FROM
        person
    WHERE
        person_id = id
    )
FROM person_order
ORDER BY 
    order_date,
    person_information;