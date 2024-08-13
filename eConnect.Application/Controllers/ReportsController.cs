using System;
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
                                          CSPCategory = item.Category,
                                          MonthlyCommissionReportID = item.MonthlyCommissionReportID,
                                          Transation = Convert.ToDecimal(item.Transation),
                                          Incentive = item.Incentive,
                                          Rural = item.Rural,
                                          Total = item.Total,
                                          TDS = item.TDS,
                                          PayableToCSP = item.PayableToCSP,
                                          NetPayable = item.NetPayable,
                                          Month = item.Month,
                                          Year = item.Year,
                                          UploaderId = item.UploaderId,
                                          Message = "Commission for " + " " + monthname + ", " + year
                                      });
                    }
                }
                else
                {
                    products.Add(
                                        new CommissionReportMonthlyModel
                                        {
                                            Message = "Commission for " + " " + monthname + ", " + year
                                        });
                }

                return PartialView("_MonthlyCommissionReport", products);
            }
            catch (Exception ex)
            {

            }
            return null;
        }





        public ActionResult DownloadCSPCommissionReportMonthly()
        {
            StatusLogic sl = new StatusLogic();
            var Statuslist = sl.GetAllStatus();
            ViewBag.Statuslist = Statuslist;
            ViewBag.Years = GetYears().OrderByDescending(x => x.Value);
            ViewBag.Months = GetMonths().OrderByDescending(x => x.Value);
            return View();
        }


        [HttpPost]
        public ActionResult DownloadCSPCommissionReportMonthly(int year, int month, string status)
        {
            try
            {
                int cspid = Convert.ToInt32(Session["UserSourceId"]);
                UserCSPDetailLogic objUserCSPDetailLogic = new UserCSPDetailLogic();
                UserCSPDetail UserCSPDetail = objUserCSPDetailLogic.GetUserCSPDetailByID((int)cspid);
                string cspcode = UserCSPDetail.CSPCode;
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
                                          Transation = Convert.ToDecimal(item.Transation),
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
                                            CSPCode = UserCSPDetail.CSPCode,
                                            CSPName = UserCSPDetail.CSPName,
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

        public JsonResult BindMonths(int year)
        {
            int currentYear = DateTime.Now.Year;
            if (year == currentYear)
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
                return Json(ddlMonths.OrderByDescending(x => x.Value), JsonRequestBehavior.AllowGet);
            }
            else
            {

                DateTimeFormatInfo df = DateTimeFormatInfo.GetInstance(null);
                for (int i = 12; i >= 1; i--)
                {
                    ddlMonths.Add(new SelectListItem { Text = df.GetMonthName(i), Value = i.ToString() });
                }
                return Json(ddlMonths, JsonRequestBehavior.AllowGet);
            }
        }
        public ActionResult DownloadBusinessReport()
        {
            CategoryLogic cl = new CategoryLogic();
            var CategoryList = cl.GetAllCategory();
            ViewBag.CategoryList = CategoryList;
            StatusLogic sl = new StatusLogic();
            var Statuslist = sl.GetAllStatus();
            ViewBag.Statuslist = Statuslist;
            ViewBag.Years = GetYears().OrderByDescending(x => x.Value);
            ViewBag.Months = GetMonths().OrderByDescending(x => x.Value);
            return View();
        }
        [HttpPost]
        public ActionResult DownloadBusinessReport(int year, int month, string cspcode, string category, string Avgtrans)
        {
            try
            {
                ReportsLogic cl = new ReportsLogic();
                List<BusinessReportModel> products = new List<BusinessReportModel>();
                var Reqlist = cl.DownloadBusinessReport(year, month, cspcode, category).ToList();
                string monthname = CommonLogic.GetMonthName(Convert.ToInt32(month));
                if (Reqlist.Count > 0)
                {
                    foreach (var item in Reqlist)
                    {
                        products.Add(
                                      new BusinessReportModel
                                      {
                                          CSPCode = item.CSPCode,
                                          CSPName = item.CSPName,
                                          Category = item.Category,
                                          Month = item.Month,
                                          Year = item.Year,
                                          UploaderId = item.UploaderId,
                                          BusinessDetailReportId = item.BusinessDetailReportId,
                                          SavingsAccountEnrollment = item.SavingsAccountEnrollment,
                                          SavingsAccountOpen = item.SavingsAccountOpen,
                                          SHGAccountEnrollment = item.SHGAccountEnrollment,
                                          SHGAccountOpen = item.SHGAccountOpen,
                                          StateATMCards = item.StateATMCards,
                                          CashReceiptNo = item.CashReceiptNo,
                                          CashReceiptAmount = item.CashReceiptAmount,
                                          CashPaymentNo = item.CashPaymentNo,
                                          CashPaymentAmount = item.CashPaymentAmount,
                                          FundTransferNo = item.FundTransferNo,
                                          FundTransferAmount = item.FundTransferAmount,
                                          MoneyTransferNo = item.MoneyTransferNo,
                                          MoneyTransferAmount = item.MoneyTransferAmount,
                                          IMPSNo = item.IMPSNo,
                                          NoOfTransaction = item.NoOfTransaction,
                                          AverageTransaction = item.AverageTransaction,
                                          Message = "Business Report " + " " + " Year: " + year + " , Month: " + monthname
                                      });
                    }
                }
                else
                {
                    //products.Add(
                    //                    //new CommissionReportMonthlyModel
                    //                    //{
                    //                    //    //CSPCode = UserCSPDetail.CSPCode,
                    //                    //    //CSPName = UserCSPDetail.CSPName,
                    //                    //    Message = "Commission Report " + " " + " Year: " + year + " , Month: " + monthname
                    //                    //}
                    //                    );
                }

                return PartialView("_MonthlyBusinessReport", products);
            }
            catch (Exception ex)
            {

            }
            return null;
        }


        //********************************************************************* 10 July Changes ***************************************************

        List<SelectListItem> AreaType = new List<SelectListItem>()
            {
                new SelectListItem { Text = "Urban", Value = "1" },
                new SelectListItem { Text = "Rural", Value = "2" },

            };



        public ActionResult DownloadCSPCommissionReport()
        {
            StatusLogic sl = new StatusLogic();
            var Statuslist = sl.GetAllStatus();
            int cspid = Convert.ToInt32(Session["UserSourceId"]);
            UserCSPDetailLogic objUserCSPDetailLogic = new UserCSPDetailLogic();
            UserCSPDetail UserCSPDetail = objUserCSPDetailLogic.GetUserCSPDetailByID((int)cspid);
            ViewBag.CSPcode = UserCSPDetail.CSPCode;

            ViewBag.Statuslist = Statuslist;
            ViewBag.Years = GetYears().OrderByDescending(x => x.Value);
            ViewBag.Months = GetMonths().OrderByDescending(x => x.Value);
            return View();
        }

        [HttpPost]
        public ActionResult DownloadCSPCommissionReport(int year, int month, string status)
        {
            try
            {
                int cspid = Convert.ToInt32(Session["UserSourceId"]);
                UserCSPDetailLogic objUserCSPDetailLogic = new UserCSPDetailLogic();
                UserCSPDetail UserCSPDetail = objUserCSPDetailLogic.GetUserCSPDetailByID((int)cspid);
                //Code Start.............
                int areaid, circleid;
                if (UserCSPDetail.Category.Contains("Urban"))
                {
                    areaid = 1;
                }
                else
                {
                    areaid = 2;
                }
                string cspcode = UserCSPDetail.CSPCode;
                //before may 2022 1 --else 2
                //old 
                if (year <= 2022 && month < 5)
                {
                    circleid = 1;
                }
                else if ((year <= 2022 && month >= 9) || (year > 2022))
                {
                    circleid = 3;

                }
                else
                {
                    circleid = 2;
                }
                ReportsLogic cl = new ReportsLogic();
                List<DownloadTransactionCommissionModel> products = new List<DownloadTransactionCommissionModel>();
                //old code  var Reqlist = cl.DownloadCommissionReport(year, month, circleid, cspcode, status).ToList();


                var Reqlist = (dynamic)null;
                if (areaid == 1)
                {
                    Reqlist = cl.DownloadCommissionReport(year, month, circleid, cspcode, status).ToList();
                }
                else
                {
                    Reqlist = cl.DownloadCommissionReportRural(year, month, circleid, cspcode, status).ToList();
                }
                string monthname = CommonLogic.GetMonthName(Convert.ToInt32(month));

                if (Reqlist.Count > 0)
                {
                    foreach (var item in Reqlist)
                    {
                        products.Add(
                                      new DownloadTransactionCommissionModel
                                      {
                                          CSPCode = item.CSPCode,
                                          CSPName = item.CSPName,
                                          // NoOfTransaction = (decimal)item.NoOfTransactions,
                                          NoOfTransaction = item.NoOfTransactions,
                                          TransactionType = item.TransactionType,
                                          Commission = (decimal)item.ActualCommission,
                                          CommissionIncludingTDS = (decimal)item.IncludingTDS,
                                          Commissionpercentage = (decimal)item.CSPCommission,
                                          TotalCommission = (decimal)item.Total,
                                          Message = "Commission For " + monthname + " ," + year,

                                      });
                    }
                }
                else
                {
                    products.Add(
                                        new DownloadTransactionCommissionModel
                                        {
                                            CSPCode = UserCSPDetail.CSPCode,
                                            CSPName = UserCSPDetail.CSPName,
                                            Message = "Commission For " + " " + "Year: " + year + " , Month: " + monthname
                                        });
                }

                return PartialView("_CSPCommissionReport", products);
            }
            catch (Exception ex)
            {

            }
            return null;
        }




        /*.............................................Code Changes Sept 2023.................................................................*/

        public ActionResult DownloadCommissionReport()
        {
            StatusLogic sl = new StatusLogic();
            var Statuslist = sl.GetAllStatus();
            ViewBag.Statuslist = Statuslist;
            ViewBag.Years = GetYears().OrderByDescending(x => x.Value);
            ViewBag.Months = GetMonths().OrderByDescending(x => x.Value);
            TransactionTypeCycleLogic TransactionTypeCycle = new TransactionTypeCycleLogic();
            var TransactionCycle = TransactionTypeCycle.GetAllCommissionTransactionTypeCycle();
            ViewBag.CycleID = TransactionCycle;
            ViewBag.AreaID = AreaType;

            return View();

        }

        [HttpPost]
        public ActionResult DownloadCommissionReportOld(int year, int month, string cspcode, string status, int cycleid, int areaid)
        {
            try
            {

                dynamic Reqlist = null;
                ReportsLogic cl = new ReportsLogic();

                List<DownloadTransactionCommissionModel> products = new List<DownloadTransactionCommissionModel>();
                int CspAreaId = 0;
                if (!string.IsNullOrEmpty(cspcode))
                {
                    UserCSPDetailLogic objUserCSPDetailLogic = new UserCSPDetailLogic();
                    UserCSPDetail CspArea = objUserCSPDetailLogic.GetUserCSPDetByCSPCode(cspcode);

                    if (CspArea.CSPId > 0)
                    {
                        if (CspArea.Category.Contains("Urban"))
                        {
                            CspAreaId = 1;
                        }
                        else
                        {
                            CspAreaId = 2;
                        }
                    }
                    if (areaid == 1 && CspAreaId == 1)
                    {
                        Reqlist = cl.DownloadCommissionReport(year, month, cycleid, cspcode, status).ToList();
                    }
                    else if (areaid == 2 && CspAreaId == 2)
                    {
                        Reqlist = cl.DownloadCommissionReportRural(year, month, cycleid, cspcode, status).ToList();

                    }
                }
                else
                {
                    if (areaid == 1)
                    {
                        Reqlist = cl.DownloadCommissionReport(year, month, cycleid, cspcode, status).ToList();
                    }
                    else if (areaid == 2)
                    {
                        Reqlist = cl.DownloadCommissionReportRural(year, month, cycleid, cspcode, status).ToList();

                    }

                }

                string monthname = CommonLogic.GetMonthName(Convert.ToInt32(month));
                if (Reqlist != null && Reqlist.Count > 0)
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

                                          //Changedby Tushi Suggestion   Commission = (decimal)item.ActualCommission,
                                          Commission = (decimal)item.Totalold,
                                          CommissionIncludingTDS = (decimal)item.IncludingTDS,
                                          Commissionpercentage = (decimal)item.CSPCommission,
                                          TotalCommission = (decimal)item.Total,
                                          Message = "CSP Code:-" + item.CSPCode + ",Commission For" + monthname + " ," + year,

                                      }); ;
                    }
                }
                else
                {
                    products.Add(
                                        new DownloadTransactionCommissionModel
                                        {
                                            Message = "CSP Code:-" + cspcode + ",Commission Report For" + " " + "Year: " + year + " , Month: " + monthname
                                        });
                }

                return PartialView("_CommissionReport", products);
            }
            catch (Exception ex)
            {

            }
            return null;
        }

        int newcycleid = 0;
        [HttpPost]
        public ActionResult DownloadCommissionReport(int year, int month, string cspcode, string status, int cycleid, int areaid)
        {
            try
            {
             
                dynamic Reqlist = null;
                ReportsLogic cl = new ReportsLogic();
                List<DownloadTransactionCommissionModel> products = new List<DownloadTransactionCommissionModel>();
                int CspAreaId = 0;
                if (!string.IsNullOrEmpty(cspcode))
                {
                    UserCSPDetailLogic objUserCSPDetailLogic = new UserCSPDetailLogic();
                    UserCSPDetail CspArea = objUserCSPDetailLogic.GetUserCSPDetByCSPCode(cspcode);
                    if (CspArea.CSPId > 0)
                    {
                        if (CspArea.Category.Contains("Urban"))
                        {
                            CspAreaId = 1;
                        }
                        else
                        {
                            CspAreaId = 2;
                        }

                       
                        if (year <= 2022 && month < 5)
                        {
                            newcycleid = 1;
                        }
                        else if ((year <= 2022 && month >= 9) || (year > 2022))
                        {
                            newcycleid = 3;

                        }
                        else
                        {
                            newcycleid = 2;
                        }
                    }
                    if (CspAreaId == 1)
                    {
                        Reqlist = cl.DownloadCommissionReport(year, month, newcycleid, cspcode, status).ToList();
                    }
                    else if (CspAreaId == 2)
                    {
                        Reqlist = cl.DownloadCommissionReportRural(year, month, newcycleid, cspcode, status).ToList();

                    }
                }
                string monthname = CommonLogic.GetMonthName(Convert.ToInt32(month));
                if (Reqlist != null && Reqlist.Count > 0)
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

                                          //Changedby Tushi Suggestion   Commission = (decimal)item.ActualCommission,
                                          Commission = (decimal)item.Totalold,
                                          CommissionIncludingTDS = (decimal)item.IncludingTDS,
                                          Commissionpercentage = (decimal)item.CSPCommission,
                                          TotalCommission = (decimal)item.Total,
                                          Message = "CSP Code:-" + item.CSPCode + ",Commission For" + monthname + " ," + year,

                                      }); ;
                    }
                }
                else
                {
                    products.Add(
                                        new DownloadTransactionCommissionModel
                                        {
                                            Message = "CSP Code:-" + cspcode + ",Commission Report For" + " " + "Year: " + year + " , Month: " + monthname
                                        });
                }

                return PartialView("_CommissionReport", products);
            }
            catch (Exception ex)
            {

            }
            return null;
        }
    }
}

