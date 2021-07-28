using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eConnect.DataAccess
{
    public class BranchCodeRepository : Repository<tblBranchCode>, IBranchCodeRepository
    {

        public BranchCodeRepository(eConnectAppEntities appcontext) : base(appcontext)
        {

        }

        public eConnectAppEntities ApplicationEntities
        {
            get { return Context as eConnectAppEntities; }
        }
        public IList<tblBranchCode> GetAllBranchCode()
        {
            return ApplicationEntities.tblBranchCodes.ToList();
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
