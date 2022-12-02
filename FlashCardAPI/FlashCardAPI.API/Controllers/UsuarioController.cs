using FlashCardAPI.DAL.Repository;
using FlashCardAPI.Model.Models;
using Microsoft.AspNetCore.Mvc;

namespace FlashCardAPI.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UsuarioController : Controller
    {
        readonly UsuarioRepository _repository;

        public UsuarioController()
        {
            _repository = new UsuarioRepository();
        }

        [HttpGet]
        [Route("{Id:int}")]
        public ActionResult ObterPorIdUsuario(int Id)
        {
            var usuario = _repository.ObterPorIdUsuario(Id);
            return Ok(usuario);
        }

        [HttpPost]
        [Route("Adicionar")]
        public ActionResult AdicionarUsuario(Usuario usuario)
        {
            _repository.AdicionarUsuario(usuario);
            return Ok();
        }

        [HttpPut]  
        [Route("Atualizar")]
        public ActionResult AtualizarUsuario(Usuario usuario)
        {
            _repository.AtualizarUsuario(usuario);
            return Ok();
        }

        [HttpDelete]
        [Route("Deletar")]
        public ActionResult DeletarUsuario(Usuario usuario)
        {
            _repository.DeletarUsuario(usuario);
            return Ok();
        }
    }
}
