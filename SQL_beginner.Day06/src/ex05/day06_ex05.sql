COMMENT ON TABLE person_discounts IS 'В таблице указан размер скидки, предоставляемый для конкретных людей в конкретных пиццериях';
COMMENT ON COLUMN person_discounts.id IS 'Первичный ключ';
COMMENT ON COLUMN person_discounts.person_id IS 'id человека, которому предоставляется скидка. id соответствует первиному ключу человека из таблицы person';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'id пиццерии, в которой предоставляется скидка. id соответствует первичному ключу пиццерии из таблицы pizzeria';
COMMENT ON COLUMN person_discounts.discount IS 'Размер скидки в процентах(%)';

-- Комменты к столбцам
-- SELECT attname, col_description(attrelid, attnum)
-- FROM pg_attribute
-- WHERE attrelid::regclass = 'public.person_discounts'::regclass AND attnum > 0;

-- Коммент к таблице
-- SELECT obj_description('person_discounts'::regclass);
