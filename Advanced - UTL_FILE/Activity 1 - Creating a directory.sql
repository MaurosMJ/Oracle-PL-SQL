--@Author: MaurosMJ

--Criando um diretorio -> Ponteiro de diretório no Oracle Servidor (Como Sys)
create or replace directory ORACLE_FILES as 'C:\Oracle_files';

--Dando permissoes a um usuario (Como Sys)
grant read, write on directory ORACLE_FILES to hr;
