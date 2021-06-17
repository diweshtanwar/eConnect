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
        public Nullable<int> ReportType { get; set; }
        public Nullable<int> Month { get; set; }
        public Nullable<int> Year { get; set; }
        public string FileName { get; set; }
        public string FileSource { get; set; }
        public Nullable<decimal> ApplyTDS { get; set; }
        public Nullable<System.DateTime> CreatedDate { get; set; }
        public Nullable<int> CreatedBy { get; set; }
        public System.DateTime UpdatedDate { get; set; }
        public Nullable<int> UpdatedBy { get; set; }
        public string ReportTypeName { get; set; }
        public string MonthName { get; set; }
        public HttpPostedFileBase fileupload { get; set; }
    }
}
