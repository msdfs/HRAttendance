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
    
    public partial class spGetDeptAttendance5_Result
    {
        public int AttendanceID { get; set; }
        public int Emp_Id { get; set; }
        public string FullName { get; set; }
        public System.DateTime AttendanceDate { get; set; }
        public Nullable<System.DateTime> TimeIN { get; set; }
        public Nullable<System.DateTime> TimeOUT { get; set; }
        public string Absent { get; set; }
        public string note { get; set; }
        public Nullable<System.DateTime> DateCreated { get; set; }
    }
}
