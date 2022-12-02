IF OBJECT_ID('dbo.PFlashCard_GetAll') IS NOT NULL
BEGIN
	DROP PROCEDURE dbo.PFlashCard_GetAll
	IF OBJECT_ID('dbo.PFlashCard_GetAll') IS NOT NULL
		PRINT 'ERRO AO APAGAR A PROCEDURE PFlashCard_GetAll'
	ELSE 
		PRINT 'PROCEDURE PFlashCard_GetAll APAGADA'		
END
GO
CREATE PROCEDURE dbo.PFlashCard_GetAll
 @pUsuarioId  INT   
AS
  
SELECT a.id
	  ,a.usuarioId
	  ,a.nome
	  ,a.pergunta
	  ,a.resposta
FROM FlashCard	A
  INNER JOIN Usuario B ON A.UsuarioId = B.id
WHERE a.usuarioId = @pUsuarioId

GO
IF OBJECT_ID('dbo.PFlashCard_GetAll') IS NOT NULL
BEGIN	
	IF OBJECT_ID('dbo.PFlashCard_GetAll') IS NOT NULL
		PRINT 'PROCEDURE PFlashCard_GetAll CRIADA'
	ELSE 
		PRINT 'FALHA NA CRIAÇÃO DA PROCEDURE PFlashCard_GetAll'		
END
GO