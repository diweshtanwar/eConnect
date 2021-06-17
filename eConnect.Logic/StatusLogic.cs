using System;
using System.Collections.Generic;
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
                var dsds = unitOfWork.Statuss.GetAllStatus().ToList();
                return dsds;
            }
        }
    }
}
