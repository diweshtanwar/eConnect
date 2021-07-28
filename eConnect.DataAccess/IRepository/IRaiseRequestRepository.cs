using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace eConnect.DataAccess
{
    public interface IRaiseRequestRepository
    {
        IList<tblDepositRequest> GetAllDepositDetail();
        tblDepositRequest GetDepositDetailByID(int Id);
        void DeleteDepositDetail(int Id);
        void Save();
        IList<tblWithdrawalRequest> GetAllWithdrawDetail();
        
        IList<tblWithdrawalRequest> GetAllWithdrawDetailbyCSPID(int CSPID);
        tblWithdrawalRequest GetWithdrawalDetailByID(int Id);
        void DeleteWithdrawDetail(int Id);
        IList<tblTechRequest> GetTechDetail();
        void DeleteTechDetail(int Id);
        IList<sp_GetManageWithdrawalRequestDetails_Result> GetManageWithdrawalRequestDetails();
    }
}
