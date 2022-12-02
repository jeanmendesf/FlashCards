IF OBJECT_ID('dbo.PFlashCard_Insert') IS NOT NULL
BEGIN
	DROP PROCEDURE dbo.PFlashCard_Insert
	IF OBJECT_ID('dbo.PFlashCard_Insert') IS NOT NULL
		PRINT 'ERRO AO APAGAR A PROCEDURE PFlashCard_Insert'
	ELSE 
		PRINT 'PROCEDURE PFlashCard_Insert APAGADA'		
END
GO
CREATE PROCEDURE dbo.PFlashCard_Insert 
  @pNome         VARCHAR(255)
 ,@pUsuarioId    INT
 ,@pPergunta     VARCHAR(255)
 ,@pResposta     VARCHAR(255)
AS
  INSERT FlashCard (nome
				   ,usuarioId   
				   ,pergunta 
				   ,resposta)
  VALUES (@pNome
		 ,@pUsuarioId  
		 ,@pPergunta 
		 ,@pResposta)  
GO
IF OBJECT_ID('dbo.PFlashCard_Insert') IS NOT NULL
BEGIN	
	IF OBJECT_ID('dbo.PFlashCard_Insert') IS NOT NULL
		PRINT 'PROCEDURE PFlashCard_Insert CRIADA'
	ELSE 
		PRINT 'FALHA NA CRIAÇÃO DA PROCEDURE PFlashCard_Insert'		
END
GO