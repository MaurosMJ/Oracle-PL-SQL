BEGIN
    deptree_fill(upper('OBJECT_TYPE'), upper('SCHEMA'), upper('OBJECT_NAME'));
END;

SELECT
    *
FROM
    deptree
ORDER BY
    seq#; -- 0: OBJETO ATUAL, 1: DEPENDENCIA DIRETA, >=2: DEPENDENCIA INDIRETA

SELECT
    *
FROM
    ideptree; -- NIVEL DE DEPENDENCIA POR TABULAÇÃO