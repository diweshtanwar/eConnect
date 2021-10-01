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
    public class GalleryDocumentController : Controller
    {
        List<SelectListItem> DocumenStatusList = new List<SelectListItem>()
            {
                new SelectListItem { Text = "Enable", Value = "True" },
                new SelectListItem { Text = "Disable", Value = "False" },

            };
        private eConnectAppEntities db = new eConnectAppEntities();

        // GET: GalleryDocument
        public ActionResult Index()
        {
            GalleryDocumentLogic objGalleryDocumentLogic = new GalleryDocumentLogic();

            return View(objGalleryDocumentLogic.GeAllGalleryDocument());
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
            ViewBag.Status = new SelectList(DocumenStatusList, "Value", "Text");
            return View();
        }

        // POST: GalleryDocument/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(GalleryCategoryModel GalleryCategoryModel)
        {
            if (ModelState.IsValid)
            {
                GalleryDocumentLogic objGalleryDocumentLogic = new GalleryDocumentLogic();
                GalleryCategoryModel.CategoryImagesPath = Path.Combine("~\\Content\\EgraminAssets\\assets\\images\\gallery-images", GalleryCategoryModel.CategoryTittle);
               
                if (!Directory.Exists(Server.MapPath(GalleryCategoryModel.CategoryImagesPath)))
                    Directory.CreateDirectory(Server.MapPath(GalleryCategoryModel.CategoryImagesPath));
                objGalleryDocumentLogic.InsertGalleryDocument(GalleryCategoryModel);
                return RedirectToAction("Index");
            }
            ViewBag.Status = new SelectList(DocumenStatusList, "Value", "Text", GalleryCategoryModel.Status);
            return View(GalleryCategoryModel);
        }

        // GET: GalleryDocument/Edit/5
        public ActionResult Edit(byte? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            GalleryDocumentLogic objGalleryDocumentLogic = new GalleryDocumentLogic();
            var data = objGalleryDocumentLogic.GetGalleryDocumentByID((int)id);
            if (data == null)
            {
                return HttpNotFound();
            }
            ViewBag.Status = new SelectList(DocumenStatusList, "Value", "Text", data.Status);
            return View(data);
        }

        // POST: GalleryDocument/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(GalleryCategoryModel GalleryCategoryModel)
        {
            if (ModelState.IsValid)
            {
                GalleryDocumentLogic objGalleryDocumentLogic = new GalleryDocumentLogic();
                GalleryCategoryModel.CategoryImagesPath = Path.Combine("~\\Content\\EgraminAssets\\assets\\images\\gallery-images", GalleryCategoryModel.CategoryTittle);
                objGalleryDocumentLogic.UpdateGalleryDocument(GalleryCategoryModel);
                return RedirectToAction("Index");
            }
            ViewBag.Status = new SelectList(DocumenStatusList, "Value", "Text", GalleryCategoryModel.Status);
            return View(GalleryCategoryModel);
        }
        public ActionResult UploadImage(byte? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            GalleryDocumentLogic objGalleryDocumentLogic = new GalleryDocumentLogic();
            var data = objGalleryDocumentLogic.GetGalleryDocumentByID((int)id);
            if (data == null)
            {
                return HttpNotFound();
            }
            ViewBag.Status = new SelectList(DocumenStatusList, "Value", "Text", data.Status);
            return View(data);
        }

        // POST: GalleryDocument/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult UploadImage(GalleryCategoryModel GalleryCategoryModel)
        {
            if (ModelState.IsValid)
            {
                if (GalleryCategoryModel.CategoryImage != null)
                {                   
                    string path = Path.Combine(System.Web.HttpContext.Current.Server.MapPath("~/" + GalleryCategoryModel.CategoryImagesPath), Path.GetFileName(GalleryCategoryModel.CategoryImage.FileName));

                    GalleryCategoryModel.CategoryImage.SaveAs(path);
                  
                }
                    return RedirectToAction("Index");
            }
            ViewBag.Status = new SelectList(DocumenStatusList, "Value", "Text", GalleryCategoryModel.Status);
            return View(GalleryCategoryModel);
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
