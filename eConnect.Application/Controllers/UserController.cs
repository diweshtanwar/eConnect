using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using eConnect.DataAccess;
using eConnect.Model;
using eConnect.Logic;
using System.IO;
using System.Configuration;

namespace eConnect.Application.Controllers
{
    public class UserController : Controller
    {
        string UserFilePath = System.Web.HttpContext.Current.Server.MapPath(Convert.ToString(ConfigurationManager.AppSettings["UserFilePath"]));
        List<SelectListItem> Department = new List<SelectListItem>()
            {
                new SelectListItem { Text = "OPS", Value = "1" },
                new SelectListItem { Text = "BAT", Value = "2" },

            };
        List<SelectListItem> Designation = new List<SelectListItem>()
            {
                new SelectListItem { Text = "Programmer I", Value = "1" },
                new SelectListItem { Text = "Programmer II", Value = "2" },

            };
        public ActionResult Index()
        
        {
            UserLogic objUserDetailLogic = new UserLogic();
            var tblUserDetails = objUserDetailLogic.GetAllUserDetail();
            StatusLogic objStatusLogic = new StatusLogic();
            CityLogic objCityLogic = new CityLogic();
            CountryLogic objCountryLogic = new CountryLogic();
            StateLogic objStateLogic = new StateLogic();
            ViewBag.Designation = Designation;
            ViewBag.Department = Department;
            ViewBag.City = new SelectList(objCityLogic.GetAllCities(), "CityId", "Name");
            ViewBag.Country = new SelectList(objCountryLogic.GetAllCountry(), "CountryId", "Name");
            ViewBag.State = new SelectList(objStateLogic.GetAllStates(), "StateId", "Name");
            bool flag = Convert.ToBoolean(TempData["flag"]);
            if(flag == true)
            {
                tblUserDetails = TempData["searchdata"] as List<tblUserDetail>;
            }
           
            return View(tblUserDetails.ToList());
        }

        public ActionResult IndexSearch(string Name, string Qualification, string Designation, string Country, string State, string City)
        {
            StatusLogic objStatusLogic = new StatusLogic();
            CityLogic objCityLogic = new CityLogic();
            CountryLogic objCountryLogic = new CountryLogic();
            StateLogic objStateLogic = new StateLogic();
            UserLogic objUserDetailLogic = new UserLogic();
            var tblUserDetails = objUserDetailLogic.GetAllUserDetailSearch( Name,  Qualification,  Designation,  Country,  State,City);
            TempData["searchdata"] = tblUserDetails.ToList();
            TempData["flag"] = true;
            //return RedirectToAction("Index", tblUserDetails.ToList());
            return RedirectToAction("Index");
             //return View("Index");
        }
        public ActionResult Create()
        {
            StatusLogic objStatusLogic = new StatusLogic();
            CityLogic objCityLogic = new CityLogic();
            CountryLogic objCountryLogic = new CountryLogic();
            StateLogic objStateLogic = new StateLogic();

            ViewBag.Department = Department;
            ViewBag.Designation = Designation;
            ViewBag.City = new SelectList(objCityLogic.GetAllCities(), "CityId", "Name");
            ViewBag.Country = new SelectList(objCountryLogic.GetAllCountry(), "CountryId", "Name");
            ViewBag.State = new SelectList(objStateLogic.GetAllStates(), "StateId", "Name");


            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Userinput objUser)
        {
            StatusLogic objStatusLogic = new StatusLogic();
            CityLogic objCityLogic = new CityLogic();
            CountryLogic objCountryLogic = new CountryLogic();
            StateLogic objStateLogic = new StateLogic();
            if (ModelState.IsValid)
            {
                string fpath = string.Empty;
                UserLogic objUserDetailLogic = new UserLogic();
                long UserID = objUserDetailLogic.InsertUserDetail(objUser);
                string path = Path.Combine(UserFilePath, UserID.ToString());
                if (objUser.PassportSizePhoto != null)
                {
                    fpath = CheckDirectory(path, "UserPassportSizePhoto", objUser.PassportSizePhoto);
                    objUser.PassportSizePhoto.SaveAs(fpath);
                }
                ViewBag.Department = Department;
                ViewBag.Designation = Designation;
                ViewBag.City = new SelectList(objCityLogic.GetAllCities(), "CityId", "Name");
                ViewBag.Country = new SelectList(objCountryLogic.GetAllCountry(), "CountryId", "Name");
                ViewBag.State = new SelectList(objStateLogic.GetAllStates(), "StateId", "Name");
                TempData["Message"] = "Record submitted successfully";
                return RedirectToAction("Index");
            }
            return View(objUser);
        }

        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            UserLogic objUserDetailLogic = new UserLogic();
            Userinput UserDetail = objUserDetailLogic.GetUserDetailByID((int)id);
            if (UserDetail == null)
            {
                return HttpNotFound();
            }
            StatusLogic objStatusLogic = new StatusLogic();
            CityLogic objCityLogic = new CityLogic();
            CountryLogic objCountryLogic = new CountryLogic();
            StateLogic objStateLogic = new StateLogic();

            ViewBag.Department = Department;
            ViewBag.Designation = Designation;
            ViewBag.City = new SelectList(objCityLogic.GetAllCities(), "CityId", "Name");
            ViewBag.Country = new SelectList(objCountryLogic.GetAllCountry(), "CountryId", "Name");
            ViewBag.State = new SelectList(objStateLogic.GetAllStates(), "StateId", "Name");
            return View(UserDetail);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Userinput objUser)
        {
            StatusLogic objStatusLogic = new StatusLogic();
            CityLogic objCityLogic = new CityLogic();
            CountryLogic objCountryLogic = new CountryLogic();
            StateLogic objStateLogic = new StateLogic();
            if (ModelState.IsValid)
            {
                string fpath = string.Empty;
                UserLogic objUserDetailLogic = new UserLogic();
                objUserDetailLogic.UpdateUserDetail(objUser);
                string path = Path.Combine(UserFilePath, objUser.Id.ToString());
                if (objUser.PassportSizePhoto != null)
                {
                    fpath = CheckDirectory(path, "UserPassportSizePhoto", objUser.PassportSizePhoto);
                    objUser.PassportSizePhoto.SaveAs(fpath);
                }
                ViewBag.Department = Department;
                ViewBag.Designation = Designation;
                ViewBag.City = new SelectList(objCityLogic.GetAllCities(), "CityId", "Name");
                ViewBag.Country = new SelectList(objCountryLogic.GetAllCountry(), "CountryId", "Name");
                ViewBag.State = new SelectList(objStateLogic.GetAllStates(), "StateId", "Name");
                TempData["Message"] = "Record submitted successfully";
                return RedirectToAction("Index");
            }
            return View(objUser);
        }

        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            UserLogic objUserDetailLogic = new UserLogic();
            Userinput UserDetail = objUserDetailLogic.GetUserDetailByID((int)id);
               
            if (UserDetail == null)
            {
                return HttpNotFound();
            }
            StatusLogic objStatusLogic = new StatusLogic();
            CityLogic objCityLogic = new CityLogic();
            CountryLogic objCountryLogic = new CountryLogic();
            StateLogic objStateLogic = new StateLogic();

            ViewBag.Department = Department;
            ViewBag.Designation = Designation;
            ViewBag.City = new SelectList(objCityLogic.GetAllCities(), "CityId", "Name");
            ViewBag.Country = new SelectList(objCountryLogic.GetAllCountry(), "CountryId", "Name");
            ViewBag.State = new SelectList(objStateLogic.GetAllStates(), "StateId", "Name");
            return View(UserDetail);
           
        }

        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            UserLogic objUserDetailLogic = new UserLogic();
            Userinput UserDetail = objUserDetailLogic.GetUserDetailByID((int)id);
            if (UserDetail == null)
            {
                return HttpNotFound();
            }
            StatusLogic objStatusLogic = new StatusLogic();
            CityLogic objCityLogic = new CityLogic();
            CountryLogic objCountryLogic = new CountryLogic();
            StateLogic objStateLogic = new StateLogic();

            ViewBag.Department = Department;
            ViewBag.Designation = Designation;
            ViewBag.City = new SelectList(objCityLogic.GetAllCities(), "CityId", "Name");
            ViewBag.Country = new SelectList(objCountryLogic.GetAllCountry(), "CountryId", "Name");
            ViewBag.State = new SelectList(objStateLogic.GetAllStates(), "StateId", "Name");
            return View(UserDetail);
        }

       
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            UserLogic objUserDetailLogic = new UserLogic();
            objUserDetailLogic.DeleteUserDetail(id);
            return RedirectToAction("Index");
        }

        public string CheckDirectory(string path, string filetype, HttpPostedFileBase postedfile)
        {
            string fullpath = string.Empty;
            fullpath = Path.Combine(path, filetype);
            if (!Directory.Exists(fullpath))
            {
                Directory.CreateDirectory(fullpath);
            }
            fullpath = fullpath + "\\" + Path.GetFileName(postedfile.FileName);
            return fullpath;
        }
    }
}
