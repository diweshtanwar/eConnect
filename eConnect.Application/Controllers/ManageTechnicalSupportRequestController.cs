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
    public class ManageTechnicalSupportRequestController : Controller
    {
        string TechSupportPath = Convert.ToString(ConfigurationManager.AppSettings["TechFilePath"]);
        List<SelectListItem> Status = new List<SelectListItem>()
        {

            //new SelectListItem { Text = "Select Status", Value = "" },
            //        
            new SelectListItem { Text = "Open", Value = "1" },
            new SelectListItem { Text = "All", Value = "" },
            new SelectListItem { Text = "In-Progress", Value = "2" },
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
            TechSupportProblemLogic techSupport = new TechSupportProblemLogic();
            var ProblemList = techSupport.GetAllTechSupportProblems();
            ViewBag.ProblemList = ProblemList;

            var tblTechDetails = raiseRequest.GetManageTechDetails(20, 1);
            bool flag = Convert.ToBoolean(TempData["flag"]);
            if (flag == true)
            {
                ViewBag.Record = Convert.ToInt32(TempData["Record"]);
                tblTechDetails = TempData["searchdataManageTech"] as List<sp_GetManageTechSupportRequestDetails_Result>;
            }
            else
            {
                ViewBag.Record = 20;

            }
            tblTechDetails = tblTechDetails.Where(w => w.TechRequestId == w.TechRequestId).Select(w => { w.Attachment = TechSupportPath.Replace("~", "") + w.TechRequestId + "\\TechSupportScreenshort\\" + w.AttachmentSource; return w; }).ToList();

            //ViewBag.Opencount = raiseRequest.GetManageTechDetails().Count(x => x.Status == 1);//Open
            //ViewBag.InProgresscount = raiseRequest.GetManageTechDetails().Count(x => x.Status == 2);//tblTechDetails.Count(x => x.Status == 2);//In-Progress
            //ViewBag.Closecount = raiseRequest.GetManageTechDetails().Count(x => x.Status == 3);//tblTechDetails.Count(x => x.Status == 3);//Close
            //ViewBag.Rejectcount = raiseRequest.GetManageTechDetails().Count(x => x.Status == 7);//tblTechDetails.Count(x => x.Status == 7);//Reject
            // return View(tblTechDetails.ToList().OrderByDescending(x => x.TechRequestId));
           return View(tblTechDetails.ToList().OrderBy(x => x.RequestedDate));
        }

        public ActionResult IndexSearch(string Requestid, string CspName, string CspID, string State, string City, string Status, string Requesteddte, string Completiondte, string BranchCode, string Category, string TechProblemType, string Record)
        {
            int Cid = 0, Sid = 0, Cityid = 0, Statusid = 0, ProblemType = 0;
            string Reqid = "";
            if (TechProblemType == "")
            {
                ProblemType = 0;
            }
            else
            {
                ProblemType = Convert.ToInt32(TechProblemType);
            }
            if (CspID == "")
            {
                Reqid = "0";
            }
            else
            {
                Reqid = CspID;
            }
            //if (Requestid == "")
            //{
            //    Reqid = 0;
            //}
            //else
            //{
            //    Reqid = Convert.ToInt32(Requestid);
            //}
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
            var tblManageTechDetails = raiseRequest.GetManageTechDetailsSearch(Reqid, CspName, Cid, Sid, Cityid, Statusid, Requesteddte, Completiondte, BranchCode, Category, ProblemType, Convert.ToInt32(Record));
            TempData["searchdataManageTech"] = tblManageTechDetails.ToList();
            TempData["flag"] = true;
            Session["status"] = Statusid;
            TempData["Record"] = Convert.ToInt32(Record);
            return RedirectToAction("Index");
        }


        public ActionResult Edit(int? id)

        {
            TechSupportProblemLogic techSupport = new TechSupportProblemLogic();
            RaiseRequestLogic raiseRequestdetals = new RaiseRequestLogic();
            ManageTechSupport objMTech = raiseRequestdetals.GetManageTechDetailByID((int)id);
            var Status = new[]
            {

                 new SelectListItem { Text = "Select Status", Value = "" },
                  new SelectListItem { Text = "Open", Value = "1" },
                   new SelectListItem { Text = "In-Progress", Value = "2" },
                 new SelectListItem { Text = "Close", Value = "3" },
                 new SelectListItem { Text = "Rejected", Value = "7" }

            };
            var selectedStatus = Status.FirstOrDefault(d => d.Value == objMTech.CurrentStatus.ToString());
            if (selectedStatus != null)
                selectedStatus.Selected = true;
            ViewBag.EditedStatus = Status;
            var ProblemList = techSupport.GetAllTechSupportProblems();
            ViewBag.ProblemList = ProblemList;

            return View(objMTech);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(ManageTechSupport tech)
        {
            RaiseRequestLogic raiseRequestLogic = new RaiseRequestLogic();
            raiseRequestLogic.UpdateManageTechDetail(tech);
            TempData["Message"] = "Record submitted successfully";
            return RedirectToAction("Index");
        }
        public ActionResult Details(int? id)
        {
            TechSupportProblemLogic techSupport = new TechSupportProblemLogic();
            RaiseRequestLogic raiseRequestdetals = new RaiseRequestLogic();
            ManageTechSupport objMTech = raiseRequestdetals.GetManageTechDetailByID((int)id);
            var Status = new[]
            {

                 new SelectListItem { Text = "Select Status", Value = "" },
                  new SelectListItem { Text = "Open", Value = "1" },
                   new SelectListItem { Text = "In-Progress", Value = "2" },
                 new SelectListItem { Text = "Close", Value = "3" },
                 new SelectListItem { Text = "Rejected", Value = "7" }

            };
            var selectedStatus = Status.FirstOrDefault(d => d.Value == objMTech.CurrentStatus.ToString());
            if (selectedStatus != null)
                selectedStatus.Selected = true;
            ViewBag.EditedStatus = Status;
            var ProblemList = techSupport.GetAllTechSupportProblems();
            ViewBag.ProblemList = ProblemList;

            return View(objMTech);
        }
    }
}