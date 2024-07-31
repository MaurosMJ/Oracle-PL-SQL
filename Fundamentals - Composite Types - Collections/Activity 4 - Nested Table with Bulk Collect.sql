--@Author: MaurosMJ

set serveroutput on;
set verify off;

DECLARE
    TYPE employee_table_type IS
        TABLE OF employees%rowtype;
    employee_table employee_table_type := employee_table_type();
BEGIN
    SELECT
        *
    BULK COLLECT
    INTO employee_table
    FROM
        employees;

    FOR i IN employee_table.first..employee_table.last LOOP
        dbms_output.put_line('Nome do funcionario: '
                             || employee_table(i).first_name
                             || ' '
                             || employee_table(i).last_name);

        dbms_output.put_line('Email: ' || employee_table(i).email);
        dbms_output.put_line('Numero de telefone: ' || employee_table(i).phone_number);
        dbms_output.put_line('Data de admissão: ' || employee_table(i).hire_date);
        dbms_output.put_line('');
    END LOOP;

END;