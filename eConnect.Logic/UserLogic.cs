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

                    tblUserCSPDetail um = new tblUserCSPDetail();
                    um.FatherName = item.FatherName;
                    um.MotherName = item.MotherName;
                    um.EmergencyContactNumber = item.Mobile.ToString();
                    um.Email = item.EMailID;
                    // um.StateID = item.StateID;
                    //um.CityId = item.CityID;
                    //um.CountryID = item.CountryID;
                    //um.InActive = item.InActive;
                    //um.Address1 = item.Address1;
                    um.CSPName = item.CSPName;
                    um.CSPCode = item.CSPCode;
                    //um.Password = item.Password;
                    um.BranchCode = item.BranchCode;
                    um.PAN = item.PANCardNo;
                    um.VoterId = item.VoterIDNo;
                    um.AadharNo = item.AdharCardNo;
                    um.Education = item.Education;
                    um.BankName = item.BankAccountName;
                    um.BankAccount = item.BankAccountName;
                    um.IFSC = item.FatherName;
                    um.ExpiryDate = Convert.ToDateTime(item.AccountExpiryDate);
                    //um.BankName = item.BankAccountDetail;
                    //um.CertificateStatus = item.CertificateStatus;
                    um.PassportSizePhoto = item.PassportPic != null
                                ? Path.GetFileName(item.PassportPic.FileName).ToString() : null;
                    um.VoterIdImage = item.VoterIDPic != null
                                ? Path.GetFileName(item.VoterIDPic.FileName).ToString() : null;
                    um.PANImage = item.PANCardPic != null
                                ? Path.GetFileName(item.PANCardPic.FileName).ToString() : null;
                    um.AadharImage = item.AAdharCardPic != null
                               ? Path.GetFileName(item.AAdharCardPic.FileName).ToString() : null;
                    um.IIBFCertificationImage = item.IIBFCertificatePic != null
                             ? Path.GetFileName(item.IIBFCertificatePic.FileName).ToString() : null;
                    //um.Status = 1;
                    um.LatestEducationProofImage = "";
                    um.CreatedDate = DateTime.Now;
                    um.UpdatedDate = DateTime.Now;
                    um.CreatedBy = 0;
                    unitOfWork.AddCSPDetail.Add(um);
                    long id = um.CSPId;  //gives the newly generated 
                    return id;
                }
            }

            catch (Exception)
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

        public void ResetPasswordLogic(ResetPasswordViewModel ResetPasswordViewModel)
        {
            try
            {
                using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
                {
                    var tblUser = unitOfWork.Userss.Find(d => d.UserName == ResetPasswordViewModel.UserName).FirstOrDefault();
                    var CSPData = unitOfWork.UserCSPDetail.Find(d => d.CSPCode == tblUser.UserName).FirstOrDefault();
                    if (ResetPasswordViewModel.IsPasswordResetWithPan == "Yes")
                    {
                        tblUser.Password = CSPData.PAN;

                    }
                    else
                    {
                        tblUser.Password = ResetPasswordViewModel.NewPassword;

                    }
                    tblUser.IsPasswordReset = true;
                    tblUser.UpdatedDate = DateTime.Now;
                    unitOfWork.Userss.Update(tblUser);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public void ResetCSPPasswordLogic(ResetPasswordViewModel ResetPasswordViewModel)
        {
            try
            {
                using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
                {
                    var tblUser = unitOfWork.Userss.Find(x => x.UserName == ResetPasswordViewModel.UserName).FirstOrDefault();
                    tblUser.Password = ResetPasswordViewModel.NewPassword;
                    tblUser.IsPasswordReset = true;
                    tblUser.UpdatedDate = DateTime.Now;
                    unitOfWork.Userss.Update(tblUser);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public long InsertUserCSPDetails(UserCSPDetail UserCSPDetail)
        {
            try
            {
                using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
                {
                    tblUserCSPDetail tblUserCSPDetail = new tblUserCSPDetail();
                    tblUserCSPDetail.CSPName = UserCSPDetail.CSPName;
                    tblUserCSPDetail.CSPCode = UserCSPDetail.CSPCode;
                    tblUserCSPDetail.BranchCode = UserCSPDetail.BranchCode;
                    tblUserCSPDetail.BankName = UserCSPDetail.BankName;
                    tblUserCSPDetail.BankAccount = UserCSPDetail.BankAccount;
                    tblUserCSPDetail.IFSC = UserCSPDetail.IFSC;
                    tblUserCSPDetail.CertificateStatus = UserCSPDetail.CertificateStatus;
                    tblUserCSPDetail.Status = UserCSPDetail.Status;
                    tblUserCSPDetail.FatherName = UserCSPDetail.FatherName;
                    tblUserCSPDetail.MotherName = UserCSPDetail.MotherName;
                    tblUserCSPDetail.Country = UserCSPDetail.Country;
                    tblUserCSPDetail.State = UserCSPDetail.State;
                    tblUserCSPDetail.City = UserCSPDetail.City;
                    tblUserCSPDetail.PAN = UserCSPDetail.PAN;
                    tblUserCSPDetail.VoterId = UserCSPDetail.VoterId;
                    tblUserCSPDetail.AadharNo = UserCSPDetail.AadharNo;
                    tblUserCSPDetail.Education = UserCSPDetail.Education;
                    tblUserCSPDetail.Email = UserCSPDetail.Email;
                    tblUserCSPDetail.Mobile = UserCSPDetail.Mobile;
                    tblUserCSPDetail.EmergencyContactNumber = UserCSPDetail.EmergencyContactNumber;
                    tblUserCSPDetail.ExpiryDate = Convert.ToDateTime(UserCSPDetail.ExpiryDate);
                    tblUserCSPDetail.PassportSizePhoto = UserCSPDetail.PassportSizePhoto != null
                                ? Path.GetFileName(UserCSPDetail.PassportSizePhoto.FileName).ToString() : null;
                    tblUserCSPDetail.VoterIdImage = UserCSPDetail.VoterIdImage != null
                                ? Path.GetFileName(UserCSPDetail.VoterIdImage.FileName).ToString() : null;
                    tblUserCSPDetail.PANImage = UserCSPDetail.PANImage != null
                                ? Path.GetFileName(UserCSPDetail.PANImage.FileName).ToString() : null;
                    tblUserCSPDetail.AadharImage = UserCSPDetail.AadharImage != null
                               ? Path.GetFileName(UserCSPDetail.AadharImage.FileName).ToString() : null;
                    tblUserCSPDetail.LatestEducationProofImage = UserCSPDetail.LatestEducationProofImage != null
                               ? Path.GetFileName(UserCSPDetail.LatestEducationProofImage.FileName).ToString() : null;
                    tblUserCSPDetail.IIBFCertificationImage = UserCSPDetail.IIBFCertificationImage != null
                             ? Path.GetFileName(UserCSPDetail.IIBFCertificationImage.FileName).ToString() : null;

                    tblUserCSPDetail.CreatedDate = DateTime.Now;
                    tblUserCSPDetail.UpdatedDate = DateTime.Now;
                    tblUserCSPDetail.CreatedBy = 0;
                    unitOfWork.AddCSPDetail.Add(tblUserCSPDetail);
                    long id = tblUserCSPDetail.CSPId;  //gives the newly generated 
                    return id;
                }
            }

            catch (Exception)
            {
                return 0;
            }

        }

        public tblUser GetUsersInfoByUserSourceId(int userType, int userId)
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                var usersList = unitOfWork.Userss.Find(x => x.UserType == userType && x.UserId == userId).SingleOrDefault();
                return usersList;
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

        //public void AddDepositDetails(Deposit deposit, int UserId)//Added by Aditya
        //{
        //    try
        //    {
        //        using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
        //        {
        //            tblDepositRequest objDeposit = new tblDepositRequest();
        //            objDeposit.DepositeRequestId = Convert.ToInt64(deposit.Receipt);
        //            objDeposit.Amount = deposit.Amount;
        //            objDeposit.RaisedBy = UserId;
        //            objDeposit.RequestedDate = DateTime.Now;
        //           objDeposit.ReceiptSource = deposit.FileName;
        //            objDeposit.CreatedBy = UserId;
        //            objDeposit.CreatedDate = DateTime.Now;
        //            objDeposit.Status = 0;
        //            objDeposit.ResolutionDetail = "test";
        //            objDeposit.CompletionDate = DateTime.Now;
        //            objDeposit.UpdatedDate = DateTime.Now;
        //            unitOfWork.DepositRequests.Add(objDeposit);


        //        }
        //    }
        //    catch (DbEntityValidationException e)
        //    {
        //        foreach (var eve in e.EntityValidationErrors)
        //        {
        //            Console.WriteLine("Entity of type \"{0}\" in state \"{1}\" has the following validation errors:",
        //                eve.Entry.Entity.GetType().Name, eve.Entry.State);
        //            foreach (var ve in eve.ValidationErrors)
        //            {
        //                Console.WriteLine("- Property: \"{0}\", Error: \"{1}\"",
        //                    ve.PropertyName, ve.ErrorMessage);
        //            }
        //        }
        //        throw;
        //    }
        //}

        //public void AddWithdrawDetails(Withdraw withdraw, int UserId)//Added by Aditya
        //{
        //    try
        //    {
        //        using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
        //        {
        //            tblWithdrawalRequest objWithdraw = new tblWithdrawalRequest();
        //            objWithdraw.WithdrawalRequestId = Convert.ToInt64(withdraw.WStatus);
        //            objWithdraw.Amount = withdraw.WAmount;
        //            objWithdraw.RaisedBy = UserId;
        //            objWithdraw.RequestedDate = DateTime.Now;
        //            objWithdraw.CreatedBy = UserId;
        //            objWithdraw.CreatedDate = DateTime.Now;
        //            objWithdraw.Status = 0;
        //            objWithdraw.ResolutionDetail = "test";
        //            objWithdraw.CompletionDate = DateTime.Now;
        //            objWithdraw.UpdatedDate = DateTime.Now;
        //            objWithdraw.Account = withdraw.AccDetails;
        //            unitOfWork.WithdrawRequests.Add(objWithdraw);
        //        }
        //    }
        //    catch (DbEntityValidationException e)
        //    {
        //        foreach (var eve in e.EntityValidationErrors)
        //        {
        //            Console.WriteLine("Entity of type \"{0}\" in state \"{1}\" has the following validation errors:",
        //                eve.Entry.Entity.GetType().Name, eve.Entry.State);
        //            foreach (var ve in eve.ValidationErrors)
        //            {
        //                Console.WriteLine("- Property: \"{0}\", Error: \"{1}\"",
        //                    ve.PropertyName, ve.ErrorMessage);
        //            }
        //        }
        //        throw;
        //    }
        //}

        public long InsertUserDetail(Userinput userinput)
        {
            try
            {
                using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
                {
                    tblUserDetail tblUser = new tblUserDetail();
                    tblUser.Name = userinput.Name;
                    tblUser.FatherName = userinput.FatherName;
                    tblUser.MotherName = userinput.MotherName;
                    tblUser.EmailId = userinput.EmailId;
                    tblUser.MobileNumber = userinput.MobileNumber;
                    tblUser.StateId = userinput.State;
                    tblUser.CityId = userinput.City;
                    tblUser.Address = userinput.Address;
                    tblUser.EmergencyContactNumber = userinput.EmergencyContactNumber;
                    tblUser.DepartmentId = Convert.ToInt32(userinput.Department);
                    tblUser.DesignationId = Convert.ToInt32(userinput.Designation);
                    tblUser.Qualification = userinput.Qualification;

                    tblUser.ProfilePicSource = userinput.PassportSizePhoto != null
                                ? Path.GetFileName(userinput.PassportSizePhoto.FileName).ToString() : null;
                    tblUser.CreatedDate = DateTime.Now;
                    //tblUser.UpdatedDate = DateTime.Now;
                    tblUser.CreaterdBy = (int)HttpContext.Current.Session["UserId"];
                    tblUser.UpdatedBy = 0;
                    tblUser.RoleName = userinput.RoleName;
                    unitOfWork.UserDetail.Add(tblUser);
                    long id = tblUser.UserDetailId;  //gives the newly generated 

                    //Insert User Login data
                    tblUser objtblUser = new tblUser();
                    objtblUser.UserName = userinput.EmailId;
                    objtblUser.Password = "eConnect@" + userinput.MobileNumber;
                    objtblUser.UserSourceId = (int?)id;
                    objtblUser.UserType = userinput.UserType;// 4;

                    objtblUser.Status = 1;
                    unitOfWork.Userss.Add(objtblUser);
                    int Userid = objtblUser.UserId;

                    var tblUserDetail = unitOfWork.UserDetail.Find(x => x.UserDetailId == id).FirstOrDefault();
                    tblUserDetail.UserId = Userid;
                    unitOfWork.UserDetail.Update(tblUserDetail);
                    return id;
                }
            }

            catch (Exception ex)
            {
                return 0;
            }
        }

        public void UpdateUserDetail(Userinput UserDetail)
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                var tblUserDetail = unitOfWork.UserDetail.Find(x => x.UserDetailId == UserDetail.Id).FirstOrDefault();

                tblUserDetail.Name = UserDetail.Name;
                tblUserDetail.FatherName = UserDetail.FatherName;
                tblUserDetail.MotherName = UserDetail.MotherName;
                tblUserDetail.EmailId = UserDetail.EmailId;
                tblUserDetail.MobileNumber = UserDetail.MobileNumber;
                tblUserDetail.CityId = UserDetail.City;
                tblUserDetail.StateId = UserDetail.State;
                tblUserDetail.Address = UserDetail.Address;
                tblUserDetail.EmergencyContactNumber = UserDetail.EmergencyContactNumber;
                tblUserDetail.DepartmentId = Convert.ToInt32(UserDetail.Department);
                tblUserDetail.DesignationId = Convert.ToInt32(UserDetail.Designation);
                tblUserDetail.Qualification = UserDetail.Qualification;
                tblUserDetail.RoleName = UserDetail.RoleName;
                tblUserDetail.ProfilePicSource = UserDetail.PassportSizePhoto != null
                            ? Path.GetFileName(UserDetail.PassportSizePhoto.FileName).ToString() : UserDetail.PassportSizePic;
                //tblUserDetail.CreatedDate = DateTime.Now;
                tblUserDetail.UpdatedDate = DateTime.Now;
                //tblUserDetail.CreaterdBy = 0;
                //tblUserDetail.UpdatedBy = 0;
                tblUserDetail.UpdatedBy = (int)HttpContext.Current.Session["UserId"];
                unitOfWork.UserDetail.Update(tblUserDetail);
            }
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                if (UserDetail.UserId > 0)
                {
                    var tblUser = unitOfWork.Userss.Find(x => x.UserId == UserDetail.UserId).FirstOrDefault();
                    {
                        tblUser.UserId = UserDetail.UserId;
                        tblUser.UserType = UserDetail.UserType;
                        tblUser.UpdatedDate = DateTime.Now;
                        unitOfWork.Userss.Update(tblUser);

                    }
                }
            }
            //unitOfWork.UserCSPDetail.Save();


        }

        public Userinput GetUserDetailsById(int id)
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                Userinput UserDetail = new Userinput();
                var tblUserDetail = unitOfWork.UserCSPDetail.GetUserDetailByID(id);

                UserDetail.Name = tblUserDetail.Name;
                UserDetail.FatherName = tblUserDetail.FatherName;
                UserDetail.MotherName = tblUserDetail.MotherName;
                UserDetail.EmailId = tblUserDetail.EmailId;
                UserDetail.MobileNumber = tblUserDetail.MobileNumber;
                UserDetail.City = Convert.ToInt32(tblUserDetail.CityId);
                UserDetail.Address = tblUserDetail.Address;
                UserDetail.EmergencyContactNumber = tblUserDetail.EmergencyContactNumber;
                UserDetail.Department = tblUserDetail.DepartmentId.ToString();
                UserDetail.Designation = tblUserDetail.DesignationId.ToString();
                UserDetail.Qualification = tblUserDetail.Qualification;
                UserDetail.PassportSizePic = tblUserDetail.ProfilePicSource;
                return UserDetail;

            }
        }

        public void DeleteUserDetail(int id)
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                unitOfWork.UserCSPDetail.DeleteuserDetail(id);
                unitOfWork.UserCSPDetail.Save();

            }
        }

        public IList<tblUserDetail> GetAllUserDetail()
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                return unitOfWork.UserCSPDetail.GetAllUserDetail().ToList();
            }
        }

        public IList<tblUserDetail> GetAllUserDetailSearch(string Name, string Qualification, string Designation, string Country, string State, string City, string Role)
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                var result = unitOfWork.UserCSPDetail.GetAllUserDetail().ToList();
                if (!string.IsNullOrEmpty(Name))
                {
                    result = result.Where(d => d.Name == Name).ToList();
                }
                if (!string.IsNullOrEmpty(Qualification))
                {
                    result = result.Where(d => d.Qualification.Contains(Qualification)).ToList();
                }
                if (!string.IsNullOrEmpty(Designation))
                {

                    result = result.Where(d => d.DesignationId == Convert.ToInt32(Designation)).ToList();
                }
                if (!string.IsNullOrEmpty(City))
                {
                    result = result.Where(d => d.CityId == Convert.ToInt32(City)).ToList();
                }
                if (!string.IsNullOrEmpty(State))
                {
                    result = result.Where(d => d.StateId == Convert.ToInt32(State)).ToList();
                }
                if (!string.IsNullOrEmpty(Role))
                {
                    result = result.Where(d => d.RoleName == Role).ToList();
                }
                return result;
            }
        }

        public Userinput GetUserDetailByID(int id)
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                Userinput UserDetail = new Userinput();
                var tblUserDetail = unitOfWork.UserCSPDetail.GetUserDetailByID(id);

                UserDetail.Name = tblUserDetail.Name;
                UserDetail.FatherName = tblUserDetail.FatherName;
                UserDetail.MotherName = tblUserDetail.MotherName;
                UserDetail.EmailId = tblUserDetail.EmailId;
                UserDetail.MobileNumber = tblUserDetail.MobileNumber;
                UserDetail.City = Convert.ToInt32(tblUserDetail.CityId);
                UserDetail.Address = tblUserDetail.Address;
                UserDetail.EmergencyContactNumber = tblUserDetail.EmergencyContactNumber;
                UserDetail.Department = tblUserDetail.DepartmentId.ToString();
                UserDetail.Designation = tblUserDetail.DesignationId.ToString();
                UserDetail.RoleName  = tblUserDetail.RoleName.ToString();
                UserDetail.Qualification = tblUserDetail.Qualification;
                UserDetail.PassportSizePic = tblUserDetail.ProfilePicSource;
                UserDetail.Id = tblUserDetail.UserDetailId;
                if (tblUserDetail.UserId > 0)
                    UserDetail.UserId = (int)tblUserDetail.UserId;

                if (tblUserDetail.StateId != null)
                {
                    UserDetail.State = Convert.ToInt32(tblUserDetail.StateId);
                }
                return UserDetail;

            }
        }

        public int EmailValidationforUser(string Eid)
        {
            int UserId = 0;
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                var tblUser = unitOfWork.Userss.Find(x => x.UserName.Contains(Eid) && x.UserType == 4).FirstOrDefault();
                if (tblUser != null)
                {
                    UserId = tblUser.UserId;
                }


            }
            return UserId;
        }

    }
}

