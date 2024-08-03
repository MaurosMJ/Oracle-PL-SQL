-- CASO ocorrer o erro abaixo será necessário seguir as seguintes instruções:

/*
Executando PL/SQL: CALL DBMS_DEBUG_JDWP.CONNECT_TCP( '127.0.0.1', '52091' )
ORA-01031: privilégios insuficientes
ORA-06512: em "SYS.DBMS_DEBUG_JDWP", line 68
ORA-06512: em line 1
Essa sessão exige os privilégios de usuário DEBUG CONNECT SESSION e DEBUG ANY PROCEDURE.
Processo encerrado.
*/

/*
  Requisitos necessários para executar o PL/SQL Debuger:

  . Efetuar o grant dos privilégios DEBUG CONNECT SESSION e DEBUG ANY PROCEDURE para o usuário que vai debugar a procedure ou function
  . O usuário deve ser o owner ou possuir o privilégio de  EXECUTE da procedure ou function a que deseja debugar
  . A procedure ou function deve ser compilada  para debug (Compiled for Debug)
	
*/

-- Conectado como SYS realizar 'grant debug' ao usuário que pode debugar objetos

grant DEBUG CONNECT SESSION, DEBUG ANY PROCEDURE to <user>;

-- CASO ocorrer o erro abaixo será necessário seguir as seguintes instruções:

/*
Executando PL/SQL: CALL DBMS_DEBUG_JDWP.CONNECT_TCP( '127.0.0.1', '52100' )
ORA-24247: acesso à rede negado pela ACL (access control list)
ORA-06512: em "SYS.DBMS_DEBUG_JDWP", line 68
ORA-06512: em line 1
Processo encerrado.
Desconectando do banco de dados hr_XEPDB1.
*/

-- Conectado como SYS, criar uma regra de ACL para a maquina cliente e o user 

Starting with Oracle 12c, if you want to debug PL/SQL stored procedures in the database through a Java 
Debug Wire Protocol (JDWP)-based debugger, such as SQL Developer or JDeveloper, then you must be granted 
the jdwp ACL privilege to connect your database session to the debugger at a particular host.

This is one way you can configure network access for JDWP operations:

	
BEGIN
 DBMS_NETWORK_ACL_ADMIN.APPEND_HOST_ACE
 (
 host => '<maquina_cliente>',
 lower_port => null,
 upper_port => null,
 ace => xs$ace_type(privilege_list => xs$name_list('jdwp'),
 principal_name => '<user_banco>',
 principal_type => xs_acl.ptype_db)
 );
END;


-- HOST = ENDEREÇO DE IP DA MAQUINA CLIENTE
-- Principal_name = USER BANCO
-- Agora deve funcionar