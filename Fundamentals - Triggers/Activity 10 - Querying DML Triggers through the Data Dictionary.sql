--@Author: MaurosMJ

-- Todas as triggers que o usuário atual tem acesso:
select * from user_triggers;

-- Todas as triggers que o usuário atual com acesso e de outras triggers que tem privilegio:
select * from all_triggers;

-- Todas as triggers do banco de dados (dba only):
select * from dba_triggers;
