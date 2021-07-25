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
    public class RaiseRequest
    {
    }

    public class Deposit
    {
        [Required(ErrorMessage = "RequestType is required.")]
        public int RequestType { get; set; }
        [Required(ErrorMessage = "Amount is required.")]
        public int Amount { get; set; }
        [Required(ErrorMessage = "Reciept is required.")]
        public HttpPostedFileBase Reciept { get; set; }
        [Required(ErrorMessage = "Status is required.")]
        public int Status { get; set; }
        public int Id { get; set; }
        public string Recieptpic { get; set; }
        public int RequestTypes { get; set; }
    }
    public class Withdraw
    {
       
            [Required(ErrorMessage = "RequestType is required.")]
            public int RequestType { get; set; }
            [Required(ErrorMessage = "Amount is required.")]
            public int Amount { get; set; }

            [Required(ErrorMessage = "Status is required.")]
            public int Status { get; set; }
            public int Id { get; set; }
            [Required(ErrorMessage = "Account is required.")]
            public Int64 Account { get; set; }

             public int RequestTypes { get; set; }

    }

    public class TechSupportRequest
    {
        public int ID { get; set; }
        [Required(ErrorMessage = "TechProblemType is required.")]
        public int TechProblemType { get; set; }
        [Required(ErrorMessage = "Description is required.")]
        public string Description { get; set; }
        [Required(ErrorMessage = "Screenshot is required.")]
        public HttpPostedFileBase Screenshot { get; set; }
        [Required(ErrorMessage = "PhoneNumber is required.")]
        [RegularExpression(@"^([0-9]{10})$", ErrorMessage = "Invalid Phone Number.")]
        public string PhoneNumber { get; set; }
        [Required(ErrorMessage = "AnyDeskDetail is required.")]
        public string AnyDeskDetail { get; set; }
        [Required(ErrorMessage = "Status is required.")]
        public int Status { get; set; }
        public string Screenpic { get; set; }


    }

}
