--@Author: MaurosMJ

CREATE OR REPLACE FUNCTION fetch_employees_table (
    p_department_id IN NUMBER
)
--Tipo permanente (Armazenado no banco de dados)
 RETURN employees_table IS
--Nested Table
    employees_table_w employees_table := employees_table();
BEGIN
-- Obtem valores de employees e atribui a variavel do tipo record 'e'
    FOR e IN (
        SELECT
            employee_id,
            first_name,
            last_name,
            email,
            phone_number,
            hire_date,
            job_id,
            salary,
            commission_pct,
            manager_id,
            department_id
        FROM
            employees
        WHERE
            department_id = p_department_id
    )
-- Para cada linha retornado, atibui a ultima posição da nested table
     LOOP
        employees_table_w.extend;
        employees_table_w(employees_table_w.last) := employees_row(e.employee_id, e.first_name, e.last_name, e.email, e.phone_number,
                                                                  e.hire_date, e.job_id, e.salary, e.commission_pct, e.manager_id,
                                                                  e.department_id);

    END LOOP;

    RETURN employees_table_w;
END;

-- Testando a Table Function

SELECT
    *
FROM
    TABLE ( fetch_employees_table(60) );