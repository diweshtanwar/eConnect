using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace eConnect.Model
{
  public  class UserCSPDetail
    {
        public int CSPId { get; set; }
        public string CSPName { get; set; }
        public string CSPCode { get; set; }
        public string BranchCode { get; set; }
        public Nullable<System.DateTime> ExpiryDate { get; set; }
        public string BankName { get; set; }
        public string BankAccount { get; set; }
        public string IFSC { get; set; }
        public string CertificateStatus { get; set; }
        public Nullable<byte> Status { get; set; }
        public string FatherName { get; set; }
        public string MotherName { get; set; }
        public Nullable<int> Country { get; set; }
        public Nullable<int> State { get; set; }
        public Nullable<int> City { get; set; }
        public string PAN { get; set; }
        public string VoterId { get; set; }
        public string AadharNo { get; set; }
        public string Education { get; set; }
        public string Email { get; set; }
        public string Mobile { get; set; }
        public string EmergencyContactNumber { get; set; }
        public HttpPostedFileBase PassportSizePhoto { get; set; }
        public string PassportSizePhotoName { get; set; }
        public HttpPostedFileBase VoterIdImage { get; set; }
        public string VoterIdImageName { get; set; }
        public HttpPostedFileBase PANImage { get; set; }
        public string PANImageName { get; set; }
        public HttpPostedFileBase AadharImage { get; set; }
        public string AadharImageName { get; set; }
        public HttpPostedFileBase LatestEducationProofImage { get; set; }
        public string LatestEducationProofImageName { get; set; }
        public HttpPostedFileBase IIBFCertificationImage { get; set; }
        public string IIBFCertificationImageName { get; set; }
        public Nullable<System.DateTime> CreatedDate { get; set; }
        public Nullable<int> CreatedBy { get; set; }
        public Nullable<System.DateTime> UpdatedDate { get; set; }
        public Nullable<int> UpdatedBy { get; set; }
    }
}
