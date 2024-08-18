--@Author: MaurosMJ

--Criando uma tabela com variavel do tipo CLOB
CREATE TABLE jobs_resumes (
    job_id     NUMBER,
    first_name VARCHAR2(200),
    last_name  VARCHAR2(200),
    resume     CLOB
);

--Criando uma sequence para jobs_resumes
CREATE SEQUENCE jobs_resumes_seq START WITH 1 INCREMENT BY 1 NOCACHE NOMAXVALUE NOCYCLE;
