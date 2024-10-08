﻿using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eConnect.DataAccess
{
    class StatusRepository : Repository<tblStatu>, IStatusRepository
    {
        public StatusRepository(eConnectAppEntities appcontext) : base(appcontext)
        {

        }

        public eConnectAppEntities eConnectAppEntities
        {
            get { return Context as eConnectAppEntities; }
        }
        public IList<tblStatu> GetAllStatus()
        {
            return eConnectAppEntities.tblStatus.ToList();
        }

        public List<tblStatu> GetStatus()
        {
            return eConnectAppEntities.tblStatus.ToList(); ;
        }
        public IList<tblUserStatu> GetAllUserStatus()
        {
            return eConnectAppEntities.tblUserStatus.ToList();
        }

        public List<tblUserStatu> GetUserStatus()
        {
            return eConnectAppEntities.tblUserStatus.ToList(); ;
        }

    }
 
}

