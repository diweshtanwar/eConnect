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
    
    public partial class tblMailConfiguration
    {
        public byte Id { get; set; }
        public Nullable<bool> IsNeedToSendMail { get; set; }
        public string SmtpAddress { get; set; }
        public string PortNumber { get; set; }
        public Nullable<bool> EnableSSL { get; set; }
        public string EmailFromAddress { get; set; }
        public string Password { get; set; }
        public string EmailToAddress { get; set; }
        public string EmailBccAddress { get; set; }
        public string Subject { get; set; }
        public string Body { get; set; }
        public Nullable<bool> IsBodyHtml { get; set; }
        public Nullable<bool> IsNeedToSendAttachments { get; set; }
        public string AttachmentsPath { get; set; }
        public string CreatedBy { get; set; }
        public Nullable<System.DateTime> CreatedDate { get; set; }
        public string UpdatedBy { get; set; }
        public Nullable<System.DateTime> UpdatedDate { get; set; }
        public Nullable<bool> Status { get; set; }
    }
}
