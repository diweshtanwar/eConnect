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
    public class GalleryDocumentController : Controller
    {
        private eConnectAppEntities db = new eConnectAppEntities();

        // GET: GalleryDocument
        public ActionResult Index()
        {
            return View(db.tblGalleryCategories.ToList());
        }

        // GET: GalleryDocument/Details/5
        public ActionResult Details(byte? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblGalleryCategory tblGalleryCategory = db.tblGalleryCategories.Find(id);
            if (tblGalleryCategory == null)
            {
                return HttpNotFound();
            }
            return View(tblGalleryCategory);
        }

        // GET: GalleryDocument/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: GalleryDocument/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,CategoryTittle,CategoryImagesPath,Priority,CreatedBy,CreatedDate,UpdatedBy,UpdatedDate,Status")] tblGalleryCategory tblGalleryCategory)
        {
            if (ModelState.IsValid)
            {
                db.tblGalleryCategories.Add(tblGalleryCategory);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(tblGalleryCategory);
        }

        // GET: GalleryDocument/Edit/5
        public ActionResult Edit(byte? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblGalleryCategory tblGalleryCategory = db.tblGalleryCategories.Find(id);
            if (tblGalleryCategory == null)
            {
                return HttpNotFound();
            }
            return View(tblGalleryCategory);
        }

        // POST: GalleryDocument/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,CategoryTittle,CategoryImagesPath,Priority,CreatedBy,CreatedDate,UpdatedBy,UpdatedDate,Status")] tblGalleryCategory tblGalleryCategory)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tblGalleryCategory).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(tblGalleryCategory);
        }

        // GET: GalleryDocument/Delete/5
        public ActionResult Delete(byte? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblGalleryCategory tblGalleryCategory = db.tblGalleryCategories.Find(id);
            if (tblGalleryCategory == null)
            {
                return HttpNotFound();
            }
            return View(tblGalleryCategory);
        }

        // POST: GalleryDocument/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(byte id)
        {
            tblGalleryCategory tblGalleryCategory = db.tblGalleryCategories.Find(id);
            db.tblGalleryCategories.Remove(tblGalleryCategory);
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
