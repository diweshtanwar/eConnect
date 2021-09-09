using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Runtime.Remoting.Contexts;



namespace eConnect.DataAccess
{
    public class UnitOfWork : IUnitOfWork
    {
        private readonly eConnectAppEntities _context;

        public IUserRepository Userss { get; private set; }
        public ICountryRepository Countriess { get; private set; }
        public IStateRepository Statess { get; private set; }
        public IUserLoginLogRepository UserLoginLogs { get; private set; }
        public ICityRepository Cityess { get; private set; }
        public ITechSupportProblemRepository TechSupportProblemss { get; private set; }
        public ITechSupportRequestRepository TechSupportRequestss { get; private set; }
        public IStatusRepository Statuss { get; private set; }
        public IFolderDetailsRepository FolderDetailss { get; private set; }
        public IReportTypeRepository ReportTypess { get; private set; }
        public IUploaderRepository Uploaders { get; private set; }
        public IApplicationSettingRepository ApplicationSettings { get; private set; }
        public IBusinessRepository Businesss { get; private set; }
        public IAccountConfigurationRepository Configurations { get; private set; }
        public IRoleMasterRepository RoleMasters { get; private set; }
        public DepositRequest DepositRequests { get; private set; }
        public WithdrawalRequest WithdrawRequests { get; private set; }
        public CSPDetail AddCSPDetail { get; private set; }
        public IMenuRepository Menus { get; private set; }
        public IUserCSPDetailRepository UserCSPDetail { get; private set; }
        public ICommissionReportNewRepository CommissionReportNews { get; private set; }
        public IAnnouncementRepository Announcement { get; private set; }     
        public ICommissionReportMonthlyRepository CommissionReportMonthly { get; private set; }
        public IRaiseRequestRepository RaiseRequest { get; private set; }
        public UserDetail UserDetail { get; private set; }

        public IBranchCodeRepository BranchCodes { get; private set; }
        public ICategoryRepository Categoress { get; private set; }
        public ILocationRepository Locations { get; private set; }
        public IAbsentismReport AbsentismReport { get; private set; }
        public IEnquiryRepository Enquiries { get; private set; }
        public IGalleryDocumentRepository GalleryDocument { get; private set; }
        public IDownloadDocumentRepository DownloadDocument { get; private set; }
        public IEmailRepository Emails { get; private set; }
        public UnitOfWork(eConnectAppEntities context)
        {
            _context = context;
            Userss = new UserRepository(_context);
            Countriess = new CountryRepository(_context);
            Statess = new StateRepository(_context);
            Cityess = new CityRepository(_context);
            UserLoginLogs = new UserLoginLogRepository(_context);
            TechSupportProblemss = new TechSupportProblemRepository(_context);
            TechSupportRequestss = new TechSupportRequestRepository(_context);
            Statuss = new StatusRepository(_context);
            FolderDetailss = new FolderDetailsRepository(_context);
            ReportTypess = new ReportTypeRepository(_context);
            RoleMasters = new RoleMasterRepository(_context);
            Uploaders = new UploaderRepository(_context);
            ApplicationSettings = new ApplicationSettingRepository(_context);
            Businesss = new BusinessRepository(_context);
            Configurations = new ConfigurationRepository(_context);
            AddCSPDetail = new CSPDetail(_context);
            DepositRequests = new DepositRequest(_context);
            WithdrawRequests = new WithdrawalRequest(_context);
            Menus = new MenuRepository(_context);
            UserCSPDetail = new UserCSPDetailRepository(_context);
            CommissionReportNews = new CommissionReportNewRepository(_context);
            Announcement = new AnnouncementRepository(_context);
            UserDetail = new UserDetail(_context);
            CommissionReportMonthly = new CommissionReportMonthlyRepository(_context);
            RaiseRequest = new RaiseRequestRepository(_context);
            BranchCodes = new BranchCodeRepository(_context);
            Categoress = new CategoryRepository(_context);
            Locations = new LocationRepository(_context);
            AbsentismReport = new AbsentismReportRepository(_context);
            Enquiries = new EnquiryRepository(_context);
            GalleryDocument = new GalleryDocumentRepository(_context);
            DownloadDocument = new DownloadDocumentRepository(_context);
            Emails = new EmailRepository(_context);
        }

        public int Complete()
        {
            return _context.SaveChanges();

        }

        public void Dispose()
        {
            _context.Dispose();
        }
    }
}
