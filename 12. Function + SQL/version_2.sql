-- 1. Limpa a tabela se ela já existir (Jeito moderno)
DROP TABLE IF EXISTS dbo.tb_Transacoes;

-- (Opcional) Criação da tabela caso você não tenha criado ainda
CREATE TABLE dbo.tb_Transacoes (
    DataTransacao VARCHAR(30),
    Cliente VARCHAR(100),
    TipoTransacao VARCHAR(50),
    Valor_Transacoes NUMERIC(10,2),
    Bandeira VARCHAR(50),
    Aprovado VARCHAR(10)
);

-- 2. Declara a variável que vai guardar o texto do JSON
DECLARE @json NVARCHAR(MAX);

-- 3. Lê o arquivo e joga na variável (ATENÇÃO ao ponto e vírgula no final!)
SELECT @json = BulkColumn
FROM OPENROWSET (BULK 'C:\Users\jennifer\OneDrive\Desktop\JV\Estudos\SQL\Base_de_dados\exemplo_tabela.json', SINGLE_CLOB) AS Importacao;
-- O ponto e vírgula acima é OBRIGATÓRIO para o WITH de baixo funcionar!

-- 4. Insere os dados processados na tabela
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
    DataTransacao        VARCHAR(30),
    Cliente              VARCHAR(100),
    TipoTransacao        VARCHAR(50),
    Valor_Transacoes     NUMERIC(10,2),
    Bandeira             VARCHAR(50),
    Aprovado             VARCHAR(10)
);

-- 5. Verifica se os dados entraram
SELECT * FROM dbo.tb_Transacoes;