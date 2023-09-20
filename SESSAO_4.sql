DROP DATABASE TesteDB
CREATE DATABASE TesteDB;



CREATE TABLE TB_CLIENTE
(
Id INT IDENTITY(1,1),
Nome VARCHAR(70),
CPF VARCHAR(11),
DataNascimento DATETIME2,
Email VARCHAR(70),
CONSTRAINT PK_CLIENTE PRIMARY KEY(Id)
);

--insert posicional, se adiciona valores de acordo com a posição que os atributos foram criados.
INSERT INTO TB_CLIENTE  VALUES
('Isabella','5040357806','2001-03-16 15:14:22','isa_bella411@hotmail.com');

INSERT INTO TB_CLIENTE  VALUES
('joão','22222222222','1985-04-04','joão@ig.com');

INSERT INTO TB_CLIENTE 
(Nome, CPF, DataNascimento,Email) VALUES
('Gabriel','12121212121','1975-05-29 12:35:45','gabs@gmail.com')

--insert declarativo, tem a vantagem de você por na ordem que criou no insert os atributos e caso o atributo seja nulo, pode deixar o campo vazio
INSERT INTO TB_CLIENTE 
(Nome, CPF, DataNascimento,Email) VALUES
('Gabriel','12121212121','1975-05-29 12:35:45','gabs@gmail.com')



--atualizar o nome do joão que eu escrevi errado, NUNCA ESQUEÇA DO WHERE EM UM UPDATE
UPDATE TB_CLIENTE SET NOME = 'João' WHERE Id = 2;

--DELETANDO
DELETE TB_CLIENTE WHERE Id=2;



--INSERINDO MAIS DADOS NO BANCO DE DADOS

INSERT INTO TB_CLIENTE VALUES
('Marcos Pereira','4444444444','1985-11-25 12:01:21','marcos@email.com'),
('Ana Lúcia','55555555555','1980-03-15 14:51:21','ana@email.com'),
('Marta Fonseca ','6666666666','1988-07-05 21:23:41','marta@email.com'),
('Marta Fonseca ','6666666666','1988-07-05 21:23:41','marta@email.com');

--selecionando uma quantidade específica de linhas

SELECT TOP 4 * FROM TB_CLIENTE;

--SOMENTE ITENS DISTINTOS

SELECT DISTINCT Nome, CPF, DataNascimento, Email FROM TB_CLIENTE;

--ALTERANDO A TABELA CLIENTE, ADICIONANDO CAMPO ESTADO

ALTER TABLE TB_CLIENTE
ADD Estado CHAR(2) NULL


--ATUALIZANDO TABELA CLIENTE ADICIONANDO VALORES 
UPDATE TB_CLIENTE
SET Estado = 'SP'
Where Id in (1,3,6);

UPDATE TB_CLIENTE
SET Estado = 'RJ'
Where Id in (4,5,7);



-- INSERINDO MAIS DADOS NA TABELA CLIENTE

INSERT INTO  TB_CLIENTE
VALUES
('Miriam Souza','1231231231','1986-06-13 12:32:12','miriam@email.com','SP'),
('Jair Batista','00000000000','1990-04-13 12:32:12','jair@email.com','SP'),
('Paula Silva','55555555555','1980-12-03 16:22:12','paula@email.com','RJ'),
('João Abreu','11122233345','1987-11-23 21:55:55','joão@email.com','RJ');

--CRIANDO UMA NOVA TABELA

CREATE TABLE TB_CLIENTE_SP
(
	Id INT IDENTITY(1,1) NOT NULL,
	Nome VARCHAR(70),
	CPF VARCHAR(11),
	DataNascimento DATETIME2,
	Email VARCHAR(70),
	Estado CHAR(2),
	CONSTRAINT PK_CLIENTE_SP PRIMARY KEY (Id)
)
--Selecionar todos os itens de uma tabela
SELECT * FROM TB_CLIENTE_SP
--INSERT COM O TOP, PEGAMOS DADOS DE UMA TABELA JÁ CRIADA FILTRAMOS E COLOCAMOS SOMENTE O QUE FOR NECESSÁRIO

INSERT TOP(3) INTO TB_CLIENTE_SP
SELECT Nome, CPF, DataNascimento, Email,Estado From TB_CLIENTE
WHERE Estado = 'SP'

--ADICIONANDO COLUNA DATA CRIAÇÃO

ALTER TABLE TB_CLIENTE_SP
ADD DataCriacao DATETIME2 DEFAULT GETDATE()

--update usando top
UPDATE TOP(1) TB_CLIENTE_SP SET DataCriacao = '2022-11-12 12:13:40'

--usando deleção com top(topo)

DELETE TOP(2) FROM TB_CLIENTE_SP

select * from TB_CLIENTE

--ESTUDANDO TRANSAÇÕES
--Para iniciar uma transação, é necessário que coloque a palavra begin TRAN
--transações são como ctrl+z em um banco de dados, se algo não saiu como esperado
--você pode voltar a versão estável
BEGIN TRAN

UPDATE TB_CLIENTE
SET Email = 'TESTE@TESTE.COM'
WHERE Id =1

--Fiz o update mas o resultado não está de acordo com o que esperava, só dar rollback
--cada vez que da um rollback, precisa abrir outra transação
--então execute o begin tran novamente
--se der um begin tran mas não fechar a transação, ao fechar a guia de 
--consulta, a transação fecha e todas as alterações não são salvas.
ROLLBACK

--por fim se tudo estiver certo e funcionando devidamente só executar commit
COMMIT

---DDL - DATA DEFINITION LANGUAGE
--CREATE, DROP,ALTER,TRUNCATE,COMMENT

--DQL - DATA QUERY LANGUAGE
--SELECT 

--DML - DATA MANIPULATION LANGUAGE
--INSERT, UPDATE,DELETE

--DTL DATA TRANSACION LANGUAGE
--BEGIN TRANSACTION, COMMIT E ROLLBACK