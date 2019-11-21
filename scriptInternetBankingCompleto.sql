---------------------------------------------------------------------------------------------------------------------------

-- CREATE DATABASE InternetBanking

---------------------------------------------------------------------------------------------------------------------------


-- DROP TABLE Cliente;
-- DELETE FROM Cliente;
CREATE TABLE Cliente(
	idCliente						INT						NOT NULL		PRIMARY KEY IDENTITY (1,1),
	cpf								VARCHAR(11)				NOT NULL							UNIQUE,
	rg								VARCHAR(9)				NOT NULL,	
	orgaoEmissor					VARCHAR(5)				NOT NULL,
	dtNascimento					DATE 					NOT NULL,
	nome							VARCHAR(20)				NOT NULL,
	sobrenome						VARCHAR(30)				NOT NULL,
	nacionalidade					VARCHAR(20)				NOT NULL,
	naturalidade					VARCHAR(20)				NOT NULL,
);


---------------------------------------------------------------------------------------------------------------------------


-- DROP TABLE Login;
-- DELETE FROM Login;
 CREATE TABLE Login(
	idLogin							INT				PRIMARY KEY	IDENTITY(1,1) 									NOT NULL,
	idCliente						INT			FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)			NOT NULL,
	cpf								VARCHAR(11)																	NOT NULL,
	senha							VARCHAR(15)																	NOT NULL,
);


---------------------------------------------------------------------------------------------------------------------------


-- DROP TABLE Familiares;
-- DELETE FROM Familiares;
CREATE TABLE Familiares(
	idFamiliares					INT					NOT NULL			PRIMARY KEY IDENTITY(1,1),
	idCliente						INT					NOT NULL,
	nomeMae							VARCHAR(20)			NOT NULL,
	sobrenomeMae					VARCHAR(30)			NOT NULL,
	nomePai							VARCHAR(20)			NULL,
	sobrenomePai					VARCHAR(30)			NULL,
	CONSTRAINT FKClienteFamiliares						INT FOREIGN KEY (idCliente) REFERENCES Cliente (idCliente),
);


---------------------------------------------------------------------------------------------------------------------------


-- DROP TABLE Endereco;
-- DELETE FROM Endereco;
CREATE TABLE Endereco(
	idEndereco					INT					NOT NULL			PRIMARY KEY IDENTITY (1,1),
	idCliente					INT					NOT NULL,
	logradouro					VARCHAR(50)				NOT NULL,
	numero						INT					NOT NULL,
	complemento					VARCHAR(30)				NOT NULL,
	bairro						VARCHAR(20)				NOT NULL,
	cidade						VARCHAR(30)				NOT NULL,
	siglaEstado					CHAR(2)				NOT NULL,
	cep							VARCHAR(8)				NOT NULL,
	flagStatus					CHAR(1)	DEFAULT(1)		NOT NULL,
	CONSTRAINT FKClienteEndereco FOREIGN KEY (idCliente) REFERENCES Cliente (idCliente)
);


---------------------------------------------------------------------------------------------------------------------------


-- DROP TABLE Contato;
-- DELETE FROM Contato;
CREATE TABLE Contato(
	idContato					INT								NOT NULL				PRIMARY KEY IDENTITY(1,1),
	idCliente					INT								NOT NULL,
	email						VARCHAR(30)						NOT NULL				UNIQUE,
	telResid					VARCHAR(12)							NULL,
	telCel						VARCHAR(13)						NOT NULL				UNIQUE,
	flagStatus					CHAR(1)			DEFAULT(1)		NOT NULL,
	CONSTRAINT FKClienteContato			INT	    FOREIGN KEY (idCliente) REFERENCES Cliente (idCliente),
);


---------------------------------------------------------------------------------------------------------------------------


-- DROP TABLE Conta;
-- DELETE FROM Conta;
CREATE TABLE Conta(
	idConta						INT						IDENTITY(1, 1)			PRIMARY KEY CLUSTERED,
	numConta					INT						NOT NULL,		
	senhaTransacoes				VARCHAR(4)				NOT NULL,
	senhaLogin					VARCHAR(6)				NOT NULL,
	dtCriacao					DATE					NOT NULL,
	flagAtivo					CHAR(1)	DEFAULT(1)		NOT NULL
	CONSTRAINT FKClienteConta					INT						NOT NULL,
	CONSTRAINT FKTransacaoConta				INT						NOT NULL,
	CONSTRAINT FKNumAgenciaConta				INT						NOT NULL,
	CONSTRAINT FKHistInfosFamiliaresConta		INT						NOT NULL,
);


---------------------------------------------------------------------------------------------------------------------------


-- DROP TABLE Agencia;
-- DELETE FROM Agencia;
CREATE TABLE Agencia(
	idAgencia					INT						NOT NULL			PRIMARY KEY CLUSTERED,
	numAgencia					INT						NOT NULL
);


---------------------------------------------------------------------------------------------------------------------------


-- DROP TABLE Banco;
-- DELETE FROM Banco;
CREATE TABLE Banco(
	idBanco						INT						PRIMARY KEY CLUSTERED,
	nomeFantasia				VARCHAR(30)			NOT NULL,
	cnpj						VARCHAR(14)				NOT NULL,
	idEndereco					INT						NOT NULL,
	ispb						VARCHAR(8)				NOT NULL
	CONSTRAINT FKContasBanco					INT						IDENTITY(1, 1) UNIQUE,
	CONSTRAINT FKAgenciaBanco					INT						NOT NULL,
);


---------------------------------------------------------------------------------------------------------------------------


-- DROP TABLE Deposito;
-- DELETE FROM Deposito;
CREATE TABLE Deposito(
	idDeposito					INT						PRIMARY KEY,
	dtDeposito					DATE					NOT NULL,
	contaDestino				INT						NOT NULL,
	valor						NUMERIC					NOT NULL
);


---------------------------------------------------------------------------------------------------------------------------


-- DROP TABLE Saque;
-- DELETE FROM Saque;
CREATE TABLE Saque(
	idSaque						INT						PRIMARY KEY,
	dtSaque						DATE					NOT NULL,
	contaOrigem					INT						NOT NULL,
	valor						NUMERIC					NOT NULL
);


---------------------------------------------------------------------------------------------------------------------------


-- DROP TABLE Transferencia;
-- DELETE FROM Transferencia;
CREATE TABLE Transferencia(
	idTransferencia				INT						PRIMARY KEY,
	dtTransferencia				DATE					NOT NULL,	
	contaOrigem					INT						NOT NULL,
	contaDestino				INT						NOT NULL,
	valor						NUMERIC					NOT NULL
);


---------------------------------------------------------------------------------------------------------------------------


-- DROP TABLE Transacoes;
-- DELETE FROM Transacoes;
CREATE TABLE Transacoes(
	idTransacoes				INT						IDENTITY(1, 1)			PRIMARY KEY CLUSTERED,
	CONSTRAINT FKSaqueTransacoes						INT,
	CONSTRAINT FKDepositoTransacoes						INT,
	CONSTRAINT FKTransferenciaTransacoes				INT
);


---------------------------------------------------------------------------------------------------------------------------



-- COMANDOS INSERT
/*
INSERT INTO Cliente (cpf, rg, orgaoEmissor, dtNascimento, nome, sobrenome, nacionalidade, naturalidade)
VALUES ('11111111111', '111111111', 'SSPSP', '2000-01-01', 'Nome', 'Sobrenome', 'Nacionalidade', 'Naturalidade');

INSERT INTO Login (idCliente, cpf, senha)
VALUES (1, '11111111111', 'senha');

INSERT INTO FAMILIARES (idCliente, nomeMae, sobrenomeMae, nomePai, sobrenomePai)
VALUES (1, 'NomeMãe', 'SobrenomeMãe', 'NomePai', 'SobrenomePai');

INSERT INTO Endereco (idCLiente, logradouro, numero, complemento, bairro, cidade, siglaEstado, cep)
VALUES (1, 'Rua Logradouro', 1, 'Complemento', 'Bairro', 'Cidade', 'SP', '11111111');

INSERT INTO CONTATO (idCliente, email, telResid, telCel)
VALUES (1, 'email@email.com', '11 0000-0000','11 11111-1111');
*/



-- COMANDOS SELECT
/*
SELECT * FROM CLIENTE;

SELECT * FROM LOGIN;

SELECT * FROM FAMILIARES;

SELECT * FROM ENDERECO;

SELECT * FROM CONTATO;
*/



-- COMANDOS DROP
/*
DROP TABLE LOGIN;

DROP TABLE FAMILIARES;

DROP TABLE ENDERECO;

DROP TABLE CONTATO;

DROP TABLE CLIENTE;
*/



-- COMANDOS DELETE
/*
DELETE FROM LOGIN;

DELETE FROM FAMILIARES;

DELETE FROM ENDERECO;

DELETE FROM CONTATO;

DELETE FROM CLIENTE;
*/



---------------------------------------------------------------------------------------------------------------------------