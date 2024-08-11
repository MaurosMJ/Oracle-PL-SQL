--@Author: MaurosMJ

-- FOR ALL empacota todos os UPDATES e envia o pacote em 1 única troca de contexto (Context Switch) - SQL STATEMENT ENGINE E PL/SQL ENGINE
-- Problema: Collections muito grandes consumem muita memória.
-- Solução/Melhoria de performance: ARRAY com Limite de posições, não ocupa tanta memória do Oracle, código mais eficiente. 

CREATE OR REPLACE PROCEDURE prc_aumentar_salario (
    p_porcentagem IN NUMBER
) IS

    TYPE employee_table_type IS
        TABLE OF employees.employee_id%TYPE INDEX BY BINARY_INTEGER;
    employees_id employee_table_type;
    CURSOR employees_cursor IS
    SELECT
        employee_id
    FROM
        employees;

    limit_w      CONSTANT INTEGER := 30;
BEGIN
    OPEN employees_cursor;
    LOOP
        FETCH employees_cursor
        BULK COLLECT INTO employees_id LIMIT limit_w;
        EXIT WHEN employees_id.count = 0;
        FORALL indice IN employees_id.first..employees_id.last
            UPDATE employees e
            SET
                e.salary = e.salary * ( 1 + p_porcentagem / 100 )
            WHERE
                e.employee_id = employees_id(indice);

    END LOOP;

    CLOSE employees_cursor;
    COMMIT;
END prc_aumentar_salario;

-- TESTANDO
BEGIN
    prc_aumentar_salario(10);
END;