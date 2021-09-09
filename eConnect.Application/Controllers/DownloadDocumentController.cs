using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using eConnect.DataAccess;

namespace eConnect.Application.Controllers
{
    public class DownloadDocumentController : Controller
    {
        private eConnectAppEntities db = new eConnectAppEntities();

        // GET: DownloadDocument
        public ActionResult Index()
        {
            return View(db.tblDownloadDetails.ToList());
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
            return View();
        }

        // POST: DownloadDocument/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,DocumentName,Description,DocumentPath,Priority,CreatedBy,CreatedDate,UpdatedBy,UpdatedDate,Status")] tblDownloadDetail tblDownloadDetail)
        {
            if (ModelState.IsValid)
            {
                db.tblDownloadDetails.Add(tblDownloadDetail);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(tblDownloadDetail);
        }

        // GET: DownloadDocument/Edit/5
        public ActionResult Edit(byte? id)
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

        // POST: DownloadDocument/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,DocumentName,Description,DocumentPath,Priority,CreatedBy,CreatedDate,UpdatedBy,UpdatedDate,Status")] tblDownloadDetail tblDownloadDetail)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tblDownloadDetail).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(tblDownloadDetail);
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
