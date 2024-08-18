--@Author: MaurosMJ

-- Conectar como SYS (DBA):
create or replace directory imagens AS 'C:\Oracle\Imagens';

-- Atribuir permissoes de leitura e escrita no diretorio
GRANT READ, WRITE ON DIRECTORY imagens TO hr;

set serveroutput on
set verify off

DECLARE
    arquivoorigem_w BFILE;
    blobdestino_w   BLOB;
    nomearquivo_w   VARCHAR2(100) := 'systems_engineer.jpg';
    --Diretorio Oracle:
    diretorio_w     VARCHAR2(100) := 'IMAGENS';
BEGIN
    --Atribui uma referência (BFILE) ao diretorio e arquivo
    arquivoorigem_w := bfilename(diretorio_w, nomearquivo_w);
    IF dbms_lob.fileexists(arquivoorigem_w) = 1 THEN
        INSERT INTO job_profiles (
            profile_id,
            first_name,
            last_name,
            profile_picture
        ) VALUES (
            job_profiles_seq.nextval,
            'Mauros',
            'Milach',
            empty_blob()
        ) 
        -- Recebe o retorno do 'Insert' para 'blobdestino_w'
         RETURNING profile_picture INTO blobdestino_w;

        --Abre o arquivo
        dbms_lob.open(arquivoorigem_w, dbms_lob.lob_readonly);
        --Carrega o arquivo BFILE (arquivoorigem_w) para BLOB (blobdestino_w)
        dbms_lob.loadfromfile(blobdestino_w, arquivoorigem_w, dbms_lob.getlength(arquivoorigem_w));
        --Fecha o arquivo BFILE
        dbms_lob.close(arquivoorigem_w);
        COMMIT;
    ELSE
        dbms_output.put_line('Não existe este arquivo: ' || nomearquivo_w);
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        dbms_lob.close(arquivoorigem_w);
        raise_application_error(-20001, 'Erro Oracle '
                                        || sqlcode
                                        || sqlerrm);
END;

-- Verificando os registros
select * from job_profiles;