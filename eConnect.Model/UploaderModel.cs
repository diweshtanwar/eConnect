using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace eConnect.Model
{
    public class UploaderModel
    {
        public int UploaderId { get; set; }
        [Required]
        
        public int ReportType { get; set; }
        [Required]
        public int Month { get; set; }
        [Required]
        public int Year { get; set; }
        public string FileName { get; set; }
        public string FileSource { get; set; }
        public Nullable<decimal> ApplyTDS { get; set; }
        public Nullable<System.DateTime> CreatedDate { get; set; }
        public Nullable<int> CreatedBy { get; set; }
        public System.DateTime UpdatedDate { get; set; }
        public Nullable<int> UpdatedBy { get; set; }
        public string ReportTypeName { get; set; }
        public int StatusId { get; set; }
        public string ReportStatus { get; set; }
        public string MonthName { get; set; }
        [Required]
        public HttpPostedFileBase fileupload { get; set; }

        public bool InActive { get; set; }

        public int UnPublishedCount { get; set; }
    }
}