using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eConnect.DataAccess
{
    public class RoleMasterRepository : Repository<tblRoleMaster>, IRoleMasterRepository
    {

        public RoleMasterRepository(eConnectAppEntities appcontext) : base(appcontext)
        {

        }
        private eConnectAppEntities eConnectAppEntities = new eConnectAppEntities();
        //public eConnectAppEntities eConnectAppEntities
        //{
        //    get { return new eConnectAppEntities(); }
        //}

        public IList<tblRoleMaster> GetAllRoleMaster()
        {
            return eConnectAppEntities.tblRoleMasters.ToList();
        }

        public IEnumerable<tblRoleMaster> GetRoleMaster()
        {
            return eConnectAppEntities.tblRoleMasters.ToList();
        }

        public tblRoleMaster GetRoleMasterByID(int id)
        {
            return eConnectAppEntities.tblRoleMasters.Find(id);
        }

        public void InsertRoleMaster(tblRoleMaster tblRoleMaster)
        {
            eConnectAppEntities.tblRoleMasters.Add(tblRoleMaster);
        }

        public void DeleteRoleMaster(int roleMasterID)
        {
            tblRoleMaster ApplicationSetting = eConnectAppEntities.tblRoleMasters.Find(roleMasterID);
            eConnectAppEntities.tblRoleMasters.Remove(ApplicationSetting);
        }

        public void UpdateRoleMaster(tblRoleMaster tblRoleMaster)
        {
            eConnectAppEntities.Entry(tblRoleMaster).State = EntityState.Modified;
        }

        public void Save()
        {
            eConnectAppEntities.SaveChanges();
        }

    }
}
