using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Sinema.WebUI.Models
{
    public class CalisanVM
    {
        public string Adi { get; set; }
        public string Soyadi { get; set; }
        public int TCKN { get; set; }
        public  DateTime DogumTarihi { get; set; }
    }
}