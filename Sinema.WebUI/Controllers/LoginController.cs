using Sinema.WebUI.Attribute;
using Sinema.WebUI.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;


namespace Sinema.WebUI.Controllers
{
    public class LoginController : BaseController
    {
        // GET: Login
        public ActionResult Index()
        {
            if (Session["SessionContext"] == null)
            {
                return View();
            }
            return Redirect("/Home");
        }
        [HttpPost]
        public ActionResult LoginControl(LoginVM credentials)
        {
            if (ModelState.IsValid)
            {
                var user = service.CalisanService.FindUserName(credentials.KullaniciAdi);
                if (user != null && user.Parola == credentials.Parola)
                {
                    var _sessionContext = new SessionContext
                    {
                        ID = user.ID,
                        KullaniciAdi = user.KullaniciAdi,

                    };
                    Session["SessionContext"] = _sessionContext;
                    return Redirect("/Home/Index");
                }
                return Redirect("/Login");

            }

            return Redirect("/Login");
        }

    }
}