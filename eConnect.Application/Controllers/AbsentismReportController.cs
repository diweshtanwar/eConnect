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
//using OfficeOpenXml;
//using MongoDB.Driver;

namespace eConnect.Application.Controllers
{
    public class AbsentismReportController : Controller
    {
        List<SelectListItem> ReportType = new List<SelectListItem>()
            {
                new SelectListItem { Text = "All", Value = "" },
                new SelectListItem { Text = "Absent", Value = "A" },
                new SelectListItem { Text = "Present", Value = "P" },

            };
        AbsentismReportLogic absentismReport = new AbsentismReportLogic();
        public ActionResult Index()
        {
           
            UserCSPDetailLogic objUserCSPDetailLogic = new UserCSPDetailLogic();

            var dropDownList = objUserCSPDetailLogic.GetAllUserCSPDetail().Select(x => new
            {
                Id = x.CSPCode,
                Name = x.CSPCode.ToString() +"-"+x.CSPName.ToString()
            }).ToList();


            ViewBag.CSP = new SelectList(dropDownList, "Id", "Name");
            ViewBag.Type = ReportType;
            ViewBag.dteFrom = new DateTime(DateTime.Now.Year,DateTime.Now.Month,1).ToString("yyyy-MM-dd"); //"2010-12-25"
            ViewBag.dteTo = DateTime.Now.ToString("yyyy-MM-dd");
            ViewBag.AbsFrom = 0;
            ViewBag.AbsTo = 0;
            ViewBag.Ctecount = 0;
            List<tblAbsentismReport> tblAbsentismReports = new List<tblAbsentismReport>();

            bool flag = Convert.ToBoolean(TempData["flag"]);
            if (flag == true)
            {
                tblAbsentismReports = TempData["searchdata"] as List<tblAbsentismReport>;
            }
            else
            {
             // tblAbsentismReports = absentismReport.GetAbsentismReportsSearch("", ViewBag.dteFrom, ViewBag.dteTo, "", 0, 0, 0);
            }
            return View(tblAbsentismReports);
        }
        public ActionResult IndexSearch(string CSP, string Requestedfromdte, string Requestedtodte, string Type, string AbsFrom, string AbsTo, string Ctecount)
        {
            if(string.IsNullOrEmpty(AbsTo))
            {
                AbsTo = "0";
            }
            if (string.IsNullOrEmpty(AbsFrom))
            {
                AbsFrom = "0";
            }
            if (string.IsNullOrEmpty(Ctecount))
            {
                Ctecount = "0";
            }
            var tblAbsentismReport =  absentismReport.GetAbsentismReportsSearch(Convert.ToString(CSP),Requestedfromdte.ToString(),Requestedtodte.ToString(), Type.ToString(),Convert.ToInt32(AbsFrom), Convert.ToInt32(AbsTo), Convert.ToInt32(Ctecount));
            TempData["searchdata"] = tblAbsentismReport.ToList();
            TempData["flag"] = true;
            return RedirectToAction("Index");
        }

        public void DownloadExcel()
        {
           
        }
    }
}