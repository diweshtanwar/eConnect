using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using eConnect.DataAccess;

namespace eConnect.Logic
{
    public class CategoryLogic
    {
        public IList<tblCategory> GetAllCategory()
        {       
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                var data = unitOfWork.Categoress.GetAllCategory().ToList();
               
                return data;
            }
        }
    }
}
