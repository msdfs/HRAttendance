using System;
using System.Collections.Generic;
using System.Linq;
using HRSystem1.Models;


namespace HRSystem1.Services
{
    public class LeaveTypesService
    {
        public static List<HR_LeaveType> GetAll(HRSystemDBEntities context)
        {
            List<HR_LeaveType> items = new List<HR_LeaveType>();
            try
            {
                var leaveTypes = context.HR_LeaveType.ToList();
                if (leaveTypes != null)
                {
                    items = leaveTypes;
                }
                return items;
            }
            catch (Exception ex)
            {

                throw ex;
            }
           

        }

        public static HR_LeaveType GetLeaveType(int id, HRSystemDBEntities context)
        {
            HR_LeaveType item = new HR_LeaveType();

            var leaveTypeItem = context.HR_LeaveType.Find(id);
            if (leaveTypeItem != null)
            {
                item = leaveTypeItem;
            }
            return item;
        }
    }
}