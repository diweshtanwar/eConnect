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
    public class CSPController : Controller
    {     
        string CSPFilePath = System.Web.HttpContext.Current.Server.MapPath(Convert.ToString(ConfigurationManager.AppSettings["CSPFilePath"]));
        List<SelectListItem> CertificateStatusList = new List<SelectListItem>()
            {
                new SelectListItem { Text = "Yes", Value = "Yes" },
                new SelectListItem { Text = "No", Value = "No" },            

            };
        List<SelectListItem> IsPasswordResetWithPanList = new List<SelectListItem>()
            {
                new SelectListItem { Text = "Yes", Value = "Yes" },
                new SelectListItem { Text = "No", Value = "No" },

            };
        // GET: CSP

        public ActionResult Dashboard()
        {
            RaiseRequestLogic objRaiseRequestLogic = new RaiseRequestLogic();
         var data= objRaiseRequestLogic.GetDashboardCSPData(Convert.ToInt32(Session["CSPID"].ToString()));
            ViewBag.WithdrawOpenCount = data.WithdrawOpenCount;
            ViewBag.WithdrawInProgressCount = data.WithdrawInProgressCount;
            ViewBag.WithdrawCompletedCount = data.WithdrawCompletedCount;

            ViewBag.DepositOpenCount = data.DepositOpenCount;
            ViewBag.DepositInProgressCount = data.DepositInProgressCount;
            ViewBag.DepositCompletedCount = data.DepositCompletedCount;

            ViewBag.TechOpenCount = data.TechOpenCount;
            ViewBag.TechInProgressCount = data.TechInProgressCount;
            ViewBag.TechCompletedCount = data.TechCompletedCount;
            return View();
        }
        public ActionResult Index()
        {
            UserCSPDetailLogic objUserCSPDetailLogic = new UserCSPDetailLogic();
            var tblUserCSPDetails = objUserCSPDetailLogic.GetAllUserCSPDetail();
            StatusLogic objStatusLogic = new StatusLogic();
            ViewBag.Status = new SelectList(objStatusLogic.GetUserStatus(), "StatusId", "Name");
            ViewBag.CertificateStatus = CertificateStatusList;
            return View(tblUserCSPDetails.ToList());
        }
        public ActionResult IndexSearch(string CSPCode, string CSPName, string BranchCode, byte? Status, string CertificateStatus)
        {
            UserCSPDetailLogic objUserCSPDetailLogic = new UserCSPDetailLogic();
            var tblUserCSPDetails = objUserCSPDetailLogic.GetAllUserCSPDetailSearch(CSPCode, CSPName, BranchCode, Status, CertificateStatus);
            StatusLogic objStatusLogic = new StatusLogic();
            ViewBag.Status = new SelectList(objStatusLogic.GetUserStatus(), "StatusId", "Name");
            ViewBag.CertificateStatus = CertificateStatusList;
            return View("Index",tblUserCSPDetails.ToList());
        }

        // GET: CSP/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            UserCSPDetailLogic objUserCSPDetailLogic = new UserCSPDetailLogic();          
            UserCSPDetail UserCSPDetail = objUserCSPDetailLogic.GetUserCSPDetailByID((int)id);
            if (UserCSPDetail == null)
            {
                return HttpNotFound();
            }
            StatusLogic objStatusLogic = new StatusLogic();
            CityLogic objCityLogic = new CityLogic();
            CountryLogic objCountryLogic = new CountryLogic();
            StateLogic objStateLogic = new StateLogic();
            BranchCodeLogic objBranchCodeLogic = new BranchCodeLogic();
            CategoryLogic objCategoryLogic = new CategoryLogic();
            LocationLogic objLocationLogic = new LocationLogic();
            ViewBag.Status = new SelectList(objStatusLogic.GetUserStatus(), "StatusId", "Name", UserCSPDetail.Status);
            ViewBag.City = new SelectList(objCityLogic.GetAllCities(), "CityId", "Name", UserCSPDetail.City);
            ViewBag.Country = new SelectList(objCountryLogic.GetAllCountry(), "CountryId", "Name", UserCSPDetail.Country);
            ViewBag.State = new SelectList(objStateLogic.GetAllStates(), "StateId", "Name", UserCSPDetail.State);
            ViewBag.CertificateStatus = new SelectList(CertificateStatusList, "Text", "Value", UserCSPDetail.CertificateStatus);
            ViewBag.BranchCode = new SelectList(objBranchCodeLogic.GetAllBranchCode(), "BranchCode", "BranchCode");
            ViewBag.Category = new SelectList(objCategoryLogic.GetAllCategory(), "Category", "Category");
            ViewBag.Location = new SelectList(objLocationLogic.GetAllLocation(), "Location", "Location");
            return View(UserCSPDetail);
        }

        public ActionResult View(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            UserCSPDetailLogic objUserCSPDetailLogic = new UserCSPDetailLogic();
            UserCSPDetail UserCSPDetail = objUserCSPDetailLogic.GetUserCSPDetailByID((int)id);
            if (UserCSPDetail == null)
            {
                return HttpNotFound();
            }
            StatusLogic objStatusLogic = new StatusLogic();
            CityLogic objCityLogic = new CityLogic();
            CountryLogic objCountryLogic = new CountryLogic();
            StateLogic objStateLogic = new StateLogic();
            BranchCodeLogic objBranchCodeLogic = new BranchCodeLogic();
            CategoryLogic objCategoryLogic = new CategoryLogic();
            LocationLogic objLocationLogic = new LocationLogic();
            ViewBag.Status = new SelectList(objStatusLogic.GetUserStatus(), "StatusId", "Name", UserCSPDetail.Status);
            ViewBag.City = new SelectList(objCityLogic.GetAllCities(), "CityId", "Name", UserCSPDetail.City);
            ViewBag.Country = new SelectList(objCountryLogic.GetAllCountry(), "CountryId", "Name", UserCSPDetail.Country);
            ViewBag.State = new SelectList(objStateLogic.GetAllStates(), "StateId", "Name", UserCSPDetail.State);
            ViewBag.CertificateStatus = new SelectList(CertificateStatusList, "Text", "Value", UserCSPDetail.CertificateStatus);
            ViewBag.BranchCode = new SelectList(objBranchCodeLogic.GetAllBranchCode(), "BranchCode", "BranchCode");
            ViewBag.Category = new SelectList(objCategoryLogic.GetAllCategory(), "Category", "Category");
            ViewBag.Location = new SelectList(objLocationLogic.GetAllLocation(), "Location", "Location");
            return View(UserCSPDetail);
        }
        public JsonResult IsCSPCodeExist( string CSPCode, int? id)
        {

            UserCSPDetailLogic objUserCSPDetailLogic = new UserCSPDetailLogic();
            UserCSPDetail UserCSPDetail = objUserCSPDetailLogic.GetUserCSPDetailByID((int)id);
            if (UserCSPDetail.CSPCode == CSPCode)
            {
                return Json(false, JsonRequestBehavior.AllowGet);
            }
            else
            {
                return Json(true, JsonRequestBehavior.AllowGet);
            }
        }
        // GET: CSP/Create
        public ActionResult Create()
        {
            StatusLogic objStatusLogic = new StatusLogic();
            CityLogic objCityLogic = new CityLogic();
            CountryLogic objCountryLogic = new CountryLogic();
            StateLogic objStateLogic = new StateLogic();
            BranchCodeLogic objBranchCodeLogic = new BranchCodeLogic();
            CategoryLogic objCategoryLogic = new CategoryLogic();
            LocationLogic objLocationLogic = new LocationLogic();


            ViewBag.Status = new SelectList(objStatusLogic.GetUserStatus(), "StatusId", "Name");
            ViewBag.City = new SelectList(objCityLogic.GetAllCities(), "CityId", "Name");
            ViewBag.Country = new SelectList(objCountryLogic.GetAllCountry(), "CountryId", "Name");
            ViewBag.State = new SelectList(objStateLogic.GetAllStates(), "StateId", "Name");
            ViewBag.BranchCode = new SelectList(objBranchCodeLogic.GetAllBranchCode(), "BranchCode", "BranchCode");
            ViewBag.Category = new SelectList(objCategoryLogic.GetAllCategory(), "Category", "Category");
            ViewBag.Location = new SelectList(objLocationLogic.GetAllLocation(), "Location", "Location");
            ViewBag.CertificateStatus = CertificateStatusList;


            return View();
        }

        // POST: CSP/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create( UserCSPDetail UserCSPDetail)
        {
            UserCSPDetailLogic objUserCSPDetailLogic = new UserCSPDetailLogic();
            var UserCSPDetails = objUserCSPDetailLogic.GetUserCSPDetailByCSPCode(UserCSPDetail.CSPCode).FirstOrDefault();
            if (UserCSPDetails !=null && UserCSPDetails.CSPCode == UserCSPDetail.CSPCode)
            {
                ModelState.AddModelError("CSPCode", "CSPCode already exists");
            }
            if (ModelState.IsValid)
            {

                string fpath = string.Empty;
               
                long CSPUserID = objUserCSPDetailLogic.InsertUserCSPDetail(UserCSPDetail);
                string path = Path.Combine(CSPFilePath, CSPUserID.ToString());
                if (UserCSPDetail.PassportSizePhoto != null)
                {
                    fpath = CheckDirectory(CSPUserID.ToString(),path, "PassportSizePhoto", UserCSPDetail.PassportSizePhoto);
                    UserCSPDetail.PassportSizePhoto.SaveAs(fpath);
                }
                if (UserCSPDetail.PANImage != null)
                {
                    fpath = CheckDirectory(CSPUserID.ToString(),path, "PANImage", UserCSPDetail.PANImage);
                    UserCSPDetail.PANImage.SaveAs(fpath);
                }
                if (UserCSPDetail.VoterIdImage != null)
                {
                    fpath = CheckDirectory(CSPUserID.ToString(),path, "VoterIdImage", UserCSPDetail.VoterIdImage);
                    UserCSPDetail.VoterIdImage.SaveAs(fpath);
                }
                if (UserCSPDetail.AadharImage != null)
                {
                    fpath = CheckDirectory(CSPUserID.ToString(),path, "AadharImage", UserCSPDetail.AadharImage);
                    UserCSPDetail.AadharImage.SaveAs(fpath);
                }
                if (UserCSPDetail.LatestEducationProofImage != null)
                {
                    fpath = CheckDirectory(CSPUserID.ToString(),path, "LatestEducationProofImage", UserCSPDetail.LatestEducationProofImage);
                    UserCSPDetail.LatestEducationProofImage.SaveAs(fpath);
                }
                if (UserCSPDetail.IIBFCertificationImage != null)
                {
                    fpath = CheckDirectory(CSPUserID.ToString(),path, "IIBFCertificationImage", UserCSPDetail.IIBFCertificationImage);
                    UserCSPDetail.IIBFCertificationImage.SaveAs(fpath);
                }
                return RedirectToAction("Index");
            }

            StatusLogic objStatusLogic = new StatusLogic();
            CityLogic objCityLogic = new CityLogic();
            CountryLogic objCountryLogic = new CountryLogic();
            StateLogic objStateLogic = new StateLogic();
            BranchCodeLogic objBranchCodeLogic = new BranchCodeLogic();
            CategoryLogic objCategoryLogic = new CategoryLogic();
            LocationLogic objLocationLogic = new LocationLogic();

            ViewBag.Status = new SelectList(objStatusLogic.GetUserStatus(), "StatusId", "Name", UserCSPDetail.Status);
            ViewBag.City = new SelectList(objCityLogic.GetAllCities(), "CityId", "Name", UserCSPDetail.City);
            ViewBag.Country = new SelectList(objCountryLogic.GetAllCountry(), "CountryId", "Name", UserCSPDetail.Country);
            ViewBag.State = new SelectList(objStateLogic.GetAllStates(), "StateId", "Name", UserCSPDetail.State);
            ViewBag.CertificateStatus = new SelectList(CertificateStatusList, "Text", "Value", UserCSPDetail.CertificateStatus);
            ViewBag.BranchCode = new SelectList(objBranchCodeLogic.GetAllBranchCode(), "BranchCode", "BranchCode",UserCSPDetail.BranchCode);
            ViewBag.Category = new SelectList(objCategoryLogic.GetAllCategory(), "Category", "Category", UserCSPDetail.Category);
            ViewBag.Location = new SelectList(objLocationLogic.GetAllLocation(), "Location", "Location", UserCSPDetail.Location);
            return View(UserCSPDetail);
        }

        // GET: CSP/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            UserCSPDetailLogic objUserCSPDetailLogic = new UserCSPDetailLogic();
            UserCSPDetail UserCSPDetail = objUserCSPDetailLogic.GetUserCSPDetailByID((int)id);          
            if (UserCSPDetail == null)
            {
                return HttpNotFound();
            }
            StatusLogic objStatusLogic = new StatusLogic();
            CityLogic objCityLogic = new CityLogic();
            CountryLogic objCountryLogic = new CountryLogic();
            StateLogic objStateLogic = new StateLogic();
            BranchCodeLogic objBranchCodeLogic = new BranchCodeLogic();
            CategoryLogic objCategoryLogic = new CategoryLogic();
            LocationLogic objLocationLogic = new LocationLogic();

            ViewBag.Status = new SelectList(objStatusLogic.GetUserStatus(), "StatusId", "Name", UserCSPDetail.Status);
            ViewBag.City = new SelectList(objCityLogic.GetAllCities(), "CityId", "Name", UserCSPDetail.City);
            ViewBag.Country = new SelectList(objCountryLogic.GetAllCountry(), "CountryId", "Name", UserCSPDetail.Country);
            ViewBag.State = new SelectList(objStateLogic.GetAllStates(), "StateId", "Name", UserCSPDetail.State);
            ViewBag.CertificateStatus = new SelectList(CertificateStatusList,"Text","Value", UserCSPDetail.CertificateStatus);
            ViewBag.BranchCode = new SelectList(objBranchCodeLogic.GetAllBranchCode(), "BranchCode", "BranchCode", UserCSPDetail.BranchCode);
            ViewBag.Category = new SelectList(objCategoryLogic.GetAllCategory(), "Category", "Category", UserCSPDetail.Category);
            ViewBag.Location = new SelectList(objLocationLogic.GetAllLocation(), "Location", "Location", UserCSPDetail.Location);
            return View(UserCSPDetail);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(UserCSPDetail UserCSPDetail)
        {


            if (ModelState.IsValid)
            {
                string fpath = string.Empty;
                UserCSPDetailLogic objUserCSPDetailLogic = new UserCSPDetailLogic();
                objUserCSPDetailLogic.UpdateUserCSPDetail(UserCSPDetail);
                string path = Path.Combine(CSPFilePath, UserCSPDetail.CSPId.ToString());
                if (UserCSPDetail.PassportSizePhoto != null)
                {
                    fpath = CheckDirectory(UserCSPDetail.CSPId.ToString(), path, "PassportSizePhoto", UserCSPDetail.PassportSizePhoto);
                    UserCSPDetail.PassportSizePhoto.SaveAs(fpath);
                }
                if (UserCSPDetail.PANImage != null)
                {
                    fpath = CheckDirectory(UserCSPDetail.CSPId.ToString(), path, "PANImage", UserCSPDetail.PANImage);
                    UserCSPDetail.PANImage.SaveAs(fpath);
                }
                if (UserCSPDetail.VoterIdImage != null)
                {
                    fpath = CheckDirectory(UserCSPDetail.CSPId.ToString(),path, "VoterIdImage", UserCSPDetail.VoterIdImage);
                    UserCSPDetail.VoterIdImage.SaveAs(fpath);
                }
                if (UserCSPDetail.AadharImage != null)
                {
                    fpath = CheckDirectory(UserCSPDetail.CSPId.ToString(),path, "AadharImage", UserCSPDetail.AadharImage);
                    UserCSPDetail.AadharImage.SaveAs(fpath);
                }
                if (UserCSPDetail.LatestEducationProofImage != null)
                {
                    fpath = CheckDirectory(UserCSPDetail.CSPId.ToString(),path, "LatestEducationProofImage", UserCSPDetail.LatestEducationProofImage);
                    UserCSPDetail.LatestEducationProofImage.SaveAs(fpath);
                }
                if (UserCSPDetail.IIBFCertificationImage != null)
                {
                    fpath = CheckDirectory(UserCSPDetail.CSPId.ToString(),path, "IIBFCertificationImage", UserCSPDetail.IIBFCertificationImage);
                    UserCSPDetail.IIBFCertificationImage.SaveAs(fpath);
                }
                return RedirectToAction("Index");
            }

            StatusLogic objStatusLogic = new StatusLogic();
            CityLogic objCityLogic = new CityLogic();
            CountryLogic objCountryLogic = new CountryLogic();
            StateLogic objStateLogic = new StateLogic();
            BranchCodeLogic objBranchCodeLogic = new BranchCodeLogic();
            CategoryLogic objCategoryLogic = new CategoryLogic();
            LocationLogic objLocationLogic = new LocationLogic();

            ViewBag.Status = new SelectList(objStatusLogic.GetUserStatus(), "StatusId", "Name", UserCSPDetail.Status);
            ViewBag.City = new SelectList(objCityLogic.GetAllCities(), "CityId", "Name", UserCSPDetail.City);
            ViewBag.Country = new SelectList(objCountryLogic.GetAllCountry(), "CountryId", "Name", UserCSPDetail.Country);
            ViewBag.State = new SelectList(objStateLogic.GetAllStates(), "StateId", "Name", UserCSPDetail.State);
            ViewBag.CertificateStatus = new SelectList(CertificateStatusList, "Text", "Value", UserCSPDetail.CertificateStatus);
            ViewBag.BranchCode = new SelectList(objBranchCodeLogic.GetAllBranchCode(), "BranchCode", "BranchCode", UserCSPDetail.BranchCode);
            ViewBag.Category = new SelectList(objCategoryLogic.GetAllCategory(), "Category", "Category", UserCSPDetail.Category);
            ViewBag.Location = new SelectList(objLocationLogic.GetAllLocation(), "Location", "Location", UserCSPDetail.Location);
            return View(UserCSPDetail);
        }

        // GET: CSP/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            UserCSPDetailLogic objUserCSPDetailLogic = new UserCSPDetailLogic();
            UserCSPDetail UserCSPDetail = objUserCSPDetailLogic.GetUserCSPDetailByID((int)id);
            if (UserCSPDetail == null)
            {
                return HttpNotFound();
            }
            StatusLogic objStatusLogic = new StatusLogic();
            CityLogic objCityLogic = new CityLogic();
            CountryLogic objCountryLogic = new CountryLogic();
            StateLogic objStateLogic = new StateLogic();
            BranchCodeLogic objBranchCodeLogic = new BranchCodeLogic();
            CategoryLogic objCategoryLogic = new CategoryLogic();
            LocationLogic objLocationLogic = new LocationLogic();

            ViewBag.Status = new SelectList(objStatusLogic.GetUserStatus(), "StatusId", "Name", UserCSPDetail.Status);
            ViewBag.City = new SelectList(objCityLogic.GetAllCities(), "CityId", "Name", UserCSPDetail.City);
            ViewBag.Country = new SelectList(objCountryLogic.GetAllCountry(), "CountryId", "Name", UserCSPDetail.Country);
            ViewBag.State = new SelectList(objStateLogic.GetAllStates(), "StateId", "Name", UserCSPDetail.State);
            ViewBag.CertificateStatus = new SelectList(CertificateStatusList, "Text", "Value", UserCSPDetail.CertificateStatus);
            ViewBag.BranchCode = new SelectList(objBranchCodeLogic.GetAllBranchCode(), "BranchCode", "BranchCode", UserCSPDetail.BranchCode);
            ViewBag.Category = new SelectList(objCategoryLogic.GetAllCategory(), "Category", "Category", UserCSPDetail.Category);
            ViewBag.Location = new SelectList(objLocationLogic.GetAllLocation(), "Location", "Location", UserCSPDetail.Location);
            return View(UserCSPDetail);
        }

        // POST: CSP/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            UserCSPDetailLogic objUserCSPDetailLogic = new UserCSPDetailLogic();
            objUserCSPDetailLogic.DeleteUserCSPDetail(id);
            return RedirectToAction("Index");
        }

        public ActionResult PreviewImage(string id, string fileName,string folderName)
        {
            string fullpath = string.Empty;
            if (fileName != null || fileName != "")
            {
                try
                {
                    fullpath = CSPFilePath +  id +"\\"+folderName+ "\\" + fileName;
                    //fullpath = "~/UploadedFiles//Proofs//" + CommonLogic.DecryptText(id.ToString()) + "//" + filetype + "//" + filename;
                    return File(new FileStream(fullpath, FileMode.Open), "application/octetstream", fileName);
                }
                catch (Exception)
                {
                    return File(new FileStream(fullpath, FileMode.Open), "application/octetstream", fileName);

                    // throw ex;
                }
            }
            else
            {
                return null;
            }
        }

        // GET: CSP/Edit/5
        public ActionResult EditCSPProfile(int? id)
        {
            if (id == null)
            {
                id = (int)HttpContext.Session["UserSourceId"]; 
            }
            UserCSPDetailLogic objUserCSPDetailLogic = new UserCSPDetailLogic();
            UserCSPDetail UserCSPDetail = objUserCSPDetailLogic.GetUserCSPDetailByID((int)id);
            if (UserCSPDetail == null)
            {
                return HttpNotFound();
            }
            StatusLogic objStatusLogic = new StatusLogic();
            CityLogic objCityLogic = new CityLogic();
            CountryLogic objCountryLogic = new CountryLogic();
            StateLogic objStateLogic = new StateLogic();
            BranchCodeLogic objBranchCodeLogic = new BranchCodeLogic();
            CategoryLogic objCategoryLogic = new CategoryLogic();
            LocationLogic objLocationLogic = new LocationLogic();

            ViewBag.Status = new SelectList(objStatusLogic.GetUserStatus(), "StatusId", "Name", UserCSPDetail.Status);
            ViewBag.City = new SelectList(objCityLogic.GetAllCities(), "CityId", "Name", UserCSPDetail.City);
            ViewBag.Country = new SelectList(objCountryLogic.GetAllCountry(), "CountryId", "Name", UserCSPDetail.Country);
            ViewBag.State = new SelectList(objStateLogic.GetAllStates(), "StateId", "Name", UserCSPDetail.State);
            ViewBag.CertificateStatus = new SelectList(CertificateStatusList, "Text", "Value", UserCSPDetail.CertificateStatus);
            ViewBag.BranchCode = new SelectList(objBranchCodeLogic.GetAllBranchCode(), "BranchCode", "BranchCode", UserCSPDetail.BranchCode);
            ViewBag.Category = new SelectList(objCategoryLogic.GetAllCategory(), "Category", "Category", UserCSPDetail.Category);
            ViewBag.Location = new SelectList(objLocationLogic.GetAllLocation(), "Location", "Location", UserCSPDetail.Location);

            ViewBag.SuccessMsg = "";
            return PartialView("EditCSPProfile", UserCSPDetail);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditCSPProfile(UserCSPDetail UserCSPDetail)
        {

            StatusLogic objStatusLogic = new StatusLogic();
            CityLogic objCityLogic = new CityLogic();
            CountryLogic objCountryLogic = new CountryLogic();
            StateLogic objStateLogic = new StateLogic();

            BranchCodeLogic objBranchCodeLogic = new BranchCodeLogic();
            CategoryLogic objCategoryLogic = new CategoryLogic();
            LocationLogic objLocationLogic = new LocationLogic();

            if (ModelState.IsValid)
            {
                string fpath = string.Empty;
                UserCSPDetailLogic objUserCSPDetailLogic = new UserCSPDetailLogic();
                objUserCSPDetailLogic.UpdateUserCSPDetail(UserCSPDetail);
                string path = Path.Combine(CSPFilePath, UserCSPDetail.CSPId.ToString());
                if (UserCSPDetail.PassportSizePhoto != null)
                {
                    fpath = CheckDirectory(UserCSPDetail.CSPId.ToString(),path, "PassportSizePhoto", UserCSPDetail.PassportSizePhoto);
                    UserCSPDetail.PassportSizePhoto.SaveAs(fpath);
                }
                if (UserCSPDetail.PANImage != null)
                {
                    fpath = CheckDirectory(UserCSPDetail.CSPId.ToString(),path, "PANImage", UserCSPDetail.PANImage);
                    UserCSPDetail.PANImage.SaveAs(fpath);
                }
                if (UserCSPDetail.VoterIdImage != null)
                {
                    fpath = CheckDirectory(UserCSPDetail.CSPId.ToString(),path, "VoterIdImage", UserCSPDetail.VoterIdImage);
                    UserCSPDetail.VoterIdImage.SaveAs(fpath);
                }
                if (UserCSPDetail.AadharImage != null)
                {
                    fpath = CheckDirectory(UserCSPDetail.CSPId.ToString(),path, "AadharImage", UserCSPDetail.AadharImage);
                    UserCSPDetail.AadharImage.SaveAs(fpath);
                }
                if (UserCSPDetail.LatestEducationProofImage != null)
                {
                    fpath = CheckDirectory(UserCSPDetail.CSPId.ToString(),path, "LatestEducationProofImage", UserCSPDetail.LatestEducationProofImage);
                    UserCSPDetail.LatestEducationProofImage.SaveAs(fpath);
                }
                if (UserCSPDetail.IIBFCertificationImage != null)
                {
                    fpath = CheckDirectory(UserCSPDetail.CSPId.ToString(),path, "IIBFCertificationImage", UserCSPDetail.IIBFCertificationImage);
                    UserCSPDetail.IIBFCertificationImage.SaveAs(fpath);
                }              

                ViewBag.Status = new SelectList(objStatusLogic.GetUserStatus(), "StatusId", "Name", UserCSPDetail.Status);
                ViewBag.City = new SelectList(objCityLogic.GetAllCities(), "CityId", "Name", UserCSPDetail.City);
                ViewBag.Country = new SelectList(objCountryLogic.GetAllCountry(), "CountryId", "Name", UserCSPDetail.Country);
                ViewBag.State = new SelectList(objStateLogic.GetAllStates(), "StateId", "Name", UserCSPDetail.State);
                ViewBag.CertificateStatus = new SelectList(CertificateStatusList, "Text", "Value", UserCSPDetail.CertificateStatus);
                ViewBag.BranchCode = new SelectList(objBranchCodeLogic.GetAllBranchCode(), "BranchCode", "BranchCode", UserCSPDetail.BranchCode);
                ViewBag.Category = new SelectList(objCategoryLogic.GetAllCategory(), "Category", "Category", UserCSPDetail.Category);
                ViewBag.Location = new SelectList(objLocationLogic.GetAllLocation(), "Location", "Location", UserCSPDetail.Location);

                UserCSPDetail = objUserCSPDetailLogic.GetUserCSPDetailByID((int)UserCSPDetail.CSPId);
                ViewBag.SuccessMsg = "Record Updated Successfully!";
                return PartialView("EditCSPProfile", UserCSPDetail);
            }


            ViewBag.Status = new SelectList(objStatusLogic.GetUserStatus(), "StatusId", "Name", UserCSPDetail.Status);
            ViewBag.City = new SelectList(objCityLogic.GetAllCities(), "CityId", "Name", UserCSPDetail.City);
            ViewBag.Country = new SelectList(objCountryLogic.GetAllCountry(), "CountryId", "Name", UserCSPDetail.Country);
            ViewBag.State = new SelectList(objStateLogic.GetAllStates(), "StateId", "Name", UserCSPDetail.State);
            ViewBag.CertificateStatus = new SelectList(CertificateStatusList, "Text", "Value", UserCSPDetail.CertificateStatus);
            ViewBag.BranchCode = new SelectList(objBranchCodeLogic.GetAllBranchCode(), "BranchCode", "BranchCode", UserCSPDetail.BranchCode);
            ViewBag.Category = new SelectList(objCategoryLogic.GetAllCategory(), "Category", "Category", UserCSPDetail.Category);
            ViewBag.Location = new SelectList(objLocationLogic.GetAllLocation(), "Location", "Location", UserCSPDetail.Location);

            return View(UserCSPDetail);
        }

        public ActionResult ResetPassword(string CSPCode)
        {
            if (CSPCode == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            UserCSPDetailLogic objUserCSPDetailLogic = new UserCSPDetailLogic();
            tblUserCSPDetail UserCSPDetail = objUserCSPDetailLogic.GetUserCSPDetailByCSPCode(CSPCode).FirstOrDefault();
            if (UserCSPDetail == null)
            {
                return HttpNotFound();
            }
            ResetPasswordViewModel objResetPasswordViewModel = new ResetPasswordViewModel();

            objResetPasswordViewModel.CSPName = UserCSPDetail.CSPName;
            objResetPasswordViewModel.UserName = UserCSPDetail.CSPCode;
            objResetPasswordViewModel.UserID = UserCSPDetail.CSPId;
            ViewBag.SuccessMsg = "";
            ViewBag.IsPasswordResetWithPan = new SelectList(IsPasswordResetWithPanList, "Text", "Value", objResetPasswordViewModel.IsPasswordResetWithPan);

            return View(objResetPasswordViewModel);
        }

        [HttpPost]
        public ActionResult ResetPassword(ResetPasswordViewModel ResetPasswordViewModel)
        {
            //ResetPasswordViewModel.UserName = (string)Session["UserName"];
            //ResetPasswordViewModel.UserType = (int)Session["UserTypeId"];
            //ResetPasswordViewModel.UserID = (int)Session["UserId"];
          
            if (ResetPasswordViewModel.IsPasswordResetWithPan=="Yes")
            {

                UserLogic objUserLogic = new UserLogic();
                objUserLogic.ResetPasswordLogic(ResetPasswordViewModel);               
                ViewBag.SuccessMsg = "Password reset successfully!";
            }
            else
            {
                if (ModelState.IsValid)
                {
                    UserLogic objUserLogic = new UserLogic();
                    objUserLogic.ResetPasswordLogic(ResetPasswordViewModel);              
                    ViewBag.SuccessMsg = "Password reset successfully!";
                }
                else
                {
                    ViewBag.SuccessMsg = "Oops! Unable to Reset Password!";
                }
            }

            UserCSPDetailLogic objUserCSPDetailLogic = new UserCSPDetailLogic();
            tblUserCSPDetail UserCSPDetail = objUserCSPDetailLogic.GetUserCSPDetailByCSPCode(ResetPasswordViewModel.UserName).FirstOrDefault();


            ResetPasswordViewModel objResetPasswordViewModel = new ResetPasswordViewModel();
            objResetPasswordViewModel.CSPName = UserCSPDetail.CSPName;
            objResetPasswordViewModel.UserName = UserCSPDetail.CSPCode;
            objResetPasswordViewModel.UserID = UserCSPDetail.CSPId;          
            ViewBag.IsPasswordResetWithPan = new SelectList(IsPasswordResetWithPanList, "Text", "Value", ResetPasswordViewModel.IsPasswordResetWithPan);

            return View(objResetPasswordViewModel);
        }

        public string CheckDirectory(string CSPUserID, string path, string filetype, HttpPostedFileBase postedfile)
        {
            string fullpath = string.Empty;
            fullpath = Path.Combine(path, filetype);
            if (!Directory.Exists(fullpath))
            {
                Directory.CreateDirectory(fullpath);
            }
            fullpath = fullpath + "\\" + Path.GetFileName(postedfile.FileName);
            if (System.IO.File.Exists(fullpath))
            {
                System.IO.File.Delete(fullpath);
            }
            return fullpath;
        }

        public JsonResult BindStates(long country_id)
        {
            StateLogic sl = new StateLogic();
            IList<SelectListItem> statelist = new List<SelectListItem>();
            var slist = sl.GetAllStatesByCid(country_id);
            foreach (var dr in slist)
            {
                statelist.Add(new SelectListItem { Text = dr.Name.ToString(), Value = dr.StateId.ToString().ToString() });
            }
            return Json(statelist, JsonRequestBehavior.AllowGet);
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
    }
}
