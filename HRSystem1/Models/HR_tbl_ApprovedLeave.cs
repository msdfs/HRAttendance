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
    
    public partial class HR_tbl_ApprovedLeave
    {
        public int ApprovedLeaveID { get; set; }
        public Nullable<System.DateTime> LeaveFrom { get; set; }
        public Nullable<System.DateTime> Leaveto { get; set; }
        public Nullable<int> LeavetypeID { get; set; }
        public Nullable<System.DateTime> daterequested { get; set; }
        public string recommended { get; set; }
        public Nullable<int> approvedBy { get; set; }
        public string medicalrequired { get; set; }
        public string medicalForm { get; set; }
        public Nullable<int> isactive { get; set; }
        public Nullable<int> EMP_ID { get; set; }
    
        public virtual HR_LeaveType HR_LeaveType { get; set; }
        public virtual HR_tbl_Employee HR_tbl_Employee { get; set; }
    }
}