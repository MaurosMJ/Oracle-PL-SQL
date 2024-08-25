# PL/SQL

<div style="text-align:center;">
    <img src="https://5.imimg.com/data5/SELLER/Default/2022/7/FT/WW/IM/7756102/oracle-database-enterprise-edition-license-1-processor.png" alt="JDBC Logo" width="100" height="100">
</div>

### Oracle PL/SQL
* O Oracle PL/SQL (Procedural Language/Structured Query Language) é uma extensão da linguagem SQL (Structured Query Language) usada no Oracle Database. Ele permite que desenvolvedores escrevam código procedural, como loops, condicionais, e outras estruturas de controle de fluxo, diretamente dentro do banco de dados.

<div style="text-align:center;">
    <img src="https://imgur.com/fKkDsks.png" alt="PLSQL1">
</div>
  
## Índice
1. [Oracle PL/SQL](#oracle-plsql)
2. [Variáveis](#variáveis)
3. [Variáveis - Literal String](#variáveis---literal-string)
4. [Variáveis - Declarando variáveis](#variáveis---declarando-variáveis)
5. [DataTypes](#datatypes)
6. [DataTypes - Tipo NUMBER](#datatypes---tipo-number)
7. [DataTypes - Tipo CHAR](#datatypes---tipo-char)
8. [DataTypes - Tipo VARCHAR2](#datatypes---tipo-varchar2)
9. [DataTypes - Tipo BOOLEAN](#datatypes---tipo-boolean)
10. [DataTypes - Tipo LONG e LONG RAW](#datatypes---tipo-long-e-long-raw)
11. [DataTypes - Tipo DATE](#datatypes---tipo-date)
12. [DataTypes - Tipo TIMESTAMP](#datatypes---tipo-timestamp)
13. [DataTypes - Tipo TIMESTAMP with TIMEZONE](#datatypes---tipo-timestamp-with-timezone)
14. [DataTypes - NCHAR e NVARCHAR2](#datatypes---nchar-e-nvarchar2)
15. [DataTypes - BINARY_INTEGER](#datatypes---binary_integer)
16. [DataTypes - Regra de nomenclatura](#datatypes---regra-de-nomenclatura)
17. [DataTypes - Atribuindo valores para variáveis](#datatypes---atribuindo-valores-para-variáveis)
18. [DataTypes - Declarando variáveis utilizando %TYPE](#datatypes---declarando-variáveis-utilizando-type)
19. [DataTypes - Variável BIND](#datatypes---variável-bind)
20. [DataTypes - Referenciando variáveis BIND](#datatypes---referenciando-variáveis-bind)
21. [DataTypes - Comentando o código](#datatypes---comentando-o-código)
22. [Utilizando funções no bloco PL/SQL](#utilizando-funções-no-bloco-plsql)
23. [DataTypes - Funções de conversão de tipos](#datatypes---funções-de-conversão-de-tipos)
24. [DataTypes - Blocos Aninhados](#datatypes---blocos-aninhados)
25. [DataTypes - Escopo de Identificadores](#datatypes---escopo-de-identificadores)
26. [Padrões de Código - Convenções de Codificação](#padrões-de-código---convenções-de-codificação)
27. [Padrões de Código - Convenções de Nomenclatura](#padrões-de-código---convenções-de-nomenclatura)
28. [Savepoints](#savepoints)
29. [ROLLBACK to SAVEPOINT no PL/SQL](#rollback-to-savepoint-no-plsql)
30. [Cursor Implícito](#cursor-implícito)
31. [Cursor Implícito - Atributos](#cursor-implícito---atributos)
  
| Comando | Descrição |
|---------|----------------|
| **DML** (Data Manipulation Language) | Conjunto de comandos usados para manipular dados em tabelas. Exemplos incluem `INSERT`, `UPDATE`, `DELETE`, e `SELECT`. |
| **DDL** (Data Definition Language)   | Conjunto de comandos usados para definir a estrutura do banco de dados, como criar ou alterar tabelas e esquemas. Exemplos incluem `CREATE`, `ALTER`, `DROP`, e `TRUNCATE`. |
| **DCL** (Data Control Language)      | Conjunto de comandos usados para controlar o acesso ao banco de dados e seus objetos. Exemplos incluem `GRANT` e `REVOKE`. |
| **TCL** (Transaction Control Language) | Conjunto de comandos usados para gerenciar transações no banco de dados. Exemplos incluem `COMMIT`, `ROLLBACK`, e `SAVEPOINT`. |
| **DQL** (Data Query Language)        | Subconjunto de DML que se refere exclusivamente à consulta de dados. O principal comando é o `SELECT`. |
  
### Variáveis
* Você pode criar identificadores quando define um componente de programa.
* Variáveis definidas pelo usuário devem ter no máximo 30 caracteres e iniciar com uma letra (podem incluir `$`, `#`, ou `_`).
* Elas não podem conter sinais de pontuação, espaços ou hífen.

### Variáveis - Literal String
* São definidas colocando um conjunto de caracteres até o tamanho máximo do tipo de dado. Geralmente utilizamos VARCHAR2 para um conjunto de caracteres entre aspas simples.
* Os valores para string literal são case sensitive.

### Variáveis - Declarando variáveis
* Declare e inicialize variáveis dentro da seção `DECLARE`.
* Declarações de variáveis ou constantes alocam espaço de armazenamento para um valor, especificam seu tipo de dado e nome, de forma que você possa referenciá-la.
* Declarações também podem atribuir um valor inicial e impor a restrição `NOT NULL`.

### DataTypes:
* Um tipo de dado escalar armazena um único valor e não possui componentes internos.
* Tipos de dados escalares podem ser classificados em quatro categorias: numérico, caractere, data e booleano.
* Tipos de dados caractere e numérico possuem subtipos.

### DataTypes - Tipo NUMBER:
* O tipo `NUMBER` suporta números.
* São definidos especificando `NUMBER(p,s)`.
* `p` é o número máximo de dígitos (precisão).
* `s` é o número de decimais (escala).
* Obs.: O ponto decimal não é armazenado internamente.
* Obs.: `NUMBER` pode ter até no máximo 38 dígitos.

### DataTypes - Tipo CHAR:
* O tipo de dado `CHAR` é um tipo de dado base para strings de tamanho fixo.
* O tamanho máximo para um tipo de dado `CHAR` no PL/SQL é 32767 bytes.
* O tamanho padrão é 1 byte.
* Obs.: O tamanho máximo de um tipo de dado `CHAR` no SQL é 2.000 bytes.

### DataTypes - Tipo VARCHAR2:
* O tipo de dado `VARCHAR2` é o tipo de dado base para strings de tamanho variável.
* O tamanho máximo de um `VARCHAR2` é de 32767 bytes.
* Obs.: O tamanho máximo de uma coluna `VARCHAR2` no SQL é de 4000 bytes.

### DataTypes - Tipo BOOLEAN:
* O tipo de dado `BOOLEAN` possui três valores possíveis: `TRUE`, `FALSE` e `NULL`.

### DataTypes - Tipo LONG e LONG RAW:
* O tipo de dado `LONG` armazena uma string de caracteres. O tipo de dado `LONG RAW` armazena binários.
* O tipo de dado `LONG` possui um tamanho máximo de até 32760 bytes no PL/SQL.
* O tipo de dado `LONG RAW` possui um tamanho máximo de até 32760 bytes no PL/SQL.
* Obs.: O tamanho máximo de um tipo de dado `LONG` no SQL é 2G - 1.
* Obs.: O tamanho máximo de um tipo de dado `LONG RAW` no SQL é 2G.

### DataTypes - Tipo DATE:
* O tipo de dado `DATE` é o tipo de dado base para datas. O intervalo válido é a partir de 1 de janeiro de 4712 AC até 31 de dezembro de 9999 DC.

### DataTypes - Tipo TIMESTAMP:
* O **subtipo** `TIMESTAMP` estende o tipo de dado `DATE`, oferecendo um tempo com tamanho máximo de 9 dígitos de segundos após o decimal.

### DataTypes - Tipo TIMESTAMP with TIMEZONE:
* O **subtipo** `TIMESTAMP` estende o tipo de dado `DATE`, oferecendo um tempo com tamanho máximo de 9 dígitos de segundos após o decimal, incluindo UTC.

### DataTypes - NCHAR e NVARCHAR2:
* Caracteres e strings UNICODE existem para suportar globalização utilizando conjuntos de caracteres universais.
* `AL16UTF16` ou `UTF8` são conjuntos de caracteres universais fornecidos pelo banco de dados Oracle.
* `AL16UTF16` armazena todos os caracteres em 2 bytes físicos.
* `UTF8` armazena todos os caracteres em 3 bytes físicos.

### DataTypes - BINARY_INTEGER:
* O tipo de dado `BINARY_INTEGER` é numérico sem decimais.
* Armazena números inteiros na faixa entre 2.147.483.648 até 2.147.483.647 como 32 bits ou 4 bytes.
* Cálculos são mais eficientes com números inteiros do que com um tipo de dado `NUMBER` porque consome menos espaço em memória.

### DataTypes - Regra de nomenclatura:
* Dois objetos podem possuir o mesmo nome, desde que sejam definidos em blocos diferentes.
* Não utilize o mesmo nome (identificador) para uma variável que o nome de colunas de tabela utilizadas no bloco, para evitar ambiguidade.

### DataTypes - Atribuindo valores para variáveis:
* Para atribuir um valor para uma variável, você escreve um comando de atribuição PL/SQL.
* Você deve explicitamente nomear a variável para receber o novo valor à esquerda do operador de atribuição (`:=`).

### DataTypes - Declarando variáveis utilizando %TYPE:
* Ao invés de codificar o tipo de dado e a precisão de uma variável, você pode utilizar o atributo `%TYPE` para declarar uma variável de acordo com uma coluna do banco de dados ou outra variável.
* O atributo `%TYPE` é frequentemente utilizado quando o valor armazenado em uma variável é derivado de uma coluna de uma tabela do banco de dados.

### DataTypes - Variável BIND:
* Uma variável tipo BIND é uma variável que você declara em um ambiente externo ao bloco, e então a utiliza para passar valores em tempo de execução para um ou mais blocos PL/SQL que podem utilizá-la como qualquer outra variável.
* Você pode referenciar variáveis BIND declaradas em um ambiente externo ao bloco dentro do bloco PL/SQL.

### DataTypes - Referenciando variáveis BIND:
* Para referenciar variáveis BIND, você deve prefixar a referência com o caractere `:` para distinguir de variáveis declaradas no bloco PL/SQL.

### DataTypes - Comentando o código:
* Utilize dois hífens (`--`) se o comentário for de uma única linha após o término do comando (`;`) ou se for um comentário de somente uma linha.
* Inicie o comentário com o símbolo `/*` e termine o comentário com o símbolo `*/` se o comentário se estender por mais de uma linha.

### Utilizando funções no bloco PL/SQL:
* Podemos utilizar os seguintes tipos de funções SQL em expressões PL/SQL:
  * Funções numéricas;
  * Funções caractere;
  * Funções de conversão de tipo de dados;
  * Funções de data;
  * Funções genéricas;
  * Outras funções definidas pelo usuário.
* Não podemos utilizar os seguintes tipos de funções em expressões PL/SQL:
  * `DECODE`
  * Funções de grupo: `AVG`, `MIN`, `MAX`, `COUNT`, `SUM`, `STDDEV` e `VARIANCE`.

### DataTypes - Funções de conversão de tipos:
* Podemos utilizar funções SQL de conversão em expressões PL/SQL:
  * `TO_CHAR`
  * `TO_NUMBER`
  * `TO_DATE`

### DataTypes - Blocos Aninhados
* Uma das vantagens do PL/SQL é a possibilidade de criar e aninhar blocos.
* Você pode dividir uma parte lógica de um bloco em sub-blocos.
* A seção `EXCEPTION` também pode conter blocos e sub-blocos aninhados.

### DataTypes - Escopo de Identificadores
* Um identificador é visível no bloco no qual é declarado e em todos os sub-blocos aninhados.
* Se o bloco não encontrar o identificador declarado localmente, ele procura na seção declarativa do bloco externo (bloco pai).
* O bloco nunca procura o identificador para baixo nos sub-blocos (filhos) ou lateralmente para blocos de mesmo nível (irmãos).
* O escopo se aplica para todos os objetos declarados, incluindo variáveis, cursores, exceções definidas pelo usuário e constantes.

### Padrões de Código - Convenções de Codificação
| Categoria       | Convenção Sugerida       |
|----------------|----------------|
| Comandos SQL    | Letras maiúsculas    |
| Palavras-chave    | Letras maiúsculas    |
| Tipos de dados    | Letras maiúsculas    |
| Nomes de identificadores e parâmetros    | Letras minúsculas  |
| Nomes de tabelas e colunas    | Letras maiúsculas  |

### Padrões de Código - Convenções de Nomenclatura
| Categoria       | Convenção       |
|----------------|----------------|
| Variável    | Prefixo `v`    |
| Constante    | Prefixo `c`    |
| Cursor    | Sufixo `_cursor`    |
| Exceção    | Prefixo `e`  |
| Tipo Record    | Sufixo `_record_type`  |
| Variável Record    | Sufixo `_record`  |
| Parâmetro    | Prefixo `p`  |
| Variável Global    | Prefixo `g`  |

### Savepoints
* A instrução `SAVEPOINT` no Oracle PL/SQL é usada para definir um ponto de salvamento em uma transação. Esse ponto de salvamento permite que você desfaça (`rollback`) parte de uma transação até o ponto específico sem desfazer a transação inteira.

### ROLLBACK to SAVEPOINT no PL/SQL
* O comando "`ROLLBACK TO SAVEPOINT nome_savepoint`" descarta todas as mudanças realizadas a partir do `SAVEPOINT`.
* O comando "`ROLLBACK TO SAVEPOINT nome_savepoint`" não encerra a transação do banco de dados.
* `SAVEPOINTS` são feitos apenas para a sessão atual do usuário.
* Quando utilizado `COMMIT`, o `SAVEPOINT` é desfeito.

### Cursor Implícito
* Sempre que você executa um comando SQL, o servidor Oracle abre uma área de memória na qual o comando é analisado e executado. Esta área é chamada `CURSOR`.
* Quando a parte executável (seção `BEGIN`) de um bloco emite um comando SQL, o PL/SQL cria um cursor implícito. O PL/SQL administra este cursor automaticamente.

### Cursor Implícito - Atributos
| Atributo       | Descrição       |
|----------------|----------------|
| `SQL%ROWCOUNT`    | Número de linhas afetadas pelo cursor, ou seja, pelo último comando SQL.    |
| `SQL%FOUND`    | Retorna `TRUE` se o cursor afetou uma ou mais linhas.    |
| `SQL%NOTFOUND`    | Retorna `TRUE` se o cursor não afetou nenhuma linha.    |
| `SQL%ISOPEN`    | Retorna `FALSE`, porque o Oracle controla o cursor implícito automaticamente, fechando o cursor.  |

### Operadores PL/SQL
| Formato       | Descrição       |
|----------------|----------------|
| `+`    | Operador Soma.    |
| `-`    | Operador Subtração.    |
| `*`    | Operador Multiplicação.    |
| `/`    | Operador Divisão.  |
| `**`    | Operador Exponenciação.  |
| `NOT`    | Negação lógica.  |
| `=, <, >, <=, >=, IS NULL, LIKE, BETWEEN, IN, !=, <>, ^=, ~=` | Operadores de comparação.  |
| `AND`    | Operador lógico AND.  |
| `OR`    | Operador lógico OR.  |

### Regra de Precedência
| Ordem       | Operador       |
|----------------|----------------|
| 1    | `**`    |
| 2    | `+, -` (sinais)    |
| 3    | `*,/`    |
| 4    | +,-, \|\|  |
| 5    | `=, <, >, <=, >=, IS NULL, LIKE, BETWEEN, IN, !=, <>, ^=, ~=`  |
| 6    | `AND`  |
| 7 | `NOT`  |
| 8    | `OR`  |

### Utilizando Parênteses para Sobrepor a Regra de Precedência
* Utilize parênteses para sobrepor a regra de precedência dos operadores.
* Tudo que estiver entre parênteses será resolvido primeiro.
* Se você aninhar parênteses, eles serão resolvidos de dentro para fora.

### Prompt de Entrada de Dados
* Para entrada de dados, utilize a instrução `ACCEPT <variavel> PROMPT <Texto para o usuário>`.

### Saída de Instrução PL/SQL
* Para habilitar/desabilitar a saída da instrução PL/SQL na aba de output, utilize `SET VERIFY <ON/OFF>`.

### DBMS_OUTPUT
* Os procedimentos desta package se destinam a mostrar texto na tela.
* Distribua comandos da package `DBMS_OUTPUT` no código do programa que deseja depurar para mostrar mensagens de aviso e conteúdos de variáveis.
* Depois de depurado o código, retire os comandos e disponibilize o programa para outros usuários.

### Anonymous Blocks
* Inicia com o `Declare` (Opcional):
  * Contém variáveis e constantes. 
* `Begin` (Obrigatório):
  * Contém comandos SQL e PL/SQL que serão executadas no bloco.
* `Exception` (Opcional):
  * Contém as ações a serem executadas para tratamento das exceções que forem disparadas pelos comandos `BEGIN`. 
  
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

### Estruturas de controle - Loop
* O PL/SQL fornece diversos comandos de estruturas de `LOOP` para repetir um comando ou sequência de comandos várias vezes.
* `LOOP` básico: Fornece ações repetitivas sem condições globais.
* `FOR LOOP`: Fornece controle de repetições de ações baseado em um contador.
* `WHILE LOOP`: Fornece controle de repetições de ações baseado em uma condição.
* O comando `EXIT` encerra um `LOOP` em qualquer tipo de construção.

### Estruturas de controle - Loop - Instrução Exit
* A instrução `EXIT` encerra um `LOOP` em qualquer tipo de construção.
* Utilizando o comando `EXIT`, o controle passa para o próximo comando após o comando `END LOOP`.

### Estruturas de controle - LOOPs aninhados e Labels
* Você pode aninhar `LOOP`s em vários níveis.
* Normalmente o término de um `LOOP` aninhado não encerra o `LOOP` externo, a menos que uma exceção seja disparada.
* Você pode colocar label em um `LOOP` externo desta forma e sair de `LOOP` interno e do externo utilizando o comando `EXIT` nome label.

### Collection - Sobre:
* Collections são estruturas utilizadas para gerenciamento de múltiplas linhas de dados.
* Collections são listas (vetores).

### Collection - Tipos:
* `Associative Arrays`.
* `Nested Table`.
* `VARRAY`.

### Collection - Associative Array:
* Associative Array são estruturas uni-dimencionais de tipos de dados Oracle, registros ou tipo definidos pelo usuário.
* Conhecida como `index-by-tables` no Oracle 8 e 9i e como PL/SQL tables no Oracle 7.
* Pode ser indexada por valores numéricos ou caracter, permitindo buracos na numeração do índice.
* É semelhante a um vetor, não podendo ser armazenada no banco de dados.

### Collection - Associative Array - Diretrizes:
* Basta atribuir um valor para a ocorrência do `Associative Array`.
* Pode ser indexado com qualquer valor numérico, o que significa valores negativos, positivos ou também o zero.
* Pode ser indexado também por strings de caracteres.
* Obrigatória a cláusula `INDEX BY` na definição do tipo.

### Collection - Bulk Collect
* Utilizado para jogar todas as linhas em uma variável, muito útil em `arrays`.
* `Rowtype` recebe todos atributos de uma tabela.

### Collection - Nested Table
* Nested Table são estruturas uni-dimensionais de tipos de dado Oracle, registros ou tipos definidos pelo usuário.
* Introduzida no Oracle 8. Inicialmente definida como sendo um vetor inicialmente sem espaços vazios na definição, mas pode se tornar esparsa quando registros forem removidos.
* Pode ser armazenada em tabelas e acessada por comandos SQL (Não é recomendado armazenar em tabelas).
* Pode ser dinamicamente estendida.

### Collection - Nested Table - Diretrizes
* Elementos precisam ser alocados com o método `EXTEND` para serem definidos.
* Indexada com valores positivos (de 1 até N).
* Deve ser inicializada.
* Sem a cláusula `INDEX BY` na declaração do tipo.

### Collection - VARRAY
* `VARRAY` são estruturas uni-dimensionais de tipos de dados Oracle, registros ou tipos definidos pelo usuário.
* Introduzida no Oracle 8. Semelhante a programação tradicional de vetor.
* O Oracle permite que seja de tamanho variável, por isso são chamadas `VARRAY`.
* O tamanho máximo deve ser especificado na declaração do tipo.
* Necessário definir o limite de tamanho para o `VARRAY`.

### Collection - Métodos de controle
| Métodos       | Descrição | Tipo de Collections |
|----------------|----------------|----------------|
| `EXISTS(n)` | Retorna `TRUE` se o elemento n existe. | Todos |
| `COUNT` | Retorna o número de elementos. | Todos |
| `FIRST` | Retorna o primeiro número do índice. Retorna `NULL` se a Collection está vazia. | Todos |
| `LAST` | Retorna o último número do índice. Retorna `NULL` se a Collection está vazia. | Todos |
| `LIMIT` | Retorna o maior possível do índice. | `VARRAY` |
| `PRIOR(n)` | Retorna o número do índice anterior n. | Todos |
| `NEXT(n)` | Retona o número do índice posterior a n. | Todos |
| `EXTEND(n)` | Para aumentar o tamanho: `EXTEND` adiciona um elemento nulo. `EXTEND` (n) adiciona n elementos nulos. `EXTEND` (n, i) adiciona n cópias do elemento i. | `Nested Table` e `VARRAY` |
| `TRIM` | `TRIM` remove um elemento do final da Collection. `TRIM` (n) remove n elementos do final da Collection. | `Nested Table` |
| `DELETE` | `DELETE` remove todos os elementos de uma Collection. `DELETE`(n) remove o elemento n da Collection. `DELETE`(m,n) remove todos os elementos na faixa m...n da Collection. | `Associative Array` ou `Nested Table` |

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

### Functions
* Uma função é uma sub-rotina que sempre retorna um valor.
* Utilize uma função ao invés de uma procedure quando a rotina retornar obrigatoriamente um valor.
* Se a rotina retornar nenhum ou mais de um valor, considere o uso de uma procedure.

### Functions - Utilizando parâmetros
* O retorno de uma FUNCTION é definido pela cláusula RETURN.
* Funções também podem ter parâmetros OUT e IN OUT embora isso não seja muito utilizado em funcões.

### Functions - Regras em comandos SQL
* As funções devem ser armazenadas no servidor de banco de dados.
* A função deve ser do tipo single-row.
* No corpo da função, não podem haver comandos DML.
* A função deve conter apenas parâmetros do tipo "IN".
* Tipos PL/SQL, tais como BOOLEAN, RECORD ou TABLE não são aceitos como o tipo de retorna da unção.
* No corpo da função, não são permitidas chamdas á subrotinas que desobedeçam quaisquer das restrições anteriores.

### Gerenciamento de dependências
* Sempre que um objeto do banco de dados for alterado, todos os objetos do mesmo banco de dados que dependem diretamente ou indiretamente dele são invalidados (status '`INVALID`') automaticamente em cascata.
* Quando um programa fizer uma chamada a uma procedure ou function com status '`INVALID`' o oracle automaticamente tentará recomplicar o objeto.

### Dependência direta
* Um procedimento ou função depende diretamente de um objeto quando o referencia diretamente dentro do seu bloco PL/SQL.

### Dependência indireta
* Um procedimento ou função depende indiretamente de um objeto se ele referencia um objeto intermediário que referencia outros objetos causando uma cadeia de dependências em relação ao objeto.

### Dependência Local
* Dependência Local é uma dependência entre objetos que estão no mesmo banco de dados.

### Tratamento de dependências locais diretas
* Faça os devidos ajustes e re-compile todos os objetos que possuem dependências direta ou indireta do objeto alterado.

### Consultando dependências utilizando a view do Oracle:
* Consulte as dipendências diretas e indiretas utilizando as visões `USER_DEPENDENCIES`, `ALL_DEPENDENCIES`, e `DBA_DEPENDENCIES`.

### UTLDTREE
* O `UTLDTREE` é uma tabela auxiliar interna do Oracle Database que é usada pelo Oracle para armazenar informações relacionadas à construção de árvores hierárquicas durante a execução de consultas SQL que envolvem hierarquias. Por exemplo, em consultas que utilizam a cláusula `CONNECT BY` para criar hierarquias, o Oracle pode utilizar tabelas temporárias como `UTLDTREE` para armazenar as relações de pai e filho enquanto a consulta é processada.

### Executando o script UTLDTREE
* Crie as visões `DEPTREE` e `IDEPTREE` executando o script "`UTLDTREE.SQL`" fornecido juntamente com o banco de dados Oracle.
* O script "`UTLDTREE.SQL`" pode ser encontrado no diretório: ORACLE_HOME/rdbms/admin.
* Execute o script "`UTLDTREE.SQL`" conectado com o usuário `OWNER` do objeto para o qual você deseja analisar as dependências.

### Gerenciamento procedures e functions
* Consulte informações sobre as procedures e funções armazenadas no banco de dados consultando as visões USER_OBJECTS, ALL_OBJECTS, e DBA_OBJECTS do dicionário de dados.

### Consultando Script de procedures e functions
* Consulte scripts sobre as procedures e funções armazenadas no banco de dados consultando as visões USER_SOURCE, ALL_SOURCE, e DBA_SOURCE do dicionário de dados.

### Packages
* Uma `package` é um pacote que composto de uma área de especificação (`package` `specification`) e um corpo (`package` `body`) armazenados separadamento no banco de dados.
* A `Package` `Specification` é a interface público para a aplicação e declara as construções disponíveis para uso público.
* A `Package` `Body` implementa a especificação.

### Funcionalidade da Package
* A funcionalidade de uma `package` é similar a de uma `stored procedure`. Uma vez escrita e compilada, seu conteúdo pode ser compartilhado por várias aplicações.
* O maior benefício é que na primeira vez em que uma construção `package` for referenciada, toda a `package` é carregada em memória.

<div style="text-align:center;">
    <img src="https://imgur.com/HAPwArV.png" alt="Package_1">
</div>

### Packages - Vantagens
* Organização de `procedures` e `functions` de banco de dados, agrupando `procedures` e `functions` relacionadas.
* Modularização do desenvolvimento da aplicação.
* Possibilita a criação de identificadores globais que podem ser referenciados durante a sessão.
* **Performance** - Toda Package é colocada na **memória** na primeira chamada, **reduzindo acesso a disco**, visto que estatisticamente é muito provável que outros componentes `package` deverão ser referenciados.
* Gerenciamento de `procedures` e `functions` mais simples.
* Gerenciamento de segurança mais simples.

### Componentes (construções) de uma Package
* `Variável`
* `Constante`
* `Cursor`
* `Exception`
* `Procedure`
* `Function`

### Componentes (construções) Públicos de uma Package
* Componentes (ou construções) públicos de uma `package` são aqueles que podem ser referenciados externamente a `package`.
* Devem ser declarados no `Package Specification` e definidos no `Package Body`.

### Package Specification - Variavel Global
* Quando você declara uma variável no `Package Specification` você está declarando uma variável Global.
* Uma variável Global terá valor durante toda a Sessão do Oracle.
* Uma Sessão do Oracle começa quando você se conecta e termina quando você se desconecta do banco de dados Oracle.
* Quando público pode ser referênciado de fora da `Package`.
* Quando privado, apenas dentro da `Package`.

### Packages Body - Variavel Global
* Defina um bloco (procedimento) para ser executado uma única vez na sessão, somente na primeira vez que um componente da `package` for referenciado na sessão do banco de dados.
* Este procedimento pode ser utilizado para inicializações a nível de sessão.

### Referenciando componentes de uma Package
* Referencie um componente de uma `package` a partir de um componente da própria `package` ou construções externas a ela.
* Somente os componentes (construções) públicos de uma `package` podem ser referenciados por construções externas a `package`.

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
* A trigger faz parte da mesma transação do comando que a disparou o evento, então temos como restrição que uma trigger não pode fazer controle de transação, ou seja, não podem executar os comandos `COMMIT`, `ROLLBACK` ou `SAVEPOINT` a menos que seja declarado o `PRAGMA AUTONOMOUS_TRANSACTION`.
* O corpo de uma trigger não pode ser maior do que 32760 bytes, visto que o corpo de uma trigger é armazenado em uma coluna tipo `LONG`.
* Uma Database DML trigger é disparada quando um comando `INSERT`, `UPDATE` ou `DELETE` é executado sobre uma tabela ou visão do banco de dados.

### Database DML Triggers - Elementos
| Elemento       | Descrição       |
|----------------|----------------|
| Tempo    | Valores possíveis: `BEFORE`, `AFTER` e `INSTEAD OF`    |
| Evento    | Valores possíveis: `INSERT`, `UPDATE` [OF coluna] e `DELETE`    |
| Tipo    | Valores possíveis: `STATEMENT` (nível de comando - Default) e `FOR EACH ROW` (Nível de linha)    |
| Corpo    | Bloco PL/SQL  |

### Database DML Triggers - Sequência de disparo
* 1- Executar as Triggers `BEFORE` a nível de comando para os respectivos eventos e tabela, se existirem.
* 2- Para cada Linha afetada pelo comando:
  * 2.1 Executar as triggers `BEFORE` a nível de linha para os respectivos evento e tabela, se existirem, então:
  * 2.2 Executar a ação do comando.
  * 2.3 Executar as triggers `AFTER` a nível de linha para os respectivos evento e tabela, se existirem.
* 3- Executar as triggers `AFTER` a nível de comando para os respectivos eventos e tabelas, se existirem.

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
* Dentro de triggers em nível de linha é possível referenciar os valores existentes antes da manipulação de valores através do qualificador `:OLD`, e os valores a serem aplicados pela manipulação de dados com o qualificador `:NEW`.
* Os qualificadores `:OLD` e `:NEW` podem ainda ser substituídos por outros qualificadores através da cláusula opcional `REFERENCING`.

| Operação       | Valor OLD.COLUNA       | Valor NEW.COLUNA |
|----------------|----------------|----------------|
| `INSERT` | `NULL` | Valor inserido para a coluna |
| `UPDATE` | Valor da coluna antes do `UPDATE` | Valor da coluna aós o `UPDATE` |
| `DELETE` | Valor da coluna antes do `DELETE` | `NULL` |

### Mutating Tables
* São chamadas Mutating Tables aquelas tabelas que estão sofrendo alterações durante a execução da Trigger.
* A tabela á qual a trigger está associada é sempre uma Mutating Table, assim como qualquer tabela ligada á essa através de chave estrangeira.
* Essas características impedem um conjunto de dados inconsistentes (alterados, mas não confirmados).

### Regra 1 de Mutating Tables
* Regra 1 de Mutating Tables: Não altere dados em colunas de chaves primárias, chaves estrangeiras ou chaves únicas de tabelas relacionadas áquela na qual a trigger disparada está associada.
* Essa restrição é válida para todas triggers em nível de linha.
* Essa restrição é válida para todas triggers em nível de comando disparada como resultado de uma operação `DELETE CASCADE`.

### Regra 2 de Mutating Tables
* Regra 2 de Mutating Tables: Não leia informações de tabelas que estejam sendo modificadas.
* Essa restrição é válida para todas triggers em nível de linha.
* Essa restrição é válida para todas triggers em nível de comando disparada como resultado de uma operação `DELETE CASCADE`.

### SYS_REFCURSOR
* `SYS_REFCURSOR` é declarado no pacote `STANDARD` (pacote default do PL/SQL).
* É uma declaração "fraca" do tipo Cursor `IS REF CURSOR`.

### SYS_REFCURSOR - Variável Cursor e Reference Cursor
* Uma variável `Cursor` é uma variável que aponta para um `Cursor` ou para um `result set`.
* Você pode passar uma variável `Cursor` como argumento para uma `procedure` ou `function`.

### Bulk Collect - For ALL & Limit
* Comandos `INSERT`, `UPDATE` e `DELETE` utilizam Collections para modificar múltiplas linhas de dados muito rapidamente.
* Nós utilizamos a funcionalidade `FOR ALL` para executar comandos DML para todas as linhas de uma Collection.
* `FOR ALL` empacota as atualizações para o `SQL ENGINE` com um único `CONTEXT SWITCH`.
* Collections PL/SQL são essencialmente arrays em memória.
* Collections muito grandes consomem grandes quantidades de memória o que pode degradar o sistema.
* Em algumas situações, pode ser necessário dividir os dados processados em pedaços para tornar o código mais eficiente quanto ao consumo de memória.
* Esta divisão pode ser alcançada utilizando a cláusula `LIMIT` para a sintaxe do `BULK COLLECT`.

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
  
### DBMS_SCHEDULER
* A package `DBMS_SCHEDULER` possui um grande número de funções e procedimentos. Coletivamente estas funções são chamadas de Scheduler.
* O Scheduler fornece grandes funcionalidades para as necessidades de agendamento de processos.
* **Program**: Coleção de metadados sobre o qual será executado pelo Scheduler.
* Um programa pode ser uma procedure PL/SQL, um programa externo, tais como: um executável C, um script SHELL, uma aplicação Java, etc.
* Você pode especificar uma lista de argumentos para um programa.
* **Schedule**: Especifica quando e por quanto tempo o job será executado.
* **Job**: Especifica o que será executado (program) e em que período (schedule).

### DBMS_SCHEDULER - Program:
* Para criar um programa utilize o procedimento `CREATE_PROGRAM`.
* Um programa é uma coleção de metadados sobre o que será executado pelo Scheduler.
* Para executar um programa basta registrar o programa em um Job juntamente com um Scheduler.
* Para criar um programa no seu próprio `SCHEMA`, é necessário o privilégio `CREATE JOB`.
* Para criar um programa no `SCHEMA` de outro usuário, é necessário o privilégio `CREATE ANY JOB`.
* Um programa por default é criado com estado `DESABILITADO`, um job não pode ser executado até que o programa seja `HABILITADO`.

### DBMS_SCHEDULER - Schedule:
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

### DBMS_SCHEDULER - JOB:
* Assim como um programa, um job é criado com status `DESABILITADO`. É necessário `HABILITA-LO` explicitamente para que ele se torne ativo e agendado.
* Um JOB pode ser criado com os seguintes formatos:
  * Com um programa, com um agendamento.
  * Com um programa, sem um agendamento.
  * Sem um programa, com um agendamento.
  * Sem um programa, sem um agendamento.

### DBMS_SCHEDULER - VISÕES - JOB:
| VISÃO       | DESCRIÇÃO       |
|----------------|----------------|
| `USER_SCHEDULER_JOB_ARGS`    | Argumentos configurados para todos os jobs.    |
| `USER_SCHEDULER_JOB_LOG`    | Informações de log de todos os jobs.    |
| `USER_SCHEDULER_JOB_RUN_DETAILS`    | Detalhes de execuções de jobs.    |
| `USER_SCHEDULER_JOBS`    | Lista de jobs agendados.  |

### DBMS_SCHEDULER - VISÕES - Programs & Schedules:
| VISÃO       | DESCRIÇÃO       |
|----------------|----------------|
| `USER_SCHEDULER_PROGRAM_ARGS`    | Argumentos de todos os programas agendados.    |
| `USER_SCHEDULER_PROGRAM`    | Lista dos programas agendados.  |
| `USER_SCHEDULER_SCHEDULES`    | Agendamentos pertencentes ao usuário.    |

### UTL_FILE
* Os comandos necessários para o desenvolvimento de rotinas para ler e escrever dados em arquivos encontram-se na package UTL_FILE.
* Disponível a partir da versão 7.3 do Oracle.

### DBMS_SCHEDULER
* A package `DBMS_SCHEDULER` possui um grande número de funções e procedimentos. Coletivamente estas funções são chamadas de Scheduler.
* O Scheduler fornece grandes funcionalidades para as necessidades de agendamento de processos.
* **Program**: Coleção de metadados sobre o qual será executado pelo Scheduler.
* Um programa pode ser uma procedure PL/SQL, um programa externo, tais como: um executável C, um script SHELL, uma aplicação Java, etc.
* Você pode especificar uma lista de argumentos para um programa.
* **Schedule**: Especifica quando e por quanto tempo o job será executado.
* **Job**: Especifica o que será executado (program) e em que período (schedule).

### DBMS_SCHEDULER - Program:
* Para criar um programa utilize o procedimento `CREATE_PROGRAM`.
* Um programa é uma coleção de metadados sobre o que será executado pelo Scheduler.
* Para executar um programa basta registrar o programa em um Job juntamente com um Scheduler.
* Para criar um programa no seu próprio `SCHEMA`, é necessário o privilégio `CREATE JOB`.
* Para criar um programa no `SCHEMA` de outro usuário, é necessário o privilégio `CREATE ANY JOB`.
* Um programa por default é criado com estado `DESABILITADO`, um job não pode ser executado até que o programa seja `HABILITADO`.

### DBMS_SCHEDULER - Schedule:
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

### DBMS_SCHEDULER - JOB:
* Assim como um programa, um job é criado com status `DESABILITADO`. É necessário `HABILITA-LO` explicitamente para que ele se torne ativo e agendado.
* Um JOB pode ser criado com os seguintes formatos:
  * Com um programa, com um agendamento.
  * Com um programa, sem um agendamento.
  * Sem um programa, com um agendamento.
  * Sem um programa, sem um agendamento.

### DBMS_SCHEDULER - VISÕES - JOB:
| VISÃO       | DESCRIÇÃO       |
|----------------|----------------|
| `USER_SCHEDULER_JOB_ARGS`    | Argumentos configurados para todos os jobs.    |
| `USER_SCHEDULER_JOB_LOG`    | Informações de log de todos os jobs.    |
| `USER_SCHEDULER_JOB_RUN_DETAILS`    | Detalhes de execuções de jobs.    |
| `USER_SCHEDULER_JOBS`    | Lista de jobs agendados.  |

### DBMS_SCHEDULER - VISÕES - Programs & Schedules:
| VISÃO       | DESCRIÇÃO       |
|----------------|----------------|
| `USER_SCHEDULER_PROGRAM_ARGS`    | Argumentos de todos os programas agendados.    |
| `USER_SCHEDULER_PROGRAM`    | Lista dos programas agendados.  |
| `USER_SCHEDULER_SCHEDULES`    | Agendamentos pertencentes ao usuário.    |

### DBMS_FLASHBACK
* A package `DBMS_FLASHBACK` permite ao usuário uma imagem consistente do banco até um ponto específico no passado.
* Esta imagem é recriada utilizando os segmentos de `UNDO` e somente está disponível se os blocos de `UNDO` ainda estiverem disponíveis.
* A Package `DBMS_FLASHBACK` pode ser utilizada para: 
  * Você efetivou a transação (`COMMIT`) e quer ver como os dados estavam anteriormente.
  * Você pode utilizar os resultados da consulta de flashback para ajustar os dados para a situação anterior se necessário.
  * Por exemplo, você removeu acidentalmente linhas de uma tabela, você pode recuperar as linhas removidas.
* Existem dois métodos para utilização da Package:
  * Definimos um momento no tempo no passado para recuperação dos dados.
  * Utilizamos o valor do `SYSTEM CHANGE NUMBER (SCN)` para retornarmos os dados para o passado.

### Flashback Table
* O `Flashback Table` permite fazer uma recuperação de uma ou mais tabela para uma determinada posição do tempo no passado sem a necessidade de se restaurar um backup do banco de dados.
* Quando você utiliza o `Flashback Table`, todos os objetos associados, como índices, constraints e triggers também são restaurados.
* Se um dos seguintes comandos forem executados, o comando de flashback não poderá mais ser utilizado:
  * `ALTER TABLE ... DROP COLUMN`
  * `ALTER TABLE ... DROP PARTITION`
  * `CREATE CLUSTER`
  * `TRUNCATE TABLE`
  * `ALTER TABLE ... MOVE`
* Você deve possuir o privilégio `FLASHBACK TABLE` ou `FLASHBACK ANY TABLE` para poder utilizar o `FLASHBACK`.

### LIXEIRA
* A lixeira contém todos os objetos dropados até que:
  * Você elimine o objeto com o comando `PURGE`.
  * Você restaure o objeto dropado com o comando `BEFORE DROP`.
  * A tablespace necessite ser extendida.
* Você pode visualizar os objetos que estão na lixeira utilizando a seguinte visão do dicionário:
  * `USER_RECYCLEBIN` - Todos os objetos dropados pelo usuário.
  * `RECYCLEBIN` (sinônimo).


### Flashback Query (Interval)
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

### Large Objects - LOBs
* LOBs (Large Objects) permitem armazenar strings muito grandes no banco de dados.
* LOBs (Large Objects) permitem armazenar no banco de dados destruturados, tais como videos, áudios, fotografias, imagens, etc.
* LOBs podem ser lidos por linguagens de programação, como Java, C#, Python, etc.
* Para o Oracle é muito mais eficiente utlizar `CLOB` ao invés de `LONG` (Menos leitura em disco / Mais leitura em memória).
* Para o Oracle é muito mais eficiente utlizar `BLOB` ao invés de `LONGROW` (Menos leitura em disco / Mais leitura em memória).

### LOBs - Categorias
* LOB Interno
* LOB Externo

### LOBs - Internos
* LOBs Internos são armazenados no banco de dados, como coluna em uma tabela.
* Participam de transações do banco de dados.

### LOBs - CLOB
* Utilizado para armazenar dados tipo caracter `single-byte`.
* Tamanho máximo: (4GB - 1) * `DB_BLOCK_SIZE`.
* Tamanho máximo entre 8 TB e 128 TB.
* `DB_BLOCK_SIZE` é o parâmetro de inicialização que define o tamanho do bloco do banco de dados, que pode variar de 2KB a 32KB.
* Você pode utilizar várias funções SQL em CLOBs.
* Quando a coluna CLOB for maior do que 100K, você deve utilizar a package `DBMS_LOB`.

### LOBs - NCLOB
* Utilizado para armazenar dados tipo caracter `multiple-byte`.
* Tamanho máximo: (4GB - 1) * `DB_BLOCK_SIZE`.
* Tamanho máximo entre 8 TB e 128 TB.
* `DB_BLOCK_SIZE` é o parâmetro de inicialização que define o tamanho do bloco do banco de dados, que pode variar de 2KB a 32KB.

### LOBs - Externos
* LOBs externo são armazenados externamente ao banco de dados, como arquivos do sistema de arquivos do S.O.
* São somente uma referência aos arquivos externos.
* Não participam de transações do banco de dados.

### LOBs - BFILE
* Referencia um arquivo binário.
* O BFILE armazena uma referência a um arquivo externo no sistema de arquivos do S.O.

### Restrições para LOBs
* LOBs não podem ser parte de uma `clustered table`.
* LOBs não podem ser analisados utilizado o comando `ANALYZE`.
* LOBs não podem ser incluídos em um índice particionado de uma `index-organized table`.
* LOBs não podem ser utilizados em um `VARRAY`.

### Restrições para LOBs
* LOBs não podem ser utlizados em uma das segintes partes de um comando SQL:
  * `GROUP BY`
  * `ORDER BY`
  * `SELECT DISTINCT`
  * `JOINS`
  * Funções de agregação (funções de grupo)

### LOB Locator - Localizador
* Todo LOB esta associado com um `Lob Locator` (localizador)
* Um `LOB Locator` é um ponteiro para a localização atual do valor LOB
* O Locator associado ao LOB interno é chamado de LOB Locator, enquanto que o Locator associado a um arquivo externo é chamado BFILE Locator.
* O LOB Locator é retornado quando você realiza um `SELECT` de uma coluna LOB
* O valor atual do LOB pode ser recuperado utilizado o Localizador.

### Table Functions - Pipelined Functions
* Utilizando Pipeline não há necessidade de criar grandes collections. 
* Pipeline retorna as linhas para saída da função assim que são criadas, economizando memória e permitindo processamento subsequente iniciando logo após a linha ser gerada.

## Credits

This repository is maintained by [MaurosMJ](https://github.com/MaurosMJ). The activities and documentations are based on the 'Oracle PL/SQL Especialista: do Básico ao Avançado' course.

