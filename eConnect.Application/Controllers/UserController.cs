﻿using System;
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
                new SelectListItem { Text = "Management", Value = "1" },
                new SelectListItem { Text = "Operation", Value = "2" },
                new SelectListItem { Text = "Finance", Value = "3" },
                new SelectListItem { Text = "Technical", Value = "4" },
                new SelectListItem { Text = "Head Office Staff", Value = "5" },
                new SelectListItem { Text = "Field Coordinator", Value = "6" },
            };
        List<SelectListItem> Designation = new List<SelectListItem>()
            {
                new SelectListItem { Text = "Director", Value = "1" },
                new SelectListItem { Text = "Manager", Value = "2" },
                new SelectListItem { Text = "Consultant", Value = "3" },
                new SelectListItem { Text = "IT Executive", Value = "4" },
                new SelectListItem { Text = "Accountant", Value = "5" },
                new SelectListItem { Text = "Assistant", Value = "6" },
                new SelectListItem { Text = "Messenger", Value = "7" },
                new SelectListItem { Text = "Coordinator", Value = "8" },

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
            ViewBag.Department = Department;
            ViewBag.Designation = Designation;
            ViewBag.City = new SelectList(objCityLogic.GetAllCities(), "CityId", "Name");
            ViewBag.Country = new SelectList(objCountryLogic.GetAllCountry(), "CountryId", "Name");
            ViewBag.State = new SelectList(objStateLogic.GetAllStates(), "StateId", "Name");
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
            Session["Image"]= UserDetail.PassportSizePic;
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
            string Image = "";
            if (objUser.PassportSizePhoto == null)
            {
                 Image = Session["Image"].ToString();
                 objUser.PassportSizePic = Image;
                 ModelState.Remove("PassportSizePhoto");
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
     
        public JsonResult BindCity(long state_id)
        {
            CityLogic sl = new CityLogic();
            IList<SelectListItem> citylist = new List<SelectListItem>();
            var clist = sl.GetAllCitiesByStateID(state_id);
            foreach (var dr in clist)
            {
                citylist.Add(new SelectListItem { Text = dr.Name.ToString(), Value = dr.CityId.ToString().ToString() });
            }
            return Json(citylist, JsonRequestBehavior.AllowGet);
        }
        public ActionResult ResetPassword(int? id)
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
            ResetPasswordViewModel objResetPasswordViewModel = new ResetPasswordViewModel();

            objResetPasswordViewModel.UserName = UserDetail.EmailId;
            objResetPasswordViewModel.UserID = objUserDetailLogic.EmailValidationforUser(UserDetail.EmailId);
            ViewBag.SuccessMsg = "";
            return View(objResetPasswordViewModel);
        }
        [HttpPost]
        public ActionResult ResetPassword(ResetPasswordViewModel ResetPasswordViewModel)
        {
            //ResetPasswordViewModel.UserName = (string)Session["UserName"];
            //ResetPasswordViewModel.UserType = (int)Session["UserTypeId"];
            //ResetPasswordViewModel.UserID = (int)Session["UserId"];
            if (ModelState.IsValid)
            {
                UserLogic objUserLogic = new UserLogic();
                objUserLogic.ResetPasswordLogic(ResetPasswordViewModel);
                ViewBag.SuccessMsg = "Password reset successfully!";
            }

            return View();
        }
        public JsonResult EmailExists(string EmailId)
        {
            string Msg = "";
            UserLogic objUserDetailLogic = new UserLogic();
            int UId = objUserDetailLogic.EmailValidationforUser(EmailId);
            
            if(UId != 0)
            {
                Msg = "Email address already exists";
                
            }
            return Json(Msg, JsonRequestBehavior.AllowGet);
        }

    }
}
