--@Author: MaurosMJ

set serveroutput on;
set verify off;

accept p_employee_id prompt 'Informe o id do funcionario:';

DECLARE
    wemployee_id employees.employee_id%TYPE := '&p_employee_id';
    wfirst_name  employees.first_name%TYPE;
    wlast_name   employees.last_name%TYPE;
    wsalaryold   employees.salary%TYPE;
    wsalarynew   employees.salary%TYPE;
    wjob_id      employees.job_id%TYPE;
    job_exception EXCEPTION;
BEGIN
    SELECT
        first_name,
        last_name,
        job_id,
        salary
    INTO
        wfirst_name,
        wlast_name,
        wjob_id,
        wsalaryold
    FROM
        employees
    WHERE
        employee_id = wemployee_id;

    IF wjob_id = 'AD_PRES' THEN
        RAISE job_exception;
    ELSE
        dbms_output.put_line('Não será alterado o salário deste funcionário.');
    END IF;

EXCEPTION
    WHEN no_data_found THEN
        raise_application_error(-20001, 'Não foi encontrado o funcionário com o id: ' || wemployee_id);
    WHEN job_exception THEN
        dbms_output.put_line('Salario antigo: '
                             || wsalaryold
                             || '.');
        wsalarynew := wsalaryold * 2;
        UPDATE employees
        SET
            salary = wsalarynew
        WHERE
            employee_id = wemployee_id;

        dbms_output.put_line('Salario novo: '
                             || wsalarynew
                             || '.');
    WHEN OTHERS THEN
        raise_application_error(-20001, 'Erro Oracle - '
                                        || sqlcode
                                        || sqlerrm);
END;