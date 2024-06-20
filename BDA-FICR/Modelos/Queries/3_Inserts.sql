USE Cliente_Mercado

INSERT INTO Cliente (Nome, Telefone, Logradouro,  Cep, Numero, Complemento, Bairro, Cidade, Estado)
VALUES	('João Silva',		912345678, 'Avenida Paulista',		 '11122333', 123, 'Apto 101',  'Jardim Paulista',	'Recife',	'PE'),   
		('Maria Oliveira',	987654321, 'Rua Copacabana',		 '44455666', 456, 'Casa 102',  'Copacabana',		'Recife',	'PE'),  
		('Alvaro Oliveira', 913579246, 'Rua da Liberdade',		 '77788999', 789, 'Sala 103',  'São Benedito',		'Jaboatão',	'PE'), 
		('Ana Pereira',		954321098, 'Avenida Dos Estados',	 '99988777', 101, 'Bloco 201', 'Moinhos de Vento',  'Recife',	'PE'), 
		('Pedro Souza',		998765432, 'Avenida das Araucárias', '55444333', 202, 'Casa 103',  'Batel',				'Olinda',	'PE'),
		('Aurora Azevedo',	911223344, 'Rua Dragão do Mar',		 '22333444', 303, 'Andar 15',  'Meireles',			'Olinda',	'PE');

INSERT INTO Pessoa_Fisica (CPF_Cliente, Nascimento, Sexo, Cd_Cliente)
VALUES  ('12345678901', '1990-05-15', 'M', 1000),
		('98765432109', '1985-08-22', 'F', 1010),
		('45678901234', '1998-02-10', 'M', 1020);

INSERT INTO Pessoa_Juridica (CNPJ_Cliente, Nome_Fantasia, Razao_Social, Cd_Cliente)
VALUES	('12345678901234', 'Empresa A', 'Razao Social A', 1030),
		('98765432109876', 'Empresa B', 'Razao Social B', 1040),
		('45678901234567', 'Empresa C', 'Razao Social C', 1050);

GO
-- Pedido
INSERT INTO Pedido (Data_Pedido, Cd_Cliente)
VALUES	('2023-01-15', 1010),
		('2023-02-20', 1020),
		('2023-03-25', 1030);

GO
-- Fornecedor
INSERT INTO Fornecedor (Nome, Telefone, Cep, Estado, Complemento, Numero, Bairro, Cidade, Logradouro)
VALUES	('Fornecedor A', 111222333, '12345678', 'SP', 'Apto 101', 123, 'Centro',   'Cidade A', 'Rua A'),
		('Fornecedor B', 444555666, '87654321', 'RJ', 'Casa 102', 456, 'Bairro B', 'Cidade B', 'Rua B'),
		('Fornecedor C', 777888999, '13579246', 'MG', 'Sala 103', 789, 'Subúrbio', 'Cidade C', 'Rua C');

GO
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
