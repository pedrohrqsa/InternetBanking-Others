--------------------------------------------------------------------------------------------------------------


-- ARQUIVO DE TESTES PARA A API DO INTERNET BANKING

-- COMANDOS PARA DELETAR TODAS AS TABELAS
/*
DROP TABLE TB_USUARIOS		CASCADE CONSTRAINTS;
DROP TABLE TB_LOGIN			CASCADE CONSTRAINTS;
DROP TABLE TB_CLIENTE		CASCADE CONSTRAINTS;
*/


--------------------------------------------------------------------------------------------------------------


-- TABELA TB_USUARIOS
-- DROP TABLE TB_USUARIOS

CREATE TABLE TB_USUARIOS (
	ID_USUARIO		INTEGER			IDENTITY(1, 1)		NOT NULL, -- ESTE IDENTITY INCREMENTA DE '1 EM 1', COMEÇANDO DO '1'
	NM_NOME			VARCHAR(50),
	DS_SENHA		VARCHAR(10), 
	DS_EMAIL		VARCHAR(50)
);


-- COMANDOS PARA INSERÇÃO NA TABELA TB_USUARIOS
INSERT INTO TB_USUARIOS ( NM_NOME, DS_SENHA, DS_EMAIL) 
VALUES ('Guilherme', '123', 'guilherme@ig.com');

INSERT INTO TB_USUARIOS ( NM_NOME, DS_SENHA, DS_EMAIL) 
VALUES ('Lucas Santos', '123', 'lucas@ig.com');

INSERT INTO TB_USUARIOS ( NM_NOME, DS_SENHA, DS_EMAIL) 
VALUES ('Luiz Eduardo', '123', 'luize@ig.com');

INSERT INTO TB_USUARIOS ( NM_NOME, DS_SENHA, DS_EMAIL) 
VALUES ('L. Marinelli', '123', 'luizm@ig.com');

INSERT INTO TB_USUARIOS ( NM_NOME, DS_SENHA, DS_EMAIL) 
VALUES ('Pedro Henrique', '123', 'pedro@ig.com');


-- COMANDOS PARA TESTE
SELECT * FROM TB_USUARIOS;

UPDATE TB_USUARIOS SET NM_NOME = 'L. Marinelli'
 WHERE ID_USUARIO = 2;

DELETE FROM TB_USUARIOS WHERE ID_USUARIO = 7;

UPDATE TB_USUARIOS SET NM_NOME = 'P', DS_SENHA = 123
 WHERE ID_USUARIO = 1;


--------------------------------------------------------------------------------------------------------------


-- TABELA TB_CLIENTE
-- DROP TABLE TB_CLIENTE

CREATE TABLE TB_CLIENTE(
	ID_CLIENTE				NUMERIC(5)			NOT NULL		PRIMARY KEY,
	DS_CPF					VARCHAR(11)			NOT NULL			 UNIQUE,
	DS_RG					VARCHAR(9)			NOT NULL,	
	DS_ORGAO_EMISSOR		VARCHAR(5)			NOT NULL,
	DT_NASCIMENTO			DATE				NOT NULL,
	NM_NOME					VARCHAR(20)			NOT NULL,
	NM_SOBRENOME			VARCHAR(30)			NOT NULL,
	DS_NACIONALIDADE		VARCHAR(20)			NOT NULL,
	DS_NATURALIDADE			VARCHAR(20)			NOT NULL,
	DS_ENDERECO				VARCHAR(20)			NOT NULL,
	DS_INFOS_FAMILIARES		VARCHAR(50)			NOT NULL,
	DS_CONTATO				VARCHAR(50)			NOT NULL
 );


-- COMANDOS PARA TESTE
SELECT * FROM TB_CLIENTE;

INSERT INTO TB_CLIENTE(
	ID_CLIENTE,
	DS_CPF,
	DS_RG,
	DS_ORGAO_EMISSOR,
	DT_NASCIMENTO,
	NM_NOME,
	NM_SOBRENOME,
	DS_NACIONALIDADE,
	DS_NATURALIDADE,
	DS_ENDERECO,
	DS_INFOS_FAMILIARES,
	DS_CONTATO
)
VALUES
(
	1,
	'12345678912',
	'123456789',
	'SPSSP',
	'2000/10/25',
	'Luiz Eduardo',
	'Leal',
	'Brasileira',
	'Paulista',
	'Rua X, Nº Y',
	'Nome da mãe e nome do pai',
	'Contato'
);


--------------------------------------------------------------------------------------------------------------


-- TABELA TB_LOGIN
-- DROP TABLE LOGIN

CREATE TABLE TB_LOGIN(
	ID_LOGIN		INTEGER			PRIMARY KEY				IDENTITY(1, 1)					NOT NULL,
	DS_CPF			VARCHAR(11)		FOREIGN KEY(DS_CPF) REFERENCES TB_CLIENTE(DS_CPF)		NOT NULL,
	DS_SENHA		VARCHAR(15)																NOT NULL,
);


   ALTER TABLE OBJETO ---------------------------------------------------------
ADD CONSTRAINT FK_ID_PESSOA ---------------------------------------------------------
   FOREIGN KEY (FK_PESSOA) ---------------------------------------------------------
    REFERENCES PESSOA(ID); ---------------------------------------------------------


-- COMANDOS PARA TESTE
SELECT * FROM TB_LOGIN;


--------------------------------------------------------------------------------------------------------------


/*
CPF da TB_CLIENTE pode ser uma PK?
(Para um atributo ser referenciado como FK, ele precisa ser uma PK antes.)

As tabelas 'TB_CONTATO' e 'TB_ENDERECO' já estão criadas?
(Se sim, o certo seria referenciar o ID de cada uma como PK e FK na TB_CLIENTE.)
*/
