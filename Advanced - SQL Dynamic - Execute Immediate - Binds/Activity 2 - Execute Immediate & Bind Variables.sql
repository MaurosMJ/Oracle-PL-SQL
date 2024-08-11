--@Author: MaurosMJ

/* 
Problema:
Ocorre um hard parse quando uma instrução SQL, que utiliza o mesmo objeto, é executada com diferentes valores de parâmetro. O hard parse é necessário porque a instrução SQL com os parâmetros fornecidos não está presente no Shared Pool. O Shared Pool é uma área da memória onde o Oracle armazena informações sobre instruções SQL que foram recentemente executadas para reutilização eficiente.
Quando um comando SQL é enviado ao Oracle, o sistema verifica o Shared Pool para ver se a instrução já foi analisada e compilada. Se a instrução, com os parâmetros fornecidos, não estiver no Shared Pool, é necessário realizar um hard parse para analisá-la e compilá-la novamente. Isso pode ocorrer mesmo que o objeto SQL (como uma tabela ou uma view) seja o mesmo, mas os valores dos parâmetros sejam diferentes.
Para evitar o hard parse, a instrução SQL precisa corresponder exatamente a uma instrução que já existe no Shared Pool, com os mesmos valores de parâmetro. Caso contrário, o Oracle terá que criar uma nova entrada no Shared Pool e realizar a análise rígida da instrução.

Impacto:
Esse comportamento pode levar a um aumento significativo na carga de trabalho do banco de dados, devido ao custo adicional associado ao hard parse, que envolve a análise e a criação de novos planos de execução. Isso pode resultar em menor desempenho e maior utilização de recursos.

Solução:
Utilização de Bind Variables: Para minimizar a ocorrência de hard parse, será utilizado bind variables em instruções SQL. Isso permite que o Oracle reutilize o mesmo plano de execução para instruções SQL com diferentes valores de parâmetros (Chamamos de Soft Parse).
*/

set serveroutput on;
set verify off;

CREATE OR REPLACE PROCEDURE dynamic_fetch_employee (
    p_manager_id    IN employees.employee_id%TYPE DEFAULT NULL,
    p_department_id IN employees.department_id%TYPE DEFAULT NULL
) AS
-- declare
    sql_w       VARCHAR2(200) := 'select * from employees where 1=1';
    TYPE employee_type IS
        TABLE OF employees%rowtype INDEX BY BINARY_INTEGER;
    employees_w employee_type;
BEGIN
    IF p_manager_id IS NOT NULL THEN
        sql_w := sql_w || ' and manager_id = :p_manager_id';
    END IF;
    IF p_department_id IS NOT NULL THEN
        sql_w := sql_w || ' and department_id = :p_department_id';
    END IF;
    dbms_output.put_line('Instrução SQL: ' || sql_w);
    IF
        p_manager_id IS NOT NULL
        AND p_department_id IS NULL
    THEN
        EXECUTE IMMEDIATE sql_w
        BULK COLLECT
        INTO employees_w
            USING p_manager_id;
    ELSIF
        p_manager_id IS NULL
        AND p_department_id IS NOT NULL
    THEN
        EXECUTE IMMEDIATE sql_w
        BULK COLLECT
        INTO employees_w
            USING p_department_id;
    ELSIF
        p_manager_id IS NOT NULL
        AND p_department_id IS NOT NULL
    THEN
        EXECUTE IMMEDIATE sql_w
        BULK COLLECT
        INTO employees_w
            USING p_manager_id, p_department_id;
    ELSE
        EXECUTE IMMEDIATE sql_w
        BULK COLLECT
        INTO employees_w;
    END IF;

    FOR i IN employees_w.first..employees_w.last LOOP
        dbms_output.put_line('Id do funcionario: ' || employees_w(i).employee_id);
        dbms_output.put_line('Id do departamento: ' || employees_w(i).department_id);
        dbms_output.put_line('Nome do gerente: ' || employees_w(i).manager_id);
        dbms_output.put_line('Nome do funcionario: '
                             || employees_w(i).first_name
                             || ' '
                             || employees_w(i).last_name);

        dbms_output.put_line('');
    END LOOP;

EXCEPTION
    WHEN OTHERS THEN
        raise_application_error(-20002, 'Erro Oracle - '
                                        || sqlcode
                                        || sqlerrm);
END dynamic_fetch_employee;

-- Teste 1:
BEGIN
    dynamic_fetch_employee(p_manager_id => 108);
END;

-- Teste 2:
BEGIN
    dynamic_fetch_employee(p_department_id => 100);
END;

-- Teste 3:
BEGIN
    dynamic_fetch_employee(p_manager_id => 147, p_department_id => 80);
END;

-- Teste 4:
BEGIN
    dynamic_fetch_employee();
END;