using eConnect.DataAccess;
using eConnect.Logic;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace eConnect.Application.Controllers
{
    public class AnnouncementsController : Controller
    {
        List<SelectListItem> AnnouncementStatus = new List<SelectListItem>()
            {
                new SelectListItem { Text = "Enable", Value = "True" },
                new SelectListItem { Text = "Disable", Value = "False" },

            };
        // GET: Announcements
        public ActionResult Index()
        {
            AnnouncementLogic objAnnouncementLogic = new AnnouncementLogic();
            return View(objAnnouncementLogic.GetAllAnnouncement());
        }

        // GET: Announcements/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Announcements/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Announcements/Create
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

        // GET: Announcements/Edit/5
        public ActionResult Edit(int id)
        {
            AnnouncementLogic objAnnouncementLogic = new AnnouncementLogic();
            ViewBag.Status = new SelectList(AnnouncementStatus, "Value", "Text");
            return View(objAnnouncementLogic.GetAnnouncementById(id));
         
        }

        // POST: Announcements/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(tblAnnouncement tblAnnouncement)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    AnnouncementLogic objAnnouncementLogic = new AnnouncementLogic();
                    objAnnouncementLogic.UpdateAnnouncement(tblAnnouncement);
                    return RedirectToAction("Index");
                }
                ViewBag.Status = new SelectList(AnnouncementStatus, "Value", "Text",tblAnnouncement.Status);
                return View(tblAnnouncement);
            }
            catch
            {
                return View();
            }
        }

        // GET: Announcements/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Announcements/Delete/5
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
