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
    
    public partial class HR_tbl_TakenLeave
    {
        public int TakenLeaveID { get; set; }
        public Nullable<int> LeaveTypeID { get; set; }
        public Nullable<int> isactive { get; set; }
        public Nullable<int> EMP_ID { get; set; }
        public Nullable<System.DateTime> start_date { get; set; }
        public Nullable<System.DateTime> end_date { get; set; }
        public Nullable<System.DateTime> LeaveDate { get; set; }
    
        public virtual HR_LeaveType HR_LeaveType { get; set; }
    }
}
