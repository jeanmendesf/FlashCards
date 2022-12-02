using FlashCardAPI.DAL.Repository;
using FlashCardAPI.Model.Models;
using Microsoft.AspNetCore.Mvc;

namespace FlashCardAPI.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class FlashCardController : Controller
    {
        readonly FlashCardRepository _repository;

        public FlashCardController()
        {
            _repository = new FlashCardRepository();
        }

        [HttpPost]
        [Route("Adicionar")]
        public ActionResult AdicionarFlashCard(FlashCard flashCard)
        {
            _repository.AdicionarFlashCard(flashCard);
            return Ok();
        }

        [HttpPut]
        [Route("Atualizar")]
        public ActionResult AtualizarFlashCard(FlashCard flashCard)
        {
            _repository.AtualizarFlashCard(flashCard);
            return Ok();
        }

        [HttpDelete]
        [Route("Deletar/{usuarioId:int}/{flashCardId:int}")]
        public ActionResult DeletarFlashCard(int usuarioId,int flashCardId)
        {
            _repository.DeletarFlashCard(usuarioId, flashCardId);
            return Ok();
        }

        [HttpGet]
        [Route("{usuarioId:int}")]
        public ActionResult ObterTodosFlashCard(int usuarioId)
        {
            var listaFlashCards = _repository.ObterTodosFlashCard(usuarioId);
            return Ok(listaFlashCards);
        }

        [HttpGet]
        [Route("{usuarioId:int}/{flashCardId:int}")]
        public ActionResult ObterPorIdFlashCard(int usuarioId, int flashCardId)
        {
            var FlashCard = _repository.ObterPorIdFlashCard(usuarioId, flashCardId);
            return Ok(FlashCard);
        }
    }
}
