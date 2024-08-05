--Author: MaurosMJ

-- Trigger

CREATE OR REPLACE TRIGGER a_idu_registra_log_funcionario_r_trg AFTER
    INSERT OR DELETE OR UPDATE OF salary ON employees
    FOR EACH ROW
    WHEN ( new.job_id <> 'AD_PRES' )
DECLARE
    wevento      employees_log.ds_evento%TYPE;
    wemployee_id employees_log.employee_id%TYPE;
BEGIN
    CASE
        WHEN inserting THEN
            wevento := 'I';
            wemployee_id := :new.employee_id;
        WHEN updating THEN
            wevento := 'U';
            wemployee_id := :new.employee_id;
        ELSE
            wevento := 'D';
            wemployee_id := :old.employee_id;
--
    END CASE;

    INSERT INTO employees_log (
        employee_log_id,
        dt_log,
        ds_usuario,
        ds_evento,
        employee_id,
        salary_old,
        salary_new
    ) VALUES (
        employees_log_seq.NEXTVAL,
        sysdate,
        user,
        wevento,
        wemployee_id,
        :old.salary,
        :new.salary
    );

EXCEPTION
    WHEN OTHERS THEN
        raise_application_error(-20001, 'Erro Oracle - '
                                        || sqlcode
                                        || sqlerrm);
END;

-- Testing Trigger

truncate table employees_log;

UPDATE employees 
SET    salary = salary * 1.5;
commit;
