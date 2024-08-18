--@Author: MaurosMJ

-- DBA (sys) deve atribuir permissões de Flashback em uma tabela
GRANT FLASHBACK ON hr.employees_bkp TO hr;

-- Deve ser habilitado a movimentação de linha da tabela
ALTER TABLE hr.employees_bkp ENABLE ROW MOVEMENT;

-- Simulando acidentalmente excluir todos registros da tabela 'EMPLOYEES_BKP'
delete from employees_bkp;
commit;

-- Restaurando o estado da tabela há 250 minutos atrás
FLASHBACK TABLE hr.employees_bkp TO TIMESTAMP systimestamp - interval '250' minute;

-- Consultando como estão os registros:
select * from employees_bkp;

/*
Em uma situação real de uso do FLASHBACK TABLE seria necessário identificar todas
as constraints da tabela e utilizar o FLASHBACK TABLE nestas tabelas também para
que o banco de dados não fique inconsistente, esse tipo de situação pode gerar
perda de dados.
*/

FLASHBACK TABLE hr.employees_bkp, departments, jobs TO TIMESTAMP systimestamp - interval '250' minute;