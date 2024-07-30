set serverout on;

DECLARE
    wcargo        employees.job_id%TYPE;
    wmediasalario NUMBER(8, 2);
    wtotalsalario NUMBER(9, 2);
BEGIN
    wcargo := :wcargo;
    SELECT
        round(AVG(salary)),
        round(SUM(salary))
    INTO
        wmediasalario,
        wtotalsalario
    FROM
        employees
    WHERE
        job_id = wcargo;

    dbms_output.put_line('Cargo: ' || wcargo);
    dbms_output.put_line('Salário Médio: ' || wmediasalario);
    dbms_output.put_line('Salário Total: ' || wtotalsalario);
END;
