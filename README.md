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

## Credits

This repository is maintained by [MaurosMJ](https://github.com/MaurosMJ). The activities and documentations are based on the 'Oracle PL/SQL Especialista: do Básico ao Avançado' course.

