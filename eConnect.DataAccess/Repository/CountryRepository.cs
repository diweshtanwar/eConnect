using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eConnect.DataAccess
{
    public class CountryRepository : Repository<tblCountry>, ICountryRepository
    {

        public CountryRepository(eConnectAppEntities appcontext) : base(appcontext)
        {

        }

        public eConnectAppEntities ApplicationEntities
        {
            get { return Context as eConnectAppEntities; }
        }
        public IList<tblCountry> GetAllCountry()
        {
            return ApplicationEntities.tblCountries.ToList();
        }
        private bool disposed = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposed)
            {
                if (disposing)
                {
                    ApplicationEntities.Dispose();
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
