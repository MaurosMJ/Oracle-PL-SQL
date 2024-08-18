--@Author: MaurosMJ

-- Exportando uma imagem já existente no banco de dados (BLOB)
DECLARE
    arquivodestino_w     utl_file.file_type;
    buffer_w             RAW(32767);
    qtd_w                BINARY_INTEGER := 32767;
    posicao_w            INTEGER := 1;
    bloborigem_w         BLOB;
    tamanhoblob_w        INTEGER;
    nomearquivodestino_w VARCHAR2(100) := 'systems_engineer_copia.jpg';
    diretoriodestino_w   VARCHAR2(100) := 'IMAGENS';
    resumeid_w           NUMBER := 1;
BEGIN
    SELECT
        profile_picture
    INTO bloborigem_w
    FROM
        job_profiles
    WHERE
        profile_id = resumeid_w
    FOR UPDATE;

    tamanhoblob_w := dbms_lob.getlength(bloborigem_w);
    dbms_output.put_line('Tamanho do arquivo: ' || tamanhoblob_w);
    
    -- Cria um arquivo binario
    arquivodestino_w := utl_file.fopen(diretoriodestino_w, nomearquivodestino_w, 'wb', 32767);
    
  -- Leitura do BLOB e escrita no arquivo
    WHILE posicao_w < tamanhoblob_w LOOP
        dbms_lob.read(bloborigem_w, qtd_w, posicao_w, buffer_w);
        utl_file.put_raw(arquivodestino_w, buffer_w, TRUE);
        posicao_w := posicao_w + qtd_w;
    END LOOP;
  -- Fecha o arquivo.
    utl_file.fclose(arquivodestino_w);
EXCEPTION
    WHEN OTHERS THEN
        IF utl_file.is_open(arquivodestino_w) THEN
            utl_file.fclose(arquivodestino_w);
            raise_application_error(-20001, 'Erro Oracle '
                                            || sqlcode
                                            || sqlerrm);
        END IF;
END;