--@Author: MaurosMJ

CREATE OR REPLACE TRIGGER b_iud_validar_horario_r_trg BEFORE
    INSERT OR UPDATE OR DELETE ON employees
DECLARE BEGIN
    IF ( TRIM(to_char(sysdate, 'DAY')) IN ( 'SABADO', 'DOMINGO' ) OR TO_NUMBER(to_char(sysdate, 'HH24')) NOT BETWEEN 8 AND 18 ) THEN
        CASE
            WHEN updating THEN
                raise_application_error(-20001, 'Não é possível alterar funcionarios fora do horario comercial.');
            WHEN deleting THEN
                raise_application_error(-20002, 'Não é possível remover funcionarios fora do horario comercial.');
            WHEN inserting THEN
                raise_application_error(-20003, 'Não é possível adicionar funcionarios fora do horario comercial.');
            ELSE
                raise_application_error(-20004, 'Não realizar essa operação fora do horario comercial.');
        END CASE;

    END IF;
END;

-- Testando Insert
BEGIN
    inserir_funcionario('George', 'Harrison', 'GHARRISON', '515.258.5690', sysdate,
                       'IT_PROG', 25000, NULL, 103, 60);
END;

-- Testando Update
BEGIN
    aumentar_salario_funcionario(100, 5);
END;

-- Testando Delete
BEGIN
    deletar_funcionario(100);
END;