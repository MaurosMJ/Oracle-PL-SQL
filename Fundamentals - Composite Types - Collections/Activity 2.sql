set serveroutput on;
set verify off;

DECLARE
    TYPE employee_table_type IS
        TABLE OF employees%rowtype;
    employees_table employee_table_type;
BEGIN
    SELECT
        *
    BULK COLLECT
    INTO employees_table
    FROM
        employees;

    FOR i IN employees_table.first..employees_table.last LOOP
        dbms_output.put_line('Nome: '
                             || employees_table(i).first_name
                             || ' '
                             || employees_table(i).last_name
                             || ', Telefone: '
                             || employees_table(i).phone_number
                             || ' Email: '
                             || employees_table(i).email
                             || ', Admitido em: '
                             || employees_table(i).hire_date
                             || '.');
    END LOOP;

END;
