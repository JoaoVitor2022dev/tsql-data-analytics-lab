CREATE FUNCTION fn_TransacaoFraude()
RETURNS TABLE 

AS 
   RETURN(
   SELECT *
   FROM [FRAUDE].[dbo].[tb_Transacoes]
   WHERE [TipoTransacao] = 'Fraude'
   ); 
    

SELECT * FROM  fn_TransacaoFraude()   

-- =============================================

-- FUNCÃO COM CASE WHEN 

CREATE FUNCTION fn_status_aprovado_2 (@status VARCHAR(130))
RETURNS VARCHAR(130)
AS
BEGIN
    RETURN (
        CASE
            WHEN @status = 'Sim' THEN 'Aprovado com sucesso!'
            WHEN @status = 'Não' THEN 'Reprovada pelo sistema!'
            ELSE 'Status desconhecido!'
        END
    )
END
GO

SELECT
    [Cliente],
    [Aprovado],
    dbo.fn_status_aprovado_2([Aprovado]) AS [Status Aprovacao]
FROM [FRAUDE].[dbo].[tb_Transacoes];


