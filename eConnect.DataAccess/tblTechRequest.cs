//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace eConnect.DataAccess
{
    using System;
    using System.Collections.Generic;
    
    public partial class tblTechRequest
    {
        public long TechRequestId { get; set; }
        public string Summary { get; set; }
        public Nullable<int> ProblemType { get; set; }
        public string Description { get; set; }
        public string MobileNo { get; set; }
        public Nullable<int> RaisedBy { get; set; }
        public Nullable<byte> Status { get; set; }
        public Nullable<System.DateTime> RequestedDate { get; set; }
        public Nullable<System.DateTime> CompletionDate { get; set; }
        public Nullable<int> ResolutionProvidedBy { get; set; }
        public string ResolutionDetail { get; set; }
        public string Attachment { get; set; }
        public string AttachmentSource { get; set; }
        public Nullable<System.DateTime> CreatedDate { get; set; }
        public Nullable<int> UpdatedBy { get; set; }
        public Nullable<System.DateTime> UpdatedDate { get; set; }
        public Nullable<int> CreatedBy { get; set; }
    
        public virtual tblCSPDetail tblCSPDetail { get; set; }
        public virtual tblProblemType tblProblemType { get; set; }
        public virtual tblStatusold tblStatusold { get; set; }
        public virtual tblUser tblUser { get; set; }
        public virtual tblUser tblUser1 { get; set; }
        public virtual tblUser tblUser2 { get; set; }
    }
}
