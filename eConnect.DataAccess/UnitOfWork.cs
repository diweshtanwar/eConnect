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
