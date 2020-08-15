using Sinema.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Sinema.BLL.Repository.Entity
{
   public class BiletRepository:Base.BaseRepository<Bilet>
    {
            public bool Update(Bilet bile)
            {
                var bilet = table.FirstOrDefault(x => x.ID == bile.ID);
                if (bilet != null)
                {
                bilet.FilmID = bile.FilmID;
                bilet.CalisanID = bile.CalisanID;
                bilet.SeansID = bile.SeansID;
                bilet.SalonID = bile.SalonID;
                bilet.MusteriID = bile.MusteriID;
                bilet.KoltukNo = bile.KoltukNo;
                bilet.Tarih = bile.Tarih;
                bilet.Fiyat = bile.Fiyat;
                Save();
                return true;
                }
                return false;
            }
        }
    
}
