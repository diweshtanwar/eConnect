using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using eConnect.Model;
using eConnect.Logic;
using System.IO;
using System.Configuration;
using eConnect.DataAccess;
using System.Net;
using eConnect.Application.Models;
using System.Net.Mail;
using ResetPasswordViewModel = eConnect.Model.ResetPasswordViewModel;


namespace eConnect.Application.Controllers
{
    public class HomeController : Controller
    {
        string RootFilePath = System.Web.HttpContext.Current.Server.MapPath(Convert.ToString(ConfigurationManager.AppSettings["RootFilePath"]));
        private eConnectAppEntities db = new eConnectAppEntities();
        string CSPFilePath = System.Web.HttpContext.Current.Server.MapPath(Convert.ToString(ConfigurationManager.AppSettings["CSPFilePath"]));
        string NoImagePath = System.Web.HttpContext.Current.Server.MapPath(Convert.ToString(ConfigurationManager.AppSettings["NoPicPath"]));
        string UserFilePath = System.Web.HttpContext.Current.Server.MapPath(Convert.ToString(ConfigurationManager.AppSettings["UserFilePath"]));


        /// <summary-eConect-code >
        /// started 

        public ActionResult Index()
        {
            return View();
        }
        public ActionResult About()
        {
            return View();
        }
        public ActionResult OurVision()
        {
            return View();
        }
        public ActionResult Contact()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Contact(EnquiryViewModels tblEnquiry)
        {
            tblEnquiry objtblEnquiry = new tblEnquiry();
            objtblEnquiry.Name = tblEnquiry.NewName;
            objtblEnquiry.Email = tblEnquiry.NewEmail;
            objtblEnquiry.Mobile = tblEnquiry.NewMobile;
            objtblEnquiry.Message = tblEnquiry.NewMessage;
            objtblEnquiry.CreatedBy = tblEnquiry.NewName;
            objtblEnquiry.CreatedDate = DateTime.UtcNow;
            objtblEnquiry.UpdatedDate = DateTime.Now;
            if (ModelState.IsValid)
            {
                db.tblEnquiries.Add(objtblEnquiry);
                db.SaveChanges();
                return RedirectToAction("ContactSuccess", tblEnquiry);
            }

            return View(tblEnquiry);
        }
        public ActionResult ContactSuccess(tblEnquiry tblEnquiry)
        {
            tblMailConfiguration tblMailConfiguration = db.tblMailConfigurations.Where(d => d.Status == true).FirstOrDefault();
            if (tblMailConfiguration.IsNeedToSendMail == true)
            {
                SendEmail(tblMailConfiguration, tblEnquiry);
            }

            return View();
        }
        public ActionResult Careers()
        {
            return View();
        }
        public ActionResult FindBranch()
        {
            return View();
        }
        public ActionResult Downloads()
        {
            return View(db.tblDownloadDetails.Where(d => d.Status == true).OrderBy(d => d.Priority).ToList());
        }
        public FileResult DownloadFile(string fileName)
        {
            //Build the File Path.
            string path = Server.MapPath(fileName);

            //Read the File data into Byte Array.
            byte[] bytes = System.IO.File.ReadAllBytes(path);

            //Send the File to Download.
            return File(bytes, "application/octet-stream", fileName);
        }
        public ActionResult GalleryCategories()
        {
            return View(db.tblGalleryCategories.Where(d => d.Status == true).OrderBy(d => d.Priority).ToList());
        }
        public ActionResult GalleryImages(int? id)
        {
            tblGalleryCategory tblGalleryCategory = db.tblGalleryCategories.Find(id);
            List<string> getImgesList = new List<string>();
            getImgesList = Directory.GetFiles(AppDomain.CurrentDomain.BaseDirectory + tblGalleryCategory.CategoryImagesPath.ToString(), "*.jpg", SearchOption.AllDirectories).ToList();
            List<string> ImgesListWithPath = new List<string>();
            foreach (string file in getImgesList)
            {
                var fileName = Path.GetFileName(file);
                ImgesListWithPath.Add("~\\" + tblGalleryCategory.CategoryImagesPath.ToString() + "\\" + fileName);
            }

            ViewBag.ImgesListWithPath = ImgesListWithPath;
            return View();
        }
        public ActionResult NewsAll()
        {
            return View(db.tblLatestNews.Where(d => d.Status == true).OrderBy(d => d.Priority).ToList());
        }
        public ActionResult NewsDetails(byte? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblLatestNew tblLatestNew = db.tblLatestNews.Find(id);
            if (tblLatestNew == null)
            {
                return HttpNotFound();
            }
            return View(tblLatestNew);
        }
        public ActionResult Error()
        {
            return View();

        }
        public static void SendEmail(tblMailConfiguration tblMailConfiguration, tblEnquiry tblEnquiry)
        {
            try
            {

                string smtpAddress = tblMailConfiguration.SmtpAddress;
                int portNumber = Convert.ToInt32(tblMailConfiguration.PortNumber);
                bool enableSSL = Convert.ToBoolean(tblMailConfiguration.EnableSSL);
                string emailFromAddress = tblMailConfiguration.EmailFromAddress;
                string password = tblMailConfiguration.Password;
                string emailToAddress = tblMailConfiguration.EmailToAddress + tblEnquiry.Email;
                string emailBccAddress = tblMailConfiguration.EmailBccAddress;
                string subject = tblMailConfiguration.Subject;
                string body = tblMailConfiguration.Body;
                using (MailMessage mail = new MailMessage())
                {
                    mail.From = new MailAddress(emailFromAddress);
                    mail.To.Add(emailToAddress);
                    mail.Bcc.Add(emailBccAddress);
                    mail.Subject = subject;
                    mail.Body = body;
                    mail.IsBodyHtml = Convert.ToBoolean(tblMailConfiguration.IsBodyHtml);
                    if (tblMailConfiguration.IsNeedToSendAttachments == true)
                    {
                        mail.Attachments.Add(new Attachment(tblMailConfiguration.AttachmentsPath));
                    }

                    using (SmtpClient smtp = new SmtpClient(smtpAddress, portNumber))
                    {
                        smtp.Credentials = new NetworkCredential(emailFromAddress, password);
                        smtp.EnableSsl = enableSSL;
                        smtp.Send(mail);
                    }
                }

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        /// </summary-eConect-code>
        /// <returns></returns>






        public ActionResult Dashboard()
        {
            return View();
        }


        [HttpGet]
        public ActionResult Login(string message)
        {
            ViewBag.SuccessMsg = message;
            return View();
        }

        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public ActionResult Login(Login user)
        {

            if (ModelState.IsValid)
            {
                UserLogic objUserLogic = new UserLogic();
                var userData = objUserLogic.ValidateUserLogin(user.UserName, user.Password);
                if (userData == null)
                {
                    ModelState.AddModelError("", "Invalid login attempt , your username and password are incorrect - please try again..");

                }
                else
                {
                    string picpath = string.Empty;
                    UserLoginLogLogic objUserLoginLogLogic = new UserLoginLogLogic();
                    objUserLoginLogLogic.GetLastLoginDetailsByUserID(userData.UserId);
                    RoleMasterLogic objRoleMasterLogic = new RoleMasterLogic();
                    var roleMasterData = objRoleMasterLogic.GetRoleMasterByID((int)userData.UserType);
                    Session["LastLoginDetails"] = objUserLoginLogLogic.GetLastLoginDetailsByUserID(userData.UserId);
                    Session["UserTypeId"] = userData.UserType;
                    if (userData.UserType == 3)
                    {
                        UserCSPDetailLogic cl = new UserCSPDetailLogic();
                        //  Session["CSPID"] = cl.GetCSPDetailByUSourceId(Convert.ToInt32(userData.UserSourceId));
                        var CSPDetails = cl.GetUserCSPDetailByID(Convert.ToInt32(userData.UserSourceId));
                        Session["CSPID"] = CSPDetails.CSPId;
                        if (!String.IsNullOrEmpty(CSPDetails.PassportSizePhotoName))
                        {


                            picpath = "CSP" + "\\" + userData.UserSourceId.ToString() + "\\" + "PassportSizePhoto" + "\\" + CSPDetails.PassportSizePhotoName;
                            //    picpath = CSPFilePath + "\\" + userData.UserSourceId.ToString() + "\\" + "PassportSizePhoto" + "\\" + CSPDetails.PassportSizePhotoName;
                        }
                        else
                        {
                            picpath = "NoImage";
                        }
                        Session["ProfileImage"] = picpath;
                    }
                    else
                    {
                        UserLogic ulogic = new UserLogic();
                        if (userData.UserSourceId > 0)
                        {
                            var userdetails = ulogic.GetUserDetailsById(Convert.ToInt32(userData.UserSourceId));
                            if (!String.IsNullOrEmpty(userdetails.PassportSizePic))
                            {

                                picpath = "Users" + "\\" + userData.UserType + "\\" + userData.UserSourceId.ToString() + "\\" + "UserPassportSizePhoto" + "\\" + userdetails.PassportSizePic;
                                // picpath = UserFilePath + "\\" + userData.UserId.ToString() + "\\" + "PassportSizePhoto" + "\\" + userdetails.PassportSizePic;
                            }
                            else
                            {
                                picpath = "NoImage";
                            }
                            Session["ProfileImage"] = picpath;
                        }
                        else
                        {
                            picpath = "NoImage";
                            Session["ProfileImage"] = picpath;
                        }

                    }
                    Session["UserName"] = userData.UserName;
                    Session["UserId"] = userData.UserId;
                    Session["UserSourceId"] = userData.UserSourceId;
                    Session["UserRoleName"] = roleMasterData.Name;


                    tblUserLoginLog objtblUserLoginLog = new tblUserLoginLog();
                    //objtblUserLoginLog.UserId = userData.UserId;
                    objtblUserLoginLog.UserId = userData.UserSourceId;
                    objtblUserLoginLog.UserName = userData.UserName;
                    objtblUserLoginLog.UserType = userData.UserType;
                    objtblUserLoginLog.LoginTimeStamp = DateTime.Now;
                    objtblUserLoginLog.HostName = Dns.GetHostName();
                    objtblUserLoginLog.IpAddress = Dns.GetHostEntry(Dns.GetHostName()).AddressList[0].ToString();
                    objUserLoginLogLogic.InsertUserLoginLog(objtblUserLoginLog);

                    if (!userData.IsPasswordReset == true || userData.IsPasswordReset is null)
                    {
                        return RedirectToAction("ResetPassword");
                    }

                    //Admin and Super Admin
                    if (userData.UserType == 2 || userData.UserType == 1)
                    {
                        return RedirectToAction("Dashboard", "Admin");
                    }
                    //CSP
                    else if (userData.UserType == 3)
                    {
                        return RedirectToAction("Dashboard", "CSP");
                    }
                    //User
                    else if (userData.UserType == 4)
                    {
                        //return RedirectToAction("About");

                        return RedirectToAction("Dashboard", "Admin");
                    }


                    else
                    {
                        return RedirectToAction("Dashboard", "CSP");
                    }

                
                }

            }
            return View();
        }

        public ActionResult Logout()
        {
            //Session["CSPName"] = null;
            //Session["UserName"] = null;
            //Session["EMailID"] = null;
            //Session["UserID"] = null;
            HttpContext.Session.Clear();
            return RedirectToAction("Login");
        }

        public ActionResult ResetPassword()
        {
            ResetPasswordViewModel objResetPasswordViewModel = new ResetPasswordViewModel();
            objResetPasswordViewModel.UserName = (string)Session["UserName"];
            objResetPasswordViewModel.UserType = (int)Session["UserTypeId"];
            objResetPasswordViewModel.UserID = (int)Session["UserId"];        
            return View(objResetPasswordViewModel);
        }

        [HttpPost]
        public ActionResult ResetPassword(ResetPasswordViewModel ResetPasswordViewModel)
        {
          
            if (ModelState.IsValid)
            {
                UserLogic objUserLogic = new UserLogic();
                objUserLogic.ResetPasswordLogic(ResetPasswordViewModel);

                ////Admin and Super Admin
                //if (ResetPasswordViewModel.UserType == 2 || ResetPasswordViewModel.UserType == 1)
                //{
                //    return RedirectToAction("Dashboard", "Admin");
                //}
                ////CSP
                //else if (ResetPasswordViewModel.UserType == 3)
                //{
                //    return RedirectToAction("Dashboard", "CSP");
                //}
                ////User
                //else if (ResetPasswordViewModel.UserType == 4)
                //{
                //    return RedirectToAction("About");
                //}
                string message = "Password reset successfully! Login with new credentials.";
                return RedirectToAction("Login","Home", new { message } );
            }
            return View();
        }
    
    public ActionResult Test()
        {
            return View();
        }
        public ActionResult Register()
        {
            CountryLogic cl = new CountryLogic();
            var countrylist = cl.GetAllCountry();
            ViewBag.AllCountries = countrylist;
            return View();
        }
        public string CheckDirectory(string path, string filetype, HttpPostedFileBase postedfile)
        {
            string fullpath = string.Empty;
            fullpath = Path.Combine(path, filetype);
            if (!Directory.Exists(fullpath))
            {
                Directory.CreateDirectory(fullpath);
            }
            fullpath = fullpath + "\\" + Path.GetFileName(postedfile.FileName);
            return fullpath;
        }
        [HttpPost]
        public ActionResult Register(UsersModel user)
        {
            string fpath = string.Empty;
            UserLogic userLogic = new UserLogic();
            long userID = userLogic.InsertUserDetails(user);
            string path = Path.Combine(RootFilePath, userID.ToString());
            if (user.PassportPic != null)
            {
                fpath = CheckDirectory(path, "PassportPic", user.PassportPic);
                user.PassportPic.SaveAs(fpath);
            }
            if (user.PANCardPic != null)
            {
                fpath = CheckDirectory(path, "PANCardPic", user.PANCardPic);
                user.PANCardPic.SaveAs(fpath);
            }
            if (user.VoterIDPic != null)
            {
                fpath = CheckDirectory(path, "VoterIDPic", user.VoterIDPic);
                user.VoterIDPic.SaveAs(fpath);
            }
            if (user.AAdharCardPic != null)
            {
                fpath = CheckDirectory(path, "AAdharCardPic", user.AAdharCardPic);
                user.AAdharCardPic.SaveAs(fpath);
            }
            if (user.FileEducationProof != null)
            {
                fpath = CheckDirectory(path, "FileEducationProof", user.FileEducationProof);
                user.FileEducationProof.SaveAs(fpath);
            }
            if (user.IIBFCertificatePic != null)
            {
                fpath = CheckDirectory(path, "IIBFCertificatePic", user.IIBFCertificatePic);
                user.IIBFCertificatePic.SaveAs(fpath);
            }
            TempData["Message"] = "Record submitted successfully.";
            return RedirectToAction("Register");
        }
        public JsonResult BindStates(long country_id)
        {
            StateLogic sl = new StateLogic();
            IList<SelectListItem> statelist = new List<SelectListItem>();
            var slist = sl.GetAllStatesByCid(country_id);
            foreach (var dr in slist)
            {
                statelist.Add(new SelectListItem { Text = dr.Name.ToString(), Value = dr.StateId.ToString().ToString() });
            }
            return Json(statelist, JsonRequestBehavior.AllowGet);
        }
        public JsonResult BindCity(long state_id)
        {
            CityLogic sl = new CityLogic();
            IList<SelectListItem> citylist = new List<SelectListItem>();
            var clist = sl.GetAllCitiesByStateID(state_id);
            foreach (var dr in clist)
            {
                citylist.Add(new SelectListItem { Text = dr.Name.ToString(), Value = dr.CityId.ToString().ToString() });
            }
            return Json(citylist, JsonRequestBehavior.AllowGet);
        }
        public ActionResult TransactionRequest()
        {
            return View();
        }
        public ActionResult _Deposite()
        {
            //var model = ReplaceYourModelForBillTotalAmountViewHere();
            //return PartialView("Budgeting/_BillTotalAmount", model);
            return PartialView();
        }
        public ActionResult _Withdraw()
        {
            //var model = ReplaceYourModelForBillTotalAmountViewHere();
            //return PartialView("Budgeting/_BillTotalAmount", model);
            return PartialView();
        }
        public ActionResult TechSupportRequest()
        {
            TechSupportProblemLogic cl = new TechSupportProblemLogic();
            //var ProblemList = cl.GetAllTechSupportProblems();
            //ViewBag.ProblemList = ProblemList;
            return View();
        }
        //[HttpPost]
        //public ActionResult TechSupportRequest(TechSupportRequestModel model)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        TechSupportRequestLogic userLogic = new TechSupportRequestLogic();
        //        userLogic.InsertTechSupportRequest(model);
        //        TempData["Message"] = "Record submitted successfully.";
        //        return RedirectToAction("TechSupportRequest");
        //    }
        //    else
        //    {
        //        return RedirectToAction("TechSupportRequest");
        //    }
        //}
    
        //[HttpPost]
        //public ActionResult AddDepositDetails(Deposit deposit) //Added by Aditya//
        //{
        //    UserLogic ul = new UserLogic();
        //    if (Request.Files.Count > 0)
        //    {
        //        try
        //        {
        //            HttpFileCollectionBase files = Request.Files;
        //            for (int i = 0; i < files.Count; i++)
        //            {
        //                HttpPostedFileBase file = files[i];
        //                string fname;
        //                if (Request.Browser.Browser.ToUpper() == "IE" || Request.Browser.Browser.ToUpper() == "INTERNETEXPLORER")
        //                {
        //                    string[] testfiles = file.FileName.Split(new char[] { '\\' });
        //                    fname = testfiles[testfiles.Length - 1];
        //                }
        //                else
        //                {
        //                    fname = file.FileName;
        //                }
        //                string fpath = string.Empty;
        //                string path = Path.Combine(RootFilePath, "Receipt");
        //                fpath = CheckDirectory(path, "DepositReceipt", file);
        //                file.SaveAs(fpath);
        //                deposit.FileName = fname;
        //                ul.AddDepositDetails(deposit, Convert.ToInt32(Session["UserID"]));
        //            }
        //            return Json("Data Inserted Successfully!");
        //        }
        //        catch (Exception ex)
        //        {
        //            return Json("Error occurred. Error details: " + ex.Message);
        //        }
        //    }
        //    else
        //    {
        //        return Json("something went wrong");
        //    }
        //}
        //[HttpPost]
        //public ActionResult AddWithDrawDetails(Withdraw withdraw)//Added by Aditya//
        //{
        //    UserLogic ul = new UserLogic();
        //    try
        //    {
        //        ul.AddWithdrawDetails(withdraw, Convert.ToInt32(Session["UserID"]));
        //        return Json("Data Inserted Successfully!");
        //    }
        //    catch (Exception ex)
        //    {
        //        return Json("Error occurred. Error details: " + ex.Message);
        //    }

        //}
    }
}
