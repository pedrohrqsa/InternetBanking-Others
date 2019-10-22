/*
CREATE DATABASE INTERNET_BANKING
*/

USE [INTERNET_BANKING]

/*
DROP TABLE T_IB_ENDERECO;
DROP TABLE T_IB_INFOS_FAMILIARES;
DROP TABLE T_IB_CONTATO;
DROP TABLE T_IB_CLIENTE;
DROP TABLE T_IB_CONTA;
DROP TABLE T_IB_BANCO;
DROP TABLE T_IB_HIST_INFOS_ALTERADAS;
DROP TABLE T_IB_AGENCIA;
DROP TABLE T_IB_TRANSACOES;
*/


-------------------------------------------------------------------------------------------------------------------------------------------------------


CREATE TABLE T_IB_ENDERECO(
	ID_ENDERECO				INT					NOT NULL			PRIMARY KEY CLUSTERED,
	DS_LOGRADOURO			VARCHAR(10)			NOT NULL,
	NR_NUMERO				NUMERIC(5)			NOT NULL,
	DS_COMPLEMENTO			VARCHAR(30)			NOT NULL,
	DS_BAIRRO				VARCHAR(20)			NOT NULL,
	DS_CIDADE				VARCHAR(30)			NOT NULL,
	DS_SIGLA_ESTADO			CHAR(2)				NOT NULL,
	DS_CEP					VARCHAR(8)			NOT NULL,
	DS_FLAG_STATUS			CHAR(1)	DEFAULT(1)	NOT NULL
);


-------------------------------------------------------------------------------------------------------------------------------------------------------


CREATE TABLE T_IB_INFOS_FAMILIARES(
	NM_NOME_MAE					VARCHAR(20)			NOT NULL,
	NM_SOBRENOME_MAE			VARCHAR(30)			NOT NULL,
	NM_NOME_PAI					VARCHAR(20)				NULL,
	NM_SOBRENOME_PAI			VARCHAR(30)				NULL,
	NM_NOME_DEPENDENTE			VARCHAR(20)				NULL,
	NM_SOBRENOME_DEPENDENTE		VARCHAR(30)				NULL,
);


-------------------------------------------------------------------------------------------------------------------------------------------------------


CREATE TABLE T_IB_CONTATO(
	DS_EMAIL				VARCHAR(30)				NOT NULL,
	DS_TEL_RESID			VARCHAR(12)					NULL,
	DS_TEL_CEL				VARCHAR(13)					NULL,
	DS_PROPRIETARIO			VARCHAR(50)				NOT NULL,
	DS_FLAG_STATUS			CHAR(1)	DEFAULT(1)		NOT NULL
);


-------------------------------------------------------------------------------------------------------------------------------------------------------


CREATE TABLE T_IB_CLIENTE(
	ID_CLIENTE				NUMERIC(5)			NOT NULL			PRIMARY KEY CLUSTERED,
	NR_CPF					VARCHAR(11)			NOT NULL,
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

 /*
FOREIGN KEY REFERENCES T_IB_ENDERECO,
FOREIGN KEY REFERENCES T_IB_INFOS_FAMILIARES,
FOREIGN KEY REFERENCES T_IB_CONTATO
*/


-------------------------------------------------------------------------------------------------------------------------------------------------------


CREATE TABLE T_IB_CONTA(
	DS_NUM_CONTA				INT						IDENTITY(1, 1)			PRIMARY KEY CLUSTERED,
	DS_NUM_AGENCIA				VARCHAR(4)				NOT NULL,
	DS_SENHA_TRANSACOES			VARCHAR(4)				NOT NULL,
	DS_SENHA_LOGIN				VARCHAR(6)				NOT NULL,
	DS_HIST_INFOS_ALTERADAS		VARCHAR(200)			NOT NULL,
	DT_CRIACAO					DATE					NOT NULL,
	DS_FLAG_STATUS				CHAR(1)	DEFAULT(1)		NOT NULL
);

/*
FOREIGN KEY REFERENCES T_IB_AGENCIA
*/


-------------------------------------------------------------------------------------------------------------------------------------------------------


CREATE TABLE T_IB_BANCO(
	DS_NUM_CONTA			INT					IDENTITY(1, 1),
	DS_NUM_AGENCIA			VARCHAR(4)			NOT NULL,
	ID_TRANSACOES			INT					IDENTITY(1, 1),
	NM_FANTASIA				VARCHAR(30)			NOT NULL,
	DS_CNPJ					VARCHAR(14)			NOT NULL,
	ID_ENDERECO				INT					NOT NULL,
	DS_ISPB					VARCHAR(8)			NOT NULL,
);


-------------------------------------------------------------------------------------------------------------------------------------------------------


CREATE TABLE T_IB_HIST_INFOS_ALTERADAS(
	ID_INFOS_ALTERADAS			NUMERIC(5)				NOT NULL			PRIMARY KEY CLUSTERED,
	DS_SENHAS					VARCHAR(6)					NULL,
	DT_ALTERACOES				DATE						NULL,
	DS_FLAG_STATUS				CHAR(1)	DEFAULT(1)		NOT NULL
);


-------------------------------------------------------------------------------------------------------------------------------------------------------


CREATE TABLE T_IB_AGENCIA(
	ID_AGENCIA			NUMERIC(1)			NOT NULL			PRIMARY KEY CLUSTERED,
	DS_TELEFONE			VARCHAR(13)			NOT NULL
);


-------------------------------------------------------------------------------------------------------------------------------------------------------


CREATE TABLE T_IB_TRANSACOES(
	ID_TRANSACOES			INT					IDENTITY(1, 1)			PRIMARY KEY CLUSTERED,
	FK_SERVICO			INT				NOT NULL
);


-------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE T_IB_DEPOSITO(
	ID_DEPOSITO			INT NOT NULL PRIMARY KEY,
	DATA				DATE NOT NULL,
	CONTA_DESTINO			INT NOT NULL,
	VALOR				NUMERIC NOT NULL,
	PRIMARY KEY (ID_DEPOSITO)
);

CREATE TABLE T_IB_SAQUE(
	ID_SAQUE			INT NOT NULL PRIMARY KEY,
	DATA				DATE NOT NULL,
	CONTA_ORIGEM			INT NOT NULL,
	VALOR				NUMERIC NOT NULL,
	PRIMARY KEY (ID_SAQUE)
);

CREATE TABLE T_IB_TRANSFERENCIA(
	ID_TRANSFERENCIA		INT NOT NULL PRIMARY KEY,
	DATA				DATE NOT NULL,	
	CONTA_ORIGEM			INT NOT NULL,
	CONTA_DESTINO			INT NOT NULL,
	VALOR				NUMERIC NOT NULL,
	PRIMARY KEY (ID_TRANSFERENCIA)
);

/*

*/


------------------------------------------------------------------------------------------------------------------------------