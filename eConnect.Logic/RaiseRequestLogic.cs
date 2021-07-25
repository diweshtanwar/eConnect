using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.Entity.Validation;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using eConnect.DataAccess;
using eConnect.Model;


namespace eConnect.Logic
{
    public class RaiseRequestLogic
    {
        public long AddDepositDetails(Deposit deposit, int UserId)
        {
            try
            {
                var dateAndTime = DateTime.Now;
                var date = dateAndTime.Date;
                using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
                {
                    tblDepositRequest objDeposit = new tblDepositRequest();
                    // objDeposit.DepositeRequestId = Convert.ToInt64(deposit.Receipt);
                    objDeposit.Amount = deposit.Amount;
                    objDeposit.RaisedBy = UserId;
                    objDeposit.RequestedDate = date;
                    objDeposit.ReceiptSource = deposit.Reciept != null
                                ? Path.GetFileName(deposit.Reciept.FileName).ToString() : null;
                    objDeposit.CreatedBy = UserId;
                    objDeposit.CreatedDate = DateTime.Now;
                    objDeposit.Status = Convert.ToInt32(deposit.Status);
                    objDeposit.ResolutionDetail = "";
                    objDeposit.CompletionDate =null;
                    objDeposit.UpdatedDate = DateTime.Now;
                    objDeposit.HasReceipt = true;
                    objDeposit.RequestType = Convert.ToInt32(deposit.RequestType);
                    unitOfWork.DepositRequests.Add(objDeposit);
                    long id = objDeposit.DepositeRequestId;
                    return id;
                }
            }
            catch (DbEntityValidationException e)
            {
                foreach (var eve in e.EntityValidationErrors)
                {
                    Console.WriteLine("Entity of type \"{0}\" in state \"{1}\" has the following validation errors:",
                        eve.Entry.Entity.GetType().Name, eve.Entry.State);
                    foreach (var ve in eve.ValidationErrors)
                    {
                        Console.WriteLine("- Property: \"{0}\", Error: \"{1}\"",
                            ve.PropertyName, ve.ErrorMessage);
                    }
                }
                throw;
            }
        }

        public IList<tblDepositRequest> GetDepositDetails()
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                return unitOfWork.RaiseRequest.GetAllDepositDetail().ToList();
            }
        }

        public IList<tblDepositRequest> GetDepositDetailsSearch(int Requestid, int RequestType, string Requesteddte, string Completiondte)
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                var result = unitOfWork.RaiseRequest.GetAllDepositDetail().ToList();

                if (Requestid != 0)
                {
                    result = result.Where(d => d.DepositeRequestId == Requestid).ToList();
                }
                if (RequestType != 0 )
                {
                    result = result.Where(d => d.RequestType== RequestType).ToList();
                }
                if (!string.IsNullOrEmpty(Requesteddte))
                {
                  
                    result = result.Where(d => d.RequestedDate ==Convert.ToDateTime(Requesteddte)).ToList();
                }
                if (!string.IsNullOrEmpty(Completiondte))
                {
                    result = result.Where(d => d.CompletionDate == Convert.ToDateTime(Completiondte)).ToList();
                }

                return result;
            }
        }
        public Deposit GetDepositDetailByID(int id)
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                Deposit deposit = new Deposit();
                var tblDepositDetail = unitOfWork.RaiseRequest.GetDepositDetailByID(id);

                deposit.RequestType = Convert.ToInt32(tblDepositDetail.RequestType);
                deposit.Amount = Convert.ToInt32(tblDepositDetail.Amount);
                deposit.Status = Convert.ToInt32(tblDepositDetail.Status);
                deposit.Recieptpic = tblDepositDetail.ReceiptSource;
                deposit.Id = tblDepositDetail.DepositeRequestId;
                return deposit;

            }
        }
        public void UpdateDepositDetail(Deposit deposit)
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                var tblDepositDetail = unitOfWork.DepositRequests.Find(x => x.DepositeRequestId ==deposit.Id).FirstOrDefault();
                tblDepositDetail.RequestType = deposit.RequestTypes;
                tblDepositDetail.Amount = deposit.Amount;
                tblDepositDetail.Status = deposit.Status;
                tblDepositDetail.ReceiptSource = deposit.Reciept != null
                                  ? Path.GetFileName(deposit.Reciept.FileName).ToString() : deposit.Recieptpic;
                tblDepositDetail.CreatedBy = (int)HttpContext.Current.Session["UserId"];
                tblDepositDetail.CreatedDate = DateTime.Now;
                tblDepositDetail.UpdatedDate = DateTime.Now;
                unitOfWork.DepositRequests.Update(tblDepositDetail);
                //unitOfWork.UserCSPDetail.Save();

            }
        }

        public void DeleteDepositDetails(int id)
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                //unitOfWork.UserCSPDetail.DeleteUserCSPDetail(id);
                unitOfWork.RaiseRequest.DeleteDepositDetail(id);
                unitOfWork.RaiseRequest.Save();
            }
        }

        public long AddWithdrawDetails(Withdraw withdraw, int UserId)
        {
            try
            {
                var dateAndTime = DateTime.Now;
                var date = dateAndTime.Date;
                using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
                {
                    tblWithdrawalRequest objWithdrawal = new tblWithdrawalRequest();
                    // objDeposit.DepositeRequestId = Convert.ToInt64(deposit.Receipt);
                    objWithdrawal.Amount = withdraw.Amount;
                    objWithdrawal.RaisedBy = UserId;
                    objWithdrawal.RequestedDate = date;
                    objWithdrawal.Account = Convert.ToInt64(withdraw.Account);
                    objWithdrawal.CreatedBy = UserId;
                    objWithdrawal.CreatedDate = DateTime.Now;
                    objWithdrawal.Status = Convert.ToInt32(withdraw.Status);
                    objWithdrawal.ResolutionDetail = "";
                    objWithdrawal.CompletionDate = null;
                    objWithdrawal.UpdatedDate = DateTime.Now;
                    objWithdrawal.IsConfigured = true;
                    objWithdrawal.IsConfigured = true;
                    objWithdrawal.IsMake = true;
                    objWithdrawal.RequestType = Convert.ToInt32(withdraw.RequestType);
                    unitOfWork.WithdrawRequests.Add(objWithdrawal);
                    long id = objWithdrawal.WithdrawalRequestId;
                    return id;
                }
            }
            catch (DbEntityValidationException e)
            {
                foreach (var eve in e.EntityValidationErrors)
                {
                    Console.WriteLine("Entity of type \"{0}\" in state \"{1}\" has the following validation errors:",
                        eve.Entry.Entity.GetType().Name, eve.Entry.State);
                    foreach (var ve in eve.ValidationErrors)
                    {
                        Console.WriteLine("- Property: \"{0}\", Error: \"{1}\"",
                            ve.PropertyName, ve.ErrorMessage);
                    }
                }
                throw;
            }
        }
        public IList<tblWithdrawalRequest> GetWithdrawDetails()
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                return unitOfWork.RaiseRequest.GetAllWithdrawDetail().ToList();
            }
        }
        public IList<tblWithdrawalRequest> GetWithdrawDetailsSearch(int Requestid, int RequestType, string Requesteddte, string Completiondte,int Account)
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                var result =  unitOfWork.RaiseRequest.GetAllWithdrawDetail().ToList();

                if (Requestid != 0)
                {
                    result = result.Where(d => d.WithdrawalRequestId == Requestid).ToList();
                }
                if (RequestType != 0)
                {
                    result = result.Where(d => d.RequestType == RequestType).ToList();
                }
                if (!string.IsNullOrEmpty(Requesteddte))
                {

                    result = result.Where(d => d.RequestedDate == Convert.ToDateTime(Requesteddte)).ToList();
                }
                if (!string.IsNullOrEmpty(Completiondte))
                {
                    result = result.Where(d => d.CompletionDate == Convert.ToDateTime(Completiondte)).ToList();
                }
                if (Account != 0)
                {
                    result = result.Where(d => d.Account == Account).ToList();
                }

                return result;
            }
        }

        public Withdraw GetWithdrawDetailByID(int id)
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                Withdraw withdraw = new Withdraw();
                var tblWithdrawDetail = unitOfWork.RaiseRequest.GetWithdrawalDetailByID(id);
                withdraw.RequestType = Convert.ToInt32(tblWithdrawDetail.RequestType);
                withdraw.Amount = Convert.ToInt32(tblWithdrawDetail.Amount);
                withdraw.Status = Convert.ToInt32(tblWithdrawDetail.Status);
                withdraw.Account =Convert.ToInt64(tblWithdrawDetail.Account);
                withdraw.Id = tblWithdrawDetail.WithdrawalRequestId;
                return withdraw;

            }
        }

        public void UpdateWithdrawDetail(Withdraw withdraw)
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                var tblWithdrawDetail = unitOfWork.WithdrawRequests.Find(x => x.WithdrawalRequestId == withdraw.Id).FirstOrDefault();
                tblWithdrawDetail.RequestType = Convert.ToInt32(withdraw.RequestTypes);
                tblWithdrawDetail.Amount = withdraw.Amount;
                tblWithdrawDetail.Status = withdraw.Status;
                tblWithdrawDetail.Account = withdraw.Account;
                tblWithdrawDetail.UpdatedDate = DateTime.Now;
                tblWithdrawDetail.UpdatedBy = (int)HttpContext.Current.Session["UserId"];
                //tblDepositDetail.CreatedBy = (int)HttpContext.Current.Session["UserId"];
                //tblDepositDetail.CreatedDate = DateTime.Now;
                unitOfWork.WithdrawRequests.Update(tblWithdrawDetail);
                //unitOfWork.UserCSPDetail.Save();

            }
        }

        public void DeleteWithdrawDetails(int id)
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                unitOfWork.RaiseRequest.DeleteWithdrawDetail(id);
                unitOfWork.RaiseRequest.Save();
            }
        }


        public void DeleteTechDetails(int id)
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
               
                unitOfWork.RaiseRequest.DeleteTechDetail(id);
                unitOfWork.RaiseRequest.Save();
            }
        }

    }
}
