--@Author: MaurosMJ

/*
Regra 2 de Mutating Tables: Não leia informações de tabelas que estejam sendo modificadas
*/

CREATE OR REPLACE PACKAGE pck_employees_dados AS
    TYPE max_salary_table_type IS
        TABLE OF NUMBER(10, 2) INDEX BY BINARY_INTEGER;
    gmaxsalary max_salary_table_type;
END pck_employees_dados;

CREATE OR REPLACE TRIGGER b_iu_validate_salary_employees_s_trg BEFORE
    INSERT OR UPDATE OF salary ON employees
DECLARE
    vmaxsalary employees.salary%TYPE;
BEGIN
    SELECT
        MAX(salary)
    INTO
        pck_employees_dados.gmaxsalary
    (1)
    FROM
        employees;

END;

CREATE OR REPLACE TRIGGER b_iu_validate_salary_employees_r_trg BEFORE
    INSERT OR UPDATE OF salary ON employees
    FOR EACH ROW
DECLARE
    vmaxsalary employees.salary%TYPE;
BEGIN
    IF :new.salary > pck_employees_dados.gmaxsalary(1) * 1.2 THEN
        raise_application_error(-20001, 'Novo salario não pode ser superior ao maior salario + 20%');
    END IF;
END;

-- Testando Violação da Regra 2 

SET VERIFY OFF

UPDATE employees
SET
    salary = 30000
WHERE
    employee_id = 100;

COMMIT;

/*
SEM ERROS.
*/