set serveroutput on;

ACCEPT wqtdrepeticao PROMPT 'Repetir quantas vezes?';

DECLARE
    wqtdrepeticao NUMBER(5) := &wqtdrepeticao;
    wsum          NUMBER(5) := 0;
BEGIN
    FOR i IN 0..wqtdrepeticao LOOP
        dbms_output.put_line('Linha: ' || i);
    END LOOP;
END;