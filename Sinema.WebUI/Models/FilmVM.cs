using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Sinema.WebUI.Models
{
    public class FilmVM
    {
        public string Adi { get; set; }
        public bool UcBoyutluMu { get; set; }
        public int Sure { get; set; }
        public bool YerliMi { get; set; }
        public int TurID { get; set; }
    }
}