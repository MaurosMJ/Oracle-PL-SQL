--@Author: MaurosMJ

-- Listar todas dependencias
select name, type, referenced_type, dependency_type from user_dependencies; -- Dependencias diretas e indiretas de objetos do usuário atual

select name, type, referenced_type, dependency_type from all_dependencies; -- Dependencias diretas e indiretas de objetos do usuário atual e outros com privilégio

select name, type, referenced_type, dependency_type from dba_dependencies; -- todas dependencias (dba only)




-- Listar todas dependencias diretas de um obj
select name, type, referenced_type, dependency_type from user_dependencies where referenced_name = upper('EMPLOYEES') and referenced_type = upper('TABLE'); -- Dependencias diretas de um obj do usuário atual

select name, type, referenced_type, dependency_type from all_dependencies where referenced_name = upper('EMPLOYEES') and referenced_type = upper('TABLE'); -- Dependencias diretas de um obj do usuário atual e outros com privilégio

select name, type, referenced_type, dependency_type from dba_dependencies where referenced_name = upper('EMPLOYEES') and referenced_type = upper('TABLE'); -- todas dependencias diretas de um obj (dba only)



-- Listar todas dependencias diretas e indiretas de um obj
select name, type, referenced_owner, referenced_name, referenced_type, dependency_type from user_dependencies start with referenced_name = upper('employees') and referenced_type = upper('table') connect by prior name = referenced_name and type = referenced_type; -- Dependencias diretas e indiretas de um obj do usuário atual

select name, type, referenced_owner, referenced_name, referenced_type, dependency_type from user_dependencies start with referenced_name = upper('employees') and referenced_type = upper('table') connect by prior name = referenced_name and type = referenced_type; -- Dependencias diretas e indiretas de um obj do usuário atual e outros com privilégio

select name, type, referenced_owner, referenced_name, referenced_type, dependency_type from user_dependencies start with referenced_name = upper('employees') and referenced_type = upper('table') connect by prior name = referenced_name and type = referenced_type; -- Todas dependencias diretas e indiretas de um obj (dba only)