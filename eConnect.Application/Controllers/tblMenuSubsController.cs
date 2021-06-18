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
    public class tblMenuSubsController : Controller
    {
        private eConnectAppEntities db = new eConnectAppEntities();

        // GET: tblMenuSubs
        public ActionResult Index()
        {
            var data = db.tblMenuSubs.Include("tblMenuMain").ToList();
            //var tblMenuSubs = db.tblMenuSubs.Include(t => t.tblMenuMain);
            //return View(tblMenuSubs.ToList());
            return View(data);
        }

        // GET: tblMenuSubs/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblMenuSub tblMenuSub = db.tblMenuSubs.Find(id);
            if (tblMenuSub == null)
            {
                return HttpNotFound();
            }
            return View(tblMenuSub);
        }

        // GET: tblMenuSubs/Create
        public ActionResult Create()
        {
            ViewBag.MenuMainId = new SelectList(db.tblMenuMains, "MenuMainId", "Tittle");
            return View();
        }

        // POST: tblMenuSubs/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MenuSubId,MenuMainId,Tittle,Controller,Action,Status,CreatedDate,CreatedBy,UpdatedDate,UpdatedBy")] tblMenuSub tblMenuSub)
        {
            if (ModelState.IsValid)
            {
                db.tblMenuSubs.Add(tblMenuSub);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.MenuMainId = new SelectList(db.tblMenuMains, "MenuMainId", "Tittle", tblMenuSub.MenuMainId);
            return View(tblMenuSub);
        }

        // GET: tblMenuSubs/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblMenuSub tblMenuSub = db.tblMenuSubs.Find(id);
            if (tblMenuSub == null)
            {
                return HttpNotFound();
            }
            ViewBag.MenuMainId = new SelectList(db.tblMenuMains, "MenuMainId", "Tittle", tblMenuSub.MenuMainId);
            return View(tblMenuSub);
        }

        // POST: tblMenuSubs/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MenuSubId,MenuMainId,Tittle,Controller,Action,Status,CreatedDate,CreatedBy,UpdatedDate,UpdatedBy")] tblMenuSub tblMenuSub)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tblMenuSub).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.MenuMainId = new SelectList(db.tblMenuMains, "MenuMainId", "Tittle", tblMenuSub.MenuMainId);
            return View(tblMenuSub);
        }

        // GET: tblMenuSubs/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblMenuSub tblMenuSub = db.tblMenuSubs.Find(id);
            if (tblMenuSub == null)
            {
                return HttpNotFound();
            }
            return View(tblMenuSub);
        }

        // POST: tblMenuSubs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            tblMenuSub tblMenuSub = db.tblMenuSubs.Find(id);
            db.tblMenuSubs.Remove(tblMenuSub);
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
