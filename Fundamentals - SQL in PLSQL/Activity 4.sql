DECLARE
    wpercentual NUMBER(3);
    wemployeeid employees.employee_id%TYPE;
BEGIN
    wpercentual := :wpercentual; -- EX: 10
    wemployeeid := :wemployeeid; -- EX: 207
    UPDATE employees
    SET
        salary = salary + ( ( wpercentual * salary ) / 100 )
    WHERE
        employee_id = wemployeeid;

    COMMIT;
END;