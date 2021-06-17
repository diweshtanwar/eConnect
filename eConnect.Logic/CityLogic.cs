using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using eConnect.DataAccess;

namespace eConnect.Logic
{
    public class CityLogic
    {
        public IList<tblCity> GetAllCities()
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                var dsds = unitOfWork.Cityess.GetAllCity().ToList();
                return dsds;
            }
        }
        public IEnumerable<tblCity> GetAllCitiesByStateID(long id)
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                var dsds = unitOfWork.Cityess.GetAllCitiesByStateID(id).ToList();
                return dsds;
            }
        }
    }
}
