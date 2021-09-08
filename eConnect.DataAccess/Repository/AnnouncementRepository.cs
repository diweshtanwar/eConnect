using System;
using System.Collections.Generic;
using System.Data.Entity;
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
        public string GetAnnouncementMessage()
        {
            return eConnectAppEntities.tblAnnouncements.Where(d => d.Status == true).Select(d => d.Message).FirstOrDefault().ToString();
        }
        public string GetAnnouncementDetail()
        {
            return eConnectAppEntities.tblAnnouncements.Where(d => d.Status == true).Select(d => d.Detail).FirstOrDefault().ToString();
        }
        public IEnumerable<tblAnnouncement> GetAllAnnouncement()
        {
            return eConnectAppEntities.tblAnnouncements.ToList();
        }
        public void UpdateAnnouncement(tblAnnouncement tblAnnouncement)
        {
            eConnectAppEntities.Entry(tblAnnouncement).State = EntityState.Modified;
            eConnectAppEntities.SaveChanges();
        }
    }
}


