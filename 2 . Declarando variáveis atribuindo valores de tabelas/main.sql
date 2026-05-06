-- 143. AULA 1 - DECLARAÇÃO DE VARIÁVEIS, SET, PRINT, USANDO @


-- 1 -  DECLANDO DE VARIAVEIS 
DECLARE @NomeCliente NVARCHAR(100); 

-- 2 - USANDO O SET PARA INSERIR DADOS DENTRO DA VARIÁVEL 
SET @NomeCliente = 'Alice'; 

-- Aqui exibição de mensagem PRINT
PRINT 'O nome do cliente é: ' +  @NomeCliente; 

-------------------------------------------------------------------

-- 144. AULA 2 - DECLARANDO VARIÁVEIS ATRIBUINDO VALORES DE TABELAS

  DECLARE @NomeVendedor NVARCHAR(100); 
  SET @NomeVendedor = 'LTZ';  -- NÃO PRECISA MAIS ALTERAR O VALOR NO WHRE, APENAS ALTERAR O O VALOR NAS VARIAVEIS 

  SELECT
       [COD_CLIENTE]
      ,[VENDEDOR]
      ,[QUANTIDADE]
      ,[VALOR_PAGO]
  FROM [VENDAS_ATUALIZADAS].[dbo].[TB_VENDAS]
  WHERE [VENDEDOR] = @NomeVendedor

  SELECT 'Este foi o vendedor selecionado ' + @NomeVendedor AS [MENSAGEM]

-- 





   


