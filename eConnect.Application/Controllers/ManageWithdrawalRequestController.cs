﻿using System;
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
    public class ManageWithdrawalRequestController : Controller
    {
        // GET: ManageWithdrawalRequest
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

            var tblWithdrawDetails = raiseRequest.GetManageWithdrawDetails(20, 1);
            bool flag = Convert.ToBoolean(TempData["flag"]);
            if (flag == true)
            {
                ViewBag.Record = Convert.ToInt32(TempData["Record"]);
                tblWithdrawDetails = TempData["searchdataManage"] as List<sp_GetManageWithdrawalRequestDetails_Result>;
            }
            else
            {
                ViewBag.Record = 20;
            }
            //ViewBag.Opencount = raiseRequest.GetManageWithdrawDetails().Count(x => x.Status == 1);//Open
            //ViewBag.Closecount = raiseRequest.GetManageWithdrawDetails().Count(x => x.Status == 3);//Close
            //ViewBag.Rejectcount = raiseRequest.GetManageWithdrawDetails().Count(x => x.Status == 7);//Rejec
            // return View(tblWithdrawDetails.ToList().OrderByDescending(x => x.WithdrawalRequestId));

            return View(tblWithdrawDetails.ToList().OrderBy(x => x.RequestedDate));
        }
        public ActionResult IndexSearch(string Requestid, string CspName, string CspID, string State, string City, string Status, string Requesteddte, string Completiondte, string BranchCode, string Category, string Record)
        {
            int Cid = 0, Sid = 0, Cityid = 0, Statusid = 0;
            string Reqid = "";
            if (CspID == "")
            {
                Reqid = "0";
            }
            else
            {
                Reqid = CspID;
            }
            //if ( BranchCode == "" || BranchCode == "Select BranchCode")
            //{s
            //    Bcode = 0;
            //}
            //else
            //{
            //    Bcode = Convert.ToInt32(BranchCode);
            //}
            //if (Category == "" || Category == "Select Category")
            //{
            //     CategoryId = 0;
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
            var tblManageWithdrawDetails = raiseRequest.GetManageWithdrawDetailsSearch(Reqid, CspName, Cid, Sid, Cityid, Statusid, Requesteddte, Completiondte, BranchCode, Category, Convert.ToInt32(Record));
            TempData["searchdataManage"] = tblManageWithdrawDetails.ToList();
            TempData["flag"] = true;
            Session["status"] = Statusid;
            TempData["Record"] = Convert.ToInt32(Record);
            return RedirectToAction("Index");
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

        public ActionResult Edit(int? id)
        {

            RaiseRequestLogic raiseRequestdetals = new RaiseRequestLogic();
            ManageWithdrawal objMWithdraw = raiseRequestdetals.GetManageWithdrawDetailByID((int)id);
            var Status = new[]
            {

                 new SelectListItem { Text = "Select Status", Value = "" },
                  new SelectListItem { Text = "Open", Value = "1" },
                 new SelectListItem { Text = "Close", Value = "3" },
                 new SelectListItem { Text = "Rejected", Value = "7" }

            };
            var selectedStatus = Status.FirstOrDefault(d => d.Value == objMWithdraw.CurrentStatus.ToString());
            if (selectedStatus != null)
                selectedStatus.Selected = true;
            ViewBag.EditedStatus = Status;
            return View(objMWithdraw);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(ManageWithdrawal objMWithdraw)
        {

            RaiseRequestLogic raiseRequestLogic = new RaiseRequestLogic();
            raiseRequestLogic.UpdateManageWithdrawDetail(objMWithdraw);
            TempData["Message"] = "Record submitted successfully";
            return RedirectToAction("Index");
        }

        public ActionResult Details(int? id)
        {
            RaiseRequestLogic raiseRequestdetals = new RaiseRequestLogic();
            ManageWithdrawal objMWithdraw = raiseRequestdetals.GetManageWithdrawDetailByID((int)id);
            var Status = new[]
            {

                 new SelectListItem { Text = "Select Status", Value = "" },
                  new SelectListItem { Text = "Open", Value = "1" },
                 new SelectListItem { Text = "Close", Value = "3" },
                 new SelectListItem { Text = "Rejected", Value = "7" }

            };
            var selectedStatus = Status.FirstOrDefault(d => d.Value == objMWithdraw.CurrentStatus.ToString());
            if (selectedStatus != null)
                selectedStatus.Selected = true;
            ViewBag.EditedStatus = Status;
            return View(objMWithdraw);
        }
    }
}