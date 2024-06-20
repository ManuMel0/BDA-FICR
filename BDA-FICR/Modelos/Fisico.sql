IF DB_Id('Cliente_Mercado') IS NOT NULL
BEGIN
	USE master;
	DROP DATABASE Cliente_Mercado;
END

CREATE DATABASE Cliente_Mercado;
GO
USE Cliente_Mercado;
GO

--============ CREATES ============
CREATE TABLE Cliente (
	Cd_Cliente		INTEGER			IDENTITY(1000,10)	PRIMARY KEY,
	Nome			VARCHAR(50)		NOT NULL,
	Telefone		INTEGER			NOT NULL,
	Logradouro		VARCHAR(50)		NOT NULL,
	Cep				CHAR(8)			NOT NULL,
	Numero			INTEGER			NOT NULL,
	Complemento		VARCHAR(50)		NOT NULL,
	Bairro			VARCHAR(50)		NOT NULL,
	Cidade			VARCHAR(30)		NOT NULL			DEFAULT 'Recife',
	Estado			CHAR(2)			NOT NULL			DEFAULT 'PE',
);

CREATE TABLE Pessoa_Juridica (
	CNPJ_Cliente	CHAR(14)		PRIMARY KEY,
	Nome_Fantasia	VARCHAR(50)		NOT NULL	UNIQUE,
	Razao_Social	VARCHAR(50)		NOT NULL,
	Cd_Cliente		INTEGER			REFERENCES Cliente(Cd_Cliente) ON DELETE CASCADE
);

CREATE TABLE Pessoa_Fisica (
	CPF_Cliente		CHAR(11)	PRIMARY KEY,
	Nascimento		DATE		NOT NULL,
	Sexo			CHAR(1)		NOT NULL							CHECK (Sexo = 'M' OR Sexo = 'F'),
	Cd_Cliente		INTEGER		REFERENCES Cliente(Cd_Cliente)		ON DELETE CASCADE
);

CREATE TABLE Pedido (
	Cd_Pedido		INTEGER		IDENTITY	PRIMARY KEY,
	Data_Pedido		DATE		NOT NULL,
	Cd_Cliente		INTEGER		REFERENCES Cliente (Cd_Cliente)
);

CREATE TABLE Produto (
	Cd_Produto		INTEGER			IDENTITY(100000,10) PRIMARY KEY,
	Nome			VARCHAR(50)		NOT NULL,
	Categoria		VARCHAR(50)		NOT NULL,
	Estoque_Atual	INTEGER			NOT NULL,
	Estoque_Minimo	INTEGER			CONSTRAINT DF_estoque_min DEFAULT ('5') 
);

CREATE TABLE Fornecedor (
	Id_Fornecedor	INTEGER			IDENTITY(100,1) PRIMARY KEY,
	Nome			VARCHAR(50)		NOT NULL,
	Telefone		INTEGER			NOT NULL,
	Cep				CHAR(8)			NOT NULL,
	Estado			CHAR(2)			NOT NULL,
	Complemento		VARCHAR(50)		NOT NULL,
	Numero			INTEGER			NOT NULL,
	Bairro			VARCHAR(50)		NOT NULL,
	Cidade			VARCHAR(50)		NOT NULL,
	Logradouro		VARCHAR(50)		NOT NULL
);

CREATE TABLE Pedido_Produto (
	Cd_Produto		INTEGER		REFERENCES Produto(Cd_Produto),
	Cd_Pedido		INTEGER		REFERENCES Pedido(Cd_Pedido),
	Quantidade		INTEGER			NOT NULL,
	Preco			DECIMAL(5,2)	NOT NULL,
	PRIMARY KEY (Cd_Produto, Cd_Pedido)
);

CREATE TABLE Produto_Fornecedor (
	Id_Fornecedor	INTEGER		REFERENCES Fornecedor(Id_Fornecedor),
	Cd_Produto		INTEGER		REFERENCES Produto(Cd_Produto),
	PRIMARY KEY (Id_Fornecedor, Cd_Produto)
);

GO
--============ INSERTS ============

INSERT INTO Cliente (Nome, Telefone, Logradouro,  Cep, Numero, Complemento, Bairro, Cidade, Estado)
VALUES	('João Silva',		912345678, 'Avenida Paulista',		 '11122333', 123, 'Apto 101',  'Jardim Paulista',	'Recife',	  'PE'),   
		('Maria Oliveira',	987654321, 'Rua Copacabana',		 '44455666', 456, 'Casa 102',  'Copacabana',		'Recife', 'PE'),  
		('Alvaro Oliveira', 913579246, 'Rua da Liberdade',		 '77788999', 789, 'Sala 103',  'São Benedito',		'Jaboatão', 'PE'), 
		('Ana Pereira',		954321098, 'Avenida Dos Estados',	 '99988777', 101, 'Bloco 201', 'Moinhos de Vento',  'Recife',	  'PE'), 
		('Pedro Souza',		998765432, 'Avenida das Araucárias', '55444333', 202, 'Casa 103',  'Batel',				'Olinda',		  'PE'),
		('Aurora Azevedo',	911223344, 'Rua Dragão do Mar',		 '22333444', 303, 'Andar 15',  'Meireles',			'Olinda',	  'PE');

INSERT INTO Pessoa_Fisica (CPF_Cliente, Nascimento, Sexo, Cd_Cliente)
VALUES  ('12345678901', '1990-05-15', 'M', 1000),
		('98765432109', '1985-08-22', 'F', 1010),
		('45678901234', '1998-02-10', 'M', 1020);

INSERT INTO Pessoa_Juridica (CNPJ_Cliente, Nome_Fantasia, Razao_Social, Cd_Cliente)
VALUES	('12345678901234', 'Empresa A', 'Razao Social A', 1030),
		('98765432109876', 'Empresa B', 'Razao Social B', 1040),
		('45678901234567', 'Empresa C', 'Razao Social C', 1050);

-- Pedido
INSERT INTO Pedido (Data_Pedido, Cd_Cliente)
VALUES	('2023-01-15', 1010),
		('2023-02-20', 1020),
		('2023-03-25', 1030);

-- Fornecedor
INSERT INTO Fornecedor (Nome, Telefone, Cep, Estado, Complemento, Numero, Bairro, Cidade, Logradouro)
VALUES	('Fornecedor A', 111222333, '12345678', 'SP', 'Apto 101', 123, 'Centro',   'Cidade A', 'Rua A'),
		('Fornecedor B', 444555666, '87654321', 'RJ', 'Casa 102', 456, 'Bairro B', 'Cidade B', 'Rua B'),
		('Fornecedor C', 777888999, '13579246', 'MG', 'Sala 103', 789, 'Subúrbio', 'Cidade C', 'Rua C');

-- Produto

INSERT INTO Produto (Nome, Categoria, Estoque_Atual, Estoque_Minimo)
VALUES	('Produto A', 'Eletrônicos',  50, 10),
		('Produto B', 'Roupas',		 100, 20),
		('Produto C', 'Alimentos',	  75, 15),
		('Produto D', 'Móveis',		  30,  5),
		('Produto E', 'Beleza',		  60, 10),
		('Produto F', 'Livros',       40,  8);

-- Produto_Fornecedor
INSERT INTO Produto_Fornecedor (Id_Fornecedor, Cd_Produto)
VALUES	(100, 100000),
		(100, 100010), 
		(101, 100020),
		(101, 100030),  
		(102, 100040), 
		(102, 100050); 

-- Pedido_Produto
INSERT INTO Pedido_Produto (Cd_Produto, Cd_Pedido, Quantidade, Preco)
VALUES	(100000, 1, 124, 9.99),
		(100050, 2,  17, 1.99),
		(100040, 3,  22, 1.57);
GO


-- TRIGGERs
CREATE TRIGGER Comentario1 ON Cliente FOR INSERT, UPDATE, DELETE
AS
	BEGIN
		IF EXISTS(SELECT * FROM inserted)
			EXECUTE BD_ConsultaSexo 'F';
	END;

CREATE TRIGGER Mensagem ON Produto FOR INSERT, UPDATE, DELETE AS
IF EXISTS(SELECT * FROM INSERTED)
	IF EXISTS(SELECT * FROM DELETED)
		PRINT 'Registro(s) alterado(s) com sucesso!'
	ELSE
		PRINT 'Registro(s) incluído(s) com sucesso!'
ELSE
	PRINT 'Registro(s) excluído(s) com sucesso!'

--============ SELECTS ============
-- ALL

CREATE PROCEDURE SP_Agregacoes
AS 
	SELECT 
	SUM(Preco) AS Soma,
	AVG(Preco) AS Media,
	MAX(Preco) AS Maior,
	MIN(Preco) AS Menor
	FROM Pedido_Produto
	GO;


SELECT * FROM Cliente;
SELECT * FROM Pessoa_Fisica;
SELECT * FROM Pessoa_Juridica;
SELECT * FROM Pedido;
SELECT * FROM Pedido_Produto;
SELECT * FROM Produto;
SELECT * FROM Produto_Fornecedor;
SELECT * FROM Fornecedor;

go

SELECT COUNT(Nome) AS preco FROM Cliente;

SELECT * FROM Cliente INNER JOIN Pessoa_Fisica 
ON Cliente.Cd_cliente = Pessoa_Fisica.Cd_Cliente;

SELECT * FROM Cliente INNER JOIN Pessoa_Juridica 
ON Cliente.Cd_cliente = Pessoa_Juridica.Cd_Cliente;

go

-- FUNCTIONS
CREATE FUNCTION F_ClientesComA()
	RETURNS TABLE
AS
	RETURN (
		SELECT * FROM Cliente WHERE Nome LIKE 'A%'
	);

GO

SELECT * FROM dbo.F_ClientesComA();


-- INDEX
CREATE INDEX IDX_cpf_cliente ON Pessoa_Fisica (CPF_Cliente);
CREATE INDEX IDX_Estoque ON Produto(Estoque_Atual, Estoque_Minimo);

SELECT * FROM Pessoa_Fisica WHERE CPF_Cliente = '12345678901'

GO


--UPDATE Produto SET Categoria = 'Leitura' WHERE nome = 'Produto F';