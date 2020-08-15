using Sinema.BLL.Repository.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Sinema.BLL.Repository.Service
{
    public class EntityService
    {


        public EntityService()
        {
            _biletService = new BiletRepository();
            _calisanService = new CalisanRepository();
            _filmService = new FilmRepository();
            _filmturService = new FilmTurRepository();
            _musteriService = new MusteriRepository();
            _salonService = new SalonRepository();
            _seansService = new SeansRepository();
        }

        private BiletRepository _biletService;
        private CalisanRepository _calisanService;
        private FilmRepository _filmService;
        private FilmTurRepository _filmturService;
        private MusteriRepository _musteriService;
        private SalonRepository _salonService;
        private SeansRepository _seansService;

        public BiletRepository BiletService
        {
            get { return _biletService; }
            set { _biletService = value; }
        }

        public CalisanRepository CalisanService
        {
            get { return _calisanService; }
            set { _calisanService = value; }
        }

        public FilmRepository FilmService
        {
            get { return _filmService; }
            set { _filmService = value; }
        }

        public FilmTurRepository FilmTurService
        {
            get { return _filmturService; }
            set { _filmturService = value; }
        }

        public MusteriRepository MusteriService
        {
            get { return _musteriService; }
            set { _musteriService = value; }
        }

        public SalonRepository SalonService
        {
            get { return _salonService; }
            set { _salonService = value; }
        }

        public SeansRepository SeansService
        {
            get { return _seansService; }
            set { _seansService = value; }
        }

    }
}
