using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;

namespace SwapiBrowser.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }

        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Exercise1() => View();
        public IActionResult Exercise1Recap() => View();
        public IActionResult Exercise2() => View();
        public IActionResult Exercise2Recap() => View();
        public IActionResult Exercise3() => View();
        public IActionResult Exercise3Recap() => View();
        public IActionResult Exercise4() => View();
        public IActionResult Conclusion() => View();
    }
}
