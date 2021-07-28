using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using eConnect.DataAccess;

namespace eConnect.Logic
{
    public class BranchCodeLogic
    {
        public IList<tblBranchCode> GetAllBranchCode()
        {        
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                var data = unitOfWork.BranchCodes.GetAllBranchCode().ToList();               
                return data;
            }
        }
    }
}
