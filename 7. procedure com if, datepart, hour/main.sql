-- ANÁLISE NO MONITORAMENTO DAS TRANSAÇÕES  

CREATE PROCEDURE VerificarTransacoesClienteAprovado

@Clientes NVARCHAR(100) -- Parâmetro de entrada para o nome do cliente

AS 
      BEGIN
         -- Verifica se o cliente tem pelo menos uma transação aprovada
         IF EXISTS (
            SELECT 1 
            FROM  [FRAUDE].[dbo].[BaseFraude]
            WHERE   [Cliente] = @Clientes 
            AND     [Aprovado] = 'Sim'
         )
      END 

      BEGIN
         -- Verifica se o  clientes possui trans. suspeitas ( Aprovadas, Valor alto e a noite )
               IF EXISTS (
                  SELECT 1 
                  FROM    [FRAUDE].[dbo].[BaseFraude]
                  WHERE   [Cliente] = @Clientes
                  AND     [Aprovado] = 'Sim'      
                  AND     [Valor_Transacoes] >= 4000
                  AND     DATEPART(HOUR, [DataTransacao]) >= 21 
               )
      END 

      BEGIN 
        --  RETORNAR AS TRANSAÇÕES SUSPEITAS 
        
                SELECT
                         [DataTransacao]
                        ,[Cliente]
                        ,[TipoTransacao]
                        ,[Valor_Transacoes]
                        ,[Bandeira]
                        ,[Aprovado]
                        'Transação Suspeita' AS [VERIFICAR]
                FROM [FRAUDE].[dbo].[BaseFraude]
      END 
GO       