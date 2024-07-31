--Author: MaurosMJ

set serveroutput on;
set verify off;

DECLARE
    TYPE employee_table_varray IS
        VARRAY(150) OF employees%rowtype;
    employee_table employee_table_varray := employee_table_varray();
BEGIN
    SELECT
        *
    BULK COLLECT
    INTO employee_table
    FROM
        employees;

    FOR i IN employee_table.first..employee_table.last LOOP
        dbms_output.put_line('Nome do funcionário: '
                             || employee_table(i).first_name
                             || ' '
                             || employee_table(i).last_name);

        dbms_output.put_line('Endereço de e-mail: ' || employee_table(i).email);
        dbms_output.put_line('Numero de telefone: ' || employee_table(i).phone_number);
        dbms_output.put_line('Data de admissão: ' || employee_table(i).hire_date);
        dbms_output.put_line('');
    END LOOP;

    dbms_output.put_line('Quantidade total de registros recuperados: '
                         || employee_table.last
                         || '.');
END;