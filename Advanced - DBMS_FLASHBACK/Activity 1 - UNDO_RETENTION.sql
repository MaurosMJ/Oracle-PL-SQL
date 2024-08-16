--@Author: MaurosMJ

/*
Tempo de retenção UNDO (default 900).
Tempo em segundos.
Para cada transação será salvo na tablespace UNDO dentro do tempo estabelecido em parametro 'undo_retention'.
Se tempo maior que 'undo_retention', então = ORA-01555: snapshot too old,
Este erro ocorre porque o Oracle não conseguiu encontrar as informações de undo necessárias para reconstruir o estado dos dados no ponto solicitado.
*/

SELECT NAME, VALUE FROM V$PARAMETER WHERE NAME = 'undo_retention';

-- Conectar como SYS (Dba) e conceder privilegios:
grant execute on DBMS_FLASHBACK to hr;