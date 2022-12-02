-- Criação tabela de usuário
IF (OBJECT_ID('Usuario') IS NULL)
BEGIN
	CREATE TABLE Usuario ( id              INT	         IDENTITY(1,1)  NOT NULL
						  ,usuarioLogin    VARCHAR(255)					NOT NULL
						  ,senha		   VARCHAR(255)					NOT NULL           
	                      ,nome            VARCHAR(255)					NOT NULL
						  ,sobrenome       VARCHAR(255)					NOT NULL
						  ,datanascimento  DATETIME						NOT NULL
						  ,datacadastro    DATETIME						NOT NULL
						  ,CONSTRAINT  PKUsuario
							PRIMARY KEY (id)
						  ,CONSTRAINT AKUsuario
						   UNIQUE(usuarioLogin))
END
GO

IF (OBJECT_ID('FlashCard') IS NULL)
BEGIN
	CREATE TABLE FlashCard(id         INT	        IDENTITY(1,1)  NOT NULL
						  ,usuarioId  INT						   NOT NULL
	                      ,nome       VARCHAR(255)				   NOT NULL
						  ,pergunta   VARCHAR(255)				   NOT NULL
						  ,resposta   VARCHAR(255)				   NOT NULL
						  ,CONSTRAINT  PKFlashCard
						     PRIMARY KEY (id)
						  ,CONSTRAINT FKFlashCard_Usuario
							 FOREIGN KEY (usuarioId) 
							 REFERENCES Usuario
						  )
END
GO
