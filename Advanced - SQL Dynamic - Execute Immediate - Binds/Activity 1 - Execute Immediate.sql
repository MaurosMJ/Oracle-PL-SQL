--@Author: MaurosMJ

set serveroutput on;
set verify off;

CREATE OR REPLACE PROCEDURE dynamic_fetch_employee (
    p_manager_id    IN employees.employee_id%TYPE DEFAULT NULL,
    p_department_id IN employees.department_id%TYPE DEFAULT NULL
) AS
-- declare
    sql_w       VARCHAR2(200) := 'select * from employees where 1=1';
    TYPE employee_type IS
        TABLE OF employees%rowtype INDEX BY BINARY_INTEGER;
    employees_w employee_type;
BEGIN
    IF p_manager_id IS NOT NULL THEN
        sql_w := sql_w
                 || ' and manager_id = '
                 || p_manager_id;
    END IF;

    IF p_department_id IS NOT NULL THEN
        sql_w := sql_w
                 || ' and department_id = '
                 || p_department_id;
    END IF;

    dbms_output.put_line('Instrução SQL: ' || sql_w);
    EXECUTE IMMEDIATE sql_w
    BULK COLLECT
    INTO employees_w;
    FOR i IN employees_w.first..employees_w.last LOOP
        dbms_output.put_line('Id do funcionario: ' || employees_w(i).employee_id);
        dbms_output.put_line('Id do departamento: ' || employees_w(i).department_id);
        dbms_output.put_line('Nome do gerente: ' || employees_w(i).manager_id);
        dbms_output.put_line('Nome do funcionario: '
                             || employees_w(i).first_name
                             || ' '
                             || employees_w(i).last_name);

        dbms_output.put_line('');
    END LOOP;

EXCEPTION
    WHEN OTHERS THEN
        raise_application_error(-20002, 'Erro Oracle - '
                                        || sqlcode
                                        || sqlerrm);
END dynamic_fetch_employee;

-- Teste 1:
BEGIN
    dynamic_fetch_employee(p_manager_id => 108);
END;

-- Teste 2:
BEGIN
    dynamic_fetch_employee(p_department_id => 100);
END;

-- Teste 3:
BEGIN
    dynamic_fetch_employee(p_manager_id => 147, p_department_id => 80);
END;

-- Teste 4:
BEGIN
    dynamic_fetch_employee();
END;