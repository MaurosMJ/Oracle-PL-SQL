DECLARE
    wpercentual  NUMBER(3);
    wemployee_id employees.employee_id%TYPE;
    wsalarynew   employees.salary%TYPE;
    wsalaryold   employees.salary%TYPE;
    wtext        VARCHAR2(100);
BEGIN
    wpercentual := :wpercentual;
    wemployee_id := :wemployee_id;
    SELECT
        salary
    INTO wsalaryold
    FROM
        employees
    WHERE
        employee_id = wemployee_id; -- Ex: employee_id = 100 & default salary = 24000

    wtext := 'Antigo salário: ' || wsalaryold || ' (Linhas afetadas: ' || SQL%ROWCOUNT || ')' || CHR(10);
    wsalarynew := wsalaryold + ( ( wpercentual * wsalaryold ) / 100 );
    UPDATE employees
    SET
        salary = wsalarynew
    WHERE
        employee_id = wemployee_id;

    wtext := wtext || 'Novo salário: ' || wsalarynew || ' (Linhas afetadas: ' || SQL%ROWCOUNT || ')';
    dbms_output.put_line(wtext);
    ROLLBACK;
END;