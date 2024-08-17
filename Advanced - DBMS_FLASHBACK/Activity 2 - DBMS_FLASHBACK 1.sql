--@Author: MaurosMJ

-- Simulando um erro do programador de update sem 'Where' e commit:
UPDATE employees
SET
    salary = salary * 5;

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

-- Abre cursor, consulta tabela e atribui valores ao cursor.
    OPEN c1;

-- Volta ao estado atual.
    dbms_flashback.disable;

-- Atualiza estado atual com o estado anterior
    LOOP
        FETCH c1 INTO employees_w;
        EXIT WHEN c1%notfound;
        UPDATE employees
        SET
            salary = employees_w.salary
        WHERE
            employee_id = employees_w.employee_id;

    END LOOP;

    COMMIT;
END;