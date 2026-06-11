CREATE FUNCTION dbo.fn_conc_desc (@valor Decimal(10,2))
RETURNS DECIMAL (10,2)

AS 
  BEGIN 
       RETURN
       CASE 
            WHEN @valor > 3000 THEN @valor * 0.15  
            ELSE @valor 
            END     
  END      


-===========================================

CREATE FUNCTION dbo.mensagem_desc  (@valor Decimal(10,2))
RETURNS VARCHAR(100)

AS
  BEGIN 
       RETURN
       CASE WHEN @valor > 3000 THEN 'Desconto de 15%'
            ELSE 'Sem desconto' 
            END
   END 


--==============================================

SELECT 
        [Cliente],
        dbo.fn_conc_desc([Valor_Transacoes]) AS [Desconto],
        dbo.mensagem_desc([Valor_Transacoes]) AS [Mensagem]
FROM [FRAUDE].[dbo].[BaseFraude]

