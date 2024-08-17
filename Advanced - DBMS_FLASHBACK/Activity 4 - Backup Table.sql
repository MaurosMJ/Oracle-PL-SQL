--@Author: MaurosMJ

/* 
- Criando uma tabela de backup, a partir de outra tabela
*/

CREATE TABLE employees_bkp
    AS
        SELECT
            *
        FROM
            employees;