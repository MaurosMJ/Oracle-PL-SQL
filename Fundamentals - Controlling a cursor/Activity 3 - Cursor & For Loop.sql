--@Author: MaurosMJ

set serveroutput on;
set verify off;

DECLARE
    CURSOR c1 IS
    SELECT
        *
    FROM
        employees;

    wnewsalary NUMBER(8, 2);
BEGIN
    FOR employee_record IN c1 LOOP
        dbms_output.put_line(employee_record.first_name);
        wnewsalary := employee_record.salary * 2;
        UPDATE employees
        SET
            salary = wnewsalary
        WHERE
            employee_id = employee_record.employee_id;

    END LOOP;

    ROLLBACK;
END;