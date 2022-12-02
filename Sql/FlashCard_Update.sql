IF OBJECT_ID('dbo.PFlashCard_Update') IS NOT NULL
BEGIN
	DROP PROCEDURE dbo.PFlashCard_Update
	IF OBJECT_ID('dbo.PFlashCard_Update') IS NOT NULL
		PRINT 'ERRO AO APAGAR A PROCEDURE PFlashCard_Update'
	ELSE 
		PRINT 'PROCEDURE PFlashCard_Update APAGADA'		
END
GO
CREATE PROCEDURE dbo.PFlashCard_Update 
  @pId				INT
 ,@pNome         VARCHAR(255)
 ,@pUsuarioId    INT
 ,@pPergunta     VARCHAR(255)
 ,@pResposta     VARCHAR(255)
AS
  UPDATE FlashCard
  SET nome     = @pNome    
  	 ,pergunta = @pPergunta
	 ,resposta = @pResposta
  WHERE id        = @pId
    AND usuarioId = @pUsuarioId

GO
IF OBJECT_ID('dbo.PFlashCard_Update') IS NOT NULL
BEGIN	
	IF OBJECT_ID('dbo.PFlashCard_Update') IS NOT NULL
		PRINT 'PROCEDURE PFlashCard_Update CRIADA'
	ELSE 
		PRINT 'FALHA NA CRIAÇÃO DA PROCEDURE PFlashCard_Update'		
END
GO