-- Função de Desconto Inline
CREATE OR ALTER FUNCTION dbo.fn_conc_desc_inline (@valor Decimal(10,2))
RETURNS TABLE
AS
RETURN (
    SELECT 
        CASE 
            WHEN @valor > 3000 THEN CAST(@valor * 0.85 AS DECIMAL(10,2))
            ELSE @valor 
        END AS ValorDesconto
);
GO

-- Função de Mensagem Inline
CREATE OR ALTER FUNCTION dbo.mensagem_desc_inline (@valor Decimal(10,2))
RETURNS TABLE
AS
RETURN (
    SELECT 
        CASE 
            WHEN @valor > 3000 THEN 'Desconto de 15%'
            ELSE 'Sem desconto' 
        END AS Mensagem
);
GO

SELECT 
    f.[Cliente],
    f.[Valor_Transacoes],
    desc_calc.ValorDesconto AS [Desconto],
    msg_calc.Mensagem AS [Mensagem]
FROM [FRAUDE].[dbo].[BaseFraude] AS f
CROSS APPLY dbo.fn_conc_desc_inline(f.[Valor_Transacoes]) AS desc_calc
CROSS APPLY dbo.mensagem_desc_inline(f.[Valor_Transacoes]) AS msg_calc;


