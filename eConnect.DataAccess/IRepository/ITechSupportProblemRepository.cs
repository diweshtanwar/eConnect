using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using eConnect.DataAccess;

namespace eConnect.DataAccess
{
    public interface ITechSupportProblemRepository : IRepository<tblProblemType>
    {

       // IEnumerable<tblProblemType> GetAllTechSupportProblem();
    }

    public interface ITechSupportRequestRepository : IRepository<tblTechRequest>
    {
        tblTechRequest GetTechRequestByTReqId(long id);
    }
    
}
