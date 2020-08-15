using Sinema.DAL;
using System.Web.Mvc;
using Sinema.WebUI.Models;
using Sinema.WebUI.Attribute;

namespace Sinema.WebUI.Controllers
{

    public class FilmController : BaseController
    {
        // GET: Film
        [Auth]
        public ActionResult Index()
        {
            var data = service.FilmService.GetAll();
            return View(data);

        }

        public ActionResult FilmEkle()
        {
            return View();
        }

        [HttpPost]
        public ActionResult FilmEkle(FilmVM film)
        {
            if (ModelState.IsValid)
            {
                service.FilmService.Insert(new Film
                {
                    Adi = film.Adi,
                    UcBoyutluMu = film.UcBoyutluMu,
                    Sure = film.Sure,
                    YerliMi = film.YerliMi,
                    TurID = film.TurID
                });
                return Redirect("/Film/Index");
            }
            TempData["Error"] = "*Tüm alanlar dolu olmalıdır";
            return View();
        }

        public ActionResult Guncelle(int? id)
        {
            if (id != null)
            {
                var film = service.FilmService.Find(id.Value);
                if (film != null)
                {
                    return View(film);
                }
            }
            TempData["Error"] = "Kayıt Bulunamadı";
            return Redirect("/Film/Index");
        }


        [HttpPost]
        public ActionResult Guncelle(Film film)
        {

            if (service.FilmService.Update(film))
            {
                TempData["Error"] = "Güncelleme İşleme Başarılı";
                return Redirect("/Film/Index");
            }
            TempData["Error"] = "Kayıt Bulunamadı";
            return Redirect("/Film/Index");
        }


        public ActionResult Sil(int? id)
        {
            if (id != null)
            {
                var film = service.FilmService.Find(id.Value);
                if (film != null)
                {
                    service.SeansService.Delete(film.ID);
                    TempData["Error"] = "Silme İşlemi Başarılı";
                    return Redirect("/Film/Index");
                }
            }
            TempData["Error"] = "Kayıt Bulunamadı";
            return Redirect("/Film/Index");
        }
    }

}