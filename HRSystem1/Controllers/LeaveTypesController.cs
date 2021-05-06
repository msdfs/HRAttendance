using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HRSystem1.Controllers
{
    public class LeaveTypesController : Controller
    {
        // GET: LeaveTypes
        public ActionResult Index()
        {
            return View();
        }

       [HttpGet]
        public ActionResult GetLeaveTypes()
        {
            using (Models.HRSystemDBEntities context = new Models.HRSystemDBEntities())
            {
                var leaveTypeList = Services.LeaveTypesService.GetAll(context);
                var result = (from p in leaveTypeList
                              select new
                              {
                                  LeaveTypeID = p.LeaveTypeID,
                                  LeaveType = p.LTname
                                   
                              }).ToList();
                return Json(new { data = result }, JsonRequestBehavior.AllowGet);
            }


        }
    }
}