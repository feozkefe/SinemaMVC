using Sinema.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Sinema.BLL.Repository.Entity
{
    public class SeansRepository : Base.BaseRepository<Seans>
    {
        public bool Update(Seans sean)
        {
            var seans = table.FirstOrDefault(x => x.ID == sean.ID);
            if (seans != null)
            {
                seans.Saat = sean.Saat.Value;
                Save();
                return true;
            }
            return false;
        }
    }
}
