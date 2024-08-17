--@Author: MaurosMJ

-- Dropando uma tabela acidentalmente (poderia ser qualquer outro objeto)
drop table employees_bkp;

-- Quando dropado, a tabela vai para RECYCLE BIN
select * from user_recyclebin;

-- Restaurando a tabela de RECYCLE BIN
FLASHBACK TABLE employees_bkp TO BEFORE DROP;

/*
User = Usuario atual
Dba = DBA apenas

Caso existir necessidade de eliminar definitivamente um objeto, então utilizar PURGE:
*/

-- Eliminando todos objetos de RECYCLE BIN
PURGE user_recyclebin;
PURGE DBA_RECYCLEBIN;

-- Eliminando um objeto especifico (Nesse exemplo: Tabela)
PURGE TABLE "nome_do_objeto";