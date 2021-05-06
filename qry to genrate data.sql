declare @FromDate date = '2021-02-01' --YYYY-MM-DD
declare @ToDate date = '2021-02-28'
declare @busDay date=null

declare @empTable table (ID INT  IDENTITY(1,1) PRIMARY KEY,empID int,deptID int)
declare @dates table (d DATE,ID INT  IDENTITY(1,1) )


WHILE ( @FromDate < @ToDate )
BEGIN
	DECLARE @dayNumber INT;
	SET @dayNumber = DATEPART(DW, @FromDate);

	--Sunday = 1, Saturday = 7.
	IF(@dayNumber = 1 OR @dayNumber = 7) 
		--PRINT 'Weekend';
		set @FromDate=(select	dbo.GetBussinesDay( @FromDate))
	ELSE
		PRINT 'NOT Weekend';

  INSERT INTO @Dates (d) VALUES( @FromDate )
  SELECT @FromDate = DATEADD(DAY, 1, @FromDate )
END

--select * from  @Dates


insert into @empTable (empID,deptID)
select  [EMP_ID],1  FROM [HRSystem].[dbo].[HR_tbl_Employee] where EMP_ID=13

--set @busDay=(select dateadd(day, 
--               rand(checksum(newid()))*(1+datediff(day, @FromDate, @ToDate)), 
--               @FromDate))
--			   select @busDay,dbo.GetBussinesDay( @busDay)

--select * from @empTable

declare @counter int
declare @maxCount int 
declare @empID int


set @empID=(select top 1 empID from @empTable)
set @maxCount=(select max(ID) from @dates)
set @counter=1
select @counter,@empID,@maxCount
while(@counter<=@maxCount)
Begin
print 'in looop'
	declare @attendanceDate datetime
	declare @timeIN time
	declare @timeOut time
	declare @timeINDate datetime
	declare @timeOutDate datetime
	set @timeIN='08:00:00'
	set @timeOut='16:00:00'
	set @attendanceDate=(select d from @dates where ID=@counter)
	set @timeINDate= @attendanceDate+cast(@timeIN as datetime)
	set @timeOutDate= @attendanceDate+cast(@timeOut as datetime)
		select @empID as EmpID,@attendanceDate as attendancedate,@timeINDate as timeIn,@timeOutDate as timeOut,GETDATE() as DateCreated,1 as absent
		INSERT INTO [dbo].[HR_AttendanceRegister]
           ([Emp_Id]
           ,[AttendanceDate]
           ,[TimeIN]
           ,[TimeOUT]
        
           ,[DateCreated]
          
           ,[Absent])
     VALUES
           (@empID
           ,@attendanceDate
           ,@timeINDate
           ,@timeOutDate
          
           ,GETDATE()
           
           ,1)

		set @counter=@counter+1
End

