using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using eConnect.DataAccess;
using eConnect.Logic;

namespace eConnect.Application.Controllers
{
    public class EnquiryController : Controller
    {
        private eConnectAppEntities db = new eConnectAppEntities();

        // GET: Enquiry
        public ActionResult Index()
        {
            EnquiryLogic objEnquiryLogic = new EnquiryLogic();
            return View(objEnquiryLogic.GetAllEnquiry());
        }

        // GET: Enquiry/Details/5
        public ActionResult Details(byte? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblEnquiry tblEnquiry = db.tblEnquiries.Find(id);
            if (tblEnquiry == null)
            {
                return HttpNotFound();
            }
            return View(tblEnquiry);
        }

        // GET: Enquiry/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Enquiry/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Name,Email,Mobile,Message,CreatedBy,CreatedDate,UpdatedBy,UpdatedDate,Status")] tblEnquiry tblEnquiry)
        {
            if (ModelState.IsValid)
            {
                db.tblEnquiries.Add(tblEnquiry);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(tblEnquiry);
        }

        // GET: Enquiry/Edit/5
        public ActionResult Edit(byte? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            EnquiryLogic objEnquiryLogic = new EnquiryLogic();
            tblEnquiry tblEnquiry = objEnquiryLogic.GetEnquiryByID((int)id);
            if (tblEnquiry == null)
            {
                return HttpNotFound();
            }
            return View(tblEnquiry);
        }

        // POST: Enquiry/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(tblEnquiry tblEnquiry)
        {
            EnquiryLogic objEnquiryLogic = new EnquiryLogic();
            EmailLogic objEmailLogic = new EmailLogic();
            if (ModelState.IsValid)
            {
                objEnquiryLogic.UpdateEnquiry(tblEnquiry);
                //objEmailLogic.SendEmail(tblEnquiry.Email, tblEnquiry.Name, tblEnquiry.Feedback);
                return RedirectToAction("Index");
            }
            return View(tblEnquiry);
        }

        // GET: Enquiry/Delete/5
        public ActionResult Delete(byte? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblEnquiry tblEnquiry = db.tblEnquiries.Find(id);
            if (tblEnquiry == null)
            {
                return HttpNotFound();
            }
            return View(tblEnquiry);
        }

        // POST: Enquiry/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(byte id)
        {
            tblEnquiry tblEnquiry = db.tblEnquiries.Find(id);
            db.tblEnquiries.Remove(tblEnquiry);
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
