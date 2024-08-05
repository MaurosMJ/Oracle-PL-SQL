--@Author: MaurosMJ

--Habilitando uma trigger:
ALTER TRIGGER a_idu_registra_log_funcionario_r_trg ENABLE;

--Desabilitando uma trigger:
ALTER TRIGGER a_idu_registra_log_funcionario_r_trg DISABLE;

--Desabilitando todas triggers de uma tabela:
ALTER TABLE employees DISABLE ALL TRIGGERS;

--Habilitando todas triggers de uma tabela:
ALTER TABLE employees ENABLE ALL TRIGGERS;

--Eliminando uma trigger 
DROP TRIGGER b_iud_validar_horario_r_trg;