--@Author: MaurosMJ

--Simulando um erro: Updata sem where multiplicando o salario
UPDATE employees
SET
    salary = salary * 6;

COMMIT;

-- Bloco para corrigir o problema
DECLARE

-- Cursor que consulta uma tabela há 15 minutos atrás (Utiliza DBMS_FLASHBACK)
    CURSOR c1 IS
    SELECT
        *
    FROM
        employees AS OF TIMESTAMP ( systimestamp - INTERVAL '15' MINUTE );

    employees_w employees%rowtype;
BEGIN
    OPEN c1;
    LOOP
-- Para cada linha atualizar a tabela
        FETCH c1 INTO employees_w;
        EXIT WHEN c1%notfound;
        UPDATE employees
        SET
            salary = employees_w.salary
        WHERE
            employee_id = employees_w.employee_id;

    END LOOP;

END;