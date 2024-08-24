# PL/SQL

<div style="text-align:center;">
    <img src="https://5.imimg.com/data5/SELLER/Default/2022/7/FT/WW/IM/7756102/oracle-database-enterprise-edition-license-1-processor.png" alt="JDBC Logo" width="100" height="100">
</div>


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