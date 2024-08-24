# PL/SQL

<div style="text-align:center;">
    <img src="https://5.imimg.com/data5/SELLER/Default/2022/7/FT/WW/IM/7756102/oracle-database-enterprise-edition-license-1-processor.png" alt="JDBC Logo" width="100" height="100">
</div>


### Advanced - DBMS_FLASHBACK
* A package `DBMS_FLASHBACK` permite ao usuário uma imagem consistente do banco até um ponto específico no passado.
* Esta imagem é recriada utilizando os segmentos de `UNDO` e somente está disponível se os blocos de `UNDO` ainda estiverem disponíveis.
* A Package `DBMS_FLASHBACK` pode ser utilizada para: 
  * Você efetivou a transação (`COMMIT`) e quer ver como os dados estavam anteriormente.
  * Você pode utilizar os resultados da consulta de flashback para ajustar os dados para a situação anterior se necessário.
  * Por exemplo, você removeu acidentalmente linhas de uma tabela, você pode recuperar as linhas removidas.
* Existem dois métodos para utilização da Package:
  * Definimos um momento no tempo no passado para recuperação dos dados.
  * Utilizamos o valor do `SYSTEM CHANGE NUMBER (SCN)` para retornarmos os dados para o passado.

### Advanced - Flashback Table
* O `Flashback Table` permite fazer uma recuperação de uma ou mais tabela para uma determinada posição do tempo no passado sem a necessidade de se restaurar um backup do banco de dados.
* Quando você utiliza o `Flashback Table`, todos os objetos associados, como índices, constraints e triggers também são restaurados.
* Se um dos seguintes comandos forem executados, o comando de flashback não poderá mais ser utilizado:
  * `ALTER TABLE ... DROP COLUMN`
  * `ALTER TABLE ... DROP PARTITION`
  * `CREATE CLUSTER`
  * `TRUNCATE TABLE`
  * `ALTER TABLE ... MOVE`
* Você deve possuir o privilégio `FLASHBACK TABLE` ou `FLASHBACK ANY TABLE` para poder utilizar o `FLASHBACK`.

### Advanced - LIXEIRA
* A lixeira contém todos os objetos dropados até que:
  * Você elimine o objeto com o comando `PURGE`.
  * Você restaure o objeto dropado com o comando `BEFORE DROP`.
  * A tablespace necessite ser extendida.
* Você pode visualizar os objetos que estão na lixeira utilizando a seguinte visão do dicionário:
  * `USER_RECYCLEBIN` - Todos os objetos dropados pelo usuário.
  * `RECYCLEBIN` (sinônimo).


### Advanced - Flashback Query (Interval)
* `INTERVAL 'X' YEAR`
* `INTERVAL 'X' MONTH`
* `INTERVAL 'X' DAY`
* `INTERVAL 'X' HOUR`
* `INTERVAL 'X' MINUTE`
* `INTERVAL 'X' SECOND`
* `INTERVAL 'X-Y' YEAR TO MONTH`
* `INTERVAL 'X Y:Z' DAY TO MINUTE`
* `INTERVAL 'X:Y' HOUR TO MINUTE`
* `INTERVAL 'X:Y.Z' MINUTE TO SECOND`
