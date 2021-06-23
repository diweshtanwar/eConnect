using eConnect.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using eConnect.Model;
using System.Web;

namespace eConnect.Logic
{
   public class ApplicationSettingLogic
    {
        public IList<tblApplicationSetting> GetAllApplicationSetting()
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                return unitOfWork.ApplicationSettings.GetAllApplicationsSetting().ToList();
               
            }
        }

        public tblApplicationSetting GetApplicationSettingByID( int id)
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
               return unitOfWork.ApplicationSettings.GetApplicationSettingByID(id);
                
            }
        }
        public void UpdateApplicationSetting(tblApplicationSetting model)
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                var data = unitOfWork.ApplicationSettings.Find(x => x.SettingId == model.SettingId).FirstOrDefault();
                data.BusinessId = (int)model.BusinessId;
                data.ApplicationName = model.ApplicationName;
                data.AutoBackUp = model.AutoBackUp;
                data.AutoBackUpDuration = model.AutoBackUpDuration;
                data.DataRetention = model.DataRetention;
                data.Status = model.Status;
                data.UpdatedDate = DateTime.Now;
                data.UpdatedBy =(int)HttpContext.Current.Session["UserId"];
                unitOfWork.ApplicationSettings.Update(data);
                unitOfWork.ApplicationSettings.Save();

            }
        }
        public void Save()
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                unitOfWork.ApplicationSettings.Save();

            }
        }
    }
}
