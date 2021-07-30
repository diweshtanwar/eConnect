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
    public class DepositRequestController : Controller
    {
        string UserFilePath = System.Web.HttpContext.Current.Server.MapPath(Convert.ToString(ConfigurationManager.AppSettings["DepositFilePath"]));
         List<SelectListItem> RequestType = new List<SelectListItem>()
            {
                new SelectListItem { Text = "Select RequestType", Value = "" },
                new SelectListItem { Text = "Withdrawal", Value = "1" },
                new SelectListItem { Text = "Deposit", Value = "2" },

            };
        List<SelectListItem> Status = new List<SelectListItem>()
            {

                new SelectListItem { Text = "Select Status", Value = "" },
                new SelectListItem { Text = "In-Progress", Value = "1" },
                 new SelectListItem { Text = "Not Started", Value = "2" },
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
            return View(tblDepositDetails.ToList());
        }
        public ActionResult IndexSearch(string Requestid, string RequestType, string Requesteddte, string Completiondte)
        {
            int Reqid=0, ReqType=0;
            RaiseRequestLogic raiseRequest = new RaiseRequestLogic();
            ViewBag.RequestType = RequestType;
            if(Requestid =="")
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
                ReqType= Convert.ToInt32(RequestType);
            }
            var tblDepositDetails = raiseRequest.GetDepositDetailsSearch(Reqid, ReqType, Requesteddte, Completiondte);
            TempData["searchdata"] = tblDepositDetails.ToList();
            TempData["flag"] = true;
            return RedirectToAction("Index");
        }
        public ActionResult Create()
        {
            ViewBag.RequestType = RequestType;
            ViewBag.Status = Status;
            return View();
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
                long UserID = raiseRequest.AddDepositDetails(deposit, UserId);
                string path = Path.Combine(UserFilePath, UserID.ToString());
                if (deposit.Reciept != null)
                {
                   string  fpath = CheckDirectory(path, "DepositReceipt", deposit.Reciept);
                    deposit.Reciept.SaveAs(fpath);
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
           
                new SelectListItem { Text = "In-Progress", Value = "1" },
                new SelectListItem { Text = "Not Started", Value = "2" },
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

                new SelectListItem { Text = "In-Progress", Value = "1" },
                new SelectListItem { Text = "Not Started", Value = "2" },
                new SelectListItem { Text = "Completed", Value = "3" },
            };
            var selectedStatus = Status.FirstOrDefault(d => d.Value == objDeposit.Status.ToString());
            if (selectedStatus != null)
                selectedStatus.Selected = true;
            ViewBag.EditStatus = Status;
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

                new SelectListItem { Text = "In-Progress", Value = "1" },
                new SelectListItem { Text = "Not Started", Value = "2" },
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