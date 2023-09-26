
--QUAL PRODUTO TEVE MAIOR QUANTIDADE DE VENDAS NO MES 7 DE 1996

SELECT TOP(1) P.Descricao As 'Produto', SUM(D.Quantidade) as 'Total de Vendas'
FROM TB_PRODUTO P 
join TB_DETALHE_PEDIDO D ON  P.ProdutoId = D.ProdutoId
join TB_PEDIDO PE  ON D.NumeroPedido = PE.NumeroPedido
Where PE.DataPedido between '1996-07-01' and '1996-07-31'
GROUP BY P.Descricao
Order by SUM(D.Quantidade) DESC

-- Qual cliente teve o maior gasto no mes 7 de 1996
SELECT TOP(1) C.NomeCompleto AS 'Nome Completo', SUM(D.Preco) AS 'GASTO TOTAL'  FROM TB_CLIENTE C
JOIN TB_PEDIDO PE ON C.ClienteId = PE.ClienteId
JOIN TB_DETALHE_PEDIDO D ON PE.NumeroPedido = D.NumeroPedido
WHERE PE.DataPedido BETWEEN '1996-07-01' and '1996-07-31'
GROUP BY C.NomeCompleto
ORDER BY SUM(D.Preco) DESC;

--LISTA DE TODOS OS CLIENTES QUE MORAM NA ALEMANHA
SELECT C.NomeCompleto, E.Pais FROM TB_CLIENTE C
JOIN TB_ENDERECO E ON C.ClienteId = E.ClienteId
WHERE E.Pais = 'ALEMANHA'

--LISTA DE TODOS OS CLIENTES QUE COMPRARAM DA CATEGORIA BEBIDAS
SELECT CL.NomeCompleto AS 'NOME COMPLETO', CA.Descricao AS 'CATEGORIA' FROM TB_CLIENTE CL
JOIN TB_PEDIDO PE ON CL.ClienteId = PE.ClienteId
JOIN TB_DETALHE_PEDIDO D ON PE.NumeroPedido = D.NumeroPedido
JOIN TB_PRODUTO P ON D.ProdutoId = D.ProdutoId
JOIN TB_CATEGORIA CA ON P.CategoriaId = CA.CategoriaId
WHERE CA.Descricao = 'Bebidas'
GROUP BY CL.NomeCompleto, CA.Descricao


select * from TB_CATEGORIA