using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Sinema.DAL;
using System.Data.Entity;
using System.Linq.Expressions;

namespace Sinema.BLL.Repository.Base
{
   
        public class BaseRepository<T> where T : class
        {
            private SinemaEntities db;
            protected DbSet<T> table;
            public BaseRepository()
            {
                db = new SinemaEntities();
                table = db.Set<T>();
            }
            public int Save()
            {
                return db.SaveChanges();
            }
            public virtual void Insert(T Entity)
            {
                table.Add(Entity);
                Save();
            }
            public List<T> GetAll()
            {
                return table.ToList();
            }
            public T Find(long Id)
            {
                return table.Find(Id);
            }
            public void Delete(long Id)
            {
                T Entity = table.Find(Id);
                table.Remove(Entity);
                Save();
            }
        }
    }

