using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eConnect.DataAccess
{
        public class UserLoginLogRepository : Repository<tblUserLoginLog>, IUserLoginLogRepository
    {
        public UserLoginLogRepository(eConnectAppEntities appcontext) : base(appcontext)
        {
        }
        public eConnectAppEntities ApplicationEntities
        {
            get { return Context as eConnectAppEntities; }
        }
        public IEnumerable<tblUserLoginLog> GetAllUserLoginDetails()
        {
            return ApplicationEntities.tblUserLoginLogs.ToList();
        }
        public IEnumerable<tblUserLoginLog> GetAllUserLoginDetailsByUserID(long id)
        {
            var data = ApplicationEntities.tblUserLoginLogs.Where(c => c.UserId == id);
            return data;
        }

        public tblUserLoginLog GetLastLoginDetailsByUserID(long userId)
        {
            var data = ApplicationEntities.tblUserLoginLogs.Where(c => c.UserId == userId).OrderByDescending(d=>d.LoginTimeStamp).FirstOrDefault();
            return data;
        }

        public void InsertUserLoginLog(tblUserLoginLog tblUserLoginLog)
        {
            ApplicationEntities.tblUserLoginLogs.Add(tblUserLoginLog);
           
        }

        public void Save()
        {
            ApplicationEntities.SaveChanges();
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
