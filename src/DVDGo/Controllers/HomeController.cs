using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using DVDGo.Data;
using Microsoft.EntityFrameworkCore;

namespace DVDGo.Controllers
{

    public class HomeController : Controller
    {
        private readonly DVDGoContext _context;

        public HomeController(DVDGoContext context) {
            _context = context;
        }

        public IActionResult Index() {

            var genres = _context.Genres.ToList();

            ViewData["genres"] = genres;
            ViewData["defaultGenre"] = genres.First();

            var ratings = _context.Ratings.ToList();

            ViewData["ratings"] = ratings;
            ViewData["defaultRating"] = ratings.First();

            return View();
        }

        public IActionResult Error()
        {
            return View();
        }
    }
}
