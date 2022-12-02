IF OBJECT_ID('dbo.PUsuario_Insert') IS NOT NULL
BEGIN
	DROP PROCEDURE dbo.PUsuario_Insert
	IF OBJECT_ID('dbo.PUsuario_Insert') IS NOT NULL
		PRINT 'ERRO AO APAGAR A PROCEDURE PUsuario_Insert'
	ELSE 
		PRINT 'PROCEDURE PUSUARIO_INSERT APAGADA'		
END
GO
CREATE PROCEDURE dbo.PUsuario_Insert 
  @pUsuarioLogin    VARCHAR(255)
 ,@pSenha           VARCHAR(255)
 ,@pNome            VARCHAR(255)
 ,@pSobrenome	    VARCHAR(255)
 ,@pDataNascimento  DATETIME
 ,@pDataCadastro    DATETIME     OUTPUT
AS
  SET @pDataCadastro = GETDATE()
  INSERT Usuario (usuarioLogin
				 ,senha
				 ,nome
				 ,sobrenome
				 ,datanascimento
				 ,datacadastro)
  VALUES (@pUsuarioLogin
  		 ,@pSenha       
		 ,@pNome           
		 ,@pSobrenome	   
		 ,@pDataNascimento 
		 ,@pDataCadastro)  
GO
IF OBJECT_ID('dbo.PUsuario_Insert') IS NOT NULL
BEGIN	
	IF OBJECT_ID('dbo.PUsuario_Insert') IS NOT NULL
		PRINT 'PROCEDURE PUsuario_Insert CRIADA'
	ELSE 
		PRINT 'FALHA NA CRIAÇÃO DA PROCEDURE PUsuario_Insert'		
END
GO