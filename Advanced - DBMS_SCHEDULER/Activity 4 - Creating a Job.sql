--@Author: MaurosMJ

--Criando uma Job
begin

dbms_scheduler.create_job (
    job_name => '"HR"."JOB_INSERE_DATA_AGENDA"',
    program_name => '"HR"."INSERIR_AGENDA_PRG"',
    schedule_name => '"HR"."INSERIR_AGENDA_SCH"',
    auto_drop => FALSE,
    comments => 'Job que cria uma agenda',
    job_style => 'REGULAR'
);

end;

BEGIN

-- Habilitando Job
    dbms_scheduler.enable(name => '"HR"."JOB_INSERE_DATA_AGENDA"');

-- Dropando Job
-- dbms_scheduler.drop_job('JOB_INSERE_DATA_AGENDA');      

end;

-- Testando se está gerando registros
SELECT agenda_id, TO_CHAR(agenda_data,'dd/mm/yyyy hh24:mi:ss') AGENDA_DATA
FROM   agenda
ORDER BY agenda_id;

