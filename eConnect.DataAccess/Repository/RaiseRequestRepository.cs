using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace eConnect.DataAccess
{
    public class RaiseRequestRepository : Repository<tblDepositRequest>, IRaiseRequestRepository
    {
        public RaiseRequestRepository(eConnectAppEntities appcontext) : base(appcontext)
        {

        }

        public eConnectAppEntities eConnectAppEntities
        {
            get { return new eConnectAppEntities(); }
        }

        public IList<tblDepositRequest> GetAllDepositDetail()
        {

            return eConnectAppEntities.tblDepositRequests.ToList();
        }
        public tblDepositRequest GetDepositDetailByID(int Id)
        {
            return eConnectAppEntities.tblDepositRequests.Find(Id);
        }
        public void DeleteDepositDetail(int Id)
        {
            tblDepositRequest tblDepositRequest = eConnectAppEntities.tblDepositRequests.Find(Id);
            eConnectAppEntities.tblDepositRequests.Remove(tblDepositRequest);
        }
        public void Save()
        {
            eConnectAppEntities.SaveChanges();
        }
        public IList<tblWithdrawalRequest> GetAllWithdrawDetail()
        {

            return eConnectAppEntities.tblWithdrawalRequests.ToList();
        }
        public tblWithdrawalRequest GetWithdrawalDetailByID(int Id)
        {
            return eConnectAppEntities.tblWithdrawalRequests.Find(Id);
        }
        public void DeleteWithdrawDetail(int Id)
        {
            tblWithdrawalRequest tblWithdrawalRequest = eConnectAppEntities.tblWithdrawalRequests.Find(Id);
            eConnectAppEntities.tblWithdrawalRequests.Remove(tblWithdrawalRequest);
        }
        public IList<tblTechRequest> GetTechDetail()
        {

            return eConnectAppEntities.tblTechRequests.ToList();
        }

        public void DeleteTechDetail(int Id)
        {
            tblTechRequest tblTechRequest = eConnectAppEntities.tblTechRequests.Find(Id);
            eConnectAppEntities.tblTechRequests.Remove(tblTechRequest);
        }

        public IList<tblWithdrawalRequest> GetAllWithdrawDetailbyCSPID(int id)
        {

            return eConnectAppEntities.tblWithdrawalRequests.Where(x => x.RaisedBy == id).ToList();
        }

        public IList<sp_GetManageWithdrawalRequestDetails_Result> GetManageWithdrawalRequestDetails(int records, int status)
        {

            return eConnectAppEntities.sp_GetManageWithdrawalRequestDetails(records, status).ToList();
        }
        public IList<tblDepositRequest> GetAllDeposiDetailbyCSPID(int id)
        {

            return eConnectAppEntities.tblDepositRequests.Where(x => x.RaisedBy == id).ToList();
        }

        public IList<sp_GetManageDepositRequestDetails_Result> GetManageDepositRequestDetails(int records, int status)
        {

            return eConnectAppEntities.sp_GetManageDepositRequestDetails(records, status).ToList();
        }
        public IList<tblTechRequest> GetAllTechRequestbyCSPID(int id)
        {

            return eConnectAppEntities.tblTechRequests.Where(x => x.RaisedBy == id).ToList();
        }

        public IList<sp_GetManageTechSupportRequestDetails_Result> GetManageTechRequestDetails(int records, int status)
        {


            return eConnectAppEntities.sp_GetManageTechSupportRequestDetails(records, status).ToList();
        }

        public IList<sp_GetEDITDepositRequestDetails_Result> GeteditdepositRequestDetails(int id)
        {

            return eConnectAppEntities.sp_GetEDITDepositRequestDetails(id).ToList();
        }
        public IList<sp_GetEDITWithdrawalRequestDetails_Result> GeteditwithdrawRequestDetails(int id)
        {

            return eConnectAppEntities.sp_GetEDITWithdrawalRequestDetails(id).ToList();
        }
        public IList<sp_GetEditTechSupportRequestDetails_Result> GetedittechRequestDetails(int id)
        {

            return eConnectAppEntities.sp_GetEditTechSupportRequestDetails(id).ToList();
        }


        public int GetManageManageDepositDetailsCount(int status)
        {
            var details = eConnectAppEntities.sp_count_GetManageDepositRequestDetails(status).ToList();
            int count = 0;
            foreach (var x in details)
            {
                count = Convert.ToInt32(x.Status);
            }
            return count;

        }
        public int GetManageWithdrawalRequestDetailsCount(int status)
        {

            var details = eConnectAppEntities.sp_count_ManageWithdrawalRequestDetails(status).ToList();
            int count = 0;
            foreach (var x in details)
            {
                count = Convert.ToInt32(x.Status);
            }
            return count;
        }
        public int GetManageTechSupportRequestRequestDetailsCount(int status)
        {

            var details = eConnectAppEntities.sp_count_GetManageTechSupportRequestDetails(status).ToList();
            int count = 0;
            foreach (var x in details)
            {
                count = Convert.ToInt32(x.Status);
            }
            return count;
        }
    }
}
