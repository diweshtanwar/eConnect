using eConnect.DataAccess;
using eConnect.Model;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace eConnect.Logic
{
  public  class UserCSPDetailLogic
    {
        public IList<tblUserCSPDetail> GetAllUserCSPDetail()
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                return unitOfWork.UserCSPDetail.GetAllUserCSPDetail().ToList();

            }
        }

        public IList<tblUserCSPDetail> GetAllUserCSPDetailSearch(string CSPCode, string CSPName, string BranchCode, byte? Status, string CertificateStatus)
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                var result = unitOfWork.UserCSPDetail.GetAllUserCSPDetail().ToList();

                if (Status != null)
                {
                    result = result.Where(d => d.Status == Status).ToList();
                }
                if (!string.IsNullOrEmpty(CSPCode))
                {
                    result = result.Where(d => d.CSPCode.Contains(CSPCode)).ToList();
                }
                if (!string.IsNullOrEmpty(CSPName))
                {
                    result = result.Where(d => d.CSPName.Contains(CSPName)).ToList();
                }
                if (!string.IsNullOrEmpty(BranchCode))
                {
                    result = result.Where(d => d.BranchCode.Contains(BranchCode)).ToList();
                }
                if (!string.IsNullOrEmpty(CertificateStatus))
                {
                    result = result.Where(d => d.CertificateStatus.Contains(CertificateStatus)).ToList();
                }

                return result;
            }
        }
        public UserCSPDetail GetUserCSPDetailByID(int id)
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                UserCSPDetail UserCSPDetail = new UserCSPDetail();
                var tblUserCSPDetail = unitOfWork.UserCSPDetail.GetUserCSPDetailByID(id);
                UserCSPDetail.CSPId = tblUserCSPDetail.CSPId;
                UserCSPDetail.CSPName = tblUserCSPDetail.CSPName;
                UserCSPDetail.CSPCode = tblUserCSPDetail.CSPCode;
                UserCSPDetail.BranchCode = tblUserCSPDetail.BranchCode;
                UserCSPDetail.BankName = tblUserCSPDetail.BankName;
                UserCSPDetail.BankAccount = tblUserCSPDetail.BankAccount;
                UserCSPDetail.IFSC = tblUserCSPDetail.IFSC;
                UserCSPDetail.CertificateStatus = tblUserCSPDetail.CertificateStatus;
                UserCSPDetail.Status = tblUserCSPDetail.Status;
                UserCSPDetail.FatherName = tblUserCSPDetail.FatherName;
                UserCSPDetail.MotherName = tblUserCSPDetail.MotherName;
                UserCSPDetail.Country = tblUserCSPDetail.Country;
                UserCSPDetail.State = tblUserCSPDetail.State;
                UserCSPDetail.City = tblUserCSPDetail.City;
                UserCSPDetail.PAN = tblUserCSPDetail.PAN;
                UserCSPDetail.VoterId = tblUserCSPDetail.VoterId;
                UserCSPDetail.AadharNo = tblUserCSPDetail.AadharNo;
                UserCSPDetail.Education = tblUserCSPDetail.Education;
                UserCSPDetail.Email = tblUserCSPDetail.Email;
                UserCSPDetail.Mobile = tblUserCSPDetail.Mobile;
                UserCSPDetail.EmergencyContactNumber = tblUserCSPDetail.EmergencyContactNumber;
                UserCSPDetail.ExpiryDate = tblUserCSPDetail.ExpiryDate;
                UserCSPDetail.PassportSizePhotoName = tblUserCSPDetail.PassportSizePhoto;
                UserCSPDetail.VoterIdImageName = tblUserCSPDetail.VoterIdImage;
                UserCSPDetail.PANImageName = tblUserCSPDetail.PANImage;
                UserCSPDetail.AadharImageName = tblUserCSPDetail.AadharImage;
                UserCSPDetail.LatestEducationProofImageName = tblUserCSPDetail.LatestEducationProofImage;
                UserCSPDetail.IIBFCertificationImageName = tblUserCSPDetail.IIBFCertificationImage;
                UserCSPDetail.UpdatedDate = tblUserCSPDetail.UpdatedDate;
                UserCSPDetail.UpdatedBy = tblUserCSPDetail.UpdatedBy;             
                return UserCSPDetail;

            }
        }

        public long InsertUserCSPDetail(UserCSPDetail UserCSPDetail)
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

                    //Insert User Login data
                    tblUser tblUser = new tblUser();
                    tblUser.UserName = UserCSPDetail.CSPCode;
                    tblUser.Password = "eConnect@" + UserCSPDetail.CSPCode;
                    tblUser.UserSourceId = (int?)id;
                    tblUser.UserType = 3;
                    tblUser.Status = 1;
                    unitOfWork.Userss.Add(tblUser);
                    return id;
                }
            }

            catch (Exception)
            {
                return 0;
            }
        }
        public void UpdateUserCSPDetail(UserCSPDetail UserCSPDetail)
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {               
                var tblUserCSPDetail = unitOfWork.UserCSPDetail.Find(x => x.CSPId == UserCSPDetail.CSPId).FirstOrDefault();
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
                            ? UserCSPDetail.CSPId+"-"+Path.GetFileName(UserCSPDetail.PassportSizePhoto.FileName).ToString() : UserCSPDetail.PassportSizePhotoName;
                tblUserCSPDetail.VoterIdImage = UserCSPDetail.VoterIdImage != null
                            ? UserCSPDetail.CSPId + "-" + Path.GetFileName(UserCSPDetail.VoterIdImage.FileName).ToString() : UserCSPDetail.VoterIdImageName;
                tblUserCSPDetail.PANImage = UserCSPDetail.PANImage != null
                            ? UserCSPDetail.CSPId + "-" + Path.GetFileName(UserCSPDetail.PANImage.FileName).ToString() : UserCSPDetail.PANImageName;
                tblUserCSPDetail.AadharImage = UserCSPDetail.AadharImage != null
                           ? UserCSPDetail.CSPId + "-" + Path.GetFileName(UserCSPDetail.AadharImage.FileName).ToString() : UserCSPDetail.AadharImageName;
                tblUserCSPDetail.LatestEducationProofImage = UserCSPDetail.LatestEducationProofImage != null
                           ? UserCSPDetail.CSPId + "-" + Path.GetFileName(UserCSPDetail.LatestEducationProofImage.FileName).ToString() : UserCSPDetail.LatestEducationProofImageName;
                tblUserCSPDetail.IIBFCertificationImage = UserCSPDetail.IIBFCertificationImage != null
                         ? UserCSPDetail.CSPId + "-" + Path.GetFileName(UserCSPDetail.IIBFCertificationImage.FileName).ToString() : UserCSPDetail.IIBFCertificationImageName;
           
                tblUserCSPDetail.Status = UserCSPDetail.Status;
                tblUserCSPDetail.UpdatedDate = DateTime.Now;
                tblUserCSPDetail.UpdatedBy = (int)HttpContext.Current.Session["UserId"];
                unitOfWork.UserCSPDetail.Update(tblUserCSPDetail);
                unitOfWork.UserCSPDetail.Save();

            }
        }
        public void Save()
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                unitOfWork.ApplicationSettings.Save();

            }
        }
        public void DeleteUserCSPDetail(int id)
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                unitOfWork.UserCSPDetail.DeleteUserCSPDetail(id);
                unitOfWork.UserCSPDetail.Save();

            }
        }
    }
}
