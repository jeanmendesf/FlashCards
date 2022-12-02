using Dapper;
using FlashCardAPI.Model.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FlashCardAPI.DAL.Repository
{
    public  class FlashCardRepository : BaseRepository
    {
        public void AdicionarFlashCard(FlashCard flashCard)
        {
            using(SqlConnection connection = new SqlConnection(connectionString))
            {
                string procedure = "dbo.PFlashCard_Insert";

                var sqlParams = new DynamicParameters();

                sqlParams.Add("@pNome", flashCard.nome, DbType.String, ParameterDirection.Input);
                sqlParams.Add("@pUsuarioId", flashCard.usuarioId, DbType.Int64, ParameterDirection.Input);
                sqlParams.Add("@pPergunta", flashCard.pergunta, DbType.String, ParameterDirection.Input);
                sqlParams.Add("@pResposta", flashCard.resposta, DbType.String, ParameterDirection.Input);

                connection.Execute(procedure, sqlParams, commandType: CommandType.StoredProcedure);
            }
        }

        public void AtualizarFlashCard(FlashCard flashCard)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string procedure = "dbo.PFlashCard_Update";

                var sqlParams = new DynamicParameters();

                sqlParams.Add("@pId", flashCard.id, DbType.Int64, ParameterDirection.Input);
                sqlParams.Add("@pNome", flashCard.nome, DbType.String, ParameterDirection.Input);
                sqlParams.Add("@pUsuarioId", flashCard.usuarioId, DbType.Int64, ParameterDirection.Input);
                sqlParams.Add("@pPergunta", flashCard.pergunta, DbType.String, ParameterDirection.Input);
                sqlParams.Add("@pResposta", flashCard.resposta, DbType.String, ParameterDirection.Input);

                connection.Execute(procedure, sqlParams, commandType: CommandType.StoredProcedure);
            }
        }

        public void DeletarFlashCard(int usuarioId, int flashCardId)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string procedure = "dbo.PFlashCard_Delete";

                var sqlParams = new DynamicParameters();

                sqlParams.Add("@pId", flashCardId, DbType.Int64, ParameterDirection.Input);                
                sqlParams.Add("@pUsuarioId", usuarioId, DbType.Int64, ParameterDirection.Input);                

                connection.Execute(procedure, sqlParams, commandType: CommandType.StoredProcedure);
            }
        }

        public List<FlashCard> ObterTodosFlashCard(int usuarioId)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                List<FlashCard> listaFlashCards = null;

                string procedure = "dbo.PFlashCard_GetAll";

                var sqlParams = new DynamicParameters();
                                
                sqlParams.Add("@pUsuarioId", usuarioId, DbType.Int64, ParameterDirection.Input);

                listaFlashCards = connection.Query<FlashCard>(procedure, sqlParams, commandType: CommandType.StoredProcedure).ToList();
                return listaFlashCards;
            }
        }

        public FlashCard ObterPorIdFlashCard(int usuarioId, int flashCardId)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                FlashCard FlashCards = null;

                string procedure = "dbo.PFlashCard_GetById";

                var sqlParams = new DynamicParameters();

                sqlParams.Add("@pId", flashCardId, DbType.Int64, ParameterDirection.Input);
                sqlParams.Add("@pUsuarioId", usuarioId, DbType.Int64, ParameterDirection.Input);

                FlashCards = connection.Query<FlashCard>(procedure, sqlParams, commandType: CommandType.StoredProcedure).FirstOrDefault();
                return FlashCards;
            }
        }
    }
}
