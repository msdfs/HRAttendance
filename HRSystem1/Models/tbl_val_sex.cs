//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace HRSystem1.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class tbl_val_sex
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tbl_val_sex()
        {
            this.HR_tbl_Employee = new HashSet<HR_tbl_Employee>();
        }
    
        public int sid { get; set; }
        public string sex { get; set; }
        public string description { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<HR_tbl_Employee> HR_tbl_Employee { get; set; }
        public virtual tbl_val_sex tbl_val_sex1 { get; set; }
        public virtual tbl_val_sex tbl_val_sex2 { get; set; }
    }
}
