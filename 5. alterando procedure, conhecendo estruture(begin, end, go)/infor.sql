-- Comandos de Script SQL Server
 USE [FRAUDE]
-- Define o banco de dados que será utilizado. Nesse caso, todas as instruções que vierem a seguir vão rodar dentro do banco chamado FRAUDE.

GO
-- É um separador de lote no SQL Server. Ele indica o fim de um bloco de comandos para que o SQL Server os execute.

StoredProcedure [dbo].[Selecionar_TodasTransacoes]
-- Identifica o objeto que está sendo criado/alterado. No caso, uma Stored Procedure chamada Selecionar_TodasTransacoes, localizada no schema dbo. O nome já indica: essa procedure vai buscar todas as transações gravadas no banco.

Script Date: 21/09/2025 12:40:31
-- É apenas uma informação automática sobre quando o script foi gerado. Não afeta a execução.

SET ANSI_NULLS ON
-- Define o comportamento de comparações com valores NULL. Com ON, qualquer comparação com NULL resulta em desconhecido. A forma correta de checar valores nulos é usando IS NULL. Essa é a prática recomendada e geralmente fica ativada.

SET QUOTED_IDENTIFIER ON
-- Define como o SQL Server interpreta nomes entre aspas (" "). Com ON, aspas duplas servem para identificar nomes de objetos (ex.: "Nome da Coluna"), enquanto valores de texto devem usar aspas simples.