﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using eConnect.Model;
namespace eConnect.DataAccess
{

    public interface ICommissionReportNewRepository
    {
        IList<tblCommissionReportNew> GetAllCommissionReport();
        string SumCSPCommission(string cspcode);

        //  IList<DownloadTransactionCommissionModel> CalculateCommission(int year, int month, string cspcode, string status);
        // IList<GetCommissionReportByYearMonthandCSPName_Result> CalculateCommission(int year, int month, string cspcode, string status);
        // IList<tblUploader> CalculateCommission(int year, int month, string cspcode, string status);
     
        IList<tblCommissionReportNew> GetAllCommissionReportByUploaderId(int id);
        void DeleteRecord(int id);
        void UpdateCommissionReport(tblCommissionReportNew model);
        IList<tblCommissionReportMonthly> GetAllMonthlyCommissionReport();
         IList<sp_GetBusinessReportByYearMonthandCSPCode_Result> BusinessReport(int year, int month, string cspcode, string category);
         void DeleteUploadedRecords(int UploadedId, int StatusID, int ReportType);


        //*************************************************10July ***********************

       // IList<sp_GetCommissionReportByYearMonthandCSPName_Result> CommissionReport(int year, int month, string cspcode);
        IList<sp_GetCommissionReportByYearMonthandCSPName_Result> CommissionReport(int year, int month, int cycleid, string cspcode);
        IList<sp_GetCommissionReportRuralByYearMonthandCSPName_Result> CommissionReportRural(int year, int month, int cycleid, string cspcode);

    }
}
