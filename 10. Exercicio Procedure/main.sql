-- Crie uma procedure onde contenha, ocorrencia fora do padrao 
-- Tipo de transação fraude, estorno 

-- valor_transação >= 4000.00 
-- horas das transações > 23h 
-- bandeira  'Amex'
-- fazer com variaveis 

SELECT TOP (1000) [DataTransacao]
      ,[Cliente]
      ,[TipoTransacao]
      ,[Valor_Transacoes]
      ,[Bandeira]
      ,[Aprovado]
FROM [FRAUDE].[dbo].[BaseFraude]

ALTER PROCEDURE TransacoesForaPadrao (

@Clientes VARCHAR(100)

) -- O parêntese fecha aqui, logo após as variáveis de entrada

AS 
   BEGIN 
         IF EXISTS (
              SELECT 1
              FROM   [FRAUDE].[dbo].[BaseFraude]
              WHERE  [Cliente] = @Clientes
              AND    [Valor_Transacoes] >= 4000.00 
              AND    [Bandeira] = 'Amex'
              AND    DATEPART(HOUR, [DataTransacao]) >= 23
         )  

         BEGIN 

                 -- RETORNAR AS TRANSAÇÕES SUSPEITAS 

                SELECT 
                           [DataTransacao]
                          ,[Cliente]
                          ,[TipoTransacao]
                          ,[Valor_Transacoes]
                          ,[Bandeira]
                          ,[Aprovado] 
                          ,'Ocorrências fora do padrão' AS [Verifica]
                FROM   [FRAUDE].[dbo].[BaseFraude]
                WHERE  [Cliente] = @Clientes
                AND    [Valor_Transacoes] >= 4000.00 
                AND    [Bandeira] = 'Amex'
                AND    DATEPART(HOUR, [DataTransacao]) >= 23
            END

       ELSE 

       BEGIN
             SELECT 
             ' Clientes não possui transações Suspeitas ' AS [MENSAGEM]
          END 
   END 
GO 



EXEC TransacoesForaPadrao  @Clientes = 'Cliente 8'