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
    
    public partial class HR_ContactType
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public HR_ContactType()
        {
            this.HR_EmployeeContact = new HashSet<HR_EmployeeContact>();
        }
    
        public int ContactTypeID { get; set; }
        public string ContactTypeName { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<HR_EmployeeContact> HR_EmployeeContact { get; set; }
    }
}
