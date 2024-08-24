# PL/SQL

<div style="text-align:center;">
    <img src="https://5.imimg.com/data5/SELLER/Default/2022/7/FT/WW/IM/7756102/oracle-database-enterprise-edition-license-1-processor.png" alt="JDBC Logo" width="100" height="100">
</div>


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