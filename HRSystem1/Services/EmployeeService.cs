using System;
using System.Collections.Generic;
using System.Linq;
using HRSystem1.Models;

namespace HRSystem1.Services
{
    public class EmployeeService
    {
        public static List<HR_tbl_Employee> GetAll(HRSystemDBEntities context)
        {
            List<HR_tbl_Employee> items = new List<HR_tbl_Employee>();
            try
            {
                var employees = context.HR_tbl_Employee.ToList();
                if (employees != null)
                {
                    items = employees;
                }


                return items;
            }
            catch (Exception ex)
            {

                throw ex;
            }
           
        }
        public static int GeEmployeeTotalCountByDept(HRSystemDBEntities context)
        {
            int retval = 0;
            try
            {
                  retval = context.HR_tbl_Employee.Count();
                


                return retval;
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        public static HR_tbl_Employee GetEmployee(int id, HRSystemDBEntities context)
        {
            HR_tbl_Employee item = new HR_tbl_Employee();

            var employee = context.HR_tbl_Employee.Find(id);
            if (employee!=null)
            {
                item = employee;
            }
            return item;
        }
    }
}