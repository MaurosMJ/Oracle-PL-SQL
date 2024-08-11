--@Author: MaurosMJ

--Antes:
-- para cada UPDATE dentro do FOR LOOP Ocorrerá troca de contexto (Context Switch) - SQL STATEMENT ENGINE E PL/SQL ENGINE
-- PROBLEMA DE PERFORMANCE EM TABLES COM MUITOS REGISTROS ▼

CREATE OR REPLACE PROCEDURE prc_aumentar_salario (
    p_porcentagem IN NUMBER
) IS
    TYPE employee_table_type IS
        TABLE OF employees.employee_id%TYPE INDEX BY BINARY_INTEGER;
    employees_id employee_table_type;
BEGIN
    SELECT
        employee_id
    BULK COLLECT
    INTO employees_id
    FROM
        employees;

    FOR i IN employees_id.first..employees_id.last LOOP
        UPDATE employees
        SET
            salary = salary * ( 1 + p_porcentagem / 100 )
        WHERE
            employee_id = employees_id(i);

    END LOOP;

END;

-- Depois:
-- FOR ALL empacota todos os UPDATES e envia o pacote em 1 única troca de contexto (Context Switch) - SQL STATEMENT ENGINE E PL/SQL ENGINE
-- FOR ALL não utiliza LOOP e deve conter apenas uma instrução DML
-- MELHORIA DE PERFORMANCE EM TABLES COM MUITOS REGISTROS ▲

CREATE OR REPLACE PROCEDURE prc_aumentar_salario (
    p_porcentagem IN NUMBER
) IS
    TYPE employee_table_type IS
        TABLE OF employees.employee_id%TYPE INDEX BY BINARY_INTEGER;
    employees_id employee_table_type;
BEGIN
    SELECT
        employee_id
    BULK COLLECT
    INTO employees_id
    FROM
        employees;

    FORALL i IN employees_id.first..employees_id.last
        UPDATE employees
        SET
            salary = salary * ( 1 + p_porcentagem / 100 )
        WHERE
            employee_id = employees_id(i);

END;

-- TESTANDO
BEGIN
    prc_aumentar_salario(10);
END;
