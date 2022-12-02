IF OBJECT_ID('dbo.PUsuario_Update') IS NOT NULL
BEGIN
	DROP PROCEDURE dbo.PUsuario_Update
	IF OBJECT_ID('dbo.PUsuario_Update') IS NOT NULL
		PRINT 'ERRO AO APAGAR A PROCEDURE PUsuario_Update'
	ELSE 
		PRINT 'PROCEDURE PUsuario_Update APAGADA'		
END
GO
CREATE PROCEDURE dbo.PUsuario_Update 
  @pId				INT
 ,@pUsuarioLogin    VARCHAR(255)
 ,@pSenha           VARCHAR(255)
 ,@pNome            VARCHAR(255)
 ,@pSobrenome	    VARCHAR(255)
 ,@pDataNascimento  DATETIME
AS
  UPDATE Usuario
  SET usuarioLogin   = @pUsuarioLogin
     ,senha          = @pSenha
	 ,nome			 = @pNome           
	 ,sobrenome		 = @pSobrenome	   
	 ,datanascimento = @pDataNascimento
  WHERE id = @pId

GO
IF OBJECT_ID('dbo.PUsuario_Update') IS NOT NULL
BEGIN	
	IF OBJECT_ID('dbo.PUsuario_Update') IS NOT NULL
		PRINT 'PROCEDURE PUsuario_Update CRIADA'
	ELSE 
		PRINT 'FALHA NA CRIAÇÃO DA PROCEDURE PUsuario_Update'		
END
GO