using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HRSystem1.Controllers
{
    public class TakenLeaveController : Controller
    {
        // GET: TakenLeave
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public ActionResult DeleteLeaveTakenRecord(string id)
        {
            try
            {
                int ID = 0;
                DateTime leaveDate = new DateTime();
                bool absent;
                int i = 0;
                int recCount = 0;
                int.TryParse(id, out ID);
                if (ID < 1)
                {
                    throw new InvalidCastException("Invalid ID");
                }
                using (Models.HRSystemDBEntities context = new Models.HRSystemDBEntities())
                {
                    using (var dbContextTransaction = context.Database.BeginTransaction())
                    {
                          recCount = Services.TakenLeaveService.Delete(ID, context);
                        if (recCount>=1)
                        {
                            dbContextTransaction.Commit();
                            return Json(new { data = recCount, success = true, message = " Record was deleted" }, JsonRequestBehavior.AllowGet);
                        }
                    }
                }
                return Json(new { data = recCount, success = true, message = " Record was deleted" }, JsonRequestBehavior.AllowGet);

            }
            catch (Exception  ex)
            {

                return Json(new { data = ex.Message, success = false }, JsonRequestBehavior.AllowGet);
            }
        }
        [HttpGet]
        public ActionResult GetData()
        {
            int id = 1;
            try
            {
                 

                if (id>=1)
                {
                    //get data
                    using (Models.HRSystemDBEntities context = new Models.HRSystemDBEntities())
                    {
                        var data = Services.TakenLeaveService.GetDeptTakenLeave(id, context);
                        return Json(new { data = data, success = true, message = "" }, JsonRequestBehavior.AllowGet);
                    }
                   
                }
                else
                {
                    throw new Exception("Error: Dept ID must be a non-zero number");
                }
            }
            catch (Exception ex)
            {

                return Json(new { data = "Error", success = false,message=ex.Message }, JsonRequestBehavior.AllowGet);
            }


            return Json(new { data = "Error", success = false }, JsonRequestBehavior.AllowGet);
        }
    }
}