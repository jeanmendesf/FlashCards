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
AS
  
SELECT a.id
	  ,a.usuarioLogin
	  ,a.senha
	  ,a.nome
	  ,a.sobrenome
	  ,a.datanascimento
	  ,a.dataCadastro
FROM Usuario	A  
WHERE a.id = @pId      

GO
IF OBJECT_ID('dbo.PFlashCard_GetById') IS NOT NULL
BEGIN	
	IF OBJECT_ID('dbo.PFlashCard_GetById') IS NOT NULL
		PRINT 'PROCEDURE PFlashCard_GetById CRIADA'
	ELSE 
		PRINT 'FALHA NA CRIAÇÃO DA PROCEDURE PFlashCard_GetById'		
END
GO