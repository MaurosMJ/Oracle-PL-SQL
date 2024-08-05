--@Author: MaurosMJ

/*
Regra 1 de Mutating Tables: não altere dados em colunas de chaves primárias, 
chaves estrangeiras ou chaves únicas de tabelas relacionadas àquela na qual 
a trigger disparada está associada
*/

CREATE OR REPLACE TRIGGER a_i_registra_funcionario_r_trg AFTER
    INSERT ON employees
    FOR EACH ROW
BEGIN
    UPDATE employees
    SET
        email = upper(substr(:new.first_name, 1, 1)
                      || :new.last_name)
    WHERE
        employee_id = :new.employee_id;

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

/*
Relatório de erros -
ORA-20001: Erro Oracle --20001ORA-20001: Erro Oracle - -4091ORA-04091: a tabela HR.EMPLOYEES é mutante; talvez o gatilho/função não possa localizá-la
ORA-06512: em "HR.A_I_REGISTRA_FUNCIONARIO_R_TRG", line 11
ORA-04088: erro durante a execução do gatilho 'HR.A_I_REGISTRA_FUNCIONARIO_R_TRG'
ORA-06512: em "HR.INSERIR_FUNCIONARIO", line 45
ORA-06512: em line 2
*/