set serveroutput on;
set verify off;

DECLARE
    TYPE typenum IS
        TABLE OF NUMBER(2) INDEX BY BINARY_INTEGER;
    arraynum typenum;
BEGIN
    FOR i IN 1..10 LOOP
        arraynum(i) := i;
    END LOOP;

    FOR i IN 1..10 LOOP
        dbms_output.put_line('Index ('
                             || i
                             || ') contains '
                             || arraynum(i)
                             || '.');
    END LOOP;

END;