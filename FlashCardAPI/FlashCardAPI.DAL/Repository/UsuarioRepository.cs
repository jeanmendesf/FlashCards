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
    public class UsuarioRepository : BaseRepository
    {

        public Usuario ObterPorIdUsuario(int id)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                Usuario usuario = null;

                string procedure = "dbo.pUsuario_GetById";

                var sqlParams = new DynamicParameters();

                sqlParams.Add("@pId", id, DbType.Int64, ParameterDirection.Input);

                usuario = connection.Query<Usuario>(procedure, sqlParams, commandType: CommandType.StoredProcedure).FirstOrDefault();
                return usuario;
            }

        }

        public void AdicionarUsuario(Usuario usuario)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string procedure = "dbo.PUsuario_Insert";

                var sqlParams = new DynamicParameters();
                
                sqlParams.Add("@pUsuarioLogin", usuario.UsuarioLogin, DbType.String, ParameterDirection.Input);
                sqlParams.Add("@pSenha", usuario.Senha, DbType.String, ParameterDirection.Input);
                sqlParams.Add("@pNome", usuario.Nome, DbType.String, ParameterDirection.Input);
                sqlParams.Add("@pSobrenome", usuario.Sobrenome, DbType.String, ParameterDirection.Input);
                sqlParams.Add("@pDataNascimento", usuario.DataNascimento, DbType.Date, ParameterDirection.Input);
                sqlParams.Add("@pDataCadastro", DBNull.Value, DbType.Date, ParameterDirection.Input);

                connection.Execute(procedure, sqlParams, commandType: CommandType.StoredProcedure);
            }
        }

        public void AtualizarUsuario(Usuario usuario)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string procedure = "dbo.PUsuario_Update";

                var sqlParams = new DynamicParameters();

                sqlParams.Add("@pId", usuario.Id, DbType.Int64, ParameterDirection.Input);
                sqlParams.Add("@pUsuarioLogin", usuario.UsuarioLogin, DbType.String, ParameterDirection.Input);
                sqlParams.Add("@pSenha", usuario.Senha, DbType.String, ParameterDirection.Input);
                sqlParams.Add("@pNome", usuario.Nome, DbType.String, ParameterDirection.Input);
                sqlParams.Add("@pSobrenome", usuario.Sobrenome, DbType.String, ParameterDirection.Input);
                sqlParams.Add("@pDataNascimento", usuario.DataNascimento, DbType.Date, ParameterDirection.Input);                

                connection.Execute(procedure, sqlParams, commandType: CommandType.StoredProcedure);
            }
        }

        public void DeletarUsuario(Usuario usuario)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string procedure = "dbo.PUsuario_Delete";

                var sqlParams = new DynamicParameters();

                sqlParams.Add("@pId", usuario.Id, DbType.Int64, ParameterDirection.Input);                

                connection.Execute(procedure, sqlParams, commandType: CommandType.StoredProcedure);
            }
        }
    }
}
