--@Author: MaurosMJ

/*
Regra 2 de Mutating Tables: Não leia informações de tabelas que estejam sendo modificadas
*/

CREATE OR REPLACE TRIGGER b_u_validate_salary_employees_r_trg BEFORE
    UPDATE OF salary ON employees
    FOR EACH ROW
DECLARE
    vmaxsalary employees.salary%TYPE;
BEGIN
    SELECT
        MAX(salary)
    INTO vmaxsalary
    FROM
        employees;

    IF :new.salary > vmaxsalary * 1.2 THEN
        raise_application_error(-20001, 'Salario não pode ser superior ao maior salario + 20%');
    END IF;

END;

-- Testando Violação da Regra 2 

SET VERIFY OFF

UPDATE employees
SET
    salary = 70000
WHERE
    employee_id = 100;

COMMIT;

/*
Relatório de erros -
Erro de SQL: ORA-04091: a tabela HR.EMPLOYEES é mutante; talvez o gatilho/função não possa localizá-la
ORA-06512: em "HR.B_U_VALIDATE_SALARY_EMPLOYEES_R_TRG", line 4
ORA-04088: erro durante a execução do gatilho 'HR.B_U_VALIDATE_SALARY_EMPLOYEES_R_TRG'
04091. 00000 -  "table %s.%s is mutating, trigger/function may not see it"
*Cause:    A trigger (or a user defined plsql function that is referenced in
           this statement) attempted to look at (or modify) a table that was
           in the middle of being modified by the statement which fired it.
*Action:   Rewrite the trigger (or function) so it does not read that table.
*/