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
    
    public partial class HR_tbl_ROP_report
    {
        public int ROP_ID { get; set; }
        public Nullable<int> EmpID { get; set; }
        public Nullable<int> DepartmentID { get; set; }
        public Nullable<System.DateTime> Date { get; set; }
        public Nullable<int> DaysPresent { get; set; }
        public Nullable<int> DaysAbsent { get; set; }
        public Nullable<int> isactive { get; set; }
    
        public virtual HR_Department HR_Department { get; set; }
        public virtual HR_tbl_Employee HR_tbl_Employee { get; set; }
    }
}