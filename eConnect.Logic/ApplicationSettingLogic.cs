using eConnect.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using eConnect.Model;



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
        public void UpdateApplicationSetting(tblApplicationSetting tblApplicationSetting)
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                unitOfWork.ApplicationSettings.UpdateApplicationSetting(tblApplicationSetting);
               
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
