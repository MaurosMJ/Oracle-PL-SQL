SET SERVEROUTPUT ON;

DECLARE
    wlocal CHAR(2) := 'RS';
BEGIN
    wlocal := 'SC';
    dbms_output.put_line('CHAR = ' || wlocal);
END;