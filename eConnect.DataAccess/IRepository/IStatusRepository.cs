using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eConnect.DataAccess
{
    public interface  IStatusRepository : IRepository<tblStatu>
    {
        IList<tblStatu> GetAllStatus();
        List<tblStatu> GetStatus();

        IList<tblUserStatu> GetAllUserStatus();
        List<tblUserStatu> GetUserStatus();
    }
}
