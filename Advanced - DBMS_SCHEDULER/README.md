# PL/SQL

<div style="text-align:center;">
    <img src="https://5.imimg.com/data5/SELLER/Default/2022/7/FT/WW/IM/7756102/oracle-database-enterprise-edition-license-1-processor.png" alt="JDBC Logo" width="100" height="100">
</div>


### Advanced - DBMS_SCHEDULER
* A package `DBMS_SCHEDULER` possui um grande número de funções e procedimentos. Coletivamente estas funções são chamadas de Scheduler.
* O Scheduler fornece grandes funcionalidades para as necessidades de agendamento de processos.
* **Program**: Coleção de metadados sobre o qual será executado pelo Scheduler.
* Um programa pode ser uma procedure PL/SQL, um programa externo, tais como: um executável C, um script SHELL, uma aplicação Java, etc.
* Você pode especificar uma lista de argumentos para um programa.
* **Schedule**: Especifica quando e por quanto tempo o job será executado.
* **Job**: Especifica o que será executado (program) e em que período (schedule).

### Advanced - DBMS_SCHEDULER - Program:
* Para criar um programa utilize o procedimento `CREATE_PROGRAM`.
* Um programa é uma coleção de metadados sobre o que será executado pelo Scheduler.
* Para executar um programa basta registrar o programa em um Job juntamente com um Scheduler.
* Para criar um programa no seu próprio `SCHEMA`, é necessário o privilégio `CREATE JOB`.
* Para criar um programa no `SCHEMA` de outro usuário, é necessário o privilégio `CREATE ANY JOB`.
* Um programa por default é criado com estado `DESABILITADO`, um job não pode ser executado até que o programa seja `HABILITADO`.

### Advanced - DBMS_SCHEDULER - Schedule:
* `start_date` especifica quando que o SCHEDULE se tornará ativo.
* `end_date` especifica quando que o SCHEDULE ficará inativo.
* `repeat_interval` é uma expressão que se utiliza de dados do calendários ou sintaxe PL/SQL onde especifica qual a frequência de execução do JOB.
* A cláusula frequência é composta pelos seguintes elementos:
  * `YEARLY`
  * `MONTHLY`
  * `WEEKLY`
  * `DAILY`
  * `HOURLY`
  * `MINUTELY`
  * `SECONDLY`
* O intervalo de repetição é configurado entre 1 e 99.
* A outra cláusula de frequência é composta pelos seguintes elementos:
  * `BYMONTH`
  * `BYWEEKNO`
  * `BYYEARDAY`
  * `BYMONTHDAY`
  * `BYDAY`
  * `BYHOUR`
  * `BYMINUTE`
  * `BYSECOND`

### Advanced - DBMS_SCHEDULER - JOB:
* Assim como um programa, um job é criado com status `DESABILITADO`. É necessário `HABILITA-LO` explicitamente para que ele se torne ativo e agendado.
* Um JOB pode ser criado com os seguintes formatos:
  * Com um programa, com um agendamento.
  * Com um programa, sem um agendamento.
  * Sem um programa, com um agendamento.
  * Sem um programa, sem um agendamento.

### Advanced - DBMS_SCHEDULER - VISÕES - JOB:
| VISÃO       | DESCRIÇÃO       |
|----------------|----------------|
| `USER_SCHEDULER_JOB_ARGS`    | Argumentos configurados para todos os jobs.    |
| `USER_SCHEDULER_JOB_LOG`    | Informações de log de todos os jobs.    |
| `USER_SCHEDULER_JOB_RUN_DETAILS`    | Detalhes de execuções de jobs.    |
| `USER_SCHEDULER_JOBS`    | Lista de jobs agendados.  |

### Advanced - DBMS_SCHEDULER - VISÕES - Programs & Schedules:
| VISÃO       | DESCRIÇÃO       |
|----------------|----------------|
| `USER_SCHEDULER_PROGRAM_ARGS`    | Argumentos de todos os programas agendados.    |
| `USER_SCHEDULER_PROGRAM`    | Lista dos programas agendados.  |
| `USER_SCHEDULER_SCHEDULES`    | Agendamentos pertencentes ao usuário.    |
