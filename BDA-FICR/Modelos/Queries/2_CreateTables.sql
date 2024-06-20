USE Cliente_Mercado

CREATE TABLE Cliente (
	Cd_Cliente		INTEGER			IdENTITY(1000,10)	PRIMARY KEY,
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
	Cd_Pedido		INTEGER		IdENTITY	PRIMARY KEY,
	Data_Pedido		DATE		NOT NULL,
	Cd_Cliente		INTEGER		REFERENCES Cliente (Cd_Cliente)
);

CREATE TABLE Produto (
	Cd_Produto		INTEGER			IdENTITY(100000,10) PRIMARY KEY,
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
