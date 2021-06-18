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
    public class tblUsersController : Controller
    {
        private eConnectAppEntities db = new eConnectAppEntities();

        // GET: tblUsers
        public ActionResult Index()
        {
            var tblUsers = db.tblUsers.Include(t => t.tblStatu).Include(t => t.tblUser1).Include(t => t.tblUser2);
            return View(tblUsers.ToList());
        }

        // GET: tblUsers/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblUser tblUser = db.tblUsers.Find(id);
            if (tblUser == null)
            {
                return HttpNotFound();
            }
            return View(tblUser);
        }

        // GET: tblUsers/Create
        public ActionResult Create()
        {
            ViewBag.Status = new SelectList(db.tblStatus, "StatusId", "Type");
            ViewBag.CreatedBy = new SelectList(db.tblUsers, "UserId", "UserName");
            ViewBag.UpdatedBy = new SelectList(db.tblUsers, "UserId", "UserName");
            return View();
        }

        // POST: tblUsers/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "UserId,UserName,Password,UserType,UserSourceId,Status,CreatedDate,CreatedBy,UpdatedDate,UpdatedBy")] tblUser tblUser)
        {
            if (ModelState.IsValid)
            {
                db.tblUsers.Add(tblUser);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Status = new SelectList(db.tblStatus, "StatusId", "Type", tblUser.Status);
            ViewBag.CreatedBy = new SelectList(db.tblUsers, "UserId", "UserName", tblUser.CreatedBy);
            ViewBag.UpdatedBy = new SelectList(db.tblUsers, "UserId", "UserName", tblUser.UpdatedBy);
            return View(tblUser);
        }

        // GET: tblUsers/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblUser tblUser = db.tblUsers.Find(id);
            if (tblUser == null)
            {
                return HttpNotFound();
            }
            ViewBag.Status = new SelectList(db.tblStatus, "StatusId", "Type", tblUser.Status);
            ViewBag.CreatedBy = new SelectList(db.tblUsers, "UserId", "UserName", tblUser.CreatedBy);
            ViewBag.UpdatedBy = new SelectList(db.tblUsers, "UserId", "UserName", tblUser.UpdatedBy);
            return View(tblUser);
        }

        // POST: tblUsers/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "UserId,UserName,Password,UserType,UserSourceId,Status,CreatedDate,CreatedBy,UpdatedDate,UpdatedBy")] tblUser tblUser)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tblUser).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Status = new SelectList(db.tblStatus, "StatusId", "Type", tblUser.Status);
            ViewBag.CreatedBy = new SelectList(db.tblUsers, "UserId", "UserName", tblUser.CreatedBy);
            ViewBag.UpdatedBy = new SelectList(db.tblUsers, "UserId", "UserName", tblUser.UpdatedBy);
            return View(tblUser);
        }

        // GET: tblUsers/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblUser tblUser = db.tblUsers.Find(id);
            if (tblUser == null)
            {
                return HttpNotFound();
            }
            return View(tblUser);
        }

        // POST: tblUsers/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            tblUser tblUser = db.tblUsers.Find(id);
            db.tblUsers.Remove(tblUser);
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
