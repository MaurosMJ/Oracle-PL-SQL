--@Author MaurosMJ
CREATE OR REPLACE PROCEDURE imprimemsg (
    p_msg IN VARCHAR2
) IS
--nothing to declare

BEGIN
    dbms_output.put_line(sysdate
                         || ': '
                         || p_msg);
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        raise_application_error(-20001, 'Erro Oracle -'
                                        || sqlcode
                                        || sqlerrm);
END;

alter procedure imprimemsg compile; --RECOMPILA A PROC

accept p_msg prompt 'Digite uma mensagem:'
begin
imprimemsg('Olá teste');
end;

drop procedure imprimemsg; --ELIMINA A PROC

