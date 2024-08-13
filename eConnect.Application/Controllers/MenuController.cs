﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using eConnect.DataAccess;
using eConnect.Logic;
using NLog;
namespace eConnect.Application.Controllers
{
    public class MenuController : Controller
    {
        private static Logger logger = LogManager.GetLogger("EConnectLogRules");
        private eConnectAppEntities db = new eConnectAppEntities();
         
        // GET: tblMenuSubs
        List<SelectListItem> menuStatus = new List<SelectListItem>()
            {
                new SelectListItem { Text = "Active", Value = "True" },
                new SelectListItem { Text = "InActive", Value = "False" },

            };
        // GET: Menu
        public ActionResult Index()
        {
            MenuLogic objMenuLogic = new MenuLogic();
            RoleMasterLogic objRoleMasterLogic = new RoleMasterLogic();
            var menuData = objMenuLogic.GetAllSubMain(); 
            ViewBag.Status = new SelectList(menuStatus, "Value", "Text");         
            ViewBag.MenuMainId = new SelectList(objMenuLogic.GetAllMainMenu(), "MenuMainId", "Tittle");
            ViewBag.RoleId = new SelectList(objRoleMasterLogic.GetAllRoles(), "RoleId", "Name");
            return View(menuData.ToList());
        }
        public ActionResult IndexSearch(int? MenuMainId, int? RoleId, string ScreenTittle, bool? Status)
        {
            MenuLogic objMenuLogic = new MenuLogic();
            RoleMasterLogic objRoleMasterLogic = new RoleMasterLogic();
            var menuData = objMenuLogic.GetAllSubMainDetailSearch(MenuMainId,RoleId, ScreenTittle, Status);
            ViewBag.Status = new SelectList(menuStatus, "Value", "Text");
            ViewBag.MenuMainId = new SelectList(objMenuLogic.GetAllMainMenu(), "MenuMainId", "Tittle");
            ViewBag.RoleId = new SelectList(objRoleMasterLogic.GetAllRoles(), "RoleId", "Name");
            return View("Index", menuData.ToList());
        }

        // GET: tblMenuSubs/Details/5
        public ActionResult Details(int id)
        {
            MenuLogic objMenuLogic = new MenuLogic();
            RoleMasterLogic objRoleMasterLogic = new RoleMasterLogic();
         
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblMenuSub tblMenuSub = objMenuLogic.GetSubMainById(id);
            if (tblMenuSub == null)
            {
                return HttpNotFound();
            }
            ViewBag.MenuMainId = new SelectList(objMenuLogic.GetAllMainMenu(), "MenuMainId", "Tittle", tblMenuSub.MenuMainId);
            ViewBag.RoleId = new SelectList(objRoleMasterLogic.GetAllRoles(), "RoleId", "Name", tblMenuSub.RoleId);
            ViewBag.Status = new SelectList(menuStatus, "Value", "Text", tblMenuSub.Status);
            return View(tblMenuSub);
        }

        // GET: tblMenuSubs/Create
        public ActionResult Create()
        {
            try
            {
                MenuLogic objMenuLogic = new MenuLogic();
                RoleMasterLogic objRoleMasterLogic = new RoleMasterLogic();
                ViewBag.MenuMainId = new SelectList(objMenuLogic.GetAllMainMenu(), "MenuMainId", "Tittle");
                ViewBag.RoleId = new SelectList(objRoleMasterLogic.GetAllRoles(), "RoleId", "Name");
                ViewBag.Status = new SelectList(menuStatus, "Value", "Text");
            }
            catch(Exception ex)
            {
                logger.Error("Create Menu Create" + " " + ex.Message);

            }

            return View();
        }

        // POST: tblMenuSubs/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(tblMenuSub tblMenuSub)
        {
            MenuLogic objMenuLogic = new MenuLogic();
            RoleMasterLogic objRoleMasterLogic = new RoleMasterLogic();
            if (ModelState.IsValid)
            {               
                objMenuLogic.InsertSubMainWithMenuMenu(tblMenuSub);               
                return RedirectToAction("Index");
            }

            ViewBag.MenuMainId = new SelectList(objMenuLogic.GetAllMainMenu(), "MenuMainId", "Tittle", tblMenuSub.MenuMainId);
            ViewBag.RoleId = new SelectList(objRoleMasterLogic.GetAllRoles(), "RoleId", "Name", tblMenuSub.RoleId);
            ViewBag.Status = new SelectList(menuStatus, "Value", "Text", tblMenuSub.Status);
            return View(tblMenuSub);
        }

        // GET: tblMenuSubs/Create
        public ActionResult CreateNew()
        {
            MenuLogic objMenuLogic = new MenuLogic();
            RoleMasterLogic objRoleMasterLogic = new RoleMasterLogic();
            ViewBag.MenuMainId = new SelectList(objMenuLogic.GetAllMainMenu(), "MenuMainId", "Tittle");
            ViewBag.MenuSubId = new SelectList(objMenuLogic.GetAllSubMain(), "MenuSubId", "Tittle");
            ViewBag.RoleId = new SelectList(objRoleMasterLogic.GetAllRoles(), "RoleId", "Name");
            ViewBag.Status = new SelectList(menuStatus, "Value", "Text");
            return View();
        }

        // POST: tblMenuSubs/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CreateNew(tblMenuSub tblMenuSub)
        {
            MenuLogic objMenuLogic = new MenuLogic();
            RoleMasterLogic objRoleMasterLogic = new RoleMasterLogic();
            if (ModelState.IsValid)
            {
                tblMenuSub.Controller = objMenuLogic.GetSubMainById(tblMenuSub.MenuSubId).Controller.ToString();
                tblMenuSub.Action = objMenuLogic.GetSubMainById(tblMenuSub.MenuSubId).Action.ToString();
                tblMenuSub.Tittle = objMenuLogic.GetSubMainById(tblMenuSub.MenuSubId).Tittle.ToString();
                objMenuLogic.InsertSubMainWithMenuMenu(tblMenuSub);
                return RedirectToAction("Index");
            }

            ViewBag.MenuMainId = new SelectList(objMenuLogic.GetAllMainMenu(), "MenuMainId", "Tittle", tblMenuSub.MenuMainId);
            ViewBag.MenuSubId = new SelectList(objMenuLogic.GetAllSubMain(), "MenuSubId", "Tittle");
            ViewBag.RoleId = new SelectList(objRoleMasterLogic.GetAllRoles(), "RoleId", "Name", tblMenuSub.RoleId);
            ViewBag.Status = new SelectList(menuStatus, "Value", "Text", tblMenuSub.Status);
            return View(tblMenuSub);
        }

        public ActionResult EditNew(int id)
        {

            MenuLogic objMenuLogic = new MenuLogic();
            RoleMasterLogic objRoleMasterLogic = new RoleMasterLogic();
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblMenuSub tblMenuSub = objMenuLogic.GetSubMainById(id);
            if (tblMenuSub == null)
            {
                return HttpNotFound();
            }
            ViewBag.MenuMainId = new SelectList(objMenuLogic.GetAllMainMenu(), "MenuMainId", "Tittle", tblMenuSub.MenuMainId);
            ViewBag.MenuSubIdSelect = new SelectList(objMenuLogic.GetAllSubMain(), "MenuSubId", "Tittle", tblMenuSub.MenuSubId);
            ViewBag.RoleId = new SelectList(objRoleMasterLogic.GetAllRoles(), "RoleId", "Name", tblMenuSub.RoleId);
            ViewBag.Status = new SelectList(menuStatus, "Value", "Text", tblMenuSub.Status);
            return View(tblMenuSub);
        }

        // POST: tblMenuSubs/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditNew(tblMenuSub tblMenuSub, int MenuSubIdSelect)
        {
            MenuLogic objMenuLogic = new MenuLogic();
            RoleMasterLogic objRoleMasterLogic = new RoleMasterLogic();
            if (ModelState.IsValid)
            {
                tblMenuSub.Controller = objMenuLogic.GetSubMainById(MenuSubIdSelect).Controller.ToString();
                tblMenuSub.Action = objMenuLogic.GetSubMainById(MenuSubIdSelect).Action.ToString();
                tblMenuSub.Tittle = objMenuLogic.GetSubMainById(MenuSubIdSelect).Tittle.ToString();
                objMenuLogic.UpdateSubMainWithMenuMenu(tblMenuSub);
                return RedirectToAction("Index");
            }
            ViewBag.MenuMainId = new SelectList(objMenuLogic.GetAllMainMenu(), "MenuMainId", "Tittle", tblMenuSub.MenuMainId);
            ViewBag.MenuSubIdSelect = new SelectList(objMenuLogic.GetAllSubMain(), "MenuSubId", "Tittle", tblMenuSub.MenuSubId);
            ViewBag.RoleId = new SelectList(objRoleMasterLogic.GetAllRoles(), "RoleId", "Name", tblMenuSub.RoleId);
            ViewBag.Status = new SelectList(menuStatus, "Value", "Text", tblMenuSub.Status);
            return View(tblMenuSub);
        }

        // GET: tblMenuSubs/Edit/5
        public ActionResult Edit(int id)
        {

            MenuLogic objMenuLogic = new MenuLogic();
            RoleMasterLogic objRoleMasterLogic = new RoleMasterLogic();
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblMenuSub tblMenuSub = objMenuLogic.GetSubMainById(id);
            if (tblMenuSub == null)
            {
                return HttpNotFound();
            }
            ViewBag.MenuMainId = new SelectList(objMenuLogic.GetAllMainMenu(), "MenuMainId", "Tittle", tblMenuSub.MenuMainId);          
            ViewBag.RoleId = new SelectList(objRoleMasterLogic.GetAllRoles(), "RoleId", "Name", tblMenuSub.RoleId);
            ViewBag.Status = new SelectList(menuStatus, "Value", "Text", tblMenuSub.Status);
            return View(tblMenuSub);
        }

        // POST: tblMenuSubs/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(tblMenuSub tblMenuSub)
        {
            MenuLogic objMenuLogic = new MenuLogic();
            RoleMasterLogic objRoleMasterLogic = new RoleMasterLogic();
            if (ModelState.IsValid)
            {
                objMenuLogic.UpdateSubMainWithMenuMenu(tblMenuSub);
                return RedirectToAction("Index");
            }
            ViewBag.MenuMainId = new SelectList(objMenuLogic.GetAllMainMenu(), "MenuMainId", "Tittle", tblMenuSub.MenuMainId);
            ViewBag.RoleId = new SelectList(objRoleMasterLogic.GetAllRoles(), "RoleId", "Name", tblMenuSub.RoleId);
            ViewBag.Status = new SelectList(menuStatus, "Value", "Text", tblMenuSub.Status);
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
