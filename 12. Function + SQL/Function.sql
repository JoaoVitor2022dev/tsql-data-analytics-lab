
CREATE OR ALTER FUNCTION dbo.fn_Saudacao (@nome NVARCHAR(100))

RETURNS NVARCHAR(200)

WITH SCHEMABINDING -- 2. Ganho de performance

AS 

BEGIN 

    RETURN CONCAT('Olá, ', ISNULL(@nome, 'Visitante'), '! Bem-vindo ao SQL Server.');   

END;

GO

-- Funções no SQL Server (do tipo Scalar, como a sua) têm uma fama ruim de deixar as consultas lentas se forem usadas em tabelas grandes (com milhares de linhas).
-- Ao adicionar WITH SCHEMABINDING, você está dizendo ao SQL Server: "Essa função não depende de nenhuma tabela externa, ela só olha para o que entra nela". Isso ajuda o otimizador de consultas a rodar a função de forma muito mais rápida.

