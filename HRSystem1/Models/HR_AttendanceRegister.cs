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
    
    public partial class HR_AttendanceRegister
    {
        public int AttendanceID { get; set; }
        public int Emp_Id { get; set; }
        public System.DateTime AttendanceDate { get; set; }
        public Nullable<System.DateTime> TimeIN { get; set; }
        public Nullable<System.DateTime> TimeOUT { get; set; }
        public string note { get; set; }
        public Nullable<System.DateTime> DateCreated { get; set; }
        public string CreatedBy { get; set; }
        public Nullable<bool> Absent { get; set; }
    
        public virtual HR_tbl_Employee HR_tbl_Employee { get; set; }
    }
}
