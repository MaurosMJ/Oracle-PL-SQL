CREATE OR REPLACE PROCEDURE aumentar_salario_funcionario (
    p_id_funcionario IN employees.employee_id%TYPE,
    p_percentual     IN NUMBER
) IS
-- nothing to declare
BEGIN
    UPDATE employees
    SET
        salary = salary + ( ( salary * p_percentual ) / 100 )
    WHERE
        employee_id = p_id_funcionario;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        raise_application_error(-20001, 'Erro Oracle - '
                                        || sqlcode
                                        || sqlerrm);
END;

BEGIN
    aumentar_salario_funcionario(109, 10);
END;