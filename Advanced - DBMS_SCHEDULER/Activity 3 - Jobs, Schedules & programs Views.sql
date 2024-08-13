--@Author: MaurosMJ

/*
User = Usuario atual
All = Usuário atual e outros com privilégio
Dba = DBA apenas
*/

-- Lista dos jobs agendados
select * from user_scheduler_jobs;
select * from all_scheduler_jobs;
select * from dba_scheduler_jobs;

-- Lista dos programas agendados
select * from user_scheduler_programs;
select * from all_scheduler_programs;
select * from dba_scheduler_programs;

-- Lista de Agendamentos 
select * from user_scheduler_schedules;
select * from all_scheduler_schedules;
select * from dba_scheduler_schedules;

-- Informações de logs de todos os jobs
select * from user_scheduler_job_log;
select * from all_scheduler_job_log;
select * from dba_scheduler_job_log;

-- Detalhes de execuções de jobs
select * from user_scheduler_job_run_details;
select * from all_scheduler_job_run_details;
select * from dba_scheduler_job_run_details;

-- Argumentos configurados para todos os Jobs
select * from user_scheduler_job_args;
select * from all_scheduler_job_args;
select * from dba_scheduler_job_args;

-- Argumentos configurados para todos os programas agendados
select * from user_scheduler_program_args;
select * from all_scheduler_program_args;
select * from dba_scheduler_program_args;
