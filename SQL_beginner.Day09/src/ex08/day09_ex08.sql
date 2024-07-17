CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop INTEGER DEFAULT 10)
RETURNS TABLE(fibonacci INTEGER) AS $$
DECLARE
    arr INTEGER[];
    i INTEGER;
    next_val INTEGER;
BEGIN
    i := 0;
    next_val := 0;
LOOP
    EXIT WHEN next_val > pstop;
    arr := arr || next_val;
    IF i < 2 THEN
        next_val := 1;
    ELSE
        next_val := arr[array_length(arr, 1) - 1] + arr[array_length(arr, 1)];
    END IF;
    i := i + 1;
END LOOP;
    RETURN QUERY SELECT * FROM UNNEST(arr) as val;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM fnc_fibonacci(100);
SELECT * FROM fnc_fibonacci();