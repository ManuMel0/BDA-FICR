USE Cliente_Mercado;

CREATE INDEX IDX_cpf_cliente ON Pessoa_Fisica (CPF_Cliente);
CREATE INDEX IDX_Estoque ON Produto(Estoque_Atual, Estoque_Minimo);

SELECT * FROM Pessoa_Fisica WHERE CPF_Cliente = '12345678901'