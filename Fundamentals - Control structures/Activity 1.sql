DECLARE
    wnota1    NUMBER(4, 2);
    wnota2    NUMBER(4, 2);
    wnota3    NUMBER(4, 2);
    wnota4    NUMBER(4, 2);
    wnota5    NUMBER(4, 2);
    wmediareg NUMBER(4, 2);
    wtext     VARCHAR(100);
BEGIN
    wnota1 := :wnota1; -- Ex: 10
    wnota2 := :wnota2; -- Ex: 9
    wnota3 := :wnota3; -- Ex: 8
    wnota4 := :wnota4; -- Ex: 7
    wnota5 := :wnota5; -- Ex: 6

-- Usando regra de precedência

    wmediareg := ( wnota1 + wnota2 + wnota3 + wnota4 + wnota5 ) / 5;
    wtext := wtext
             || 'Media utilizando Regra de precedência: '
             || wmediareg;

-- Printando Resultados:

    dbms_output.put_line(wtext);
END;