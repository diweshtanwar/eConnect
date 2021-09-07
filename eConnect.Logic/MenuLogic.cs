using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using eConnect.DataAccess;
using eConnect.Model;
using System.Data.Entity;

namespace eConnect.Logic
{
    public class MenuLogic
    {
        public IEnumerable<tblMenuMain> GetAllMainMenu()
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

        public IEnumerable<tblMenuSub> GetAllSubMain()
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                var data = unitOfWork.Menus.GetAllSubMain();
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
        public tblMenuSub GetSubMainById(int Id)
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                var data = unitOfWork.Menus.GetAllSubMain().Where(d=>d.MenuSubId==Id).FirstOrDefault();
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
        public IEnumerable<tblMenuSub> GetAllSubMainDetailSearch(int? MenuMainId, int? RoleId, string ScreenTittle, bool? Status)
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                var result = unitOfWork.Menus.GetAllSubMain().ToList();

                if (MenuMainId != null)
                {
                    result = result.Where(d => d.MenuMainId == MenuMainId).ToList();
                }
                if (RoleId != null)
                {
                    result = result.Where(d => d.RoleId == RoleId).ToList();
                }
                if (!string.IsNullOrEmpty(ScreenTittle))
                {
                    result = result.Where(d => d.Controller.Contains(ScreenTittle)).ToList();
                }               
                if (Status != null)
                {
                    result = result.Where(d => d.Status == Status).ToList();
                }

                return result;
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

        public IEnumerable<sp_GetAppMenuWithSubMenu_Result> GetMenuWithSubMenuByRoleId(int userTypeId)
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {

                var data = unitOfWork.Menus.GetAppMenuWithSubMenu(userTypeId);
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

        public void InsertSubMainWithMenuMenu(tblMenuSub tblMenuSub)
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                unitOfWork.Menus.InsertSubMainWithMenuMenu(tblMenuSub);

            }
            
        }
        public void UpdateSubMainWithMenuMenu(tblMenuSub tblMenuSub)
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                unitOfWork.Menus.UpdateSubMainWithMenuMenu(tblMenuSub);
            }
        }
        public void DeleteSubMainWithMenuMenu(int id)
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                unitOfWork.Menus.DeleteSubMainWithMenuMenu(id);
            }
        }
    }
}
