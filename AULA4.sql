CREATE TABLE Alunos
(
	id_aluno INT PRIMARY KEY NOT NULL,
	nome VARCHAR(200) NOT NULL,
	data_nascimento	DATE NOT NULL,
	sexo VARCHAR NULL,
	data_cadastro DATETIME NOT NULL,
	login_cadastro varchar(15)NOT NULL,
	--CONSTRAINT fk_turmas FOREIGN KEY(id_aluno) REFERENCES (id_aluno)
);

--DROP TABLE Alunos

CREATE TABLE Situacao
(
	id_situacao INT PRIMARY KEY NOT NULL,
	situacao VARCHAR(25) NOT NULL,
	data_cadastro DATETIME,
	login_cadastro VARCHAR(15)

);


CREATE TABLE Cursos
(
	id_curso INT PRIMARY KEY not null,
	nome_curso VARCHAR(200) NOT NULL,
	data_cadastro DATETIME NOT NULL,
	login_cadastro VARCHAR(15) NOT NULL,
);

CREATE TABLE Turmas
(
	id_turma INT PRIMARY KEY NOT NULL,
	id_aluno INT NOT NULL,
	id_curso INT NOT NULL,
	valor_turma NUMERIC(15,2) NOT NULL,
	desconto NUMERIC(3,2) NOT NULL,
	data_inicio DATE NOT NULL,
	data_termino DATE,
	data_cadastro DATETIME NOT NULL,
	login_cadastro VARCHAR(15),

);

CREATE TABLE Registro_presen�a
(
	id_turma INT NOT NULL,
	id_aluno INT NOT NULL,
	id_situacao INT NOT NULL,
	data_presenca DATE NOT NULL,
	login_cadastro  VARCHAR(15) NOT NULL,
);
/*
DROP TABLE Alunos 
DROP TABLE Cursos
DROP TABLE Registro_presen�a
DROP TABLE Situacao
DROP TABLE Turmas
*/

