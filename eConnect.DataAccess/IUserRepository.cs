using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eConnect.DataAccess
{
    public interface IUserRepository : IRepository<tblUser>
    {
        IEnumerable<tblUser> GetAllUsers();
        IEnumerable<tblUser> GetAllUsersByStateID(int id);
        tblUser GetAllUsersByEmailiID(string email, string pswd);
        tblUser GetUsersByUserName(string userName);
        IEnumerable<tblUser> GetAllUsersByStatus(int statusid);
        IEnumerable<tblUser> GetAllUsersDetailsByid(long id);
      
    }
    public interface IUserLoginDetails : IRepository<tblUserLoginLog>
    {
        IEnumerable<tblUserLoginLog> GetAllUserLoginDetails();
        IEnumerable<tblUserLoginLog> GetAllUserLoginDetailsByUserID(long userid);
    }
}
