--@Author: MaurosMJ;

set serveroutput on;
set verify off;

DECLARE
    TYPE employee_table_type IS
        TABLE OF NUMBER(2);
    employees_table employee_table_type := employee_table_type();
BEGIN
    FOR i IN 1..10 LOOP
        employees_table.extend;
        employees_table(i) := i;
    END LOOP;

    FOR i IN employees_table.first..employees_table.last LOOP
        dbms_output.put_line('Index ['
                             || i
                             || '] contem: '
                             || i
                             || '.');
    END LOOP;

    dbms_output.put_line('Total de quantidade de linhas: ' || employees_table.last);
    
END;