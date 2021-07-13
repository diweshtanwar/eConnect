using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eConnect.DataAccess
{
     class AnnouncementRepository : Repository<tblAnnouncement>, IAnnouncementRepository
    {
        public AnnouncementRepository(eConnectAppEntities appcontext) : base(appcontext)
        {

        }

        public eConnectAppEntities eConnectAppEntities
        {
            get { return Context as eConnectAppEntities; }
        }
        public IList<tblAnnouncement> GetAnnouncement()
        {
            return eConnectAppEntities.tblAnnouncements.Where(d=>d.Status==true).ToList();
        }

    }
}


