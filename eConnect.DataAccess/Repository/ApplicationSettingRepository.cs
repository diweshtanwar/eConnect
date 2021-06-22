using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eConnect.DataAccess
{
    public class ApplicationSettingRepository : Repository<tblApplicationSetting>, IApplicationSettingRepository
    {

        public ApplicationSettingRepository(eConnectAppEntities appcontext) : base(appcontext)
        {

        }
        public eConnectAppEntities eConnectAppEntities
        {
            get { return new eConnectAppEntities(); }
        }

        public IList<tblApplicationSetting> GetAllApplicationsSetting()
        {
            return eConnectAppEntities.tblApplicationSettings.ToList();
        }

        public IEnumerable<tblApplicationSetting> GetApplicationSettings()
        {
            return eConnectAppEntities.tblApplicationSettings.ToList();
        }

        public tblApplicationSetting GetApplicationSettingByID(int id)
        {
            return eConnectAppEntities.tblApplicationSettings.Find(id);
        }

        public void InsertApplicationSetting(tblApplicationSetting ApplicationSetting)
        {
            eConnectAppEntities.tblApplicationSettings.Add(ApplicationSetting);
        }

        public void DeleteApplicationSetting(int ApplicationSettingID)
        {
            tblApplicationSetting ApplicationSetting = eConnectAppEntities.tblApplicationSettings.Find(ApplicationSettingID);
            eConnectAppEntities.tblApplicationSettings.Remove(ApplicationSetting);
        }

        public void UpdateApplicationSetting(tblApplicationSetting ApplicationSetting)
        {
            eConnectAppEntities.Entry(ApplicationSetting).State = EntityState.Modified;
        }

        public void Save()
        {
            eConnectAppEntities.SaveChanges();
        }

    }
}
