--@Author: MaurosMJ

set serveroutput on;
set verify off;

DECLARE
    CURSOR c1 (
        p_department_id employees.department_id%TYPE,
        p_job_id        employees.job_id%TYPE
    ) IS
    SELECT
        *
    FROM
        employees
    WHERE
            department_id = p_department_id
        AND job_id = p_job_id;

BEGIN
    FOR employee_record IN c1(60, 'IT_PROG') LOOP
        dbms_output.put_line(employee_record.first_name);
    END LOOP;

    ROLLBACK;
END;