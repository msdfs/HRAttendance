using System;
using System.Collections.Generic;
using System.Linq;
using HRSystem1.Models;

namespace HRSystem1.ViewModels
{
    public class AttendanceRegisterViewModel
    {

        private int attendanceID;

        private int employeeID;

        private string employeeFullName;
        private string timeIn;
        private string timeOut;

        private string absent;
        private string attendanceDate;
        private DateTime dateCreated;

        public int AttendanceID { get => attendanceID; set => attendanceID = value; }
        public int EmployeeID { get => employeeID; set => employeeID = value; }
        public string  EmployeeFullName{ get => employeeFullName; set => employeeFullName = value; }
        public string TimeIn { get => timeIn; set => timeIn = value; }
        public string TimeOut { get => timeOut; set => timeOut = value; }
        public string Absent { get => absent; set => absent = value; }
        public string AttendanceDate { get => attendanceDate; set => attendanceDate = value; }
        public DateTime DateCreated { get => dateCreated; set => dateCreated = value; }

        public HR_AttendanceRegister MapViewModelToDTO(AttendanceRegisterViewModel viewmodel)
        {
            HR_AttendanceRegister dto = new HR_AttendanceRegister();

            throw new NotImplementedException();
        }

        public AttendanceRegisterViewModel MapDTOToViewModel(HR_AttendanceRegister dtoObject, HRSystemDBEntities context)
        {
            AttendanceRegisterViewModel retVal = new AttendanceRegisterViewModel();
            try
            {
               
               
                if (dtoObject.AttendanceID<1)
                {
                    throw new Exception("Invalid Attendance ID in mapping attendance DTO");
                }
                else
                {
                    retVal.AttendanceID = dtoObject.AttendanceID;
                }

                if (dtoObject.Emp_Id<1)
                {
                    throw new Exception("Invalid Employee ID in mapping attendance DTO");
                }
                else
                {
                  var employeeObj=  Services.EmployeeService.GetEmployee(dtoObject.Emp_Id, context);
                  retVal.EmployeeFullName = employeeObj.firstName+" "+employeeObj.Lastname;

                }
                
                if (dtoObject.TimeIN.HasValue)
                {
                    retVal.TimeIn = dtoObject.TimeIN.Value.ToString();

                }
                if (dtoObject.TimeOUT.HasValue)
                {
                    retVal.TimeOut = dtoObject.TimeOUT.Value.ToString();

                }
                return retVal;
            }
            catch (Exception ex)
            {

                throw ex;
            }
            
            



            return retVal;
        }
    }
}