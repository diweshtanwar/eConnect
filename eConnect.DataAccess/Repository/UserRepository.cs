using System;
using System.Collections.Generic;
using System.Linq;
using System.Data.Entity;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;
using System.Runtime.Remoting.Contexts;

namespace eConnect.DataAccess
{
    public class UserRepository : Repository<tblUser>, IUserRepository
    {
        public UserRepository(eConnectAppEntities appcontext) : base(appcontext)
        {
        }
        public eConnectAppEntities eConnectAppEntities
        {
            get { return Context as eConnectAppEntities; }
        }
        public IEnumerable<tblUser> GetAllUsers()
        {
            return eConnectAppEntities.tblUsers.ToList();
        }
        public IEnumerable<tblUser> GetAllUsersByStateID(int id)
        {
            //var data = eConnectAppEntities.tblUsers.Where(c => c.StateID == id);
            return null;
        }
        public tblUser GetAllUsersByEmailiID(string email, string pswd)
        {
            var data = eConnectAppEntities.tblUsers.Where(c => c.UserName == email && c.Password == pswd).SingleOrDefault();
            return data;
        }
        public tblUser GetUsersByUserName(string userName)
        {
            var data = eConnectAppEntities.tblUsers.Where(c => c.UserName == userName).SingleOrDefault();
            return data;
        }

        public IEnumerable<tblUser> GetAllUsersByStatus(int statusid)
        {
            var userDetails = eConnectAppEntities.tblUsers.Where(c => c.Status == statusid);
            return userDetails;
        }

      

        public IEnumerable<tblUser> GetAllUsersDetailsByid(long id)
        {
            var userDetails = eConnectAppEntities.tblUsers.Where(c => c.UserId == id);
            return userDetails;
        }

        public void InsertUser(tblUser tblUser)
        {
            eConnectAppEntities.tblUsers.Add(tblUser);
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




  




    public class CSPDetail : Repository<tblUserCSPDetail>
    {
        public CSPDetail(eConnectAppEntities appcontext) : base(appcontext)
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

    public class UserDetail : Repository<tblUserDetail>
    {
        public UserDetail(eConnectAppEntities appcontext) : base(appcontext)
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








}
