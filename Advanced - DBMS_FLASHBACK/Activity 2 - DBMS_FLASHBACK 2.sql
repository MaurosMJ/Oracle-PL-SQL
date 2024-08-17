--@Author: MaurosMJ

-- Simulando um erro do programador de update sem 'Where' e commit:
UPDATE employees
SET
    salary = salary * 5,
    first_name = 'Mauros';

COMMIT;

-- Como Resolver? DBMS_FLASHBACK

DECLARE
    CURSOR c1 IS
    SELECT
        *
    FROM
        employees;

    employees_w employees%rowtype;
BEGIN

-- Voltando no tempo em 10 minutos:
    dbms_flashback.enable_at_time(sysdate - 10 / 1440);

-- Abre cursor, consulta tabela e atribui ao cursor os registros.
    OPEN c1;

-- Volta ao estado atual.
    dbms_flashback.disable;
    LOOP
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