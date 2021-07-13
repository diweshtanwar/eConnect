﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using eConnect.Model;
using eConnect.Logic;
using System.IO;
using System.Configuration;
using System.Globalization;
using eConnect.DataAccess;
using System.Data;
using System.Data.Entity;

namespace eConnect.Application.Controllers
{
    public class ReportsController : Controller
    {
        List<SelectListItem> ddlMonths = new List<SelectListItem>();
        List<SelectListItem> ddlYears = new List<SelectListItem>();
        public ActionResult DownloadCommissionReport()
        {
            //string FilePath = @"C:\Users\dilpr\OneDrive\Desktop\Proj Docs\EGRAMIN TRANSCATION WISE COMISSION MAY-202.xlsx";

            //InsertExcelRecords(FilePath);
            StatusLogic sl = new StatusLogic();
            var Statuslist = sl.GetAllStatus();
            ViewBag.Statuslist = Statuslist;
            ViewBag.Years = GetYears().OrderByDescending(x => x.Value);
            ViewBag.Months = GetMonths().OrderByDescending(x => x.Value);
            return View();


        }
        [HttpPost]
        public ActionResult DownloadCommissionReport(int year, int month, string cspcode, string status)
        {
            try
            {
                ReportsLogic cl = new ReportsLogic();
                List<DownloadTransactionCommissionModel> products = new List<DownloadTransactionCommissionModel>();
                var Reqlist = cl.DownloadCommissionReport(year, month, cspcode, status).ToList();
                string monthname = CommonLogic.GetMonthName(Convert.ToInt32(month));

                if (Reqlist.Count > 0)
                {
                    foreach (var item in Reqlist)
                    {
                        products.Add(
                                      new DownloadTransactionCommissionModel
                                      {
                                          CSPCode = item.CSPCode,
                                          // NoOfTransaction = (decimal)item.NoOfTransactions,
                                          NoOfTransaction = item.NoOfTransactions,
                                          TransactionType = item.TransactionType,
                                          Commission = (decimal)item.ActualCommission,
                                          CommissionIncludingTDS = (decimal)item.IncludingTDS,
                                          Commissionpercentage = (decimal)item.CSPCommission,
                                          TotalCommission = (decimal)item.Total,
                                          Message = "Commission For" + monthname + " ," + year,

                                      });
                    }
                }
                else
                {
                    products.Add(
                                        new DownloadTransactionCommissionModel
                                        {
                                            Message = "Commission Report For" + " " + "Year: " + year + " , Month: " + monthname
                                        });
                }

                return PartialView("_CommissionReport", products);
            }
            catch (Exception ex)
            {

            }
            return null;
        }
        private SelectList GetYears()
        {
            int CurrentYear = DateTime.Now.Year;
            for (int i = 2010; i <= CurrentYear; i++)
            {
                ddlYears.Add(new SelectListItem
                {
                    Text = i.ToString(),
                    Value = i.ToString()
                });
            }
            return new SelectList(ddlYears, "Value", "Text");
        }
        private SelectList GetMonths()
        {
            var months = Enumerable.Range(1, 12).Select(i => new
            {
                A = i,
                B = DateTimeFormatInfo.CurrentInfo.GetMonthName(i)
            });
            int CurrentMonth = 1; //January  
            {
                CurrentMonth = DateTime.Now.Month;
                months = Enumerable.Range(1, CurrentMonth).Select(i => new
                {
                    A = i,
                    B = DateTimeFormatInfo.CurrentInfo.GetMonthName(i)
                });
            }
            foreach (var item in months)
            {
                ddlMonths.Add(new SelectListItem { Text = item.B.ToString(), Value = item.A.ToString() });
            }
            return new SelectList(ddlMonths, "Value", "Text", CurrentMonth);
        }


        public ActionResult DownloadCommissionReportMonthly()
        {
            //string FilePath = @"C:\Users\dilpr\OneDrive\Desktop\Proj Docs\EGRAMIN TRANSCATION WISE COMISSION MAY-202.xlsx";

            //InsertExcelRecords(FilePath);
            StatusLogic sl = new StatusLogic();
            var Statuslist = sl.GetAllStatus();
            ViewBag.Statuslist = Statuslist;
            ViewBag.Years = GetYears().OrderByDescending(x => x.Value);
            ViewBag.Months = GetMonths().OrderByDescending(x => x.Value);
            return View();
        }
        [HttpPost]
        public ActionResult DownloadCommissionReportMonthly(int year, int month, string cspcode, string status)
        {
            try
            {
                ReportsLogic cl = new ReportsLogic();
                List<CommissionReportMonthlyModel> products = new List<CommissionReportMonthlyModel>();
                var Reqlist = cl.GetMonthlyCommissionReportByMonth(year, month, cspcode).ToList();
                string monthname = CommonLogic.GetMonthName(Convert.ToInt32(month));

                if (Reqlist.Count > 0)
                {
                    foreach (var item in Reqlist)
                    {
                        products.Add(
                                      new CommissionReportMonthlyModel
                                      {
                                          CSPCode = item.CSPCode,
                                          CSPName = item.CSPName,
                                          MonthlyCommissionReportID = item.MonthlyCommissionReportID,
                                          Transation =Convert.ToDecimal(item.Transation),
                                          Incentive = item.Incentive,
                                          Rural = item.Rural,
                                          Total = item.Total,
                                          TDS = item.TDS,
                                          PayableToCSP = item.PayableToCSP,
                                          NetPayable = item.NetPayable,
                                          Month = item.Month,
                                          Year = item.Year,
                                          UploaderId = item.UploaderId,
                                          Message = "Commission Report " + " " + " Year: " + year + " , Month: " + monthname
                                      });
                    }
                }
                else
                {
                    products.Add(
                                        new CommissionReportMonthlyModel
                                        {
                                            Message = "Commission Report " + " " + " Year: " + year + " , Month: " + monthname
                                        });
                }

                return PartialView("_MonthlyCommissionReport", products);
            }
            catch (Exception ex)
            {

            }
            return null;
        }



    }
}