SET SERVEROUTPUT ON;

DECLARE
 wNota1 number(10,2) := 10f; 
 wNota2 number(10,2) := 8f;
 wMedia number(10,2);
 wAlgo  number(10,2);
BEGIN
 wMedia := (wNota1+wNota2)/2f;
 DBMS_OUTPUT.PUT_LINE('Média = ' || wMedia);
END;
