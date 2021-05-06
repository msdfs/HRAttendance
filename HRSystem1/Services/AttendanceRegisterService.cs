using System;
using System.Collections.Generic;
using System.Linq;
using HRSystem1.Models;
using HRSystem1.ViewModels;

namespace HRSystem1.Services
{
    public class AttendanceRegisterService
    {
        public static List<HR_AttendanceRegister> GetAll(HRSystemDBEntities context)
        {
            List<HR_AttendanceRegister> items = new List<HR_AttendanceRegister>();
            try
            {
                var attendanceRegistertItems = context.HR_AttendanceRegister.OrderByDescending(p=>p.DateCreated).ToList();
                if (attendanceRegistertItems != null)
                {
                    items = attendanceRegistertItems;
                }
                return items;
            }
            catch (Exception ex)
            {

                throw ex;
            }


        }
        public static HR_AttendanceRegister GetAttendanceRecord(int id,HRSystemDBEntities context)
        {
            HR_AttendanceRegister item = new HR_AttendanceRegister();
            try
            {
                item = context.HR_AttendanceRegister.Find(id);
                if (item==null)
                {
                    item= new HR_AttendanceRegister();
                }
                return item;
            }
            catch (Exception ex)
            {

                throw ex;
            }


        }
        public static int DoesUserHaveAnExistingattendanceRecord(int employeeID,DateTime currentDate, HRSystemDBEntities context)
        {
            int retVal = 0;
            retVal = (from p in context.HR_AttendanceRegister
                      where p.Emp_Id == employeeID
                       && (System.Data.Entity.DbFunctions.TruncateTime(p.AttendanceDate) == System.Data.Entity.DbFunctions.TruncateTime(currentDate.Date))
                      select p).Count();

            //retVal = (from p in context.HR_AttendanceRegister
            //          where p.Emp_Id == employeeID
            //          && ((p.DateCreated.Value.Year == currentDate.Year) && (p.DateCreated.Value.Month==currentDate.Month) && (p.DateCreated.Value.Day==currentDate.Day))
            //          select p).Count();
            return retVal;
        }
        public static int DeleteAttendanceRegisterViewModel(int id, HRSystemDBEntities context)
        {
            int retVal = 0;
            var databaseItem = context.HR_AttendanceRegister.Find(id);
            if (databaseItem!=null)
            {
                context.Entry(databaseItem).State = System.Data.Entity.EntityState.Deleted;
                 retVal=  context.SaveChanges();
            }

            return retVal;
        }
        
        public static List<AttendanceRegisterViewModel> GetDepartmentAttendanceList(int deptID, HRSystemDBEntities context)
        {
            List<AttendanceRegisterViewModel> retVal = new List<AttendanceRegisterViewModel>();
             var userDeptParam = new System.Data.SqlClient.SqlParameter("@deptID", deptID);

            var data = context.Database.SqlQuery<spGetDeptAttendance5_Result>("spGetDeptAttendance @deptID",  userDeptParam).ToList();
            foreach (var item in data)
            {
                AttendanceRegisterViewModel obj = new AttendanceRegisterViewModel();
                obj.AttendanceID = item.AttendanceID;
                obj.EmployeeFullName = item.FullName;
                obj.EmployeeID = item.Emp_Id;
                obj.AttendanceDate = item.AttendanceDate!=DateTime.MinValue ? item.AttendanceDate.ToString("dddd dd MMMM yyyy",
                  System.Globalization.CultureInfo.CreateSpecificCulture("en-US")) :"" ;
                //  obj.LeaveType = item.AttendLeaveID.ToString();
                obj.Absent = item.Absent;
                obj.TimeIn = item.TimeIN.HasValue?item.TimeIN.Value.ToString("hh:mm tt"):"";
                obj.TimeOut = item.TimeOUT.HasValue ? item.TimeOUT.Value.ToString("hh:mm tt") : "";
                obj.DateCreated = (DateTime)(item.DateCreated ?? DateTime.MinValue);
                retVal.Add(obj);
            }

           return retVal.OrderByDescending(p => p.AttendanceID).ToList();
             ;
        }
        public static List<AttendanceRegisterViewModel> GetDepartmentAttendanceV1(int deptID,HRSystemDBEntities contex)
        {
            List<AttendanceRegisterViewModel> retVal = new List<AttendanceRegisterViewModel>();
            retVal = ( from p in contex.HR_AttendanceRegister
                       join q in contex.HR_tbl_Employee on p.Emp_Id equals q.EMP_ID
                     //  join r in contex.HR_Department on q.DepartmentID equals r.DepartmentId
                       
                       where q.DepartmentID==deptID

                       select new AttendanceRegisterViewModel
                       {
                           AttendanceID = p.AttendanceID,
                           EmployeeFullName=q.firstName+" "+q.Lastname,
                           EmployeeID=q.EMP_ID,
                           TimeIn=p.TimeIN.Value.ToString(),
                           TimeOut=p.TimeOUT.Value.ToString(),
                           Absent=p.Absent.Value?"Absent":"Present"
                       }).ToList();
            return retVal;
        }
        public static HR_AttendanceRegister GetAttendanceRegisterItem(int id)
        {

            using (HRSystemDBEntities context = new HRSystemDBEntities ())
            {
                HR_AttendanceRegister item = new HR_AttendanceRegister();

                var attendanceRegisterItem = (from p in context.HR_AttendanceRegister
                                              where p.AttendanceID == id
                                              select p).FirstOrDefault();
                ;
                if (attendanceRegisterItem != null)
                {
                    item = attendanceRegisterItem;
                }
                return item;
            }
           
        }
        public static int Add(HR_AttendanceRegister Item, HRSystemDBEntities Context)
        {
            Context.HR_AttendanceRegister.Add(Item);
            Context.SaveChanges();

            int newID = Item.AttendanceID;
            return newID;
        }

        public static int Update(HR_AttendanceRegister OldItem, HR_AttendanceRegister Item, HRSystemDBEntities Context)
        {
            int retVal = 0;
            Context.Entry(OldItem).CurrentValues.SetValues(Item);
           retVal= Context.SaveChanges();
            return retVal;
        }

        
    }
}