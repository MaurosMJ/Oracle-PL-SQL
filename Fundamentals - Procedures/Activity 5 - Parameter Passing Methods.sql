--@Author MaurosMJ

CREATE OR REPLACE PROCEDURE obter_funcionario (
    p_employee_id    IN employees.employee_id%TYPE,
    p_first_name     OUT employees.first_name%TYPE,
    p_last_name      OUT employees.last_name%TYPE,
    p_email          OUT employees.email%TYPE,
    p_phone_number   OUT employees.phone_number%TYPE,
    p_hire_date      OUT employees.hire_date%TYPE,
    p_job_id         OUT employees.job_id%TYPE,
    p_salary         OUT employees.salary%TYPE,
    p_commission_pct OUT employees.commission_pct%TYPE,
    p_manager_id     OUT employees.manager_id%TYPE,
    p_department_id  OUT employees.department_id%TYPE
) IS
    wemployee employees%rowtype;
BEGIN
    SELECT
        first_name,
        last_name,
        email,
        phone_number,
        hire_date,
        job_id,
        salary,
        commission_pct,
        manager_id,
        department_id
    INTO
        p_first_name,
        p_last_name,
        p_email,
        p_phone_number,
        p_hire_date,
        p_job_id,
        p_salary,
        p_commission_pct,
        p_manager_id,
        p_department_id
    FROM
        employees
    WHERE
        employee_id = p_employee_id;

    COMMIT;
EXCEPTION
    WHEN no_data_found THEN
        raise_application_error(-20001, 'Não foram encotrados dados para esse id de funcionário.');
    WHEN OTHERS THEN
        raise_application_error(-20002, 'Erro oracle - '
                                        || sqlcode
                                        || sqlerrm);
END;


-- Metodo Posicional

set serveroutput on;
set verify off;

accept p_employee_id prompt 'Informe o ID do funcionario:';

DECLARE
    w_employee employees%rowtype;
BEGIN
    obter_funcionario('&p_employee_id', w_employee.first_name, w_employee.last_name, w_employee.email, w_employee.phone_number,
                     w_employee.hire_date, w_employee.job_id, w_employee.salary, w_employee.commission_pct, w_employee.manager_id,
                     w_employee.department_id);

    dbms_output.put_line('Nome: ' || w_employee.first_name);
    dbms_output.put_line('Sobrenome: ' || w_employee.last_name);
    dbms_output.put_line('Email: ' || w_employee.email);
    dbms_output.put_line('Numero de telefone: ' || w_employee.phone_number);
    dbms_output.put_line('data de admissão: ' || w_employee.hire_date);
    dbms_output.put_line('Função: ' || w_employee.job_id);
    dbms_output.put_line('Salario: ' || w_employee.salary);
    dbms_output.put_line('Comissão: ' || w_employee.commission_pct);
END;

-- Metodo Nomeado

set serveroutput on;
set verify off;

accept p_employee_id prompt 'Informe o ID do funcionario:';

DECLARE
    w_employee employees%rowtype;
BEGIN
    obter_funcionario('&p_employee_id', p_first_name => w_employee.first_name, p_last_name => w_employee.last_name, p_email => w_employee.email
    , p_phone_number => w_employee.phone_number,
                     p_hire_date => w_employee.hire_date, p_job_id => w_employee.job_id, p_salary => w_employee.salary, p_commission_pct => w_employee.commission_pct
                     , p_manager_id => w_employee.manager_id,
                     p_department_id => w_employee.department_id);

    dbms_output.put_line('Nome: ' || w_employee.first_name);
    dbms_output.put_line('Sobrenome: ' || w_employee.last_name);
    dbms_output.put_line('Email: ' || w_employee.email);
    dbms_output.put_line('Numero de telefone: ' || w_employee.phone_number);
    dbms_output.put_line('data de admissão: ' || w_employee.hire_date);
    dbms_output.put_line('Função: ' || w_employee.job_id);
    dbms_output.put_line('Salario: ' || w_employee.salary);
    dbms_output.put_line('Comissão: ' || w_employee.commission_pct);
END;