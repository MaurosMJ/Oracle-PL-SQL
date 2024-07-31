set verify off;
set serverout on;
ACCEPT p_emp_id PROMPT 'Informe o ID do funcionario:';

DECLARE
    wtext           VARCHAR(150);
    wemp_id         employees.employee_id%TYPE := &p_emp_id;
    employee_record employees%rowtype;
BEGIN
    SELECT
        *
    INTO employee_record
    FROM
        employees
    WHERE
        employee_id = wemp_id;

    wtext := wtext
             || 'Nome do funcionario: '
             || employee_record.first_name
             || ' '
             || employee_record.last_name
             || chr(10);

    wtext := wtext
             || 'Endereço de email: '
             || employee_record.email
             || chr(10);

    wtext := wtext
             || 'Numero de telefone: '
             || employee_record.phone_number
             || chr(10);

    wtext := wtext
             || 'Salario: '
             || employee_record.salary;
    dbms_output.put_line(wtext);
END;