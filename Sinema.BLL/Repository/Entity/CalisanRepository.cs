using Sinema.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Sinema.BLL.Repository.Entity
{
    public class CalisanRepository : Base.BaseRepository<Calisan>
    {
        public Calisan FindUserName(string kadi)
        {
            return table.FirstOrDefault(x => x.KullaniciAdi == kadi);
        }
        public bool Update(Calisan calisan)
        {
            var calisann = table.FirstOrDefault(x => x.ID == calisan.ID);
            if (calisann != null)
            {
                calisann.Adi = calisan.Adi;
                calisann.Soyadi = calisan.Soyadi;
                calisann.TCKN = calisan.TCKN;
                calisann.KullaniciAdi = calisan.KullaniciAdi;
                calisann.Parola = calisan.Parola;
                Save();
                return true;
            }
            return false;
        }
    }

}
