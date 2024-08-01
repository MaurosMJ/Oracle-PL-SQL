--@Author: MaurosMJ

set serveroutput on;
set verify off;

accept p_employee_id prompt 'Informe o id do funcionario:';

DECLARE
    w_employee_id employees.employee_id%TYPE := '&p_employee_id';
    w_first_name  employees.first_name%TYPE;
    w_last_name   employees.last_name%TYPE;
BEGIN
    SELECT
        first_name,
        last_name
    INTO
        w_first_name,
        w_last_name
    FROM
        employees
    WHERE
        employee_id = w_employee_id;

    dbms_output.put_line('Funcionário: '
                         || w_first_name
                         || ' '
                         || w_last_name);
    dbms_output.put_line('Id do funcionário: ' || w_employee_id);
EXCEPTION
    WHEN no_data_found THEN
        raise_application_error(-20001, 'Funcionário com o ID '
                                        || w_employee_id
                                        || ' não encontrado!');
    WHEN OTHERS THEN
        raise_application_error(-20002, 'Erro Oracle - '
                                        || sqlcode
                                        || sqlerrm);
END;