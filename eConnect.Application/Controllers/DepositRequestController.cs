using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using eConnect.DataAccess;
using eConnect.Model;
using eConnect.Logic;
using System.IO;
using System.Configuration;
using eConnect.Application.Models;
using NLog;
namespace eConnect.Application.Controllers
{
    public class DepositRequestController : Controller
    {

        private static Logger logger = LogManager.GetLogger("EConnectLogRules");
        string DepositStartTime, DepositEndTime = string.Empty;
        string UserFilePath = System.Web.HttpContext.Current.Server.MapPath(Convert.ToString(ConfigurationManager.AppSettings["DepositFilePath"]));
        string Email = ConfigurationManager.AppSettings["ToEmailid"].ToString();
        List<SelectListItem> RequestType = new List<SelectListItem>()
            {
                new SelectListItem { Text = "Select RequestType", Value = "" },
                new SelectListItem { Text = "Withdrawal", Value = "1" },
                new SelectListItem { Text = "Deposit", Value = "2" },

            };
        List<SelectListItem> Status = new List<SelectListItem>()
            {

                new SelectListItem { Text = "Select Status", Value = "" },
                new SelectListItem { Text = "In-Progress", Value = "2" },
                 new SelectListItem { Text = "Not Started", Value = "5" },
                new SelectListItem { Text = "Completed", Value = "3" },

            };
        // GET: DepositRequest
        public ActionResult Index()

        {

            RaiseRequestLogic raiseRequest = new RaiseRequestLogic();
            ViewBag.RequestType = RequestType;
            var tblDepositDetails = raiseRequest.GetDepositDetailsByCSPID(Convert.ToInt32(Session["CSPID"].ToString()));
            // var tblDepositDetails = raiseRequest.GetDepositDetails();
            bool flag = Convert.ToBoolean(TempData["flag"]);
            if (flag == true)
            {
                tblDepositDetails = TempData["searchdata"] as List<tblDepositRequest>;
            }
            return View(tblDepositDetails.ToList().OrderByDescending(x => x.DepositeRequestId));
        }
        public ActionResult IndexSearch(string Requestid, string RequestType, string Requesteddte, string Completiondte)
        {
            int Reqid = 0, ReqType = 0;
            RaiseRequestLogic raiseRequest = new RaiseRequestLogic();
            ViewBag.RequestType = RequestType;
            if (Requestid == "")
            {
                Reqid = 0;
            }
            else
            {
                Reqid = Convert.ToInt32(Requestid);
            }
            if (RequestType == "")
            {
                ReqType = 0;
            }
            else
            {
                ReqType = Convert.ToInt32(RequestType);
            }
            var tblDepositDetails = raiseRequest.GetDepositDetailsSearch(Reqid, ReqType, Requesteddte, Completiondte);
            TempData["searchdata"] = tblDepositDetails.ToList();
            TempData["flag"] = true;
            return RedirectToAction("Index");
        }
        public ActionResult Create()
        {
            try
            {
                ViewBag.RequestType = RequestType;
                ViewBag.Status = Status;
            }
            catch (Exception ex)
            {
                logger.Error("Create Deposit Request" +" " +ex.Message);

            }
            return View();
        }

        public bool CheckWindow()
        {
            WindowTimingLogic OtrLogic = new WindowTimingLogic();
            var dt = OtrLogic.GetCurrentActiveWindow();
            if (dt.Count > 0)
            {
                DateTime dtStart = Convert.ToDateTime(dt[0].StartTime);
                DateTime dtEnd = Convert.ToDateTime(dt[0].EndTime);
                DateTime current = DateTime.Now;
                DepositStartTime = dt[0].StartTime;
                DepositEndTime = dt[0].EndTime;
                if (current.Ticks > dtStart.Ticks && current.Ticks < dtEnd.Ticks)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            else
            {
                return true;
            }

        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Deposit deposit)
        {
            RaiseRequestLogic raiseRequest = new RaiseRequestLogic();
            ViewBag.RequestType = RequestType;
            ViewBag.Status = Status;
            if (ModelState.IsValid)
            {
                int UserId = Convert.ToInt32(Session["CSPID"]);
                //Convert.ToInt32(Session["UserID"]);
                bool chktiming = CheckWindow();

                if (chktiming == true)
                {
                    long UserID = raiseRequest.AddDepositDetails(deposit, UserId);
                    string path = Path.Combine(UserFilePath, UserID.ToString());
                    if (deposit.Reciept != null)
                    {
                        string fpath = CheckDirectory(path, "DepositReceipt", deposit.Reciept);
                        deposit.Reciept.SaveAs(fpath);
                    }
                    //**EmailNotification**//
                    UserCSPDetailLogic objUserCSPDetailLogic = new UserCSPDetailLogic();
                    UserCSPDetail UserCSPDetail = objUserCSPDetailLogic.GetUserCSPDetailByID(Convert.ToInt32(UserId));
                    EmailNotification emailNotification = new EmailNotification();
                    emailNotification.SendEmail(Email, 2, UserCSPDetail, deposit.Amount.ToString(), deposit.BankDepositDate, "", "", "");
                    //*******************//
                }
                else
                {
                    TempData["TimingWindowMessage"] = "Deposit Request Window has been closed.Please raise the request between " + DepositStartTime + " to " + DepositEndTime;
                    return View(deposit);
                }
                return RedirectToAction("Index");
            }


            return View(deposit);
        }

        public ActionResult Edit(int? id)
        {
            //Deposit objDeposit = new Deposit();
            //return View(objDeposit);
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            RaiseRequestLogic raiseRequest = new RaiseRequestLogic();
            Deposit objDeposit = raiseRequest.GetDepositDetailByID((int)id);
            Session["Imagereceipt"] = objDeposit.Recieptpic;
            if (objDeposit == null)
            {
                return HttpNotFound();
            }

            var ReqTypes = new[]
             {
                new SelectListItem(){Value = "1", Text= "Withdrawal"},
                new SelectListItem(){Value = "2", Text= "Deposit"},
            };

            var selectedRequestType = ReqTypes.FirstOrDefault(d => d.Value == objDeposit.RequestType.ToString());
            if (selectedRequestType != null)
                selectedRequestType.Selected = true;
            ViewBag.RequestType = ReqTypes;

            var Status = new[]
            {

                new SelectListItem { Text = "In-Progress", Value = "2" },
                new SelectListItem { Text = "Not Started", Value = "5" },
                new SelectListItem { Text = "Completed", Value = "3" },
            };
            var selectedStatus = Status.FirstOrDefault(d => d.Value == objDeposit.Status.ToString());
            if (selectedStatus != null)
                selectedStatus.Selected = true;
            ViewBag.EditStatus = Status;
            return View(objDeposit);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Deposit deposit)
        {
            string Image = "";
            if (deposit.Reciept == null)
            {
                Image = Session["Imagereceipt"].ToString();
                deposit.Recieptpic = Image;
                ModelState.Remove("Reciept");
            }
            if (ModelState.IsValid)
            {

                string fpath = string.Empty;
                RaiseRequestLogic raiseRequestLogic = new RaiseRequestLogic();
                raiseRequestLogic.UpdateDepositDetail(deposit);
                string path = Path.Combine(UserFilePath, deposit.Id.ToString());
                if (deposit.Reciept != null)
                {
                    string fppath = CheckDirectory(path, "DepositReceipt", deposit.Reciept);
                    deposit.Reciept.SaveAs(fppath);
                }

                TempData["Message"] = "Record submitted successfully";
                return RedirectToAction("Index");
            }
            return View(deposit);
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

        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            RaiseRequestLogic raiseRequest = new RaiseRequestLogic();
            Deposit objDeposit = raiseRequest.GetDepositDetailByID((int)id);
            if (objDeposit == null)
            {
                return HttpNotFound();
            }
            var RequestTypes = new[]
            {
                new SelectListItem(){Value = "1", Text= "Withdrawal"},
                new SelectListItem(){Value = "2", Text= "Deposit"},
            };

            var selectedRequestType = RequestTypes.FirstOrDefault(d => d.Value == objDeposit.RequestType.ToString());
            if (selectedRequestType != null)
                selectedRequestType.Selected = true;
            ViewBag.RequestType = RequestTypes;

            var Status = new[]
          {

                 new SelectListItem { Text = "Select Status", Value = "" },
                  new SelectListItem { Text = "Open", Value = "1" },
                 new SelectListItem { Text = "Close", Value = "3" },
                   new SelectListItem { Text = "Rejected", Value = "7" },

            };
            var selectedStatus = Status.FirstOrDefault(d => d.Value == objDeposit.CurrentStatus.ToString());
            if (selectedStatus != null)
                selectedStatus.Selected = true;
            ViewBag.EditedStatus = Status;

            return View(objDeposit);

        }

        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            RaiseRequestLogic raiseRequest = new RaiseRequestLogic();
            Deposit objDeposit = raiseRequest.GetDepositDetailByID((int)id);
            if (objDeposit == null)
            {
                return HttpNotFound();
            }

            var RequestTypes = new[]
             {
                new SelectListItem(){Value = "1", Text= "Withdrawal"},
                new SelectListItem(){Value = "2", Text= "Deposit"},
            };

            var selectedRequestType = RequestTypes.FirstOrDefault(d => d.Value == objDeposit.RequestType.ToString());
            if (selectedRequestType != null)
                selectedRequestType.Selected = true;
            ViewBag.RequestType = RequestTypes;

            var Status = new[]
            {

                new SelectListItem { Text = "In-Progress", Value = "2" },
                new SelectListItem { Text = "Not Started", Value = "5" },
                new SelectListItem { Text = "Completed", Value = "3" },
            };
            var selectedStatus = Status.FirstOrDefault(d => d.Value == objDeposit.Status.ToString());
            if (selectedStatus != null)
                selectedStatus.Selected = true;
            ViewBag.EditStatus = Status;
            return View(objDeposit);
        }


        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            RaiseRequestLogic raiseRequest = new RaiseRequestLogic();
            raiseRequest.DeleteDepositDetails(id);
            return RedirectToAction("Index");
        }
    }
}