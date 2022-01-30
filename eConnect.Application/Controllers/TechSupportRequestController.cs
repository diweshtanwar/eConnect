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
    public class TechSupportRequestController : Controller
    {
        string TechSupportPath = System.Web.HttpContext.Current.Server.MapPath(Convert.ToString(ConfigurationManager.AppSettings["TechFilePath"]));
        List<SelectListItem> Status = new List<SelectListItem>()
            {

                new SelectListItem { Text = "Select Status", Value = "" },

                 new SelectListItem { Text = "In-Progress", Value = "2" },
                new SelectListItem { Text = "Not Started", Value = "5" },
                new SelectListItem { Text = "Completed", Value = "3" },
            };
        RaiseRequestLogic raiseRequest = new RaiseRequestLogic();
        public ActionResult Index()
        {

            TechSupportProblemLogic techSupport = new TechSupportProblemLogic();

            var ProblemList = techSupport.GetAllTechSupportProblems();
            ViewBag.ProblemList = ProblemList;
            ViewBag.Status = Status;
            TechSupportRequestLogic logic = new TechSupportRequestLogic();
            //var tblTechDetails = logic.GetAllTechSupportRequests();
            var tblTechDetails = raiseRequest.GetTechRequestDetailsByCSPID(Convert.ToInt32(Session["CSPID"].ToString()));
            bool flag = Convert.ToBoolean(TempData["flag"]);
            if (flag == true)
            {
                tblTechDetails = TempData["searchdata"] as List<tblTechRequest>;
            }
              return View(tblTechDetails.ToList().OrderByDescending(x => x.TechRequestId));
    
        }
        public ActionResult IndexSearch(string TechRequestid, string TechProblemType, string Requesteddte, string Completiondte)
        {
            int Reqid = 0, ReqType = 0;
            TechSupportProblemLogic techSupport = new TechSupportProblemLogic();
            TechSupportRequestLogic logic = new TechSupportRequestLogic();
            var ProblemList = techSupport.GetAllTechSupportProblems();
            ViewBag.ProblemList = ProblemList;
            ViewBag.Status = Status;
            if (string.IsNullOrEmpty(TechRequestid))
            {
                Reqid = 0;
            }
            else
            {
                Reqid = Convert.ToInt32(TechRequestid);
            }
            if (string.IsNullOrEmpty(TechProblemType))
            {
                ReqType = 0;
            }
            else
            {
                ReqType = Convert.ToInt32(TechProblemType);
            }
            var tblTechDetails = logic.GetTechDetailsSearch(Reqid, ReqType, Requesteddte, Completiondte);
            TempData["searchdata"] = tblTechDetails.ToList();
            TempData["flag"] = true;
            return RedirectToAction("Index");
        }
        public ActionResult Create()
        {
            TechSupportProblemLogic techSupport = new TechSupportProblemLogic();
            var ProblemList = techSupport.GetAllTechSupportProblems();
            ViewBag.ProblemList = ProblemList;
            ViewBag.Status = Status;
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(TechSupportRequest supportRequest)
        {
            TechSupportProblemLogic techSupport = new TechSupportProblemLogic();
            var ProblemList = techSupport.GetAllTechSupportProblems();
            ViewBag.ProblemList = ProblemList;
            ViewBag.Status = Status;
            if (ModelState.IsValid)
            {

                int UserId = Convert.ToInt32(Session["CSPID"]);
                TechSupportRequestLogic techSupportreq = new TechSupportRequestLogic();
                long UserID = techSupportreq.InsertTechSupportRequest(supportRequest, UserId);
                string path = Path.Combine(TechSupportPath, UserID.ToString());
                if (supportRequest.Screenshot != null)
                {
                    string fpath = CheckDirectory(path, "TechSupportScreenshort", supportRequest.Screenshot);
                    supportRequest.Screenshot.SaveAs(fpath);
                }
                return RedirectToAction("Index");
            }


            return View(supportRequest);
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


        public ActionResult Edit(int? id)
        {
            TechSupportProblemLogic techSupport = new TechSupportProblemLogic();
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TechSupportRequestLogic techSupportreq = new TechSupportRequestLogic();
            TechSupportRequest objReq = techSupportreq.GetTechSupportRequestsByTReqId((int)id);
            Session["ImageScreenshort"] = objReq.Screenpic;
            if (objReq == null)
            {
                return HttpNotFound();
            }


            var Status = new[]
            {

                 new SelectListItem { Text = "In-Progress", Value = "2" },
                new SelectListItem { Text = "Not Started", Value = "5" },
                new SelectListItem { Text = "Completed", Value = "3" },
            };
            var selectedStatus = Status.FirstOrDefault(d => d.Value == objReq.Status.ToString());
            if (selectedStatus != null)
                selectedStatus.Selected = true;
            ViewBag.EditStatus = Status;

            var ProblemList = techSupport.GetAllTechSupportProblems();
            ViewBag.ProblemList = ProblemList;

            return View(objReq);
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(TechSupportRequest supportRequest)
        {
            string Image = "";
            if (supportRequest.Screenshot == null)
            {
                Image = Session["ImageScreenshort"].ToString();
                supportRequest.Screenpic = Image;
                ModelState.Remove("Screenshot");
            }
            if (ModelState.IsValid)
            {
                int UserId = Convert.ToInt32(Session["UserID"]);

                string fpath = string.Empty;
                TechSupportRequestLogic techSupportreq = new TechSupportRequestLogic();
                techSupportreq.UpdateTechSupportRequest(supportRequest, UserId);

                string path = Path.Combine(TechSupportPath, supportRequest.ID.ToString());
                if (supportRequest.Screenshot != null)
                {
                    string fpathh = CheckDirectory(path, "TechSupportScreenshort", supportRequest.Screenshot);
                    supportRequest.Screenshot.SaveAs(fpath);
                }
                TempData["Message"] = "Record submitted successfully";
                return RedirectToAction("Index");
            }
            return View(supportRequest);
        }

        public ActionResult Delete(int? id)
        {
            TechSupportProblemLogic techSupport = new TechSupportProblemLogic();
            TechSupportRequestLogic techSupportreq = new TechSupportRequestLogic();
            TechSupportRequest objReq = techSupportreq.GetTechSupportRequestsByTReqId((int)id);
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            if (objReq == null)
            {
                return HttpNotFound();
            }

            var Status = new[]
            {

                 new SelectListItem { Text = "In-Progress", Value = "2" },
                new SelectListItem { Text = "Not Started", Value = "5" },
                new SelectListItem { Text = "Completed", Value = "3" },
            };
            var selectedStatus = Status.FirstOrDefault(d => d.Value == objReq.Status.ToString());
            if (selectedStatus != null)
                selectedStatus.Selected = true;
            ViewBag.EditStatus = Status;

            var ProblemList = techSupport.GetAllTechSupportProblems();
            ViewBag.ProblemList = ProblemList;
            return View(objReq);
        }

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            RaiseRequestLogic raiseRequest = new RaiseRequestLogic();
            raiseRequest.DeleteTechDetails(id);
            return RedirectToAction("Index");
        }
        public ActionResult Details(int? id)
        {
            TechSupportProblemLogic techSupport = new TechSupportProblemLogic();
            TechSupportRequestLogic techSupportreq = new TechSupportRequestLogic();
            TechSupportRequest objReq = techSupportreq.GetTechSupportRequestsByTReqId((int)id);
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            if (objReq == null)
            {
                return HttpNotFound();
            }

            var Status = new[]
            {

                new SelectListItem { Text = "In-Progress", Value = "1" },
                new SelectListItem { Text = "Not Started", Value = "2" },
                new SelectListItem { Text = "Completed", Value = "3" },
                new SelectListItem { Text = "Rejected", Value = "7" },
            };
            var selectedStatus = Status.FirstOrDefault(d => d.Value == objReq.Status.ToString());
            if (selectedStatus != null)
                selectedStatus.Selected = true;
            ViewBag.EditStatus = Status;

            var ProblemList = techSupport.GetAllTechSupportProblems();
            ViewBag.ProblemList = ProblemList;
            return View(objReq);

        }
    }
}