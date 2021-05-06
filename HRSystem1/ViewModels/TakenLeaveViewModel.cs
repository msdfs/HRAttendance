using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HRSystem1.ViewModels
{
    public class TakenLeaveViewModel
    {
        public int TakenLeaveID { get; set; }
        public string LeaveName { get; set; }
        public string EmployeeFullName { get; set; }
        public Nullable<int> LeaveTypeID { get; set; }
        public Nullable<int> isactive { get; set; }
        public Nullable<int> EMP_ID { get; set; }
        public Nullable<System.DateTime> start_date { get; set; }
        public Nullable<System.DateTime> end_date { get; set; }
        public Nullable<System.DateTime> LeaveDate { get; set; }
    }
}