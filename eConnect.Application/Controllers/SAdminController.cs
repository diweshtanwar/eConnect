﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using eConnect.Model;
using eConnect.Logic;
using System.IO;
using System.Configuration;
using System.Threading.Tasks;

namespace eConnect.Application.Controllers
{
    public class SAdminController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult TechSupportReqDetails()
        {
            TechSupportRequestLogic cl = new TechSupportRequestLogic();
            var Reqlist = cl.GetAllTechSupportRequests();
            ViewBag.AllTecRequests = Reqlist;

            StatusLogic sl = new StatusLogic();
            var Statuslist = sl.GetAllStatus();
            ViewBag.Statuslist = Statuslist;

            return View();
        }
        [Authorize(Roles = "Admin,1")]
        public ActionResult ManageUser()
        {
            return View();
        }
        //public ActionResult _BindSupportRequest()
        //{
        //    List<TechSupportRequestModel> products = new List<TechSupportRequestModel>();
        //    TechSupportRequestLogic cl = new TechSupportRequestLogic();
        //    var Reqlist = cl.GetAllTechSupportRequestsByFilterNew().ToList();
        //    foreach (var item in Reqlist)
        //    {
        //        products.Add(
        //                       new TechSupportRequestModel
        //                       {
        //                           TechSupportReqID = item.TechRequestId,
        //                           // UserID = item.RaisedBy,
        //                           //  UserName = item.User.CSPName,
        //                           MobileNumber = Convert.ToInt64(item.MobileNo),
        //                           //RequestDate = item.RequestedDate.ToString("dd-MMMM-yyyy"),
        //                           Status = (int)item.Status,
        //                       });
        //    }
        //    //return View("_BindSupportRequest", products);
        //    return PartialView("_BindSupportRequest", products);
        //}
        [HttpPost]
        public ActionResult TechSupportReqDetails(string ReqID, string CSPName, string CSPID, string Reqtype, string Status, string From, string To)
        {
            List<TechSupportRequestModel> products = new List<TechSupportRequestModel>();
            TechSupportRequestLogic cl = new TechSupportRequestLogic();
            var Reqlist = cl.GetAllTechSupportRequestsByFilter(ReqID, CSPName, CSPID, Reqtype, Status, From, To).ToList();
            foreach (var item in Reqlist)
            {
                products.Add(
                               new TechSupportRequestModel
                               {
                                   TechSupportReqID = item.TechRequestId,
                                   Description = item.Description,
                                   //RaisedByName = item.tblUserCSPDetail.CSPCode + " (" + item.tblCSPDetail.BranchCode + ")",
                                   //TechProbName = item.tblProblemType.Name,
                                   MobileNo = item.MobileNo,
                                   RequestedDate = (DateTime)item.RequestedDate,
                                   RequestDate = item.RequestedDate.ToString(),
                                   //Status = (int)item.Status,
                                   Status = item.Status,
                                   ////      StatusName = item.tblStatu.Name
                               });
            }
            return PartialView("_BindSupportRequest", products);
        }

        //[HttpPost]
        //public ActionResult _EditRequest(TechSupportRequestModel model, long reqid, string btnSubmit)
        //{
        //    TechSupportRequestLogic cl = new TechSupportRequestLogic();
        //    if (btnSubmit == "Submit")
        //    {
        //        cl.UpdateTechSupportRequest(model);
        //        TempData["Message"] = "Record Updated successfully.";
        //        return RedirectToAction("SAdmin", "TechSupportReqDetails");

        //    }
        //    else
        //    {
        //        TechSupportProblemLogic ProbList = new TechSupportProblemLogic();
        //        var ProblemList = ProbList.GetAllTechSupportProblems();
        //        StatusLogic StatsList = new StatusLogic();
        //        var StatusList = StatsList.GetAllStatus();
        //        //TechSupportRequestLogic cl = new TechSupportRequestLogic();
        //        var ReqDetails = cl.GetTechSupportRequestsByTReqId(reqid);
        //        ViewBag.ProblemList = new SelectList(ProblemList, "ProblemTypeId", "Name", ReqDetails.ProblemType);
        //        ViewBag.StatusList = new SelectList(StatusList, "StatusId", "Name", ReqDetails.Status);
        //        ViewBag.ReqDetails = ReqDetails;
        //        return PartialView("_EditRequest");

        //    }



        //}

        [HttpPost]
        public ActionResult _TecRequestHistory(long reqid)
        {
            TechSupportRequestLogic cl = new TechSupportRequestLogic();
            //TechSupportProblemLogic ProbList = new TechSupportProblemLogic();
            //var ProblemList = ProbList.GetAllTechSupportProblems();
            //StatusLogic StatsList = new StatusLogic();
            //var StatusList = StatsList.GetAllStatus();
            ////TechSupportRequestLogic cl = new TechSupportRequestLogic();
            var ReqDetails = cl.GetTechSupportRequestsByTReqId(reqid);
            //ViewBag.ProblemList = new SelectList(ProblemList, "ProblemTypeId", "Name", ReqDetails.ProblemType);
            //ViewBag.StatusList = new SelectList(StatusList, "StatusId", "Name", ReqDetails.Status);

            ViewBag.ReqDetails = ReqDetails;
            return PartialView("_TecRequestHistory");
        }

        [Authorize(Roles = "Admin,1")]
        public ActionResult CreateRole()
        {
            return View();
        }
        [HttpPost]
        public ActionResult CreateRole(RoleMasterModel model)
        {
            RoleMasterLogic RMaster = new RoleMasterLogic();
            RMaster.InsertRoleMaster(model);
            TempData["Message"] = "Record updated successfully.";
            return RedirectToAction("RoleDetails");
        }
        public ActionResult RoleDetails()
        {
            return View();
        }

        [HttpPost]
        public ActionResult RoleDetails(string rolename)
        {
            List<RoleMasterModel> roles = new List<RoleMasterModel>();
            RoleMasterLogic cl = new RoleMasterLogic();
            var Rolelist = cl.GetAllRoles().ToList();
            if (!string.IsNullOrEmpty(rolename))
            {
                Rolelist = Rolelist.Where(x => x.Name == rolename).ToList();
            }
            foreach (var item in Rolelist)
            {
                roles.Add(
                               new RoleMasterModel
                               {
                                   RoleId = item.RoleId,
                                   Name = item.Name,

                               });
            }
            return PartialView("_BindRoles", roles);
        }

        public JsonResult DeleteRole(int roleid)
        {
            RoleMasterLogic rl = new RoleMasterLogic();
            rl.DeleteRole(roleid);
            TempData["Message"] = "Record Deleted successfully.";
            return Json("Record Deleted successfully", JsonRequestBehavior.AllowGet);
        }
        public ActionResult EditRole(int id)
        {
            RoleMasterModel Rolemodel = new RoleMasterModel();
            RoleMasterLogic roledetail = new RoleMasterLogic();
            var item = roledetail.GetAllRoles().Where(x => x.RoleId == id).FirstOrDefault();
            Rolemodel.RoleId = item.RoleId;
            Rolemodel.Name = item.Name;
            return View(Rolemodel);

        }

        [HttpPost]
        public ActionResult EditRole(RoleMasterModel model)
        {
            RoleMasterLogic cl = new RoleMasterLogic();
            cl.UpdateRole(model);
            TempData["Message"] = "Record Updated successfully.";
            return RedirectToAction("RoleDetails");

        }


        [HttpPost]
        public ActionResult CreateTransactionType(CommissionReportTransactionTypeModel model)
        {
            if (ModelState.IsValid)
            {
                CommissionReportTransactionTypeLogic TransType = new CommissionReportTransactionTypeLogic();
                TransType.InsertTransactionType(model);

                TempData["Message"] = "Record submitted successfully.";
                return RedirectToAction("CreateTransactionType");
            }
            else
            {
                return View();
            }
        }
        public ActionResult EditTransactionType(int id)
        {
            CommissionReportTransactionTypeModel accm = new CommissionReportTransactionTypeModel();
            CommissionReportTransactionTypeLogic cl = new CommissionReportTransactionTypeLogic();
            var item = cl.GetTransactionTypeByID(id);
            TransactionTypeCycleLogic sl = new TransactionTypeCycleLogic();
            var TransactionCycle = sl.GetAllCommissionTransactionTypeCycle();
            ViewBag.CycleID = new SelectList(sl.GetAllCommissionTransactionTypeCycle(), "CycleID", "CycleName", item.CycleID);
            accm.CycleID = (int)item.CycleID;
            accm.Name = item.Name;
            accm.CSPCommission = (int)item.CSPCommission;
            accm.HOCommission = item.HOCommission;
            accm.Status = item.Status;
            accm.CommissionReportTransactionTypeId = item.CommissionReportTransactionTypeId;
            return View(accm);
        }
        [HttpPost]
        public ActionResult EditTransactionType(int id, CommissionReportTransactionTypeModel model)
        {
            CommissionReportTransactionTypeLogic cl = new CommissionReportTransactionTypeLogic();
            cl.UpdateTransactionType(model);
            TempData["Message"] = "Record Updated Successfully.";
            return RedirectToAction("CreateTransactionType");
        }


        public JsonResult DeleteTransactionType(int transid)
        {
            CommissionReportTransactionTypeLogic translogic = new CommissionReportTransactionTypeLogic();
            translogic.DeleteTransationType(transid);
            //TempData["Message"] = "Record Deleted successfully.";
            return Json("Record Deleted successfully", JsonRequestBehavior.AllowGet);
        }

        //New Code/..........................................................
        //..........................................................................................
        [Authorize(Roles = "Admin,1")]
        public ActionResult CreateTransactionTypeRural()
        {

            TransactionTypeCycleLogic sl = new TransactionTypeCycleLogic();
            var TransactionCycle = sl.GetAllCommissionTransactionTypeCycle();
            ViewBag.TransactionTypeCycle = TransactionCycle;

            return View();
        }
        [HttpPost]
        public ActionResult CreateTransactionTypeRural(CommissionReportTransactionTypeRuralModel model)
        {
            if (ModelState.IsValid)
            {
                CommissionReportTransactionTypeRuralLogic TransType = new CommissionReportTransactionTypeRuralLogic();
                TransType.InsertTransactionTypeRural(model);

                TempData["Message"] = "Record submitted successfully.";
                return RedirectToAction("CreateTransactionTypeRural");
            }
            else
            {
                return View();
            }
        }

        public JsonResult DeleteTransactionTypeRural(int transid)
        {
            CommissionReportTransactionTypeRuralLogic translogic = new CommissionReportTransactionTypeRuralLogic();
            translogic.DeleteTransationTypeRural(transid);
            TempData["Message"] = "Record Deleted successfully.";
            return Json("Record Deleted successfully", JsonRequestBehavior.AllowGet);
        }




        public ActionResult EditTransactionTypeRural(int id)
        {
            CommissionReportTransactionTypeRuralModel accm = new CommissionReportTransactionTypeRuralModel();
            CommissionReportTransactionTypeRuralLogic cl = new CommissionReportTransactionTypeRuralLogic();
            var item = cl.GetTransactionTypeRuralByID(id);
            TransactionTypeCycleLogic sl = new TransactionTypeCycleLogic();
            var TransactionCycle = sl.GetAllCommissionTransactionTypeCycle();
            ViewBag.CycleID = new SelectList(sl.GetAllCommissionTransactionTypeCycle(), "CycleID", "CycleName", item.CycleID);
            accm.Name = item.Name;
            accm.CSPCommission = (int)item.CSPCommission;
            accm.HOCommission = item.HOCommission;
            accm.Status = item.Status;
            accm.CycleID = (int)item.CycleID;
            accm.CommissionReportTransactionTypeId = item.CommissionReportTransactionTypeId;
            return View(accm);
        }
        [HttpPost]
        public ActionResult EditTransactionTypeRural(int id, CommissionReportTransactionTypeRuralModel model)
        {
            CommissionReportTransactionTypeRuralLogic cl = new CommissionReportTransactionTypeRuralLogic();
            cl.UpdateTransactionTypeRural(model);
            TempData["Message"] = "Record Updated Successfully.";
            return RedirectToAction("CreateTransactionTypeRural");
        }
        [Authorize(Roles = "Admin,1")]
        public ActionResult CreateTransactionType()
        {
            TransactionTypeCycleLogic sl = new TransactionTypeCycleLogic();
            var TransactionCycle = sl.GetAllCommissionTransactionTypeCycle();
            ViewBag.TransactionTypeCycle = TransactionCycle;

            return View();
        }


        public ActionResult _TransactionTypesDetails(int cycleid)
        {
            CommissionReportTransactionTypeLogic Translogic = new CommissionReportTransactionTypeLogic();
            List<CommissionReportTransactionTypeModel> Transactions = new List<CommissionReportTransactionTypeModel>();


            var TransactionTypes = (dynamic)null;
            if (cycleid == 4)
            {
                TransactionTypes = Translogic.GetAllTransactionType();
            }
            else
            {
                TransactionTypes = Translogic.GetTransactionTypeByCycleID(cycleid);
            }
            foreach (var item in TransactionTypes)
            {
                Transactions.Add(
                               new CommissionReportTransactionTypeModel
                               {
                                   Name = item.Name,
                                   CommissionReportTransactionTypeId = item.CommissionReportTransactionTypeId,
                                   HOCommission = (int)item.HOCommission,
                                   CSPCommission = (int)item.CSPCommission,
                                   Status = item.Status,
                                   CycleID = (int)item.CycleID
                               });
            }
            return PartialView("_TransactionTypesDetails", Transactions);

        }


        public ActionResult _TransactionTypesDetailsRural(int cycleid)
        {
            CommissionReportTransactionTypeRuralLogic Translogic = new CommissionReportTransactionTypeRuralLogic();
            List<CommissionReportTransactionTypeRuralModel> Transactions = new List<CommissionReportTransactionTypeRuralModel>();
            // var TransactionTypes = Translogic.GetAllTransactionTypeRural();
            var TransactionTypes = (dynamic)null;
            if (cycleid == 4)
            {
                TransactionTypes = Translogic.GetAllTransactionTypeRural();
            }
            else
            {
                TransactionTypes = Translogic.GetTransactionTypeRuralByCycleID(cycleid);
            }
            foreach (var item in TransactionTypes)
            {
                Transactions.Add(
                               new CommissionReportTransactionTypeRuralModel
                               {
                                   Name = item.Name,
                                   CommissionReportTransactionTypeId = item.CommissionReportTransactionTypeId,
                                   HOCommission = (int)item.HOCommission,
                                   CSPCommission = (int)item.CSPCommission,
                                   Status = item.Status,
                                   CycleID = (int)item.CycleID
                               });
            }
            return PartialView("_TransactionTypesDetailsRural", Transactions);

        }


        public ActionResult CreateActiveWindow()
        {

            return View();
        }

        [HttpPost]
        public ActionResult CreateActiveWindow(WindowTimes model)
        {

            if (ModelState.IsValid)
            {
                WindowTimingLogic NewTiming = new WindowTimingLogic();
                NewTiming.InsertNewWindowTiming(model);

                TempData["Message"] = "Record submitted successfully.";
                return RedirectToAction("CreateActiveWindow");
            }
            else
            {
                return View();
            }
        }


        public ActionResult _WindowTimingDetails()
        {
            WindowTimingLogic WinTiminglogic = new WindowTimingLogic();
            List<WindowTimes> WTiming = new List<WindowTimes>();
            var timings = WinTiminglogic.GetAllActiveWindow();
            foreach (var item in timings)
            {
                WTiming.Add(
                               new WindowTimes
                               {
                                   Id = item.Id,
                                   StartTime = item.StartTime,
                                   EndTime = item.EndTime,
                                   InActive = (bool)item.InActive

                               });
            }
            return PartialView("_WindowTimingDetails", WTiming);

        }

        public JsonResult DeleteWindowTiming(int transid)
        {
            WindowTimingLogic WindowTiming = new WindowTimingLogic();
            WindowTiming.DeleteWindowTiming(transid);
            TempData["Message"] = "Record Deleted successfully.";
            return Json("Record Deleted successfully", JsonRequestBehavior.AllowGet);
        }



        public ActionResult EditWindowTimes(int id)
        {
            WindowTimes accm = new WindowTimes();
            WindowTimingLogic cl = new WindowTimingLogic();
            var item = cl.GetWindowTimingById(id);
            accm.Id = item.Id;
            accm.StartTime = item.StartTime;
            accm.EndTime = item.EndTime;
            accm.InActive = item.InActive;
            return View(accm);
        }
        [HttpPost]
        public ActionResult EditWindowTimes(int id, WindowTimes model)
        {
            WindowTimingLogic cl = new WindowTimingLogic();
            cl.UpdateActiveWindowTiming(model);
            TempData["Message"] = "Record Updated Successfully.";
            return RedirectToAction("CreateActiveWindow");
        }

    }
}