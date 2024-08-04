--@Author: MaurosMJ

CREATE OR REPLACE TRIGGER b_i_validar_horario_s_trg BEFORE
    INSERT ON employees
DECLARE BEGIN
    IF ( TRIM(to_char(sysdate, 'DAY')) IN ( 'SABADO', 'DOMINGO' ) OR TO_NUMBER(to_char(sysdate, 'HH24')) NOT BETWEEN 8 AND 18 ) THEN
        raise_application_error(-20001, 'Não é possível adicionar funcionarios fora do horario comercial.');
    END IF;
END;

BEGIN
  inserir_funcionario('George', 'Harrison','GHARRISON','515.258.5690',SYSDATE,'IT_PROG',25000,NULL,103,60);
END;
