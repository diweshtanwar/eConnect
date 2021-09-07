using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eConnect.DataAccess
{

public class UserCSPDetailRepository : Repository<tblUserCSPDetail>, IUserCSPDetailRepository
    {

        public UserCSPDetailRepository(eConnectAppEntities appcontext) : base(appcontext)
        {

        }

        public eConnectAppEntities eConnectAppEntities
        {
            get { return new eConnectAppEntities(); }
        }

        public IList<tblUserCSPDetail> GetAllUserCSPDetail()
        {
            return eConnectAppEntities.tblUserCSPDetails.ToList();
        }

        public IEnumerable<tblUserCSPDetail> GetUserCSPDetail()
        {
            return eConnectAppEntities.tblUserCSPDetails.ToList();
        }

        public tblUserCSPDetail GetUserCSPDetailByID(int id)
        {
            return eConnectAppEntities.tblUserCSPDetails.Find(id);
        }

        public IEnumerable<tblUserCSPDetail> GetUserCSPDetailByCSPCode(string CSPCode)
        {
            return eConnectAppEntities.tblUserCSPDetails.Where(d => d.CSPCode ==CSPCode).ToList();
        }
        public void InsertUserCSPDetail(tblUserCSPDetail tblUserCSPDetail)
        {
            eConnectAppEntities.tblUserCSPDetails.Add(tblUserCSPDetail);
        }

        public void DeleteUserCSPDetail(int CSPId)
        {
            tblUserCSPDetail tblUserCSPDetail = eConnectAppEntities.tblUserCSPDetails.Find(CSPId);
            eConnectAppEntities.Entry(tblUserCSPDetail).State = EntityState.Deleted;
            Save();
            //eConnectAppEntities.tblUserCSPDetails.Remove(tblUserCSPDetail);
        }

        public void UpdateUserCSPDetail(tblUserCSPDetail tblUserCSPDetail)
        {
            eConnectAppEntities.Entry(tblUserCSPDetail).State = EntityState.Modified;
        }

        public void Save()
        {
            eConnectAppEntities.SaveChanges();
        }
        public IList<tblUserDetail> GetAllUserDetail()
        {
            return eConnectAppEntities.tblUserDetails.ToList();
        }

        public tblUserDetail GetUserDetailByID(int id)
        {
            return eConnectAppEntities.tblUserDetails.Find(id);
        }
        public void DeleteuserDetail(int Id)
        {
            eConnectAppEntities.sp_DeleteRequest(Id, 1);
            //tblUserCSPDetail tblUserCSPDetail = eConnectAppEntities.tblUserCSPDetails.Find(CSPId);
            //tblUserDetail obj = eConnectAppEntities.tblUserDetails.Find(Id);
            //eConnectAppEntities.tblUserDetails.Remove(obj);
            //eConnectAppEntities.SaveChanges();
            //bool oldValidateOnSaveEnabled = eConnectAppEntities.Configuration.ValidateOnSaveEnabled;

            //try
            //{
            //    eConnectAppEntities.Configuration.ValidateOnSaveEnabled = false;
            //    tblUserDetail obj = eConnectAppEntities.tblUserDetails.Find(Id);
            //    eConnectAppEntities.tblUserDetails.Remove(obj);
            //    eConnectAppEntities.SaveChanges();

            //}
            //finally
            //{
            //    eConnectAppEntities.Configuration.ValidateOnSaveEnabled = oldValidateOnSaveEnabled;
            //}

        }

    }
}