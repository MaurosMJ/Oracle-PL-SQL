--@Author: MaurosMJ

set serveroutput on;
set verify off;

CREATE OR REPLACE PROCEDURE alterar_salario_funcionario (
    p_id_funcionario IN employees.employee_id%TYPE,
    p_percentual     IN NUMBER
) IS
    vcursor_id      INTEGER;
    vrows_processed INTEGER;
BEGIN

--abrir cursor
    vcursor_id := dbms_sql.open_cursor;

--Parsing SQL
    dbms_sql.parse(vcursor_id, 'update employees set salary = salary * (1 + (:p_percentual/100)) where employee_id = :p_id_funcionario'
    , dbms_sql.native);

-- binding variaveis
    dbms_sql.bind_variable(vcursor_id, ':p_percentual', p_percentual);
    dbms_sql.bind_variable(vcursor_id, ':p_id_funcionario', p_id_funcionario);

-- Executando o cursor
    vrows_processed := dbms_sql.execute(vcursor_id);

-- close cursor
    dbms_sql.close_cursor(vcursor_id);

-- commit

EXCEPTION
    WHEN OTHERS THEN
        raise_application_error(-20001, 'Erro Oracle '
                                        || sqlcode
                                        || sqlerrm);
END;

--Testando:

BEGIN
    alterar_salario_funcionario(p_id_funcionario => 109, p_percentual => 10);
END;

SELECT
    *
FROM
    employees where employee_id = 109;

ROLLBACK;