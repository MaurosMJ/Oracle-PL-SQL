CREATE OR REPLACE PACKAGE employee_pck IS
    FUNCTION obter_salario_funcionario (
        p_employee_id IN employees.employee_id%TYPE
    ) RETURN NUMBER;

    FUNCTION obter_cargo_funcionario (
        p_employee_id IN employees.employee_id%TYPE
    ) RETURN VARCHAR2;

    PROCEDURE aumenta_salario_funcionario (
        p_employee_id  IN employees.employee_id%TYPE,
        p_percentual IN NUMBER
    );

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
    );

END;