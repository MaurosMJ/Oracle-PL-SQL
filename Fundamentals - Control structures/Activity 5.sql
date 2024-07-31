set serveroutput on;

ACCEPT wqtdrepeticao PROMPT 'Repetir quantas vezes?';

DECLARE
    wqtdrepeticao NUMBER(5) := &wqtdrepeticao;
    wsum          NUMBER(5) := 0;
BEGIN
    LOOP
        wsum := wsum + 1;
        dbms_output.put_line('Linha: ' || wsum);
        EXIT WHEN wsum = wqtdrepeticao;
    END LOOP;
END;

