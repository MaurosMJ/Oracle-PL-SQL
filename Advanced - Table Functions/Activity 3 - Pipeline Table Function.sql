--@Author: MaurosMJ

/*
- Retorna linha por linha ao programa chamador
- Melhor performance, menos uso de memória para o Nested Table
*/
CREATE OR REPLACE FUNCTION obter_employees_table_pipeline (
    p_deparment_id IN NUMBER
) RETURN employees_table
    PIPELINED
AS
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
            department_id = p_deparment_id
    ) LOOP
-- Cada linha é retornado individualmente ao programa chamador
        PIPE ROW ( employees_row(e.employee_id, e.first_name, e.last_name, e.email, e.phone_number,
                                e.hire_date, e.job_id, e.salary, e.commission_pct, e.manager_id,
                                e.department_id) );
    END LOOP;
END;

-- Testando a Pipelined Function
SELECT
    *
FROM
    TABLE ( obter_employees_table_pipeline(60) );