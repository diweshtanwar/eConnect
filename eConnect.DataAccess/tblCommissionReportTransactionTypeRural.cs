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
    
    public partial class tblCommissionReportTransactionTypeRural
    {
        public int CommissionReportTransactionTypeId { get; set; }
        public string Name { get; set; }
        public Nullable<decimal> HOCommission { get; set; }
        public Nullable<decimal> CSPCommission { get; set; }
        public Nullable<bool> Status { get; set; }
        public Nullable<int> CycleID { get; set; }
    
        public virtual tblCommissionReportTransactionTypeRural tblCommissionReportTransactionTypeRural1 { get; set; }
        public virtual tblCommissionReportTransactionTypeRural tblCommissionReportTransactionTypeRural2 { get; set; }
        public virtual tblCommissionReportTransactionTypeRural tblCommissionReportTransactionTypeRural11 { get; set; }
        public virtual tblCommissionReportTransactionTypeRural tblCommissionReportTransactionTypeRural3 { get; set; }
        public virtual tblTransactionTypeCycle tblTransactionTypeCycle { get; set; }
    }
}