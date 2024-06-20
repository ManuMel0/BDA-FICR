USE Cliente_Mercado;

GO

CREATE PROCEDURE P_CrudView
AS
BEGIN
    DECLARE @TableName NVARCHAR(255) = 'Cliente';
    DECLARE @Sql NVARCHAR(MAX);

    SET @Sql = '
        CREATE TRIGGER T_CrudView ON ' + @TableName + ' FOR INSERT, UPDATE, DELETE
        AS
			BEGIN
				IF EXISTS(SELECT * FROM inserted)
					BEGIN
						IF EXISTS(SELECT * FROM deleted)
							BEGIN
								PRINT ''Registro alterado com sucesso!'';
								SELECT * FROM deleted;
							END
						ELSE
							BEGIN
								PRINT ''Registrado com sucesso!'';
								SELECT * FROM inserted;
							END
					END
				ELSE
					BEGIN
						PRINT ''Registro excluído com sucesso!'';
						SELECT * FROM deleted;
					END
			END';

    EXEC sp_executesql @Sql;
END;

GO

EXEC P_CrudView;

INSERT INTO Cliente VALUES 
('Seu Armando', 923579246, 'Belford Roxo', '77788999', 749, 'Sala 104', 'Fabrica De Farinha', 'Jaboatão', 'PE');