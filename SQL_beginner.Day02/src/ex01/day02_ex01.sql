SELECT TO_CHAR(date_m.date_m, 'YYYY-MM-DD') AS missing_date
FROM (
    SELECT generate_series('2022-01-01'::date, '2022-01-10'::date, '1 day') AS date_m
) AS date_m
LEFT JOIN person_visits ON visit_date = date_m AND (person_id = 1 OR person_id = 2)
WHERE visit_date IS NULL
ORDER BY missing_date;