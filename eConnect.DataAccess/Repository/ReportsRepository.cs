using eConnect.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eConnect.DataAccess
{

    public class CommissionReportNewRepository : Repository<tblCommissionReportNew>, ICommissionReportNewRepository
    {
        public CommissionReportNewRepository(eConnectAppEntities appcontext) : base(appcontext)
        {
        }
        public eConnectAppEntities eConnectAppEntities
        {
            get { return Context as eConnectAppEntities; }
        }

        public string SumCSPCommission(string cspcode)
        {

            var countlist = (from aa in eConnectAppEntities.tblCommissionReportNews
                             where aa.CSPCode == cspcode
                             // && aa.year=2021,
                             group aa by new { aa.CSPCode }
                                 into gaa
                             select gaa.Sum(aa => aa.Commission)).FirstOrDefault();

            return countlist.ToString();
        }
        //public IList<GetCommissionReportByYearMonthandCSPName_Result> CalculateCommission(int year, int month, string cspcode, string status)
        //{

        //    var EE = eConnectAppEntities.GetCommissionReportByYearMonthandCSPName(year, month, cspcode);
        //    return EE.ToList();
        //}



        public IList<tblCommissionReportNew> GetAllCommissionReport()
        {
            return eConnectAppEntities.tblCommissionReportNews.ToList();


            //um.ProfilePicSource = item.PassportPic != null ? Path.GetFileName(item.PassportPic.FileName).ToString() : null;
        }

        public IList<tblCommissionReportNew> GetAllCommissionReportByUploaderId(int id)
        {
            return eConnectAppEntities.tblCommissionReportNews.Where(x => x.UploaderId == id).ToList();
        }

        public IList<sp_GetCommissionReportByYearMonthandCSPName_Result> CommissionReport(int year, int month, string cspcode)
        {

            var EE = eConnectAppEntities.sp_GetCommissionReportByYearMonthandCSPName(year, month, cspcode);
            return EE.ToList();
        }
        public IList<sp_GetBusinessReportByYearMonthandCSPCode_Result> BusinessReport(int year, int month, string cspcode, string category)
        {

            var EE = eConnectAppEntities.sp_GetBusinessReportByYearMonthandCSPCode(year, month, cspcode, category);
            return EE.ToList();
        }

        public void DeleteRecord(int id)
        {
            var rec = eConnectAppEntities.tblCommissionReportNews.Where(x => x.TransactionCommissionId == id).SingleOrDefault();
            eConnectAppEntities.tblCommissionReportNews.Remove(rec);
            eConnectAppEntities.SaveChanges();

            //um.ProfilePicSource = item.PassportPic != null ? Path.GetFileName(item.PassportPic.FileName).ToString() : null;
        }

        public void UpdateCommissionReport(tblCommissionReportNew model)
        {
            eConnectAppEntities.Entry(model).State = System.Data.Entity.EntityState.Modified;
            eConnectAppEntities.SaveChanges();
        }


        public IList<tblCommissionReportMonthly> GetAllMonthlyCommissionReport()
        {

            var EE = eConnectAppEntities.tblCommissionReportMonthlies.ToList();
            return EE.ToList();
        }
        public void DeleteUploadedRecords(int UploadedId, int StatusID, int ReportType)
        {
            eConnectAppEntities.sp_DeleteUploadedReport(UploadedId, StatusID, ReportType);

        }
    }
}
