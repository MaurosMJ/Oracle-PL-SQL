--@Author: MaurosMJ

set SERVEROUTPUT on;

DECLARE
    wemployeefirstname employees.first_name%TYPE;
    wemployeelastname  employees.last_name%TYPE;
    wemployeesalary    employees.salary%TYPE;
    wtext              VARCHAR2(100);
BEGIN
    SELECT
        first_name,
        last_name,
        salary
    INTO
        wemployeefirstname,
        wemployeelastname,
        wemployeesalary
    FROM
        employees
    WHERE
        employee_id = :wemployeeid;

    wtext := 'O Salário do funcionario '
             || wemployeefirstname
             || ' '
             || wemployeelastname
             || ' é equivalente ao valor: '
             || wemployeesalary || ' reais.';

    dbms_output.put_line(wtext);
END;