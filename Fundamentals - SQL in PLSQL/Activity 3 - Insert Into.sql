--@Author: MaurosMJ

DECLARE
    wfirstname     employees.first_name%TYPE;
    wlastname      employees.last_name%TYPE;
    wemail         employees.email%TYPE;
    wphone_number  employees.phone_number%TYPE;
    whire_date     DATE;
    wjob_id        employees.job_id%TYPE;
    wsalary        employees.salary%TYPE;
    wcommission    employees.commission_pct%TYPE;
    wmanager_id    employees.manager_id%TYPE;
    wdepartment_id employees.department_id%TYPE;
BEGIN
    wfirstname := :wfirstname; --Ex: Kobe
    wlastname := :wlastname; --Ex: Bryant
    wemail := :wemail; --Ex: KBRYANT
    wphone_number := :wphone_number; --Ex: 515.123.45568
    whire_date := :whire_date; --Ex: 22/03/1999
    wjob_id := :wjob_id; --Ex: IT_PROG
    wsalary := :wsalary; --Ex: 15000
    wcommission := :wcommission; --Ex: 0.4
    wmanager_id := :wmanager_id; --Ex: 103
    wdepartment_id := :wdepartment_id; --Ex: 60

    INSERT INTO employees (
        employee_id,
        first_name,
        last_name,
        email,
        phone_number,
        hire_date,
        job_id,
        salary,
        commission_pct,
        manager_id,
        department_id
    ) VALUES (
        employees_seq.NEXTVAL,
        wfirstname,
        wlastname,
        wemail,
        wphone_number,
        whire_date,
        wjob_id,
        wsalary,
        wcommission,
        wmanager_id,
        wdepartment_id
    );

    COMMIT;
END;
