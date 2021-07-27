using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;

namespace eConnect.Model
{
  public  class UserCSPDetail
    {
       
        public int CSPId { get; set; }
        [Required]
        public string CSPName { get; set; }
        [Required]

        //[Remote("IsCSPCodeExist", "CSPCode", AdditionalFields = "id",
        //        ErrorMessage = "CSP Code already exists")]
        public string CSPCode { get; set; }
        [Required]
        public string BranchCode { get; set; }
        [Required]

        //[DataType(DataType.Date)]
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:MM-dd-yyyy}")]
        public Nullable<System.DateTime> ExpiryDate { get; set; }
        [Required]
        public string BankName { get; set; }
        [Required]
        [Range(0, int.MaxValue, ErrorMessage = "Please enter valid number only.")]
        public string BankAccount { get; set; }
        [Required]
        public string IFSC { get; set; }
        [Required]
        public string CertificateStatus { get; set; }
        [Required]
        public Nullable<int> Status { get; set; }
        [Required]
        public string FatherName { get; set; }
        [Required]
        public string MotherName { get; set; }
        [Required]
        public Nullable<int> Country { get; set; }
        [Required]
        public Nullable<int> State { get; set; }
        [Required]
        public Nullable<int> City { get; set; }
        [Required]
        public string Location { get; set; }
        [Required]
        public string Category { get; set; }
        [Required]
        public string PAN { get; set; }
        [Required]
        public string VoterId { get; set; }
        [Required]
        public string AadharNo { get; set; }
        [Required]
        public string Education { get; set; }
        [Required]
        [DataType(DataType.EmailAddress)]
        public string Email { get; set; }
        [Required]
        [DataType(DataType.PhoneNumber)]
        public string Mobile { get; set; }
        [Required]
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
