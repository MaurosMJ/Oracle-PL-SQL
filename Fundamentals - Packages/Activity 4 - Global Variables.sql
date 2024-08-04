CREATE OR REPLACE PACKAGE BODY employee_pck IS
--@Author: MaurosMJ
    w_min_salary employees.salary%TYPE;

    FUNCTION obter_salario_funcionario (
        p_employee_id IN employees.employee_id%TYPE
    ) RETURN NUMBER IS
        w_newsalary NUMBER(8, 2);
    BEGIN
        SELECT
            salary
        INTO w_newsalary
        FROM
            employees
        WHERE
            employee_id = p_employee_id;

        RETURN w_newsalary;
    END;

    FUNCTION obter_cargo (
        p_employee_jobid IN employees.job_id%TYPE
    ) RETURN VARCHAR2 IS
        w_jobtitle jobs.job_title%TYPE;
    BEGIN
        SELECT
            job_title
        INTO w_jobtitle
        FROM
            jobs
        WHERE
            job_id = p_employee_jobid;

        RETURN w_jobtitle;
    EXCEPTION
        WHEN no_data_found THEN
            raise_application_error(-20001, 'Não foi encontrado dados para esse ID de funcionario');
        WHEN OTHERS THEN
            raise_application_error(-20002, 'Erro Oracle - '
                                            || sqlcode
                                            || sqlerrm);
    END;

    PROCEDURE aumenta_salario_funcionario (
        p_employee_id IN employees.employee_id%TYPE,
        p_percentual  IN NUMBER
    ) IS
-- nothing to declare
    BEGIN
        UPDATE employees
        SET
            salary = salary + ( ( salary * p_percentual ) / 100 )
        WHERE
            employee_id = p_employee_id;

        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            raise_application_error(-20002, 'Erro Oracle - '
                                            || sqlcode
                                            || sqlerrm);
    END;

    PROCEDURE inserir_funcionario (
        p_first_name     IN employees.first_name%TYPE,
        p_last_name      IN employees.last_name%TYPE,
        p_email          IN employees.last_name%TYPE,
        p_phone_number   IN employees.email%TYPE,
        p_hire_date      IN employees.phone_number%TYPE,
        p_job_id         IN employees.job_id%TYPE,
        p_salary         IN employees.salary%TYPE,
        p_commission_pct IN employees.commission_pct%TYPE,
        p_manager_id     IN employees.manager_id%TYPE,
        p_department_id  IN employees.department_id%TYPE
    ) IS
        w_salary_exception EXCEPTION;
    BEGIN
        IF w_min_salary < p_salary THEN
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

        ELSE
            RAISE w_salary_exception;
        END IF;

        COMMIT;
    EXCEPTION
        WHEN w_salary_exception THEN
            raise_application_error(-20001, 'Salario do funcionario não pode ser menor que dos demais funcionarios.');
        WHEN OTHERS THEN
            raise_application_error(-20002, 'Erro Oracle - '
                                            || sqlcode
                                            || sqlerrm);
    END;

BEGIN
    SELECT
        MIN(salary)
    INTO w_min_salary
    FROM
        employees;

END;