using eConnect.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eConnect.Logic
{
   public class UserLoginLogLogic
    {
        public void InsertUserLoginLog(tblUserLoginLog tblUserLoginLog)
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                unitOfWork.UserLoginLogs.Add(tblUserLoginLog);
                unitOfWork.UserLoginLogs.Save();
            }
        }

        public string GetLastLoginDetailsByUserID(long userId)
        {
            tblUserLoginLog objtblUserLoginLog = new tblUserLoginLog();
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                objtblUserLoginLog = unitOfWork.UserLoginLogs.GetLastLoginDetailsByUserID(userId);
               
            }
            if (objtblUserLoginLog != null)
            {

                return objtblUserLoginLog.LoginTimeStamp.ToString();
            }
            return "Not Available";
        }
        public void Save()
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                unitOfWork.UserLoginLogs.Save();
            }
        }
    }
}
