using Sinema.DAL;
using Sinema.WebUI.Models;
using System;
using System.Web.Mvc;

namespace Sinema.WebUI.Controllers
{

    public class BiletController : BaseController
    {


        public ActionResult Index()
        {
            var data = service.BiletService.GetAll();
            return View(data);
        }

        public ActionResult BiletEkle()
        {
            return View();
        }

        [HttpPost]
        public ActionResult BiletEkle(BiletVM bilet)
        {
            if (ModelState.IsValid)
            {
                service.BiletService.Insert(new Bilet
                {
                    FilmID = bilet.FilmID,
                    SalonID = bilet.SalonID,
                    SeansID = bilet.SeansID,
                    CalisanID = bilet.CalisanID,
                    MusteriID = bilet.MusteriID,
                    Tarih = bilet.Tarih,
                    KoltukNo = bilet.KoltukNo,
                    Fiyat = (Decimal)bilet.Fiyat

                });
                return Redirect("/Bilet/Index");
            }
            TempData["Error"] = "*Tüm alanlar dolu olmalıdır";
            return View();
        }

        
        public ActionResult Sil(int? id)
        {
            if (id != null)
            {
                var bilett = service.FilmService.Find(id.Value);
                if (bilett != null)
                {
                    service.SeansService.Delete(bilett.ID);
                    TempData["Error"] = "Silme İşlemi Başarılı";
                    return Redirect("/Bilet/Index");
                }
            }
            TempData["Error"] = "Kayıt Bulunamadı";
            return Redirect("/Bilet/Index");
        }

        public ActionResult Guncelle(int? id)
        {
            if (id != null)
            {
                var bilet = service.BiletService.Find(id.Value);
                if (bilet != null)
                {
                    return View(bilet);
                }
            }
            TempData["Error"] = "Kayıt Bulunamadı";
            return Redirect("/Seans/Index");
        }

        [HttpPost]
        public ActionResult Guncelle(Bilet bilet)
        {
            if (service.BiletService.Update(bilet))
            {
                TempData["Error"] = "Güncelleme İşleme Başarılı";
                return Redirect("/Bilet/Index");
            }
            TempData["Error"] = "Kayıt Bulunamadı";
            return Redirect("/Bilet/Index");
        }


    }
}