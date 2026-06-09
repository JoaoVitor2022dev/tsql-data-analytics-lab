-- Criar uma tabela 
-- Exercicio function 

--  VERIFICAR SE JÁ EXISTE A TABELA, SE EXISTIR DROPAR  
IF OBJECT_ID('dbo.tb_Transacoes') IS NOT NULL 
BEGIN 
     DROP TABLE dbo.tb_Transacoes
END 

-- CRIAR UMA TABELA 

CREATE TABLE dbo.tb_Transacoes (
        DataTransacao        VARCHAR(30),
        Cliente              VARCHAR(100),
        TipoTransacao        VARCHAR(50),
        Valor_Transacoes     NUMERIC(10,2),
        Bandeira             VARCHAR(50),
        Aprovado             VARCHAR(10)
); 

-- DECLARAR A VARIAVEL QUE O JSON VAI SER INSERIDO 
DECLARE @json NVARCHAR(MAX); 

SELECT @json = BulkColumn
FROM OPENROWSET (
    BULK 'C:\Users\jennifer\OneDrive\Desktop\JV\Estudos\SQL\Base_de_dados\exemplo_tabela.json',
    SINGLE_CLOB
) AS [JsonData];


-- 4 Inserido os dados dentro da nova tabela 

INSERT INTO dbo.tb_Transacoes (
        DataTransacao ,
        Cliente,
        TipoTransacao ,
        Valor_Transacoes,
        Bandeira ,
        Aprovado      
) FROM OPENJSON(@json)
WITH (
        DataTransacao        VARCHAR(30),
        Cliente              VARCHAR(100),
        TipoTransacao        VARCHAR(50),
        Valor_Transacoes     NUMERIC(10,2),
        Bandeira             VARCHAR(50),
        Aprovado             VARCHAR(10)
)

SELECT * FROM dbo.tb_Transacoes

--==============================================

-- CRIANDO A FUNCTION 

CREATE FUNCTION dbo.fn_Saudacao (@nome NVARCHAR(100))
RETURNS NVARCHAR(200)
AS 
   BEGIN 
        RETURN 'Olá, ' + @nome + '! Bem-vindo ao SQL Server.'   
   END 

SELECT 
      [DataTransacao],
      dbo.fn_Saudacao([Cliente]) AS [SAUDACAO],
      [Valor_Transacoes]
FROM dbo.tb_Transacoes


