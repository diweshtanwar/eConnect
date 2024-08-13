﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using eConnect.DataAccess;
using eConnect.Model;


namespace eConnect.Logic
{
    public class ReportsLogic
    {

        //public IList<GetCommissionReportByYearMonthandCSPName_Result> GetAllCommissionReport(int year, int month, string cspcode, string status)
        //{
        //    DownloadTransactionCommissionModel sr = new DownloadTransactionCommissionModel();
        //    using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
        //    {
        //        IList<GetCommissionReportByYearMonthandCSPName_Result> sp = unitOfWork.CommissionReportNews.CalculateCommission(year, month, cspcode, status);
        //        return sp;

        //    }
        //}
        //public IList<sp_GetCommissionReportByYearMonthandCSPName_Result> DownloadCommissionReport(int year, int month, string cspcode, string status)
        //{
        //    using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
        //    {
        //        IList<sp_GetCommissionReportByYearMonthandCSPName_Result> sp = unitOfWork.CommissionReportNews.CommissionReport(year, month, cspcode);
        //        return sp;
        //    }
        //}




        public IList<tblCommissionReportNew> GetAllCommissionReportByUploaderId(int id)
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                var lst = unitOfWork.CommissionReportNews.GetAllCommissionReportByUploaderId(id);
                return lst;
            }
        }

        public void DeleteUnpublishedRecord(int id)
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                unitOfWork.CommissionReportNews.DeleteRecord(id);

            }
        }

        public void UpdateUnpublishedRecord(TransactionCommissionModel model)
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                var record = unitOfWork.CommissionReportNews.GetAllCommissionReportByUploaderId(model.UploaderId).FirstOrDefault();
                if (record != null)
                {
                    record.TransactionCommissionId = model.TransactionCommissionId;
                    record.Circle = model.Circle;
                    record.CircleName = model.CircleName;
                    record.BCBF_Code = model.BCBF_Code;
                    record.CSPCode = model.CSPCode;
                    record.CSPName = model.CSPName;
                    record.TransactionType = model.TransactionType;
                    record.NoOfTransactions = model.NoOfTransactions;
                    record.Commission = model.Commission;
                    unitOfWork.CommissionReportNews.UpdateCommissionReport(record);
                }
            }
        }

        public IList<tblCommissionReportMonthly> GetMonthlyCommissionReport()
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                var lst = unitOfWork.CommissionReportMonthly.GetAllMonthlyCommissionReport().ToList();
                return lst;
            }
        }


        public IList<sp_GetMonthlyCommissionReportByYearMonthandCSPCode_Result> GetMonthlyCommissionReportByMonth(int year, int month, string cspcode)
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                var lst = unitOfWork.CommissionReportMonthly.GetMonthlyCommissionReport(year,month,cspcode).ToList();
                return lst;
            }
        }

        //public IList<tblCommissionReportMonthly> GetMonthlyCommissionReportByYearMonthandCSBCode()
        //{
        //    using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
        //    {
        //        var lst = unitOfWork.CommissionReportMonthly.GetAllMonthlyCommissionReport().ToList();
        //        return lst;
        //    }
        //}


        public void DeleteRecord(int id)
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                unitOfWork.CommissionReportMonthly.DeleteRecord(id);

            }
        }
        public IList<sp_GetBusinessReportByYearMonthandCSPCode_Result> DownloadBusinessReport(int year, int month, string cspcode, string category)
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                IList<sp_GetBusinessReportByYearMonthandCSPCode_Result> sp = unitOfWork.CommissionReportNews.BusinessReport(year, month, cspcode, category);
                return sp;
            }
        }
        public void DeleteUploadedRecordsByRTypeandStatus(int UploadedId, int StatusID, int ReportType)
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                unitOfWork.CommissionReportNews.DeleteUploadedRecords(UploadedId, StatusID, ReportType);

            }
        }

        //************************************************************ 29 Aug ****************************************************

        public IList<sp_GetCommissionReportByYearMonthandCSPName_Result> DownloadCommissionReport(int year, int month, int circleid, string cspcode, string status)
        {
             using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                IList<sp_GetCommissionReportByYearMonthandCSPName_Result> sp = unitOfWork.CommissionReportNews.CommissionReport(year, month, circleid, cspcode);
                return sp;
            }
        }
        public IList<sp_GetCommissionReportRuralByYearMonthandCSPName_Result> DownloadCommissionReportRural(int year, int month, int circleid, string cspcode, string status)
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                IList<sp_GetCommissionReportRuralByYearMonthandCSPName_Result> sp = unitOfWork.CommissionReportNews.CommissionReportRural(year, month, circleid, cspcode);

                return sp;
            }
        }

    }
}