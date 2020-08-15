using Sinema.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Sinema.BLL.Repository.Entity
{
    public class FilmRepository : Base.BaseRepository<Film>
    {
        public bool Update(Film flm)
        {

            var film = table.FirstOrDefault(x => x.ID == flm.ID);
            if (film != null)
            {
                film.Adi = flm.Adi;
                film.UcBoyutluMu = flm.UcBoyutluMu;
                film.Sure = flm.Sure;
                film.YerliMi = flm.YerliMi;
                film.TurID = flm.TurID;
                Save();
                return true;
            }
            return false;
        }

       
    }
}
