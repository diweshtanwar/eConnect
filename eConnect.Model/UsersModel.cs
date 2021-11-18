using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;
using System.Web;
using System.Web.Mvc;

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
        public int Id { get; set; }
        [Required(ErrorMessage = "Name is required.")]
        public string Name { get; set; }
        [Required(ErrorMessage = "FatherName is required.")]
        public string FatherName { get; set; }
        [Required(ErrorMessage = "MotherName is required.")]
        public string MotherName { get; set; }
        [Required(ErrorMessage = "Email is required.")]
        //[DataType(DataType.EmailAddress)]
        [RegularExpression(@"^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$", ErrorMessage = "Please enter a valid e-mail adress")]
        public string EmailId { get; set; }
        [Required(ErrorMessage = "MobileNumber is required.")]
        //[Remote("EmailExists", "User", HttpMethod = "POST", ErrorMessage = "Email address already registered.")]
        [RegularExpression(@"^([0-9]{10})$", ErrorMessage = "Invalid Mobile Number.")]
        //[MaxLength(10)]
        public string MobileNumber { get; set; }
        [Required(ErrorMessage = "Address is required.")]
        public string Address { get; set; }
        [Required(ErrorMessage = "EmergencyContactNumber is required.")]
        [RegularExpression(@"^([0-9]{10})$", ErrorMessage = "Invalid EmergencyContact Number.")]
        //[MaxLength(10)]
        public string EmergencyContactNumber { get; set; }
        [Required(ErrorMessage = "Department is required.")]
        public string Department { get; set; }
        [Required(ErrorMessage = "Designation is required.")]
        public string Designation { get; set; }
        [Required(ErrorMessage = "Qualification is required..")]
        public string Qualification { get; set; }
        [Required(ErrorMessage = "City is required..")]
        public int City { get; set; }
        [Required(ErrorMessage = "Country is required..")]
        public int Country { get; set; }
        [Required(ErrorMessage = "State is required..")]
        public int State { get; set; }
        //public HttpPostedFileBase PassportSizePhoto { get; set; }
        //public string PassportSizePhoto { get; set; }
        [Required(ErrorMessage = "PassportSizePhoto is required..")]
        public HttpPostedFileBase PassportSizePhoto { get; set; }
        //public HttpPostedFileBase PassportSizePhotoforedit { get; set; }
        public string PassportSizePic { get; set; }

        [Display(Name = "Role")]
        [Required(ErrorMessage = "User Role is required..")]
        public int UserType { get; set; }

        public int UserId { get; set; }
    }


    public class Login
    {
        [Required]
        public string UserName { get; set; }

        [Required]
        [StringLength(100, ErrorMessage = "The {0} must be at least {2} characters long.", MinimumLength = 6)]
        [DataType(DataType.Password)]
        [Display(Name = "Password")]
        public string Password { get; set; }

    }

    public class ResetPasswordViewModel
    {

        public Nullable<int> UserType { get; set; }
        public long UserID { get; set; }
        public string UserName { get; set; }
        public string CSPName { get; set; }

        [Required]
        [DataType(DataType.Password)]
        [StringLength(100, ErrorMessage = "The {0} must be at least {2} characters long.", MinimumLength = 6)]
        [Display(Name = " New Password")]
        public string NewPassword { get; set; }


        [DataType(DataType.Password)]
        [Display(Name = "Confirm password")]
        [System.ComponentModel.DataAnnotations.Compare("NewPassword", ErrorMessage = "The password and confirmation password do not match.")]
        public string ConfirmPassword { get; set; }

        public string IsPasswordResetWithPan { get; set; }

    }
    public class UsersLoginDetailsModel
    {

    }

}
