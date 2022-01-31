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
                    objDeposit.RequestedDate = dateAndTime;
                    objDeposit.DepositDate = Convert.ToDateTime(deposit.BankDepositDate);
                    objDeposit.ReceiptSource = deposit.Reciept != null
                                ? Path.GetFileName(deposit.Reciept.FileName).ToString() : null;
                    objDeposit.CreatedBy = UserId;
                    objDeposit.CreatedDate = DateTime.Now;
                    objDeposit.Status = 1;
                    objDeposit.ResolutionDetail = "";
                    objDeposit.CompletionDate = null;
                    objDeposit.UpdatedDate = DateTime.Now;
                    objDeposit.HasReceipt = true;
                    objDeposit.RequestType = 2;
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

                return result;
            }
        }
        public Deposit GetDepositDetailByID(int id)
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                Deposit deposit = new Deposit();

                var tblMSDepositDetail = unitOfWork.RaiseRequest.GetManageDepositRequestDetails().ToList();

                var Query = from x in tblMSDepositDetail where x.DepositeRequestId == id select x;
                var tblDepositDetail = unitOfWork.RaiseRequest.GetDepositDetailByID(id);

                deposit.RequestType = Convert.ToInt32(tblDepositDetail.RequestType);
                deposit.Amount = Convert.ToInt32(tblDepositDetail.Amount);
                deposit.Status = Convert.ToInt32(tblDepositDetail.Status);
                deposit.Recieptpic = tblDepositDetail.ReceiptSource;
                deposit.Id = tblDepositDetail.DepositeRequestId;
                foreach (var x in Query)
                {
                    deposit.CSPID = x.CSPCode;
                    deposit.CSPName = x.CSPName;
                    //deposit.Account = x.CSPAccount.ToString();
                    deposit.AmountDetails = x.Amount.ToString();
                    deposit.RequestedDate = Convert.ToDateTime(x.RequestedDate).ToString("dd/MMM/yyyy");
                    if (!string.IsNullOrEmpty(x.CompletionDate.ToString()))
                    {
                        deposit.CompletionDate = Convert.ToDateTime(x.CompletionDate).ToString("dd/MMM/yyyy");
                    }
                    deposit.CurrentStatus = x.Status.ToString();
                    deposit.Comment = x.Comment;
                }
                return deposit;

            }
        }
        public void UpdateDepositDetail(Deposit deposit)
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                var tblDepositDetail = unitOfWork.DepositRequests.Find(x => x.DepositeRequestId == deposit.Id).FirstOrDefault();
                tblDepositDetail.RequestType = deposit.RequestTypes;
                tblDepositDetail.Amount = deposit.Amount;
                // tblDepositDetail.Status = deposit.Status;
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
                    objWithdrawal.RaisedBy = UserId;//Passing Csp id in Raised by from session
                    objWithdrawal.RequestedDate = dateAndTime;
                    objWithdrawal.Account = Convert.ToInt64(withdraw.Account);
                    objWithdrawal.CreatedBy = UserId;
                    objWithdrawal.CreatedDate = DateTime.Now;
                    objWithdrawal.Status = 1;
                    objWithdrawal.ResolutionDetail = "";
                    objWithdrawal.CompletionDate = null;
                    objWithdrawal.UpdatedDate = DateTime.Now;
                    objWithdrawal.IsConfigured = false;
                    objWithdrawal.IsConfigured = false;
                    objWithdrawal.IsMake = false;
                    objWithdrawal.RequestType = 1;
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
        public IList<tblWithdrawalRequest> GetWithdrawDetailsByCSPID(int CSPID)
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                return unitOfWork.RaiseRequest.GetAllWithdrawDetailbyCSPID(CSPID).ToList();
            }
        }
        public IList<tblDepositRequest> GetDepositDetailsByCSPID(int CSPID)
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                return unitOfWork.RaiseRequest.GetAllDeposiDetailbyCSPID(CSPID).ToList();
            }
        }
        public IList<tblWithdrawalRequest> GetWithdrawDetailsSearch(int Requestid, int RequestType, string Requesteddte, string Completiondte, int Account)
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                var result = unitOfWork.RaiseRequest.GetAllWithdrawDetail().ToList();

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
                var tblMWithdrawDetail = unitOfWork.RaiseRequest.GetManageWithdrawalRequestDetails().ToList();
                var Query = from x in tblMWithdrawDetail where x.WithdrawalRequestId == id select x;
                var tblWithdrawDetail = unitOfWork.RaiseRequest.GetWithdrawalDetailByID(id);
                withdraw.RequestType = Convert.ToInt32(tblWithdrawDetail.RequestType);
                withdraw.Amount = Convert.ToInt32(tblWithdrawDetail.Amount);
                withdraw.Status = Convert.ToInt32(tblWithdrawDetail.Status);
                // withdraw.Account =Convert.ToInt64(tblWithdrawDetail.Account);
                withdraw.Id = tblWithdrawDetail.WithdrawalRequestId;
                foreach (var x in Query)
                {
                    withdraw.CSPID = x.CSPCode;
                    withdraw.CSPName = x.CSPName;
                    withdraw.Account = x.CSPAccount.ToString();
                    withdraw.AmountDetails = x.Amount.ToString();
                    withdraw.RequestedDate = Convert.ToDateTime(x.RequestedDate).ToString("dd/MMM/yyyy");
                    if (!string.IsNullOrEmpty(x.CompletionDate.ToString()))
                    {
                        withdraw.CompletionDate = Convert.ToDateTime(x.CompletionDate).ToString("dd/MMM/yyyy");
                    }
                    withdraw.CurrentStatus = x.Status.ToString();
                    withdraw.Comment = x.Comment;
                }

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
                // tblWithdrawDetail.Status = withdraw.Status;
                //tblWithdrawDetail.Account = withdraw.Account;
                tblWithdrawDetail.UpdatedDate = DateTime.Now;
                tblWithdrawDetail.UpdatedBy = (int)HttpContext.Current.Session["CSPID"];
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

        public IList<sp_GetManageWithdrawalRequestDetails_Result> GetManageWithdrawDetails()
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                return unitOfWork.RaiseRequest.GetManageWithdrawalRequestDetails().ToList();
            }
        }
        public IList<sp_GetManageDepositRequestDetails_Result> GetManageDepositDetails()
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                return unitOfWork.RaiseRequest.GetManageDepositRequestDetails().ToList();
            }
        }
        public IList<sp_GetManageTechSupportRequestDetails_Result> GetManageTechDetails()
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                return unitOfWork.RaiseRequest.GetManageTechRequestDetails().ToList();
            }
        }
        public IList<sp_GetManageWithdrawalRequestDetails_Result> GetManageWithdrawDetailsSearch(string Requestid, string CspName, int CspID, int State, int City, int Status, string Requesteddte, string Completiondte, string BranchCode, string Category)
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                var result = unitOfWork.RaiseRequest.GetManageWithdrawalRequestDetails().ToList();

                if (Requestid != "0")
                {
                    result = result.Where(d => d.CSPCode == Requestid).ToList();
                }
                if (!string.IsNullOrEmpty(CspName))
                {
                    result = result.Where(d => d.CSPName.Contains(CspName)).ToList();
                    result = result.Where(d => d.CSPName.StartsWith(CspName)).ToList();
                    result = result.Where(d => d.CSPName.EndsWith(CspName)).ToList();
                }
                if (CspID != 0)
                {
                    result = result.Where(d => d.CSPId == CspID).ToList();
                }
                if (State != 0)
                {
                    result = result.Where(d => d.State == State).ToList();
                }
                if (City != 0)
                {
                    result = result.Where(d => d.City == City).ToList();
                }
                if (Status != 0)
                {
                    result = result.Where(d => d.Status == Status).ToList();
                }
                if (!string.IsNullOrEmpty(Requesteddte))
                {

                    result = result.Where(d => d.RequestedDate == Convert.ToDateTime(Requesteddte)).ToList();
                }
                if (!string.IsNullOrEmpty(Completiondte))
                {

                    result = result.Where(d => d.CompletionDate == Convert.ToDateTime(Completiondte)).ToList();
                }
                if (!string.IsNullOrEmpty(Category))
                {
                    result = result.Where(d => d.Category.Contains(Category.ToString())).ToList();
                }
                if (!string.IsNullOrEmpty(BranchCode))
                {
                    result = result.Where(d => d.BranchCode.Contains(BranchCode.ToString())).ToList();
                }
                return result;
            }
        }
        public IList<sp_GetManageDepositRequestDetails_Result> GetManageDepositDetailsSearch(string Requestid, string CspName, int CspID, int State, int City, int Status, string Requesteddte, string Completionedte, string BranchCode, string Category,string Depositdte)
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                var result = unitOfWork.RaiseRequest.GetManageDepositRequestDetails().ToList();

                if (Requestid != "0")
                {
                    result = result.Where(d => d.CSPCode == Requestid).ToList();
                }
                if (!string.IsNullOrEmpty(CspName))
                {
                    result = result.Where(d => d.CSPName.Contains(CspName)).ToList();
                    result = result.Where(d => d.CSPName.StartsWith(CspName)).ToList();
                    result = result.Where(d => d.CSPName.EndsWith(CspName)).ToList();
                }
                if (CspID != 0)
                {
                    result = result.Where(d => d.CSPId == CspID).ToList();
                }
                if (State != 0)
                {
                    result = result.Where(d => d.State == State).ToList();
                }
                if (City != 0)
                {
                    result = result.Where(d => d.City == City).ToList();
                }
                if (Status != 0)
                {
                    result = result.Where(d => d.Status == Status).ToList();
                }
                if (!string.IsNullOrEmpty(Requesteddte))
                {

                    result = result.Where(d => d.RequestedDate == Convert.ToDateTime(Requesteddte)).ToList();
                }
                if (!string.IsNullOrEmpty(Completionedte))
                {

                    result = result.Where(d => d.CompletionDate == Convert.ToDateTime(Completionedte)).ToList();
                }
                if (!string.IsNullOrEmpty(Category))
                {
                    result = result.Where(d => d.Category.Contains(Category.ToString())).ToList();
                }
                if (!string.IsNullOrEmpty(BranchCode))
                {
                    result = result.Where(d => d.BranchCode.Contains(BranchCode.ToString())).ToList();
                }
                if (!string.IsNullOrEmpty(Depositdte))
                {
                    result = result.Where(d => d.DepositDate == Convert.ToDateTime(Depositdte)).ToList();
                }
                return result;
            }
        }
        public ManageWithdrawal GetManageWithdrawDetailByID(int id)
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                ManageWithdrawal withdraw = new ManageWithdrawal();
                var tblWithdrawDetail = unitOfWork.RaiseRequest.GetManageWithdrawalRequestDetails().ToList();
                var Query = from x in tblWithdrawDetail where x.WithdrawalRequestId == id select x;
                var tblMWithdrawDetail = unitOfWork.WithdrawRequests.Find(x => x.WithdrawalRequestId == id).FirstOrDefault();
                foreach (var x in Query)
                {
                    withdraw.Id = Convert.ToInt32(x.WithdrawalRequestId);
                    withdraw.RequestId = x.WithdrawalRequestId.ToString();
                    withdraw.CSPName = x.CSPName.ToString();
                    withdraw.Amount = Convert.ToInt32(x.Amount);
                    withdraw.AuthorizedAmount = Convert.ToInt32(tblMWithdrawDetail.AuthorizedAmount);
                    withdraw.AccountDetail = x.Account.ToString();
                    withdraw.RequestedDate = Convert.ToDateTime(x.RequestedDate).ToString("dd/MMM/yyyy");
                    withdraw.CurrentStatus = x.Status.ToString();
                    withdraw.CurrentStatus = x.Status.ToString();
                    if (!string.IsNullOrEmpty(x.CompletionDate.ToString()))
                    {
                        withdraw.CompletionDate = Convert.ToDateTime(x.CompletionDate).ToString("dd/MMM/yyyy");
                    }
                    withdraw.Configure = Convert.ToBoolean(tblMWithdrawDetail.IsConfigured);
                    withdraw.Make = Convert.ToBoolean(tblMWithdrawDetail.IsMake);
                    withdraw.Authorize = Convert.ToBoolean(tblMWithdrawDetail.IsAuthorized);
                    withdraw.EmailAddress = tblMWithdrawDetail.EmailAddress;
                    withdraw.Comment = tblMWithdrawDetail.Comment;
                }
                return withdraw;

            }
        }
        public ManageDeposit GetManageDepositDetailByID(int id)
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                ManageDeposit deposit = new ManageDeposit();
                var tblDepositDetail = unitOfWork.RaiseRequest.GetManageDepositRequestDetails().ToList();
                var Query = from x in tblDepositDetail where x.DepositeRequestId == id select x;
                var tblMDepositDetail = unitOfWork.DepositRequests.Find(x => x.DepositeRequestId == id).FirstOrDefault();

                foreach (var x in Query)
                {
                    deposit.Id = Convert.ToInt32(x.DepositeRequestId);
                    deposit.RequestId = x.DepositeRequestId.ToString();
                    deposit.CSPName = x.CSPName.ToString();
                    deposit.Amount = Convert.ToInt32(x.Amount);
                    //deposit.AccountDetail = x.Account.ToString();
                    deposit.RequestedDate = Convert.ToDateTime(x.RequestedDate).ToString("dd/MMM/yyyy");
                    deposit.CurrentStatus = x.Status.ToString();
                    if (!string.IsNullOrEmpty(x.CompletionDate.ToString()))
                    {
                        deposit.CompletionDate = Convert.ToDateTime(x.CompletionDate).ToString("dd/MMM/yyyy");
                    }
                    deposit.VerifyReciept = Convert.ToBoolean(x.IsVerified);
                    deposit.RecieptDetail = tblMDepositDetail.ReceiptSource;
                    deposit.Comment = x.Comment;
                }
                return deposit;

            }
        }

        public ManageTechSupport GetManageTechDetailByID(int id)
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                ManageTechSupport tech = new ManageTechSupport();
                var tblTechSupport = unitOfWork.RaiseRequest.GetManageTechRequestDetails().ToList();
                var Query = from x in tblTechSupport where x.TechRequestId == id select x;
                var tblTech = unitOfWork.TechSupportRequestss.Find(x => x.TechRequestId == id).FirstOrDefault();


                foreach (var x in Query)
                {
                    tech.Id = Convert.ToInt32(x.TechRequestId);
                    tech.RequestId = x.TechRequestId.ToString();
                    tech.ProblemType = Convert.ToInt32(x.ProblemType);
                    //deposit.Amount = Convert.ToInt32(x.Amount);
                    tech.Description = x.Description.ToString();
                    tech.MobileNo = x.MobileNo.ToString();
                    tech.RequestedDate = Convert.ToDateTime(x.RequestedDate).ToString("dd/MMM/yyyy");
                    tech.CurrentStatus = x.Status.ToString();
                    if (!string.IsNullOrEmpty(x.CompletionDate.ToString()))
                    {
                        tech.CompletionDate = Convert.ToDateTime(x.CompletionDate).ToString("dd/MMM/yyyy");
                    }
                    tech.Recieptpic = x.AttachmentSource;
                    tech.ResolutionDetail = x.ResolutionDetail;
                    tech.Email = tblTech.Email;
                    tech.AnyDeskDetails = x.AnyDeskDetail;


                }
                return tech;

            }
        }
        public void UpdateManageWithdrawDetail(ManageWithdrawal withdraw)
        {
            var dateAndTime = DateTime.Now;
            var date = dateAndTime.Date;
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                var tblWithdrawDetail = unitOfWork.WithdrawRequests.Find(x => x.WithdrawalRequestId == withdraw.Id).FirstOrDefault();
                tblWithdrawDetail.Comment = withdraw.Comment;
                tblWithdrawDetail.EmailAddress = withdraw.EmailAddress;
                if (withdraw.CurrentStatus == "3")
                {
                    tblWithdrawDetail.Status = 3;
                    tblWithdrawDetail.CompletionDate = dateAndTime;
                    tblWithdrawDetail.IsMake = withdraw.Make;
                    tblWithdrawDetail.IsAuthorized = withdraw.Authorize;
                    tblWithdrawDetail.IsConfigured = withdraw.Configure;
                }
                else if (withdraw.CurrentStatus == "7")
                {
                    tblWithdrawDetail.Status = 7;
                    tblWithdrawDetail.CompletionDate = dateAndTime;
                    tblWithdrawDetail.IsMake = withdraw.Make;
                    tblWithdrawDetail.IsAuthorized = withdraw.Authorize;
                    tblWithdrawDetail.IsConfigured = withdraw.Configure;

                }
                else
                {
                    tblWithdrawDetail.IsMake = withdraw.Make;
                    tblWithdrawDetail.IsAuthorized = withdraw.Authorize;
                    tblWithdrawDetail.IsConfigured = withdraw.Configure;
                    tblWithdrawDetail.Status = Convert.ToInt32(withdraw.CurrentStatus);
                    tblWithdrawDetail.CompletionDate = null;

                }
                tblWithdrawDetail.UpdatedDate = DateTime.Now;
                tblWithdrawDetail.UpdatedBy = (int)HttpContext.Current.Session["UserId"];
                tblWithdrawDetail.AuthorizedAmount = withdraw.AuthorizedAmount;
                unitOfWork.WithdrawRequests.Update(tblWithdrawDetail);
                //unitOfWork.UserCSPDetail.Save();

            }
        }
        public void UpdateManageDepositDetail(ManageDeposit deposit)
        {
            var dateAndTime = DateTime.Now;
            var date = dateAndTime.Date;
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                var tblDepositDetail = unitOfWork.DepositRequests.Find(x => x.DepositeRequestId == deposit.Id).FirstOrDefault();
                tblDepositDetail.Comment = deposit.Comment;

                if (deposit.CurrentStatus == "3")
                {
                    tblDepositDetail.Status = 3;
                    tblDepositDetail.CompletionDate = dateAndTime;
                    tblDepositDetail.IsVerified = deposit.VerifyReciept;
                }
                else
                {
                    tblDepositDetail.Status = Convert.ToInt32(deposit.CurrentStatus);
                    tblDepositDetail.CompletionDate = null;
                    tblDepositDetail.IsVerified = deposit.VerifyReciept;
                }
                tblDepositDetail.UpdatedDate = DateTime.Now;
                tblDepositDetail.UpdatedBy = (int)HttpContext.Current.Session["UserId"];
                unitOfWork.DepositRequests.Update(tblDepositDetail);


            }
        }
        public void UpdateManageTechDetail(ManageTechSupport tech)
        {
            var dateAndTime = DateTime.Now;
            var date = dateAndTime.Date;
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                var tblTechDetail = unitOfWork.TechSupportRequestss.Find(x => x.TechRequestId == tech.Id).FirstOrDefault();


                if (tech.CurrentStatus == "3")
                {
                    tblTechDetail.Status = 3;
                    tblTechDetail.CompletionDate = dateAndTime;
                    tblTechDetail.ResolutionDetail = tech.ResolutionDetail;
                }
                else
                {
                    tblTechDetail.Status = Convert.ToInt32(tech.CurrentStatus);
                    tblTechDetail.CompletionDate = null;
                    tblTechDetail.ResolutionDetail = tech.ResolutionDetail;

                }
                tblTechDetail.Email = tech.Email;
                tblTechDetail.UpdatedDate = DateTime.Now;
                tblTechDetail.UpdatedBy = (int)HttpContext.Current.Session["UserId"];
                unitOfWork.TechSupportRequestss.Update(tblTechDetail);


            }
        }
        public IList<tblTechRequest> GetTechRequestDetailsByCSPID(int CSPID)
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                return unitOfWork.RaiseRequest.GetAllTechRequestbyCSPID(CSPID).ToList();
            }
        }

        public IList<sp_GetManageTechSupportRequestDetails_Result> GetManageTechDetailsSearch(string Requestid, string CspName, int CspID, int State, int City, int Status, string Requesteddte, string Completionedte, string BranchCode, string Category, int ProblemType)
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                var result = unitOfWork.RaiseRequest.GetManageTechRequestDetails().ToList();

                if (Requestid != "0")
                {
                    result = result.Where(d => d.CSPCode == Requestid).ToList();
                }
                if (!string.IsNullOrEmpty(CspName))
                {
                    result = result.Where(d => d.CSPName.Contains(CspName)).ToList();
                    result = result.Where(d => d.CSPName.StartsWith(CspName)).ToList();
                    result = result.Where(d => d.CSPName.EndsWith(CspName)).ToList();
                }
                if (CspID != 0)
                {
                    result = result.Where(d => d.CSPId == CspID).ToList();
                }
                if (State != 0)
                {
                    result = result.Where(d => d.State == State).ToList();
                }
                if (City != 0)
                {
                    result = result.Where(d => d.City == City).ToList();
                }
                if (Status != 0)
                {
                    result = result.Where(d => d.Status == Status).ToList();
                }
                if (!string.IsNullOrEmpty(Requesteddte))
                {

                    result = result.Where(d => d.RequestedDate == Convert.ToDateTime(Requesteddte)).ToList();
                }
                if (!string.IsNullOrEmpty(Category))
                {
                    result = result.Where(d => d.Category.Contains(Category.ToString())).ToList();
                }
                if (!string.IsNullOrEmpty(BranchCode))
                {
                    result = result.Where(d => d.BranchCode.Contains(BranchCode.ToString())).ToList();
                }
                if (ProblemType != 0)
                {
                    result = result.Where(d => d.ProblemType == ProblemType).ToList();
                }
                return result;
            }
        }

        public string WithdrawAccNumber(int id)
        {
            string Account = "";
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {

                var tblWithdrawDetail = unitOfWork.RaiseRequest.GetManageWithdrawalRequestDetails().ToList();
                var Query = from x in tblWithdrawDetail where x.RaisedBy == id select x;

                foreach (var x in Query)
                {
                    Account = x.CSPAccount;
                }
            }
            return Account;
        }

        public void UpdateRequestDetailsStatus(int RequestId, string status, string Comments, string RequestType)
        {
            try
            {
                using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
                {
                    if (RequestType == "1")// For Deposit Request
                    {
                        var tblDepositDetail = unitOfWork.DepositRequests.Find(x => x.DepositeRequestId == (RequestId)).FirstOrDefault();
                        if(!string.IsNullOrEmpty(Comments))
                        {
                            tblDepositDetail.Comment = Comments;
                        }
                        tblDepositDetail.Status = Convert.ToInt32(status);
                        tblDepositDetail.UpdatedDate = DateTime.Now;
                        tblDepositDetail.UpdatedBy = (int)HttpContext.Current.Session["UserId"];
                        unitOfWork.DepositRequests.Update(tblDepositDetail);
                    }
                    if (RequestType == "2")// For Withdraw Request
                    {

                        var tblWithdrawDetail = unitOfWork.WithdrawRequests.Find(x => x.WithdrawalRequestId == (RequestId)).FirstOrDefault();
                        if (!string.IsNullOrEmpty(Comments))
                        {
                          tblWithdrawDetail.Comment = Comments;
                        }
                        tblWithdrawDetail.Status = Convert.ToInt32(status);
                        tblWithdrawDetail.UpdatedDate = DateTime.Now;
                        tblWithdrawDetail.UpdatedBy = (int)HttpContext.Current.Session["UserId"];
                        unitOfWork.WithdrawRequests.Update(tblWithdrawDetail);
                    }
                    if (RequestType == "3")// For Technical Support
                    {
                        var tblTechDetail = unitOfWork.TechSupportRequestss.Find(x => x.TechRequestId == (RequestId)).FirstOrDefault();
                        tblTechDetail.Status = Convert.ToInt32(status);
                        if (!string.IsNullOrEmpty(Comments))
                        {
                            tblTechDetail.Comment = Comments;
                        }
                        tblTechDetail.UpdatedDate = DateTime.Now;
                        tblTechDetail.UpdatedBy = (int)HttpContext.Current.Session["UserId"];
                        unitOfWork.TechSupportRequestss.Update(tblTechDetail);
                    }
                }

            }
            catch (Exception ex)
            {

            }
        }
        public void UpdateConfigure_Make_AuthorizeStatus(int RequestId, string Configure, string Make, string Authorize)
        {
            try
            {
                using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
                {
                   
                        var tblWithdrawDetail = unitOfWork.WithdrawRequests.Find(x => x.WithdrawalRequestId == (RequestId)).FirstOrDefault();
                        tblWithdrawDetail.IsMake = Make == "true" ? true : false;
                        tblWithdrawDetail.IsAuthorized = Authorize == "true" ? true : false;
                        tblWithdrawDetail.IsConfigured = Configure =="true"?true:false;
                        tblWithdrawDetail.UpdatedDate = DateTime.Now;
                        tblWithdrawDetail.UpdatedBy = (int)HttpContext.Current.Session["UserId"];
                        unitOfWork.WithdrawRequests.Update(tblWithdrawDetail);
                    
                }

            }
            catch (Exception ex)
            {

            }
        }
        public void UpdateConfigure_Make_AuthorizeStatus_AutAmount(int RequestId, string Configure, string Make, string Authorize,decimal AutAmt)
        {
            try
            {
                using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
                {

                    var tblWithdrawDetail = unitOfWork.WithdrawRequests.Find(x => x.WithdrawalRequestId == (RequestId)).FirstOrDefault();
                    tblWithdrawDetail.IsMake = Make == "true" ? true : false;
                    tblWithdrawDetail.IsAuthorized = Authorize == "true" ? true : false;
                    tblWithdrawDetail.IsConfigured = Configure == "true" ? true : false;
                    tblWithdrawDetail.AuthorizedAmount = AutAmt;
                    tblWithdrawDetail.UpdatedDate = DateTime.Now;
                    tblWithdrawDetail.UpdatedBy = (int)HttpContext.Current.Session["UserId"];

                    if (tblWithdrawDetail.IsMake == true && tblWithdrawDetail.IsAuthorized == true && tblWithdrawDetail.IsConfigured == true)
                    {
                        tblWithdrawDetail.Status = 3;
                        tblWithdrawDetail.CompletionDate = DateTime.Now;

                    }
                    unitOfWork.WithdrawRequests.Update(tblWithdrawDetail);

                }

            }
            catch (Exception ex)
            {

            }
        }
    }
}
