﻿using System;
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
    }


    public class RoleMasterRepository : Repository<tblRoleMaster>, IRoleMasterRepository
    {
        public RoleMasterRepository(eConnectAppEntities appcontext) : base(appcontext)
        {
        }
        public eConnectAppEntities eConnectAppEntities
        {
            get { return Context as eConnectAppEntities; }
        }

        public IList<tblRoleMaster> GetAllRoleMaster()
        {
            return eConnectAppEntities.tblRoleMasters.ToList();
        }
    }


}