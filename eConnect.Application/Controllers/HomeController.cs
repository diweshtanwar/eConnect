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

namespace eConnect.Application.Controllers
{
    public class HomeController : Controller
    {
        string RootFilePath = System.Web.HttpContext.Current.Server.MapPath(Convert.ToString(ConfigurationManager.AppSettings["RootFilePath"]));
        private eConnectAppEntities db = new eConnectAppEntities();

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }
        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        [HttpGet]
        public ActionResult Login()
        {
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
                if ( userData== null)
                {
                    ModelState.AddModelError("", "Invalid login attempt , your username and password are incorrect - please try again..");
                  
                }           
                else
                {
                    UserLoginLogLogic objUserLoginLogLogic = new UserLoginLogLogic();
                    objUserLoginLogLogic.GetLastLoginDetailsByUserID(userData.UserId);
                   Session["LastLoginDetails"] = objUserLoginLogLogic.GetLastLoginDetailsByUserID(userData.UserId);              
                   Session["UserTypeId"] = userData.UserType;
                    Session["UserName"] = userData.UserName;
                    Session["UserId"] = userData.UserId;
                    Session["UserSourceId"] = userData.UserSourceId;
                    tblUserLoginLog objtblUserLoginLog = new tblUserLoginLog();
                    objtblUserLoginLog.UserId = userData.UserId;
                    objtblUserLoginLog.LoginTimeStamp = DateTime.Now;
                    objtblUserLoginLog.HostName = Dns.GetHostName();
                    objtblUserLoginLog.IpAddress= Dns.GetHostEntry(Dns.GetHostName()).AddressList[0].ToString();                  
                    objUserLoginLogLogic.InsertUserLoginLog(objtblUserLoginLog);                   
                    return RedirectToAction("About");
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
        [HttpPost]
        public ActionResult TechSupportRequest(TechSupportRequestModel model)
        {
            if (ModelState.IsValid)
            {
                TechSupportRequestLogic userLogic = new TechSupportRequestLogic();
                userLogic.InsertTechSupportRequest(model);
                TempData["Message"] = "Record submitted successfully.";
                return RedirectToAction("TechSupportRequest");
            }
            else
            {
                return RedirectToAction("TechSupportRequest");
            }
        }
    
        [HttpPost]
        public ActionResult AddDepositDetails(Deposit deposit) //Added by Aditya//
        {
            UserLogic ul = new UserLogic();
            if (Request.Files.Count > 0)
            {
                try
                {
                    HttpFileCollectionBase files = Request.Files;
                    for (int i = 0; i < files.Count; i++)
                    {
                        HttpPostedFileBase file = files[i];
                        string fname;
                        if (Request.Browser.Browser.ToUpper() == "IE" || Request.Browser.Browser.ToUpper() == "INTERNETEXPLORER")
                        {
                            string[] testfiles = file.FileName.Split(new char[] { '\\' });
                            fname = testfiles[testfiles.Length - 1];
                        }
                        else
                        {
                            fname = file.FileName;
                        }
                        string fpath = string.Empty;
                        string path = Path.Combine(RootFilePath, "Receipt");
                        fpath = CheckDirectory(path, "DepositReceipt", file);
                        file.SaveAs(fpath);
                        deposit.FileName = fname;
                        ul.AddDepositDetails(deposit, Convert.ToInt32(Session["UserID"]));
                    }
                    return Json("Data Inserted Successfully!");
                }
                catch (Exception ex)
                {
                    return Json("Error occurred. Error details: " + ex.Message);
                }
            }
            else
            {
                return Json("something went wrong");
            }
        }
        [HttpPost]
        public ActionResult AddWithDrawDetails(Withdraw withdraw)//Added by Aditya//
        {
            UserLogic ul = new UserLogic();
            try
            {
                ul.AddWithdrawDetails(withdraw, Convert.ToInt32(Session["UserID"]));
                return Json("Data Inserted Successfully!");
            }
            catch (Exception ex)
            {
                return Json("Error occurred. Error details: " + ex.Message);
            }

        }
    }
}
