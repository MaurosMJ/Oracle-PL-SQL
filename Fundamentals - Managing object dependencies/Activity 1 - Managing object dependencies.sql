--@Author: MaurosMJ

/*
User = Usuario atual
All = Usuário atual e outros com privilégio
Dba = DBA apenas
*/

-- Listar todas dependencias diretas e indiretas de todos os objetos (sem where)
select name, type, referenced_type, dependency_type from user_dependencies;
select name, type, referenced_type, dependency_type from all_dependencies;
select name, type, referenced_type, dependency_type from dba_dependencies;

-- Listar todas dependencias diretas de um objeto específico (com where)
select name, type, referenced_type, dependency_type from user_dependencies where referenced_name = upper('EMPLOYEES') and referenced_type = upper('TABLE');
select name, type, referenced_type, dependency_type from all_dependencies where referenced_name = upper('EMPLOYEES') and referenced_type = upper('TABLE');
select name, type, referenced_type, dependency_type from dba_dependencies where referenced_name = upper('EMPLOYEES') and referenced_type = upper('TABLE');

-- Listar todas dependencias diretas e indiretas de um objeto específico (com where)
select name, type, referenced_owner, referenced_name, referenced_type, dependency_type from user_dependencies start with referenced_name = upper('employees') and referenced_type = upper('table') connect by prior name = referenced_name and type = referenced_type;
select name, type, referenced_owner, referenced_name, referenced_type, dependency_type from user_dependencies start with referenced_name = upper('employees') and referenced_type = upper('table') connect by prior name = referenced_name and type = referenced_type;
select name, type, referenced_owner, referenced_name, referenced_type, dependency_type from user_dependencies start with referenced_name = upper('employees') and referenced_type = upper('table') connect by prior name = referenced_name and type = referenced_type;