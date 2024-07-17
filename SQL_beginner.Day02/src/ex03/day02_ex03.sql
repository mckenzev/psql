WITH tmp_table (date) AS (

    SELECT generate_series('2022-01-01'::date, '2022-01-10'::date, '1 day')
)

SELECT TO_CHAR(missing_date.date, 'YYYY-MM-DD') AS missing_date
FROM (
SELECT date
FROM tmp_table
) AS missing_date
LEFT JOIN person_visits ON visit_date = date AND (person_id = 1 OR person_id = 2)
WHERE visit_date IS NULL
ORDER BY missing_date;
