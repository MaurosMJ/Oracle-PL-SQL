# Curso PL/SQL

<div style="text-align:center;">
    <img src="https://5.imimg.com/data5/SELLER/Default/2022/7/FT/WW/IM/7756102/oracle-database-enterprise-edition-license-1-processor.png" alt="JDBC Logo" width="100" height="100">
</div>


### Fundamentals - Bulk Collect - For ALL & Limit
* Comandos `INSERT`, `UPDATE` e `DELETE` utilizam Collections para modificar múltiplas linhas de dados muito rapidamente.
* Nós utilizamos a funcionalidade `FOR ALL` para executar comandos DML para todas as linhas de uma Collection.
* `FOR ALL` empacota as atualizações para o `SQL ENGINE` com um único `CONTEXT SWITCH`.
* Collections PL/SQL são essencialmente arrays em memória.
* Collections muito grandes consomem grandes quantidades de memória o que pode degradar o sistema.
* Em algumas situações, pode ser necessário dividir os dados processados em pedaços para tornar o código mais eficiente quanto ao consumo de memória.
* Esta divisão pode ser alcançada utilizando a cláusula `LIMIT` para a sintaxe do `BULK COLLECT`.
