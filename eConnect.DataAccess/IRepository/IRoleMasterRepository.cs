using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eConnect.DataAccess
{
  public interface IRoleMasterRepository : IRepository<tblRoleMaster>
    {
        IList<tblRoleMaster> GetAllRoleMaster();
        IEnumerable<tblRoleMaster> GetRoleMaster();
        tblRoleMaster GetRoleMasterByID(int roleMasterId);
        void InsertRoleMaster(tblRoleMaster tblRoleMaster);
        void DeleteRoleMaster(int roleMasterId);
        void UpdateRoleMaster(tblRoleMaster tblRoleMaster);
        void Save();
    }
}
