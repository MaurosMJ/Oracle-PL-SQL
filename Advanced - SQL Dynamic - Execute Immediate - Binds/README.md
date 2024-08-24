# PL/SQL

<div style="text-align:center;">
    <img src="https://5.imimg.com/data5/SELLER/Default/2022/7/FT/WW/IM/7756102/oracle-database-enterprise-edition-license-1-processor.png" alt="JDBC Logo" width="100" height="100">
</div>


### SQL Dinâmico - Cenários
* Geração e execução de comandos SQL em tempo de execução.
* Quando você precisa executar um comando SQL DDL dentro do seu programa PL/SQL.
* O número ou tipo de dados de entradas e saídas é variável.

### SQL Dinâmico - Variaveis BIND
* Cada vez que um comando SQL:
  * O Oracle consulta a `shared pool`, que é uma área de memória que é uma parte da `SGA` (System Global área do Oracle) para verificar se o comando já foi submetido antes. 
  * Se o comando já esta na `shared pool`, o plano de execução para o comando é recuperado, e o comando SQL é executado.
* Cada vez que um comando é submetido:
  * Se o comando não for encontrado na `shared pool`, o Oracle terá que executar o processo de parsing do comando, e escolher entre vários planos de execução e escolher o melhor plano de execução, antes de executar o comando.
  * Este processo é conhecido como "`Hard parse`" e em aplicações `OLTP` realizar milhares ou milhões de "`Hard Parse`" podem causar perda de performance.
  * Utilizando BIND variáveis, nós reutilizaremos o SQL parsing que foi feito na primeira vez que o comando foi executado, evitando o "`Hard Parse`" toda vez que a procedure for executada.
  * Chamamos isso de "`Soft Parse`".