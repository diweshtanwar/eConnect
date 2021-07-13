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

        public List<tblAnnouncement> GetAnnouncement()
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                var data = unitOfWork.Announcement.GetAnnouncement().ToList();
                return data;
            }
        }
    }
}
