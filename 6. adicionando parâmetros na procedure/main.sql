USE [FRAUDE]
GO

/****** Object:  StoredProcedure [dbo].[ListarTransacoesPorCliente]  
    Desenvolvido por: [João Vitor] 
Script Date: 11/05/2026 11:19:03 ******/

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[ListarTransacoesPorCliente]

@Cliente NVARCHAR(100),
@Aprovado NVARCHAR(10) 

AS
  
       BEGIN 
	           SELECT  
                    [Cliente]
                   ,[TipoTransacao]
                   ,[Valor_Transacoes]
                   ,[Bandeira]
                   ,[Aprovado]
               FROM [FRAUDE].[dbo].[BaseFraude]
			   WHERE [Cliente] = @Cliente
			   AND   [Aprovado] = @Aprovado
	       
	      END 
GO 


EXEC [dbo].[ListarTransacoesPorCliente]  @Cliente = 'Cliente 3', @Aprovado = 'Não'





