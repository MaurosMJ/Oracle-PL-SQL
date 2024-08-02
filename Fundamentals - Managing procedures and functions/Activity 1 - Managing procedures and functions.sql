desc inserir_funcionario; -- Parametros de um objeto (Ex: Function e Procedure)

select object_name, object_type, last_ddl_time, timestamp, status from user_objects; -- OBJETOS DO USUARIO ATUAL;
select object_name, object_type, last_ddl_time, timestamp, status from all_objects; --OBJETOS DO USER ATUAL E OBJETOS COM PRIVILEGIO DO USUARIO (Ex: Objetos Oracle);
select object_name, object_type, last_ddl_time, timestamp, status from dba_objects; -- TODOS OBJETOS DA BASE (UTILIZAR USER 'SYS');

select object_name, object_type, last_ddl_time, timestamp, status from user_objects where status = upper('INVALID'); -- OBJETOS INVALIDOS DO USUARIO ATUAL;
select object_name, object_type, last_ddl_time, timestamp, status from all_objects where status = upper('INVALID'); --OBJETOS INVALIDOS DO USER ATUAL E OBJETOS COM PRIVILEGIO DO USUARIO (Ex: Objetos Oracle);
select object_name, object_type, last_ddl_time, timestamp, status from dba_objects where status = upper('INVALID'); -- TODOS OBJETOS INVÁLIDOS NA BASE (UTILIZAR USER 'SYS');

select name, type, line, position, text from user_errors; -- Erros encontrados em OBJETOS INVALIDOS DO USUARIO ATUAL;
select owner, name, type, line, position, text from all_errors; -- Erros encontrados em OBJETOS INVALIDOS DO USER ATUAL E OBJETOS COM PRIVILEGIO DO USUARIO (Ex: Objetos Oracle);
select owner, name, type, line, position, text from dba_errors; -- Erros encontrados em TODOS OBJETOS INVÁLIDOS NA BASE (UTILIZAR USER 'SYS');

select name, type, line, text from user_source where name = upper('OBTER_SALARIO_FUNCIONARIO'); -- CODIGO FONTE DE OBJETOS DO USUARIO ATUAL;
select name, type, line, text from all_source where name = upper(''); -- CODIGO FONTE DE OBJETOS DO USER ATUAL E OBJETOS COM PRIVILEGIO DO USUARIO (Ex: Objetos Oracle);
select name, type, line, text from dba_source where name = upper(''); -- CODIGO FONTE DE TODOS OBJETOS DA BASE (UTILIZAR USER 'SYS');

show error procedure inserir_funcionario; -- Mostra erros de compilação de um objeto