using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using eConnect.DataAccess;
using eConnect.Logic;
using eConnect.Model;

namespace eConnect.Application.Controllers
{
    public class DownloadDocumentController : Controller
    {
        private eConnectAppEntities db = new eConnectAppEntities();
        List<SelectListItem> DocumenStatusList = new List<SelectListItem>()
            {
                new SelectListItem { Text = "Enable", Value = "True" },
                new SelectListItem { Text = "Disable", Value = "False" },

            };
        // GET: DownloadDocument
        public ActionResult Index()
        {
            DownloadDocumentLogic objDownloadDocumentLogic = new DownloadDocumentLogic();
            return View(objDownloadDocumentLogic.GeAllDownloadDocument());
        }

        // GET: DownloadDocument/Details/5
        public ActionResult Details(byte? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblDownloadDetail tblDownloadDetail = db.tblDownloadDetails.Find(id);
            if (tblDownloadDetail == null)
            {
                return HttpNotFound();
            }
            return View(tblDownloadDetail);
        }

        // GET: DownloadDocument/Create
        public ActionResult Create()
        {
            ViewBag.Status = new SelectList(DocumenStatusList, "Value", "Text");
            return View();
        }

        // POST: DownloadDocument/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(DownloadDocumentDetailModel DownloadDocumentDetailModel)
        {
            if (ModelState.IsValid)
            {
                if (DownloadDocumentDetailModel.DocumentImage !=null)
                { 
                DownloadDocumentLogic objDownloadDocumentLogic = new DownloadDocumentLogic();
                //string FilePath = System.Web.HttpContext.Current.Server.MapPath("~/Content/EgraminAssets\assets/DownloadsDocuments/");
                DownloadDocumentDetailModel.DocumentPath = Path.Combine("~\\Content\\EgraminAssets\\assets\\DownloadsDocuments", DownloadDocumentDetailModel.DocumentImage.FileName);
                string path = Path.Combine(System.Web.HttpContext.Current.Server.MapPath("~/Content/EgraminAssets/assets/DownloadsDocuments"), Path.GetFileName(DownloadDocumentDetailModel.DocumentImage.FileName));
                if (DownloadDocumentDetailModel.DocumentImage != null)
                {
                    DownloadDocumentDetailModel.DocumentImage.SaveAs(path);
                }
                objDownloadDocumentLogic.InsertDownloadDocument(DownloadDocumentDetailModel);
                return RedirectToAction("Index");
                }
            }
            //ViewBag.Status = DocumenStatusList;
            ViewBag.Status = new SelectList(DocumenStatusList, "Value", "Text", DownloadDocumentDetailModel.Status);
            return View(DownloadDocumentDetailModel);
        }

        // GET: DownloadDocument/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DownloadDocumentLogic objDownloadDocumentLogic = new DownloadDocumentLogic();
           var data= objDownloadDocumentLogic.GetDownloadDocumentByID((int)id);
            if (data == null)
            {
                return HttpNotFound();
            }
            ViewBag.Status = new SelectList(DocumenStatusList, "Value", "Text", data.Status);
            return View(data);
        }

        // POST: DownloadDocument/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(DownloadDocumentDetailModel DownloadDocumentDetailModel)
        {
            if (ModelState.IsValid)
            {
                DownloadDocumentLogic objDownloadDocumentLogic = new DownloadDocumentLogic();
                if (DownloadDocumentDetailModel.DocumentImage != null)
                {
                    
                    //string FilePath = System.Web.HttpContext.Current.Server.MapPath("~/Content/EgraminAssets\assets/DownloadsDocuments/");
                    DownloadDocumentDetailModel.DocumentPath = Path.Combine("~\\Content\\EgraminAssets\\assets\\DownloadsDocuments", DownloadDocumentDetailModel.DocumentImage.FileName);
                    string path = Path.Combine(System.Web.HttpContext.Current.Server.MapPath("~/Content/EgraminAssets/assets/DownloadsDocuments"), Path.GetFileName(DownloadDocumentDetailModel.DocumentImage.FileName));
                    if (DownloadDocumentDetailModel.DocumentImage != null)
                    {
                        DownloadDocumentDetailModel.DocumentImage.SaveAs(path);
                    }
                }
                objDownloadDocumentLogic.UpdateDownloadDocument(DownloadDocumentDetailModel);               
                return RedirectToAction("Index");
            }
            ViewBag.Status = new SelectList(DocumenStatusList, "Value", "Text", DownloadDocumentDetailModel.Status);
            return View(DownloadDocumentDetailModel);
        }

        // GET: DownloadDocument/Delete/5
        public ActionResult Delete(byte? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblDownloadDetail tblDownloadDetail = db.tblDownloadDetails.Find(id);
            if (tblDownloadDetail == null)
            {
                return HttpNotFound();
            }
            return View(tblDownloadDetail);
        }

        // POST: DownloadDocument/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(byte id)
        {
            tblDownloadDetail tblDownloadDetail = db.tblDownloadDetails.Find(id);
            db.tblDownloadDetails.Remove(tblDownloadDetail);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
     
    }
}
