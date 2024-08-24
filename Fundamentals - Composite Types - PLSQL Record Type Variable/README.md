# PL/SQL

<div style="text-align:center;">
    <img src="https://5.imimg.com/data5/SELLER/Default/2022/7/FT/WW/IM/7756102/oracle-database-enterprise-edition-license-1-processor.png" alt="JDBC Logo" width="100" height="100">
</div>


### Variável RECORD 
* PL/SQL `RECORD` é um grupo de itens de dados relacionados armazenados em campos, cada um com seu próprio nome e tipo de dado.
* Um PL/SQL `RECORD` que contém campos como o nome, cidade e data de admissão de um cliente permite tratar os dados como uma unidade lógica.
* Quando você declara um tipo `RECORD` para estes campos, eles podem ser manipulados como uma unidade.

### Variável RECORD - Diretrizes
* Cada registro definido pode possuir tantos campos quanto necessários.
* Campos podem ser atribuídos valores iniciais e podem ser definidos como `NOT NULL`.
* Campos sem valores iniciais são inicializados com `NULL`.
* A palavra chave `DEFAULT` também podem ser utilizada quando definindo campos.

### Variável RECORD com %ROWTYPE
* O '`ROWTYPE`' faz a cópia de toda a estrutura da tabela para dentro da variável tipo `RECORD`.
* É útil quando se necessita recuperar todos os dados da tabela para a variável (dado uma linha).

### Vantagens da utilização do atributo %ROWTYPE
* O nome, tipos de dados e tamanho máximo das colunas referenciadas do banco de dados não precisam ser conhecidos.
* Bastante útil quando recupera-se todas as colunas de uma linha com o comando '`SELECT` *'.