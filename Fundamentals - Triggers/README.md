# PL/SQL

<div style="text-align:center;">
    <img src="https://5.imimg.com/data5/SELLER/Default/2022/7/FT/WW/IM/7756102/oracle-database-enterprise-edition-license-1-processor.png" alt="JDBC Logo" width="100" height="100">
</div>


### Database DML Triggers - Triggers
* Desenvolva uma Database DML Trigger para executar um bloco PL/SQL automaticamente quando um comando de manipulação de dados (DML) for executado para uma determinada tabela.
* Triggers (gatilho) são disparadas atuomaticamente quando ocorrer um evento para o qual elas foram declaradas.
* Uma database DML trigger é associada á uma Tabela ou visão.
* Triggers podem implementar regras mais complexas de negócio para tabelas ou visões.

### Database DML Triggers - Utilidades
* Manter um nível mais elevado de integridade dos dados, mais complexo que a utilização de constraints.
* Informações de auditoria de uma tabela, armazenando informações sobre as modificações realizadas.
* Automaticamente fazer a chamada a outros programas para realizar ações complementares.

### Database DML Triggers - Restrições
* A trigger faz parte da mesma transação do comando que a disparou o evento, então temos como restrição que uma trigger não pode fazer controle de transação, ou seja, não podem executar os comandos COMMIT, ROLLBACK ou SAVEPOINT a menos que seja declarado o PRAGMA AUTONOMOUS_TRANSACTION.
* O corpo de uma trigger não pode ser maior do que 32760 bytes, visto que o corpo de uma trigger é armazenado em uma coluna tipo LONG.
* Uma Database DML trigger é disparada quando um comando INSERT, UPDATE ou DELETE é executado sobre uma tabela ou visão do banco de dados.

### Database DML Triggers - Elementos
| Elemento       | Descrição       |
|----------------|----------------|
| Tempo    | Valores possíveis: BEFORE, AFTER e INSTEAD OF    |
| Evento    | Valores possíveis: INSERT, UPDATE [OF coluna] e DELETE    |
| Tipo    | Valores possíveis: STATEMENT (nível de comando - Default) e FOR EACH ROW (Nível de linha)    |
| Corpo    | Bloco PL/SQL  |

### Database DML Triggers - Sequência de disparo
* 1- Executar as Triggers BEFORE a nível de comando para os respectivos eventos e tabela, se existirem.
* 2- Para cada Linha afetada pelo comando:
  * 2.1 Executar as triggers Before a nível de linha para os respectivos evento e tabela, se existirem, então:
  * 2.2 Executar a ação do comando.
  * 2.3 Executar as triggers AFTER a nível de linha para os respectivos evento e tabela, se existirem.
* 3- Executar as triggers AFTER a nível de comando para os respectivos eventos e tabelas, se existirem.

### Database DML Triggers - Nível de comando e a nível de linha:
| DML Trigger a nível de comando       | DML Trigger a nível de linha       |
|----------------|----------------|
| Executa o corpo da Trigger uma única vez, sempre que um determinado comando de manipulação de dados for emitado para uma determinada tabala.    | Executa o corpo da Trigger uma vez para cada linha da tabela afetada pelo comando de manipulação que causou o disparo da Trigger.    |

### Database DML Triggers - Nivel de comando
* Triggers a nível de comando podem ser disparadas antes ou depois da execução do comando.
* Uma Trigger a nível de comando é disparada uma única vez, mesmo que várias linhas ou nenhuma linha sejam afetadas pelo comando.

### Database DML Triggers - Nivel de linha
* Triggers a nível de linha podem ser disparadas antes ou depois da manipulação da linha, para cada linha afetada pelo comando.
* Se o comando não afetar nenhuma linha, a trigger a nível de linha não será disparada.

### Database DML Triggers - Pseudo campos :OLD e :NEW
* Dentro de triggers em nível de linha é possível referenciar os valores existentes antes da manipulação de valores através do qualificador :OLD, e os valores a serem aplicados pela manipulação de dados com o qualificador :NEW.
* Os qualificadores :OLD e :NEW podem ainda ser substituídos por outros qualificadores através da cláusula opcional REFERENCING.

| Operação       | Valor OLD.COLUNA       | Valor NEW.COLUNA |
|----------------|----------------|----------------|
| INSERT | NULL | Valor inserido para a coluna |
| UPDATE | Valor da coluna antes do UPDATE | Valor da coluna aós o UPDATE |
| DELETE | Valor da coluna antes do DELETE | NULL |

### Mutating Tables
* São chamadas Mutating Tables aquelas tabelas que estão sofrendo alterações durante a execução da Trigger.
* A tabela á qual a trigger está associada é sempre uma Mutating Table, assim como qualquer tabela ligada á essa através de chave estrangeira.
* Essas características impedem um conjunto de dados inconsistentes (alterados, mas não confirmados).

### Regra 1 de Mutating Tables
* Regra 1 de Mutating Tables: Não altere dados em colunas de chaves primárias, chaves estrangeiras ou chaves únicas de tabelas relacionadas áquela na qual a trigger disparada está associada.
* Essa restrição é válida para todas triggers em nível de linha.
* Essa restrição é válida para todas triggers em nível de comando disparada como resultado de uma operação DELETE CASCADE.

### Regra 2 de Mutating Tables
* Regra 2 de Mutating Tables: Não leia informações de tabelas que estejam sendo modificadas.
* Essa restrição é válida para todas triggers em nível de linha.
* Essa restrição é válida para todas triggers em nível de comando disparada como resultado de uma operação DELETE CASCADE.
