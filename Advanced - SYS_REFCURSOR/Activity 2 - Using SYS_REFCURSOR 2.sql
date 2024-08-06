--@Author: MaurosMJ

-- Função especializada em retornar um funcionario com o sys_refcursor
CREATE OR REPLACE FUNCTION obter_nome_por_id (
    p_id_funcionario employees.employee_id%TYPE
) RETURN SYS_REFCURSOR IS
    w_funcionario_cursor SYS_REFCURSOR;
BEGIN
    OPEN w_funcionario_cursor FOR SELECT
                                                                    first_name,
                                                                    last_name
                                                                FROM
                                                                    employees
                                  WHERE
                                      employee_id = p_id_funcionario;

    RETURN w_funcionario_cursor;
END obter_nome_por_id;

-- Procedure com dependencia da função que retorna um cursor sys_refcursor, contendo um funcionario
CREATE OR REPLACE PROCEDURE exibir_funcionarios (
    p_id_funcionario employees.employee_id%TYPE
) AS
    w_funcionarios_cursor SYS_REFCURSOR;
    w_nome                employees.last_name%TYPE;
    w_sobrenome           employees.first_name%TYPE;
BEGIN
    w_funcionarios_cursor := obter_nome_por_id(p_id_funcionario);
    LOOP
        FETCH w_funcionarios_cursor INTO
            w_nome,
            w_sobrenome;
        EXIT WHEN w_funcionarios_cursor%notfound;
        dbms_output.put_line('Nome: ' || w_nome);
        dbms_output.put_line('Sobrenome: ' || w_sobrenome);
    END LOOP;

    CLOSE w_funcionarios_cursor;
END exibir_funcionarios;

-- Testando
set serveroutput on;
set verify off;

BEGIN
    exibir_funcionarios(100);
END;