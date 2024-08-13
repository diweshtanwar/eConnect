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
using System.Data;

namespace eConnect.Logic
{
    public class OtherLogic
    {
    }
    public class FolderDetailsLogic
    {
        //public IList<tblFolderDetail> GetAllFolderDetails()
        //{
        //    using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
        //    {
        //        var fDetails = unitOfWork.FolderDetailss.GetAllFolderDetails().OrderBy(x => x.FolderId).ToList();

        //        return fDetails;
        //    }
        //}

        //public tblFolderDetail GetAllFolderDetailsById(int id)
        //{
        //    using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
        //    {
        //        // var fDetails = unitOfWork.FolderDetailss.GetAllFolderDetailsById(id);

        //        return null;
        //    }
        //}
    }
    public class RequestTypeLogic
    {
        public IList<tblReportType> GetAllRequestTypes()
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                var Rtypes = unitOfWork.ReportTypess.GetAllReportType().Where(x => x.Status == false).ToList();
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
                var uploaderdetails = unitOfWork.Uploaders.GetAllUploader().OrderByDescending(x => x.UploaderId).ToList();
                foreach (var model in uploaderdetails)
                {
                    sr.ReportType = (int)model.ReportType;
                    sr.Year = (int)model.Year;
                    sr.Month = (int)model.Month;
                    sr.UploaderId = model.UploaderId;
                    sr.ApplyTDS = model.ApplyTDS;
                    sr.FileName = model.FileName;
                    sr.FileSource = model.FileSource;
                    sr.ReportTypeName = model.tblReportType.Name;
                    sr.StatusId = (int)model.StatusID;
                    sr.ReportStatus = model.tblStatu.Name;
                    sr.CreatedDate = model.CreatedDate;
                    sr.UnPublishedCount = model.tblCommissionReportNews.Count;
                    if (model.CycleID != null)
                        sr.CycleID = (int)model.CycleID;

                    if (model.AreaID != null)
                        sr.AreaID = (int)model.AreaID;


                }
                return uploaderdetails;
            }
        }
        public tblUploader GetAllUploaderDetailsById(int id)
        {

            UploaderModel sr = new UploaderModel();
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                var model = unitOfWork.Uploaders.Find(x => x.UploaderId == id).FirstOrDefault();
                {
                    sr.ReportType = (int)model.ReportType;
                    sr.Year = (int)model.Year;
                    sr.Month = (int)model.Month;
                    sr.UploaderId = model.UploaderId;
                    sr.ApplyTDS = model.ApplyTDS;
                    sr.FileName = model.FileName;
                    sr.FileSource = model.FileSource;
                    sr.ReportTypeName = model.tblReportType.Name;
                    sr.StatusId = (int)model.StatusID;
                    sr.ReportStatus = model.tblStatu.Name;
                    sr.UnPublishedCount = model.tblCommissionReportNews.Count;

                }
                return model;
            }
        }

        public IList<tblUploader> GetAllUploaderFilesByYearMonthAndType(string reporttype, string year, string month)
        {

            UploaderModel sr = new UploaderModel();
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                // var uploaderdetails = unitOfWork.Uploaders.Find(x=>x.Year==year && x.Month==month && x.ReportType==reporttype).ToList();

                var uploaderdetails = unitOfWork.Uploaders.GetAll().ToList();
                if (!string.IsNullOrEmpty(year))
                {
                    uploaderdetails = uploaderdetails.Where(x => x.Year == Convert.ToInt32(year)).ToList();
                }
                if (!string.IsNullOrEmpty(month))
                {
                    uploaderdetails = uploaderdetails.Where(x => x.Month == Convert.ToInt32(month)).ToList();
                }
                if (!string.IsNullOrEmpty(reporttype))
                {
                    uploaderdetails = uploaderdetails.Where(x => x.ReportType == Convert.ToInt32(reporttype)).ToList();
                }
                foreach (var model in uploaderdetails)
                {
                    sr.ReportType = (int)model.ReportType;
                    sr.Year = (int)model.Year;
                    sr.Month = (int)model.Month;
                    sr.UploaderId = model.UploaderId;
                    sr.ApplyTDS = model.ApplyTDS;
                    sr.FileName = model.FileName;
                    sr.FileSource = model.FileSource;
                    sr.ReportTypeName = model.tblReportType.Name;
                    sr.ReportStatus = model.tblStatu.Name;
                }
                return uploaderdetails;
            }
        }
        public int InsertUploader(UploaderModel item)
        {

            int Cycleid = CommonLogic.GetCycleID(item.Year, item.Month);
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
                uploader.StatusID = 5;
                uploader.InActive = false;
                uploader.CreatedDate = DateTime.Now;

                uploader.AreaID = 0;
                uploader.CycleID = Cycleid;
                // uploader.UpdatedDate = @Session["UserId"];
                unitOfWork.Uploaders.Add(uploader);
                int id = uploader.UploaderId;
                return id;
            }
        }
        public void UpdateUploader(int uploaderid)
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                var data = unitOfWork.Uploaders.Find(x => x.UploaderId == uploaderid).FirstOrDefault();
                data.InActive = true;
                //data.in
                data.UpdatedDate = DateTime.Now;
                unitOfWork.Uploaders.Update(data);

            }
        }

        public void UpdateUploaderStatus(int uploaderid, int statusId)
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                var data = unitOfWork.Uploaders.Find(x => x.UploaderId == uploaderid).FirstOrDefault();
                data.StatusID = statusId;
                data.UpdatedDate = DateTime.Now;
                unitOfWork.Uploaders.Update(data);

            }
        }

        public bool CheckExistingFile(int year, int month, int reporttype)
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                var uploaderdetails = unitOfWork.Uploaders.Find(x => x.Year == year && x.Month == month && x.ReportType == reporttype && x.InActive == false);


                if (uploaderdetails.Count() > 0)
                {
                    return true;
                }
                else
                {
                    return false;

                }
            }


        }


        public bool CheckExistingFileAreaCircle(int year, int month, int reporttype, int area, int cir)
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                var uploaderdetails = unitOfWork.Uploaders.Find(x => x.Year == year && x.Month == month && x.ReportType == reporttype && x.AreaID == area && x.CycleID == cir && x.InActive == false);
                if (uploaderdetails.Count() > 0)
                {
                    return true;
                }
                else
                {
                    return false;

                }
            }


        }

        public void PublishCommissionReport(int year, int month, int reporttype)
        {

            //using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            //{
            //    IList<> sp = unitOfWork.CommissionReportNews.CommissionReport(year, month, cspcode);
            //    return sp;

            //}
        }

        public void DeleteUploaderRecord(int id)
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                unitOfWork.Uploaders.DeleteRecord(id);

            }
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



public class AccountConfigurationLogic
{

    public IList<tblConfiguration> GetAllAccountConfiguration()
    {
        List<AccountConfigurationModel> Accconfigurations = new List<AccountConfigurationModel>();
        using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
        {
            var ConfiList = unitOfWork.Configurations.GetAllConfiguration().ToList();
            foreach (var item in ConfiList)
            {
                Accconfigurations.Add(
                               new AccountConfigurationModel
                               {
                                   ConfigurationId = item.ConfigurationId,
                                   BusinessId = (int)item.BusinessId,
                                   DeactiveAccountDaysForInvalidPwd = (int)item.DeactiveAccountDaysForInvalidPwd,
                                   LockAccountDaysForInvalidPwd = (int)item.LockAccountDaysForInvalidPwd,
                                   AutoUnlockAccountMinutes = (int)item.AutoUnlockAccountMinutes,
                                   PasswordAutoExpireInDays = (int)item.PasswordAutoExpireInDays,
                                   IsPasswordNeverExpired = (bool)item.IsPasswordNeverExpired,
                                   ChangedPwdOnNextLogin = (bool)item.ChangedPwdOnNextLogin,
                                   PasswordLength = (int)item.PasswordLength,
                                   NotifiedToCSP = (bool)item.NotifiedToCSP,
                                   BusinessName = item.tblBusiness.Name,
                               });
            }
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
    public void DeleteAccConfigRecord(int id)
    {
        using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
        {
            unitOfWork.Configurations.DeleteRecord(id);

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
public class WindowTimingLogic
{
    public IList<tblWindowTime> GetAllActiveWindow()
    {
        using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
        {
            // var Rtypes = unitOfWork.WindowTimings.GetActiveTimeWindow().Where(x => x.InActive == false).ToList();
            var Rtypes = unitOfWork.WindowTimings.GetActiveTimeWindow().ToList();
            return Rtypes;
        }
    }
    public IList<tblWindowTime> GetCurrentActiveWindow()
    {
        using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
        {
            var Rtypes = unitOfWork.WindowTimings.GetActiveTimeWindow().Where(x => x.InActive == false).OrderByDescending(x => x.Id).ToList();
            return Rtypes;
        }
    }


    public void InsertNewWindowTiming(WindowTimes model)
    {
        using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
        {
            tblWindowTime sr = new tblWindowTime();
            sr.StartTime = model.StartTime;
            sr.EndTime = model.EndTime;
            sr.InActive = model.InActive;
            unitOfWork.WindowTimings.Add(sr);
        }
    }


    public void DeleteWindowTiming(int id)
    {
        using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
        {
            unitOfWork.WindowTimings.DeleteWindowTimes(id);

        }
    }
    public WindowTimes GetWindowTimingById(long id)
    {
        WindowTimes sr = new WindowTimes();
        using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
        {
            var model = unitOfWork.WindowTimings.Find(x => x.Id == id).FirstOrDefault();
            if (model != null)
            {
                sr.Id = (int)model.Id;
                sr.StartTime = model.StartTime;
                sr.EndTime = model.EndTime;
                sr.InActive = (bool)model.InActive;
            }
            return sr;
        }
    }

    public void UpdateActiveWindowTiming(WindowTimes model)
    {
        using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
        {
            var sr = unitOfWork.WindowTimings.Find(x => x.Id == model.Id).FirstOrDefault();
            sr.Id = (int)model.Id;
            sr.StartTime = model.StartTime;
            sr.EndTime = model.EndTime;
            sr.InActive = (bool)model.InActive;
            unitOfWork.WindowTimings.Update(sr);
        }

    }


    public int InsertUploader(UploaderModel item)
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
            uploader.StatusID = 5;
            uploader.InActive = false;
            uploader.CreatedDate = DateTime.Now;

            uploader.AreaID = item.AreaID;
            uploader.CycleID = item.CycleID;
            // uploader.UpdatedDate = @Session["UserId"];
            unitOfWork.Uploaders.Add(uploader);
            int id = uploader.UploaderId;
            return id;
        }

    }
}




