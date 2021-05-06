using HRSystem1.Models;
using HRSystem1.ViewModels;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;

namespace HRSystem1.Controllers
{
    public class AttendanceRegisterController : Controller
    {
        // GET: AttendanceRegister
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult UpdateAttendance(string employeeID, string timeIn, string timeOut
            , string leaveType, string attendanceID, string attendanceDate,string absent, string note)
        {
            // only memebrs of the group HRDataEntry can Create or update or delete
            try
            {
                string loggedInUser = string.Empty;
                loggedInUser = User.Identity.Name;
                if (string.IsNullOrEmpty(loggedInUser))
                {
                    throw new Exception("Invalid or empty username.Please Login");
                }
                else
                {
                    string userName = string.Empty;
                    userName = Extensions.UserManagementObject.ExtractUserName(loggedInUser);

                    List<string> groupsThatCurrentUserBelongsTo = new List<string>();
                    groupsThatCurrentUserBelongsTo = Extensions.UserManagementObject.getListOfGroupsThatuserBelongsTo(userName);
                    if (groupsThatCurrentUserBelongsTo.Count() >= 1)
                    {
                        if (groupsThatCurrentUserBelongsTo.Contains("HRDataEntry".ToUpper()) == false)
                        {
                            var testStr = String.Join(",",groupsThatCurrentUserBelongsTo);
                            throw new Exception("You do not have the permission to perform this action ");
                        }
                    }
                    else
                    {
                        //user has no groups
                        throw new Exception("You do not have the permission to perform this action. Please conatct the ICT Dept");
                    }

                }
                int EmployeeID = 0;
                int AttendanceID = 0;
                string Absent = string.Empty;
                DateTime TimeIn = new DateTime();
                DateTime TimeOut = new DateTime();
                DateTime _currentDate = new DateTime();
                DateTime AttendanceDate = new DateTime();
                DateTime _timeIn = new DateTime();
                DateTime _timeOut = new DateTime();

                bool update = false;
                int retVal = 0;
                try
                {
                    int.TryParse(employeeID, out EmployeeID);
                    if (EmployeeID < 1)
                    {
                        throw new InvalidCastException("Invalid EmployeeID");
                    }
                    if (!string.IsNullOrEmpty(attendanceID))
                    {

                        int.TryParse(attendanceID, out AttendanceID);
                        if (AttendanceID >= 1)
                        {
                            update = true;
                        }
                    }
                    else
                    {
                        throw new ArgumentNullException(" Invalid Attendace ID");
                    }
                  
                    try
                    {
                      
                        DateTime.TryParse(attendanceDate, out AttendanceDate);

                    }
                    catch (Exception)
                    {

                        throw new Exception("Invalid Attendance Date");
                    }
                    try
                    {
                        //DateTime t = new DateTime(_currentDate.Year, _currentDate.Month, _currentDate.Day);
                        DateTime.TryParse(timeIn, out TimeIn);

                    }
                    catch (Exception ex)
                    {

                        throw new Exception("Invalid Time In");
                    }
                    try
                    {
                        DateTime.TryParse(timeOut, out TimeOut);

                    }
                    catch (Exception ex)
                    {

                        throw new Exception("Invalid Time Out");
                    }
                    _timeIn = new DateTime(AttendanceDate.Year, AttendanceDate.Month, AttendanceDate.Day, TimeIn.Hour, TimeIn.Minute,0);
                    _timeOut = new DateTime(AttendanceDate.Year, AttendanceDate.Month, AttendanceDate.Day, TimeOut.Hour, TimeOut.Minute, 0);
                    //update
                    HR_AttendanceRegister newItem = new HR_AttendanceRegister();
                    HR_AttendanceRegister oldItem = new HR_AttendanceRegister();
                    newItem.AttendanceID = AttendanceID;
                    newItem.AttendanceDate = AttendanceDate;
                    newItem.TimeIN = _timeIn;
                    newItem.TimeOUT = _timeOut;
                    newItem.Emp_Id = EmployeeID;
                    newItem.note = note;
                    // newItem.Absent = Absent == "Absent" ? true : false; ;
                    newItem.Absent = true;
                    newItem.CreatedBy = User.Identity.Name.Trim();

                    using (HRSystemDBEntities context = new HRSystemDBEntities())
                    {
                        oldItem = context.HR_AttendanceRegister.Find(AttendanceID);
                        if (oldItem != null)
                        {
                            if (oldItem.AttendanceID == newItem.AttendanceID)
                            {
                                int takenLeaveCount = 0;
                                takenLeaveCount= Services.TakenLeaveService.CheckIfEmployeeHasExistingRec(newItem.Emp_Id, AttendanceDate.Date, context);
                                if (takenLeaveCount>=1)
                                {
                                    string message = "This Employee has an existing vacation record on the selected date";
                                    throw new Exception(message);
                                }
                                else
                                {
                                    //update 
                                    retVal = Services.AttendanceRegisterService.Update(oldItem, newItem, context);
                                    return Json(new { data = retVal, success = true }, JsonRequestBehavior.AllowGet);
                                }  
                                
                              

                            }
                            else
                            {
                                //attendance id does not match
                                throw new Exception("Invalid Attendence ID in update");
                            }
                        }
                        else
                        {
                            //invalid attendance id
                            throw new Exception("Invalid Attendence ID in update");
                        }

                    }
                   
                    

                }
                catch (Exception ex)
                {

                    throw new Exception(ex.Message);
                }
            }
            catch (Exception e)
            {

                return Json(new { data = e.Message, success = false }, JsonRequestBehavior.AllowGet);
            }
            return Json(new { data = "Error", success = false }, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public ActionResult CreateAttendance(string employeeID,string timeIn,string timeOut ,string leaveType,string attendanceID,string attendanceDate,string note,string absent,string end_date)
        {
            // only memebrs of the group HRDataEntry can Create or update or delete
            
            try
            {
                string loggedInUser= string.Empty;
                loggedInUser = User.Identity.Name;
                if (string.IsNullOrEmpty(loggedInUser))
                {
                    throw new Exception("Invalid or empty username.Please Login");
                }
                else
                {
                    string userName = string.Empty;
                    userName = Extensions.UserManagementObject.ExtractUserName(loggedInUser);

                    List<string> groupsThatCurrentUserBelongsTo = new List<string>();
                    groupsThatCurrentUserBelongsTo = Extensions.UserManagementObject.getListOfGroupsThatuserBelongsTo(userName);
                    if (groupsThatCurrentUserBelongsTo.Count()>=1)
                    {
                        if (groupsThatCurrentUserBelongsTo.Contains("HRDataEntry".ToUpper()) == false)
                        {
                            throw new Exception("You do not have the permission to perform this action");
                        }
                    }
                    else
                    {
                        //user has no groups
                        throw new Exception("You do not have the permission to perform this action");
                    }
                    
                }
                //if (Extensions.UserManagementObject.getListOfGroupsThatuserBelongsTo()
                //{

                //}

                int EmployeeID = 0;
                int AttendanceID = 0;
                int _leaveTypeID = 0;
                bool _absent ;
                DateTime TimeIn = new DateTime();
                DateTime TimeOut = new DateTime();
                DateTime _currentDate = new DateTime();
                bool update = false;
                try
                {
                    int.TryParse(employeeID, out EmployeeID);
                    if (EmployeeID<1)
                    {
                        throw new InvalidCastException("Invalid EmployeeID");
                    }
                    if (!string.IsNullOrEmpty(attendanceID))
                    {

                        try
                        {
                            int.TryParse(attendanceID, out AttendanceID);
                        }
                        catch (Exception)
                        {

                            throw new InvalidCastException("Error in converting the attendance ID");
                        }
                       
                        if (AttendanceID>=1)
                        {
                            update = true;
                        }
                    }
                }
                catch (Exception ex)
                {

                    throw new Exception(ex.Message);
                }
               
                try
                {
                    if (string.IsNullOrEmpty(attendanceDate))
                    {
                        throw new Exception(" Current Date cannot be empty");
                    }
                    else
                    {
                        //string dateFormat = "MM/DD/YYYY";
                        string[] formats = new string[] { "dd-MM-yyyy", "MM/dd/yyyy" }; // even can add more possible formats.
                        DateTime.TryParse(attendanceDate, out _currentDate);
                        _currentDate = DateTime.ParseExact(attendanceDate, formats, CultureInfo.InvariantCulture, DateTimeStyles.None);
                        //if (_currentDate <= DateTime.MinValue)
                        //{
                        //    throw new InvalidCastException("Invalid Current Date");

                        //}
                    }
                    

                }
                catch (Exception ex)
                {

                    throw new Exception(ex.Message);
                }
                try
                {
                    if (string.IsNullOrEmpty(timeIn))
                    {
                        throw new InvalidCastException("Invalid Time In.Time In cannot be empty");
                    }
                    else
                    {
                        DateTime t = new DateTime(_currentDate.Year, _currentDate.Month, _currentDate.Day);
                        
                        DateTime.TryParse(timeIn, out TimeIn);
                        if (TimeIn <= DateTime.MinValue)
                        {
                            throw new InvalidCastException("Invalid Time In");

                        }
                        else
                        {
                            TimeIn = t+new TimeSpan(TimeIn.Hour, TimeIn.Minute,TimeIn.Second);
                        }
                    }

                   
                }
                catch (Exception ex)
                {

                    throw new Exception(ex.Message);
                }
                try
                {
                    if (!string.IsNullOrEmpty(timeOut))
                    {
                        DateTime t2 = new DateTime(_currentDate.Year, _currentDate.Month, _currentDate.Day);

                        DateTime.TryParse(timeOut, out TimeOut);
                        if (TimeOut <= DateTime.MinValue)
                        {
                            throw new InvalidCastException("Invalid Time out");

                        }
                        else
                        {
                            TimeOut = t2 + new TimeSpan(TimeOut.Hour, TimeOut.Minute, TimeOut.Second);

                        }
                    }
                    else
                    {
                          throw new InvalidCastException("Error: Time in must have a value");
                    }
                   
                }
                catch (Exception ex)
                {

                    throw new InvalidCastException(ex.Message);
                }
                try
                {
                    //date difference
                    if (!string.IsNullOrEmpty(timeOut))
                    {
                        int hoursDiff = (TimeOut -TimeIn).Hours;
                        if (hoursDiff<1)
                        {
                            throw new Exception("Time Out cannot be greater than Time In");
                        }
                    }
                        
                }
                catch (Exception ex)
                {

                    throw new InvalidCastException(ex.Message);
                }
               
                try
                {
                    
                    if (string.IsNullOrEmpty(absent))
                    {
                        _absent = false;
                    }
                    else
                    {
                        Boolean.TryParse(absent, out _absent);
                        //_absent = !_absent;
                    }
                }
                catch (Exception)
                {

                    throw new InvalidCastException("Error in converting the Absent id");
                }
                try
                {
                    
                    if(!string.IsNullOrEmpty(leaveType) )
                    {
                        int.TryParse(leaveType, out _leaveTypeID);
                        if (_absent)
                        {
                            if (_leaveTypeID < 1)
                            {
                                throw new InvalidCastException("Please select a valid leave type");
                            }
                        }
                       

                    }
                    else
                    {
                        throw new InvalidCastException("Error in converting the leave type id");
                    }
                }
                catch (Exception ex)
                {

                    throw new Exception( ex.Message);
                }
                using (Models.HRSystemDBEntities context = new Models.HRSystemDBEntities())
                {
                    try
                    {
                        //add attendance only
                        Models.HR_AttendanceRegister obj = new Models.HR_AttendanceRegister();
                        obj.Emp_Id = EmployeeID;
                        obj.TimeIN = TimeIn;
                        obj.TimeOUT = TimeOut;
                        //   obj.AttendanceDate = TimeIn.Date;
                        obj.AttendanceDate = _currentDate;
                        obj.Absent = _absent;
                        obj.CreatedBy = User.Identity.Name;
                        obj.DateCreated = DateTime.Now;
                        int attendanceRegisterID = 0;
                        obj.note = note;
                        //does an attendance exist for this user  already?
                        int attendanceCount = 0;
                        attendanceCount = Services.AttendanceRegisterService
                                            .DoesUserHaveAnExistingattendanceRecord(obj.Emp_Id, _currentDate, context);
                        if (attendanceCount < 1)
                        {
                            int r = Services.TakenLeaveService.CheckIfEmployeeHasExistingRec(obj.Emp_Id, TimeIn.Date, context);
                            if (r>=1)
                            {
                               

                                ViewModels.TakenLeaveViewModel viewModel = new TakenLeaveViewModel();
                                viewModel = Services.TakenLeaveService.GetAttendanceRegisterItemWith_LeaveTypes(obj.Emp_Id, _currentDate, context);
                                string msg = "The Employee "+viewModel.EmployeeFullName+" has an existing vacation  on "+TimeIn.Date.ToString("dddd, dd MMMM yyyy");
                                return Json(new { data = -1, success = false, message=msg }, JsonRequestBehavior.AllowGet);
                            }
                            else
                            {
                                //create attendance record
                                using (var dbContextTransaction = context.Database.BeginTransaction())
                                {
                                    try
                                    {
                                        attendanceRegisterID = Services.AttendanceRegisterService.Add(obj, context);
                                        if (_absent)
                                        {
                                            //parse end date
                                            DateTime endDate = new DateTime();
                                            try
                                            {
                                                if (string.IsNullOrEmpty(end_date))
                                                {
                                                    throw new InvalidCastException("Error:Invalid or empty date in ed date");
                                                }
                                                else
                                                {
                                                    string[] formats = new string[] { "dd-MM-yyyy", "MM/dd/yyyy" }; // even can add more possible formats.
                                                    DateTime.TryParse(end_date, out endDate);
                                                    endDate = DateTime.ParseExact(end_date, formats, CultureInfo.InvariantCulture, DateTimeStyles.None);

                                                     
                                                }
                                            }
                                            catch (Exception ex)
                                            {

                                                throw new Exception(ex.Message);
                                            }
                                            if (attendanceRegisterID >= 1)
                                            {
                                                HR_tbl_TakenLeave takenLeave = new HR_tbl_TakenLeave();
                                                takenLeave.EMP_ID = obj.Emp_Id;
                                                takenLeave.LeaveDate = _currentDate.Date;
                                                takenLeave.start_date = _currentDate;
                                                takenLeave.end_date = endDate;
                                                takenLeave.LeaveTypeID = _leaveTypeID;
                                                //does the employee have any vacation within start and end dates
                                                int takenLeaveCount = 0;
                                                takenLeaveCount = Services.TakenLeaveService.CheckIfEmployeeHasExistingRec(takenLeave.EMP_ID.Value, takenLeave.start_date.Value, takenLeave.end_date.Value, context);
                                                if (takenLeaveCount>=1)
                                                {
                                                    throw new Exception("There is an existing vacation record between the selecteld dates");
                                                }
                                                int a = Services.TakenLeaveService.Add(takenLeave, context);
                                                if (a >= 1)
                                                {
                                                    dbContextTransaction.Commit();
                                                    return Json(new { data = attendanceRegisterID, success = true, message = " Record was created" }, JsonRequestBehavior.AllowGet);

                                                }
                                                else
                                                {
                                                    string msg1 = "error could not create the a record of taken leave";
                                                    return Json(new { data = attendanceRegisterID, success = false, message = msg1 }, JsonRequestBehavior.AllowGet);

                                                }
                                            }
                                        }
                                        else
                                        {
                                            dbContextTransaction.Commit();
                                            return Json(new { data = attendanceRegisterID, success = true, message = " Record was created" }, JsonRequestBehavior.AllowGet);

                                        }

                                    }
                                    catch (Exception e)
                                    {

                                        dbContextTransaction.Rollback();
                                        throw new Exception(e.Message);
                                    }
                                }
                               
                            }



                        }
                        else
                        {
                            //Existing data in attendance data
                            throw new Exception("The Employee has an existing Time and Attendance Record for the Date:  " + attendanceDate);

                        }
                    }
                    catch (Exception ex)
                    {
                         
                        throw new Exception(ex.Message);
                    }



                }
                
               
            }
            catch (Exception e)
            {
                string msg = string.Empty;

                msg = e.Message;
                return Json(new { data = -1, message = msg, success = false }, JsonRequestBehavior.AllowGet);
            }
            return Json(new { data = "Record was created1", success = true }, JsonRequestBehavior.AllowGet);

        }

        [HttpGet]
        public ActionResult GetAttendanceRegisterList()
        {
            // only memebrs of the group HRDataEntry can Create or update or delete
            //HrAdmins can only view
            using (Models.HRSystemDBEntities context = new Models.HRSystemDBEntities())
            {
                var result = Services.AttendanceRegisterService.GetDepartmentAttendanceList(1,context);
                

                return Json(new { data = result }, JsonRequestBehavior.AllowGet);
            }


        }

        [HttpPost]
        public async Task<ActionResult> GetAttendanceRegisterItem(string id)
        {
            try
            {
                int ID = 0;
                int.TryParse(id, out ID);
                if (ID < 1)
                {
                    throw new InvalidCastException("Invalid ID");
                }
                HR_AttendanceRegister item = new HR_AttendanceRegister();
                using (Models.HRSystemDBEntities context = new HRSystemDBEntities())
                {
                    context.Configuration.LazyLoadingEnabled = false;

                    var attendanceRegisterItem = (from p in context.HR_AttendanceRegister
                                                  where p.AttendanceID == ID
                                                  select p);
                    item = attendanceRegisterItem.FirstOrDefault();


                    
                }
                return Json(new { data = item, success = true }, JsonRequestBehavior.AllowGet);


            }
            catch (Exception ex)
            {

                return Json(new { data = ex.InnerException.Message, success = false }, JsonRequestBehavior.AllowGet);
            }
        }

       

        [HttpPost]
        public ActionResult DeleteRecord(string id)
        {
            try
            {
                string loggedInUser = string.Empty;
                                                          loggedInUser = User.Identity.Name;
                if (string.IsNullOrEmpty(loggedInUser))
                {
                    throw new Exception("Invalid or empty username.Please Login");
                }
                else
                {
                    string userName = string.Empty;
                    userName = Extensions.UserManagementObject.ExtractUserName(loggedInUser);

                    List<string> groupsThatCurrentUserBelongsTo = new List<string>();
                    groupsThatCurrentUserBelongsTo = Extensions.UserManagementObject.getListOfGroupsThatuserBelongsTo(userName);
                    if (groupsThatCurrentUserBelongsTo.Count() >= 1)
                    {
                        if (groupsThatCurrentUserBelongsTo.Contains("hrdataentry".ToUpper()) == false)
                        {
                            var testStr = String.Join(",", groupsThatCurrentUserBelongsTo);
                            throw new Exception("You do not have the permission to perform this action. ");
                        }
                    }
                    else
                    {
                        //user has no groups
                        var testStr = String.Join(",", groupsThatCurrentUserBelongsTo);
                        throw new Exception("You do not have the permission to perform this action Please Contact IT dept. ");
                    }

                }
                int ID = 0;
                DateTime leaveDate = new DateTime();
                bool absent;
                int i = 0;
                int.TryParse(id, out ID);
                if (ID < 1)
                {
                    throw new InvalidCastException("Invalid ID");
                }
                using (Models.HRSystemDBEntities context = new Models.HRSystemDBEntities())
                {
                    using (var dbContextTransaction = context.Database.BeginTransaction())
                    {
                        try
                        {
                            HR_AttendanceRegister currentObj = new HR_AttendanceRegister();
                              currentObj = Services.AttendanceRegisterService.GetAttendanceRecord(ID, context);
                            if (currentObj.AttendanceID<1 || currentObj==null)
                            {
                                throw new Exception("This record does not have a corresponding attendance record");
                            }
                            else
                            {
                                leaveDate = currentObj.AttendanceDate;
                                absent = currentObj.Absent.Value;
                                //delete attendance
                                var retval = Services.AttendanceRegisterService.DeleteAttendanceRegisterViewModel(ID, context);
                                if (retval>=1)
                                {
                                    //delete taken leave
                                    TakenLeaveViewModel takenLeave = new TakenLeaveViewModel();
                                    takenLeave = Services.TakenLeaveService.GetAttendanceRegisterItemWith_LeaveTypes(currentObj.Emp_Id, leaveDate, context);
                                    if (absent==false)
                                    {
                                        if (takenLeave.TakenLeaveID < 1)
                                        {
                                            throw new Exception("Could not delete record becuase there is no existing reocrd in Taken Leave");
                                        }
                                        i= Services.TakenLeaveService.Delete(takenLeave.TakenLeaveID, context);
                                        if (i >= 1)
                                        {
                                            dbContextTransaction.Commit();
                                            return Json(new { data = retval, success = true,message=" Record was deleted" }, JsonRequestBehavior.AllowGet);
                                        }
                                        else
                                        {
                                            throw new Exception("Delete from Taken Leave failed.Rolling Back Transaction");

                                        }

                                       
                                    }
                                    dbContextTransaction.Commit();
                                    return Json(new { data = retval, success = true, message = " Record was deleted" }, JsonRequestBehavior.AllowGet);

                                }
                                else
                                {
                                    dbContextTransaction.Rollback();
                                    return Json(new { data = retval, success = true, message = " Error in deleteing Record.Please try again." }, JsonRequestBehavior.AllowGet);
                                }
                            }
                           
                        }
                        catch (Exception ex)
                        {
                            dbContextTransaction.Rollback();
                            return Json(new { data = -1, success = false,message=ex.Message }, JsonRequestBehavior.AllowGet);
                        }
                    }
                        


                   // return Json(new { data = -1, success = true }, JsonRequestBehavior.AllowGet);
                }

            }
            catch (Exception  ex)
            {

                return Json(new { data = ex.Message,success=false }, JsonRequestBehavior.AllowGet);
            }
           
        }

    }
}