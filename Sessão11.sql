-- sessão 10 - Subqueries

--TRAGA A DESCRIÇÃODOS PRODUTOS QUE POSSUEM O PREÇO MAIOR QUE A MÉDIA DE TODOS OS PRODUTOS


SELECT P.Descricao  from TB_PRODUTO P 
WHERE P.Preco > (SELECT AVG(P2.Preco) FROM TB_PRODUTO P2)

--TRAGA TODOS OS CLIENTES QUE TIVERAM PEDIDOS NO MES 7 DE 1996

--vai trazer todos os dados do cliente que existir dentro da subquery se a data for entre as datas citadas
SELECT C.* FROM TB_CLIENTE C
WHERE EXISTS (SELECT * FROM TB_PEDIDO P WHERE C.ClienteId = P.ClienteId
				AND P.DataPedido between '1996-07-10' and '1996-07-31')

--TRAGA O NOME E O TOTAL DE PEDIDOS DE CADA CLIENTE


SELECT C.NomeCompleto, 
(SELECT COUNT(*)  FROM TB_PEDIDO P WHERE C.ClienteId = P.ClienteId)[Total Pedidos]
FROM TB_CLIENTE C
ORDER BY [Total Pedidos]

--PEGUE OS PRODUTOS DA CATEGORIA BEBIDA E DIMINUA 1 DOLAR 
--update com subqueries
UPDATE TB_PRODUTO
SET Preco -=1
WHERE CategoriaId = (SELECT CategoriaId FROM TB_CATEGORIA
						WHERE Descricao = 'Bebidas')
--verificando as mudanças
SELECT * FROM TB_PRODUTO
WHERE CategoriaId = (SELECT CategoriaId FROM TB_CATEGORIA
						WHERE Descricao = 'Bebidas')
DELETE FROM TB_PEDIDO
WHERE FuncionarioId = (SELECT FuncionarioId  FROM TB_FUNCIONARIO
						WHERE Cargo = 'Vice-Presidente de Vendas')


