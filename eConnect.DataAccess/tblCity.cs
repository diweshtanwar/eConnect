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
    
    public partial class tblCity
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tblCity()
        {
            this.tblUserCSPDetails = new HashSet<tblUserCSPDetail>();
            this.tblUserDetails = new HashSet<tblUserDetail>();
        }
    
        public int CityId { get; set; }
        public string Name { get; set; }
        public string Code { get; set; }
        public Nullable<int> StateId { get; set; }
        public Nullable<bool> Status { get; set; }
    
        public virtual tblState tblState { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tblUserCSPDetail> tblUserCSPDetails { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tblUserDetail> tblUserDetails { get; set; }
    }
}
