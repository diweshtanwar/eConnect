using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using eConnect.DataAccess;

namespace eConnect.Logic
{
    public class LocationLogic
    {
        public IList<tblLocation> GetAllLocation()
        {         
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                var data = unitOfWork.Locations.GetAllLocation().ToList();
               
                return data;
            }
        }
    }
}
