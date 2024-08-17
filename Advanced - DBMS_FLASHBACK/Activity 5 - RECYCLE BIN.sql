--@Author: MaurosMJ

/*
User = Usuario atual
All = Usuário atual e outros com privilégio
Dba = DBA apenas

Objetos podem ser excluidos de RECYCLEBIN caso faltar espaço na Tablespace pelo Oracle.
Objetos de RECYCLEBIN podem serem excluidos definitivamente atraves da instrução 'PURGE', exemplo: 'PURGE RECYCLEBIN;'.
Objetos do RECYCLEBIN continuam armazenados na mesma tablespace onde estavam originalmente.
*/

-- Lista de objetos excluidos (DROPADOS)
select * from USER_RECYCLEBIN;
select * from ALL_RECYCLEBIN;
select * from DBA_RECYCLEBIN;