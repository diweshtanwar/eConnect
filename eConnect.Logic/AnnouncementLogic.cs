using eConnect.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eConnect.Logic
{
   public class AnnouncementLogic
    {

        public string GetAnnouncementMessage()
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                var data = unitOfWork.Announcement.GetAnnouncementMessage();
                return data;
            }
        }

        public string GetAnnouncementDetail()
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                var data = unitOfWork.Announcement.GetAnnouncementDetail();
                return data;
            }
        }

        public IEnumerable<tblAnnouncement> GetAllAnnouncement()
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                var data = unitOfWork.Announcement.GetAllAnnouncement();
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
        public tblAnnouncement GetAnnouncementById(int id)
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                var data = unitOfWork.Announcement.GetAllAnnouncement().Where(d=>d.AnnouncementId==id).FirstOrDefault();
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
        public void UpdateAnnouncement(tblAnnouncement tblAnnouncement)
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                unitOfWork.Announcement.UpdateAnnouncement(tblAnnouncement);
              
            }
        }
    }
}
