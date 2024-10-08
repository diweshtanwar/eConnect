﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eConnect.DataAccess
{
  public  interface IAnnouncementRepository : IRepository<tblAnnouncement>
    {
       string GetAnnouncementMessage();
       string GetAnnouncementDetail();
        IEnumerable<tblAnnouncement> GetAllAnnouncement();
        void UpdateAnnouncement(tblAnnouncement tblAnnouncement);
    }
}
