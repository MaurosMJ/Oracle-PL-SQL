# PL/SQL

<div style="text-align:center;">
    <img src="https://5.imimg.com/data5/SELLER/Default/2022/7/FT/WW/IM/7756102/oracle-database-enterprise-edition-license-1-processor.png" alt="JDBC Logo" width="100" height="100">
</div>

### Procedures
* Uma `procedure` em PL/SQL é um bloco de código programável armazenado no banco de dados Oracle, que pode ser executado para realizar tarefas específicas, como operações em tabelas, cálculos ou até manipulação de dados. A `procedure` permite encapsular uma sequência de comandos SQL e lógica de programação, facilitando a reutilização e a manutenção do código.

### Criando Procedures de banco de dados
* Crie uma nova `procedure` utilizando o comando `CREATE OR REPLACE PROCEDURE` que irá gravar o código-fonte e o código compilado (P-CODE) no banco de dados Oracle.
* Se necessário, declare uma lista de argumentos (Parâmetros).
* Uma `procedure` pode ser salva no banco de dados, mesmo com erros de compilação.

### Procedures - Parâmetros
* Declare parâmetros (argumentos) para estabelecer comunicação entre o subprograma (`procedure` e `function`) e o programa chamador.
* Parâmetros devem ser declarados como um tipo de dado escalar (`VARCHAR2`, `NUMBER`, etc.) sem precisão, ou com um tipo `%TYPE` ou `%ROWTYPE`.

### Procedures - Tipos de Parâmetros
* `IN` [Default]
* `OUT` [`NOCOPY`]
* `IN OUT` [`NOCOPY`]

### Procedures - Tipo IN
* Recebe um valor como entrada passado pelo programa chamador.
* O tipo `IN` é o tipo default, ou seja, se não for especificado um tipo para um parâmetro, o tipo `IN` é assumido.
* Os parâmetros do tipo `IN` podem ser opcionais, declarando-se, após o tipo, uma cláusula `DEFAULT` e uma expressão pré-definida do mesmo tipo de parâmetro.
* Parâmetros opcionais assumem seus valores pré-definidos quando nenhum valor é passado para eles na chamada da `procedure`.

### Procedures - Tipo OUT
* Devolve um valor como saída para o programa chamador.

### Procedures - Tipo IN OUT
* Recebe um valor como entrada passado pelo programa chamador e devolve o valor (modificado ou não) como saída para o programa chamador.

### Procedures - Parâmetros com NOCOPY
* Os parâmetros `OUT` e `IN OUT` funcionam por cópia.
* É possível utilizarmos parâmetros `OUT` e `IN OUT` por referência, de modo que a área de memória usada pela variável do ambiente chamador e pelo parâmetro do subprograma sejam a mesma.

### Procedures - Métodos de passagem de parâmetros
* Método Posicional (Definido sequencialmente)
* Método Nomeado (Definido pelo operador `=>` para indicar a sequência).
