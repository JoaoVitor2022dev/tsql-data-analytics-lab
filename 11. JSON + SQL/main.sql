CREATE PROCEDURE import_json_transacoess
AS
BEGIN

    SET NOCOUNT ON;

    DECLARE @json NVARCHAR(MAX);

    SELECT @json = BulkColumn
    FROM OPENROWSET (
        BULK 'C:\Users\jennifer\OneDrive\Desktop\JV\Estudos\SQL\Base_de_dados\exemplo_tabela.json',
        SINGLE_CLOB
    ) AS JsonData;

    IF OBJECT_ID('dbo.tb_Transacoes') IS NOT NULL
        DROP TABLE dbo.tb_Transacoes;

    CREATE TABLE dbo.tb_Transacoes (
        DataTransacao VARCHAR(30),
        Cliente VARCHAR(100),
        TipoTransacao VARCHAR(50),
        Valor_Transacoes NUMERIC(10,2),
        Bandeira VARCHAR(50),
        Aprovado VARCHAR(10)
    );

    INSERT INTO dbo.tb_Transacoes (
        DataTransacao,
        Cliente,
        TipoTransacao,
        Valor_Transacoes,
        Bandeira,
        Aprovado
    )
    SELECT
        DataTransacao,
        Cliente,
        TipoTransacao,
        Valor_Transacoes,
        Bandeira,
        Aprovado
    FROM OPENJSON(@json)
    WITH (
        DataTransacao VARCHAR(30),
        Cliente VARCHAR(100),
        TipoTransacao VARCHAR(50),
        Valor_Transacoes NUMERIC(10,2),
        Bandeira VARCHAR(50),
        Aprovado VARCHAR(10)
    );

END;
GO