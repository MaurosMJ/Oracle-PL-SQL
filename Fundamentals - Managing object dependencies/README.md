# PL/SQL

<div style="text-align:center;">
    <img src="https://5.imimg.com/data5/SELLER/Default/2022/7/FT/WW/IM/7756102/oracle-database-enterprise-edition-license-1-processor.png" alt="JDBC Logo" width="100" height="100">
</div>

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

