using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Sinema.WebUI.Models
{
    public class BiletVM
    {
        public int FilmID { get; set; }
        public int SalonID { get; set; }
        public int SeansID { get; set; }
        public int CalisanID { get; set; }
        public int MusteriID { get; set; }
        public DateTime Tarih { get; set; }
        public string KoltukNo { get; set; }
        public double Fiyat { get; set; }
   
    }
}