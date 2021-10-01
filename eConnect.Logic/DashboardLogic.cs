using eConnect.DataAccess;
using eConnect.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eConnect.Logic
{
   public class DashboardLogic
    {

        public DashboardCSPModel GetDashboardCSPData(int id)
        {
            DashboardCSPModel objDashboardCSPModel = new DashboardCSPModel();
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                objDashboardCSPModel.WithdrawOpenCount = unitOfWork.RaiseRequest.GetAllWithdrawDetailbyCSPID(id).Where(d => d.Status == 1).Count();
                objDashboardCSPModel.WithdrawInProgressCount = unitOfWork.RaiseRequest.GetAllWithdrawDetailbyCSPID(id).Where(d => d.Status == 2).Count();
                objDashboardCSPModel.WithdrawCompletedCount = unitOfWork.RaiseRequest.GetAllWithdrawDetailbyCSPID(id).Where(d => d.Status == 3).Count();

                objDashboardCSPModel.DepositOpenCount = unitOfWork.RaiseRequest.GetAllDeposiDetailbyCSPID(id).Where(d => d.Status == 1).Count();
                objDashboardCSPModel.DepositInProgressCount = unitOfWork.RaiseRequest.GetAllDeposiDetailbyCSPID(id).Where(d => d.Status == 2).Count();
                objDashboardCSPModel.DepositCompletedCount = unitOfWork.RaiseRequest.GetAllDeposiDetailbyCSPID(id).Where(d => d.Status == 3).Count();

                objDashboardCSPModel.TechOpenCount = unitOfWork.RaiseRequest.GetAllTechRequestbyCSPID(id).Where(d => d.Status == 1).Count();
                objDashboardCSPModel.TechInProgressCount = unitOfWork.RaiseRequest.GetAllTechRequestbyCSPID(id).Where(d => d.Status == 2).Count();
                objDashboardCSPModel.TechCompletedCount = unitOfWork.RaiseRequest.GetAllTechRequestbyCSPID(id).Where(d => d.Status == 3).Count();

            }
            return objDashboardCSPModel;
        }

        public DashboardAdminModel GetDashboardAdminData()
        {
            DashboardAdminModel objDashboardAdminModel = new DashboardAdminModel();

            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                objDashboardAdminModel.WithdrawOpenCount = unitOfWork.RaiseRequest.GetAllWithdrawDetail().Where(d => d.Status == 1).Count();
                objDashboardAdminModel.WithdrawInProgressCount = unitOfWork.RaiseRequest.GetAllWithdrawDetail().Where(d => d.Status == 2).Count();
                objDashboardAdminModel.WithdrawCompletedCount = unitOfWork.RaiseRequest.GetAllWithdrawDetail().Where(d => d.Status == 3).Count();

                objDashboardAdminModel.DepositOpenCount = unitOfWork.RaiseRequest.GetAllDepositDetail().Where(d => d.Status == 1).Count();
                objDashboardAdminModel.DepositInProgressCount = unitOfWork.RaiseRequest.GetAllDepositDetail().Where(d => d.Status == 2).Count();
                objDashboardAdminModel.DepositCompletedCount = unitOfWork.RaiseRequest.GetAllDepositDetail().Where(d => d.Status == 3).Count();

                objDashboardAdminModel.TechOpenCount = unitOfWork.RaiseRequest.GetTechDetail().Where(d => d.Status == 1).Count();
                objDashboardAdminModel.TechInProgressCount = unitOfWork.RaiseRequest.GetTechDetail().Where(d => d.Status == 2).Count();
                objDashboardAdminModel.TechCompletedCount = unitOfWork.RaiseRequest.GetTechDetail().Where(d => d.Status == 3).Count();

                objDashboardAdminModel.CSPActiveCount = unitOfWork.UserCSPDetail.GetAllUserCSPDetail().Where(d => d.Status == 1).Count();
                objDashboardAdminModel.CSPInActiveCount = unitOfWork.UserCSPDetail.GetAllUserCSPDetail().Where(d => d.Status == 2).Count();
                objDashboardAdminModel.CSPBlockedCount = unitOfWork.UserCSPDetail.GetAllUserCSPDetail().Where(d => d.Status == 3).Count();
                objDashboardAdminModel.CSPTotalCount = unitOfWork.UserCSPDetail.GetAllUserCSPDetail().Count();


                objDashboardAdminModel.UserActiveCount = unitOfWork.UserCSPDetail.GetAllUserDetail().Count();
                objDashboardAdminModel.UserInActiveCount = unitOfWork.Userss.GetAllUsers().Where(d => d.Status == 2).Count();
                objDashboardAdminModel.UserBlockedCount = unitOfWork.Userss.GetAllUsers().Where(d => d.Status == 3).Count();
                objDashboardAdminModel.UserTotalCount = unitOfWork.Userss.GetAllUsers().Count();

            }
            return objDashboardAdminModel;
        }
        public DashboardAdminModel GetDashboardAdminDataSearch(DateTime? StartDate, DateTime? EndDate, string CSPCode, string Country, string State, string City)
        {
            DashboardAdminModel objDashboardAdminModel = new DashboardAdminModel();

            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                var AllWithdrawDetailData = unitOfWork.RaiseRequest.GetManageWithdrawalRequestDetails().ToList();
                var AllDepositDetailData = unitOfWork.RaiseRequest.GetManageDepositRequestDetails().ToList();
                var AllTechDetailData = unitOfWork.RaiseRequest.GetManageTechRequestDetails().ToList();
                //var AllWithdrawDetailData = unitOfWork.RaiseRequest.GetAllWithdrawDetail().ToList();
                //var AllDepositDetailData = unitOfWork.RaiseRequest.GetAllDepositDetail().ToList();
                //var AllTechDetailData = unitOfWork.RaiseRequest.GetTechDetail().ToList();
                if (StartDate!=null)
                {
                    AllWithdrawDetailData= AllWithdrawDetailData.Where(t => t.RequestedDate >= StartDate).ToList();
                    AllDepositDetailData = AllDepositDetailData.Where(t => t.RequestedDate >= StartDate).ToList();
                    AllTechDetailData = AllTechDetailData.Where(t => t.RequestedDate >= StartDate).ToList();

                }
                if (EndDate !=null)
                {
                    AllWithdrawDetailData = AllWithdrawDetailData.Where(t => t.CompletionDate <= EndDate).ToList();
                    AllDepositDetailData = AllDepositDetailData.Where(t => t.CompletionDate <= EndDate).ToList();
                    AllTechDetailData = AllTechDetailData.Where(t => t.CompletionDate <= EndDate).ToList();

                }
                if (!string.IsNullOrEmpty(CSPCode))
                {
                    AllWithdrawDetailData = AllWithdrawDetailData.Where(d=>d.CSPCode==CSPCode).ToList();
                    AllDepositDetailData = AllDepositDetailData.Where(d => d.CSPCode == CSPCode).ToList();
                    AllTechDetailData = AllTechDetailData.Where(d => d.CSPCode == CSPCode).ToList();

                }
                if (!string.IsNullOrEmpty(City))
                {
                    AllWithdrawDetailData = AllWithdrawDetailData.Where(d => d.City == Convert.ToInt32(City)).ToList();
                    AllDepositDetailData = AllDepositDetailData.Where(d => d.City == Convert.ToInt32(City)).ToList();
                    AllTechDetailData = AllTechDetailData.Where(d => d.City == Convert.ToInt32(City)).ToList();

                }

                objDashboardAdminModel.WithdrawOpenCount = AllWithdrawDetailData.Where(d => d.Status == 1).Count();
                objDashboardAdminModel.WithdrawInProgressCount = AllWithdrawDetailData.Where(d => d.Status == 2).Count();
                objDashboardAdminModel.WithdrawCompletedCount = AllWithdrawDetailData.Where(d => d.Status == 3).Count();

                objDashboardAdminModel.DepositOpenCount = AllDepositDetailData.Where(d => d.Status == 1).Count();
                objDashboardAdminModel.DepositInProgressCount = AllDepositDetailData.Where(d => d.Status == 2).Count();
                objDashboardAdminModel.DepositCompletedCount = AllDepositDetailData.Where(d => d.Status == 3).Count();

                objDashboardAdminModel.TechOpenCount = AllTechDetailData.Where(d => d.Status == 1).Count();
                objDashboardAdminModel.TechInProgressCount = AllTechDetailData.Where(d => d.Status == 2).Count();
                objDashboardAdminModel.TechCompletedCount = AllTechDetailData.Where(d => d.Status == 3).Count();

                objDashboardAdminModel.CSPActiveCount = unitOfWork.UserCSPDetail.GetAllUserCSPDetail().Where(d => d.Status == 1).Count();
                objDashboardAdminModel.CSPInActiveCount = unitOfWork.UserCSPDetail.GetAllUserCSPDetail().Where(d => d.Status == 2).Count();
                objDashboardAdminModel.CSPBlockedCount = unitOfWork.UserCSPDetail.GetAllUserCSPDetail().Where(d => d.Status == 3).Count();
                objDashboardAdminModel.CSPTotalCount = unitOfWork.UserCSPDetail.GetAllUserCSPDetail().Count();


                objDashboardAdminModel.UserActiveCount = unitOfWork.UserCSPDetail.GetAllUserDetail().Count();
                objDashboardAdminModel.UserInActiveCount = unitOfWork.Userss.GetAllUsers().Where(d => d.Status == 2).Count();
                objDashboardAdminModel.UserBlockedCount = unitOfWork.Userss.GetAllUsers().Where(d => d.Status == 3).Count();
                objDashboardAdminModel.UserTotalCount = unitOfWork.Userss.GetAllUsers().Count();

            }
            return objDashboardAdminModel;
        }
    }
}
