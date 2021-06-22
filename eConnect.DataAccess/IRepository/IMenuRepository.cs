using eConnect.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eConnect.DataAccess
{
   public interface IMenuRepository
    {
        IEnumerable<tblMenuMain> GetAllMenuMain();
        IEnumerable<tblMenuMain> GetAllMenuMainWithSubMenu(int userTypeId);    
        IEnumerable<tblMenuMain> GetMenuMainByID(long id);
    }
}
