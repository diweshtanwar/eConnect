using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;
using System.Web;
namespace eConnect.Model
{
    public class UsersModel
    {
        public long UserID { get; set; }
        //  [Required(ErrorMessage = "Required")]
        [StringLength(50, ErrorMessage = "Max 50 characters")]
        public string CSPName { get; set; }

        [StringLength(50, ErrorMessage = "Max 50 characters")]
        public string FatherName { get; set; }
        [StringLength(50, ErrorMessage = "Max 50 characters")]
        public string MotherName { get; set; }
        //[Required(ErrorMessage = "Required")]

        [StringLength(50, ErrorMessage = "Max 50 characters")]
        public string FirstName { get; set; }
        //[Required(ErrorMessage = "Required")]
        [StringLength(50, ErrorMessage = "Max 50 characters")]
        public string LastName { get; set; }
        // [Required(ErrorMessage = "Required")]
        [StringLength(400, ErrorMessage = "Max 400 characters")]
        public string Address { get; set; }
        //[Required(ErrorMessage = "Required")]
        public Nullable<long> Mobile { get; set; }
        //[Required(ErrorMessage = "Required")]
        [DataType(DataType.EmailAddress)]
        public string EMailID { get; set; }
        [Required(ErrorMessage = "Required")]
        public int StateID { get; set; }
        // [Required(ErrorMessage = "Required")]
        public int CityID { get; set; }
        [Required(ErrorMessage = "Required")]
        public int CountryID { get; set; }
        //  [Required(ErrorMessage = "Required")]
        public Nullable<bool> InActive { get; set; }
        public string Address1 { get; set; }
        //   [Required(ErrorMessage = "Required")]
        [DataType(DataType.EmailAddress)]
        public string Username { get; set; }
        // [Required(ErrorMessage = "Required")]
        public string Password { get; set; }
        public string BranchCode { get; set; }

        public string PANCardNo { get; set; }

        public Nullable<int> Status { get; set; }
        public string PassportPhoto { get; set; }
        //public virtual City City { get; set; }
        //public virtual Country Country { get; set; }
        //public virtual State State { get; set; }
        //public virtual ICollection<Transaction> Transactions { get; set; }
        //public virtual ICollection<UserLoginDetail> UserLoginDetails { get; set; }
        //public virtual ICollection<UserRole> UserRoles { get; set; }
        public string VoterIDNo { get; set; }
        public string AdharCardNo { get; set; }
        public string Education { get; set; }
        public string CSPCode { get; set; }
        public Nullable<DateTime> AccountExpiryDate { get; set; }
        public string BankAccountName { get; set; }
        public string BankName { get; set; }
        public Nullable<int> CertificateStatus { get; set; }
        public HttpPostedFileBase PassportPic { get; set; }
        public HttpPostedFileBase VoterIDPic { get; set; }
        public HttpPostedFileBase PANCardPic { get; set; }
        public HttpPostedFileBase AAdharCardPic { get; set; }
        public HttpPostedFileBase IIBFCertificatePic { get; set; }
        public HttpPostedFileBase FileEducationProof { get; set; }
        public virtual CityModel City { get; set; }
        public string StateName { get; set; }
        public string CityName { get; set; }
        public string CountryName { get; set; }

    }
    public class Userinput
    {
        public string Name { get; set; }
        public string FatherName { get; set; }
        public string MotherName { get; set; }
        public string EmailId { get; set; }
        public string MobileNumber { get; set; }
        public string Address { get; set; }
        public string EmergencyContactNumber { get; set; }
        public string DepartmentId { get; set; }
        public string DesignationId { get; set; }
        public string Qualification { get; set; }
        public int CityID { get; set; }
        public int CountryID { get; set; }
        public int StateID { get; set; }
        public HttpPostedFileBase PassportPic { get; set; }

    }

    public class Login
    {
        [Required]
        public string Username { get; set; }
        [Required]
        public string Password { get; set; }

    }
    public class UsersLoginDetailsModel
    {

    }

}
