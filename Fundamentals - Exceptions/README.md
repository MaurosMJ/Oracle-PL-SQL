# PL/SQL

<div style="text-align:center;">
    <img src="https://5.imimg.com/data5/SELLER/Default/2022/7/FT/WW/IM/7756102/oracle-database-enterprise-edition-license-1-processor.png" alt="JDBC Logo" width="100" height="100">
</div>

### Exception
* Exceções são eventos (normalmente erros), que podem ser tratados designando ações a serem tomadas quando uma exceção ocorre.
* Quando uma exceção ocorrer durante a execução do bloco PL/SQL, e não houver um tratamento para exceção, a exceção se propagará para o ambiente chamador do bloco PL/SQL.
* Se a exceção não for tratada no programa então propagará um Erro Oracle.

### Tipo de Exceptions
* Exceções pré-definidas Oracle, tais como: `TOO_MANY_ROWS`, `NO_DATA_FOUND`, etc.
* Exceções definidas pelo desenvolvedor e disparadas utilizando o comando `RAISE`.
* Exceções que interceptam erros Oracle não pré-definido utilizando `PRAGMA` `EXCEPTION_INIT`.

<div style="text-align:center;">
    <img src="https://imgur.com/760xQhQ.png" alt="exception 1">
</div>

### Método de disparo de exceções
* Um erro Oracle ocorre e a `Exception` associada ao erro é disparada automaticamente. Por exemplo, Erro `ORA-01403`, quando o `SELECT` no bloco PL/SQL não retorna linhas, exceção pré-definida Oracle `NO_DATA_FOUND` é disparada.
* Você dispara um exceção explicitamente executando o comando `RAISE` dentro do bloco. A exceção disparada pode ser uma exceção definida pelo desenvolvedor ou uma Exceção Pré-definida Oracle.

### Exceção Propagada
* Se a exceção disparada na seção `BEGIN` (executável) do bloco e não existir um tratamento de exceção correspondente na seção `EXCEPTION` do respectivo bloco onde a Exceção ocorreu, a exceção será propagada para o ambiente chamador.
* A exceção que foi propagada poderá ser tratada na seção `EXCEPTION` do ambiente chamador.
* O ideal é não deixar a `Exception` se propagar.
* É recomendado deixar `WHEN` `OTHERS` (Exceção não prevista).

### Exceções Pré-definidas Oracle
| Nome da Exceção       | Erro Oracle | Descrição |
|----------------|----------------|----------------|
| `COLLECTION_IS_NULL` | `ORA-06531` | Tentativa de aplicar métodos que não o `EXISTS` para uma `Collection` não inicializada. |
| `CURSOR_ALREADY_OPEN` | `ORA-06511` | Tentiva de abrir um `cursor` que já esta aberto. |
| `DUP_VAL_ON_INDEX` | `ORA-00001` | Tentativa de inserir um valor duplicado em um índice único. |
| `INVALID_CURSOR` | `ORA-01001` | Ocorreu uma operação ilegal em um `CURSOR`. |
| `INVALID_NUMBER` | `ORA-01722` | Falha na conversão de uma string caractere para numérica. |
| `LOGIN_DENIED` | `ORA-01017` | Conexão ao Oracle com um nome de usuário e/ou senha inválido. |
| `NO_DATA_FOUND` | `ORA-01403` | `SELECT` do tipo single-row não retornou nenhuma linha. |
| `NOT_LOGGED_ON` | `ORA-01012` | Programa PL/SQL executou uma chamada ao banco de dados sem estar conectado ao Oracle. |
| `TIMEOUT_ON_RESOURCE` | `ORA-00051` | Ocorreu um time-out enquanto o Oracle estava aguardando por um recurso. |
| `TOO_MANY_ROWS` | `ORA-01422` | `SELECT` do tipo single-row retornou mais que uma linha. |
| `VALUE_ERROR` | `ORA-06502` | Ocorreu um erro de aritmética, conversão ou truncamento. |
| `ZERO_DIVIDE` | `ORA-01476` | Tentativa de divisão por zero. |

### SQLCODE e SQLERRM
* A função `SQLCODE` retorna o código de erro Oracle que disparou a exceção.
* A função `SQLERRM` retorna a mensagem do erro Oracle que disparou a exceção.
* Com essas duas funções, podemos identificar uma exceção e capturar sua mensagem.

### Interrupções de programa
* É possível interromper a execução de um programa PL/SQL através de uma chamada a procedure pré-definida Oracle `RAISE_APPLICATION_ERROR`.
* A chamada a procedure `RAISE_APPLICATION_ERROR` gera uma exceção que você não tratará no seu programa, encerrando a execução do programa de forma anormal e retornando para o ambiente chamado uma mensagem no formato de mensagem de erro Oracle.

### RAISE_APPLICATION_ERROR
* A procedure possui três parâmetros: um número, uma string e um valor booleano (normalmente não incluso).
* O número é o código de erro a ser mostrado, e deve estar no intervalo [-20000, -20999], não existem erros ORA nessa faixa.
* A string contém o texto da mensagem de erro com até 2048 bytes de tamanho.
* Por último, opcionalmente, vem um valor tipo `BOOLEAN` que, se for `TRUE`, coloca o erro na pilha de erros prévios, e se for `FALSE` (o default), o erro sobrepõe outros erros.

### Exceções definidas pelo desenvolvedor
* O desenvolvedor pode criar suas próprias exceções declarando um identificador do tipo `EXCEPTION` na seção `DECLARE` do bloco PL/SQL.
* Esse identificador pode ser usado para desviar o fluxo de execução do programa para seção de tratamento de exceções através do comando `RAISE`.
* Esse identificador pode também ser usado para interceptar um erro Oracle existente para o qual não existe exceção pré-definida.

### PRAGMA EXCEPTION INIT
* Declara-se um identificador do tipo `Exception` e associa-se ele ao erro Oracle previsto através de uma chamada `PRAGMA` `EXCEPTION_INIT`.
* Dessa forma, se o erro ocorrer durante a execução do subprograma, o fluxo de execução será automaticamente desviado para a seção `EXCEPTION`, onde a Exceção será tratada.