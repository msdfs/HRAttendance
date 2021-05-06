using HRSystem1.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HRSystem1.Services
{
    public class TakenLeaveService
    {
        public static List<HR_tbl_TakenLeave> GetAll(HRSystemDBEntities context)
        {
            List<HR_tbl_TakenLeave> items = new List<HR_tbl_TakenLeave>();
            try
            {
                var list = context.HR_tbl_TakenLeave.ToList();
                if (list != null)
                {
                    items = list;
                }


                return items;
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        public static int CheckIfEmployeeHasExistingRec(int employeID,DateTime startDate,HRSystemDBEntities context)
        {
            int rec_Count = 0;
            rec_Count = (from p in context.HR_tbl_TakenLeave
                         where p.EMP_ID == employeID && (  (System.Data.Entity.DbFunctions.TruncateTime(p.start_date) >= System.Data.Entity.DbFunctions.TruncateTime(startDate) && System.Data.Entity.DbFunctions.TruncateTime(p.end_date) < System.Data.Entity.DbFunctions.TruncateTime(startDate)))
                         select p).Count();
            return rec_Count;
        }
        public static int CheckIfEmployeeHasExistingRec(int employeeID, DateTime startDate, DateTime end_Date, HRSystemDBEntities context)
        {
            int rec_Count = 0;
            rec_Count = (from p in context.HR_tbl_TakenLeave
                         where p.EMP_ID == employeeID && (System.Data.Entity.DbFunctions.TruncateTime(p.start_date)>=System.Data.Entity.DbFunctions.TruncateTime(startDate) && p.end_date<=System.Data.Entity.DbFunctions.TruncateTime(end_Date))
                         select p).Count();
            return rec_Count;
        }
        public static HR_tbl_TakenLeave GetAttendanceRegisterItem(int id, HRSystemDBEntities context)
        {
            HR_tbl_TakenLeave item = new HR_tbl_TakenLeave();

            var takenLeaveItem = context.HR_tbl_TakenLeave.Find(id);
            if (takenLeaveItem != null)
            {
                item = takenLeaveItem;
            }
            return item;
        }
        public static ViewModels.TakenLeaveViewModel GetAttendanceRegisterItemWith_LeaveTypes(int employeeID, DateTime startDate ,HRSystemDBEntities context)
        {
            ViewModels.TakenLeaveViewModel item = new ViewModels.TakenLeaveViewModel();

            var takenLeaveItem = (from p in context.HR_tbl_TakenLeave
                                   join o in context.HR_LeaveType on p.LeaveTypeID equals o.LeaveTypeID
                                   join e in context.HR_tbl_Employee on p.EMP_ID equals e.EMP_ID
                                   where p.EMP_ID == employeeID && (System.Data.Entity.DbFunctions.TruncateTime(p.LeaveDate)
                                            == System.Data.Entity.DbFunctions.TruncateTime(startDate.Date ))
                                   select new ViewModels.TakenLeaveViewModel
                                   {
                                       TakenLeaveID = p.TakenLeaveID
                                       ,
                                       LeaveName = o.LTname
                                       ,
                                       LeaveTypeID = p.LeaveTypeID
                                       ,
                                       EMP_ID = p.EMP_ID
                                       ,
                                       start_date = p.start_date
                                       ,
                                       end_date = p.end_date
                                       ,
                                       LeaveDate = p.LeaveDate
                                       ,EmployeeFullName=e.firstName+" "+e.Lastname

                                   }).FirstOrDefault();

            if (takenLeaveItem != null)
            {
                item = takenLeaveItem;
            }
            return item;
        }
        public static List<ViewModels.TakenLeaveViewModel> GetDeptTakenLeave(int deptID,  HRSystemDBEntities context)
        {
             

            var takenLeaveItems = (from p in context.HR_tbl_TakenLeave
                                  join o in context.HR_LeaveType on p.LeaveTypeID equals o.LeaveTypeID
                                  join e in context.HR_tbl_Employee on p.EMP_ID equals e.EMP_ID
                                  join d in context.HR_Department on e.DepartmentID equals d.DepartmentId
                                  select new ViewModels.TakenLeaveViewModel
                                  {
                                      TakenLeaveID = p.TakenLeaveID
                                      ,
                                      LeaveName = o.LTname
                                      ,
                                      LeaveTypeID = p.LeaveTypeID
                                      ,
                                      EMP_ID = p.EMP_ID
                                      ,
                                      start_date = p.start_date
                                      ,
                                      end_date = p.end_date
                                      ,
                                      LeaveDate = p.LeaveDate
                                      ,
                                      EmployeeFullName = e.firstName + " " + e.Lastname

                                  }).ToList();

             
            return takenLeaveItems;
        }
        public static HR_tbl_TakenLeave GetAttendanceRegisterItem(int employeeID,DateTime startDate, HRSystemDBEntities context)
        {
            HR_tbl_TakenLeave item = new HR_tbl_TakenLeave();

            var takenLeaveItem = (from p in context.HR_tbl_TakenLeave
                                  where p.EMP_ID == employeeID && p.LeaveDate == startDate
                                  select p).FirstOrDefault();

            if (takenLeaveItem != null)
            {
                item = takenLeaveItem;
            }
            return item;
        }
        public static int Add(HR_tbl_TakenLeave Item, HRSystemDBEntities Context)
        {
            Context.HR_tbl_TakenLeave.Add(Item);
            Context.SaveChanges();

            int newID = Item.TakenLeaveID;
            return newID;
        }

        public static int Update(HR_tbl_TakenLeave OldItem, HR_tbl_TakenLeave Item, HRSystemDBEntities Context)
        {
            int retVal = 0;
            Context.Entry(OldItem).CurrentValues.SetValues(Item);
            retVal = Context.SaveChanges();
            return retVal;
        }
        public static int Delete(int id, HRSystemDBEntities context)
        {
            int retVal = 0;
            var databaseItem = context.HR_tbl_TakenLeave.Find(id);
            if (databaseItem != null)
            {
                context.Entry(databaseItem).State = System.Data.Entity.EntityState.Deleted;
                retVal = context.SaveChanges();
            }

            return retVal;
        }
    }
}