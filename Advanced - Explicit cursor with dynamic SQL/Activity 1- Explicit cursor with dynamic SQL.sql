--@Author: MaurosMJ

set serveroutput on;
set verify off;

CREATE OR REPLACE PROCEDURE dynamic_fetch_employee (
    p_manager_id    IN employees.employee_id%TYPE DEFAULT NULL,
    p_department_id IN employees.department_id%TYPE DEFAULT NULL
) AS
-- declare
    sql_w              VARCHAR2(200) := 'select * from employees where 1=1';
    TYPE employees_cursor_type IS REF CURSOR;
    employees_cursor_w employees_cursor_type;
    employees_record_w employees%rowtype;
BEGIN
    IF p_manager_id IS NOT NULL THEN
        sql_w := sql_w || ' and manager_id = :p_manager_id';
    END IF;
    IF p_department_id IS NOT NULL THEN
        sql_w := sql_w || ' and department_id = :p_department_id';
    END IF;
    dbms_output.put_line('Instrução SQL: ' || sql_w);
    IF
        p_manager_id IS NOT NULL
        AND p_department_id IS NULL
    THEN
        OPEN employees_cursor_w FOR sql_w
            USING p_manager_id;

    ELSIF
        p_manager_id IS NULL
        AND p_department_id IS NOT NULL
    THEN
        OPEN employees_cursor_w FOR sql_w
            USING p_department_id;

    ELSIF
        p_manager_id IS NOT NULL
        AND p_department_id IS NOT NULL
    THEN
        OPEN employees_cursor_w FOR sql_w
            USING p_manager_id, p_department_id;

    ELSE
        OPEN employees_cursor_w FOR sql_w;

    END IF;

    LOOP
        FETCH employees_cursor_w INTO employees_record_w;
        EXIT WHEN employees_cursor_w%notfound;
        dbms_output.put_line('Id do funcionario: ' || employees_record_w.employee_id);
        dbms_output.put_line('Id do departamento: ' || employees_record_w.department_id);
        dbms_output.put_line('Nome do gerente: ' || employees_record_w.manager_id);
        dbms_output.put_line('Nome do funcionario: '
                             || employees_record_w.first_name
                             || ' '
                             || employees_record_w.last_name);

        dbms_output.put_line('');
    END LOOP;

    CLOSE employees_cursor_w;
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