using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eConnect.DataAccess
{
    class CityRepository : Repository<tblCity>, ICityRepository
    {
        public CityRepository(eConnectAppEntities appcontext) : base(appcontext)
        {

        }

        public eConnectAppEntities eConnectAppEntities
        {
            get { return Context as eConnectAppEntities; }
        }
        public IList<tblCity> GetAllCity()
        {
            return eConnectAppEntities.tblCities.ToList();
        }
        public IEnumerable<tblCity> GetAllCitiesByStateID(long stateid)
        {
            var data = eConnectAppEntities.tblCities.Where(c => c.StateId == stateid);
            return data;
        }


        private bool disposed = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposed)
            {
                if (disposing)
                {
                    eConnectAppEntities.Dispose();
                }
            }
            this.disposed = true;
        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }
    }
}