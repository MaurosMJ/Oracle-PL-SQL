set serveroutput on;

DECLARE
BEGIN
    << loop1 >> FOR i IN 0..8 LOOP

        << loop2 >> FOR j IN 0..8 LOOP
            dbms_output.put_line('Valor de I: ' || i || ' Valor de J: ' || j);
            -- exit loop1 when i = 2;
        END LOOP;
    END LOOP;
END;