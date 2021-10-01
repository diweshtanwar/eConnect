using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace eConnect.Model
{
  public class DownloadDocumentDetailModel
    {

        public byte Id { get; set; }
        public string DocumentName { get; set; }
        public string Description { get; set; }
        public string DocumentPath { get; set; }
        public Nullable<int> Priority { get; set; }
        public string CreatedBy { get; set; }
        public Nullable<System.DateTime> CreatedDate { get; set; }
        public string UpdatedBy { get; set; }
        public Nullable<System.DateTime> UpdatedDate { get; set; }
        public string DocumentStatus { get; set; }
        public HttpPostedFileBase DocumentImage { get; set; }
        public string DocumentImageName { get; set; }
        public bool Status { get; set; }
    }
}
