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
    }
}
