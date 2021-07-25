using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using eConnect.Model;
using eConnect.Logic;
using System.IO;
using System.Configuration;
using System.Globalization;
using eConnect.DataAccess;
using System.Data;
using System.Data.Entity;
using System.Data.SqlClient;
using System.Data.OleDb;
using NLog;

namespace eConnect.Application.Controllers
{
    public class AdminController : Controller
    {
        private static Logger logger = LogManager.GetLogger("EConnectLogRules");
        string RootFilePath = System.Web.HttpContext.Current.Server.MapPath(Convert.ToString(ConfigurationManager.AppSettings["RootFilePath"]));
        string UploaderFilePath = System.Web.HttpContext.Current.Server.MapPath(Convert.ToString(ConfigurationManager.AppSettings["UploaderFiles"]));
        List<SelectListItem> ddlMonths = new List<SelectListItem>();
        List<SelectListItem> ddlYears = new List<SelectListItem>();
        private eConnectAppEntities db = new eConnectAppEntities();

        public ActionResult Dashboard()
        {
            return View();
        }
        public ActionResult ApproveCSP()
        {
            UserLogic ul = new UserLogic();
            var users = ul.GetUsersInfoByStatus(1);
            ViewBag.Users = users;
            return View();
        }
        public ActionResult ViewCSPProfile(string id)
        {
            if (id != null)
            {
                string decrypt = CommonLogic.DecryptText(id.ToString());
                UserLogic ul = new UserLogic();
                var model = ul.GetUsersDetailsByid(Convert.ToInt32(decrypt));
                return View(model);
            }
            else
            {
                return null;
            }
        }
        public FileResult OpenFile(string id, string filename, string filetype)
        {
            string fullpath = string.Empty;
            if (filename != null || filename != "")
            {
                try
                {

                    fullpath = "~/UploadedFiles//Proofs//" + CommonLogic.DecryptText(id.ToString()) + "//" + filetype + "//" + filename;
                    return File(new FileStream(Server.MapPath(fullpath), FileMode.Open), "application/octetstream", filename);
                }
                catch (Exception)
                {
                    return File(new FileStream(Server.MapPath(fullpath), FileMode.Open), "application/octetstream", filename);

                    // throw ex;
                }
            }
            else
            {
                return null;
            }

        }
        public FileResult OpenFileNew(string id, string filename, string filetype)
        {
            string fullpath = string.Empty;
            if (filename != null || filename != "")
            {
                try
                {
                    fullpath = "~/UploadedFiles//Proofs//" + id.ToString() + "//" + filetype + "//" + filename;
                    return File(new FileStream(Server.MapPath(fullpath), FileMode.Open), "application/octetstream", filename);
                }
                catch (Exception)
                {
                    return File(new FileStream(Server.MapPath(fullpath), FileMode.Open), "application/octetstream", filename);

                    // throw ex;
                }
            }
            else
            {
                return null;
            }

        }


        string FolderImagesPath = System.Web.HttpContext.Current.Server.MapPath(Convert.ToString(ConfigurationManager.AppSettings["FolderImages"]));

        public ActionResult UploadFolderImages()
        {
            FolderDetailsLogic folderdetail = new FolderDetailsLogic();
            //var folderlist = folderdetail.GetAllFolderDetails();
            //ViewBag.Allfolderlist = folderlist;
            return View();
        }


        [HttpPost]
        public ActionResult UploadFolderImages(FolderDetailsModel model)
        {

            string fpath = string.Empty;
            string path = Path.Combine(FolderImagesPath, model.FolderName.ToString());
            if (model.FolderImage != null)
            {
                fpath = CheckDirectory(path, model.FolderImage);
                model.FolderImage.SaveAs(fpath);

                TempData["Message"] = "Image Name: " + model.FolderImage.FileName + " " + "has been successfully uploaded to folder" + model.FolderName;
            }

            return RedirectToAction("UploadFolderImages");
        }
        public string CheckDirectory(string path, HttpPostedFileBase postedfile)
        {
            string fullpath = string.Empty;
            // fullpath = Path.Combine(path, filetype);
            if (!Directory.Exists(path))
            {
                Directory.CreateDirectory(path);
            }
            fullpath = path + "\\" + Path.GetFileName(postedfile.FileName);
            return fullpath;
        }
        public ActionResult ShowFolderImages()
        {
            int id = 2;
            FolderDetailsLogic folderdetail = new FolderDetailsLogic();
            // var model = folderdetail.GetAllFolderDetailsById(id);
            return View();
        }


        private SelectList GetMonths()
        {
            var months = Enumerable.Range(1, 12).Select(i => new
            {
                A = i,
                B = DateTimeFormatInfo.CurrentInfo.GetMonthName(i)
            });
            int CurrentMonth = 1; //January  
            {
                CurrentMonth = DateTime.Now.Month;
                months = Enumerable.Range(1, CurrentMonth).Select(i => new
                {
                    A = i,
                    B = DateTimeFormatInfo.CurrentInfo.GetMonthName(i)
                });
            }
            foreach (var item in months)
            {
                ddlMonths.Add(new SelectListItem { Text = item.B.ToString(), Value = item.A.ToString() });
            }
            return new SelectList(ddlMonths, "Value", "Text", CurrentMonth);
        }
        private SelectList GetYears()
        {
            int CurrentYear = DateTime.Now.Year;
            for (int i = 2010; i <= CurrentYear; i++)
            {
                ddlYears.Add(new SelectListItem
                {
                    Text = i.ToString(),
                    Value = i.ToString()
                });
            }
            return new SelectList(ddlYears, "Value", "Text");
        }


        public ActionResult ApplicationSetting(UploaderModel model)
        {
            BusinessLogic BusinessList = new BusinessLogic();
            var BList = BusinessList.GetAllBusiness();
            ViewBag.BusinessList = BList;
            return View();
        }
        [HttpPost]
        public ActionResult ApplicationSetting(string type)
        {
            if (type == "Search")
            {
                List<ApplicationSettingModel> products = new List<ApplicationSettingModel>();
                ApplicationSettingLogic aplogic = new ApplicationSettingLogic();
                var Applist = aplogic.GetAllApplicationSetting().ToList();
                foreach (var item in Applist)
                {
                    products.Add(
                                   new ApplicationSettingModel
                                   {
                                       ApplicationName = item.ApplicationName,
                                       SettingId = item.SettingId,
                                       BusinessId = item.BusinessId,
                                       AutoBackUp = item.AutoBackUp,
                                       AutoBackUpDuration = item.AutoBackUpDuration,
                                   });
                }
                return PartialView("_ApplicationSetting", products);
            }
            else
            {
                BusinessLogic BusinessList = new BusinessLogic();
                var BList = BusinessList.GetAllBusiness();
                ViewBag.BusinessList = BList;
                return PartialView("_AddApplicationSetting");
            }
        }
        public ActionResult _AddApplicationSetting()
        {
            return PartialView("_AddApplicationSetting");
        }
        public FileResult OpenFileUploader(int id, int year, int month, string filename)
        {
            string path = UploaderFilePath;
            string fullpath = string.Empty;
            //fullpath = UploaderFilePath;
            if (id > 0)
            {
                try
                {
                    fullpath = "~/UploaderFiles//" + id.ToString() + "//" + year + "//" + month + "//" + filename;
                    return File(new FileStream(Server.MapPath(fullpath), FileMode.Open), "application/octetstream", filename);
                }
                catch (Exception)
                {
                    return File(new FileStream(Server.MapPath(fullpath), FileMode.Open), "application/octetstream", filename);
                }
            }
            else
            {
                return null;
            }

        }

        public ActionResult AddAccountConfiguration()
        {
            BusinessLogic BusinessList = new BusinessLogic();
            var BList = BusinessList.GetAllBusiness();
            ViewBag.BusinessList = BList;
            return View();
        }
        [HttpPost]
        public ActionResult AddAccountConfiguration(AccountConfigurationModel model)
        {
            BusinessLogic BusinessList = new BusinessLogic();
            var BList = BusinessList.GetAllBusiness();
            ViewBag.BusinessList = BList;
            if (ModelState.IsValid)
            {
                AccountConfigurationLogic cl = new AccountConfigurationLogic();
                if (model.BusinessId > 0)
                {
                    cl.InsertAccountConfiguration(model);
                    TempData["Message"] = "Record Updated successfully.";

                }
                return RedirectToAction("AccountConfiguration");
            }


            return View();
        }
        public ActionResult AccountConfiguration()
        {
            BusinessLogic BusinessList = new BusinessLogic();
            var BList = BusinessList.GetAllBusiness();
            ViewBag.BusinessList = BList;
            return View();
        }
        [HttpPost]
        public ActionResult AccountConfiguration(string type, int businessid)
        {
            if (type == "Search")
            {
                var Applist = (dynamic)null;
                List<AccountConfigurationModel> products = new List<AccountConfigurationModel>();
                AccountConfigurationLogic aplogic = new AccountConfigurationLogic();
                if (businessid > 0)
                {
                    Applist = aplogic.GetAllAccountConfiguration().Where(x => x.BusinessId == businessid).ToList();
                }
                else
                {
                    Applist = aplogic.GetAllAccountConfiguration().ToList();
                }
                foreach (var item in Applist)
                {
                    products.Add(
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
                return PartialView("_AccountConfigurationDetails", products);
            }
            else
            {
                BusinessLogic BusinessList = new BusinessLogic();
                var BList = BusinessList.GetAllBusiness();
                ViewBag.BusinessList = BList;
                return PartialView("_AddApplicationSetting");
            }
        }

        public ActionResult _AddAccountConfiguration()
        {
            return PartialView("_AddAccountConfiguration");
        }

        [HttpPost]
        public ActionResult _AddAccountConfiguration(AccountConfigurationModel model)
        {
            AccountConfigurationLogic cl = new AccountConfigurationLogic();
            if (model.BusinessId > 0)
            {
                cl.InsertAccountConfiguration(model);
                TempData["Message"] = "Record Updated successfully.";
                return RedirectToAction("SAdmin", "TechSupportReqDetails");

            }
            return PartialView("_AddAccountConfiguration");
        }

        public ActionResult EditAccountConfiguration(int id)
        {

            AccountConfigurationModel accm = new AccountConfigurationModel();
            AccountConfigurationLogic cl = new AccountConfigurationLogic();
            // ReportsLogic upmodel = new ReportsLogic();
            var item = cl.GetAccountConfigurationById(id);
            accm.BusinessId = (int)item.BusinessId;
            accm.ConfigurationId = (int)item.ConfigurationId;
            accm.DeactiveAccountDaysForInvalidPwd = item.DeactiveAccountDaysForInvalidPwd;
            accm.NotifiedToCSP = item.NotifiedToCSP;
            accm.PasswordLength = item.PasswordLength;
            accm.ChangedPwdOnNextLogin = item.ChangedPwdOnNextLogin;
            accm.IsPasswordNeverExpired = item.IsPasswordNeverExpired;
            accm.PasswordAutoExpireInDays = item.PasswordAutoExpireInDays;
            accm.AutoUnlockAccountMinutes = item.AutoUnlockAccountMinutes;
            accm.LockAccountDaysForInvalidPwd = item.LockAccountDaysForInvalidPwd;
            BusinessLogic BusinessList = new BusinessLogic();
            var BList = BusinessList.GetAllBusiness();
            ViewBag.BusinessList = BList;
            return View(accm);
        }

        [HttpPost]
        public ActionResult EditAccountConfiguration(int id, AccountConfigurationModel model, string btnname)
        {
            AccountConfigurationLogic cl = new AccountConfigurationLogic();
            cl.UpdateAccountConfigurationBy(model);
            TempData["Message"] = "Record Updated Successfully.";
            return RedirectToAction("EditAccountConfiguration", new { id = model.ConfigurationId });

        }
        [HttpGet]
        public ActionResult _EditApplicationSetting(int? id)
        {
            if (id is null)
            {
                id = 1;
            }
            ApplicationSettingLogic objApplicationSettingLogic = new ApplicationSettingLogic();
            ViewBag.SuccessMsg = "";
            return PartialView("_EditApplicationSetting", objApplicationSettingLogic.GetApplicationSettingByID((int)id));
        }
        [HttpPost]
        public ActionResult _EditApplicationSetting(tblApplicationSetting tblApplicationSetting)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    ApplicationSettingLogic objApplicationSettingLogic = new ApplicationSettingLogic();

                    objApplicationSettingLogic.UpdateApplicationSetting(tblApplicationSetting);
                    ViewBag.SuccessMsg = "Record Updated Successfully!";
                    return PartialView("_EditApplicationSetting", objApplicationSettingLogic.GetApplicationSettingByID((int)tblApplicationSetting.SettingId));
                }
            }
            catch (DataException /* dex */)
            {
                //Log the error (uncomment dex variable name after DataException and add a line here to write a log.
                ModelState.AddModelError(string.Empty, "Unable to save changes. Try again, and if the problem persists contact your system administrator.");
            }
            return View(tblApplicationSetting);
        }
        public bool CheckExistingUploadedFile(int year, int month, int reporttype)
        {
            UploaderLogic uploaderLogic = new UploaderLogic();
            bool check = uploaderLogic.CheckExistingFile(year, month, reporttype);

            return check;

        }
  
        [HttpPost]
        public ActionResult Uploader(UploaderModel model)
        {
            bool check = CheckExistingUploadedFile(model.Year, model.Month, model.ReportType);
            if (check == true)
            {
                string monthname = CommonLogic.GetMonthName(Convert.ToInt32(model.Month));
                TempData["Message"] = "Record for " + model.Year + "and month " + monthname + " has been already submitted.";
            }
            else
            {
                string path = UploaderFilePath;
                string fpath = string.Empty;
                UploaderLogic uploaderLogic = new UploaderLogic();
                int uploaderid = uploaderLogic.InsertUploader(model);
                if (model.fileupload != null)
                {
                    fpath = CheckUploaderDirectory(path, model);
                    model.fileupload.SaveAs(fpath);
                }
                string FilePath = fpath;// @"C:\New folder\EGRAMIN TRANSCATION WISE COMISSION MAY-2021.xlsx";
                InsertExcelRecords(FilePath, uploaderid);
                TempData["Message"] = "Record submitted successfully.";

            }
            return RedirectToAction("Uploader");
        }
        public JsonResult UpdateUploaderStatus(Int32 uploaderid)
        {
            UploaderLogic ul = new UploaderLogic();
            if (uploaderid > 0)
            {
                ul.UpdateUploader(uploaderid);
            }
            return Json("Record Updated successfully", JsonRequestBehavior.AllowGet);
        }
        public ActionResult UploaderDetails(UploaderModel model)
        {
            RequestTypeLogic Rtypes = new RequestTypeLogic();
            var RtypesList = Rtypes.GetAllRequestTypes();
            ViewBag.RequestTypes = RtypesList;
            ViewBag.Years = GetYears().OrderByDescending(x => x.Value);
            ViewBag.Months = GetMonths().OrderByDescending(x => x.Value);
            return View();
        }
        [HttpPost]
        public ActionResult UploaderDetails(string RequestType = "", string year = "", string month = "")
        {
            List<UploaderModel> reportsList = new List<UploaderModel>();
            UploaderLogic upmodel = new UploaderLogic();
            var Reqlist = upmodel.GetAllUploaderFilesByYearMonthAndType(RequestType, year, month).ToList();
            foreach (var item in Reqlist)
            {
                reportsList.Add(
                               new UploaderModel
                               {
                                   UploaderId = item.UploaderId,
                                   Year = (int)item.Year,
                                   Month = (int)item.Month,
                                   ReportType = (int)item.ReportType,
                                   ApplyTDS = item.ApplyTDS,
                                   FileName = item.FileName,
                                   UpdatedDate = (DateTime)item.UpdatedDate,
                                   ReportTypeName = item.tblReportType.Name,
                                   InActive = item.InActive,
                                   ReportStatus = item.tblStatu.Name,
                                   MonthName = CommonLogic.GetMonthName(Convert.ToInt32(item.Month)),
                               });
            }
            return PartialView("_UploaderList", reportsList);
        }

       

        public ActionResult ViewUnPublishedRecords(int id)
        {
            List<TransactionCommissionModel> reportsList = new List<TransactionCommissionModel>();
            ReportsLogic upmodel = new ReportsLogic();
            var Reqlist = upmodel.GetAllCommissionReportByUploaderId(id);
            foreach (var item in Reqlist)
            {
                reportsList.Add(
                               new TransactionCommissionModel
                               {
                                   UploaderId = (int)item.UploaderId,
                                   TransactionCommissionId = (int)item.TransactionCommissionId,
                                   Circle = item.Circle,
                                   CircleName = item.CircleName,
                                   BCBF_Code = item.BCBF_Code,
                                   CSPCode = item.CSPCode,
                                   CSPName = item.CSPName,
                                   TransactionType = item.TransactionType,
                                   NoOfTransactions = Convert.ToDecimal(item.NoOfTransactions),
                                   Commission = item.Commission,

                               }); ;
            }
            return View(reportsList);
        }
        public JsonResult DeleteRecord(int transid, int uploaderid)
        {
            ReportsLogic rl = new ReportsLogic();
            rl.DeleteUnpublishedRecord(transid);
            TempData["Message"] = "Record Deleted successfully.";
            return Json("Record Deleted successfully", JsonRequestBehavior.AllowGet);
        }
        public JsonResult PublishCommissionReport(int uploaderid)
        {
            try
            {
                logger.Info("PublishCommissionReport:Connection Start-");
                connection();
                logger.Info("PublishCommissionReport:Connection End-");
                SqlCommand sqlcomm = new SqlCommand("[dbo].[sp_PublishCommissionReport]");
                logger.Info("SqlCommand: Call");
                con.Open();
                sqlcomm.Connection = con;
                sqlcomm.CommandType = CommandType.StoredProcedure;
                sqlcomm.Parameters.AddWithValue("UploaderId", uploaderid);
                SqlDataReader sdr = sqlcomm.ExecuteReader();
                logger.Info("SqlCommand: End");
                con.Close();
                return Json("Record Updated successfully", JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                logger.Error("PublishCommissionReport:-" + " " + uploaderid + " ");

                return null;
            }
        }

        public JsonResult DeleteUploaderRecord(int uploaderid)
        {
            UploaderLogic rl = new UploaderLogic();
            rl.DeleteUploaderRecord(uploaderid);
           // TempData["Message"] = "Record Deleted successfully.";
            return Json("Record Deleted successfully", JsonRequestBehavior.AllowGet);
        }
        public ActionResult EditCommissionRecord(int id)
        {
            TransactionCommissionModel reportsList = new TransactionCommissionModel();
            ReportsLogic upmodel = new ReportsLogic();
            var item = upmodel.GetAllCommissionReportByUploaderId(id).FirstOrDefault();
            reportsList.UploaderId = (int)item.UploaderId;
            reportsList.TransactionCommissionId = (int)item.TransactionCommissionId;
            reportsList.Circle = item.Circle;
            reportsList.CircleName = item.CircleName;
            reportsList.BCBF_Code = item.BCBF_Code;
            reportsList.CSPCode = item.CSPCode;
            reportsList.CSPName = item.CSPName;
            reportsList.TransactionType = item.TransactionType;
            reportsList.NoOfTransactions = Convert.ToDecimal(item.NoOfTransactions);
            reportsList.Commission = item.Commission;
            return View(reportsList);
        }
        [HttpPost]
        public ActionResult EditCommissionRecord(TransactionCommissionModel model)
        {
            ReportsLogic cl = new ReportsLogic();
            cl.UpdateUnpublishedRecord(model);
            TempData["Message"] = "Record Updated successfully.";
            return RedirectToAction("ViewUnPublishedRecords", new { id = model.UploaderId });

        }

        OleDbConnection Econ;
        SqlConnection con;
        string constr, Query, sqlconn;
        private void ExcelConn(string FilePath)
        {
            logger.Info("ExcelConnection creation starts");
            constr = string.Format(@"Provider=Microsoft.ACE.OLEDB.12.0;Data Source={0};Extended Properties=""Excel 12.0 Xml;HDR=YES;""", FilePath);
            // constr = string.Format(@"Provider=Microsoft.ACE.OLEDB.12.0;Data Source={0};Extended Properties=""Excel 12.0 Xml;HDR=NO;""", FilePath);
            Econ = new OleDbConnection(constr);
            logger.Info("ExcelConnection created successfully");
        }
        private void connection()
        {
            logger.Info("SQL connection creation starts");
            sqlconn = ConfigurationManager.ConnectionStrings["eConnectAppEntitiesExcel"].ConnectionString;
            con = new SqlConnection(sqlconn);
            logger.Info("SQL connection created successfully");
        }
        private void InsertExcelRecords(string FilePath, int uploaderid)
        {
            logger.Info("InsertExcelRecords starts with parameters:- FilePath =" + FilePath + " " + "UploaderId-" + uploaderid);
            ExcelConn(FilePath);
            Query = string.Format("Select [Circle],[Circle Name],[BCBF_CODE],[CSP_CODE],[CSP Name],[Transaction Type],[Num Txns / Avg Bal],[Commission]," + uploaderid + " as [uploaderid] FROM [{0}]", "Sheet1$");
            OleDbCommand Ecom = new OleDbCommand(Query, Econ);
            Econ.Open();
            //try
            {
                DataSet ds = new DataSet();
                OleDbDataAdapter oda = new OleDbDataAdapter(Query, Econ);
                Econ.Close();
                oda.Fill(ds);
                DataTable Exceldt = ds.Tables[0];
                connection();
                con.Open();
                logger.Info("Start mapping Excel file");
                using (var tran = con.BeginTransaction(IsolationLevel.ReadCommitted))
                {
                    using (var objbulk = new SqlBulkCopy(con, SqlBulkCopyOptions.Default, tran))
                    {
                        try
                        {
                            objbulk.DestinationTableName = "[dbo].[tblCommissionReportNew]";
                            //Mapping Table column    
                            objbulk.ColumnMappings.Add("Circle", "Circle");
                            objbulk.ColumnMappings.Add("Circle Name", "CircleName");
                            objbulk.ColumnMappings.Add("BCBF_CODE", "BCBF_Code");
                            objbulk.ColumnMappings.Add("CSP_CODE", "CSPCode");
                            objbulk.ColumnMappings.Add("CSP Name", "CSPName");
                            objbulk.ColumnMappings.Add("Transaction Type", "TransactionType");
                            objbulk.ColumnMappings.Add("Num Txns / Avg Bal", "NoOfTransactions");
                            objbulk.ColumnMappings.Add("Commission", "Commission");
                            objbulk.ColumnMappings.Add("UploaderId", "UploaderId");
                            objbulk.WriteToServerAsync(Exceldt);
                            tran.Commit();
                            con.Close();

                            logger.Info("Complete  Excel file mapping");
                        }
                        catch (Exception ex)
                        {
                            logger.Error("Error while uploading file :uploader id:-"+ " " + uploaderid +" "+"and FilePath:- "+" "+ FilePath);
                            tran.Rollback();
                            con.Close();
                        }
                    }
                }
            }
        }

        private void InsertCommissionRecordsMonthly(string FilePath, int uploaderid, int year, int month)
        {
            ExcelConn(FilePath);
            Query = string.Format("Select [CSP CODE],[CSP NAME],[TRANSACTION],[INCENTIVE],[RURAL],[TOTAL],[TDS],[PAYABLE TO CSP],[NET PAYABLE]," + uploaderid + " as [uploaderid]," + year + " as [Year]," + month + " as [Month] FROM [{0}]", "Sheet1$");
            OleDbCommand Ecom = new OleDbCommand(Query, Econ);
            Econ.Open();
            //try
            {
                DataSet ds = new DataSet();
                OleDbDataAdapter oda = new OleDbDataAdapter(Query, Econ);
                Econ.Close();
                oda.Fill(ds);
                DataTable Exceldt = ds.Tables[0];
                connection();
                con.Open();
                using (var tran = con.BeginTransaction(IsolationLevel.ReadCommitted))
                {
                    using (var objbulk = new SqlBulkCopy(con, SqlBulkCopyOptions.Default, tran))
                    {
                        try
                        {
                            objbulk.DestinationTableName = "[dbo].[tblCommissionReportMonthly]";
                            //Mapping Table column    
                            objbulk.ColumnMappings.Add("CSP CODE", "CSPCode");
                            objbulk.ColumnMappings.Add("CSP NAME", "CSPName");
                            objbulk.ColumnMappings.Add("TRANSACTION", "Transation");
                            objbulk.ColumnMappings.Add("INCENTIVE", "Incentive");
                            objbulk.ColumnMappings.Add("RURAL", "Rural");
                            objbulk.ColumnMappings.Add("TOTAL", "Total");
                            objbulk.ColumnMappings.Add("TDS", "TDS");
                            objbulk.ColumnMappings.Add("PAYABLE TO CSP", "PayableToCSP");
                            objbulk.ColumnMappings.Add("NET PAYABLE", "NetPayable");
                            objbulk.ColumnMappings.Add("Year", "Year");
                            objbulk.ColumnMappings.Add("Month", "Month");
                            objbulk.ColumnMappings.Add("UploaderId", "UploaderId");
                            objbulk.WriteToServerAsync(Exceldt);
                            tran.Commit();
                            con.Close();
                        }
                        catch (Exception ex)
                        {
                            tran.Rollback();
                            con.Close();
                        }
                    }
                }
            }
        }

        public JsonResult DeleteAccountConfigRecord(int configid)
        {
            AccountConfigurationLogic rl = new AccountConfigurationLogic();
            rl.DeleteAccConfigRecord(configid);
            TempData["Message"] = "Record Deleted successfully.";
            return Json("Record Deleted successfully", JsonRequestBehavior.AllowGet);
        }




        public ActionResult UploadCommissionReport()
        {
            ViewBag.Years = GetYears().OrderByDescending(x => x.Value);
            ViewBag.Months = GetMonths().OrderByDescending(x => x.Value);
            return View();
        }

        public bool CheckUploadedFileExist(int year, int month)
        {
            UploaderLogic uploaderLogic = new UploaderLogic();
            bool check = uploaderLogic.CheckExistingFile(year, month, 3);
            return check;

        }
        [HttpPost]
        public ActionResult UploadCommissionReport(UploaderModel model)
        {
            bool check = CheckUploadedFileExist(model.Year, model.Month);
            if (check == true)
            {
                string monthname = CommonLogic.GetMonthName(Convert.ToInt32(model.Month));
                TempData["Message"] = "Record for " + model.Year + "and month " + monthname + " has been already submitted.";
            }
            else
            {
                string path = UploaderFilePath;
                string fpath = string.Empty;
                UploaderLogic uploaderLogic = new UploaderLogic();
                model.ReportType = 3;
                model.FileName = model.fileupload.FileName;
                int uploaderid = uploaderLogic.InsertUploader(model);
                if (model.fileupload != null)
                {
                    fpath = CheckUploaderDirectory(path, model);
                    model.fileupload.SaveAs(fpath);
                }
                //   string FilePath = fpath;// @"C:\New folder\EGRAMIN TRANSCATION WISE COMISSION MAY-2021.xlsx";
                // InsertCommissionRecordsMonthly(FilePath, uploaderid, model.Year, model.Month);
                TempData["Message"] = "Record submitted successfully.";

            }
            return RedirectToAction("UploadCommissionReport");
        }

        public ActionResult _UploadCommissionReportMonthly()
        {

            List<UploaderModel> reportsList = new List<UploaderModel>();
            UploaderLogic upmodel = new UploaderLogic();
            var Reqlist = upmodel.GetAllUploaderDetails().Where(x => x.ReportType == 3).ToList();
            foreach (var item in Reqlist)
            {
                reportsList.Add(
                               new UploaderModel
                               {
                                   UploaderId = item.UploaderId,
                                   Year = (int)item.Year,
                                   Month = (int)item.Month,
                                   ReportType = (int)item.ReportType,
                                   CreatedDate = item.CreatedDate,
                                   FileName = item.FileName,
                                   ReportTypeName = item.tblReportType.Name,
                                   InActive = item.InActive,
                                   StatusId = (int)item.StatusID,
                                   ReportStatus = item.tblStatu.Name,
                                   MonthName = CommonLogic.GetMonthName(Convert.ToInt32(item.Month)),
                               });
            }
            return PartialView("_UploadCommissionReportMonthly", reportsList);

        }

        public JsonResult DeleteUploadedCommissionRecord(int uploaderid)
        {
            UploaderLogic rl = new UploaderLogic();
            rl.DeleteUploaderRecord(uploaderid);
            TempData["Message"] = "Record Deleted successfully.";
            return Json("Record Deleted successfully", JsonRequestBehavior.AllowGet);
        }

        public JsonResult PublishCommissionMonthlyReport(int uploaderid)
        {
            try
            {
                UploaderLogic ul = new UploaderLogic();
                var uploaderdetails = ul.GetAllUploaderDetailsById(uploaderid);
                string path = UploaderFilePath;
                string fullpath = string.Empty;
                if (uploaderdetails.UploaderId > 0)
                {
                    try
                    {
                        int Reporttype = 3;
                        fullpath = Path.Combine(path, Reporttype.ToString(), uploaderdetails.Year.ToString(), uploaderdetails.Month.ToString(), uploaderdetails.FileName);
                        InsertCommissionRecordsMonthly(fullpath, uploaderid, Convert.ToInt32(uploaderdetails.Year), Convert.ToInt32(uploaderdetails.Month));
                        ul.UpdateUploaderStatus(uploaderid, 5);
                        return Json("Record Published Successfully", JsonRequestBehavior.AllowGet);
                    }
                    catch (Exception ex)
                    {

                        return Json("Report Not Published.", JsonRequestBehavior.AllowGet);
                    }

                }
                else
                {

                    return Json("Report Not Published.", JsonRequestBehavior.AllowGet);
                }
            }
            catch (Exception ex)
            {
                return Json("Report Not Published.", JsonRequestBehavior.AllowGet);

            }
        }

        public string CheckUploaderDirectory(string path, UploaderModel model)
        {
            string fullpath = string.Empty;
            fullpath = Path.Combine(path, model.ReportType.ToString(), model.Year.ToString(), model.Month.ToString());
            if (!Directory.Exists(fullpath))
            {
                Directory.CreateDirectory(fullpath);
            }
            fullpath = fullpath + "\\" + Path.GetFileName(model.fileupload.FileName);
            return fullpath;
        }

        public ActionResult Uploader()
        {
            RequestTypeLogic Rtypes = new RequestTypeLogic();
            var RtypesList = Rtypes.GetAllRequestTypes();
            ViewBag.RequestTypes = RtypesList;
            ViewBag.Years = GetYears().OrderByDescending(x => x.Value);
            ViewBag.Months = GetMonths().OrderByDescending(x => x.Value);
            return View();
        }
        public ActionResult _UploaderDetailsTemp()
        {
            List<UploaderModel> reportsList = new List<UploaderModel>();
            UploaderLogic upmodel = new UploaderLogic();
            var Reqlist = upmodel.GetAllUploaderDetails().ToList();
            foreach (var item in Reqlist)
            {
                if (item.tblReportType.Status == false)
                {
                    reportsList.Add(
                               new UploaderModel
                               {
                                   UploaderId = item.UploaderId,
                                   Year = (int)item.Year,
                                   Month = (int)item.Month,
                                   ReportType = (int)item.ReportType,
                                   ApplyTDS = item.ApplyTDS,
                                   FileName = item.FileName,
                                   UpdatedDate = (DateTime)item.UpdatedDate,
                                   CreatedDate = (DateTime)item.CreatedDate,
                                   ReportTypeName = item.tblReportType.Name,
                                   InActive = item.InActive,
                                   StatusId = (int)item.StatusID,
                                   ReportStatus = item.tblStatu.Name,
                                   MonthName = CommonLogic.GetMonthName(Convert.ToInt32(item.Month)),
                                   UnPublishedCount = item.tblCommissionReportNews.Count
                               });
                }
            }
            return PartialView("_UploaderDetailsTemp", reportsList);
        }
    }
}
