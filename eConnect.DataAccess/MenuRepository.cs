﻿using eConnect.Model;
using System;
using System.Collections.Generic;
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

        public IEnumerable<tblMenuMain> GetAllMenuMainWithSubMenu(int userTypeId)
        {        
            var data1 = eConnectAppEntities.tblMenuSubs.Where(d => d.RoleId == userTypeId).Select(d=>d.MenuMainId).ToList();
            var data = eConnectAppEntities.tblMenuMains.Include("tblMenuSubs").Where(d=>data1.Contains(d.MenuMainId)).ToList();
            return data;
        }   
        public IEnumerable<tblMenuMain> GetMenuMainByID(long Id)
        {
            return eConnectAppEntities.tblMenuMains.Where(d=>d.MenuMainId==Id).Where(d => d.Status == true).ToList();
        }
    }
}
