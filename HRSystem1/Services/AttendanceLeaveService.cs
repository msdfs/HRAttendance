using HRSystem1.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HRSystem1.Services
{
    public class AttendanceLeaveService
    {
        //public static List<HR_tbl_AttendanceLeave> GetAll(HRSystemDBEntities context)
        //{
        //    List<HR_tbl_AttendanceLeave> items = new List<HR_tbl_AttendanceLeave>();
        //    try
        //    {
        //        var list = context.HR_tbl_AttendanceLeave.ToList();
        //        if (list != null)
        //        {
        //            items = list;
        //        }


        //        return items;
        //    }
        //    catch (Exception ex)
        //    {

        //        throw ex;
        //    }

        //}
        //public static int Add(HR_tbl_AttendanceLeave Item, HRSystemDBEntities Context)
        //{
        //    Context.HR_tbl_AttendanceLeave.Add(Item);
        //    Context.SaveChanges();

        //    int newID = Item.AttendLeaveID;
        //    return newID;
        //}

        //public static int Update(HR_tbl_AttendanceLeave OldItem, HR_tbl_AttendanceLeave Item, HRSystemDBEntities Context)
        //{
        //    int retVal = 0;
        //    Context.Entry(OldItem).CurrentValues.SetValues(Item);
        //    retVal = Context.SaveChanges();
        //    return retVal;
        //}
        //public static HR_tbl_AttendanceLeave GetAttendanceLeaveItem(int id, HRSystemDBEntities context)
        //{
        //    HR_tbl_AttendanceLeave item = new HR_tbl_AttendanceLeave();

        //    var attendanceLeaveItem = context.HR_tbl_AttendanceLeave.Find(id);
        //    if (attendanceLeaveItem != null)
        //    {
        //        item = attendanceLeaveItem;
        //    }
        //    return item;
        //}
    }
}