--USANDO TESTEDB

--CONSULTANDO DE FORMA ASCENDENTE O CPF DOS CLIENTES, SE DEIXAR S� O ORDERBY O PADR�O � O ASC
SELECT * FROM TB_CLIENTE
ORDER BY CPF ASC;

--CONSULTANDO DE FORMA DESCENDENTE O CPF DO CLIENTE
SELECT * FROM TB_CLIENTE
ORDER BY CPF ASC;

--CONSULTANDO A PESSOA MAIS VELHA DA MINHA TABELA
SELECT TOP 1  * FROM TB_CLIENTE
ORDER BY DataNascimento;

--CONSULTANDO O  CLIENTE DE MENOR IDADE
SELECT TOP 1  * FROM TB_CLIENTE
ORDER BY DataNascimento;

--WITH TIES: SE ULTIMO REGISTRO DO QUE ESTAMOS ORDENANDO TIVER UM REPETIDO, ELE TRAS OS DOIS
SELECT TOP 4 WITH TIES * FROM TB_CLIENTE
ORDER BY CPF
