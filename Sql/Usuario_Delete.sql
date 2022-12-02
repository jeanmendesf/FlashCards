IF OBJECT_ID('dbo.PUsuario_Delete') IS NOT NULL
BEGIN
	DROP PROCEDURE dbo.PUsuario_Delete
	IF OBJECT_ID('dbo.PUsuario_Delete') IS NOT NULL
		PRINT 'ERRO AO APAGAR A PROCEDURE PUsuario_Delete'
	ELSE 
		PRINT 'PROCEDURE PUsuario_Delete APAGADA'		
END
GO
CREATE PROCEDURE dbo.PUsuario_Delete 
  @pId				INT

AS
  DELETE FROM Usuario
  WHERE id = @pId

GO
IF OBJECT_ID('dbo.PUsuario_Delete') IS NOT NULL
BEGIN	
	IF OBJECT_ID('dbo.PUsuario_Delete') IS NOT NULL
		PRINT 'PROCEDURE PUsuario_Delete CRIADA'
	ELSE 
		PRINT 'FALHA NA CRIAÇÃO DA PROCEDURE PUsuario_Delete'		
END
GO