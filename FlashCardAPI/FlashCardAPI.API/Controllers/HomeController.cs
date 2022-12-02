using Microsoft.AspNetCore.Mvc;

namespace FlashCardAPI.API.Controllers
{
    public class HomeController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
