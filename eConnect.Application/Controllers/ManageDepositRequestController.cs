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
    public class ManageDepositRequestController : Controller
    {
        // GET: ManageWithdrawalRequest
        string ReceiptPath = Convert.ToString(ConfigurationManager.AppSettings["DepositFilePath"]);
        List<SelectListItem> Status = new List<SelectListItem>()
            {
                //new SelectListItem { Text = "Select Status", Value = "" },
                new SelectListItem { Text = "Open", Value = "1" },
                 new SelectListItem { Text = "All", Value = "" },
                 new SelectListItem { Text = "Close", Value = "3" },
                 new SelectListItem { Text = "Rejected", Value = "7" }
            };
        List<SelectListItem> City = new List<SelectListItem>()
            {

                new SelectListItem { Text = "Select City", Value = "" },
            };
        RaiseRequestLogic raiseRequest = new RaiseRequestLogic();
        public ActionResult Index()
        {
            BranchCodeLogic objBranchCodeLogic = new BranchCodeLogic();
            CategoryLogic objCategoryLogic = new CategoryLogic();
            UserLogic objUserDetailLogic = new UserLogic();
            StatusLogic objStatusLogic = new StatusLogic();
            StateLogic objStateLogic = new StateLogic();
            CityLogic objCityLogic = new CityLogic();
            ViewBag.State = new SelectList(objStateLogic.GetAllStates(), "StateId", "Name");
            ViewBag.City = City;
            ViewBag.Status = Status;
            ViewBag.BranchCode = new SelectList(objBranchCodeLogic.GetAllBranchCode(), "BranchCode", "BranchCode");
            ViewBag.Category = new SelectList(objCategoryLogic.GetAllCategory(), "Category", "Category");

            var tblDepositDetails = raiseRequest.GetManageDepositDetails(20, 1);
            bool flag = Convert.ToBoolean(TempData["flag"]);
            if (flag == true)
            {
                ViewBag.Record = Convert.ToInt32(TempData["Record"]);
                tblDepositDetails = TempData["searchdataManagedeposit"] as List<sp_GetManageDepositRequestDetails_Result>;
            }
            else
            {
                ViewBag.Record = 20;
            }
            tblDepositDetails = tblDepositDetails.Where(w => w.DepositeRequestId == w.DepositeRequestId).Select(w => { w.ReceiptSource = ReceiptPath.Replace("~", "") + w.DepositeRequestId + "\\DepositReceipt\\" + w.ReceiptSource; return w; }).ToList();

            //ViewBag.Opencount = raiseRequest.GetManageDepositDetails().Count(x => x.Status == 1);//Open
            ////ViewBag.InProgresscount = tblDepositDetails.Count(x => x.Status == 2);//In-Progres
            //ViewBag.Closecount = raiseRequest.GetManageDepositDetails().Count(x => x.Status == 3);//Close
            //ViewBag.Rejectcount = raiseRequest.GetManageDepositDetails().Count(x => x.Status == 7);//Reject

            // return View(tblDepositDetails.ToList().OrderByDescending(x => x.DepositeRequestId));
            return View(tblDepositDetails.ToList());
        }
        public ActionResult IndexSearch(string Requestid, string CspName, string CspID, string State, string City, string Status, string Requesteddte, string Completiondte, string BranchCode, string Category, string Depositdte, string Record)
        {
            int Cid = 0, Sid = 0, Cityid = 0, Statusid = 0, Bcode = 0, CategoryId = 0;
            string Reqid = "";
            if (CspID == "")
            {
                Reqid = "0";
            }
            else
            {
                Reqid = CspID;
            }
            //if (BranchCode == "" || BranchCode == "Select BranchCode")
            //{
            //    Bcode = 0;
            //}
            //else
            //{
            //    Bcode = Convert.ToInt32(BranchCode);
            //}
            //if (Category == "" || Category == "Select Category")
            //{
            //    CategoryId = 0;
            //}
            //else
            //{
            //    CategoryId = Convert.ToInt32(Category);
            //}
            //if (CspID == "")
            //{
            //    Cid = 0;
            //}
            //else
            //{
            //    Cid = Convert.ToInt32(CspID);
            //}
            if (State == "")
            {
                Sid = 0;
            }
            else
            {
                Sid = Convert.ToInt32(State);
            }
            if (City == "" || City == "---Select---")
            {
                Cityid = 0;
            }
            else
            {
                Cityid = Convert.ToInt32(City);
            }
            if (Status == "")
            {
                Statusid = 0;
            }
            else
            {
                Statusid = Convert.ToInt32(Status);
            }
            var tblManageDepositDetails = raiseRequest.GetManageDepositDetailsSearch(Reqid, CspName, Cid, Sid, Cityid, Statusid, Requesteddte, Completiondte, BranchCode, Category, Depositdte, Convert.ToInt32(Record));
            TempData["searchdataManagedeposit"] = tblManageDepositDetails.ToList();
            TempData["flag"] = true;
            Session["status"] = Statusid;
            TempData["Record"] = Convert.ToInt32(Record);
            return RedirectToAction("Index");
        }

        public ActionResult Edit(int? id)
        {

            RaiseRequestLogic raiseRequestdetals = new RaiseRequestLogic();
            ManageDeposit objMDeposit = raiseRequestdetals.GetManageDepositDetailByID((int)id);
            var Status = new[]
            {

                 new SelectListItem { Text = "Select Status", Value = "" },
                  new SelectListItem { Text = "Open", Value = "1" },
                 new SelectListItem { Text = "Close", Value = "3" },
                 new SelectListItem { Text = "Rejected", Value = "7" }

            };
            var selectedStatus = Status.FirstOrDefault(d => d.Value == objMDeposit.CurrentStatus.ToString());
            if (selectedStatus != null)
                selectedStatus.Selected = true;
            ViewBag.EditedStatus = Status;
            return View(objMDeposit);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(ManageDeposit deposit)
        {
            RaiseRequestLogic raiseRequestLogic = new RaiseRequestLogic();
            raiseRequestLogic.UpdateManageDepositDetail(deposit);
            TempData["Message"] = "Record submitted successfully";
            return RedirectToAction("Index");
        }
        public ActionResult Details(int? id)
        {
            RaiseRequestLogic raiseRequestdetals = new RaiseRequestLogic();
            ManageDeposit objMDeposit = raiseRequestdetals.GetManageDepositDetailByID((int)id);
            //raiseRequestdetals.GetManageDepositDetailByID((int)id);
            var Status = new[]
            {

                 new SelectListItem { Text = "Select Status", Value = "" },
                  new SelectListItem { Text = "Open", Value = "1" },
                 new SelectListItem { Text = "Close", Value = "3" },
                 new SelectListItem { Text = "Rejected", Value = "7" }

            };
            var selectedStatus = Status.FirstOrDefault(d => d.Value == objMDeposit.CurrentStatus.ToString());
            if (selectedStatus != null)
                selectedStatus.Selected = true;
            ViewBag.EditedStatus = Status;
            return View(objMDeposit);
        }




        [HttpPost]
        //*******************For Deposit/Withdraw/Techsupport Status Update**************************************//
        public JsonResult UpdateRequestStatus(int RequestId, string status, string Comments, string RequestType)
        {
            RaiseRequestLogic requestLogic = new RaiseRequestLogic();
            try
            {
                requestLogic.UpdateRequestDetailsStatus(RequestId, status, Comments, RequestType);
                return Json("", JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(ex.Message, JsonRequestBehavior.AllowGet);
            }
        }
        [HttpPost]
        //*******************For Configure/Make/Authorize Status Update**************************************//
        public JsonResult UpdateConfigure_Make_Authorize(int RequestId, string Configure, string Make, string Authorize)
        {
            RaiseRequestLogic requestLogic = new RaiseRequestLogic();
            try
            {
                requestLogic.UpdateConfigure_Make_AuthorizeStatus(RequestId, Configure, Make, Authorize);
                return Json("", JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(ex.Message, JsonRequestBehavior.AllowGet);
            }
        }

        [HttpPost]
        //*******************For Configure/Make/Authorize Status Update**************************************//
        public JsonResult UpdateConfigure_Make_Authorize_AutAmount(int RequestId, string Configure, string Make, string Authorize, decimal AutAmount)
        {
            RaiseRequestLogic requestLogic = new RaiseRequestLogic();
            try
            {
                requestLogic.UpdateConfigure_Make_AuthorizeStatus_AutAmount(RequestId, Configure, Make, Authorize, AutAmount);
                return Json("", JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(ex.Message, JsonRequestBehavior.AllowGet);
            }
        }
    }
}