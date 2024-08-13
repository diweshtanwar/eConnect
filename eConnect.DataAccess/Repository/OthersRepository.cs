using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace eConnect.DataAccess
{
    public class FolderDetailsRepository : Repository<tblFolderDetail>, IFolderDetailsRepository
    {
        public FolderDetailsRepository(eConnectAppEntities appcontext) : base(appcontext)
        {
        }
        public eConnectAppEntities eConnectAppEntities
        {
            get { return Context as eConnectAppEntities; }
        }

        public IList<tblFolderDetail> GetAllFolderDetails()
        {
            return eConnectAppEntities.tblFolderDetails.ToList();
        }
    }
    public class ReportTypeRepository : Repository<tblReportType>, IReportTypeRepository
    {
        public ReportTypeRepository(eConnectAppEntities appcontext) : base(appcontext)
        {
        }
        public eConnectAppEntities eConnectAppEntities
        {
            get { return Context as eConnectAppEntities; }
        }

        public IList<tblReportType> GetAllReportType()
        {
            return eConnectAppEntities.tblReportTypes.ToList();
        }
    }


    public class UploaderRepository : Repository<tblUploader>, IUploaderRepository
    {
        public UploaderRepository(eConnectAppEntities appcontext) : base(appcontext)
        {
        }
        public eConnectAppEntities eConnectAppEntities
        {
            get { return Context as eConnectAppEntities; }
        }

        public IList<tblUploader> GetAllUploader()
        {
            return eConnectAppEntities.tblUploaders.ToList();
        }
        public void DeleteRecord(int id)
        {
            try
            {
                var ReporNew = eConnectAppEntities.tblCommissionReportNews.Where(x => x.UploaderId == id);
                foreach (var item in ReporNew)
                {
                    eConnectAppEntities.tblCommissionReportNews.Remove(item);

                }
                eConnectAppEntities.SaveChanges();

                var rec = eConnectAppEntities.tblUploaders.Where(x => x.UploaderId == id).SingleOrDefault();
                eConnectAppEntities.tblUploaders.Remove(rec);
                eConnectAppEntities.SaveChanges();
            }
            catch (Exception ex)
            {
            }
        }
    }


    public class BusinessRepository : Repository<tblBusiness>, IBusinessRepository
    {
        public BusinessRepository(eConnectAppEntities appcontext) : base(appcontext)
        {
        }
        public eConnectAppEntities eConnectAppEntities
        {
            get { return Context as eConnectAppEntities; }
        }

        public IList<tblBusiness> GetAllBusiness()
        {
            return eConnectAppEntities.tblBusinesses.ToList();
        }
    }

    public class ConfigurationRepository : Repository<tblConfiguration>, IAccountConfigurationRepository
    {
        public ConfigurationRepository(eConnectAppEntities appcontext) : base(appcontext)
        {
        }
        public eConnectAppEntities eConnectAppEntities
        {
            get { return Context as eConnectAppEntities; }
        }

        public IList<tblConfiguration> GetAllConfiguration()
        {
            return eConnectAppEntities.tblConfigurations.ToList();
        }
        public void DeleteRecord(int id)
        {
            var rec = eConnectAppEntities.tblConfigurations.Where(x => x.ConfigurationId == id).SingleOrDefault();
            eConnectAppEntities.tblConfigurations.Remove(rec);
            eConnectAppEntities.SaveChanges();
        }
    }




    public class CommissionReportMonthlyRepository : Repository<tblCommissionReportMonthly>, ICommissionReportMonthlyRepository
    {
        public CommissionReportMonthlyRepository(eConnectAppEntities appcontext) : base(appcontext)
        {
        }
        public eConnectAppEntities eConnectAppEntities
        {
            get { return Context as eConnectAppEntities; }
        }

        public IList<tblCommissionReportMonthly> GetAllMonthlyCommissionReport()
        {
            return eConnectAppEntities.tblCommissionReportMonthlies.ToList();
        }

        public IList<sp_GetMonthlyCommissionReportByYearMonthandCSPCode_Result> GetMonthlyCommissionReport(int year, int month, string cspcode)
        {

            var EE = eConnectAppEntities.sp_GetMonthlyCommissionReportByYearMonthandCSPCode(year, month, cspcode);
            return EE.ToList();
        }


        public void DeleteRecord(int id)
        {
            var rec = eConnectAppEntities.tblCommissionReportMonthlies.Where(x => x.MonthlyCommissionReportID == id).SingleOrDefault();
            eConnectAppEntities.tblCommissionReportMonthlies.Remove(rec);
            eConnectAppEntities.SaveChanges();
        }
    }



    public class WindowTimingRepository : Repository<tblWindowTime>, IWindowTimingRepository
    {
        public WindowTimingRepository(eConnectAppEntities appcontext) : base(appcontext)
        {
        }
        public eConnectAppEntities eConnectAppEntities
        {
            get { return Context as eConnectAppEntities; }
        }

        public IList<tblWindowTime> GetActiveTimeWindow()
        {
            return eConnectAppEntities.tblWindowTimes.ToList();
        }
        public void DeleteWindowTimes(int id)
        {
            var rec = eConnectAppEntities.tblWindowTimes.Where(x => x.Id == id).SingleOrDefault();
            eConnectAppEntities.tblWindowTimes.Remove(rec);
            eConnectAppEntities.SaveChanges();
        }

        public IEnumerable<tblWindowTime> GetWindowTimingByid(long id)
        {
            var WindowTiming = eConnectAppEntities.tblWindowTimes.Where(c => c.Id == id);
            return WindowTiming;
        }
    }
}
