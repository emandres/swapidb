using Microsoft.AspNetCore.Mvc;
using SwapiBrowser.Domain;

namespace SwapiBrowser.Controllers
{
    [Route("planets")]
    public class PlanetsController: Controller
    {
        private PlanetsRepository planetsRepository;

        public PlanetsController()
        {
            planetsRepository = new PlanetsRepository();
        }

        [HttpGet]
        public IActionResult Index(int page = 1)
        {
            ViewBag.Page = page;
            ViewBag.TotalRows = planetsRepository.GetTotal();
            return View(planetsRepository.Load(page));
        }

        [HttpGet("{id}")]
        public IActionResult Get(int id)
        {
            return View(planetsRepository.Get(id));
        }
    }
}
