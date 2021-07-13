using eConnect.DataAccess;
using eConnect.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eConnect.Logic
{
   public class RoleMasterLogic
    {
        public IList<tblRoleMaster> GetAllRoles()
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                var data = unitOfWork.RoleMasters.GetAllRoleMaster().ToList();
                return data;
            }
        }
        public void InsertRoleMaster(RoleMasterModel model)
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                tblRoleMaster tblRoleMaster = new tblRoleMaster();
                tblRoleMaster.Name = model.Name;
                unitOfWork.RoleMasters.Add(tblRoleMaster);
              
            }
        }

       public tblRoleMaster GetRoleMasterByID(int roleMasterId)
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                tblRoleMaster tblRoleMaster = new tblRoleMaster();
                var data = unitOfWork.RoleMasters.GetRoleMasterByID(roleMasterId);             
                return data;

            }
        }
        public void DeleteRole(int id)
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                unitOfWork.RoleMasters.DeleteRoleMaster(id);
                unitOfWork.RoleMasters.Save();

            }
        }

        public void UpdateRole(RoleMasterModel model)
        {

            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                var data = unitOfWork.RoleMasters.Find(x => x.RoleId == model.RoleId).FirstOrDefault();
                data.RoleId = (int)model.RoleId;
                data.Name = model.Name;
                unitOfWork.RoleMasters.Update(data);
                unitOfWork.RoleMasters.Save();
            }
        }
    }
}
