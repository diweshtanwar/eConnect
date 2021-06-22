using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eConnect.DataAccess
{
    public class StateRepository : Repository<tblState>, IStateRepository
    {
        public StateRepository(eConnectAppEntities appcontext) : base(appcontext)
        {

        }

        public eConnectAppEntities eConnectAppEntities
        {
            get { return Context as eConnectAppEntities; }
        }
        public IList<tblState> GetAllState()
        {
            return eConnectAppEntities.tblStates.ToList();
        }
        public IEnumerable<tblState> GetAllStatesByCountryID(long countryid)
        {
            var data = eConnectAppEntities.tblStates.Where(c => c.CountryId == countryid);
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
