CREATE PROCEDURE import_json_transacoess

AS 
   BEGIN 

   SET NOCOUNT ON; -- Quando você quer ver quantas linhas cada comando afetou 

   DECLARE @json NVARCHAR(MAX)

   -- ler o arquivo onde está o arquivo JSON 
   SELECT @json = BulkColumn
   FROM OPENROWSET (
        BULK 'C:\Users\jennifer\OneDrive\Desktop\JV\Estudos\SQL\Base_de_dados\exemplo_tabela.json', 
        SINGLE_CLOB
    ) AS [JsonData]

-- Criar a tabela com condição se existir, deletar a tabela e criar novamente
IF OBJECT_ID('dbo.tb.Transacoes') IS NOT NULL 
BEGIN 
    CREATE TABLE dbo.tb.Transacoes (
        DataTransacao:    VARCHAR(30),
        Cliente:          VARCHAR(100),
        TipoTransacao:    VARCHAR(50),
        Valor_Transacoes: NUMERIC(10,2),  
        Bandeira:         VARCHAR(50),
        Aprovado:         VARCHAR(10)
    ) 
END 

 -- Inserir os dados do json na tabela 



