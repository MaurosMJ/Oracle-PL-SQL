--@Author: MaurosMJ

set serveroutput on;
set verify off;

DECLARE
    wnewsalary NUMBER(8, 2);
BEGIN
    FOR employee_record IN (
        SELECT
            *
        FROM
            employees
    ) LOOP
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