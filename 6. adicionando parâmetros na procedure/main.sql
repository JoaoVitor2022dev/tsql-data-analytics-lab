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




--===============================================

-- PROCEDURE 3 

SELECT TOP (1000) [DataTransacao]
      ,[Cliente]
      ,[TipoTransacao]
      ,[Valor_Transacoes]
      ,[Bandeira]
      ,[Aprovado]
  FROM [FRAUDE].[dbo].[BaseFraude]



ALTER PROCEDURE [dbo].[BuscarTransacoes] 

@Ano       INT, 
@Cliente   NVARCHAR(100)

AS  
      BEGIN 
	      SELECT 
		        [DataTransacao]
               ,[Cliente]
               ,[TipoTransacao]
               ,[Valor_Transacoes]
               ,[Bandeira]
               ,[Aprovado]
          FROM [FRAUDE].[dbo].[BaseFraude]
		  WHERE [Cliente] = @Cliente
		  AND   YEAR([DataTransacao]) = @Ano 
	  END
GO
  


EXEC BuscarTransacoes @Ano=2023, @Cliente='Cliente 4' 


