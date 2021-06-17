using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eConnect.Model
{
    public class TechSupportProblemModel
    {
        public int TechProblemTypeID { get; set; }
        public int TechProblemID { get; set; }
        public string TechProblemName { get; set; }
        public bool InActive { get; set; }
    }
    public class TechSupportRequestModel
    {
        public long TechSupportReqID { get; set; }
        public Nullable<int> ProblemType { get; set; }
        public string Description { get; set; }
        public string Summary { get; set; }
        public string Screenshot { get; set; }
        public string MobileNo { get; set; }
        public string DeskDetail { get; set; }
        public long UserID { get; set; }
        public string UserName { get; set; }
        public string TechProbName { get; set; }
        public DateTime RequestedDate { get; set; }
        public Nullable<int> Status { get; set; }
        public Nullable<int> RaisedBy { get; set; }
        public string RaisedByName { get; set; }
        public string RequestDate { get; set; }
        public string StatusName { get; set; }
        public int ResolutionProvidedBy { get; set; }
        public string ResolutionDetailx { get; set; }

        public string ResolutionDetail { get; set; }
    }
}
