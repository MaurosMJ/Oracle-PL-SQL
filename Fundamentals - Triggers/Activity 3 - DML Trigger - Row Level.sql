@Author: MaurosMJ

-- Table

create table employees_log 
(employee_log_id number (11) not null,
dt_log date default sysdate,
ds_usuario varchar2 (30),
ds_evento char(1) not null,
employee_id number (6),
salary_old number (8,2),
salary_new number (8,2)
);

alter table employees_log add constraint employee_log_pk primary key (employee_log_id);

-- Trigger

create sequence employees_log_seq start with 1 increment by 1 nocache nocycle nomaxvalue;

CREATE OR REPLACE TRIGGER a_idu_valida_salario_r_trg AFTER
    INSERT OR DELETE OR UPDATE OF salary ON employees
    FOR EACH ROW
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

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        raise_application_error(-20001, 'Erro Oracle - '
                                        || sqlcode
                                        || sqlerrm);
END;

-- Testing update

UPDATE employees 
SET    salary = salary * 1.5;