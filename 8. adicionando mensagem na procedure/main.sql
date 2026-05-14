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

    BEGIN

        -- Verifica se o cliente possui transações suspeitas
        -- (Aprovadas, valor alto e à noite)

        IF EXISTS (
            SELECT 1 
            FROM    [FRAUDE].[dbo].[BaseFraude]
            WHERE   [Cliente] = @Clientes
            AND     [Aprovado] = 'Sim'      
            AND     [Valor_Transacoes] >= 4000
            AND     DATEPART(HOUR, [DataTransacao]) >= 21 
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
                    ,'Transação Suspeita' AS [VERIFICAR]
            FROM  [FRAUDE].[dbo].[BaseFraude]
            WHERE [Cliente] = @Clientes
            AND   [Aprovado] = 'Sim'
            AND   [Valor_Transacoes] >= 4000
            AND   DATEPART(HOUR, [DataTransacao]) >= 21              

        END

        ELSE 
	      
        BEGIN 

            -- Caso tenha aprovações, mas não tenha nenhuma suspeita
            -- (valor alto + horário)

            SELECT 
                 'Cliente não possui Transações Suspeitas' AS [MENSAGEM]

        END  

    END
	
    ELSE 

    BEGIN 

        -- Caso não tenha nenhuma transação aprovada

        SELECT
                 [DataTransacao]
                ,[Cliente]
                ,[TipoTransacao]
                ,[Valor_Transacoes]
                ,[Bandeira]
                ,[Aprovado]
                ,'Transação Não Aprovada' AS [VERIFICAR]
        FROM  [FRAUDE].[dbo].[BaseFraude]
        WHERE [Cliente] = @Clientes
        AND   [Aprovado] = 'Não'

    END 

END

GO



exec [dbo].[VerificarTransacoesClienteAprovado] @Clientes = 'Cliente 8'