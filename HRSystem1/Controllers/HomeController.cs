using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HRSystem1.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        [HttpPost]
        public ActionResult GetEmployeeCount()
        {
            using (Models.HRSystemDBEntities context = new Models.HRSystemDBEntities())
            {
                int employeeCount = 0;
                 employeeCount  = Services.EmployeeService.GeEmployeeTotalCountByDept(context);

                return Json(new { data = employeeCount, success = true }, JsonRequestBehavior.AllowGet);

            }

        }

    }
}