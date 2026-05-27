USE [FRAUDE]
GO

/****** Objeto:  StoredProcedure [dbo].[ClassificacaoTransacao]  
  Alterado por analista Joao Mocambite 
Data do Script: 27/05/2026 11:26:24 ******/

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[ClassificacaoTransacao]
AS 
   BEGIN
      SELECT 
           [Cliente],
           [Valor_Transacoes],
           CASE
              WHEN [Valor_Transacoes] < 100 THEN 'Baixo' 
              WHEN [Valor_Transacoes] BETWEEN 100 AND 1000 THEN 'Médio'
              ELSE 'Alo'
              END AS [classificacao] 
      FROM [FRAUDE].[dbo].[BaseFraude]
   END 
