IF OBJECT_ID('dbo.PFlashCard_Delete') IS NOT NULL
BEGIN
	DROP PROCEDURE dbo.PFlashCard_Delete
	IF OBJECT_ID('dbo.PFlashCard_Delete') IS NOT NULL
		PRINT 'ERRO AO APAGAR A PROCEDURE PFlashCard_Delete'
	ELSE 
		PRINT 'PROCEDURE PFlashCard_Delete APAGADA'		
END
GO
CREATE PROCEDURE dbo.PFlashCard_Delete 
  @pId		   INT
 ,@pUsuarioId  INT    
AS
  DELETE FROM FlashCard
  WHERE id = @pId
    AND usuarioId =@pUsuarioId

GO
IF OBJECT_ID('dbo.PFlashCard_Delete') IS NOT NULL
BEGIN	
	IF OBJECT_ID('dbo.PFlashCard_Delete') IS NOT NULL
		PRINT 'PROCEDURE PFlashCard_Delete CRIADA'
	ELSE 
		PRINT 'FALHA NA CRIAÇÃO DA PROCEDURE PFlashCard_Delete'		
END
GO