SELECT generated_date AS missing_date
FROM v_generated_dates
LEFT JOIN person_visits ON generated_date = visit_date
WHERE person_visits IS NULL;
