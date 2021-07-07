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
        // GET: CSP

        public ActionResult Dashboard()
        {
            return View();
        }
        public ActionResult Index()
        {
            UserCSPDetailLogic objUserCSPDetailLogic = new UserCSPDetailLogic();
            var tblUserCSPDetails = objUserCSPDetailLogic.GetAllUserCSPDetail();
            StatusLogic objStatusLogic = new StatusLogic();
            ViewBag.Status = new SelectList(objStatusLogic.GetStatus(), "StatusId", "Name");
            ViewBag.CertificateStatus = CertificateStatusList;
            return View(tblUserCSPDetails.ToList());
        }
        public ActionResult IndexSearch(string CSPCode, string CSPName, string BranchCode, byte? Status, string CertificateStatus)
        {
            UserCSPDetailLogic objUserCSPDetailLogic = new UserCSPDetailLogic();
            var tblUserCSPDetails = objUserCSPDetailLogic.GetAllUserCSPDetailSearch(CSPCode, CSPName, BranchCode, Status, CertificateStatus);
            StatusLogic objStatusLogic = new StatusLogic();
            ViewBag.Status = new SelectList(objStatusLogic.GetStatus(), "StatusId", "Name");
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

            ViewBag.Status = new SelectList(objStatusLogic.GetStatus(), "StatusId", "Name", UserCSPDetail.Status);
            ViewBag.City = new SelectList(objCityLogic.GetAllCities(), "CityId", "Name", UserCSPDetail.City);
            ViewBag.Country = new SelectList(objCountryLogic.GetAllCountry(), "CountryId", "Name", UserCSPDetail.Country);
            ViewBag.State = new SelectList(objStateLogic.GetAllStates(), "StateId", "Name", UserCSPDetail.State);
            ViewBag.CertificateStatus = new SelectList(CertificateStatusList, "Text", "Value", UserCSPDetail.CertificateStatus);
            return View(UserCSPDetail);
        }

        // GET: CSP/Create
        public ActionResult Create()
        {
            StatusLogic objStatusLogic = new StatusLogic();
            CityLogic objCityLogic = new CityLogic();
            CountryLogic objCountryLogic = new CountryLogic();
            StateLogic objStateLogic = new StateLogic();

            ViewBag.Status = new SelectList(objStatusLogic.GetStatus(), "StatusId", "Name");
            ViewBag.City = new SelectList(objCityLogic.GetAllCities(), "CityId", "Name");
            ViewBag.Country = new SelectList(objCountryLogic.GetAllCountry(), "CountryId", "Name");
            ViewBag.State = new SelectList(objStateLogic.GetAllStates(), "StateId", "Name");
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
            
            if (ModelState.IsValid)
            {
                string fpath = string.Empty;
                UserCSPDetailLogic objUserCSPDetailLogic = new UserCSPDetailLogic();
                long CSPUserID = objUserCSPDetailLogic.InsertUserCSPDetail(UserCSPDetail);
                string path = Path.Combine(CSPFilePath, CSPUserID.ToString());
                if (UserCSPDetail.PassportSizePhoto != null)
                {
                    fpath = CheckDirectory(path, "PassportSizePhoto", UserCSPDetail.PassportSizePhoto);
                    UserCSPDetail.PassportSizePhoto.SaveAs(fpath);
                }
                if (UserCSPDetail.PANImage != null)
                {
                    fpath = CheckDirectory(path, "PANImage", UserCSPDetail.PANImage);
                    UserCSPDetail.PANImage.SaveAs(fpath);
                }
                if (UserCSPDetail.VoterIdImage != null)
                {
                    fpath = CheckDirectory(path, "VoterIdImage", UserCSPDetail.VoterIdImage);
                    UserCSPDetail.VoterIdImage.SaveAs(fpath);
                }
                if (UserCSPDetail.AadharImage != null)
                {
                    fpath = CheckDirectory(path, "AadharImage", UserCSPDetail.AadharImage);
                    UserCSPDetail.AadharImage.SaveAs(fpath);
                }
                if (UserCSPDetail.LatestEducationProofImage != null)
                {
                    fpath = CheckDirectory(path, "LatestEducationProofImage", UserCSPDetail.LatestEducationProofImage);
                    UserCSPDetail.LatestEducationProofImage.SaveAs(fpath);
                }
                if (UserCSPDetail.IIBFCertificationImage != null)
                {
                    fpath = CheckDirectory(path, "IIBFCertificationImage", UserCSPDetail.IIBFCertificationImage);
                    UserCSPDetail.IIBFCertificationImage.SaveAs(fpath);
                }
                return RedirectToAction("Index");
            }

            StatusLogic objStatusLogic = new StatusLogic();
            CityLogic objCityLogic = new CityLogic();
            CountryLogic objCountryLogic = new CountryLogic();
            StateLogic objStateLogic = new StateLogic();

            ViewBag.Status = new SelectList(objStatusLogic.GetStatus(), "StatusId", "Name", UserCSPDetail.Status);
            ViewBag.City = new SelectList(objCityLogic.GetAllCities(), "CityId", "Name", UserCSPDetail.City);
            ViewBag.Country = new SelectList(objCountryLogic.GetAllCountry(), "CountryId", "Name", UserCSPDetail.Country);
            ViewBag.State = new SelectList(objStateLogic.GetAllStates(), "StateId", "Name", UserCSPDetail.State);
            ViewBag.CertificateStatus = new SelectList(CertificateStatusList, "Text", "Value", UserCSPDetail.CertificateStatus);
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

            ViewBag.Status = new SelectList(objStatusLogic.GetStatus(), "StatusId", "Name", UserCSPDetail.Status);
            ViewBag.City = new SelectList(objCityLogic.GetAllCities(), "CityId", "Name", UserCSPDetail.City);
            ViewBag.Country = new SelectList(objCountryLogic.GetAllCountry(), "CountryId", "Name", UserCSPDetail.Country);
            ViewBag.State = new SelectList(objStateLogic.GetAllStates(), "StateId", "Name", UserCSPDetail.State);
            ViewBag.CertificateStatus = new SelectList(CertificateStatusList,"Text","Value", UserCSPDetail.CertificateStatus);
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
                    fpath = CheckDirectory(path, "PassportSizePhoto", UserCSPDetail.PassportSizePhoto);
                    UserCSPDetail.PassportSizePhoto.SaveAs(fpath);
                }
                if (UserCSPDetail.PANImage != null)
                {
                    fpath = CheckDirectory(path, "PANImage", UserCSPDetail.PANImage);
                    UserCSPDetail.PANImage.SaveAs(fpath);
                }
                if (UserCSPDetail.VoterIdImage != null)
                {
                    fpath = CheckDirectory(path, "VoterIdImage", UserCSPDetail.VoterIdImage);
                    UserCSPDetail.VoterIdImage.SaveAs(fpath);
                }
                if (UserCSPDetail.AadharImage != null)
                {
                    fpath = CheckDirectory(path, "AadharImage", UserCSPDetail.AadharImage);
                    UserCSPDetail.AadharImage.SaveAs(fpath);
                }
                if (UserCSPDetail.LatestEducationProofImage != null)
                {
                    fpath = CheckDirectory(path, "LatestEducationProofImage", UserCSPDetail.LatestEducationProofImage);
                    UserCSPDetail.LatestEducationProofImage.SaveAs(fpath);
                }
                if (UserCSPDetail.IIBFCertificationImage != null)
                {
                    fpath = CheckDirectory(path, "IIBFCertificationImage", UserCSPDetail.IIBFCertificationImage);
                    UserCSPDetail.IIBFCertificationImage.SaveAs(fpath);
                }
                return RedirectToAction("Index");
            }

            StatusLogic objStatusLogic = new StatusLogic();
            CityLogic objCityLogic = new CityLogic();
            CountryLogic objCountryLogic = new CountryLogic();
            StateLogic objStateLogic = new StateLogic();

            ViewBag.Status = new SelectList(objStatusLogic.GetStatus(), "StatusId", "Name", UserCSPDetail.Status);
            ViewBag.City = new SelectList(objCityLogic.GetAllCities(), "CityId", "Name", UserCSPDetail.City);
            ViewBag.Country = new SelectList(objCountryLogic.GetAllCountry(), "CountryId", "Name", UserCSPDetail.Country);
            ViewBag.State = new SelectList(objStateLogic.GetAllStates(), "StateId", "Name", UserCSPDetail.State);
            ViewBag.CertificateStatus = new SelectList(CertificateStatusList, "Text", "Value", UserCSPDetail.CertificateStatus);
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

            ViewBag.Status = new SelectList(objStatusLogic.GetStatus(), "StatusId", "Name", UserCSPDetail.Status);
            ViewBag.City = new SelectList(objCityLogic.GetAllCities(), "CityId", "Name", UserCSPDetail.City);
            ViewBag.Country = new SelectList(objCountryLogic.GetAllCountry(), "CountryId", "Name", UserCSPDetail.Country);
            ViewBag.State = new SelectList(objStateLogic.GetAllStates(), "StateId", "Name", UserCSPDetail.State);
            ViewBag.CertificateStatus = new SelectList(CertificateStatusList, "Text", "Value", UserCSPDetail.CertificateStatus);
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

            ViewBag.Status = new SelectList(objStatusLogic.GetStatus(), "StatusId", "Name", UserCSPDetail.Status);
            ViewBag.City = new SelectList(objCityLogic.GetAllCities(), "CityId", "Name", UserCSPDetail.City);
            ViewBag.Country = new SelectList(objCountryLogic.GetAllCountry(), "CountryId", "Name", UserCSPDetail.Country);
            ViewBag.State = new SelectList(objStateLogic.GetAllStates(), "StateId", "Name", UserCSPDetail.State);
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

            if (ModelState.IsValid)
            {
                string fpath = string.Empty;
                UserCSPDetailLogic objUserCSPDetailLogic = new UserCSPDetailLogic();
                objUserCSPDetailLogic.UpdateUserCSPDetail(UserCSPDetail);
                string path = Path.Combine(CSPFilePath, UserCSPDetail.CSPId.ToString());
                if (UserCSPDetail.PassportSizePhoto != null)
                {
                    fpath = CheckDirectory(path, "PassportSizePhoto", UserCSPDetail.PassportSizePhoto);
                    UserCSPDetail.PassportSizePhoto.SaveAs(fpath);
                }
                if (UserCSPDetail.PANImage != null)
                {
                    fpath = CheckDirectory(path, "PANImage", UserCSPDetail.PANImage);
                    UserCSPDetail.PANImage.SaveAs(fpath);
                }
                if (UserCSPDetail.VoterIdImage != null)
                {
                    fpath = CheckDirectory(path, "VoterIdImage", UserCSPDetail.VoterIdImage);
                    UserCSPDetail.VoterIdImage.SaveAs(fpath);
                }
                if (UserCSPDetail.AadharImage != null)
                {
                    fpath = CheckDirectory(path, "AadharImage", UserCSPDetail.AadharImage);
                    UserCSPDetail.AadharImage.SaveAs(fpath);
                }
                if (UserCSPDetail.LatestEducationProofImage != null)
                {
                    fpath = CheckDirectory(path, "LatestEducationProofImage", UserCSPDetail.LatestEducationProofImage);
                    UserCSPDetail.LatestEducationProofImage.SaveAs(fpath);
                }
                if (UserCSPDetail.IIBFCertificationImage != null)
                {
                    fpath = CheckDirectory(path, "IIBFCertificationImage", UserCSPDetail.IIBFCertificationImage);
                    UserCSPDetail.IIBFCertificationImage.SaveAs(fpath);
                }              

                ViewBag.Status = new SelectList(objStatusLogic.GetStatus(), "StatusId", "Name", UserCSPDetail.Status);
                ViewBag.City = new SelectList(objCityLogic.GetAllCities(), "CityId", "Name", UserCSPDetail.City);
                ViewBag.Country = new SelectList(objCountryLogic.GetAllCountry(), "CountryId", "Name", UserCSPDetail.Country);
                ViewBag.State = new SelectList(objStateLogic.GetAllStates(), "StateId", "Name", UserCSPDetail.State);
                
                UserCSPDetail = objUserCSPDetailLogic.GetUserCSPDetailByID((int)UserCSPDetail.CSPId);
                ViewBag.SuccessMsg = "Record Updated Successfully!";
                return PartialView("EditCSPProfile", UserCSPDetail);
            }


            ViewBag.Status = new SelectList(objStatusLogic.GetStatus(), "StatusId", "Name", UserCSPDetail.Status);
            ViewBag.City = new SelectList(objCityLogic.GetAllCities(), "CityId", "Name", UserCSPDetail.City);
            ViewBag.Country = new SelectList(objCountryLogic.GetAllCountry(), "CountryId", "Name", UserCSPDetail.Country);
            ViewBag.State = new SelectList(objStateLogic.GetAllStates(), "StateId", "Name", UserCSPDetail.State);
            ViewBag.CertificateStatus = new SelectList(CertificateStatusList, "Text", "Value", UserCSPDetail.CertificateStatus);
            return View(UserCSPDetail);
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
