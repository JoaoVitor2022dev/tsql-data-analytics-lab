-- 143. AULA 1 - DECLARAÇÃO DE VARIÁVEIS, SET, PRINT, USANDO @


-- 1 -  DECLANDO DE VARIAVEIS 
DECLARE @NomeCliente NVARCHAR(100); 

-- 2 - USANDO O SET PARA INSERIR DADOS DENTRO DA VARIÁVEL 
SET @NomeCliente = 'Alice'; 

-- Aqui exibição de mensagem PRINT
PRINT 'O nome do cliente é: ' +  @NomeCliente; 


