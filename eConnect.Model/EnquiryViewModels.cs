using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace eConnect.Model
{
    public class EnquiryViewModels
    {
        [Required(ErrorMessage = "Please provide name!")]
        public string NewName { get; set; }
        [Required(ErrorMessage = "Please provide email!")]
        [DataType(DataType.EmailAddress, ErrorMessage = "Please provide valid email!")]
        public string NewEmail { get; set; }
        [Required(ErrorMessage = "Please provide Mobile!")]
        [RegularExpression(@"^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$",
                    ErrorMessage = "Entered mobile format is not valid.")]
        public string NewMobile { get; set; }
        [Required(ErrorMessage = "Please provide message!")]
        public string NewMessage { get; set; }
    }
}