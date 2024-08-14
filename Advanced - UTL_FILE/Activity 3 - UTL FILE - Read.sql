--@Author: MaurosMJ

set serveroutput on
set verify off

DECLARE
    file_w    utl_file.file_type;
    vregistro VARCHAR2(500);
BEGIN

/*
32767 = Tamanho do buffer do arquivo
r = Read
ORACLE_FILES = Ponteiro do diretorio
*/

    file_w := utl_file.fopen('ORACLE_FILES', 'Lista de funcionarios.txt', 'r', 32767);
    LOOP
        utl_file.get_line(file_w, vregistro);
        dbms_output.put_line(vregistro);
    END LOOP;

EXCEPTION
    WHEN no_data_found THEN
        utl_file.fclose(file_w);
        dbms_output.put_line('');
        dbms_output.put_line('Arquivo de texto lido com sucesso!');
    WHEN utl_file.invalid_path THEN
        utl_file.fclose(file_w);
        dbms_output.put_line('Diretório Inválido');
    WHEN OTHERS THEN
        utl_file.fclose(file_w);
        dbms_output.put_line('Erro Oracle:'
                             || sqlcode
                             || sqlerrm);
END;