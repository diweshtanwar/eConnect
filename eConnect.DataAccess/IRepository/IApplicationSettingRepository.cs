using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eConnect.DataAccess
{
    public interface IApplicationSettingRepository : IRepository<tblApplicationSetting>
    {
        IList<tblApplicationSetting> GetAllApplicationsSetting();
        IEnumerable<tblApplicationSetting> GetApplicationSettings();
        tblApplicationSetting GetApplicationSettingByID(int applicationSettingId);
        void InsertApplicationSetting(tblApplicationSetting applicationSetting);
        void DeleteApplicationSetting(int applicationSettingId);
        void UpdateApplicationSetting(tblApplicationSetting tblApplicationSetting);
        void Save();
    }
}
