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

CREATE TABLE Registro_Presenca
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
DROP TABLE Registro_Presenca
DROP TABLE Situacao
DROP TABLE Turmas
*/

--Turmas x Alunos
ALTER TABLE Turmas
	ADD CONSTRAINT fk_TurmasAlunos FOREIGN KEY (id_aluno) REFERENCES Alunos (id_aluno);

--turmas X Cursos 
ALTER TABLE Turmas
	ADD CONSTRAINT fk_TurmasCursos FOREIGN KEY (id_curso) REFERENCES Cursos (id_curso);

--presença X Turma
ALTER TABLE Registro_Presenca
	ADD CONSTRAINT  fk_PresencaTurma FOREIGN KEY (id_turma) REFERENCES Turmas (id_turma);
--presença X Aluno
ALTER TABLE Registro_Presenca
	ADD CONSTRAINT fk_PrensencaAluno FOREIGN KEY (id_aluno) REFERENCES Alunos (id_aluno);
--presenca x situação
ALTER TABLE Registro_Presenca 
	ADD CONSTRAINT fk_presencaSituacao FOREIGN KEY(id_situacao) REFERENCES Situacao(id_situacao);







