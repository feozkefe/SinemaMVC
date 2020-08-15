using Sinema.WebUI.Attribute;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Sinema.WebUI.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        [Auth]
        public ActionResult Index()
        {
            return View();
        }
    }
}