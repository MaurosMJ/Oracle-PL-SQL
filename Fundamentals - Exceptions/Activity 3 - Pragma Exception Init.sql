--@Author: MaurosMJ

accept p_job_id prompt 'Informe a função do funcionário:';

DECLARE
    wfirst_name     employees.first_name%TYPE := 'Johnnie';
    wlast_name      employees.last_name%TYPE := 'Walker';
    wemail          employees.email%TYPE := 'johnnie.walker@oracle.com';
    wphone_number   employees.phone_number%TYPE := '515.123.4567';
    whire_date      employees.hire_date%TYPE := sysdate;
    wjob_id         employees.job_id%TYPE := upper('&p_job_id');
    wsalary         employees.salary%TYPE := 10000;
    wcommission_pct employees.commission_pct%TYPE := NULL;
    wmanager_id     employees.manager_id%TYPE := NULL;
    wdepartment_id  employees.department_id%TYPE := 90;
    efk_inexistente EXCEPTION;
    PRAGMA exception_init ( efk_inexistente, -2291 );
BEGIN
    INSERT INTO employees (
        employee_id,
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
    ) VALUES (
        employees_seq.NEXTVAL,
        wfirst_name,
        wlast_name,
        wemail,
        wphone_number,
        whire_date,
        wjob_id,
        wsalary,
        wcommission_pct,
        wmanager_id,
        wdepartment_id
    );

    ROLLBACK;
EXCEPTION
    WHEN efk_inexistente THEN
        raise_application_error(-20001, 'Essa função não foi cadastrada no sistema.');
    WHEN OTHERS THEN
        raise_application_error(-20002, 'Erro Oracle - '
                                        || sqlcode
                                        || sqlerrm);
END;