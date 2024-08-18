--@Author: MaurosMJ

--Criando uma procedure para exibir os dados de um CLOB
CREATE OR REPLACE PROCEDURE exibe_resume (
    resume_id NUMBER
) AS

    ponteiro_w     CLOB;
    deslocamento_w NUMBER := 1;
    tamanho_txt_w  NUMBER;
    exibe_w        VARCHAR2(240);
    texto_w        VARCHAR2(32767);
    qtd_w          NUMBER := 1;
    loop_w         NUMBER;
BEGIN

-- Obtem ponteiro
    SELECT
        resume
    INTO ponteiro_w
    FROM
        jobs_resumes
    WHERE
        job_id = resume_id
    FOR UPDATE;

-- Obtem tamanho do texto atraves do 'DBMS_LOB.getlength' do ponteiro.
    tamanho_txt_w := dbms_lob.getlength(ponteiro_w);
-- Atribui ao texto_w a leitura do ponteiro CLOB
    dbms_lob.read(ponteiro_w, tamanho_txt_w, deslocamento_w, texto_w);

-- Entra em loop printando as informações do CLOB
    loop_w := trunc((length(texto_w)) / 240) + 1;
    FOR i IN 1..loop_w LOOP
        exibe_w := substr(texto_w, qtd_w, 240);
        qtd_w := qtd_w + 240;
        dbms_output.put_line(exibe_w);
    END LOOP;

    COMMIT;
END;

-- Testando a procedure
set serveroutput on;
set verify off;

BEGIN
    exibe_resume(4);
END;