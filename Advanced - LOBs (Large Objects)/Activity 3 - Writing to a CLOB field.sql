--@Author: MaurosMJ

CREATE OR REPLACE PROCEDURE inserir_resume (
    p_resume_id IN NUMBER,
    p_resume    IN VARCHAR2
) AS
    resume_ponteiro_w CLOB;
    deslocamento_w    NUMBER := 1;
    tamanho_txt_w     NUMBER;
BEGIN

/*
Obtem o ponteiro de um registro da tabela (CLOB)
Deve estar como For update, caso contrário: row containing the LOB value is not locked
*/
    SELECT
        resume
    INTO resume_ponteiro_w
    FROM
        jobs_resumes
    WHERE
        job_id = p_resume_id
    FOR UPDATE;
--Obtem tamanho do texto de entrada
    tamanho_txt_w := length(p_resume);
--Escreve no campo Clob (atraves do ponteiro)  
    dbms_lob.write(resume_ponteiro_w, tamanho_txt_w, deslocamento_w, p_resume);
    COMMIT;
END;

-- Testando a procedure
BEGIN
    inserir_resume(4, 'DBA - Database administrator , Blumenau, SC, Brasil');
END;
