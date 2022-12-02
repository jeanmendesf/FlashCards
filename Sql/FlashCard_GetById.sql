IF OBJECT_ID('dbo.PFlashCard_GetById') IS NOT NULL
BEGIN
	DROP PROCEDURE dbo.PFlashCard_GetById
	IF OBJECT_ID('dbo.PFlashCard_GetById') IS NOT NULL
		PRINT 'ERRO AO APAGAR A PROCEDURE PFlashCard_GetById'
	ELSE 
		PRINT 'PROCEDURE PFlashCard_GetById APAGADA'		
END
GO
CREATE PROCEDURE dbo.PFlashCard_GetById
  @pId		   INT	
 ,@pUsuarioId  INT   
AS
  
SELECT a.id
	  ,a.usuarioId
	  ,a.nome
	  ,a.pergunta
	  ,a.resposta
FROM FlashCard	A
  INNER JOIN Usuario B ON A.UsuarioId = B.id
WHERE a.id = @pId  
  AND a.usuarioId = @pUsuarioId

GO
IF OBJECT_ID('dbo.PFlashCard_GetById') IS NOT NULL
BEGIN	
	IF OBJECT_ID('dbo.PFlashCard_GetById') IS NOT NULL
		PRINT 'PROCEDURE PFlashCard_GetById CRIADA'
	ELSE 
		PRINT 'FALHA NA CRIAÇÃO DA PROCEDURE PFlashCard_GetById'		
END
GO