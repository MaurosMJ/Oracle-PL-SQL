# PL/SQL

<div style="text-align:center;">
    <img src="https://5.imimg.com/data5/SELLER/Default/2022/7/FT/WW/IM/7756102/oracle-database-enterprise-edition-license-1-processor.png" alt="JDBC Logo" width="100" height="100">
</div>

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
