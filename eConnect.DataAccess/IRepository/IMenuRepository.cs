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
        IEnumerable<tblMenuSub> GetAllSubMain();
        IEnumerable<tblMenuMain> GetAllMenuMainWithSubMenu(int userTypeId);
        IEnumerable<sp_GetAppMenuWithSubMenu_Result> GetAppMenuWithSubMenu(int userTypeId);
        IEnumerable<tblMenuMain> GetMenuMainByID(long id);
        void InsertSubMainWithMenuMenu(tblMenuSub tblMenuSub);
        void DeleteSubMainWithMenuMenu(int tblMenuSubId);
        void UpdateSubMainWithMenuMenu(tblMenuSub tblMenuSub);
    }
}
