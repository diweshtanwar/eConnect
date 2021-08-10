using eConnect.Application.Models;
using eConnect.DataAccess;
using eConnect.Logic;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace eConnect.Application.Controllers
{
    public class PartialController : Controller
    {
        private eConnectAppEntities db = new eConnectAppEntities();


        /// <summar-eGramin>
  
        // GET: Partial
        [ChildActionOnly]
        public ActionResult GetNotification()
        {
            var NotificationSubject = db.tblNotifications.Where(d => d.Status == true).Select(d => d.NotificationSubject).FirstOrDefault();
            ViewBag.NotificationSubject = NotificationSubject;
            return View();
        }

        [ChildActionOnly]
        public ActionResult GetNotificationDetails()
        {
            var NotificationDetails = db.tblNotifications.Where(d => d.Status == true).Select(d => d.NotificationDetails).FirstOrDefault();
            ViewBag.NotificationDetails = NotificationDetails;
            return View();
        }
        [ChildActionOnly]
        public ActionResult GetGalleryImagesForTittle(int? id)
        {
            tblGalleryCategory tblGalleryCategory = db.tblGalleryCategories.Find(id);
            List<string> getImgesList = new List<string>();
            getImgesList = Directory.GetFiles(AppDomain.CurrentDomain.BaseDirectory + tblGalleryCategory.CategoryImagesPath.ToString(), "*.jpg", SearchOption.AllDirectories).Take(4).ToList();
            List<string> ImgesListWithPath = new List<string>();
            foreach (string file in getImgesList)
            {
                var fileName = Path.GetFileName(file);
                ImgesListWithPath.Add("~\\" + tblGalleryCategory.CategoryImagesPath.ToString() + "\\" + fileName);
            }

            ViewBag.ImgesListWithPath = ImgesListWithPath;
            return View();
        }
        [ChildActionOnly]
        public ActionResult GetLatestNewsForHome()
        {
            return View(db.tblLatestNews.Where(d => d.Status == true).OrderBy(d => d.Priority).Take(3).ToList());
        }

        [ChildActionOnly]
        public ActionResult GetSubNewsForNewsDetails()
        {
            return View(db.tblLatestNews.Where(d => d.Status == true).OrderBy(d => d.Priority).Take(5).ToList());
        }
        /// </summary-eGramin>
        /// <returns></returns>
        // GET: Partial
        [ChildActionOnly]
        public ActionResult _GetAppMenu()
        {
            if (Session != null && Session["UserTypeId"] != null)
            {
                int UserTypeId = (int)Session["UserTypeId"];
                MenuLogic objMenuLogic = new MenuLogic();
                var data = objMenuLogic.GetAllMenuMainWithSubMenuByRoleId(UserTypeId);
                if (!(data == null))
                {
                    return View(data);
                }
            }
            return View();
        }
        [ChildActionOnly]
        public ActionResult _GetAnnouncementMessage()
        {
            AnnouncementLogic objAnnouncementLogic = new AnnouncementLogic();         
           ViewBag.AnnouncementMessage = objAnnouncementLogic.GetAnnouncementMessage();
            return View();
        }

        [ChildActionOnly]
        public ActionResult _GetAnnouncementDetail()
        {
            AnnouncementLogic objAnnouncementLogic = new AnnouncementLogic();
            ViewBag.AnnouncementDetail = objAnnouncementLogic.GetAnnouncementDetail();
            return View();
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
