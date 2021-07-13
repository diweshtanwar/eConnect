using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using eConnect.DataAccess;

namespace eConnect.Logic
{
    public class StatusLogic
    {

        public IList<tblStatu> GetAllStatus()
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                var data = unitOfWork.Statuss.GetAllStatus().ToList();
                return data;
            }
        }

        public List<tblStatu> GetStatus()
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                var data = unitOfWork.Statuss.GetStatus();
                 return data;
            }
        }


        public IList<tblUserStatu> GetAllUserStatus()
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                var data = unitOfWork.Statuss.GetAllUserStatus().ToList();
                return data;
            }
        }

        public List<tblUserStatu> GetUserStatus()
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                var data = unitOfWork.Statuss.GetUserStatus();
                return data;
            }
        }
    }
}
