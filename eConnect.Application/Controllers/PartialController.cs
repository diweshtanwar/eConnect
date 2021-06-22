using eConnect.DataAccess;
using eConnect.Logic;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace eConnect.Application.Controllers
{
    public class PartialController : Controller
    {
        private eConnectAppEntities db = new eConnectAppEntities();
        // GET: Partial
        [ChildActionOnly]
        public ActionResult _GetAppMenu(int UserTypeId)
        {
            MenuLogic objMenuLogic = new MenuLogic();
            return View(objMenuLogic.GetAllMenuMainWithSubMenuByRoleId(UserTypeId));
        }
    
        // GET: Partial
        public ActionResult Index()
        {
            return View();
        }

        // GET: Partial/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Partial/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Partial/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Partial/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Partial/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Partial/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Partial/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
