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
    public class ManageTechnicalSupportRequestController : Controller
    {
        List<SelectListItem> Status = new List<SelectListItem>()
        {

            new SelectListItem { Text = "Select Status", Value = "" },
            new SelectListItem { Text = "Open", Value = "1" },
                new SelectListItem { Text = "Close", Value = "2" },

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
            var tblTechDetails = raiseRequest.GetManageTechDetails();
            bool flag = Convert.ToBoolean(TempData["flag"]);
            if (flag == true)
            {
                tblTechDetails = TempData["searchdataManageTech"] as List<sp_GetManageTechSupportRequestDetails_Result>;
            }
            return View(tblTechDetails.ToList());
        }

        public ActionResult IndexSearch(string Requestid, string CspName, string CspID, string State, string City, string Status, string Requesteddte, string Completiondte, string BranchCode, string Category)
        {
            int Reqid = 0, Cid = 0, Sid = 0, Cityid = 0, Statusid = 0, Bcode = 0, CategoryId = 0;
            if (Requestid == "")
            {
                Reqid = 0;
            }
            else
            {
                Reqid = Convert.ToInt32(Requestid);
            }
            if (BranchCode == "" || BranchCode == "Select BranchCode")
            {
                Bcode = 0;
            }
            else
            {
                Bcode = Convert.ToInt32(BranchCode);
            }
            if (Category == "" || Category == "Select Category")
            {
                CategoryId = 0;
            }
            else
            {
                CategoryId = Convert.ToInt32(Category);
            }
            if (CspID == "")
            {
                Cid = 0;
            }
            else
            {
                Cid = Convert.ToInt32(CspID);
            }
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
            var tblManageTechDetails = raiseRequest.GetManageTechDetailsSearch(Reqid, CspName, Cid, Sid, Cityid, Statusid, Requesteddte, Completiondte, Bcode, CategoryId);
            TempData["searchdataManageTech"] = tblManageTechDetails.ToList();
            TempData["flag"] = true;
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
                 new SelectListItem { Text = "Close", Value = "2" },

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
                 new SelectListItem { Text = "Close", Value = "2" },

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