--@Author: MaurosMJ

--Procedure que retorna um cursor que foi aberto
CREATE OR REPLACE PROCEDURE obter_nomes_funcionarios (
    p_nomes_funcionarios OUT SYS_REFCURSOR
) IS
-- nothing to declare

BEGIN
    OPEN p_nomes_funcionarios FOR SELECT
                                      first_name,
                                      last_name
                                  FROM
                                      employees;

END;

--Procedure que obtem um cursor já aberto de outro programa e imprime as informações
CREATE OR REPLACE PROCEDURE exibir_funcionarios AS
    w_funcionarios_cursor SYS_REFCURSOR;
    w_nome                employees.last_name%TYPE;
    w_sobrenome           employees.first_name%TYPE;
BEGIN
    obter_nomes_funcionarios(w_funcionarios_cursor);
    LOOP
        FETCH w_funcionarios_cursor INTO
            w_nome,
            w_sobrenome;
        dbms_output.put_line('Nome: ' || w_nome);
        dbms_output.put_line('Sobrenome: ' || w_sobrenome);
        EXIT WHEN w_funcionarios_cursor%notfound;
    END LOOP;

    CLOSE w_funcionarios_cursor;
END;


--Testando funcionamento
set serveroutput on;
set verify off;

BEGIN
    exibir_funcionarios;
END;