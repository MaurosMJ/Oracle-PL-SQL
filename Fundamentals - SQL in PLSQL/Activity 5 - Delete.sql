--@Author: MaurosMJ

DECLARE
    wemployeeid employees.employee_id%TYPE;
BEGIN
    wemployeeid := :wemployeeid; --Ex: 207
    DELETE FROM employees
    WHERE
        employee_id = wemployeeid;

    COMMIT;
END;
