using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HRSystem1.Controllers
{
    public class EmployeeController : Controller
    {
        // GET: Employee
        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public ActionResult GetEmployees()
        {
            using (Models.HRSystemDBEntities context = new Models.HRSystemDBEntities())
            {
                var empList = Services.EmployeeService.GetAll(context);
                var result = (from p in empList
                              select new
                              {
                                  EmployeeID = p.EMP_ID,
                                  FirstName = p.firstName,
                                  LastName = p.Lastname
                              }).ToList();
                return Json(new { data = result }, JsonRequestBehavior.AllowGet);
            }


        }
        [HttpGet]
        public ActionResult GetEmployeesTotalCount()
        {
            using (Models.HRSystemDBEntities context = new Models.HRSystemDBEntities())
            {
                var empCount = Services.EmployeeService.GetAll(context).Count();
                 
                               
                return Json(new { data = empCount }, JsonRequestBehavior.AllowGet);
            }


        }
        [HttpGet]
        public ActionResult GetEmployeesDashboardData()
        {
            try
            {
                using (Models.HRSystemDBEntities context = new Models.HRSystemDBEntities())
                {
                    var currentDate = DateTime.Now.Date;
                    var totalEMployees = (from o in context.HR_tbl_Employee
                                          select o).Count();
                    var empLoyeesPresentTodayCount = (from x in context.HR_AttendanceRegister
                                                      where x.Absent == true && System.Data.Entity.DbFunctions.TruncateTime(x.AttendanceDate) == System.Data.Entity.DbFunctions.TruncateTime(currentDate)
                                                      select x.Emp_Id
                                                ).Distinct().Count();
                    var empLoyeesAbsentTodayCount = (from x in context.HR_AttendanceRegister
                                                     where x.Absent == false && System.Data.Entity.DbFunctions.TruncateTime(x.AttendanceDate) == System.Data.Entity.DbFunctions.TruncateTime(currentDate)
                                                     select x.Emp_Id
                                                ).Distinct().Count();
                    var upcomingHolidayCount = 0; ;
                    var obj = new { total = totalEMployees, employeesPresent = empLoyeesPresentTodayCount, holidayCount = upcomingHolidayCount, employeesAbsent = empLoyeesAbsentTodayCount };
                    return Json(new { data = obj, success = true ,message="success"}, JsonRequestBehavior.AllowGet);
                }
            }
            catch (Exception ex)
            {
                var obj = new { total = 0, employeesPresent = 0, holidayCount = 0, employeesAbsent = 0 };
                return Json(new { data = obj, success = false, message = ex.Message }, JsonRequestBehavior.AllowGet);
            }
            


        }
    }
}