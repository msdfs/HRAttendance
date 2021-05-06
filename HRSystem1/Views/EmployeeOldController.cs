using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using HRSystem1.Models;

namespace HRSystem1.Views
{
    public class EmployeeOldController : Controller
    {
        private HRSystemDBEntities db = new HRSystemDBEntities();

        // GET: Employee
        public ActionResult Index()
        {
            var hR_tbl_Employee = db.HR_tbl_Employee.Include(h => h.HR_Department).Include(h => h.tbl_val_sex).Include(h => h.HR_tbl_Employee2).Include(h => h.HR_tbl_employmentStatus).Include(h => h.HR_tbl_Location).Include(h => h.HR_tbl_Position);
            return View(hR_tbl_Employee.ToList());
        }

        // GET: Employee/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            HR_tbl_Employee hR_tbl_Employee = db.HR_tbl_Employee.Find(id);
            if (hR_tbl_Employee == null)
            {
                return HttpNotFound();
            }
            return View(hR_tbl_Employee);
        }

        // GET: Employee/Create
        public ActionResult Create()
        {
            ViewBag.DepartmentID = new SelectList(db.HR_Department, "DepartmentId", "DepartmentName");
            ViewBag.gender = new SelectList(db.tbl_val_sex, "sid", "sex");
            ViewBag.ReportingManager = new SelectList(db.HR_tbl_Employee, "EMP_ID", "firstName");
            ViewBag.Estatus = new SelectList(db.HR_tbl_employmentStatus, "EmpStatus_ID", "estatus");
            ViewBag.LocationID = new SelectList(db.HR_tbl_Location, "LocationID", "LocationName");
            ViewBag.PosID = new SelectList(db.HR_tbl_Position, "Pos_ID", "Pos_Name");
            return View();
        }

        // POST: Employee/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "EMP_ID,firstName,Lastname,gender,email,contactext,Estatus,PosID,dateJoin,dateLeave,ServiceYears,ReportingManager,DepartmentID,LocationID,createdBy,modifiedBy,createDate,modifiedDate,isactive")] HR_tbl_Employee hR_tbl_Employee)
        {
            if (ModelState.IsValid)
            {
                db.HR_tbl_Employee.Add(hR_tbl_Employee);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.DepartmentID = new SelectList(db.HR_Department, "DepartmentId", "DepartmentName", hR_tbl_Employee.DepartmentID);
            ViewBag.gender = new SelectList(db.tbl_val_sex, "sid", "sex", hR_tbl_Employee.gender);
            ViewBag.ReportingManager = new SelectList(db.HR_tbl_Employee, "EMP_ID", "firstName", hR_tbl_Employee.ReportingManager);
            ViewBag.Estatus = new SelectList(db.HR_tbl_employmentStatus, "EmpStatus_ID", "estatus", hR_tbl_Employee.Estatus);
            ViewBag.LocationID = new SelectList(db.HR_tbl_Location, "LocationID", "LocationName", hR_tbl_Employee.LocationID);
            ViewBag.PosID = new SelectList(db.HR_tbl_Position, "Pos_ID", "Pos_Name", hR_tbl_Employee.PosID);
            return View(hR_tbl_Employee);
        }

        // GET: Employee/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            HR_tbl_Employee hR_tbl_Employee = db.HR_tbl_Employee.Find(id);
            if (hR_tbl_Employee == null)
            {
                return HttpNotFound();
            }
            ViewBag.DepartmentID = new SelectList(db.HR_Department, "DepartmentId", "DepartmentName", hR_tbl_Employee.DepartmentID);
            ViewBag.gender = new SelectList(db.tbl_val_sex, "sid", "sex", hR_tbl_Employee.gender);
            ViewBag.ReportingManager = new SelectList(db.HR_tbl_Employee, "EMP_ID", "firstName", hR_tbl_Employee.ReportingManager);
            ViewBag.Estatus = new SelectList(db.HR_tbl_employmentStatus, "EmpStatus_ID", "estatus", hR_tbl_Employee.Estatus);
            ViewBag.LocationID = new SelectList(db.HR_tbl_Location, "LocationID", "LocationName", hR_tbl_Employee.LocationID);
            ViewBag.PosID = new SelectList(db.HR_tbl_Position, "Pos_ID", "Pos_Name", hR_tbl_Employee.PosID);
            return View(hR_tbl_Employee);
        }

        // POST: Employee/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "EMP_ID,firstName,Lastname,gender,email,contactext,Estatus,PosID,dateJoin,dateLeave,ServiceYears,ReportingManager,DepartmentID,LocationID,createdBy,modifiedBy,createDate,modifiedDate,isactive")] HR_tbl_Employee hR_tbl_Employee)
        {
            if (ModelState.IsValid)
            {
                db.Entry(hR_tbl_Employee).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.DepartmentID = new SelectList(db.HR_Department, "DepartmentId", "DepartmentName", hR_tbl_Employee.DepartmentID);
            ViewBag.gender = new SelectList(db.tbl_val_sex, "sid", "sex", hR_tbl_Employee.gender);
            ViewBag.ReportingManager = new SelectList(db.HR_tbl_Employee, "EMP_ID", "firstName", hR_tbl_Employee.ReportingManager);
            ViewBag.Estatus = new SelectList(db.HR_tbl_employmentStatus, "EmpStatus_ID", "estatus", hR_tbl_Employee.Estatus);
            ViewBag.LocationID = new SelectList(db.HR_tbl_Location, "LocationID", "LocationName", hR_tbl_Employee.LocationID);
            ViewBag.PosID = new SelectList(db.HR_tbl_Position, "Pos_ID", "Pos_Name", hR_tbl_Employee.PosID);
            return View(hR_tbl_Employee);
        }

        // GET: Employee/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            HR_tbl_Employee hR_tbl_Employee = db.HR_tbl_Employee.Find(id);
            if (hR_tbl_Employee == null)
            {
                return HttpNotFound();
            }
            return View(hR_tbl_Employee);
        }

        // POST: Employee/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            HR_tbl_Employee hR_tbl_Employee = db.HR_tbl_Employee.Find(id);
            db.HR_tbl_Employee.Remove(hR_tbl_Employee);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
