using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eConnect.DataAccess
{
    public interface IUserLoginLogRepository : IRepository<tblUserLoginLog>
    {
        IEnumerable<tblUserLoginLog> GetAllUserLoginDetails();
        IEnumerable<tblUserLoginLog> GetAllUserLoginDetailsByUserID(long userid);
        tblUserLoginLog GetLastLoginDetailsByUserID(long userId);
        void InsertUserLoginLog(tblUserLoginLog tblUserLoginLog);
        void Save();

    }
}
