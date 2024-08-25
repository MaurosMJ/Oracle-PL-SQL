# PL/SQL

<div style="text-align:center;">
    <img src="https://5.imimg.com/data5/SELLER/Default/2022/7/FT/WW/IM/7756102/oracle-database-enterprise-edition-license-1-processor.png" alt="JDBC Logo" width="100" height="100">
</div>

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
