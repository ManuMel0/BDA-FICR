USE Cliente_Mercado

GO

CREATE PROCEDURE SP_Agregacoes
AS 
	BEGIN
		PRINT 'Informações dos preços'
		SELECT 
			SUM(Preco) AS Soma,
			AVG(Preco) AS Media,
			MAX(Preco) AS Maior,
			MIN(Preco) AS Menor
		FROM Pedido_Produto;
	END
GO

-- =====================================================

GO

CREATE PROCEDURE SP_ConsultarSexo @Sexo CHAR(1) = NULL 
AS 
	BEGIN 
		IF @Sexo IS NULL
			SELECT * FROM Pessoa_Fisica;
		ELSE
			SELECT * FROM Pessoa_Fisica WHERE Sexo = @Sexo;
	END

GO

EXEC SP_Agregacoes
EXECUTE SP_ConsultarSexo 'F'
