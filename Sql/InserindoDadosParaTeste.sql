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
-- Inserindo Cartões--
----------------------
EXEC dbo.PFlashCard_Insert @pNome      = 'Cartão Alfabeto'
		                  ,@pUsuarioId = 1
		                  ,@pPergunta  ='Qual a primeira letra do alfabeto?'
		                  ,@pResposta  ='A letra A'

EXEC dbo.PFlashCard_Insert @pNome      = 'Numeros'
		                  ,@pUsuarioId = 1
		                  ,@pPergunta  ='Quanto é 2+2?'
		                  ,@pResposta  ='É 4'

EXEC dbo.PFlashCard_Insert @pNome      = 'Programação'
		                  ,@pUsuarioId = 2
		                  ,@pPergunta  ='Java é o que?'
		                  ,@pResposta  ='Uma linguagem de programação'

EXEC dbo.PFlashCard_Insert @pNome      = 'Tempo'
		                  ,@pUsuarioId = 2
		                  ,@pPergunta  ='Uma hora tem quantos minutos?'
		                  ,@pResposta  ='60'

SELECT * FROM Usuario
SELECT * FROM FlashCard