--@Author: MaurosMJ

DECLARE
    nomearquivo_w   VARCHAR(100) := 'onda.jpeg';
    diretorio_w     VARCHAR(100) := 'IMAGENS';
    arquivoorigem_w BFILE;
BEGIN

-- Atribui ao tipo BFILE (Passando diretorio + Nome do arquivo)
    arquivoorigem_w := bfilename(diretorio_w, nomearquivo_w);
-- Se o arquivo existe no diretorio inserir o ponteiro na tabela
    IF dbms_lob.fileexists(arquivoorigem_w) = 1 THEN
        INSERT INTO job_profiles VALUES (
            job_profiles_seq.NEXTVAL,
            'Mauros',
            'Milach',
            arquivoorigem_w
        );

        COMMIT;
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        raise_application_error(-20001, 'Erro Oracle '
                                        || sqlcode
                                        || sqlerrm);
END;

--Verificando na tabela 'Job Profiles':
SELECT
    *
FROM
    job_profiles;