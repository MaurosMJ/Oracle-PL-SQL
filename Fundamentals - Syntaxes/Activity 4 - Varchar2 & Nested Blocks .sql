--@Author: MaurosMJ

SET SERVEROUTPUT ON;

<< bloco1 >> DECLARE
    wbloco1 VARCHAR2(100) := 'BLOCO 1';
BEGIN
    dbms_output.put_line(bloco1.wbloco1);
    << bloco2 >> DECLARE
        wbloco2 VARCHAR2(100) := 'BLOCO 2';
    BEGIN
        dbms_output.put_line(bloco2.wbloco2);
    END;

END;