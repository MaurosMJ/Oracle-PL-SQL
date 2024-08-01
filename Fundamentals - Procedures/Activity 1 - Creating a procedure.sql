--@Author: MaurosMJ

BEGIN
    inserir_funcionario('David', 'Bowie', 'DBOWIE', '515.127.4861', sysdate,
                       'IT_PROG', 15000, NULL, 103, 60);
END;

BEGIN
    inserir_funcionario('Greg', 'Lake', 'GLAKE', '515.127.4961', sysdate,
                       'IT_PROG', 15000, NULL, 103, 60);
END;

CREATE OR REPLACE PROCEDURE inserir_funcionario (
    p_first_name     IN employees.first_name%TYPE,
    p_last_name      IN employees.first_name%TYPE,
    p_email          IN employees.first_name%TYPE,
    p_phone_number   IN employees.first_name%TYPE,
    p_hire_date      IN employees.first_name%TYPE,
    p_job_id         IN employees.first_name%TYPE,
    p_salary         IN employees.first_name%TYPE,
    p_commission_pct IN employees.first_name%TYPE,
    p_manager_id     IN employees.first_name%TYPE,
    p_department_id  IN employees.first_name%TYPE
) IS
-- nothing to declare here

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
    );

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        raise_application_error(-20001, 'Erro Oracle -'
                                        || sqlcode
                                        || sqlerrm);
END;