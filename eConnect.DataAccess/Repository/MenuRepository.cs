using eConnect.Model;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eConnect.DataAccess
{
    class MenuRepository : Repository<tblMenuMain>, IMenuRepository
    {
        public MenuRepository(eConnectAppEntities appcontext) : base(appcontext)
        {

        }
        public eConnectAppEntities eConnectAppEntities
        {
            get { return Context as eConnectAppEntities; }
        }

        public IEnumerable<tblMenuMain> GetAllMenuMain()
        {
            return eConnectAppEntities.tblMenuMains.Where(d => d.Status == true).ToList();
        }

        public IEnumerable<tblMenuSub> GetAllSubMain()
        {
            return eConnectAppEntities.tblMenuSubs.Include(t => t.tblMenuMain).Include(t => t.tblRoleMaster).ToList();
        }
        public IEnumerable<tblMenuMain> GetAllMenuMainWithSubMenu(int userTypeId)
        {        
            var data1 = eConnectAppEntities.tblMenuSubs.Where(d => d.RoleId == userTypeId && d.Status == true).OrderBy(d => d.Priority).Select(d=>d.MenuMainId).ToList();
            //var data = eConnectAppEntities.tblMenuMains.Include("tblMenuSubs").Where(d=>data1.Contains(d.MenuMainId)).OrderBy(d=>d.Priority).ToList();
            var data = eConnectAppEntities.tblMenuMains.Include(e => e.tblMenuSubs).Where(d=>data1.Contains(d.MenuMainId)).OrderBy(d=>d.Priority).ToList();

            return data;
        }   
        public IEnumerable<tblMenuMain> GetMenuMainByID(long Id)
        {
            return eConnectAppEntities.tblMenuMains.Where(d=>d.MenuMainId==Id).Where(d => d.Status == true).ToList();
        }

        public IEnumerable<sp_GetAppMenuWithSubMenu_Result> GetAppMenuWithSubMenu(int userTypeId)
        {
            var data = eConnectAppEntities.sp_GetAppMenuWithSubMenu(userTypeId).ToList();
            return data;
        }

        public void InsertSubMainWithMenuMenu(tblMenuSub tblMenuSub)
        {
            eConnectAppEntities.tblMenuSubs.Add(tblMenuSub);
            eConnectAppEntities.SaveChanges();
        }
        public void UpdateSubMainWithMenuMenu(tblMenuSub tblMenuSub)
        {
            eConnectAppEntities.Entry(tblMenuSub).State = EntityState.Modified;
            eConnectAppEntities.SaveChanges();
        }

        public void DeleteSubMainWithMenuMenu(int tblMenuSubId)
        {
            tblMenuSub tblMenuSub = eConnectAppEntities.tblMenuSubs.Find(tblMenuSubId);
            eConnectAppEntities.tblMenuSubs.Remove(tblMenuSub);
            eConnectAppEntities.SaveChanges();
        }
    }
}
