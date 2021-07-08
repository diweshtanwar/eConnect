using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eConnect.DataAccess
{
    public interface IFolderDetailsRepository : IRepository<tblFolderDetail>
    {
        IList<tblFolderDetail> GetAllFolderDetails();
    }

    public interface IReportTypeRepository : IRepository<tblReportType>
    {
        IList<tblReportType> GetAllReportType();
    }

    public interface IUploaderRepository : IRepository<tblUploader>
    {
        IList<tblUploader> GetAllUploader();
        void DeleteRecord(int id);
    }

    public interface IBusinessRepository : IRepository<tblBusiness>
    {
        IList<tblBusiness> GetAllBusiness();
    }

    public interface IAccountConfigurationRepository : IRepository<tblConfiguration>
    {
        IList<tblConfiguration> GetAllConfiguration();
    }

    public interface IRoleMasterRepository : IRepository<tblRoleMaster>
    {
        IList<tblRoleMaster> GetAllRoleMaster();
    }
}
