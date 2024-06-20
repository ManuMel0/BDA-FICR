USE Cliente_Mercado

IF DB_Id('Cliente_Mercado') IS NOT NULL
BEGIN
	USE master;
	DROP DATABASE Cliente_Mercado;
END

CREATE DATABASE Cliente_Mercado;
GO
USE Cliente_Mercado;
GO
