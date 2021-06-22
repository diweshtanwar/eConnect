using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eConnect.DataAccess
{
    class TechSupportProblemRepository : Repository<tblProblemType>, ITechSupportProblemRepository
    {
        public TechSupportProblemRepository(eConnectAppEntities appcontext) : base(appcontext)
        {

        }

        public eConnectAppEntities ApplicationEntities
        {
            get { return Context as eConnectAppEntities; }
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

    public class TechSupportRequestRepository : Repository<tblTechRequest>, ITechSupportRequestRepository
    {
        public TechSupportRequestRepository(eConnectAppEntities appcontext) : base(appcontext)
        {

        }

        public eConnectAppEntities ApplicationEntities
        {
            get { return Context as eConnectAppEntities; }
        }

       public tblTechRequest GetTechRequestByTReqId(long id)
        {
            var ReqDetails = ApplicationEntities.tblTechRequests.Where(c => c.TechRequestId == id).FirstOrDefault();

            return ReqDetails;
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
