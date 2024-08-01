--@Author: MaurosMJ

set serveroutput on;
set verify off;

DECLARE
    wsalary employees.salary%TYPE;
    CURSOR c1 (
        p_job_id employees.job_id%TYPE
    ) IS
    SELECT
        *
    FROM
        employees
    WHERE
        job_id = p_job_id
    FOR UPDATE;

BEGIN
    FOR employee_record IN c1('AD_VP') LOOP
        wsalary := employee_record.salary * 2;
        dbms_output.put_line('Salario antes: ' || wsalary);
        UPDATE employees
        SET
            salary = wsalary
        WHERE
            employee_id = employee_record.employee_id;

        dbms_output.put_line('Salario depois: ' || employee_record.salary);
    END LOOP;

    ROLLBACK;
END;