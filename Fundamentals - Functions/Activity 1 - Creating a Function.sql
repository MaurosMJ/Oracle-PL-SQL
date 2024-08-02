--@Author: MaurosMJ

CREATE OR REPLACE FUNCTION obter_salario_funcionario (
    p_id_employee IN employees.employee_id%TYPE
) RETURN VARCHAR2 IS
    w_salary employees.salary%TYPE;
BEGIN
    SELECT
        salary
    INTO w_salary
    FROM
        employees
    WHERE
        employee_id = p_id_employee;

    RETURN w_salary;
END;

ALTER FUNCTION obter_salario_funcionario COMPILE;

accept p_employee_id prompt 'Informe o id do funcionario:';

DECLARE
    w_salary employees.salary%TYPE;
BEGIN
    w_salary := obter_salario_funcionario('&p_employee_id');
    dbms_output.put_line(w_salary);
END;