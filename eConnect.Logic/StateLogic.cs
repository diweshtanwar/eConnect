using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using eConnect.DataAccess;

namespace eConnect.Logic
{
    public class StateLogic
    {
        public IList<tblState> GetAllStates()
        {
            //  IList<Country> country = null;
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                var dsds = unitOfWork.Statess.GetAllState().ToList();
                return dsds;
            }
        }
        public IEnumerable<tblState> GetAllStatesByCid(long id)
        {
            //  IList<Country> country = null;
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                var dsds = unitOfWork.Statess.GetAllStatesByCountryID(id).ToList();
                return dsds;
            }
        }
    }
}
