using Sinema.DAL;
using Sinema.WebUI.Models;
using System.Web.Mvc;

namespace Sinema.WebUI.Controllers
{

    public class SeansController : BaseController
    {
        // GET: Sean
        public ActionResult Index()
        {
            var seans = service.SeansService.GetAll();
            return View(seans);
        }
        public ActionResult SeansEkle()
        {
            return View();
        }

        [HttpPost]
        public ActionResult SeansEkle(SeansVM seans)
        {
            if (ModelState.IsValid)
            {
                service.SeansService.Insert(new Seans
                {
                    Saat = seans.Saat.Value,
                });
                TempData["Error"] = "Seans Ekleme Başarılı";
                return Redirect("/Seans/Index");
            }
            TempData["Error"] = "*Tüm alanlar dolu olmalıdır";
            return View();
        }

        public ActionResult SeansGuncelle(int? id)
        {
            if (id != null)
            {
                var seans = service.SeansService.Find(id.Value);
                if (seans != null)
                {
                    return View(seans);
                }
            }
            TempData["Error"] = "Kayıt Bulunamadı";
            return Redirect("/Seans/Index");
        }

        [HttpPost]
        public ActionResult SeansGuncelle(Seans seans)
        {
            if (service.SeansService.Update(seans))
            {
                TempData["Error"] = "Güncelleme İşleme Başarılı";
                return Redirect("/Seans/Index");
            }
            TempData["Error"] = "Kayıt Bulunamadı";
            return Redirect("/Seans/Index");
        }

        public ActionResult Sil(int? id)
        {
            if (id != null)
            {
                var seans = service.SeansService.Find(id.Value);
                if (seans != null)
                {
                    service.SeansService.Delete(seans.ID);
                    TempData["Error"] = "Silme İşlemi Başarılı";
                    return Redirect("/Seans/Index");
                }
            }
            TempData["Error"] = "Kayıt Bulunamadı";
            return Redirect("/Seans/Index");
        }
    }
}