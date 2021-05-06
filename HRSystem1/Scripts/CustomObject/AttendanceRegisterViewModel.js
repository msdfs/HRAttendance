function AttendanceRegisterViewModel(_attendanceID, _employeeID, _employeeFullName, _timeIn, _timeOut, _leaveType, _attendanceDate,end_Date,notes,absent){
    this.AttendanceID = _attendanceID;
    this.EmployeeID = _employeeID;
    this.EmployeeFullName = _employeeFullName;
    this.TimeIn = _timeIn;
    this.TimeOut = _timeOut;

    this.LeaveType = _leaveType;
    this.AttendanceDate = _attendanceDate;
    this.end_Date = end_Date;
    this.notes = notes;
    this.Absent = absent;
    this.update = function () {
        //save employee to DB
    };
    this.getAttendanceRecForModal = function (id) {
        $.ajax({
            type: "POST",
            url: "/AttendanceRegister/GetAttendanceRegisterItem",
            data: JSON.stringify({ 'id': id }),
            async: false,
            datatype: "json",
            contentType: "application/json; charset=utf-8"

        }).done(function (response) {
            if (response.success) {
                //showToast('Record was loaded');
                debugger;
                loadEdit(response.data);
                console.log(response);
            } else {
                showToast(response.message);
            }
            }).fail(function (err) {
                console.log("Something went wrong. ", 3000, 'rounded', err);

                alert('Something went wrong--attendance did not load');
        });
   
    };
    this.GetAttendanceRegisterItem = function (id) {
        //load Employee
        debugger;
        var dataToSend = {
            'id': id
        };
        $.ajax({
            type: "POST",
            url: "/AttendanceRegister/GetAttendanceRegisterItem",
            data: JSON.stringify({ 'id': id }),
            async: false,
            datatype: "json",
            contentType: "application/json; charset=utf-8",

        })
            .done(function (response) {
                if (response.success) {
                    //showToast('Record was loaded');
                    debugger;
                    // loadForm(response.data);
                    loadEdit(response.data);
                } else {
                    showToast(response.message);
                }
            })
            .fail(function (xhr) {
                showToast(xhr.responseText);
            });
        


    };
    this.updateAttendanceRegister = function () {
        debugger;
        this.getFormValues();
        $.ajax({
            type: "POST",
            url: "/AttendanceRegister/UpdateAttendance",
            data: JSON.stringify({
                "employeeID": this.EmployeeID,
                "timeIn": this.TimeIn,
                "timeOut": this.TimeOut,
                //"leaveType": this.LeaveType,
                "attendanceID": this.AttendanceID,
                "attendanceDate": this.CurrentDate,
                "note":this.notes
            }),
            dataType: 'json',
            contentType: 'application/json; charset=utf-8',
            async: true,
            success: function (response) {
                //clear form
                debugger;
                // alert("Success");
                console.log(response);
                //reload table
                if (response.success) {
                  
                  //  $("#btnSubmit").show();
                    $('#table_id').DataTable().ajax.reload();
                    $('#tableTakenLeave').DataTable().ajax.reload();
                    showToast('Record was Updated');

                } else {
                    showToast('Error in updating record',response.data);
                }
                //table.reload();
                //reload table
                // $("#table_id").data.reload();
              
                //clear form
                //clear attdenance hidden field
            },
            error: function (data) {
                console.log("Something went wrong. ", 3000, 'rounded', data);

                alert('Something went wrong');

            }
        });
    };
    this.editClick = function (obj) {
        event.stopImmediatePropagation();

        $('#editModal').modal('show'); 
       
        debugger;
        $("#attendanceID").val(obj.id);
        
        var rowID = $(obj).attr('id');
       
        this.GetAttendanceRegisterItem(obj.id);
        //populate modal form
        this.getFormValues();
        console.log(this);
      
        $('#table_id').DataTable().ajax.reload();
        $('#tableTakenLeave').DataTable().ajax.reload();
    };
    this.deleteClick = function (obj) {
        var result = confirm('Do you want to delete this record?');
        if (result===true) {
            var rowID = $(obj).attr('id');
            debugger;
            $.ajax({
                type: "POST",
                url: "/AttendanceRegister/DeleteRecord",
                data: JSON.stringify({
                    "id": rowID
                }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',



                success: function (response) {
                    //reload data table
                    debugger;
                    console.log('Attendance data', response);
                    // alert('attendance success');
                    //loadLeaveTypesintoDDL(data);

                    if (response.success===true) {
                        $('#table_id').DataTable().ajax.reload();
                        $('#tableTakenLeave').DataTable().ajax.reload();
                        showToast('Record was Deleted');
                    } else {
                        showToast(response.data);
                    }
                },
                error: function (err) {
                    debugger;
                    console.log("Something went wrong. ", 3000, 'rounded', err.data);

                    alert('Something went wrong--attendance did not load');

                }
            });
        }
        

    };
    this.deleteTakenLeaveClick = function (obj) {
        var result = confirm('Do you want to delete this vacation record?');
        if (result === true) {
            var rowID = $(obj).attr('id');
            debugger;
            $.ajax({
                type: "POST",
                url: "/TakenLeave/DeleteLeaveTakenRecord",
                data: JSON.stringify({
                    "id": rowID
                }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',



                success: function (response) {
                    //reload data table
                    // debugger;
                    console.log('taken data', response);
                    // alert('attendance success');
                    //loadLeaveTypesintoDDL(data);

                    if (response.success === true) {
                        $('#table_id').DataTable().ajax.reload();
                        $('#tableTakenLeave').DataTable().ajax.reload();
                        showToast('Record was Deleted');
                    } else {
                        showToast(response.message);
                    }
                },
                error: function (err) {
                    console.log("Something went wrong. ", 3000, 'rounded', err.data);

                    alert('Something went wrong--could not delet record');

                }
            });
        }


    };

    this.loadAttendanceRegister = function (id) {
        $.ajax({
            type: "GET",
            url: "/AttendanceRegister/GetAttendanceRegisterList",


            datatype: "json",
            
                success: function(response) {
                    //reload data table
                    // debugger;
                    console.log('Attendance data', response);
                    // alert('attendance success');
                    //loadLeaveTypesintoDDL(data);

                    if (response.success) {
                        showToast('Record was tested');
                        this.loadform(response.data);
                    } else {
                        showToast(response.message);
                    }
                },
            error: function (err) {
                console.log("Something went wrong. ", 3000, 'rounded', err.data);

                alert('Something went wrong--attendance did not load');

            }
        });
    };
    this.loadForm = function (obj) {
        $("#attendanceID").val(obj.AttendanceID);
        $('#ddlEmployee').val(obj.EmployeeID);// ("#ddlEmployee").val();
        $("#txtTimeIn").val(obj.TimeIn);
        $("#txtTimeOut").val(obj.TimeOut);
        $("#ddlLeaveType").val(obj.LeaveType);
        $("#start_Date").val(obj.CurrentDate);
        $("#comments").val(obj.notes);

    };
   
    this.getEditFormValues = function () {
        debugger;
        this.AttendanceID = $("#hdnAttendanceID").val();
        this.EmployeeID = $('#editddlEmployee').val();
        this.TimeIn = $("#edittxtTimeIn").val();
        this.TimeOut = $("#edittxtTimeOut").val();
        this.LeaveType = $("#editddlLeaveType").val();
        this.CurrentDate = $("#editCurrentDate").val();
        this.notes = $("#editComment").val();

    };
    this.getFormValues  = function () {
        debugger;
        this.AttendanceID = $("#attendanceID").val();
        this.EmployeeID = $('#ddlEmployee').val();
        this.TimeIn = $("#txtTimeIn").val();
        this.TimeOut = $("#txtTimeOut").val();
        this.LeaveType = $("#ddlLeaveType").val();

        this.AttendanceDate = $("#start_Date").val();
        this.notes = $("#comments").val();
        this.Absent = $("#chkAbsent").is(":checked") ? "true" : "false";// $("#chkAbsent").val();
        this.end_Date = $("#endDate").val();
    };
    this.ClearForm = function () {
        debugger;
        $("#attendanceID").val('');
        $("#ddlEmployee option").prop("selected", false).trigger("change");
      
         $("#txtTimeIn").val('');
        $("#txtTimeOut").val('');

        $("#ddlLeaveType option").prop("selected", false).trigger("change");
         

        $("#start_Date").val('');
        $("#endDate").val('');
        $("#comments").val('');
        $("#chkAbsent").find('input:checkbox').removeAttr('checked');
        //this.Absent = $("#chkAbsent").is(":checked") ? "true" : "false";// $("#chkAbsent").val();
        
    };
    this.validateForm = function (employeeID, timeIn, timeOut, leaveTypeID, attendanceDate,absent,endDate) {
        let validate = true;
        debugger;
        let isDateValid = moment(attendanceDate, 'MM/DD/YYYY', true);
        if ((isDateValid.isValid() === false)) {
            validate = false;
            showToast('Invalid date in attendance date');
            return validate;
        }
        if (employeeID < 1) {
            validate = false;
            showToast('Please Select an Employee');
            return validate;

        }
      
        //if (moment(timeIn).isSameOrAfter(timeOut)==false) {
        //    validate = false;
        //    showToast('Time In Cannot be the same or greater than time out');
        //    return validate;
        //}
        //if (timeIn) {
        //    validate = false;
        //    showToast('Please Enter a value for Time In');
        //    return validate;
        //} else {

        //}
        //if (timeOut) {
        //    validate = false;
        //    showToast('Please Enter a value for Time Out');
        //    return validate;
        //} else {
        //    //time out has value

        //}
        debugger
        if (absent==='true') {
            if (parseInt(leaveTypeID)===0) {
                validate = false;
                showToast('Please Select a leave type');
                return validate;
            }
            //valdate end date
            // if (moment(_timeIn).isSameOrAfter(_timeOut) == true) {
            
            let _endDate = moment(endDate, 'MM/DD/YYYY', true);
            if (_endDate.isValid()===false) {
                validate = false;
                showToast('Please Enter Valid EndDate');
                return validate;
            } else {
                let dateDiffStart = _endDate.diff(isDateValid, 'days');
                let dateDiffEnd = isDateValid.diff(_endDate, 'days');
                if (dateDiffEnd>=1) {
                    validate = false;
                    showToast('End Date Cannot be less that Start Date');
                    return validate;
                }
                //if (dateDiffStart <0) {
                //    validate = false;
                //    showToast('Start Date Cannot be greater that End Date');
                //    return validate;
                //}
            }
            let isTimeInValid = moment(timeIn, 'hh:mm');
            if (isTimeInValid.isValid() === false) {
                validate = false;
                showToast('Please Enter a value for Time In');
                return validate;
            }
            let isTimeOutValid = moment(timeOut, 'hh:mm A')
            if (isTimeOutValid.isValid() === false) {
                validate = false;
                showToast('Please Enter a value for Time Out');
                return validate;
            }
            let _timeIn = moment(timeIn, 'HH:mm A');
            let _timeOut = moment(timeOut, 'HH:mm A');
            if (moment(_timeIn).isSameOrAfter(_timeOut) === true) {
                validate = false;
                showToast('Time In Cannot be the same or greater than time out');
                return validate;
            }
             
        }

        return validate;
    };
    
    this.SaveAttendanceRegisterItem = function () {
        this.getFormValues();
        debugger;
        $.ajax({
            type: "POST",
            url: "/AttendanceRegister/UpdateAttendanceRegister",

            data: '{ AttendanceRegisterViewModel : ' + JSON.stringify(this) + '}',
            datatype: "json",

            success: function (response) {
                //reload data table
                // debugger;
                console.log('Attendance data', response);
                // alert('attendance success');
                //loadLeaveTypesintoDDL(data);
                debugger;
                if (response.success) {
                    //  showToast('Record was Created');

                } else {
                    showToast(response.message);
                }
            },
            error: function (err) {
                console.log("Something went wrong. ", 3000, 'rounded', err.data);

                alert('Something went wrong--attendance did not load');

            }
        });
    };
    this.createAttendanceRegisterItem = function (obj) {
        this.getFormValues();
        //alert('In VM');
        debugger;
        if (attendanceRegisterObj.validateForm(obj.EmployeeID, obj.TimeIn, obj.TimeOut, obj.LeaveType, obj.AttendanceDate, obj.Absent, obj.end_Date) ){
           // let leavedate = Date.parse(start_Date);
            let options = {
                weekday: 'long',
                year: 'numeric',
                month: 'short',
                day: 'numeric'

            };
            //format date
            //let _start_Date = moment(this.CurrentDate, 'DD/MM/YYYY', true);
            //this.CurrentDate = _start_Date;

            //leavedate.toLocaleString('en-us', options)
            //create
            $.ajax({
                type: "POST",
                url: "/AttendanceRegister/CreateAttendance",
                data: JSON.stringify({
                    "employeeID": this.EmployeeID,
                    "timeIn": this.TimeIn,
                    "timeOut": this.TimeOut,
                    "Absent": this.Absent,
                    "LeaveType": this.LeaveType,
                    "attendanceID": this.AttendanceID,
                    //moment("12-25-1995", "MM-DD-YYYY");
                    "attendanceDate": this.AttendanceDate,
                    "end_date":this.end_Date,
                    'note': this.notes
                }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                async: true,
                success: function (response) {
                    //clear form
                    debugger;
                    // alert("Success");
                    console.log(response);
                    //reload table
                    if (response.success) {
                        showToast('Record was Created');
                        $('#table_id').DataTable().ajax.reload();
                        $('#tableTakenLeave').DataTable().ajax.reload();
                        this.ClearForm();
                    } else {
                        showToast(response.message);
                    }
                    //table.reload();
                    //reload table
                    // $("#table_id").data.reload();
                    $('#table_id').DataTable().ajax.reload();
                    //clear form
                    //clear attdenance hidden field
                },
                error: function (data) {
                    console.log("Something went wrong. ", 3000, 'rounded', data);

                    alert('Something went wrong');

                }
            });

        }
    };

}
 