set serveroutput on;
ACCEPT dept_id PROMPT 'Digite o Id do departamento:';

DECLARE
    wdepartment    VARCHAR2(100) := '&dept_id';
    wpercentual    NUMBER(4, 2) := 0;
    wsalarioantigo employees.salary%TYPE;
    wsalarionovo   employees.salary%TYPE;
BEGIN
    IF wdepartment = 80 THEN
        wpercentual := 10;
    ELSIF wdepartment = 20 THEN
        wpercentual := 15;
    ELSIF wdepartment = 60 THEN
        wpercentual := 20;
    ELSE
        wpercentual := 5;
    END IF;

    UPDATE employees
    SET
        salary = salary + ( ( salary * wpercentual ) / 100 )
    WHERE
        department_id = wdepartment;

    dbms_output.put_line('Percentual = '
                         || wpercentual
                         || '%');
    ROLLBACK;
END;