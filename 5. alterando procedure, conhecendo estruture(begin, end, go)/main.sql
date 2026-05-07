USE [FRAUDE]
GO


/****** Object:  StoredProcedure [dbo].[Selecionar_TodasTransacoes] 
  Desenvolvido por João Mocambite  
Script Date: 07/05/2026 10:18:25 ******/


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[Selecionar_TodasTransacoes]
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
        END 

EXEC [dbo].[Selecionar_TodasTransacoes]


--===============================================
--===============================================


-- 2. Procedure 

-- CRIA UMA STORED PROCEDURE
CREATE PROCEDURE ListarTransacoesPorCliente

-- PARÂMETRO DA PROCEDURE
-- @Cliente = variável que receberá o nome do cliente
-- NVARCHAR(100) = tipo texto com até 100 caracteres
@Cliente NVARCHAR(100)

-- INDICA O INÍCIO DO CÓDIGO DA PROCEDURE
AS
  
       -- INÍCIO DO BLOCO DE COMANDOS
       BEGIN 
	   
	           -- CONSULTA DOS DADOS
	           SELECT  
			        
					-- COLUNA CLIENTE
                    [Cliente],

					-- COLUNA TIPO DA TRANSAÇÃO
                    [TipoTransacao],

					-- COLUNA VALOR DA TRANSAÇÃO
                    [Valor_Transacoes],

					-- COLUNA BANDEIRA DO CARTÃO
                    [Bandeira],

					-- COLUNA STATUS DE APROVAÇÃO
                    [Aprovado]

               -- TABELA UTILIZADA
               FROM [FRAUDE].[dbo].[BaseFraude]

			   -- FILTRO PELO CLIENTE INFORMADO
			   -- @Cliente recebe o valor passado na execução
			   WHERE [Cliente] = @Cliente
	       
	      -- FINAL DO BLOCO BEGIN
	      END 
	  
-- FINALIZA O LOTE DE EXECUÇÃO
GO
  
-- EXECUTA A PROCEDURE
EXEC ListarTransacoesPorCliente 

-- PASSANDO VALOR PARA O PARÂMETRO @Cliente
@Cliente = 'Cliente 3'

--===============================================
--===============================================


