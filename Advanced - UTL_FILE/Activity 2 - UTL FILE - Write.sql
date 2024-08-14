--@Author: MaurosMJ

set serveroutput on
set verify off

DECLARE
    file_w utl_file.file_type;
    CURSOR employees_c IS
    SELECT
        employee_id,
        first_name,
        last_name,
        job_id,
        salary
    FROM
        employees;

BEGIN

/*
32767 = Tamanho do buffer do arquivo
w = Write
ORACLE_FILES = Ponteiro do diretorio
*/

    file_w := utl_file.fopen('ORACLE_FILES', 'Lista de funcionarios.txt', 'w', 32767);
    FOR employee_r IN employees_c LOOP
        utl_file.put_line(file_w, employee_r.employee_id
                                  || ';'
                                  || employee_r.first_name
                                  || ';'
                                  || employee_r.last_name
                                  || ';'
                                  || employee_r.job_id
                                  || ';'
                                  || employee_r.salary);
    END LOOP;

    utl_file.fclose(file_w);
    dbms_output.put_line('Arquivo Texto employees.txt gerado com sucesso');
EXCEPTION
    WHEN utl_file.invalid_path THEN
        utl_file.fclose(file_w);
        dbms_output.put_line('Diretório Inválido');
    WHEN utl_file.invalid_operation THEN
        utl_file.fclose(file_w);
        dbms_output.put_line('Operação invalida no arquivo');
    WHEN utl_file.write_error THEN
        utl_file.fclose(file_w);
        dbms_output.put_line('Erro de gravação no arquivo');
    WHEN utl_file.invalid_mode THEN
        utl_file.fclose(file_w);
        dbms_output.put_line('Modo de acesso inválido');
    WHEN OTHERS THEN
        utl_file.fclose(file_w);
        dbms_output.put_line('Erro Oracle:'
                             || sqlcode
                             || sqlerrm);
END;