using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using DVDGo.Data;
using Kendo.Mvc.UI;
using Kendo.Mvc.Extensions;

// For more information on enaling MVC for empty projects, visit http://go.microsoft.com/fwlink/?LinkID=397860

namespace DVDGo.Controllers
{
    public class GenreController : Controller
    {
        private readonly DVDGoContext _context;

        public GenreController(DVDGoContext context) {
            _context = context;
        }

        // GET: /<controller>/
        public IActionResult List([DataSourceRequest] DataSourceRequest request) {
            return Json(_context.Genres.ToDataSourceResult(request));
        }
    }
}
