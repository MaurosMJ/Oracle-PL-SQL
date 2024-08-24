# PL/SQL

<div style="text-align:center;">
    <img src="https://5.imimg.com/data5/SELLER/Default/2022/7/FT/WW/IM/7756102/oracle-database-enterprise-edition-license-1-processor.png" alt="JDBC Logo" width="100" height="100">
</div>


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