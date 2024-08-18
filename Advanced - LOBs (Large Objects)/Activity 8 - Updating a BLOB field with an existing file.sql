--@Author: MaurosMJ

-- Atualizando um BLOB
DECLARE
    arquivoorigem_w BFILE;
    blobdestino_w   BLOB;
    nomearquivo_w   VARCHAR2(100) := 'onda.jpeg';
    diretorio_w     VARCHAR2(100) := 'IMAGENS';
BEGIN
    --Obtem BFILE atraves do diretorio + nome do arquivo
    arquivoorigem_w := bfilename(diretorio_w, nomearquivo_w);
    IF dbms_lob.fileexists(arquivoorigem_w) = 1 THEN
    -- Obtem o ponteiro do BLOB conforme ID do registro da tabela
        SELECT
            profile_picture
        INTO blobdestino_w
        FROM
            job_profiles
        WHERE
            profile_id = 1
        FOR UPDATE;

        --Abre o arquivo
        dbms_lob.open(arquivoorigem_w, dbms_lob.lob_readonly);
        dbms_lob.trim(blobdestino_w, 0);
        --Carrega informações no ponteiro do BLOB
        dbms_lob.loadfromfile(blobdestino_w, arquivoorigem_w, dbms_lob.getlength(arquivoorigem_w));
        --Fecha o arquivo
        dbms_lob.close(arquivoorigem_w);
        COMMIT;
    ELSE
        dbms_output.put_line('Arquivo: '
                             || nomearquivo_w
                             || ' não existe!');
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        dbms_lob.close(arquivoorigem_w);
        raise_application_error(-20001, 'Erro Oracle '
                                        || sqlcode
                                        || sqlerrm);
END;