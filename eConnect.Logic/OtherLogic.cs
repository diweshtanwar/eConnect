using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.Entity.Validation;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using eConnect.DataAccess;
using eConnect.Model;


namespace eConnect.Logic
{
    public class OtherLogic
    {
    }
    public class FolderDetailsLogic
    {
        public IList<tblFolderDetail> GetAllFolderDetails()
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                var fDetails = unitOfWork.FolderDetailss.GetAllFolderDetails().OrderBy(x => x.FolderId).ToList();

                return fDetails;
            }
        }

        public tblFolderDetail GetAllFolderDetailsById(int id)
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                // var fDetails = unitOfWork.FolderDetailss.GetAllFolderDetailsById(id);

                return null;
            }
        }
    }
    public class RequestTypeLogic
    {
        public IList<tblReportType> GetAllRequestTypes()
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                var Rtypes = unitOfWork.ReportTypess.GetAllReportType().ToList();
                return Rtypes;
            }
        }
    }

    public class ReportTypeLogic
    {

        public IList<tblReportType> GetAllRequestTypes()
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                var Rtypes = unitOfWork.ReportTypess.GetAllReportType().ToList();
                return Rtypes;
            }
        }
    }

    public class UploaderLogic
    {
        public IList<tblUploader> GetAllUploaderDetails()
        {

            UploaderModel sr = new UploaderModel();
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                var uploaderdetails = unitOfWork.Uploaders.GetAllUploader().ToList();
                foreach (var model in uploaderdetails)
                {
                    sr.ReportType = model.ReportType;
                    sr.Year = model.Year;
                    sr.Month = model.Month;
                    sr.UploaderId = model.UploaderId;
                    sr.ApplyTDS = model.ApplyTDS;
                    sr.FileName = model.FileName;
                    sr.FileSource = model.FileSource;
                    sr.ReportTypeName = model.tblReportType.Name;
                }
                return uploaderdetails;
            }
        }
        public long InsertUploader(UploaderModel item)
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                tblUploader uploader = new tblUploader();
                uploader.ReportType = item.ReportType;
                uploader.Year = item.Year;
                uploader.Month = item.Month;
                if (item.ReportType == 1)
                {
                    uploader.ApplyTDS = item.ApplyTDS;
                }
                uploader.FileName = item.fileupload.FileName;
                uploader.UpdatedDate = DateTime.Now;
                // uploader.UpdatedDate = @Session["UserId"];
                unitOfWork.Uploaders.Add(uploader);
                long id = uploader.UploaderId;
                return id;
            }

        }
    }

    public class BusinessLogic
    {
        public IList<tblBusiness> GetAllBusiness()
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                var Rtypes = unitOfWork.Businesss.GetAllBusiness().ToList();
                return Rtypes;
            }
        }

    }

    public class ApplicationSettingLogic
    {

        public IList<tblApplicationSetting> GetAllApplicationSetting()
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                var AppList = unitOfWork.ApplicationSettings.GetAllApplicationsSetting().ToList();
                return AppList;
            }
        }
    }

    public class RoleMasterLogic
    {
        public void InsertRoleMaster(RoleMasterModel model)
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                tblRoleMaster rmaster = new tblRoleMaster();
                rmaster.Name = model.Name;
                unitOfWork.RoleMasters.Add(rmaster);
            }
        }
        public IList<tblRoleMaster > GetAllRoles()
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                var AppList = unitOfWork.RoleMasters.GetAllRoleMaster().ToList();
                return AppList;
            }
        }
    }
    public class AccountConfigurationLogic
    {

        public IList<tblConfiguration> GetAllAccountConfiguration()
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                var ConfiList = unitOfWork.Configurations.GetAllConfiguration().ToList();
                return ConfiList;
            }
        }
        public void InsertAccountConfiguration(AccountConfigurationModel model)
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                tblConfiguration sr = new tblConfiguration();
                sr.BusinessId = model.BusinessId;
                sr.DeactiveAccountDaysForInvalidPwd = model.DeactiveAccountDaysForInvalidPwd;
                sr.LockAccountDaysForInvalidPwd = model.LockAccountDaysForInvalidPwd;
                sr.AutoUnlockAccountMinutes = model.AutoUnlockAccountMinutes;
                sr.PasswordAutoExpireInDays = model.PasswordAutoExpireInDays;
                sr.IsPasswordNeverExpired = model.IsPasswordNeverExpired;
                sr.ChangedPwdOnNextLogin = model.ChangedPwdOnNextLogin;
                sr.PasswordLength = model.PasswordLength;
                sr.NotifiedToCSP = model.NotifiedToCSP;
                unitOfWork.Configurations.Add(sr);
            }
        }



        public AccountConfigurationModel GetAccountConfigurationById(long id)
        {
            AccountConfigurationModel sr = new AccountConfigurationModel();
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                var model = unitOfWork.Configurations.Find(x => x.ConfigurationId == id).FirstOrDefault();
                if (model != null)
                {
                    sr.ConfigurationId = (int)model.ConfigurationId;
                    sr.BusinessId = (int)model.BusinessId;
                    sr.DeactiveAccountDaysForInvalidPwd = (int)model.DeactiveAccountDaysForInvalidPwd;
                    sr.LockAccountDaysForInvalidPwd = (int)model.LockAccountDaysForInvalidPwd;
                    sr.AutoUnlockAccountMinutes = (int)model.AutoUnlockAccountMinutes;
                    sr.PasswordAutoExpireInDays = (int)model.PasswordAutoExpireInDays;
                    sr.IsPasswordNeverExpired = (bool)model.IsPasswordNeverExpired;
                    sr.ChangedPwdOnNextLogin = (bool)model.ChangedPwdOnNextLogin;
                    sr.PasswordLength = (int)model.PasswordLength;
                    sr.NotifiedToCSP = (bool)model.NotifiedToCSP;
                }
                return sr;
            }
        }
        public void UpdateAccountConfigurationBy(AccountConfigurationModel model)
        {

            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                var sr = unitOfWork.Configurations.Find(x => x.ConfigurationId == model.ConfigurationId).FirstOrDefault();
                sr.BusinessId = (int)model.BusinessId;
                sr.DeactiveAccountDaysForInvalidPwd = (int)model.DeactiveAccountDaysForInvalidPwd;
                sr.LockAccountDaysForInvalidPwd = (int)model.LockAccountDaysForInvalidPwd;
                sr.AutoUnlockAccountMinutes = (int)model.AutoUnlockAccountMinutes;
                sr.PasswordAutoExpireInDays = (int)model.PasswordAutoExpireInDays;
                sr.IsPasswordNeverExpired = (bool)model.IsPasswordNeverExpired;
                sr.ChangedPwdOnNextLogin = (bool)model.ChangedPwdOnNextLogin;
                sr.PasswordLength = (int)model.PasswordLength;
                sr.NotifiedToCSP = (bool)model.NotifiedToCSP;
                unitOfWork.Configurations.Update(sr);
            }
        }

    }
}


