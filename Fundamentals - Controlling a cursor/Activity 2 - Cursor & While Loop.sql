--@Author: Mauros

set serveroutput on;
set verify off;

accept wqtdaumento prompt 'Defina um valor para aumento de salario';
accept wdominio prompt 'Defina o dominio do endereço de e-mail de sua empresa';

DECLARE
    wqtdaumento NUMBER(5, 2) := &wqtdaumento;
    wdominio    VARCHAR(50) := '&wdominio';
    CURSOR c1 IS
    SELECT
        *
    FROM
        employees;

    employee    c1%rowtype;
BEGIN
    OPEN c1;
    FETCH c1 INTO employee;  -- For each row

    WHILE c1%found LOOP
        dbms_output.put_line('');
        dbms_output.put_line('Informações do funcionário (No momento):');
        dbms_output.put_line('  Nome completo: '
                             || employee.first_name
                             || ' '
                             || employee.last_name);

        dbms_output.put_line('  Salário: ' || employee.salary);
        dbms_output.put_line('  Endereço de e-mail: ' || employee.email);
        employee.salary := employee.salary * wqtdaumento;
        employee.email := lower(employee.email)
                          || wdominio;
        IF employee.commission_pct IS NULL THEN
            employee.commission_pct := 0.25;
        ELSE
            employee.commission_pct := employee.commission_pct * 2;
        END IF;

        dbms_output.put_line('Informações do funcionário (Após alterações):');
        dbms_output.put_line('  Nome completo: '
                             || employee.first_name
                             || ' '
                             || employee.last_name);

        dbms_output.put_line('  Salário: ' || employee.salary);
        dbms_output.put_line('  Endereço de e-mail: ' || employee.email);
        FETCH c1 INTO employee;  -- For each row

    END LOOP;

    CLOSE c1;
 --   ROLLBACK;
END;