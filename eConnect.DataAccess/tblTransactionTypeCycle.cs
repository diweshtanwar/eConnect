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
    
    public partial class tblTransactionTypeCycle
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tblTransactionTypeCycle()
        {
            this.tblCommissionReportTransactionTypeRurals = new HashSet<tblCommissionReportTransactionTypeRural>();
        }
    
        public int CycleID { get; set; }
        public string CycleName { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tblCommissionReportTransactionTypeRural> tblCommissionReportTransactionTypeRurals { get; set; }
    }
}
