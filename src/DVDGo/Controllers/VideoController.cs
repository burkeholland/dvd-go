using Microsoft.AspNetCore.Mvc;
using DVDGo.Data;
using Kendo.Mvc.Extensions;
using Kendo.Mvc.UI;

namespace DVDGo.Controllers
{
    public class VideoController : Controller
    {
        private readonly DVDGoContext _context;

        public VideoController(DVDGoContext context) {
            _context = context;
        }

        public IActionResult List([DataSourceRequest] DataSourceRequest request) {
            return Json(_context.Videos.ToDataSourceResult(request));
        }

        [HttpPost]
        public ActionResult Update([DataSourceRequest] DataSourceRequest request, Models.Video product) {
            if (product != null && ModelState.IsValid) {
                _context.Videos.Update(product);
                _context.SaveChanges();
            }
            return Json(new[] { product }.ToDataSourceResult(request, ModelState));
        }

        [HttpPost]
        public ActionResult Destroy([DataSourceRequest] DataSourceRequest request, Models.Video video) {
            _context.Remove(video);
            _context.SaveChanges();

            return Json(new[] { video }.ToDataSourceResult(request, ModelState));
        }

        [HttpPost]
        public ActionResult Create([DataSourceRequest] DataSourceRequest request, Models.Video video) {
            if (video != null && ModelState.IsValid) {
                _context.Add(video);
                _context.SaveChanges();
            }

            return Json(new[] { video }.ToDataSourceResult(request, ModelState));
        }


    }
}
