--@Author: MaurosMJ

SELECT
    employee_pck.obter_salario_funcionario(103)
FROM
    dual;

SELECT
    employee_pck.obter_cargo('IT_PROG')
FROM
    dual;

BEGIN
    employee_pck.aumenta_salario_funcionario(106, 5);
END;

BEGIN
    employee_pck.inserir_funcionario('Bob', 'Dylan', 'BDYLAN', '515.258.4861', sysdate,
                                    'IT_PROG', 20000, NULL, 103, 60);
END;