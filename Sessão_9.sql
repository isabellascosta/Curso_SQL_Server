
--preço maximo
SELECT Min(PRECO) FROM TB_DETALHE_PEDIDO
WHERE NumeroPedido = 10249;

SELECT max(PRECO) FROM TB_DETALHE_PEDIDO
WHERE NumeroPedido = 10249;
--a  media
SELECT NumeroPedido, AVG(PRECO) FROM TB_DETALHE_PEDIDO
GROUP BY NumeroPedido

--total
SELECT NumeroPedido, SUM(PRECO) FROM TB_DETALHE_PEDIDO
GROUP BY NumeroPedido
--CONTANDO QUANTOS PEDIDOS TEVE
SELECT NumeroPedido, COUNT(*) FROM TB_DETALHE_PEDIDO
GROUP BY NumeroPedido

select * from TB_DETALHE_PEDIDO
where NumeroPedido = 10248

--Selecione a quantidade total de pedido da tabela detalhe pedido onde numero de pedido for aqueles, agrupe pelo numero de pedido que contenham 3 pedidos.
SELECT NumeroPedido, COUNT(*) FROM TB_DETALHE_PEDIDO
WHERE NumeroPedido IN (10249,10250,10251) 
GROUP BY NumeroPedido
HAVING COUNT(*) = 3

--vendo todos os pedidos desses numeros que tenham mais de 3 vendas
SELECT NumeroPedido, COUNT(*) FROM TB_DETALHE_PEDIDO
GROUP BY NumeroPedido
HAVING COUNT(*) = 3

--inserindo uma duplicidade para aprender a tratar
INSERT INTO TB_CLIENTE
(ClienteId,NomeCompleto,Contato,Cargo)
VALUES
('OPOPO','MARCOS ALBERTO','MARIA JOAQUINA','VENDEDOR')

--ACHANDO DUPLICIDADE 
SELECT NomeCompleto, COUNT(NomeCompleto)  FROM TB_CLIENTE
GROUP BY NomeCompleto
HAVING COUNT(NomeCompleto) > 1

select * from TB_CLIENTE
where NomeCompleto = 'MARCOS ALBERTO'

DELETE TB_CLIENTE WHERE ClienteId = 'OPOPO'