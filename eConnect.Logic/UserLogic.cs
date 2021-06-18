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
    public class UserLogic
    {
        public tblUser ValidateUserLogin(string userName, string password)
        {
            tblUser objtblUser = new tblUser();
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                objtblUser = unitOfWork.Userss.GetUsersByUserName(userName);
              
            }
            if (objtblUser != null)
            {
                if (objtblUser.Password == password)
                {
                    return objtblUser;
                }
            }

            return null;          
        }
        public tblUser GetUsersInfo()
        {
            tblUser ue = new tblUser();
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                var dsds = unitOfWork.Userss.GetAllUsersByStateID(1);
                return ue;
            }
        }


        public long InsertUserDetails(UsersModel item)
        {
            try
            {
                using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
                {

                    tblCSPDetail um = new tblCSPDetail();
                    um.FatherName = item.FatherName;
                    um.MotherName = item.MotherName;
                    um.EmergencyContactNumber = item.Mobile.ToString();
                    um.EmailId = item.EMailID;
                    // um.StateID = item.StateID;
                    um.CityId = item.CityID;
                    //um.CountryID = item.CountryID;
                    //um.InActive = item.InActive;
                    //um.Address1 = item.Address1;
                    um.Name = item.CSPName;
                    um.CSPCode = item.CSPCode;
                    //um.Password = item.Password;
                    um.BranchCode = item.BranchCode;
                    um.PAN = item.PANCardNo;
                    um.VoterId = item.VoterIDNo;
                    um.AadharNo = item.AdharCardNo;
                    um.Education = item.Education;
                    um.BankName = item.BankAccountName;
                    um.BankAccountNumber = item.BankAccountName;
                    um.IFSC = item.FatherName;
                    um.ExpiryDate = Convert.ToDateTime(item.AccountExpiryDate);
                    //um.BankName = item.BankAccountDetail;
                    //um.CertificateStatus = item.CertificateStatus;
                    um.ProfilePicSource = item.PassportPic != null
                                ? Path.GetFileName(item.PassportPic.FileName).ToString() : null;
                    um.VoterIdSource = item.VoterIDPic != null
                                ? Path.GetFileName(item.VoterIDPic.FileName).ToString() : null;
                    um.PANSource = item.PANCardPic != null
                                ? Path.GetFileName(item.PANCardPic.FileName).ToString() : null;
                    um.AadharCardSource = item.AAdharCardPic != null
                               ? Path.GetFileName(item.AAdharCardPic.FileName).ToString() : null;
                    um.IIBFCertificationSource = item.IIBFCertificatePic != null
                             ? Path.GetFileName(item.IIBFCertificatePic.FileName).ToString() : null;
                    //um.Status = 1;
                    um.EducationProofSource = "";
                    um.CreatedDate = DateTime.Now;
                    um.UpdatedDate = DateTime.Now;
                    um.CreatedBy = 0;
                    unitOfWork.AddCSPDetail.Add(um);
                    long id = um.CSPId;  //gives the newly generated 
                    return id;
                }
            }

            catch (Exception )
            {
                return 0;
            }
            //catch (DbEntityValidationException e)
            //{
            //    foreach (var eve in e.EntityValidationErrors)
            //    {
            //        Console.WriteLine("Entity of type \"{0}\" in state \"{1}\" has the following validation errors:",
            //            eve.Entry.Entity.GetType().Name, eve.Entry.State);
            //        foreach (var ve in eve.ValidationErrors)
            //        {
            //            Console.WriteLine("- Property: \"{0}\", Error: \"{1}\"",
            //                ve.PropertyName, ve.ErrorMessage);
            //        }
            //    }
            //    throw;
            //}
        }
            public void InsertUserLoginDetails(long userid)
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                string uip = CommonLogic.GetIPAddress();
                tblUserLoginLog ue = new tblUserLoginLog();
                //ue.IPAddress = uip;
                //ue.LogInTime = DateTime.Now;
                //ue.UserID = userid;
                unitOfWork.UserLoginDetailss.Add(ue);
            }
        }


        public IEnumerable<tblUser> GetUsersInfoByStatus(int id)
        {
            UsersModel um = new UsersModel();
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                var usersList = unitOfWork.Userss.GetAllUsersByStatus(id).ToList();
                if (usersList != null)
                {
                    foreach (var item in usersList)
                    {
                        //um.UserID = item.UserID;
                        //um.CSPName = item.CSPName;
                        //um.StateID = item.StateID;
                        //um.EMailID = item.EMailID;
                        //um.CityID = item.CityID;
                        //um.CityName = item.City.CityName;
                        //um.StateName = item.State.StateName;
                        //um.CountryName = item.Country.CountryName;
                    }
                }
                return usersList;
            }
        }

        public IEnumerable<tblUser> GetUsersDetailsByid(int id)
        {
            UsersModel um = new UsersModel();
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                var usersList = unitOfWork.Userss.GetAllUsersDetailsByid(id).ToList();
                if (usersList != null)
                {
                    //foreach (var item in usersList)
                    {
                        //um.UserID = item.UserID;
                        //um.FatherName = item.FatherName;
                        //um.MotherName = item.MotherName;
                        //um.Mobile = item.Mobile;
                        //um.EMailID = item.EMailID;
                        //um.StateID = item.StateID;
                        //um.CityID = item.CityID;
                        //um.CountryID = item.CountryID;
                        //um.InActive = item.InActive;
                        //um.Address1 = item.Address1;
                        //um.Username = item.Username;
                        //um.Password = item.Password;
                        //um.BranchCode = item.BranchCode;
                        //um.PANCardNo = item.PANCardNo;
                        //um.VoterIDNo = item.VoterIDNo;
                        //um.AdharCardNo = item.AdharCardNo;
                        //um.Education = item.Education;
                        //um.CSPName = item.CSPName;
                        //um.CSPCode = item.CSPCode;
                        //um.AccountExpiryDate = item.AccountExpiryDate;
                        //um.BankAccountDetail = item.BankAccountDetail;
                        //um.CertificateStatus = item.CertificateStatus;
                        //um.Status = item.Status;
                        //um.CityName = item.City.CityName;
                        //um.StateName = item.State.StateName;
                        //um.CountryName = item.Country.CountryName;
                    }
                }
                return usersList;
            }
        }

        public void AddDepositDetails(Deposit deposit, int UserId)//Added by Aditya
        {
            try
            {
                using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
                {
                    tblDepositRequest objDeposit = new tblDepositRequest();
                    objDeposit.DepositeRequestId = Convert.ToInt64(deposit.Receipt);
                    objDeposit.Amount = deposit.Amount;
                    objDeposit.RaisedBy = UserId;
                    objDeposit.RequestedDate = DateTime.Now;
                   objDeposit.ReceiptSource = deposit.FileName;
                    objDeposit.CreatedBy = UserId;
                    objDeposit.CreatedDate = DateTime.Now;
                    objDeposit.Status = 0;
                    objDeposit.ResolutionDetail = "test";
                    objDeposit.CompletionDate = DateTime.Now;
                    objDeposit.UpdatedDate = DateTime.Now;
                    unitOfWork.DepositRequests.Add(objDeposit);


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

        public void AddWithdrawDetails(Withdraw withdraw, int UserId)//Added by Aditya
        {
            try
            {
                using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
                {
                    tblWithdrawalRequest objWithdraw = new tblWithdrawalRequest();
                    objWithdraw.WithdrawalRequestId = Convert.ToInt64(withdraw.WStatus);
                    objWithdraw.Amount = withdraw.WAmount;
                    objWithdraw.RaisedBy = UserId;
                    objWithdraw.RequestedDate = DateTime.Now;
                    objWithdraw.CreatedBy = UserId;
                    objWithdraw.CreatedDate = DateTime.Now;
                    objWithdraw.Status = 0;
                    objWithdraw.ResolutionDetail = "test";
                    objWithdraw.CompletionDate = DateTime.Now;
                    objWithdraw.UpdatedDate = DateTime.Now;
                    objWithdraw.Account = withdraw.AccDetails;
                    unitOfWork.WithdrawRequests.Add(objWithdraw);
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
    }
}

