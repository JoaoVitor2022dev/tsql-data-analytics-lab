-- 147. AULA 4 - CRIANDO ESTRUTURA STORED PROCEDURE

-- Procedure é tipo uma função pronta dentro do banco, que:

-- organiza
-- protege
-- acelera
-- reaproveita código

-- 1 -  CRIANDO UM PROCEDURE 

CREATE PROCEDURE Selecionar_TodasTransacoes
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
    GO

EXEC Selecionar_TodasTransacoes