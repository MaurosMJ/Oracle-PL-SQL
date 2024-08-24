# PL/SQL

<div style="text-align:center;">
    <img src="https://5.imimg.com/data5/SELLER/Default/2022/7/FT/WW/IM/7756102/oracle-database-enterprise-edition-license-1-processor.png" alt="JDBC Logo" width="100" height="100">
</div>


### CURSOR
* O Servidor Oracle utiliza áreas de trabalho chamadas private SQL areas para executar comandos SQL e para armazenar informações de processamento.
* Você pode utilizar `CURSORES` para nomear uma dessas áreas e acessar sua informações armazenadas.
* O `cursor` direciona todas as fases de processamento.

### Tipos de CURSOR:
### Collection - Métodos de controle
| Tipo de cursor       | Descrição |
|----------------|----------------|
| `Implícito` | `Cursores` implícitos são declarados implicitamente para todos os comandos DML e para comandos `SELECT` que retornam somente uma linha. |
| `Explícito` | Para consultas que retornam mais de uma linha, um `CURSOR` explícito pode ser declarado e nomeado pelo programador e manipulado através de comandos especificos no bloco PL/SQL. |

### Cursor Explícito
* Utilize cursores explícitos para individualmente processar cada linha retornada por um comando `SELECT` multi-row.
* O conjunto de linhas retornadas por uma consulta multi-row é denominado `result set`.
* Um programa PL/SQL abre um `cursor`, processa as linha retornadas pela consulta e então fecha o `CURSOR`.
* O `CURSOR` marca a posição corrente no `result set`.

<div style="text-align:center;">
    <img src="https://imgur.com/XNIxHWJ.png" alt="Cursor 1 Logo">
</div>

* `DECLARE`: Deve ser feito o `SELECT`.
* `OPEN`: Oracle executa o `CURSOR` (Instrução é executada).
* `FETCH`: Linhas do cursor vão para as variáveis do programa até não encontrar mais linhas.
* `CLOSE`: Libera recursos de memória do cursor (`result-set`).

<div style="text-align:center;">
    <img src="https://imgur.com/dcWelR2.png" alt="Cursor 2 Logo">
</div>

### Controlando Cursor Explícito:
* Declare o `cursor` nomeando e definindo a estrutura de consulta a ser executada dentro dele.
* Abra o cursor. O comando `OPEN` executa a consulta. As linhas identificadas pela consulta são chamadas de `active set` e ficam disponíveis para recuperação.
* Recupere os dados do `cursor`. O comando `FETCH` recupera a linha corrente do `cursor` para variáveis. cada `fetch` move o ponteiro do `cursor` para a próxima linha do `active set`. Portanto, cada `fetch` acessa uma linha diferente retornada pela consulta.
* Feche o `cursor`. O comando `CLOSE` libera o conjunto ativo de linhas.

### Atributos de Cursor Explicito:
| Método       | Tipo | Tipos de Collections
|----------------|----------------|----------------|
| `%ISOPEN` | `Boolean` | Retorna `TRUE` se o cursor estiver aberto.
| `%NOTFOUND` | `Boolean` | Retorna `TRUE` se o último `FETCH` não retornou uma linha.
| `%FOUND` | `Boolean` | Retorna `TRUE` se o último `FETCH` retornou uma linha.
| `%ROWCOUNT` | `Number` | Retorna o número de linhas recuperadas por `FETCH` até o momento.