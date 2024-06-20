USE Cliente_Mercado

SELECT * FROM Cliente;
SELECT * FROM Pessoa_Fisica;
SELECT * FROM Pessoa_Juridica;
SELECT * FROM Pedido;
SELECT * FROM Pedido_Produto;
SELECT * FROM Produto;
SELECT * FROM Produto_Fornecedor;
SELECT * FROM Fornecedor;

SELECT COUNT(Nome) AS preco FROM Cliente;

SELECT * FROM Cliente INNER JOIN Pessoa_Fisica 
ON 
Cliente.Cd_cliente = Pessoa_Fisica.Cd_Cliente;

SELECT * FROM Cliente INNER JOIN Pessoa_Juridica 
ON 
Cliente.Cd_cliente = Pessoa_Juridica.Cd_Cliente;

SELECT
    Pedido.Cd_Pedido,
    Pedido.Data_Pedido,
    Cliente.Nome AS Nome_Cliente,
    Produto.Nome AS Nome_Produto,
    Pedido_Produto.Quantidade,
    Pedido_Produto.Preco
FROM
    Pedido
INNER JOIN Cliente ON Pedido.Cd_Cliente = Cliente.Cd_Cliente
INNER JOIN Pedido_Produto ON Pedido.Cd_Pedido = Pedido_Produto.Cd_Pedido
INNER JOIN Produto ON Pedido_Produto.Cd_Produto = Produto.Cd_Produto;
