using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FlashCardAPI.Model.Models
{
    public class FlashCard
    {
        public int id { get; set; }
        public int usuarioId { get; set; }
        public string nome { get; set; }
        public string pergunta { get; set; }
        public string resposta { get; set; }
    }
}
