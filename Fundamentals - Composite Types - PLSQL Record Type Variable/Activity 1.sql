set verify off;
set serverout on;

ACCEPT p_emp_id PROMPT 'Informe o ID do funcionario:';

DECLARE
    wtext           VARCHAR(150);
    wemp_id         employees.employee_id%TYPE := &p_emp_id;
    TYPE employee_record_type IS RECORD (
            wemployee_firstname    employees.first_name%TYPE,
            wemployee_lastname     employees.last_name%TYPE,
            wemployee_email        employees.email%TYPE,
            wemployee_phone_number employees.phone_number%TYPE,
            wemployee_salary       employees.salary%TYPE
    );
    employee_record employee_record_type;
BEGIN
    SELECT
        first_name,
        last_name,
        email,
        phone_number,
        salary
    INTO employee_record
    FROM
        employees
    WHERE
        employee_id = wemp_id;

    wtext := wtext
             || 'Nome do funcionario: '
             || employee_record.wemployee_firstname
             || ' '
             || employee_record.wemployee_lastname
             || chr(10);

    wtext := wtext
             || 'Endereço de email: '
             || employee_record.wemployee_email
             || chr(10);

    wtext := wtext
             || 'Numero de telefone: '
             || employee_record.wemployee_phone_number
             || chr(10);

    wtext := wtext
             || 'Salario: '
             || employee_record.wemployee_salary;
    dbms_output.put_line(wtext);
END;