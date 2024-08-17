--@Author: MaurosMJ

--Simulando um erro: Updata sem where multiplicando o salario
UPDATE employees
SET
    salary = salary * 5,
    first_name = 'Mauros';

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
            first_name = employees_w.first_name,
            last_name = employees_w.last_name,
            email = employees_w.email,
            phone_number = employees_w.phone_number,
            hire_date = employees_w.hire_date,
            job_id = employees_w.job_id,
            salary = employees_w.salary,
            commission_pct = employees_w.commission_pct,
            manager_id = employees_w.manager_id,
            department_id = employees_w.department_id
        WHERE
            employee_id = employees_w.employee_id;

    END LOOP;

    COMMIT;
END;