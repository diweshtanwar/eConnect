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

namespace eConnect.Application.Controllers
{
    public class WithdrawRequestController : Controller
    {
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
        public ActionResult Index()
        {
            RaiseRequestLogic raiseRequest = new RaiseRequestLogic();
            ViewBag.RequestType = RequestType;
            // var tblWithdrawDetails = raiseRequest.GetWithdrawDetails();
            var tblWithdrawDetails = raiseRequest.GetWithdrawDetailsByCSPID(Convert.ToInt32(Session["CSPID"].ToString()));
            
            bool flag = Convert.ToBoolean(TempData["flag"]);
            if (flag == true)
            {
                tblWithdrawDetails = TempData["searchdata"] as List<tblWithdrawalRequest>;
            }
            return View(tblWithdrawDetails.ToList());
           
        }

        public ActionResult IndexSearch(string Requestid, string RequestType, string Requesteddte, string Completiondte,string Account)
        {
            int Reqid = 0, ReqType = 0,Acc=0;
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
            if (Account == "")
            {
                Acc = 0;
            }
            else
            {
                Acc = Convert.ToInt32(Account);
            }
            var tblWithdrawDetails = raiseRequest.GetWithdrawDetailsSearch(Reqid, ReqType, Requesteddte, Completiondte,Acc);
            TempData["searchdata"] = tblWithdrawDetails.ToList();
            TempData["flag"] = true;
            return RedirectToAction("Index");
        }
        public ActionResult Create()
        {
            Withdraw withdraw = new Withdraw();
            string UserId = Session["CSPID"].ToString();
            RaiseRequestLogic raiseRequestdetals = new RaiseRequestLogic();
            UserCSPDetailLogic objUserCSPDetailLogic = new UserCSPDetailLogic();
            UserCSPDetail UserCSPDetail = objUserCSPDetailLogic.GetUserCSPDetailByID(Convert.ToInt32(UserId));
            //string AccountNumber = raiseRequestdetals.WithdrawAccNumber(Convert.ToInt32(UserId));
            withdraw.Account = UserCSPDetail.BankAccount;
            ViewBag.RequestType = RequestType;
            ViewBag.Status = Status;
            return View(withdraw);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Withdraw withdraw)
        {
            RaiseRequestLogic raiseRequest = new RaiseRequestLogic();
            ViewBag.RequestType = RequestType;
            ViewBag.Status = Status;
            if (ModelState.IsValid)
            {
                string UserId = Session["CSPID"].ToString();
                long UserID = raiseRequest.AddWithdrawDetails(withdraw, Convert.ToInt32(UserId));
               
                return RedirectToAction("Index");
            }
            return View(withdraw);
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
            Withdraw objWithdraw = raiseRequest.GetWithdrawDetailByID((int)id);
          
            if (objWithdraw == null)
            {
                return HttpNotFound();
            }

            var ReqType = new[]
             {
                new SelectListItem(){Value = "1", Text= "Withdrawal"},
                new SelectListItem(){Value = "2", Text= "Deposit"},
            };

            var selectedRequestType = ReqType.FirstOrDefault(d => d.Value == objWithdraw.RequestType.ToString());
            if (selectedRequestType != null)
                selectedRequestType.Selected = true;
            ViewBag.RequestTypes = ReqType;

            var Status = new[]
            {

                new SelectListItem { Text = "In-Progress", Value = "2" },
                new SelectListItem { Text = "Not Started", Value = "5" },
                new SelectListItem { Text = "Completed", Value = "3" },
            };
            var selectedStatus = Status.FirstOrDefault(d => d.Value == objWithdraw.Status.ToString());
            if (selectedStatus != null)
                selectedStatus.Selected = true;
            ViewBag.EditStatus = Status;
            return View(objWithdraw);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Withdraw withdraw)
        {
           
            if (ModelState.IsValid)
            {

                string fpath = string.Empty;
                RaiseRequestLogic raiseRequestLogic = new RaiseRequestLogic();
                raiseRequestLogic.UpdateWithdrawDetail(withdraw);
                TempData["Message"] = "Record submitted successfully";
                return RedirectToAction("Index");
            }
            return View(withdraw);
        }

        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            RaiseRequestLogic raiseRequest = new RaiseRequestLogic();
            Withdraw withdraw = raiseRequest.GetWithdrawDetailByID((int)id);
            if (withdraw == null)
            {
                return HttpNotFound();
            }
            var ReqType = new[]
               {
                new SelectListItem(){Value = "1", Text= "Withdrawal"},
                new SelectListItem(){Value = "2", Text= "Deposit"},
            };

            var selectedRequestType = ReqType.FirstOrDefault(d => d.Value == withdraw.RequestType.ToString());
            if (selectedRequestType != null)
                selectedRequestType.Selected = true;
            ViewBag.RequestTypes = ReqType;

            var Status = new[]
          {

                 new SelectListItem { Text = "Select Status", Value = "" },
                  new SelectListItem { Text = "Open", Value = "1" },
                 new SelectListItem { Text = "Close", Value = "3" },

            };
            var selectedStatus = Status.FirstOrDefault(d => d.Value == withdraw.CurrentStatus.ToString());
            if (selectedStatus != null)
                selectedStatus.Selected = true;
            ViewBag.EditedStatus = Status;
            return View(withdraw);

        }

        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            RaiseRequestLogic raiseRequest = new RaiseRequestLogic();
            Withdraw withdraw = raiseRequest.GetWithdrawDetailByID((int)id);
            if (withdraw == null)
            {
                return HttpNotFound();
            }
            var ReqType = new[]
               {
                new SelectListItem(){Value = "1", Text= "Withdrawal"},
                new SelectListItem(){Value = "2", Text= "Deposit"},
            };

            var selectedRequestType = ReqType.FirstOrDefault(d => d.Value == withdraw.RequestType.ToString());
            if (selectedRequestType != null)
                selectedRequestType.Selected = true;
            ViewBag.RequestTypes = ReqType;

            var Status = new[]
            {

                 new SelectListItem { Text = "In-Progress", Value = "2" },
                new SelectListItem { Text = "Not Started", Value = "5" },
                new SelectListItem { Text = "Completed", Value = "3" },
            };
            var selectedStatus = Status.FirstOrDefault(d => d.Value == withdraw.Status.ToString());
            if (selectedStatus != null)
                selectedStatus.Selected = true;
            ViewBag.EditStatus = Status;
            return View(withdraw);
        }

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            RaiseRequestLogic raiseRequest = new RaiseRequestLogic();
            raiseRequest.DeleteWithdrawDetails(id);
            return RedirectToAction("Index");
        }
    }
}