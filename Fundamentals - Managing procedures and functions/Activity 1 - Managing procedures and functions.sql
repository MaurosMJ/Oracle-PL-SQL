--@Author: MaurosMJ

/*
User = Usuario atual
All = Usuário atual e outros com privilégio
Dba = DBA apenas
*/

--Parametros de um objeto (Ex: Function e Procedure)
desc inserir_funcionario;

-- Mostra erros de compilação de um objeto
show error procedure inserir_funcionario;

--Lista de objetos
select object_name, object_type, last_ddl_time, timestamp, status from user_objects;
select object_name, object_type, last_ddl_time, timestamp, status from all_objects;
select object_name, object_type, last_ddl_time, timestamp, status from dba_objects;

--Lista de objetos inválidos
select object_name, object_type, last_ddl_time, timestamp, status from user_objects where status = upper('INVALID');
select object_name, object_type, last_ddl_time, timestamp, status from all_objects where status = upper('INVALID');
select object_name, object_type, last_ddl_time, timestamp, status from dba_objects where status = upper('INVALID');

--Lista de erros em objetos inválidos
select name, type, line, position, text from user_errors;
select owner, name, type, line, position, text from all_errors;
select owner, name, type, line, position, text from dba_errors;

--Lista do código fonte dos objetos do banco de dados
select name, type, line, text from user_source where name = upper('OBTER_SALARIO_FUNCIONARIO');
select name, type, line, text from all_source where name = upper('');
select name, type, line, text from dba_source where name = upper('');