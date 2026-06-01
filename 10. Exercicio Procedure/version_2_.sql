CREATE PROCEDURE TransacoesForaPadrao (
    @Clientes VARCHAR(100)
)
AS 
BEGIN 
    -- Configuração de boas práticas para evitar mensagens de contagem de linhas
    SET NOCOUNT ON;

    -- Declaração das variáveis com os critérios de fraude solicitados
    DECLARE @ValorMinimo DECIMAL(18,2) = 4000.00;
    DECLARE @HoraLimite INT = 23;
    DECLARE @BandeiraAlvo VARCHAR(20) = 'Amex';

    -- Verifica se existem transações suspeitas com base nas variáveis
    IF EXISTS (
        SELECT 1
        FROM   [FRAUDE].[dbo].[BaseFraude]
        WHERE  [Cliente] = @Clientes
        AND    [Valor_Transacoes] >= @ValorMinimo
        AND    [Bandeira] = @BandeiraAlvo
        AND    DATEPART(HOUR, [DataTransacao]) >= @HoraLimite
    )  
    BEGIN 
        -- Retorna as transações suspeitas encontradas
        SELECT 
             [DataTransacao]
            ,[Cliente]
            ,[TipoTransacao]
            ,[Valor_Transacoes]
            ,[Bandeira]
            ,[Aprovado] 
        FROM [FRAUDE].[dbo].[BaseFraude]
        WHERE  [Cliente] = @Clientes
        AND    [Valor_Transacoes] >= @ValorMinimo
        AND    [Bandeira] = @BandeiraAlvo
        AND    DATEPART(HOUR, [DataTransacao]) >= @HoraLimite;
    END 
    ELSE 
    BEGIN
        -- Retorna mensagem caso o cliente esteja regular
        SELECT 'O cliente não possui transações suspeitas.' AS [MENSAGEM];
    END 
END;
GO
