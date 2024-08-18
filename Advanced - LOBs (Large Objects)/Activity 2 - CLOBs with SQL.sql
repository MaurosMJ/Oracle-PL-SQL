--@Author: MaurosMJ

--Inserindo alguma informação através do SQL (CLOB vazio)
INSERT INTO jobs_resumes (
    job_id,
    first_name,
    last_name,
    resume
) VALUES (
    jobs_resumes_seq.NEXTVAL,
    'Mauros',
    'Milach',
    empty_clob()
);

--Inserindo alguma informação através do SQL (CLOB preenchido)
INSERT INTO jobs_resumes (
    job_id,
    first_name,
    last_name,
    resume
) VALUES (
    jobs_resumes_seq.NEXTVAL,
    'Mauros',
    'Milach',
    'Project Manager - Scrum Master, Blumenau, SC, Brasil'
);

COMMIT;

--Consultando informações através do SQL (Limite de 30 caracteres)
SELECT
    job_id,
    first_name,
    last_name,
    substr(resume, 1, 30)
FROM
    jobs_resumes;

--Consultando informações utilizando o DBMS_LOB.GETLENGTH (Limite conforme tamanho utilizado no campo)
SELECT
    job_id,
    first_name,
    last_name,
    dbms_lob.substr(resume,
                    dbms_lob.getlength(resume),
                    1)
FROM
    jobs_resumes;