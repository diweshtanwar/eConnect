using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace eConnect.Model
{
    public class OtherModels
    {
    }

    public class WindowTimes
    {
        public int Id { get; set; }


        public string StartTime { get; set; }
        public string EndTime { get; set; }
        public bool InActive { get; set; }

    }
    public class FolderDetailsModel
    {
        public int Id { get; set; }

        [Required]
        public string FolderName { get; set; }
        public byte Priority { get; set; }
        public bool InActive { get; set; }
        public HttpPostedFileBase FolderImage { get; set; }
    }
    public class ApplicationSettingModel
    {
        public int SettingId { get; set; }
        public Nullable<int> BusinessId { get; set; }
        public string ApplicationName { get; set; }
        public string AutoBackUp { get; set; }
        public string AutoBackUpDuration { get; set; }

    }
    public class AccountConfigurationModel
    {
        public int ConfigurationId { get; set; }
        [Required]
        public int BusinessId { get; set; }
        [Required]
        public int DeactiveAccountDaysForInvalidPwd { get; set; }
        public int LockAccountDaysForInvalidPwd { get; set; }
        public int AutoUnlockAccountMinutes { get; set; }
        public int PasswordAutoExpireInDays { get; set; }
        public bool IsPasswordNeverExpired { get; set; }
        public bool ChangedPwdOnNextLogin { get; set; }
        public int PasswordLength { get; set; }
        public bool NotifiedToCSP { get; set; }
        public string BusinessName { get; set; }
    }
    public class RoleMasterModel
    {
        public int RoleId { get; set; }
        public string Name { get; set; }
    }
}
