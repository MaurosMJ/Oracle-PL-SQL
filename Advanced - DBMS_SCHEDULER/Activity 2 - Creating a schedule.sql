--Author: MaurosMJ

-- Criando um Schedule (a cada 10 segundos)
begin
dbms_scheduler.create_schedule(
schedule_name => 'INSERIR_AGENDA_SCH',
start_date => SYSTIMESTAMP,
--start_date => TO_TIMESTAMP_TZ('2020-03-17 15:17:36.000000000 AMERICA/SAO_PAULO','YYYY-MM-DD HH24:MI:SS.FF TZR'),
repeat_interval  => 'FREQ=SECONDLY;INTERVAL=10',
end_date => TO_TIMESTAMP_TZ('2024-08-12 23:00:00.000000000 AMERICA/SAO_PAULO','YYYY-MM-DD HH24:MI:SS.FF TZR'),
comments => 'AGENDA DA JOB'
);
end;

--Removendo um Schedule 
 
BEGIN
    DBMS_SCHEDULER.DROP_SCHEDULE (
        schedule_name  => 'INSERIR_AGENDA_SCH',
        force    => FALSE
        );
END;