using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace eConnect.Model
{
  public class GalleryCategoryModel
    {
        public byte Id { get; set; }
        public string CategoryTittle { get; set; }
        public string CategoryImagesPath { get; set; }
        public Nullable<int> Priority { get; set; }
        public string CreatedBy { get; set; }
        public Nullable<System.DateTime> CreatedDate { get; set; }
        public string UpdatedBy { get; set; }
        public Nullable<System.DateTime> UpdatedDate { get; set; }
        public bool Status { get; set; }
        public string CategoryStatus { get; set; }
        public HttpPostedFileBase CategoryImage { get; set; }
        public string CategoryImageName { get; set; }
     
    }
}
