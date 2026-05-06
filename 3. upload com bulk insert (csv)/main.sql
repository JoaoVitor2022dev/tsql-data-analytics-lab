SELECT TOP (1000) [DataTransacao]
      ,[Cliente]
      ,[TipoTransacao]
      ,[Valor_Transacoes]
      ,[Bandeira]
      ,[Aprovado]
  FROM [FRAUDE].[dbo].[BaseFraude]

  
-- DROP TABLE BaseFraude
CREATE TABLE BaseFraude 
(
    DataTransacao     DATETIME,
    Cliente           VARCHAR(50), 
    TipoTransacao     VARCHAR(50), 
    Valor_Transacoes  FLOAT,
    Bandeira          VARCHAR(50),
    Aprovado          VARCHAR(50) 
)

-----------------------------------------------------------

-- INSERINDO DA PASTA PARA O BANCO DE DADOS 

BULK INSERT BaseFraude
FROM 'E:\1. CONTROLE DE ESTUDOS GERAL\GRADE DE ESTUDO 1 SEMESTRE 2026\1. SQL\3. Programação em SQL TSQL\script\BASE DE DADOS\Base_Fraude.csv'

WITH
(
    FIRSTROW = 2,               -- lendo a segunda linha 
    FIELDTERMINATOR = ',',      -- separador de colunas
    ROWTERMINATOR = '\n',       -- separador de linhas
    CODEPAGE = '65001'          -- UTF-8
);


