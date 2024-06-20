USE Cliente_Mercado

GO

CREATE FUNCTION F_ClientesExternos()
RETURNS TABLE
AS
RETURN (
    SELECT * FROM Cliente WHERE Cidade NOT LIKE 'Recife'
);

GO
-- ========================================================

CREATE FUNCTION F_Situacao_Estoque(@Cd_Produto int)
RETURNS VARCHAR(50)
AS 
BEGIN
	DECLARE @Situacao VARCHAR(50)

	SELECT TOP 1 @Situacao = 
		CASE 
			WHEN Estoque_Minimo <= Estoque_Atual + 10
			THEN 'Alerta, necessário repor estoque!'
			ELSE 'Estoque insuficiente!'
		END
	FROM Produto 
	WHERE Cd_Produto = @Cd_Produto

	RETURN @Situacao;
END;

GO

DECLARE @Resultado VARCHAR(50);
SET @Resultado = dbo.F_Situacao_Estoque(100010);
PRINT @Resultado;

SELECT * FROM dbo.F_ClientesExternos();