

--Fazendo um join/inner join. de cliente com endereço, juntando dados das duas tabelas por suas chaves
SELECT C.NomeCompleto,
C.Cargo,
C.Contato,
E.Logradouro, 
E.Cidade,
E.Pais 
FROM  TB_CLIENTE AS C
INNER JOIN TB_ENDERECO AS E ON C.ClienteId =E.ClienteId 

--trara todos os dados de endereço, independente de ter ou não relação com tb_cliente. enquanto tb cliente trara somente dados que tenham relação 
SELECT C.NomeCompleto,
C.Cargo,
C.Contato,
E.Logradouro, 
E.Cidade,
E.Pais 
FROM  TB_ENDERECO  AS E LEFT JOIN TB_CLIENTE AS C ON C.ClienteId =E.ClienteId 

--Trara todos os dados de cliente independente de ter ligação ou não com endereço enquanto endereço só poderá trazer dados com relacionamento com clientes
SELECT C.NomeCompleto,
C.Cargo,
C.Contato,
E.Logradouro, 
E.Cidade,
E.Pais 
FROM  TB_ENDERECO  AS E RIGHT JOIN TB_CLIENTE AS C ON C.ClienteId =E.ClienteId 

SELECT * FROM TB_CLIENTE

INSERT INTO TB_CLIENTE
(ClienteId,NomeCompleto,Contato,Cargo)
VALUES
('AAAA','MARCOS ALBERTO','MARIA JOAQUINA','VENDEDOR'),
('BBBB','MONICA SANTOS','JOSE SILVA','ATENDENTE DE MARKETING'),
('CCCC','JOANA ALVES','ANA TRUJILO','PROPRIETARIA')


--usando a clausula JOIN com update no preço dos condimentos de 1 real

UPDATE TB_PRODUTO
SET Preco +=1
From TB_PRODUTO as P JOIN TB_CATEGORIA AS C
ON P.CategoriaId = C.CategoriaId
WHERE C.Descricao = 'Condimentos'

--dando um select para ver a alteração
select P.Preco
From TB_PRODUTO as P JOIN TB_CATEGORIA AS C
ON P.CategoriaId = C.CategoriaId
WHERE C.Descricao = 'Condimentos'

DELETE  TB_PEDIDO  
FROM TB_PEDIDO P
JOIN TB_FUNCIONARIO F
ON P.FuncionarioId = F.FuncionarioId
WHERE F.Cargo ='Vice-Presidente de Vendas'



SELECT * FROM TB_PEDIDO AS P
JOIN TB_FUNCIONARIO AS F
ON P.FuncionarioId = F.FuncionarioId
WHERE F.Cargo ='Vice-Presidente de Vendas'