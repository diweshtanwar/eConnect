using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eConnect.DataAccess
{
    public interface IUnitOfWork : IDisposable
    {

        IUserRepository Userss { get; }
        ICountryRepository Countriess { get; }
        IStateRepository Statess { get; }
        ICityRepository Cityess { get; }
        IUserLoginDetails UserLoginDetailss { get; }
        ITechSupportProblemRepository TechSupportProblemss { get; }
        ITechSupportRequestRepository TechSupportRequestss { get; }
        IStatusRepository Statuss { get; }
        IFolderDetailsRepository FolderDetailss { get; }
        IUploaderRepository Uploaders { get; }
        IReportTypeRepository ReportTypess { get; }
        IApplicationSettingRepository ApplicationSettings { get; }
        IAccountConfigurationRepository Configurations { get; }
        IBusinessRepository Businesss { get; }
        IRoleMasterRepository RoleMasters { get; }

        int Complete();
    }
}
