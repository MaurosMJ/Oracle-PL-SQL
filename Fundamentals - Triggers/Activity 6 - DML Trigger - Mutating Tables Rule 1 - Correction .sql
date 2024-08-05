
--@Author: MaurosMJ

/*
Regra 1 de Mutating Tables: não altere dados em colunas de chaves primárias, 
chaves estrangeiras ou chaves únicas de tabelas relacionadas àquela na qual 
a trigger disparada está associada
*/

CREATE OR REPLACE TRIGGER b_i_registra_funcionario_r_trg BEFORE
    INSERT ON employees
    FOR EACH ROW
BEGIN
    :new.email := upper(substr(:new.first_name, 1, 1)
                        ||(:new.last_name)); --CORREÇÃO
EXCEPTION
    WHEN OTHERS THEN
        raise_application_error(-20001, 'Erro Oracle - '
                                        || sqlcode
                                        || sqlerrm);
END;


-- Teste de violação da Regra 1:

set serveroutput on;
SET VERIFY OFF;

BEGIN
    inserir_funcionario('Eric', 'Clapton', 'ECLAPTON', '515.188.4861', sysdate,
                       'IT_PROG', 15000, NULL, 103, 60);

    COMMIT;
END;

DELETE FROM employees
WHERE
    employee_id = 220;

/*
SEM ERROS.
*/