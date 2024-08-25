# PL/SQL

<div style="text-align:center;">
    <img src="https://5.imimg.com/data5/SELLER/Default/2022/7/FT/WW/IM/7756102/oracle-database-enterprise-edition-license-1-processor.png" alt="JDBC Logo" width="100" height="100">
</div>

### Comandos SQL no PL/SQL
* Você pode utilizar o comando `SELECT` para popular variáveis com valores recuperados a partir de uma linha de uma tabela.
* O PL/SQL suporta completamente os comandos `DML` e os comandos de controle de transação do SQL.

  
<div style="text-align:center;">
    <img src="https://imgur.com/fKkDsks.png" alt="PLSQL1">
</div>
  
### Bloco PL/SQL X Transação do banco de dados
* Um bloco PL/SQL não é uma unidade de transação.
* Os comandos `COMMIT`, `SAVEPOINT` e `ROLLBACK` são independentes do início e fim do bloco PL/SQL, no entanto, você pode executar estes comandos dentro de um bloco.

### Bloco PL/SQL X Comandos DDL
* O PL/SQL não suporta execução direta de comandos `DDL`.
* Para executar um comando `DDL` no bloco PL/SQL, você precisa utilizar `SQL Dinâmico`.

### Bloco PL/SQL X Comandos DCL
* O PL/SQL não suporta execução direta de comandos `DCL`.
* Para executar um comando `DCL` no bloco PL/SQL, você precisa utilizar `SQL Dinâmico`.

### Bloco PL/SQL X Instrução SELECT
* O comando `SELECT` no PL/SQL deve retornar uma e somente uma linha.
* Se o `SELECT` no PL/SQL retornar mais de uma linha, gera a exceção chamada `TOO_MANY_ROWS`.
* Se o `SELECT` no PL/SQL retornar nenhuma linha, gera a exceção chamada `NO_DATA_FOUND`.
* Você deve garantir que o comando `SELECT` retorne uma única linha.
* Para retornar mais de uma linha, é necessário utilizar um `CURSOR`.

### Bloco PL/SQL X Instrução INSERT
* Tem a mesma sintaxe e comportamento do comando `INSERT` no SQL.

### Bloco PL/SQL X Instrução UPDATE
* Mesma sintaxe e comportamento do comando `UPDATE` no SQL.

### Bloco PL/SQL X Instrução DELETE
* Mesma sintaxe e comportamento do comando `DELETE` no SQL.

### Transações em blocos PL/SQL
* Uma transação consiste de um conjunto de comandos `DML` que formam uma unidade lógica de trabalho.
* Uma transação de banco de dados consiste em um conjunto de comandos `DML`, um comando `DDL` (Commit automático) e um comando `DCL` (Commit automático).
* Uma transação começa em um dos seguintes eventos:
  * Você se conecta e um comando SQL `DML` é executado.
  * Após um comando `COMMIT`, um comando SQL `DML` é executado.
  * Após um comando `ROLLBACK`, um comando SQL `DML` é executado.
* Uma transação termina com um dos seguintes eventos:
  * Um comando `COMMIT`.
  * Um comando `ROLLBACK`.
  * Um comando `DDL` ou `DCL` (Executa `COMMIT` automático).
  * O usuário encerra sessão (desconecta) no SQL Developer, SQL\*Plus, etc.
  * Crash do sistema (Sistema operacional, rede, banco de dados, etc.).
* O comando `COMMIT` encerra a transação corrente, tornando todas as mudanças da transação pendentes no banco de dados permanentemente.
* O comando `ROLLBACK` encerra a transação corrente, desfazendo todas as mudanças da transação.
