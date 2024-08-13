-- Grant create Job
GRANT
    CREATE JOB
TO hr;

--Criando uma tabela para testes
CREATE TABLE agenda (
    agenda_id   NUMBER,
    agenda_data DATE
);

-- Criando sequence para a tabela
CREATE SEQUENCE agenda_seq START WITH 1 INCREMENT BY 1 NOCACHE NOMAXVALUE NOCYCLE;

-- Criando uma procedure para ser utilizada no programa
create or replace PROCEDURE inserir_agenda_prc AS
BEGIN
    INSERT INTO agenda (
        agenda_id,
        agenda_data
    ) VALUES (
        agenda_seq.NEXTVAL,
        SYSDATE
    );

-- Criando um programa que chama a procedure
BEGIN
    dbms_scheduler.create_program(program_name => 'HR.INSERIR_AGENDA_PRG', program_type => 'STORED_PROCEDURE', program_action => 'HR.INSERIR_AGENDA_PRC'
    , number_of_arguments => 0, enabled => FALSE,
                                 comments => 'Este e um programa que adiciona na tabela agenda');

-- Habilitando o programa
    dbms_scheduler.enable('HR.INSERIR_AGENDA_PRG');
END;

-- Dropando o programa
BEGIN
    dbms_scheduler.drop_program(program_name => 'HR.INSERIR_AGENDA_PRG', force => TRUE);
END;