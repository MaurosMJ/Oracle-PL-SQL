--@Author: MaurosMJ

set serveroutput on;
set verify off;

DECLARE
    TYPE employee_type_varray IS
        VARRAY(10) OF NUMBER(3);
    employee_table employee_type_varray := employee_type_varray();
BEGIN
    FOR i IN 1..10 LOOP
        employee_table.extend;
        employee_table(i) := i;
    END LOOP;
    FOR i IN 1..10 LOOP
        dbms_output.put_line('Indice: [' || i || '] Contem: ' || employee_table(i));
    END LOOP;

END;