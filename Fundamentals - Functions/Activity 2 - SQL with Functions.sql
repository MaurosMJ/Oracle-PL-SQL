--Author: MaurosMJ

CREATE OR REPLACE FUNCTION obter_cargo_por_jobid (
    p_job_id IN employees.job_id%TYPE
) RETURN VARCHAR2 AS
    w_cargo jobs.job_title%TYPE;
BEGIN
    SELECT
        upper(job_title)
    INTO w_cargo
    FROM
        jobs
    WHERE
        job_id = p_job_id;

    RETURN w_cargo;
EXCEPTION
    WHEN no_data_found THEN
        raise_application_error(-20001, 'Não encontrado cargo com esse ID.');
    WHEN OTHERS THEN
        raise_application_error(-20001, 'Erro Oracle - '
                                        || sqlcode
                                        || sqlerrm);
END;

ALTER FUNCTION obter_cargo_por_jobid COMPILE;

SELECT
    obter_cargo_por_jobid('IT_PROG')
FROM
    dual;

SELECT
    first_name,
    last_name,
    obter_cargo_por_jobid(job_id) Cargo
FROM
    employees;