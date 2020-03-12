using System.Net;
using Microsoft.AspNetCore.Mvc;
using SwapiBrowser.Domain;

namespace SwapiBrowser.Controllers
{
    [Route("people")]
    public class PeopleController : Controller
    {
        private PeopleRepository peopleRepository;

        public PeopleController()
        {
            peopleRepository = new PeopleRepository();
        }

        [HttpGet]
        public IActionResult Index(int page = 1)
        {
            ViewBag.Page = page;
            ViewBag.TotalRows = peopleRepository.GetTotal();
            return View(peopleRepository.Load(page));
        }

        [HttpGet("by-homeworld/tree")]
        public IActionResult ByHomeworldTree()
        {
            return View(peopleRepository.LoadByHomeworldTree());
        }

        [HttpGet("by-homeworld/{homeworld?}")]
        public IActionResult ByHomeworld(int? homeworld = null, int page = 1)
        {
            ViewBag.Page = page;
            ViewBag.TotalRows = peopleRepository.GetTotalByHomeworld(homeworld);
            return View(peopleRepository.LoadByHomeworld(homeworld, page));
        }

        [HttpGet("by-gender-and-birthyear/tree")]
        public IActionResult ByGenderAndBirthYearTree()
        {
            return View(peopleRepository.LoadByGenderAndBirthYearTree());
        }

        [HttpGet("by-gender-and-birthyear/{gender?}")]
        public IActionResult ByGenderAndBirthYear(string gender = null, int page = 1)
        {
            ViewBag.Page = page;
            ViewBag.TotalRows = peopleRepository.GetTotalByGenderAndBirthYear(gender);
            return View(peopleRepository.LoadByGenderAndBirthYear(WebUtility.UrlDecode(gender), page));
        }

        [HttpGet("by-gender-and-birthyear-covering/tree")]
        public IActionResult ByGenderAndBirthYearCoveringTree()
        {
            return View(peopleRepository.LoadByGenderAndBirthYearCoveringTree());
        }

        [HttpGet("by-gender-and-birthyear-covering/{gender?}")]
        public IActionResult ByGenderAndBirthYearCovering(string gender = null, int page = 1)
        {
            ViewBag.Page = page;
            ViewBag.TotalRows = peopleRepository.GetTotalByGenderAndBirthYearCovering(gender);
            return View(peopleRepository.LoadByGenderAndBirthYearCovering(gender, page));
        }

        [HttpGet("{id}")]
        public IActionResult Get(int id)
        {
            return View(peopleRepository.Get(id));
        }
    }
}
