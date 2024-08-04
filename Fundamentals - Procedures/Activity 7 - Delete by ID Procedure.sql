--@Author: MaurosMJ

create or replace PROCEDURE deletar_funcionario (
    p_id_funcionario employees.employee_id%TYPE
) AS
-- nothing to declare
BEGIN
    DELETE FROM employees
    WHERE
        employee_id = p_id_funcionario;

    COMMIT;
EXCEPTION
    WHEN no_data_found THEN
        raise_application_error(-20001, 'Não foi encontrado dados para esse funcionario com esse ID');
when others then
        raise_application_error(-20002, 'Erro Oracle -' || sqlcode || sqlerrm);
END;