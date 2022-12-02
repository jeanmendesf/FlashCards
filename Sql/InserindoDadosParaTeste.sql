-----------------------
-- Inserindo Usuarios-- 
-----------------------
EXEC dbo.PUsuario_Insert @pUsuarioLogin   = 'luizferreira' 
					    ,@pSenha          = '321senha'  
					    ,@pNome           = 'Luiz' 
					    ,@pSobrenome	  = 'Ferreira'  
					    ,@pDataNascimento = '1996-01-20' 
					    ,@pDataCadastro   =  NULL

EXEC dbo.PUsuario_Insert @pUsuarioLogin   = 'robertogomes' 
					    ,@pSenha          = '987654'  
					    ,@pNome           = 'Roberto' 
					    ,@pSobrenome	  = 'Gomes'  
					    ,@pDataNascimento = '1985-12-11' 
					    ,@pDataCadastro   =  NULL



----------------------
-- Inserindo Cart�es--
----------------------
EXEC dbo.PFlashCard_Insert @pNome      = 'Cart�o Alfabeto'
		                  ,@pUsuarioId = 1
		                  ,@pPergunta  ='Qual a primeira letra do alfabeto?'
		                  ,@pResposta  ='A letra A'

EXEC dbo.PFlashCard_Insert @pNome      = 'Numeros'
		                  ,@pUsuarioId = 1
		                  ,@pPergunta  ='Quanto � 2+2?'
		                  ,@pResposta  ='� 4'

EXEC dbo.PFlashCard_Insert @pNome      = 'Programa��o'
		                  ,@pUsuarioId = 2
		                  ,@pPergunta  ='Java � o que?'
		                  ,@pResposta  ='Uma linguagem de programa��o'

EXEC dbo.PFlashCard_Insert @pNome      = 'Tempo'
		                  ,@pUsuarioId = 2
		                  ,@pPergunta  ='Uma hora tem quantos minutos?'
		                  ,@pResposta  ='60'

SELECT * FROM Usuario
SELECT * FROM FlashCard