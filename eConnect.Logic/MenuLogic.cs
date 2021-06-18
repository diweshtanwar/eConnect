using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using eConnect.Model;
using eConnect.DataAccess;

namespace eConnect.Logic
{
    public class MenuLogic
    {
        public IEnumerable<tblMenuMain> GetMenuList()
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                var data = unitOfWork.Menus.GetAllMenuMain();
                if (data != null)
                {
                   
                    return data;
                }
                else
                {
                    return null;
                }

            }
        }     
        public IEnumerable<tblMenuMain> GetAllMenuMainWithSubMenuByRoleId(int userTypeId)
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
               
                var data = unitOfWork.Menus.GetAllMenuMainWithSubMenu(userTypeId);
                if (data != null)
                {                       
                    return data;
                }
                else
                {
                    return null;
                }

            }
        }
    }
}
