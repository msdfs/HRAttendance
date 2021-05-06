USE [HRSystem]
GO
/****** Object:  Table [dbo].[HR_Department]    Script Date: 27/04/2021 4:20:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HR_Department](
	[DepartmentId] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [varchar](50) NULL,
	[isactive] [int] NULL,
 CONSTRAINT [PK_HR_Department] PRIMARY KEY CLUSTERED 
(
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HR_tbl_Position]    Script Date: 27/04/2021 4:20:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HR_tbl_Position](
	[Pos_ID] [int] IDENTITY(1,1) NOT NULL,
	[Pos_Name] [varchar](50) NULL,
	[PositionSalary] [money] NULL,
	[createdBy] [varchar](50) NULL,
	[modifiedBy] [varchar](50) NULL,
	[isActive] [int] NULL,
 CONSTRAINT [PK_HR_tbl_Positions] PRIMARY KEY CLUSTERED 
(
	[Pos_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HR_AttendanceRegister]    Script Date: 27/04/2021 4:20:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HR_AttendanceRegister](
	[AttendanceID] [int] IDENTITY(1,1) NOT NULL,
	[Emp_Id] [int] NOT NULL,
	[AttendanceDate] [date] NOT NULL,
	[TimeIN] [smalldatetime] NULL,
	[TimeOUT] [smalldatetime] NULL,
	[note] [varchar](150) NULL,
	[DateCreated] [datetime] NULL,
	[CreatedBy] [nvarchar](300) NULL,
	[Absent] [bit] NULL,
 CONSTRAINT [PK_HR_AttendanceRegister] PRIMARY KEY CLUSTERED 
(
	[AttendanceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HR_tbl_Employee]    Script Date: 27/04/2021 4:20:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HR_tbl_Employee](
	[EMP_ID] [int] IDENTITY(1,1) NOT NULL,
	[firstName] [varchar](50) NULL,
	[Lastname] [varchar](50) NULL,
	[gender] [int] NULL,
	[contactID] [int] NULL,
	[email] [varchar](50) NULL,
	[Estatus] [int] NULL,
	[PosID] [int] NULL,
	[dateJoin] [date] NULL,
	[dateLeave] [date] NULL,
	[ServiceYears] [int] NULL,
	[ReportingManager] [int] NULL,
	[DepartmentID] [int] NULL,
	[LocationID] [int] NULL,
	[createdBy] [varchar](50) NULL,
	[modifiedBy] [varchar](50) NULL,
	[createDate] [datetime] NULL,
	[modifiedDate] [datetime] NULL,
	[isactive] [int] NULL,
 CONSTRAINT [PK_HR_tbl_Employee] PRIMARY KEY CLUSTERED 
(
	[EMP_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_Days_Worked]    Script Date: 27/04/2021 4:20:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_Days_Worked] AS SELECT   
HR_tbl_Employee.firstName + ' ' + HR_tbl_Employee.Lastname AS [Full Name], 
HR_tbl_Position.Pos_Name AS [Position], 
DATEPART(month, HR_AttendanceRegister.AttendanceDate) AS Month, DATEPART(yyyy, HR_AttendanceRegister.AttendanceDate) AS Year,
HR_Department.DepartmentName,HR_AttendanceRegister.AttendanceID
                          
FROM         HR_tbl_Employee INNER JOIN
                         HR_AttendanceRegister ON HR_tbl_Employee.EMP_ID = HR_AttendanceRegister.Emp_Id INNER JOIN
                         HR_tbl_Position ON HR_tbl_Employee.PosID = HR_tbl_Position.Pos_ID INNER JOIN
                         HR_Department ON HR_tbl_Employee.DepartmentID = HR_Department.DepartmentId
GO
/****** Object:  Table [dbo].[Book1]    Script Date: 27/04/2021 4:20:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book1](
	[Firstname] [nvarchar](50) NOT NULL,
	[Lastname] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Contact] [int] NULL,
	[DateJoined] [nvarchar](1) NULL,
	[DateLeave] [nvarchar](1) NULL,
	[ServiceYears] [nvarchar](50) NOT NULL,
	[LocationID] [nvarchar](1) NULL,
	[IsActive] [nvarchar](50) NOT NULL,
	[EmpStatusID] [nvarchar](50) NOT NULL,
	[Pos_ID] [nvarchar](50) NOT NULL,
	[ReportingManager] [nvarchar](1) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HR_ContactType]    Script Date: 27/04/2021 4:20:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HR_ContactType](
	[ContactTypeID] [int] IDENTITY(1,1) NOT NULL,
	[ContactTypeName] [varchar](50) NULL,
 CONSTRAINT [PK_HR_ContactType] PRIMARY KEY CLUSTERED 
(
	[ContactTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HR_EmployeeContact]    Script Date: 27/04/2021 4:20:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HR_EmployeeContact](
	[contactID] [int] IDENTITY(1,1) NOT NULL,
	[Contact] [varchar](8) NULL,
	[ContactTypeID] [int] NOT NULL,
	[EMP_ID] [int] NULL,
 CONSTRAINT [PK_HR_EmployeeContact] PRIMARY KEY CLUSTERED 
(
	[contactID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HR_LeaveType]    Script Date: 27/04/2021 4:20:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HR_LeaveType](
	[LeaveTypeID] [int] IDENTITY(1,1) NOT NULL,
	[LTname] [varchar](50) NULL,
	[isactive] [int] NULL,
 CONSTRAINT [PK_HR_LeaveType] PRIMARY KEY CLUSTERED 
(
	[LeaveTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HR_tbl_ApprovedLeave]    Script Date: 27/04/2021 4:20:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HR_tbl_ApprovedLeave](
	[ApprovedLeaveID] [int] IDENTITY(1,1) NOT NULL,
	[LeaveFrom] [date] NULL,
	[Leaveto] [date] NULL,
	[LeavetypeID] [int] NULL,
	[daterequested] [date] NULL,
	[recommended] [varchar](3) NULL,
	[approvedBy] [int] NULL,
	[medicalrequired] [varchar](3) NULL,
	[medicalForm] [varchar](50) NULL,
	[isactive] [int] NULL,
	[EMP_ID] [int] NULL,
 CONSTRAINT [PK_HR_tbl_ApprovedLeave] PRIMARY KEY CLUSTERED 
(
	[ApprovedLeaveID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HR_tbl_Emp_Leave]    Script Date: 27/04/2021 4:20:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HR_tbl_Emp_Leave](
	[EMP_ID] [int] IDENTITY(1,1) NOT NULL,
	[EmpStatus_ID] [int] NULL,
	[LeavetypeID] [int] NULL,
	[Leave_limit] [int] NULL,
	[Leave_used] [int] NULL,
	[PeriodStart] [date] NULL,
	[PeriodEnd] [date] NULL,
	[isactive] [int] NULL,
 CONSTRAINT [PK_HR_tbl_Emp_Leave] PRIMARY KEY CLUSTERED 
(
	[EMP_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HR_tbl_employmentStatus]    Script Date: 27/04/2021 4:20:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HR_tbl_employmentStatus](
	[EmpStatus_ID] [int] IDENTITY(1,1) NOT NULL,
	[estatus] [varchar](50) NULL,
	[isactive] [int] NULL,
 CONSTRAINT [PK_HR_tbl_employmentStatus] PRIMARY KEY CLUSTERED 
(
	[EmpStatus_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HR_tbl_Location]    Script Date: 27/04/2021 4:20:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HR_tbl_Location](
	[LocationID] [int] IDENTITY(1,1) NOT NULL,
	[LocationName] [varchar](50) NULL,
	[address] [varchar](50) NULL,
	[isactive] [int] NULL,
 CONSTRAINT [PK_HR_tbl_Location] PRIMARY KEY CLUSTERED 
(
	[LocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HR_tbl_ROP_report]    Script Date: 27/04/2021 4:20:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HR_tbl_ROP_report](
	[ROP_ID] [int] NOT NULL,
	[EmpID] [int] NULL,
	[DepartmentID] [int] NULL,
	[Date] [date] NULL,
	[DaysPresent] [int] NULL,
	[DaysAbsent] [int] NULL,
	[isactive] [int] NULL,
 CONSTRAINT [PK_HR_tbl_ROP_report] PRIMARY KEY CLUSTERED 
(
	[ROP_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HR_tbl_SummaryReport]    Script Date: 27/04/2021 4:20:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HR_tbl_SummaryReport](
	[Report_ID] [int] NOT NULL,
	[EmpId] [int] NULL,
	[DepartmentID] [int] NULL,
	[Date] [date] NULL,
	[SL_thismonth] [int] NULL,
	[SL_broughtforward] [int] NULL,
	[SL_total] [int] NULL,
	[CL_thismonth] [int] NULL,
	[CL_broughtforward] [int] NULL,
	[CL_total] [int] NULL,
	[TL_thismonth] [int] NULL,
	[TL_broughtforward] [int] NULL,
	[TL_total] [int] NULL,
	[ML_thismonth] [int] NULL,
	[ML_broughtforward] [int] NULL,
	[ML_total] [int] NULL,
	[remarks] [varchar](50) NULL,
	[isactive] [int] NULL,
	[confirmed] [varchar](3) NULL,
 CONSTRAINT [PK_HR_tbl_SummaryReport] PRIMARY KEY CLUSTERED 
(
	[Report_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HR_tbl_TakenLeave]    Script Date: 27/04/2021 4:20:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HR_tbl_TakenLeave](
	[TakenLeaveID] [int] IDENTITY(1,1) NOT NULL,
	[LeaveTypeID] [int] NULL,
	[isactive] [int] NULL,
	[EMP_ID] [int] NULL,
	[start_date] [datetime] NULL,
	[end_date] [datetime] NULL,
	[LeaveDate] [date] NULL,
 CONSTRAINT [PK_HR_tbl_TakenLeave] PRIMARY KEY CLUSTERED 
(
	[TakenLeaveID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_val_sex]    Script Date: 27/04/2021 4:20:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_val_sex](
	[sid] [int] IDENTITY(1,1) NOT NULL,
	[sex] [varchar](100) NOT NULL,
	[description] [varchar](max) NULL,
 CONSTRAINT [PK__tbl_val___DDDFDD364FCEA617] PRIMARY KEY CLUSTERED 
(
	[sid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Book1] ([Firstname], [Lastname], [Email], [Contact], [DateJoined], [DateLeave], [ServiceYears], [LocationID], [IsActive], [EmpStatusID], [Pos_ID], [ReportingManager]) VALUES (N'Paul', N'Kanneh', N'paul.kanneh@social.gov.tt', 5304, NULL, NULL, N'0', NULL, N'1', N'Contract', N'Director ', NULL)
GO
INSERT [dbo].[Book1] ([Firstname], [Lastname], [Email], [Contact], [DateJoined], [DateLeave], [ServiceYears], [LocationID], [IsActive], [EmpStatusID], [Pos_ID], [ReportingManager]) VALUES (N'Adesh', N'Seegobin', N'adesh.seegobin@social.gov.tt', 5308, NULL, NULL, N'0', NULL, N'1', N'Contract', N'Manager Service Delivery & Support', NULL)
GO
INSERT [dbo].[Book1] ([Firstname], [Lastname], [Email], [Contact], [DateJoined], [DateLeave], [ServiceYears], [LocationID], [IsActive], [EmpStatusID], [Pos_ID], [ReportingManager]) VALUES (N'Dave', N'Charles', N'dave.charles@social.gov.tt', 5340, NULL, NULL, N'0', NULL, N'1', N'Contract', N'Senior Information Systems Support Specialist', NULL)
GO
INSERT [dbo].[Book1] ([Firstname], [Lastname], [Email], [Contact], [DateJoined], [DateLeave], [ServiceYears], [LocationID], [IsActive], [EmpStatusID], [Pos_ID], [ReportingManager]) VALUES (N'Leslie-Ann', N'Douglas', N'leslieann.douglas@social.gov.tt', 5309, NULL, NULL, N'0', NULL, N'1', N'Contract', N'Technical Officer', NULL)
GO
INSERT [dbo].[Book1] ([Firstname], [Lastname], [Email], [Contact], [DateJoined], [DateLeave], [ServiceYears], [LocationID], [IsActive], [EmpStatusID], [Pos_ID], [ReportingManager]) VALUES (N'Kevon', N'Gibbs', N'kevon.gibbs@social.gov.tt', 5315, NULL, NULL, N'0', NULL, N'1', N'Contract', N'Technical Officer', NULL)
GO
INSERT [dbo].[Book1] ([Firstname], [Lastname], [Email], [Contact], [DateJoined], [DateLeave], [ServiceYears], [LocationID], [IsActive], [EmpStatusID], [Pos_ID], [ReportingManager]) VALUES (N'Michael', N'Pierre', N'michael.pierre@social.gov.tt', 5332, NULL, NULL, N'0', NULL, N'1', N'Contract', N'Technical Officer', NULL)
GO
INSERT [dbo].[Book1] ([Firstname], [Lastname], [Email], [Contact], [DateJoined], [DateLeave], [ServiceYears], [LocationID], [IsActive], [EmpStatusID], [Pos_ID], [ReportingManager]) VALUES (N'Timothy', N'Geelalsingh', N'timothy.geelalsingh@social.gov.tt', 5318, NULL, NULL, N'0', NULL, N'1', N'Contract', N'Technical Officer', NULL)
GO
INSERT [dbo].[Book1] ([Firstname], [Lastname], [Email], [Contact], [DateJoined], [DateLeave], [ServiceYears], [LocationID], [IsActive], [EmpStatusID], [Pos_ID], [ReportingManager]) VALUES (N'Keron', N'Joseph', N'keron.joseph@social.gov.tt', 5316, NULL, NULL, N'0', NULL, N'1', N'Contract', N'Technical Officer', NULL)
GO
INSERT [dbo].[Book1] ([Firstname], [Lastname], [Email], [Contact], [DateJoined], [DateLeave], [ServiceYears], [LocationID], [IsActive], [EmpStatusID], [Pos_ID], [ReportingManager]) VALUES (N'Kyle', N'Scott', N'kyle.scott@social.gov.tt', NULL, NULL, NULL, N'0', NULL, N'1', N'Contract', N'Technical Officer', NULL)
GO
INSERT [dbo].[Book1] ([Firstname], [Lastname], [Email], [Contact], [DateJoined], [DateLeave], [ServiceYears], [LocationID], [IsActive], [EmpStatusID], [Pos_ID], [ReportingManager]) VALUES (N'Reena', N'Pearalal', N'reena.pearalal@social.gov.tt', 5312, NULL, NULL, N'0', NULL, N'1', N'Contract', N'Business Operations Assistant I (Help desk)', NULL)
GO
INSERT [dbo].[Book1] ([Firstname], [Lastname], [Email], [Contact], [DateJoined], [DateLeave], [ServiceYears], [LocationID], [IsActive], [EmpStatusID], [Pos_ID], [ReportingManager]) VALUES (N'Carlan', N'Spooner', N'carlan.spooner@social.gov.tt', 5311, NULL, NULL, N'0', NULL, N'1', N'Contract', N'Business Operations Assistant I (Help Desk)', NULL)
GO
INSERT [dbo].[Book1] ([Firstname], [Lastname], [Email], [Contact], [DateJoined], [DateLeave], [ServiceYears], [LocationID], [IsActive], [EmpStatusID], [Pos_ID], [ReportingManager]) VALUES (N'Charles', N'Glasgow', N'charles.glasgow@social.gov.tt', 5305, NULL, NULL, N'0', NULL, N'1', N'Contract', N'Manager Solutions Development and Implementation', NULL)
GO
INSERT [dbo].[Book1] ([Firstname], [Lastname], [Email], [Contact], [DateJoined], [DateLeave], [ServiceYears], [LocationID], [IsActive], [EmpStatusID], [Pos_ID], [ReportingManager]) VALUES (N'Sharlan', N'Deosaran', N'sharlan.deosaran@social.gov.tt', 5337, NULL, NULL, N'0', NULL, N'1', N'Contract', N'Senior Information Systems Specialist ', NULL)
GO
INSERT [dbo].[Book1] ([Firstname], [Lastname], [Email], [Contact], [DateJoined], [DateLeave], [ServiceYears], [LocationID], [IsActive], [EmpStatusID], [Pos_ID], [ReportingManager]) VALUES (N'Gerald', N'Martinez', N'gerald.martinez@social.gov.tt', 5320, NULL, NULL, N'0', NULL, N'1', N'Contract', N'Senior Database Specialist', NULL)
GO
INSERT [dbo].[Book1] ([Firstname], [Lastname], [Email], [Contact], [DateJoined], [DateLeave], [ServiceYears], [LocationID], [IsActive], [EmpStatusID], [Pos_ID], [ReportingManager]) VALUES (N'Sean', N'Defour', N'sean.defour@social.gov.tt', 5321, NULL, NULL, N'0', NULL, N'1', N'Contract', N'Database Specialist', NULL)
GO
INSERT [dbo].[Book1] ([Firstname], [Lastname], [Email], [Contact], [DateJoined], [DateLeave], [ServiceYears], [LocationID], [IsActive], [EmpStatusID], [Pos_ID], [ReportingManager]) VALUES (N'Evrol', N'Mark', N'evrol.mark@social.gov.tt', 5333, NULL, NULL, N'0', NULL, N'1', N'Contract', N'Information Systems Specialist', NULL)
GO
INSERT [dbo].[Book1] ([Firstname], [Lastname], [Email], [Contact], [DateJoined], [DateLeave], [ServiceYears], [LocationID], [IsActive], [EmpStatusID], [Pos_ID], [ReportingManager]) VALUES (N'Napoleon', N'Okunna', N'napoleon.okunna@social.gov.tt', 5331, NULL, NULL, N'0', NULL, N'1', N'Contract', N'Analyst/Programmer', NULL)
GO
INSERT [dbo].[Book1] ([Firstname], [Lastname], [Email], [Contact], [DateJoined], [DateLeave], [ServiceYears], [LocationID], [IsActive], [EmpStatusID], [Pos_ID], [ReportingManager]) VALUES (N'JD', N'Sookdeo', N'jd.sookdeo@social.gov.tt', 5378, NULL, NULL, N'0', NULL, N'1', N'OJT', N'On the Job Trainee', NULL)
GO
INSERT [dbo].[Book1] ([Firstname], [Lastname], [Email], [Contact], [DateJoined], [DateLeave], [ServiceYears], [LocationID], [IsActive], [EmpStatusID], [Pos_ID], [ReportingManager]) VALUES (N'Justin', N'Patterson', N'justin.patterson@social.gov.tt', 5339, NULL, NULL, N'0', NULL, N'1', N'OJT', N'On the Job Trainee', NULL)
GO
INSERT [dbo].[Book1] ([Firstname], [Lastname], [Email], [Contact], [DateJoined], [DateLeave], [ServiceYears], [LocationID], [IsActive], [EmpStatusID], [Pos_ID], [ReportingManager]) VALUES (N'Fariah', N'Ali', N'fariah.ali@social.gov.tt', 5338, NULL, NULL, N'0', NULL, N'1', N'OJT', N'On the Job Trainee', NULL)
GO
INSERT [dbo].[Book1] ([Firstname], [Lastname], [Email], [Contact], [DateJoined], [DateLeave], [ServiceYears], [LocationID], [IsActive], [EmpStatusID], [Pos_ID], [ReportingManager]) VALUES (N'Destine', N'Christopher', N'destine.christopher@social.gov.tt', 5318, NULL, NULL, N'0', NULL, N'1', N'OJT', N'On the Job Trainee', NULL)
GO
INSERT [dbo].[Book1] ([Firstname], [Lastname], [Email], [Contact], [DateJoined], [DateLeave], [ServiceYears], [LocationID], [IsActive], [EmpStatusID], [Pos_ID], [ReportingManager]) VALUES (N'Sara', N'Shoon', N'sara.shoon@social.gov.tt', 5307, NULL, NULL, N'0', NULL, N'1', N'OJT', N'On the Job Trainee', NULL)
GO
INSERT [dbo].[Book1] ([Firstname], [Lastname], [Email], [Contact], [DateJoined], [DateLeave], [ServiceYears], [LocationID], [IsActive], [EmpStatusID], [Pos_ID], [ReportingManager]) VALUES (N'Jehvern', N'Dubois', N'jehvern.dubois@social.gov.tt', 5350, NULL, NULL, N'0', NULL, N'1', N'OJT', N'On the Job Trainee', NULL)
GO
INSERT [dbo].[Book1] ([Firstname], [Lastname], [Email], [Contact], [DateJoined], [DateLeave], [ServiceYears], [LocationID], [IsActive], [EmpStatusID], [Pos_ID], [ReportingManager]) VALUES (N'Chris', N'Scott', N'Christopher.scott@social.gov.tt', 5336, NULL, NULL, N'0', NULL, N'1', N'Contract', N'Security Specialist', NULL)
GO
INSERT [dbo].[Book1] ([Firstname], [Lastname], [Email], [Contact], [DateJoined], [DateLeave], [ServiceYears], [LocationID], [IsActive], [EmpStatusID], [Pos_ID], [ReportingManager]) VALUES (N'Rajesh', N'Nandram', N'rajesh.nandram@social.gov.tt', 5307, NULL, NULL, N'0', NULL, N'1', N'Contract', N'Senior Network Specialist', NULL)
GO
INSERT [dbo].[Book1] ([Firstname], [Lastname], [Email], [Contact], [DateJoined], [DateLeave], [ServiceYears], [LocationID], [IsActive], [EmpStatusID], [Pos_ID], [ReportingManager]) VALUES (N'Sheldon', N'Mohammed', N'sheldon.mohammed@social.gov.tt', NULL, NULL, NULL, N'0', NULL, N'1', N'Contract', N'Networking Specialist', NULL)
GO
INSERT [dbo].[Book1] ([Firstname], [Lastname], [Email], [Contact], [DateJoined], [DateLeave], [ServiceYears], [LocationID], [IsActive], [EmpStatusID], [Pos_ID], [ReportingManager]) VALUES (N'Ameair', N'Ibrahim', N'ameair.ibrahim@social.gov.tt', 5331, NULL, NULL, N'0', NULL, N'1', N'Contract', N'Technical Officer', NULL)
GO
INSERT [dbo].[Book1] ([Firstname], [Lastname], [Email], [Contact], [DateJoined], [DateLeave], [ServiceYears], [LocationID], [IsActive], [EmpStatusID], [Pos_ID], [ReportingManager]) VALUES (N'Claude', N'Henry-Subance', N'claude-henry.subance@social.gov.tt', 5331, NULL, NULL, N'0', NULL, N'1', N'OJT', N'On the Job Trainee', NULL)
GO
INSERT [dbo].[Book1] ([Firstname], [Lastname], [Email], [Contact], [DateJoined], [DateLeave], [ServiceYears], [LocationID], [IsActive], [EmpStatusID], [Pos_ID], [ReportingManager]) VALUES (N'Mikel', N'Garcia', N'mikel.garcia@social.gov.tt', 5314, NULL, NULL, N'0', NULL, N'1', N'OJT', N'On the Job Trainee', NULL)
GO
INSERT [dbo].[Book1] ([Firstname], [Lastname], [Email], [Contact], [DateJoined], [DateLeave], [ServiceYears], [LocationID], [IsActive], [EmpStatusID], [Pos_ID], [ReportingManager]) VALUES (N'Whitnii', N'Ali-Khan', N'whitnii.ali@social.gov.tt', 5302, NULL, NULL, N'0', NULL, N'1', N'Contract', N'Business Operations Assistant I', NULL)
GO
INSERT [dbo].[Book1] ([Firstname], [Lastname], [Email], [Contact], [DateJoined], [DateLeave], [ServiceYears], [LocationID], [IsActive], [EmpStatusID], [Pos_ID], [ReportingManager]) VALUES (N'Jevon', N'Phillip', N'jevon.phillip@social.gov.tt', 5313, NULL, NULL, N'0', NULL, N'1', N'Contract', N'Business Operations Assistant I', NULL)
GO
INSERT [dbo].[Book1] ([Firstname], [Lastname], [Email], [Contact], [DateJoined], [DateLeave], [ServiceYears], [LocationID], [IsActive], [EmpStatusID], [Pos_ID], [ReportingManager]) VALUES (N'Shani', N'Gay', N'shani.gay@social.gov.tt', 5303, NULL, NULL, N'0', NULL, N'1', N'Contract', N'Business Operations Assistant I', NULL)
GO
INSERT [dbo].[Book1] ([Firstname], [Lastname], [Email], [Contact], [DateJoined], [DateLeave], [ServiceYears], [LocationID], [IsActive], [EmpStatusID], [Pos_ID], [ReportingManager]) VALUES (N'Paul', N'Kanneh', N'paul.kanneh@social.gov.tt', 5304, NULL, NULL, N'0', NULL, N'1', N'Contract', N'Director ', NULL)
GO
INSERT [dbo].[Book1] ([Firstname], [Lastname], [Email], [Contact], [DateJoined], [DateLeave], [ServiceYears], [LocationID], [IsActive], [EmpStatusID], [Pos_ID], [ReportingManager]) VALUES (N'Adesh', N'Seegobin', N'adesh.seegobin@social.gov.tt', 5308, NULL, NULL, N'0', NULL, N'1', N'Contract', N'Manager Service Delivery & Support', NULL)
GO
INSERT [dbo].[Book1] ([Firstname], [Lastname], [Email], [Contact], [DateJoined], [DateLeave], [ServiceYears], [LocationID], [IsActive], [EmpStatusID], [Pos_ID], [ReportingManager]) VALUES (N'Dave', N'Charles', N'dave.charles@social.gov.tt', 5340, NULL, NULL, N'0', NULL, N'1', N'Contract', N'Senior Information Systems Support Specialist', NULL)
GO
INSERT [dbo].[Book1] ([Firstname], [Lastname], [Email], [Contact], [DateJoined], [DateLeave], [ServiceYears], [LocationID], [IsActive], [EmpStatusID], [Pos_ID], [ReportingManager]) VALUES (N'Leslie-Ann', N'Douglas', N'leslieann.douglas@social.gov.tt', 5309, NULL, NULL, N'0', NULL, N'1', N'Contract', N'Technical Officer', NULL)
GO
INSERT [dbo].[Book1] ([Firstname], [Lastname], [Email], [Contact], [DateJoined], [DateLeave], [ServiceYears], [LocationID], [IsActive], [EmpStatusID], [Pos_ID], [ReportingManager]) VALUES (N'Kevon', N'Gibbs', N'kevon.gibbs@social.gov.tt', 5315, NULL, NULL, N'0', NULL, N'1', N'Contract', N'Technical Officer', NULL)
GO
INSERT [dbo].[Book1] ([Firstname], [Lastname], [Email], [Contact], [DateJoined], [DateLeave], [ServiceYears], [LocationID], [IsActive], [EmpStatusID], [Pos_ID], [ReportingManager]) VALUES (N'Michael', N'Pierre', N'michael.pierre@social.gov.tt', 5332, NULL, NULL, N'0', NULL, N'1', N'Contract', N'Technical Officer', NULL)
GO
INSERT [dbo].[Book1] ([Firstname], [Lastname], [Email], [Contact], [DateJoined], [DateLeave], [ServiceYears], [LocationID], [IsActive], [EmpStatusID], [Pos_ID], [ReportingManager]) VALUES (N'Timothy', N'Geelalsingh', N'timothy.geelalsingh@social.gov.tt', 5318, NULL, NULL, N'0', NULL, N'1', N'Contract', N'Technical Officer', NULL)
GO
INSERT [dbo].[Book1] ([Firstname], [Lastname], [Email], [Contact], [DateJoined], [DateLeave], [ServiceYears], [LocationID], [IsActive], [EmpStatusID], [Pos_ID], [ReportingManager]) VALUES (N'Keron', N'Joseph', N'keron.joseph@social.gov.tt', 5316, NULL, NULL, N'0', NULL, N'1', N'Contract', N'Technical Officer', NULL)
GO
INSERT [dbo].[Book1] ([Firstname], [Lastname], [Email], [Contact], [DateJoined], [DateLeave], [ServiceYears], [LocationID], [IsActive], [EmpStatusID], [Pos_ID], [ReportingManager]) VALUES (N'Kyle', N'Scott', N'kyle.scott@social.gov.tt', NULL, NULL, NULL, N'0', NULL, N'1', N'Contract', N'Technical Officer', NULL)
GO
INSERT [dbo].[Book1] ([Firstname], [Lastname], [Email], [Contact], [DateJoined], [DateLeave], [ServiceYears], [LocationID], [IsActive], [EmpStatusID], [Pos_ID], [ReportingManager]) VALUES (N'Reena', N'Pearalal', N'reena.pearalal@social.gov.tt', 5312, NULL, NULL, N'0', NULL, N'1', N'Contract', N'Business Operations Assistant I (Help desk)', NULL)
GO
INSERT [dbo].[Book1] ([Firstname], [Lastname], [Email], [Contact], [DateJoined], [DateLeave], [ServiceYears], [LocationID], [IsActive], [EmpStatusID], [Pos_ID], [ReportingManager]) VALUES (N'Carlan', N'Spooner', N'carlan.spooner@social.gov.tt', 5311, NULL, NULL, N'0', NULL, N'1', N'Contract', N'Business Operations Assistant I (Help Desk)', NULL)
GO
INSERT [dbo].[Book1] ([Firstname], [Lastname], [Email], [Contact], [DateJoined], [DateLeave], [ServiceYears], [LocationID], [IsActive], [EmpStatusID], [Pos_ID], [ReportingManager]) VALUES (N'Charles', N'Glasgow', N'charles.glasgow@social.gov.tt', 5305, NULL, NULL, N'0', NULL, N'1', N'Contract', N'Manager Solutions Development and Implementation', NULL)
GO
INSERT [dbo].[Book1] ([Firstname], [Lastname], [Email], [Contact], [DateJoined], [DateLeave], [ServiceYears], [LocationID], [IsActive], [EmpStatusID], [Pos_ID], [ReportingManager]) VALUES (N'Sharlan', N'Deosaran', N'sharlan.deosaran@social.gov.tt', 5337, NULL, NULL, N'0', NULL, N'1', N'Contract', N'Senior Information Systems Specialist ', NULL)
GO
INSERT [dbo].[Book1] ([Firstname], [Lastname], [Email], [Contact], [DateJoined], [DateLeave], [ServiceYears], [LocationID], [IsActive], [EmpStatusID], [Pos_ID], [ReportingManager]) VALUES (N'Gerald', N'Martinez', N'gerald.martinez@social.gov.tt', 5320, NULL, NULL, N'0', NULL, N'1', N'Contract', N'Senior Database Specialist', NULL)
GO
INSERT [dbo].[Book1] ([Firstname], [Lastname], [Email], [Contact], [DateJoined], [DateLeave], [ServiceYears], [LocationID], [IsActive], [EmpStatusID], [Pos_ID], [ReportingManager]) VALUES (N'Sean', N'Defour', N'sean.defour@social.gov.tt', 5321, NULL, NULL, N'0', NULL, N'1', N'Contract', N'Database Specialist', NULL)
GO
INSERT [dbo].[Book1] ([Firstname], [Lastname], [Email], [Contact], [DateJoined], [DateLeave], [ServiceYears], [LocationID], [IsActive], [EmpStatusID], [Pos_ID], [ReportingManager]) VALUES (N'Evrol', N'Mark', N'evrol.mark@social.gov.tt', 5333, NULL, NULL, N'0', NULL, N'1', N'Contract', N'Information Systems Specialist', NULL)
GO
INSERT [dbo].[Book1] ([Firstname], [Lastname], [Email], [Contact], [DateJoined], [DateLeave], [ServiceYears], [LocationID], [IsActive], [EmpStatusID], [Pos_ID], [ReportingManager]) VALUES (N'Napoleon', N'Okunna', N'napoleon.okunna@social.gov.tt', 5331, NULL, NULL, N'0', NULL, N'1', N'Contract', N'Analyst/Programmer', NULL)
GO
INSERT [dbo].[Book1] ([Firstname], [Lastname], [Email], [Contact], [DateJoined], [DateLeave], [ServiceYears], [LocationID], [IsActive], [EmpStatusID], [Pos_ID], [ReportingManager]) VALUES (N'JD', N'Sookdeo', N'jd.sookdeo@social.gov.tt', 5378, NULL, NULL, N'0', NULL, N'1', N'OJT', N'On the Job Trainee', NULL)
GO
INSERT [dbo].[Book1] ([Firstname], [Lastname], [Email], [Contact], [DateJoined], [DateLeave], [ServiceYears], [LocationID], [IsActive], [EmpStatusID], [Pos_ID], [ReportingManager]) VALUES (N'Justin', N'Patterson', N'justin.patterson@social.gov.tt', 5339, NULL, NULL, N'0', NULL, N'1', N'OJT', N'On the Job Trainee', NULL)
GO
INSERT [dbo].[Book1] ([Firstname], [Lastname], [Email], [Contact], [DateJoined], [DateLeave], [ServiceYears], [LocationID], [IsActive], [EmpStatusID], [Pos_ID], [ReportingManager]) VALUES (N'Fariah', N'Ali', N'fariah.ali@social.gov.tt', 5338, NULL, NULL, N'0', NULL, N'1', N'OJT', N'On the Job Trainee', NULL)
GO
INSERT [dbo].[Book1] ([Firstname], [Lastname], [Email], [Contact], [DateJoined], [DateLeave], [ServiceYears], [LocationID], [IsActive], [EmpStatusID], [Pos_ID], [ReportingManager]) VALUES (N'Destine', N'Christopher', N'destine.christopher@social.gov.tt', 5318, NULL, NULL, N'0', NULL, N'1', N'OJT', N'On the Job Trainee', NULL)
GO
INSERT [dbo].[Book1] ([Firstname], [Lastname], [Email], [Contact], [DateJoined], [DateLeave], [ServiceYears], [LocationID], [IsActive], [EmpStatusID], [Pos_ID], [ReportingManager]) VALUES (N'Sara', N'Shoon', N'sara.shoon@social.gov.tt', 5307, NULL, NULL, N'0', NULL, N'1', N'OJT', N'On the Job Trainee', NULL)
GO
INSERT [dbo].[Book1] ([Firstname], [Lastname], [Email], [Contact], [DateJoined], [DateLeave], [ServiceYears], [LocationID], [IsActive], [EmpStatusID], [Pos_ID], [ReportingManager]) VALUES (N'Jehvern', N'Dubois', N'jehvern.dubois@social.gov.tt', 5350, NULL, NULL, N'0', NULL, N'1', N'OJT', N'On the Job Trainee', NULL)
GO
INSERT [dbo].[Book1] ([Firstname], [Lastname], [Email], [Contact], [DateJoined], [DateLeave], [ServiceYears], [LocationID], [IsActive], [EmpStatusID], [Pos_ID], [ReportingManager]) VALUES (N'Chris', N'Scott', N'Christopher.scott@social.gov.tt', 5336, NULL, NULL, N'0', NULL, N'1', N'Contract', N'Security Specialist', NULL)
GO
INSERT [dbo].[Book1] ([Firstname], [Lastname], [Email], [Contact], [DateJoined], [DateLeave], [ServiceYears], [LocationID], [IsActive], [EmpStatusID], [Pos_ID], [ReportingManager]) VALUES (N'Rajesh', N'Nandram', N'rajesh.nandram@social.gov.tt', 5307, NULL, NULL, N'0', NULL, N'1', N'Contract', N'Senior Network Specialist', NULL)
GO
INSERT [dbo].[Book1] ([Firstname], [Lastname], [Email], [Contact], [DateJoined], [DateLeave], [ServiceYears], [LocationID], [IsActive], [EmpStatusID], [Pos_ID], [ReportingManager]) VALUES (N'Sheldon', N'Mohammed', N'sheldon.mohammed@social.gov.tt', NULL, NULL, NULL, N'0', NULL, N'1', N'Contract', N'Networking Specialist', NULL)
GO
INSERT [dbo].[Book1] ([Firstname], [Lastname], [Email], [Contact], [DateJoined], [DateLeave], [ServiceYears], [LocationID], [IsActive], [EmpStatusID], [Pos_ID], [ReportingManager]) VALUES (N'Ameair', N'Ibrahim', N'ameair.ibrahim@social.gov.tt', 5331, NULL, NULL, N'0', NULL, N'1', N'Contract', N'Technical Officer', NULL)
GO
INSERT [dbo].[Book1] ([Firstname], [Lastname], [Email], [Contact], [DateJoined], [DateLeave], [ServiceYears], [LocationID], [IsActive], [EmpStatusID], [Pos_ID], [ReportingManager]) VALUES (N'Claude', N'Henry-Subance', N'claude-henry.subance@social.gov.tt', 5331, NULL, NULL, N'0', NULL, N'1', N'OJT', N'On the Job Trainee', NULL)
GO
INSERT [dbo].[Book1] ([Firstname], [Lastname], [Email], [Contact], [DateJoined], [DateLeave], [ServiceYears], [LocationID], [IsActive], [EmpStatusID], [Pos_ID], [ReportingManager]) VALUES (N'Mikel', N'Garcia', N'mikel.garcia@social.gov.tt', 5314, NULL, NULL, N'0', NULL, N'1', N'OJT', N'On the Job Trainee', NULL)
GO
INSERT [dbo].[Book1] ([Firstname], [Lastname], [Email], [Contact], [DateJoined], [DateLeave], [ServiceYears], [LocationID], [IsActive], [EmpStatusID], [Pos_ID], [ReportingManager]) VALUES (N'Whitnii', N'Ali-Khan', N'whitnii.ali@social.gov.tt', 5302, NULL, NULL, N'0', NULL, N'1', N'Contract', N'Business Operations Assistant I', NULL)
GO
INSERT [dbo].[Book1] ([Firstname], [Lastname], [Email], [Contact], [DateJoined], [DateLeave], [ServiceYears], [LocationID], [IsActive], [EmpStatusID], [Pos_ID], [ReportingManager]) VALUES (N'Jevon', N'Phillip', N'jevon.phillip@social.gov.tt', 5313, NULL, NULL, N'0', NULL, N'1', N'Contract', N'Business Operations Assistant I', NULL)
GO
INSERT [dbo].[Book1] ([Firstname], [Lastname], [Email], [Contact], [DateJoined], [DateLeave], [ServiceYears], [LocationID], [IsActive], [EmpStatusID], [Pos_ID], [ReportingManager]) VALUES (N'Shani', N'Gay', N'shani.gay@social.gov.tt', 5303, NULL, NULL, N'0', NULL, N'1', N'Contract', N'Business Operations Assistant I', NULL)
GO
SET IDENTITY_INSERT [dbo].[HR_AttendanceRegister] ON 
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (1, 10, CAST(N'2021-04-03' AS Date), CAST(N'2021-04-03T04:00:00' AS SmallDateTime), CAST(N'2021-04-03T07:00:00' AS SmallDateTime), N'aaaaa', NULL, N'SOCIAL\napoleon.okunna', 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (5, 10, CAST(N'2021-05-03' AS Date), CAST(N'2021-05-03T06:00:00' AS SmallDateTime), CAST(N'2021-05-03T18:00:00' AS SmallDateTime), N'', CAST(N'2021-04-27T11:25:12.483' AS DateTime), N'SOCIAL\napoleon.okunna', 0)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (6, 22, CAST(N'2021-04-03' AS Date), CAST(N'2021-04-03T07:00:00' AS SmallDateTime), CAST(N'2021-04-03T17:00:00' AS SmallDateTime), N'', CAST(N'2021-04-27T12:52:06.663' AS DateTime), N'SOCIAL\evrol.mark', 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (7, 7, CAST(N'2021-04-03' AS Date), CAST(N'2021-04-03T06:00:00' AS SmallDateTime), CAST(N'2021-04-03T17:00:00' AS SmallDateTime), N'', CAST(N'2021-04-27T12:53:01.090' AS DateTime), N'SOCIAL\napoleon.okunna', 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (8, 9, CAST(N'2021-05-03' AS Date), CAST(N'2021-05-03T07:00:00' AS SmallDateTime), CAST(N'2021-05-03T17:00:00' AS SmallDateTime), N'', CAST(N'2021-04-27T12:54:19.840' AS DateTime), N'SOCIAL\napoleon.okunna', 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (9, 10, CAST(N'2021-02-03' AS Date), CAST(N'2021-02-03T05:00:00' AS SmallDateTime), CAST(N'2021-02-03T17:00:00' AS SmallDateTime), N'', CAST(N'2021-04-27T12:58:27.417' AS DateTime), N'SOCIAL\evrol.mark', 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (10, 8, CAST(N'2021-05-03' AS Date), CAST(N'2021-05-03T06:00:00' AS SmallDateTime), CAST(N'2021-05-03T08:00:00' AS SmallDateTime), N'', CAST(N'2021-04-27T13:03:40.677' AS DateTime), N'SOCIAL\napoleon.okunna', 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (11, 10, CAST(N'2021-01-03' AS Date), CAST(N'2021-01-03T05:00:00' AS SmallDateTime), CAST(N'2021-01-03T17:00:00' AS SmallDateTime), N'', CAST(N'2021-04-27T13:04:12.880' AS DateTime), N'SOCIAL\evrol.mark', 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (12, 14, CAST(N'2021-04-03' AS Date), CAST(N'2021-04-03T08:00:00' AS SmallDateTime), CAST(N'2021-04-03T09:00:00' AS SmallDateTime), N'aaaaa', CAST(N'2021-04-27T13:04:33.093' AS DateTime), N'SOCIAL\napoleon.okunna', 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (13, 8, CAST(N'2021-05-03' AS Date), CAST(N'2021-05-03T07:00:00' AS SmallDateTime), CAST(N'2021-05-03T17:00:00' AS SmallDateTime), N'', CAST(N'2021-04-27T13:07:33.587' AS DateTime), N'SOCIAL\napoleon.okunna', 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (14, 15, CAST(N'2021-04-03' AS Date), CAST(N'2021-04-03T08:00:00' AS SmallDateTime), CAST(N'2021-04-03T18:00:00' AS SmallDateTime), N'', CAST(N'2021-04-27T13:11:04.560' AS DateTime), N'SOCIAL\napoleon.okunna', 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (15, 16, CAST(N'2021-04-03' AS Date), CAST(N'2021-04-03T06:00:00' AS SmallDateTime), CAST(N'2021-04-03T18:00:00' AS SmallDateTime), N'', CAST(N'2021-04-27T13:12:46.593' AS DateTime), N'SOCIAL\napoleon.okunna', 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (16, 16, CAST(N'2021-04-03' AS Date), CAST(N'2021-04-03T07:00:00' AS SmallDateTime), CAST(N'2021-04-03T17:00:00' AS SmallDateTime), N'', CAST(N'2021-04-27T13:13:36.583' AS DateTime), N'SOCIAL\napoleon.okunna', 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (17, 20, CAST(N'2021-04-03' AS Date), CAST(N'2021-04-03T07:00:00' AS SmallDateTime), CAST(N'2021-04-03T18:00:00' AS SmallDateTime), N'', CAST(N'2021-04-27T13:21:35.080' AS DateTime), N'SOCIAL\napoleon.okunna', 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (18, 20, CAST(N'2021-05-03' AS Date), CAST(N'2021-05-03T07:00:00' AS SmallDateTime), CAST(N'2021-05-03T17:00:00' AS SmallDateTime), N'', CAST(N'2021-04-27T13:22:25.147' AS DateTime), N'SOCIAL\napoleon.okunna', 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (19, 20, CAST(N'2021-12-03' AS Date), CAST(N'2021-12-03T07:00:00' AS SmallDateTime), CAST(N'2021-12-03T17:00:00' AS SmallDateTime), N'', CAST(N'2021-04-27T13:22:43.833' AS DateTime), N'SOCIAL\napoleon.okunna', 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (20, 16, CAST(N'2021-04-03' AS Date), CAST(N'2021-04-03T07:00:00' AS SmallDateTime), CAST(N'2021-04-03T18:00:00' AS SmallDateTime), N'', CAST(N'2021-04-27T13:24:04.773' AS DateTime), N'SOCIAL\napoleon.okunna', 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (21, 16, CAST(N'2021-03-03' AS Date), CAST(N'2021-03-03T07:00:00' AS SmallDateTime), CAST(N'2021-03-03T18:00:00' AS SmallDateTime), N'', NULL, N'SOCIAL\napoleon.okunna', 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (22, 15, CAST(N'2021-04-03' AS Date), CAST(N'2021-04-03T06:00:00' AS SmallDateTime), CAST(N'2021-04-03T18:00:00' AS SmallDateTime), N'', CAST(N'2021-04-27T13:34:48.240' AS DateTime), N'SOCIAL\napoleon.okunna', 0)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (23, 21, CAST(N'2021-03-30' AS Date), CAST(N'2021-03-30T05:00:00' AS SmallDateTime), CAST(N'2021-03-30T18:00:00' AS SmallDateTime), N'', CAST(N'2021-04-27T13:37:22.523' AS DateTime), N'SOCIAL\napoleon.okunna', 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (24, 17, CAST(N'2021-03-30' AS Date), CAST(N'2021-03-30T05:00:00' AS SmallDateTime), CAST(N'2021-03-30T18:00:00' AS SmallDateTime), N'', CAST(N'2021-04-27T13:38:02.743' AS DateTime), N'SOCIAL\napoleon.okunna', 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (25, 17, CAST(N'2021-04-10' AS Date), CAST(N'2021-04-10T05:00:00' AS SmallDateTime), CAST(N'2021-04-10T18:00:00' AS SmallDateTime), N'', CAST(N'2021-04-27T13:38:17.200' AS DateTime), N'SOCIAL\napoleon.okunna', 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (26, 9, CAST(N'2021-04-10' AS Date), CAST(N'2021-04-10T05:00:00' AS SmallDateTime), CAST(N'2021-04-10T18:00:00' AS SmallDateTime), N'', CAST(N'2021-04-27T13:38:29.953' AS DateTime), N'SOCIAL\napoleon.okunna', 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (27, 21, CAST(N'2021-07-16' AS Date), CAST(N'2021-07-16T05:00:00' AS SmallDateTime), CAST(N'2021-07-16T18:00:00' AS SmallDateTime), N'', CAST(N'2021-04-27T13:39:13.623' AS DateTime), N'SOCIAL\napoleon.okunna', 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (28, 19, CAST(N'2021-04-01' AS Date), CAST(N'2021-04-01T07:55:00' AS SmallDateTime), CAST(N'2021-04-01T17:50:00' AS SmallDateTime), N'Test', NULL, N'SOCIAL\napoleon.okunna', 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (31, 20, CAST(N'2021-04-03' AS Date), CAST(N'2021-04-03T08:00:00' AS SmallDateTime), CAST(N'2021-04-03T17:00:00' AS SmallDateTime), N'', CAST(N'2021-04-27T14:02:16.873' AS DateTime), N'SOCIAL\napoleon.okunna', 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (40, 23, CAST(N'2021-03-31' AS Date), CAST(N'2021-03-31T07:00:00' AS SmallDateTime), CAST(N'2021-03-31T18:00:00' AS SmallDateTime), N'', CAST(N'2021-04-27T14:34:34.013' AS DateTime), N'SOCIAL\napoleon.okunna', 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (41, 14, CAST(N'2021-03-31' AS Date), CAST(N'2021-03-31T07:00:00' AS SmallDateTime), CAST(N'2021-03-31T09:00:00' AS SmallDateTime), N'aaaaa', CAST(N'2021-04-27T14:40:33.573' AS DateTime), N'SOCIAL\napoleon.okunna', 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (42, 8, CAST(N'2021-03-25' AS Date), CAST(N'2021-03-25T05:00:00' AS SmallDateTime), CAST(N'2021-03-25T14:00:00' AS SmallDateTime), N'', CAST(N'2021-04-27T14:42:15.763' AS DateTime), N'SOCIAL\napoleon.okunna', 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (43, 8, CAST(N'2021-03-31' AS Date), CAST(N'2021-03-31T05:00:00' AS SmallDateTime), CAST(N'2021-03-31T18:00:00' AS SmallDateTime), N'', CAST(N'2021-04-27T14:42:45.790' AS DateTime), N'SOCIAL\napoleon.okunna', 0)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (44, 22, CAST(N'2021-04-14' AS Date), CAST(N'2021-04-14T11:00:00' AS SmallDateTime), CAST(N'2021-04-14T18:00:00' AS SmallDateTime), N'', CAST(N'2021-04-27T14:43:34.273' AS DateTime), N'SOCIAL\napoleon.okunna', 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (46, 22, CAST(N'2021-04-29' AS Date), CAST(N'2021-04-29T11:00:00' AS SmallDateTime), CAST(N'2021-04-29T18:00:00' AS SmallDateTime), N'', CAST(N'2021-04-27T14:44:41.853' AS DateTime), N'SOCIAL\napoleon.okunna', 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (47, 22, CAST(N'2021-04-30' AS Date), CAST(N'2021-04-30T05:00:00' AS SmallDateTime), CAST(N'2021-04-30T18:00:00' AS SmallDateTime), N'', CAST(N'2021-04-27T14:45:13.863' AS DateTime), N'SOCIAL\napoleon.okunna', 0)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (55, 21, CAST(N'2021-04-26' AS Date), CAST(N'2021-04-26T08:00:00' AS SmallDateTime), CAST(N'2021-04-26T16:30:00' AS SmallDateTime), N'Overtime worked', NULL, N'SOCIAL\napoleon.okunna', 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (56, 21, CAST(N'2021-04-27' AS Date), CAST(N'2021-04-27T08:00:00' AS SmallDateTime), CAST(N'2021-04-27T16:00:00' AS SmallDateTime), N'', CAST(N'2021-04-27T15:35:35.190' AS DateTime), N'SOCIAL\napoleon.okunna', 0)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (57, 21, CAST(N'2021-03-04' AS Date), CAST(N'2021-03-04T06:00:00' AS SmallDateTime), CAST(N'2021-03-04T18:00:00' AS SmallDateTime), N'', CAST(N'2021-04-27T16:10:18.463' AS DateTime), N'SOCIAL\napoleon.okunna', 1)
GO
SET IDENTITY_INSERT [dbo].[HR_AttendanceRegister] OFF
GO
SET IDENTITY_INSERT [dbo].[HR_ContactType] ON 
GO
INSERT [dbo].[HR_ContactType] ([ContactTypeID], [ContactTypeName]) VALUES (1, N'Extension')
GO
INSERT [dbo].[HR_ContactType] ([ContactTypeID], [ContactTypeName]) VALUES (2, N'Mobile')
GO
INSERT [dbo].[HR_ContactType] ([ContactTypeID], [ContactTypeName]) VALUES (3, N'Office')
GO
INSERT [dbo].[HR_ContactType] ([ContactTypeID], [ContactTypeName]) VALUES (4, N'Home')
GO
SET IDENTITY_INSERT [dbo].[HR_ContactType] OFF
GO
SET IDENTITY_INSERT [dbo].[HR_Department] ON 
GO
INSERT [dbo].[HR_Department] ([DepartmentId], [DepartmentName], [isactive]) VALUES (1, N'Information and Communcation Techology Department', 1)
GO
INSERT [dbo].[HR_Department] ([DepartmentId], [DepartmentName], [isactive]) VALUES (8, N'Accounts Department', 1)
GO
INSERT [dbo].[HR_Department] ([DepartmentId], [DepartmentName], [isactive]) VALUES (9, N'Adult Education Programme', 1)
GO
INSERT [dbo].[HR_Department] ([DepartmentId], [DepartmentName], [isactive]) VALUES (10, N'Audit Department ', 1)
GO
INSERT [dbo].[HR_Department] ([DepartmentId], [DepartmentName], [isactive]) VALUES (11, N'Corporate Communications and Education Unit ', 1)
GO
INSERT [dbo].[HR_Department] ([DepartmentId], [DepartmentName], [isactive]) VALUES (12, N'Development Support Unit', 1)
GO
INSERT [dbo].[HR_Department] ([DepartmentId], [DepartmentName], [isactive]) VALUES (13, N'Disabilities Affairs Unit', 1)
GO
INSERT [dbo].[HR_Department] ([DepartmentId], [DepartmentName], [isactive]) VALUES (14, N'Division of Ageing', 1)
GO
INSERT [dbo].[HR_Department] ([DepartmentId], [DepartmentName], [isactive]) VALUES (15, N'General Administration Department
', 1)
GO
INSERT [dbo].[HR_Department] ([DepartmentId], [DepartmentName], [isactive]) VALUES (16, N'Geriatric Adolescent Partnership Programme
', 1)
GO
INSERT [dbo].[HR_Department] ([DepartmentId], [DepartmentName], [isactive]) VALUES (17, N'HIV/AIDS Coordinating Unit
', 1)
GO
INSERT [dbo].[HR_Department] ([DepartmentId], [DepartmentName], [isactive]) VALUES (18, N'Human Resource Management Division
', 1)
GO
INSERT [dbo].[HR_Department] ([DepartmentId], [DepartmentName], [isactive]) VALUES (19, N'Interdisciplinary Child Development Centre
', 1)
GO
INSERT [dbo].[HR_Department] ([DepartmentId], [DepartmentName], [isactive]) VALUES (20, N'Legal Unit
', 1)
GO
INSERT [dbo].[HR_Department] ([DepartmentId], [DepartmentName], [isactive]) VALUES (21, N'Monitoring & Evaluation Unit
', 1)
GO
INSERT [dbo].[HR_Department] ([DepartmentId], [DepartmentName], [isactive]) VALUES (22, N'National Family Services Division
', 1)
GO
INSERT [dbo].[HR_Department] ([DepartmentId], [DepartmentName], [isactive]) VALUES (23, N'National Social Development Programme
 ', 1)
GO
INSERT [dbo].[HR_Department] ([DepartmentId], [DepartmentName], [isactive]) VALUES (24, N'NGO Unit
', 1)
GO
INSERT [dbo].[HR_Department] ([DepartmentId], [DepartmentName], [isactive]) VALUES (25, N'Office Chief Technical Officer
', 1)
GO
INSERT [dbo].[HR_Department] ([DepartmentId], [DepartmentName], [isactive]) VALUES (26, N'Office Deputy Permanent Secretary
', 1)
GO
INSERT [dbo].[HR_Department] ([DepartmentId], [DepartmentName], [isactive]) VALUES (27, N'Office of The Minister
', 1)
GO
INSERT [dbo].[HR_Department] ([DepartmentId], [DepartmentName], [isactive]) VALUES (28, N'Office Permanent Secretary
', 1)
GO
INSERT [dbo].[HR_Department] ([DepartmentId], [DepartmentName], [isactive]) VALUES (29, N'Pension and Leave
', 1)
GO
INSERT [dbo].[HR_Department] ([DepartmentId], [DepartmentName], [isactive]) VALUES (30, N'Piparo Empowerment Centre
', 1)
GO
INSERT [dbo].[HR_Department] ([DepartmentId], [DepartmentName], [isactive]) VALUES (31, N'Project Implementation Unit
', 1)
GO
INSERT [dbo].[HR_Department] ([DepartmentId], [DepartmentName], [isactive]) VALUES (32, N'Retiree Adolescent Partnership Programme
', 1)
GO
INSERT [dbo].[HR_Department] ([DepartmentId], [DepartmentName], [isactive]) VALUES (33, N'Security
', 1)
GO
INSERT [dbo].[HR_Department] ([DepartmentId], [DepartmentName], [isactive]) VALUES (34, N'Social Displacement Unit
', 1)
GO
INSERT [dbo].[HR_Department] ([DepartmentId], [DepartmentName], [isactive]) VALUES (35, N'Social Investigations Division', 1)
GO
INSERT [dbo].[HR_Department] ([DepartmentId], [DepartmentName], [isactive]) VALUES (36, N'Social Services Centre
', 1)
GO
INSERT [dbo].[HR_Department] ([DepartmentId], [DepartmentName], [isactive]) VALUES (37, N'Social Welfare Division
', 1)
GO
INSERT [dbo].[HR_Department] ([DepartmentId], [DepartmentName], [isactive]) VALUES (38, N'Library Services Unit', 1)
GO
INSERT [dbo].[HR_Department] ([DepartmentId], [DepartmentName], [isactive]) VALUES (39, N'Procurement', 1)
GO
INSERT [dbo].[HR_Department] ([DepartmentId], [DepartmentName], [isactive]) VALUES (40, N'Policy Programme Planning and Development Division', 1)
GO
SET IDENTITY_INSERT [dbo].[HR_Department] OFF
GO
SET IDENTITY_INSERT [dbo].[HR_LeaveType] ON 
GO
INSERT [dbo].[HR_LeaveType] ([LeaveTypeID], [LTname], [isactive]) VALUES (1, N'Sick Leave', 1)
GO
INSERT [dbo].[HR_LeaveType] ([LeaveTypeID], [LTname], [isactive]) VALUES (2, N'Personal Leave', 1)
GO
INSERT [dbo].[HR_LeaveType] ([LeaveTypeID], [LTname], [isactive]) VALUES (3, N'Casual Leave', 1)
GO
INSERT [dbo].[HR_LeaveType] ([LeaveTypeID], [LTname], [isactive]) VALUES (4, N'Compensatory Leave', 1)
GO
INSERT [dbo].[HR_LeaveType] ([LeaveTypeID], [LTname], [isactive]) VALUES (5, N'Vacation Leave', 1)
GO
INSERT [dbo].[HR_LeaveType] ([LeaveTypeID], [LTname], [isactive]) VALUES (6, N'No Pay Leave', 1)
GO
INSERT [dbo].[HR_LeaveType] ([LeaveTypeID], [LTname], [isactive]) VALUES (7, N'No Pay Study Leave', 1)
GO
INSERT [dbo].[HR_LeaveType] ([LeaveTypeID], [LTname], [isactive]) VALUES (8, N'No Pay Leave to Maintain Family', 1)
GO
INSERT [dbo].[HR_LeaveType] ([LeaveTypeID], [LTname], [isactive]) VALUES (9, N'No Pay Leave for Private Reasons', 1)
GO
INSERT [dbo].[HR_LeaveType] ([LeaveTypeID], [LTname], [isactive]) VALUES (10, N'No Pay Leave for Public Policy', 1)
GO
INSERT [dbo].[HR_LeaveType] ([LeaveTypeID], [LTname], [isactive]) VALUES (11, N'No Pay Leave for Cultural Purposes', 1)
GO
INSERT [dbo].[HR_LeaveType] ([LeaveTypeID], [LTname], [isactive]) VALUES (12, N'Bereavement Leave', 1)
GO
INSERT [dbo].[HR_LeaveType] ([LeaveTypeID], [LTname], [isactive]) VALUES (13, N'Maternity Leave', 1)
GO
INSERT [dbo].[HR_LeaveType] ([LeaveTypeID], [LTname], [isactive]) VALUES (14, N'Paternity Leave', 1)
GO
INSERT [dbo].[HR_LeaveType] ([LeaveTypeID], [LTname], [isactive]) VALUES (15, N'Duty Leave', 1)
GO
INSERT [dbo].[HR_LeaveType] ([LeaveTypeID], [LTname], [isactive]) VALUES (16, N'Special Duty Leave', 1)
GO
INSERT [dbo].[HR_LeaveType] ([LeaveTypeID], [LTname], [isactive]) VALUES (17, N'Special Leave', 1)
GO
INSERT [dbo].[HR_LeaveType] ([LeaveTypeID], [LTname], [isactive]) VALUES (18, N'Leave of Absence', 1)
GO
INSERT [dbo].[HR_LeaveType] ([LeaveTypeID], [LTname], [isactive]) VALUES (19, N'Leave for Union Business', 1)
GO
INSERT [dbo].[HR_LeaveType] ([LeaveTypeID], [LTname], [isactive]) VALUES (20, N'Injury Leave', 1)
GO
INSERT [dbo].[HR_LeaveType] ([LeaveTypeID], [LTname], [isactive]) VALUES (21, N'Secondment Leave', 1)
GO
INSERT [dbo].[HR_LeaveType] ([LeaveTypeID], [LTname], [isactive]) VALUES (22, N'Pandemic Leave', 1)
GO
SET IDENTITY_INSERT [dbo].[HR_LeaveType] OFF
GO
SET IDENTITY_INSERT [dbo].[HR_tbl_ApprovedLeave] ON 
GO
INSERT [dbo].[HR_tbl_ApprovedLeave] ([ApprovedLeaveID], [LeaveFrom], [Leaveto], [LeavetypeID], [daterequested], [recommended], [approvedBy], [medicalrequired], [medicalForm], [isactive], [EMP_ID]) VALUES (1, CAST(N'2021-03-29' AS Date), CAST(N'2021-05-01' AS Date), 5, CAST(N'2021-03-10' AS Date), N'Yes', NULL, N'No', N'N/A', 1, 20)
GO
INSERT [dbo].[HR_tbl_ApprovedLeave] ([ApprovedLeaveID], [LeaveFrom], [Leaveto], [LeavetypeID], [daterequested], [recommended], [approvedBy], [medicalrequired], [medicalForm], [isactive], [EMP_ID]) VALUES (2, CAST(N'2020-12-21' AS Date), CAST(N'2021-03-12' AS Date), 13, CAST(N'2020-11-25' AS Date), N'Yes', NULL, N'Yes', NULL, 1, 38)
GO
INSERT [dbo].[HR_tbl_ApprovedLeave] ([ApprovedLeaveID], [LeaveFrom], [Leaveto], [LeavetypeID], [daterequested], [recommended], [approvedBy], [medicalrequired], [medicalForm], [isactive], [EMP_ID]) VALUES (3, CAST(N'2021-03-15' AS Date), CAST(N'2021-06-01' AS Date), 5, CAST(N'2020-11-25' AS Date), N'Yes', NULL, N'No', N'N/A', 1, 38)
GO
INSERT [dbo].[HR_tbl_ApprovedLeave] ([ApprovedLeaveID], [LeaveFrom], [Leaveto], [LeavetypeID], [daterequested], [recommended], [approvedBy], [medicalrequired], [medicalForm], [isactive], [EMP_ID]) VALUES (4, CAST(N'2020-04-01' AS Date), CAST(N'2020-04-30' AS Date), 4, CAST(N'2021-03-25' AS Date), N'Yes', NULL, N'No', N'N/A', 1, 11)
GO
INSERT [dbo].[HR_tbl_ApprovedLeave] ([ApprovedLeaveID], [LeaveFrom], [Leaveto], [LeavetypeID], [daterequested], [recommended], [approvedBy], [medicalrequired], [medicalForm], [isactive], [EMP_ID]) VALUES (6, CAST(N'2021-02-04' AS Date), CAST(N'2021-02-04' AS Date), 1, CAST(N'2021-02-05' AS Date), N'Yes', NULL, N'No', N'N/A', 1, 30)
GO
INSERT [dbo].[HR_tbl_ApprovedLeave] ([ApprovedLeaveID], [LeaveFrom], [Leaveto], [LeavetypeID], [daterequested], [recommended], [approvedBy], [medicalrequired], [medicalForm], [isactive], [EMP_ID]) VALUES (7, CAST(N'2021-02-02' AS Date), CAST(N'2021-02-02' AS Date), 4, CAST(N'2021-01-28' AS Date), N'Yes', NULL, N'No', N'N/A', 1, 8)
GO
INSERT [dbo].[HR_tbl_ApprovedLeave] ([ApprovedLeaveID], [LeaveFrom], [Leaveto], [LeavetypeID], [daterequested], [recommended], [approvedBy], [medicalrequired], [medicalForm], [isactive], [EMP_ID]) VALUES (8, CAST(N'2021-02-03' AS Date), CAST(N'2021-02-03' AS Date), 1, CAST(N'2021-01-04' AS Date), N'Yes', NULL, N'No', N'N/A', 1, 36)
GO
INSERT [dbo].[HR_tbl_ApprovedLeave] ([ApprovedLeaveID], [LeaveFrom], [Leaveto], [LeavetypeID], [daterequested], [recommended], [approvedBy], [medicalrequired], [medicalForm], [isactive], [EMP_ID]) VALUES (9, CAST(N'2021-02-04' AS Date), CAST(N'2021-02-04' AS Date), 1, CAST(N'2021-01-05' AS Date), N'Yes', NULL, N'No', N'N/A', 1, 37)
GO
INSERT [dbo].[HR_tbl_ApprovedLeave] ([ApprovedLeaveID], [LeaveFrom], [Leaveto], [LeavetypeID], [daterequested], [recommended], [approvedBy], [medicalrequired], [medicalForm], [isactive], [EMP_ID]) VALUES (10, CAST(N'2021-02-04' AS Date), CAST(N'2021-02-04' AS Date), 1, CAST(N'2021-01-05' AS Date), N'Yes', NULL, N'No', N'N/A', 1, 34)
GO
INSERT [dbo].[HR_tbl_ApprovedLeave] ([ApprovedLeaveID], [LeaveFrom], [Leaveto], [LeavetypeID], [daterequested], [recommended], [approvedBy], [medicalrequired], [medicalForm], [isactive], [EMP_ID]) VALUES (11, CAST(N'2021-02-08' AS Date), CAST(N'2021-02-08' AS Date), 1, CAST(N'2021-01-09' AS Date), N'Yes', NULL, N'No', N'N/A', 1, 16)
GO
INSERT [dbo].[HR_tbl_ApprovedLeave] ([ApprovedLeaveID], [LeaveFrom], [Leaveto], [LeavetypeID], [daterequested], [recommended], [approvedBy], [medicalrequired], [medicalForm], [isactive], [EMP_ID]) VALUES (12, CAST(N'2021-02-09' AS Date), CAST(N'2021-02-09' AS Date), 3, CAST(N'2021-02-08' AS Date), N'Yes', NULL, N'No', N'N/A', 1, 27)
GO
INSERT [dbo].[HR_tbl_ApprovedLeave] ([ApprovedLeaveID], [LeaveFrom], [Leaveto], [LeavetypeID], [daterequested], [recommended], [approvedBy], [medicalrequired], [medicalForm], [isactive], [EMP_ID]) VALUES (13, CAST(N'2021-02-10' AS Date), CAST(N'2021-02-10' AS Date), 1, CAST(N'2021-02-11' AS Date), N'Yes', NULL, N'No', N'N/A', 1, 22)
GO
INSERT [dbo].[HR_tbl_ApprovedLeave] ([ApprovedLeaveID], [LeaveFrom], [Leaveto], [LeavetypeID], [daterequested], [recommended], [approvedBy], [medicalrequired], [medicalForm], [isactive], [EMP_ID]) VALUES (14, CAST(N'2021-02-10' AS Date), CAST(N'2021-02-10' AS Date), 4, CAST(N'2021-02-09' AS Date), N'Yes', NULL, N'No', N'N/A', 1, 28)
GO
INSERT [dbo].[HR_tbl_ApprovedLeave] ([ApprovedLeaveID], [LeaveFrom], [Leaveto], [LeavetypeID], [daterequested], [recommended], [approvedBy], [medicalrequired], [medicalForm], [isactive], [EMP_ID]) VALUES (15, CAST(N'2021-02-11' AS Date), CAST(N'2021-02-11' AS Date), 1, CAST(N'2021-02-12' AS Date), N'Yes', NULL, N'No', N'N/A', 1, 33)
GO
INSERT [dbo].[HR_tbl_ApprovedLeave] ([ApprovedLeaveID], [LeaveFrom], [Leaveto], [LeavetypeID], [daterequested], [recommended], [approvedBy], [medicalrequired], [medicalForm], [isactive], [EMP_ID]) VALUES (16, CAST(N'2021-02-12' AS Date), CAST(N'2021-02-12' AS Date), 4, CAST(N'2021-02-11' AS Date), N'Yes', NULL, N'No', N'N/A', 1, 31)
GO
INSERT [dbo].[HR_tbl_ApprovedLeave] ([ApprovedLeaveID], [LeaveFrom], [Leaveto], [LeavetypeID], [daterequested], [recommended], [approvedBy], [medicalrequired], [medicalForm], [isactive], [EMP_ID]) VALUES (17, CAST(N'2021-02-12' AS Date), CAST(N'2021-02-12' AS Date), 3, CAST(N'2021-02-11' AS Date), N'Yes', NULL, N'No', N'N/A', 1, 26)
GO
INSERT [dbo].[HR_tbl_ApprovedLeave] ([ApprovedLeaveID], [LeaveFrom], [Leaveto], [LeavetypeID], [daterequested], [recommended], [approvedBy], [medicalrequired], [medicalForm], [isactive], [EMP_ID]) VALUES (18, CAST(N'2021-02-12' AS Date), CAST(N'2021-02-12' AS Date), 3, CAST(N'2021-02-11' AS Date), N'Yes', NULL, N'No', N'N/A', 1, 23)
GO
INSERT [dbo].[HR_tbl_ApprovedLeave] ([ApprovedLeaveID], [LeaveFrom], [Leaveto], [LeavetypeID], [daterequested], [recommended], [approvedBy], [medicalrequired], [medicalForm], [isactive], [EMP_ID]) VALUES (19, CAST(N'2021-02-16' AS Date), CAST(N'2021-02-16' AS Date), 1, CAST(N'2021-02-17' AS Date), N'Yes', NULL, N'No', N'N/A', 1, 33)
GO
INSERT [dbo].[HR_tbl_ApprovedLeave] ([ApprovedLeaveID], [LeaveFrom], [Leaveto], [LeavetypeID], [daterequested], [recommended], [approvedBy], [medicalrequired], [medicalForm], [isactive], [EMP_ID]) VALUES (20, CAST(N'2021-02-16' AS Date), CAST(N'2021-02-16' AS Date), 1, CAST(N'2021-02-17' AS Date), N'Yes', NULL, N'No', N'N/A', 1, 25)
GO
INSERT [dbo].[HR_tbl_ApprovedLeave] ([ApprovedLeaveID], [LeaveFrom], [Leaveto], [LeavetypeID], [daterequested], [recommended], [approvedBy], [medicalrequired], [medicalForm], [isactive], [EMP_ID]) VALUES (21, CAST(N'2021-02-17' AS Date), CAST(N'2021-02-17' AS Date), 1, CAST(N'2021-02-18' AS Date), N'Yes', NULL, N'No', N'N/A', 1, 33)
GO
INSERT [dbo].[HR_tbl_ApprovedLeave] ([ApprovedLeaveID], [LeaveFrom], [Leaveto], [LeavetypeID], [daterequested], [recommended], [approvedBy], [medicalrequired], [medicalForm], [isactive], [EMP_ID]) VALUES (22, CAST(N'2021-02-17' AS Date), CAST(N'2021-02-17' AS Date), 1, CAST(N'2021-02-18' AS Date), N'Yes', NULL, N'No', N'N/A', 1, 30)
GO
INSERT [dbo].[HR_tbl_ApprovedLeave] ([ApprovedLeaveID], [LeaveFrom], [Leaveto], [LeavetypeID], [daterequested], [recommended], [approvedBy], [medicalrequired], [medicalForm], [isactive], [EMP_ID]) VALUES (23, CAST(N'2021-02-19' AS Date), CAST(N'2021-02-19' AS Date), 1, CAST(N'2021-01-22' AS Date), N'Yes', NULL, N'No', N'N/A', 1, 13)
GO
INSERT [dbo].[HR_tbl_ApprovedLeave] ([ApprovedLeaveID], [LeaveFrom], [Leaveto], [LeavetypeID], [daterequested], [recommended], [approvedBy], [medicalrequired], [medicalForm], [isactive], [EMP_ID]) VALUES (24, CAST(N'2021-02-22' AS Date), CAST(N'2021-02-22' AS Date), 1, CAST(N'2021-01-23' AS Date), N'Yes', NULL, N'No', N'N/A', 1, 36)
GO
INSERT [dbo].[HR_tbl_ApprovedLeave] ([ApprovedLeaveID], [LeaveFrom], [Leaveto], [LeavetypeID], [daterequested], [recommended], [approvedBy], [medicalrequired], [medicalForm], [isactive], [EMP_ID]) VALUES (25, CAST(N'2021-02-22' AS Date), CAST(N'2021-02-22' AS Date), 1, CAST(N'2021-01-23' AS Date), N'Yes', NULL, N'No', N'N/A', 1, 35)
GO
INSERT [dbo].[HR_tbl_ApprovedLeave] ([ApprovedLeaveID], [LeaveFrom], [Leaveto], [LeavetypeID], [daterequested], [recommended], [approvedBy], [medicalrequired], [medicalForm], [isactive], [EMP_ID]) VALUES (26, CAST(N'2021-02-23' AS Date), CAST(N'2021-02-24' AS Date), 1, CAST(N'2021-01-25' AS Date), N'Yes', NULL, N'No', N'N/A', 1, 12)
GO
INSERT [dbo].[HR_tbl_ApprovedLeave] ([ApprovedLeaveID], [LeaveFrom], [Leaveto], [LeavetypeID], [daterequested], [recommended], [approvedBy], [medicalrequired], [medicalForm], [isactive], [EMP_ID]) VALUES (27, CAST(N'2021-02-24' AS Date), CAST(N'2021-02-24' AS Date), 1, CAST(N'2021-01-25' AS Date), N'Yes', NULL, N'No', N'N/A', 1, 21)
GO
INSERT [dbo].[HR_tbl_ApprovedLeave] ([ApprovedLeaveID], [LeaveFrom], [Leaveto], [LeavetypeID], [daterequested], [recommended], [approvedBy], [medicalrequired], [medicalForm], [isactive], [EMP_ID]) VALUES (28, CAST(N'2021-02-11' AS Date), CAST(N'2021-02-11' AS Date), 3, CAST(N'2021-01-10' AS Date), N'Yes', NULL, N'No', N'N/A', 1, 24)
GO
INSERT [dbo].[HR_tbl_ApprovedLeave] ([ApprovedLeaveID], [LeaveFrom], [Leaveto], [LeavetypeID], [daterequested], [recommended], [approvedBy], [medicalrequired], [medicalForm], [isactive], [EMP_ID]) VALUES (29, CAST(N'2021-02-24' AS Date), CAST(N'2021-02-24' AS Date), 1, CAST(N'2021-01-25' AS Date), N'Yes', NULL, N'No', N'N/A', 1, 24)
GO
INSERT [dbo].[HR_tbl_ApprovedLeave] ([ApprovedLeaveID], [LeaveFrom], [Leaveto], [LeavetypeID], [daterequested], [recommended], [approvedBy], [medicalrequired], [medicalForm], [isactive], [EMP_ID]) VALUES (30, CAST(N'2021-02-25' AS Date), CAST(N'2021-02-25' AS Date), 1, CAST(N'2021-01-26' AS Date), N'Yes', NULL, N'No', N'N/A', 1, 31)
GO
INSERT [dbo].[HR_tbl_ApprovedLeave] ([ApprovedLeaveID], [LeaveFrom], [Leaveto], [LeavetypeID], [daterequested], [recommended], [approvedBy], [medicalrequired], [medicalForm], [isactive], [EMP_ID]) VALUES (31, CAST(N'2021-02-26' AS Date), CAST(N'2021-02-26' AS Date), 4, CAST(N'2021-01-25' AS Date), N'Yes', NULL, N'No', N'N/A', 1, 30)
GO
SET IDENTITY_INSERT [dbo].[HR_tbl_ApprovedLeave] OFF
GO
SET IDENTITY_INSERT [dbo].[HR_tbl_Employee] ON 
GO
INSERT [dbo].[HR_tbl_Employee] ([EMP_ID], [firstName], [Lastname], [gender], [contactID], [email], [Estatus], [PosID], [dateJoin], [dateLeave], [ServiceYears], [ReportingManager], [DepartmentID], [LocationID], [createdBy], [modifiedBy], [createDate], [modifiedDate], [isactive]) VALUES (7, N'Paul', N'Kanneh', NULL, NULL, N'paul.kanneh@social.gov.tt', 1, 5, NULL, NULL, NULL, NULL, 1, 31, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[HR_tbl_Employee] ([EMP_ID], [firstName], [Lastname], [gender], [contactID], [email], [Estatus], [PosID], [dateJoin], [dateLeave], [ServiceYears], [ReportingManager], [DepartmentID], [LocationID], [createdBy], [modifiedBy], [createDate], [modifiedDate], [isactive]) VALUES (8, N'Adesh', N'Seegobin', NULL, NULL, N'adesh.seegobin@social.gov.tt', 1, 7, NULL, NULL, NULL, NULL, 1, 31, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[HR_tbl_Employee] ([EMP_ID], [firstName], [Lastname], [gender], [contactID], [email], [Estatus], [PosID], [dateJoin], [dateLeave], [ServiceYears], [ReportingManager], [DepartmentID], [LocationID], [createdBy], [modifiedBy], [createDate], [modifiedDate], [isactive]) VALUES (9, N'Dave', N'Charles', NULL, NULL, N'dave.charles@social.gov.tt', 1, 14, NULL, NULL, NULL, NULL, 1, 31, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[HR_tbl_Employee] ([EMP_ID], [firstName], [Lastname], [gender], [contactID], [email], [Estatus], [PosID], [dateJoin], [dateLeave], [ServiceYears], [ReportingManager], [DepartmentID], [LocationID], [createdBy], [modifiedBy], [createDate], [modifiedDate], [isactive]) VALUES (10, N'Leslie-Ann', N'Douglas', NULL, NULL, N'leslieann.douglas@social.gov.tt', 1, 16, NULL, NULL, NULL, NULL, 1, 31, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[HR_tbl_Employee] ([EMP_ID], [firstName], [Lastname], [gender], [contactID], [email], [Estatus], [PosID], [dateJoin], [dateLeave], [ServiceYears], [ReportingManager], [DepartmentID], [LocationID], [createdBy], [modifiedBy], [createDate], [modifiedDate], [isactive]) VALUES (11, N'Kevon', N'Gibbs', NULL, NULL, N'kevon.gibbs@social.gov.tt', 1, 16, NULL, NULL, NULL, NULL, 1, 31, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[HR_tbl_Employee] ([EMP_ID], [firstName], [Lastname], [gender], [contactID], [email], [Estatus], [PosID], [dateJoin], [dateLeave], [ServiceYears], [ReportingManager], [DepartmentID], [LocationID], [createdBy], [modifiedBy], [createDate], [modifiedDate], [isactive]) VALUES (12, N'Michael', N'Pierre', NULL, NULL, N'michael.pierre@social.gov.tt', 1, 16, NULL, NULL, NULL, NULL, 1, 31, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[HR_tbl_Employee] ([EMP_ID], [firstName], [Lastname], [gender], [contactID], [email], [Estatus], [PosID], [dateJoin], [dateLeave], [ServiceYears], [ReportingManager], [DepartmentID], [LocationID], [createdBy], [modifiedBy], [createDate], [modifiedDate], [isactive]) VALUES (13, N'Timothy', N'Geelalsingh', NULL, NULL, N'timothy.geelalsingh@social.gov.tt', 1, 16, NULL, NULL, NULL, NULL, 1, 47, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[HR_tbl_Employee] ([EMP_ID], [firstName], [Lastname], [gender], [contactID], [email], [Estatus], [PosID], [dateJoin], [dateLeave], [ServiceYears], [ReportingManager], [DepartmentID], [LocationID], [createdBy], [modifiedBy], [createDate], [modifiedDate], [isactive]) VALUES (14, N'Keron', N'Joseph', NULL, NULL, N'keron.joseph@social.gov.tt', 1, 16, NULL, NULL, NULL, NULL, 1, 47, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[HR_tbl_Employee] ([EMP_ID], [firstName], [Lastname], [gender], [contactID], [email], [Estatus], [PosID], [dateJoin], [dateLeave], [ServiceYears], [ReportingManager], [DepartmentID], [LocationID], [createdBy], [modifiedBy], [createDate], [modifiedDate], [isactive]) VALUES (15, N'Kyle', N'Scott', NULL, NULL, N'kyle.scott@social.gov.tt', 1, 16, NULL, NULL, NULL, NULL, 1, 51, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[HR_tbl_Employee] ([EMP_ID], [firstName], [Lastname], [gender], [contactID], [email], [Estatus], [PosID], [dateJoin], [dateLeave], [ServiceYears], [ReportingManager], [DepartmentID], [LocationID], [createdBy], [modifiedBy], [createDate], [modifiedDate], [isactive]) VALUES (16, N'Reena', N'Pearalal', NULL, NULL, N'reena.pearalal@social.gov.tt', 1, 3, NULL, NULL, NULL, NULL, 1, 31, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[HR_tbl_Employee] ([EMP_ID], [firstName], [Lastname], [gender], [contactID], [email], [Estatus], [PosID], [dateJoin], [dateLeave], [ServiceYears], [ReportingManager], [DepartmentID], [LocationID], [createdBy], [modifiedBy], [createDate], [modifiedDate], [isactive]) VALUES (17, N'Carlan', N'Spooner', NULL, NULL, N'carlan.spooner@social.gov.tt', 1, 3, NULL, NULL, NULL, NULL, 1, 31, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[HR_tbl_Employee] ([EMP_ID], [firstName], [Lastname], [gender], [contactID], [email], [Estatus], [PosID], [dateJoin], [dateLeave], [ServiceYears], [ReportingManager], [DepartmentID], [LocationID], [createdBy], [modifiedBy], [createDate], [modifiedDate], [isactive]) VALUES (18, N'Charles', N'Glasgow', NULL, NULL, N'charles.glasgow@social.gov.tt', 1, 8, NULL, NULL, NULL, NULL, 1, 47, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[HR_tbl_Employee] ([EMP_ID], [firstName], [Lastname], [gender], [contactID], [email], [Estatus], [PosID], [dateJoin], [dateLeave], [ServiceYears], [ReportingManager], [DepartmentID], [LocationID], [createdBy], [modifiedBy], [createDate], [modifiedDate], [isactive]) VALUES (19, N'Sharlan', N'Deosaran', NULL, NULL, N'sharlan.deosaran@social.gov.tt', 1, 13, NULL, NULL, NULL, NULL, 1, 47, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[HR_tbl_Employee] ([EMP_ID], [firstName], [Lastname], [gender], [contactID], [email], [Estatus], [PosID], [dateJoin], [dateLeave], [ServiceYears], [ReportingManager], [DepartmentID], [LocationID], [createdBy], [modifiedBy], [createDate], [modifiedDate], [isactive]) VALUES (20, N'Gerald', N'Martinez', NULL, NULL, N'gerald.martinez@social.gov.tt', 1, 12, NULL, NULL, NULL, NULL, 1, 47, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[HR_tbl_Employee] ([EMP_ID], [firstName], [Lastname], [gender], [contactID], [email], [Estatus], [PosID], [dateJoin], [dateLeave], [ServiceYears], [ReportingManager], [DepartmentID], [LocationID], [createdBy], [modifiedBy], [createDate], [modifiedDate], [isactive]) VALUES (21, N'Sean', N'Defour', NULL, NULL, N'sean.defour@social.gov.tt', 1, 4, NULL, NULL, NULL, NULL, 1, 47, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[HR_tbl_Employee] ([EMP_ID], [firstName], [Lastname], [gender], [contactID], [email], [Estatus], [PosID], [dateJoin], [dateLeave], [ServiceYears], [ReportingManager], [DepartmentID], [LocationID], [createdBy], [modifiedBy], [createDate], [modifiedDate], [isactive]) VALUES (22, N'Evrol', N'Mark', NULL, NULL, N'evrol.mark@social.gov.tt', 1, 6, NULL, NULL, NULL, NULL, 1, 47, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[HR_tbl_Employee] ([EMP_ID], [firstName], [Lastname], [gender], [contactID], [email], [Estatus], [PosID], [dateJoin], [dateLeave], [ServiceYears], [ReportingManager], [DepartmentID], [LocationID], [createdBy], [modifiedBy], [createDate], [modifiedDate], [isactive]) VALUES (23, N'Napoleon', N'Okunna', NULL, NULL, N'napoleon.okunna@social.gov.tt', 1, 1, NULL, NULL, NULL, NULL, 1, 47, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[HR_tbl_Employee] ([EMP_ID], [firstName], [Lastname], [gender], [contactID], [email], [Estatus], [PosID], [dateJoin], [dateLeave], [ServiceYears], [ReportingManager], [DepartmentID], [LocationID], [createdBy], [modifiedBy], [createDate], [modifiedDate], [isactive]) VALUES (24, N'JD', N'Sookdeo', NULL, NULL, N'jd.sookdeo@social.gov.tt', 2, 10, NULL, NULL, NULL, NULL, 1, 47, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[HR_tbl_Employee] ([EMP_ID], [firstName], [Lastname], [gender], [contactID], [email], [Estatus], [PosID], [dateJoin], [dateLeave], [ServiceYears], [ReportingManager], [DepartmentID], [LocationID], [createdBy], [modifiedBy], [createDate], [modifiedDate], [isactive]) VALUES (25, N'Justin', N'Patterson', NULL, NULL, N'justin.patterson@social.gov.tt', 2, 10, NULL, NULL, NULL, NULL, 1, 47, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[HR_tbl_Employee] ([EMP_ID], [firstName], [Lastname], [gender], [contactID], [email], [Estatus], [PosID], [dateJoin], [dateLeave], [ServiceYears], [ReportingManager], [DepartmentID], [LocationID], [createdBy], [modifiedBy], [createDate], [modifiedDate], [isactive]) VALUES (26, N'Fariah', N'Ali', NULL, NULL, N'fariah.ali@social.gov.tt', 2, 10, NULL, NULL, NULL, NULL, 1, 31, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[HR_tbl_Employee] ([EMP_ID], [firstName], [Lastname], [gender], [contactID], [email], [Estatus], [PosID], [dateJoin], [dateLeave], [ServiceYears], [ReportingManager], [DepartmentID], [LocationID], [createdBy], [modifiedBy], [createDate], [modifiedDate], [isactive]) VALUES (27, N'Destine', N'Christopher', NULL, NULL, N'destine.christopher@social.gov.tt', 2, 10, NULL, NULL, NULL, NULL, 1, 31, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[HR_tbl_Employee] ([EMP_ID], [firstName], [Lastname], [gender], [contactID], [email], [Estatus], [PosID], [dateJoin], [dateLeave], [ServiceYears], [ReportingManager], [DepartmentID], [LocationID], [createdBy], [modifiedBy], [createDate], [modifiedDate], [isactive]) VALUES (28, N'Sara', N'Shoon', NULL, NULL, N'sara.shoon@social.gov.tt', 2, 10, NULL, NULL, NULL, NULL, 1, 31, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[HR_tbl_Employee] ([EMP_ID], [firstName], [Lastname], [gender], [contactID], [email], [Estatus], [PosID], [dateJoin], [dateLeave], [ServiceYears], [ReportingManager], [DepartmentID], [LocationID], [createdBy], [modifiedBy], [createDate], [modifiedDate], [isactive]) VALUES (29, N'Jehvern', N'Dubois', NULL, NULL, N'jehvern.dubois@social.gov.tt', 2, 10, NULL, NULL, NULL, NULL, 1, 31, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[HR_tbl_Employee] ([EMP_ID], [firstName], [Lastname], [gender], [contactID], [email], [Estatus], [PosID], [dateJoin], [dateLeave], [ServiceYears], [ReportingManager], [DepartmentID], [LocationID], [createdBy], [modifiedBy], [createDate], [modifiedDate], [isactive]) VALUES (30, N'Christopher', N'Scott', NULL, NULL, N'Christopher.scott@social.gov.tt', 1, 11, NULL, NULL, NULL, NULL, 1, 31, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[HR_tbl_Employee] ([EMP_ID], [firstName], [Lastname], [gender], [contactID], [email], [Estatus], [PosID], [dateJoin], [dateLeave], [ServiceYears], [ReportingManager], [DepartmentID], [LocationID], [createdBy], [modifiedBy], [createDate], [modifiedDate], [isactive]) VALUES (31, N'Rajesh', N'Nandram', NULL, NULL, N'rajesh.nandram@social.gov.tt', 1, 15, NULL, NULL, NULL, NULL, 1, 31, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[HR_tbl_Employee] ([EMP_ID], [firstName], [Lastname], [gender], [contactID], [email], [Estatus], [PosID], [dateJoin], [dateLeave], [ServiceYears], [ReportingManager], [DepartmentID], [LocationID], [createdBy], [modifiedBy], [createDate], [modifiedDate], [isactive]) VALUES (32, N'Sheldon', N'Mohammed', NULL, NULL, N'sheldon.mohammed@social.gov.tt', 1, 9, NULL, NULL, NULL, NULL, 1, 52, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[HR_tbl_Employee] ([EMP_ID], [firstName], [Lastname], [gender], [contactID], [email], [Estatus], [PosID], [dateJoin], [dateLeave], [ServiceYears], [ReportingManager], [DepartmentID], [LocationID], [createdBy], [modifiedBy], [createDate], [modifiedDate], [isactive]) VALUES (33, N'Ameair', N'Ibrahim', NULL, NULL, N'ameair.ibrahim@social.gov.tt', 1, 16, NULL, NULL, NULL, NULL, 1, 31, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[HR_tbl_Employee] ([EMP_ID], [firstName], [Lastname], [gender], [contactID], [email], [Estatus], [PosID], [dateJoin], [dateLeave], [ServiceYears], [ReportingManager], [DepartmentID], [LocationID], [createdBy], [modifiedBy], [createDate], [modifiedDate], [isactive]) VALUES (34, N'Claude', N'Henry-Subance', NULL, NULL, N'claude-henry.subance@social.gov.tt', 2, 10, NULL, NULL, NULL, NULL, 1, 31, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[HR_tbl_Employee] ([EMP_ID], [firstName], [Lastname], [gender], [contactID], [email], [Estatus], [PosID], [dateJoin], [dateLeave], [ServiceYears], [ReportingManager], [DepartmentID], [LocationID], [createdBy], [modifiedBy], [createDate], [modifiedDate], [isactive]) VALUES (35, N'Mikel', N'Garcia', NULL, NULL, N'mikel.garcia@social.gov.tt', 2, 10, NULL, NULL, NULL, NULL, 1, 31, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[HR_tbl_Employee] ([EMP_ID], [firstName], [Lastname], [gender], [contactID], [email], [Estatus], [PosID], [dateJoin], [dateLeave], [ServiceYears], [ReportingManager], [DepartmentID], [LocationID], [createdBy], [modifiedBy], [createDate], [modifiedDate], [isactive]) VALUES (36, N'Whitnii', N'Ali-Khan', NULL, NULL, N'whitnii.ali@social.gov.tt', 1, 2, NULL, NULL, NULL, NULL, 1, 31, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[HR_tbl_Employee] ([EMP_ID], [firstName], [Lastname], [gender], [contactID], [email], [Estatus], [PosID], [dateJoin], [dateLeave], [ServiceYears], [ReportingManager], [DepartmentID], [LocationID], [createdBy], [modifiedBy], [createDate], [modifiedDate], [isactive]) VALUES (37, N'Jevon', N'Phillip', NULL, NULL, N'jevon.phillip@social.gov.tt', 1, 2, NULL, NULL, NULL, NULL, 1, 31, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[HR_tbl_Employee] ([EMP_ID], [firstName], [Lastname], [gender], [contactID], [email], [Estatus], [PosID], [dateJoin], [dateLeave], [ServiceYears], [ReportingManager], [DepartmentID], [LocationID], [createdBy], [modifiedBy], [createDate], [modifiedDate], [isactive]) VALUES (38, N'Shani', N'Gay', NULL, NULL, N'shani.gay@social.gov.tt', 1, 2, NULL, NULL, NULL, NULL, 1, 47, NULL, NULL, NULL, NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[HR_tbl_Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[HR_tbl_employmentStatus] ON 
GO
INSERT [dbo].[HR_tbl_employmentStatus] ([EmpStatus_ID], [estatus], [isactive]) VALUES (1, N'Contract', 1)
GO
INSERT [dbo].[HR_tbl_employmentStatus] ([EmpStatus_ID], [estatus], [isactive]) VALUES (2, N'OJT', 1)
GO
SET IDENTITY_INSERT [dbo].[HR_tbl_employmentStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[HR_tbl_Location] ON 
GO
INSERT [dbo].[HR_tbl_Location] ([LocationID], [LocationName], [address], [isactive]) VALUES (29, N'#1 La Fantasie Road, St Anns', NULL, 1)
GO
INSERT [dbo].[HR_tbl_Location] ([LocationID], [LocationName], [address], [isactive]) VALUES (30, N'ABMA', N'55-57 St. Vincent st, Port-of-Spain', 1)
GO
INSERT [dbo].[HR_tbl_Location] ([LocationID], [LocationName], [address], [isactive]) VALUES (31, N'CL Financial', N'39-43 St. Vincent st, Port-of-Spain', 1)
GO
INSERT [dbo].[HR_tbl_Location] ([LocationID], [LocationName], [address], [isactive]) VALUES (32, N'Couva Social Services Centre', NULL, 1)
GO
INSERT [dbo].[HR_tbl_Location] ([LocationID], [LocationName], [address], [isactive]) VALUES (33, N'Nahous', N'45A - 45C St. Vincent st, Port-of-Spain', 1)
GO
INSERT [dbo].[HR_tbl_Location] ([LocationID], [LocationName], [address], [isactive]) VALUES (34, N'NFSD Arima', N'3rd Fl. Pennywise Bld. #10 DevenishSt, Arima', 1)
GO
INSERT [dbo].[HR_tbl_Location] ([LocationID], [LocationName], [address], [isactive]) VALUES (35, N'NFSD Central', N'Mackoon Building, Eleanore St., Chaguanas', 1)
GO
INSERT [dbo].[HR_tbl_Location] ([LocationID], [LocationName], [address], [isactive]) VALUES (36, N'NFSD Head Office', N'95-97 Frederick st, Port-of-Spain', 1)
GO
INSERT [dbo].[HR_tbl_Location] ([LocationID], [LocationName], [address], [isactive]) VALUES (37, N'NFSD Nariva/Mayaro', N'2458 Naparima/Mayaro Rd, Rio Claro', 1)
GO
INSERT [dbo].[HR_tbl_Location] ([LocationID], [LocationName], [address], [isactive]) VALUES (38, N'NFSD San Juan', N'Silver Mill Eastern Main Road, San Jaun', 1)
GO
INSERT [dbo].[HR_tbl_Location] ([LocationID], [LocationName], [address], [isactive]) VALUES (39, N'NFSD St Patrick East', N'27b Rock Road, Penal Siparia Social Welfare Bld.', 1)
GO
INSERT [dbo].[HR_tbl_Location] ([LocationID], [LocationName], [address], [isactive]) VALUES (40, N'NFSD St Patrick West', N'Rotel Building, 10 - 12 Neverson st, Point Fortin', 1)
GO
INSERT [dbo].[HR_tbl_Location] ([LocationID], [LocationName], [address], [isactive]) VALUES (41, N'NFSD Tunapuna', N'Tunapuna Social Servies Centre', 1)
GO
INSERT [dbo].[HR_tbl_Location] ([LocationID], [LocationName], [address], [isactive]) VALUES (42, N'NFSD Victoria East', NULL, 1)
GO
INSERT [dbo].[HR_tbl_Location] ([LocationID], [LocationName], [address], [isactive]) VALUES (43, N'NFSD Victoria West', NULL, 1)
GO
INSERT [dbo].[HR_tbl_Location] ([LocationID], [LocationName], [address], [isactive]) VALUES (44, N'SW Caroni(Chaguanas)', N'Eleanore Street, Chaguanas', 1)
GO
INSERT [dbo].[HR_tbl_Location] ([LocationID], [LocationName], [address], [isactive]) VALUES (45, N'SW St Andrew/St David(Sangre Grande)', N'Savi Street, Boodooville, Sangre Grande', 1)
GO
INSERT [dbo].[HR_tbl_Location] ([LocationID], [LocationName], [address], [isactive]) VALUES (46, N'SW St George Central(San Juan)', N'MTS Plaza, Aranguez Main Road, San Juan', 1)
GO
INSERT [dbo].[HR_tbl_Location] ([LocationID], [LocationName], [address], [isactive]) VALUES (47, N'SW St George East(Tunapuna)', N'107 E.E. RD. Tunapuna, Opposite Royal Castle', 1)
GO
INSERT [dbo].[HR_tbl_Location] ([LocationID], [LocationName], [address], [isactive]) VALUES (48, N'SW St George West(POS)', N'Corner Duke and Richmond Street, Port-of-Spain', 1)
GO
INSERT [dbo].[HR_tbl_Location] ([LocationID], [LocationName], [address], [isactive]) VALUES (49, N'SW St Patrick East(Siparia)', N'Corner Allies & High Street Siparia', 1)
GO
INSERT [dbo].[HR_tbl_Location] ([LocationID], [LocationName], [address], [isactive]) VALUES (50, N'SW St Patrick West(Point Fortin/La Brea)', N'11 Richardson Street, Mahaica Point Fortin', 1)
GO
INSERT [dbo].[HR_tbl_Location] ([LocationID], [LocationName], [address], [isactive]) VALUES (51, N'SW Victoria East(Princes Town)', N'Marlson Building, 97 High st, Princes Town', 1)
GO
INSERT [dbo].[HR_tbl_Location] ([LocationID], [LocationName], [address], [isactive]) VALUES (52, N'SW Victoria West Local Board(San Fernando)', N'Omardeen Building 59-61 Cipero st., S''Fd', 1)
GO
INSERT [dbo].[HR_tbl_Location] ([LocationID], [LocationName], [address], [isactive]) VALUES (53, N'Tobago', N'NULL', 1)
GO
INSERT [dbo].[HR_tbl_Location] ([LocationID], [LocationName], [address], [isactive]) VALUES (54, N'Piparo', NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[HR_tbl_Location] OFF
GO
SET IDENTITY_INSERT [dbo].[HR_tbl_Position] ON 
GO
INSERT [dbo].[HR_tbl_Position] ([Pos_ID], [Pos_Name], [PositionSalary], [createdBy], [modifiedBy], [isActive]) VALUES (1, N'Analyst/Programmer', 1000.0000, NULL, NULL, 1)
GO
INSERT [dbo].[HR_tbl_Position] ([Pos_ID], [Pos_Name], [PositionSalary], [createdBy], [modifiedBy], [isActive]) VALUES (2, N'Business Operations Assistant I', 1000.0000, NULL, NULL, 1)
GO
INSERT [dbo].[HR_tbl_Position] ([Pos_ID], [Pos_Name], [PositionSalary], [createdBy], [modifiedBy], [isActive]) VALUES (3, N'Business Operations Assistant I (Help desk)', 1000.0000, NULL, NULL, 1)
GO
INSERT [dbo].[HR_tbl_Position] ([Pos_ID], [Pos_Name], [PositionSalary], [createdBy], [modifiedBy], [isActive]) VALUES (4, N'Database Specialist', 1000.0000, NULL, NULL, 1)
GO
INSERT [dbo].[HR_tbl_Position] ([Pos_ID], [Pos_Name], [PositionSalary], [createdBy], [modifiedBy], [isActive]) VALUES (5, N'Director ', 1000.0000, NULL, NULL, 1)
GO
INSERT [dbo].[HR_tbl_Position] ([Pos_ID], [Pos_Name], [PositionSalary], [createdBy], [modifiedBy], [isActive]) VALUES (6, N'Information Systems Specialist', 1000.0000, NULL, NULL, 1)
GO
INSERT [dbo].[HR_tbl_Position] ([Pos_ID], [Pos_Name], [PositionSalary], [createdBy], [modifiedBy], [isActive]) VALUES (7, N'Manager Service Delivery & Support', 1000.0000, NULL, NULL, 1)
GO
INSERT [dbo].[HR_tbl_Position] ([Pos_ID], [Pos_Name], [PositionSalary], [createdBy], [modifiedBy], [isActive]) VALUES (8, N'Manager Solutions Development and Implementation', 1000.0000, NULL, NULL, 1)
GO
INSERT [dbo].[HR_tbl_Position] ([Pos_ID], [Pos_Name], [PositionSalary], [createdBy], [modifiedBy], [isActive]) VALUES (9, N'Networking Specialist', 1000.0000, NULL, NULL, 1)
GO
INSERT [dbo].[HR_tbl_Position] ([Pos_ID], [Pos_Name], [PositionSalary], [createdBy], [modifiedBy], [isActive]) VALUES (10, N'On the Job Trainee', 1000.0000, NULL, NULL, 1)
GO
INSERT [dbo].[HR_tbl_Position] ([Pos_ID], [Pos_Name], [PositionSalary], [createdBy], [modifiedBy], [isActive]) VALUES (11, N'Security Specialist', 1000.0000, NULL, NULL, 1)
GO
INSERT [dbo].[HR_tbl_Position] ([Pos_ID], [Pos_Name], [PositionSalary], [createdBy], [modifiedBy], [isActive]) VALUES (12, N'Senior Database Specialist', 1000.0000, NULL, NULL, 1)
GO
INSERT [dbo].[HR_tbl_Position] ([Pos_ID], [Pos_Name], [PositionSalary], [createdBy], [modifiedBy], [isActive]) VALUES (13, N'Senior Information Systems Specialist ', 1000.0000, NULL, NULL, 1)
GO
INSERT [dbo].[HR_tbl_Position] ([Pos_ID], [Pos_Name], [PositionSalary], [createdBy], [modifiedBy], [isActive]) VALUES (14, N'Senior Information Systems Support Specialist', 1000.0000, NULL, NULL, 1)
GO
INSERT [dbo].[HR_tbl_Position] ([Pos_ID], [Pos_Name], [PositionSalary], [createdBy], [modifiedBy], [isActive]) VALUES (15, N'Senior Network Specialist', 1000.0000, NULL, NULL, 1)
GO
INSERT [dbo].[HR_tbl_Position] ([Pos_ID], [Pos_Name], [PositionSalary], [createdBy], [modifiedBy], [isActive]) VALUES (16, N'Technical Officer', 1000.0000, NULL, NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[HR_tbl_Position] OFF
GO
SET IDENTITY_INSERT [dbo].[HR_tbl_TakenLeave] ON 
GO
INSERT [dbo].[HR_tbl_TakenLeave] ([TakenLeaveID], [LeaveTypeID], [isactive], [EMP_ID], [start_date], [end_date], [LeaveDate]) VALUES (4, 15, NULL, 10, CAST(N'2021-05-03T00:00:00.000' AS DateTime), CAST(N'2021-05-03T00:00:00.000' AS DateTime), CAST(N'2021-05-03' AS Date))
GO
INSERT [dbo].[HR_tbl_TakenLeave] ([TakenLeaveID], [LeaveTypeID], [isactive], [EMP_ID], [start_date], [end_date], [LeaveDate]) VALUES (5, 13, NULL, 15, CAST(N'2021-04-03T00:00:00.000' AS DateTime), CAST(N'2021-04-03T00:00:00.000' AS DateTime), CAST(N'2021-04-03' AS Date))
GO
INSERT [dbo].[HR_tbl_TakenLeave] ([TakenLeaveID], [LeaveTypeID], [isactive], [EMP_ID], [start_date], [end_date], [LeaveDate]) VALUES (10, 6, NULL, 8, CAST(N'2021-03-31T00:00:00.000' AS DateTime), CAST(N'2021-03-31T00:00:00.000' AS DateTime), CAST(N'2021-03-31' AS Date))
GO
INSERT [dbo].[HR_tbl_TakenLeave] ([TakenLeaveID], [LeaveTypeID], [isactive], [EMP_ID], [start_date], [end_date], [LeaveDate]) VALUES (12, 1, NULL, 22, CAST(N'2021-04-30T00:00:00.000' AS DateTime), CAST(N'2021-04-30T00:00:00.000' AS DateTime), CAST(N'2021-04-30' AS Date))
GO
INSERT [dbo].[HR_tbl_TakenLeave] ([TakenLeaveID], [LeaveTypeID], [isactive], [EMP_ID], [start_date], [end_date], [LeaveDate]) VALUES (16, 4, NULL, 21, CAST(N'2021-04-27T00:00:00.000' AS DateTime), CAST(N'2021-04-27T00:00:00.000' AS DateTime), CAST(N'2021-04-27' AS Date))
GO
SET IDENTITY_INSERT [dbo].[HR_tbl_TakenLeave] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_val_sex] ON 
GO
INSERT [dbo].[tbl_val_sex] ([sid], [sex], [description]) VALUES (1, N'Male', NULL)
GO
INSERT [dbo].[tbl_val_sex] ([sid], [sex], [description]) VALUES (2, N'Female ', NULL)
GO
SET IDENTITY_INSERT [dbo].[tbl_val_sex] OFF
GO
ALTER TABLE [dbo].[HR_AttendanceRegister]  WITH CHECK ADD  CONSTRAINT [FK_HR_AttendanceRegisterEmployee] FOREIGN KEY([Emp_Id])
REFERENCES [dbo].[HR_tbl_Employee] ([EMP_ID])
GO
ALTER TABLE [dbo].[HR_AttendanceRegister] CHECK CONSTRAINT [FK_HR_AttendanceRegisterEmployee]
GO
ALTER TABLE [dbo].[HR_EmployeeContact]  WITH CHECK ADD  CONSTRAINT [FK_HR_EmployeeContact_HR_ContactType] FOREIGN KEY([ContactTypeID])
REFERENCES [dbo].[HR_ContactType] ([ContactTypeID])
GO
ALTER TABLE [dbo].[HR_EmployeeContact] CHECK CONSTRAINT [FK_HR_EmployeeContact_HR_ContactType]
GO
ALTER TABLE [dbo].[HR_EmployeeContact]  WITH CHECK ADD  CONSTRAINT [FK_HR_EmployeeContact_HR_tbl_Employee] FOREIGN KEY([EMP_ID])
REFERENCES [dbo].[HR_tbl_Employee] ([EMP_ID])
GO
ALTER TABLE [dbo].[HR_EmployeeContact] CHECK CONSTRAINT [FK_HR_EmployeeContact_HR_tbl_Employee]
GO
ALTER TABLE [dbo].[HR_tbl_ApprovedLeave]  WITH CHECK ADD  CONSTRAINT [FK_HR_Approvedleave] FOREIGN KEY([LeavetypeID])
REFERENCES [dbo].[HR_LeaveType] ([LeaveTypeID])
GO
ALTER TABLE [dbo].[HR_tbl_ApprovedLeave] CHECK CONSTRAINT [FK_HR_Approvedleave]
GO
ALTER TABLE [dbo].[HR_tbl_ApprovedLeave]  WITH CHECK ADD  CONSTRAINT [FK_HR_tbl_ApprovedLeave_HR_tbl_Employee] FOREIGN KEY([approvedBy])
REFERENCES [dbo].[HR_tbl_Employee] ([EMP_ID])
GO
ALTER TABLE [dbo].[HR_tbl_ApprovedLeave] CHECK CONSTRAINT [FK_HR_tbl_ApprovedLeave_HR_tbl_Employee]
GO
ALTER TABLE [dbo].[HR_tbl_Emp_Leave]  WITH CHECK ADD  CONSTRAINT [FK_EmpLeave] FOREIGN KEY([EmpStatus_ID])
REFERENCES [dbo].[HR_tbl_Employee] ([EMP_ID])
GO
ALTER TABLE [dbo].[HR_tbl_Emp_Leave] CHECK CONSTRAINT [FK_EmpLeave]
GO
ALTER TABLE [dbo].[HR_tbl_Emp_Leave]  WITH CHECK ADD  CONSTRAINT [FK_LeaveType] FOREIGN KEY([LeavetypeID])
REFERENCES [dbo].[HR_LeaveType] ([LeaveTypeID])
GO
ALTER TABLE [dbo].[HR_tbl_Emp_Leave] CHECK CONSTRAINT [FK_LeaveType]
GO
ALTER TABLE [dbo].[HR_tbl_Employee]  WITH CHECK ADD  CONSTRAINT [FK_department] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[HR_Department] ([DepartmentId])
GO
ALTER TABLE [dbo].[HR_tbl_Employee] CHECK CONSTRAINT [FK_department]
GO
ALTER TABLE [dbo].[HR_tbl_Employee]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeContact] FOREIGN KEY([contactID])
REFERENCES [dbo].[HR_EmployeeContact] ([contactID])
GO
ALTER TABLE [dbo].[HR_tbl_Employee] CHECK CONSTRAINT [FK_EmployeeContact]
GO
ALTER TABLE [dbo].[HR_tbl_Employee]  WITH CHECK ADD  CONSTRAINT [FK_gender] FOREIGN KEY([gender])
REFERENCES [dbo].[tbl_val_sex] ([sid])
GO
ALTER TABLE [dbo].[HR_tbl_Employee] CHECK CONSTRAINT [FK_gender]
GO
ALTER TABLE [dbo].[HR_tbl_Employee]  WITH CHECK ADD  CONSTRAINT [FK_HR_Employee_Manager] FOREIGN KEY([ReportingManager])
REFERENCES [dbo].[HR_tbl_Employee] ([EMP_ID])
GO
ALTER TABLE [dbo].[HR_tbl_Employee] CHECK CONSTRAINT [FK_HR_Employee_Manager]
GO
ALTER TABLE [dbo].[HR_tbl_Employee]  WITH CHECK ADD  CONSTRAINT [FK_HR_EmployeeStatus] FOREIGN KEY([Estatus])
REFERENCES [dbo].[HR_tbl_employmentStatus] ([EmpStatus_ID])
GO
ALTER TABLE [dbo].[HR_tbl_Employee] CHECK CONSTRAINT [FK_HR_EmployeeStatus]
GO
ALTER TABLE [dbo].[HR_tbl_Employee]  WITH CHECK ADD  CONSTRAINT [FK_HR_tbl_Location] FOREIGN KEY([LocationID])
REFERENCES [dbo].[HR_tbl_Location] ([LocationID])
GO
ALTER TABLE [dbo].[HR_tbl_Employee] CHECK CONSTRAINT [FK_HR_tbl_Location]
GO
ALTER TABLE [dbo].[HR_tbl_Employee]  WITH CHECK ADD  CONSTRAINT [FK_position] FOREIGN KEY([PosID])
REFERENCES [dbo].[HR_tbl_Position] ([Pos_ID])
GO
ALTER TABLE [dbo].[HR_tbl_Employee] CHECK CONSTRAINT [FK_position]
GO
ALTER TABLE [dbo].[HR_tbl_ROP_report]  WITH CHECK ADD  CONSTRAINT [FK_HR_Employee] FOREIGN KEY([EmpID])
REFERENCES [dbo].[HR_tbl_Employee] ([EMP_ID])
GO
ALTER TABLE [dbo].[HR_tbl_ROP_report] CHECK CONSTRAINT [FK_HR_Employee]
GO
ALTER TABLE [dbo].[HR_tbl_ROP_report]  WITH CHECK ADD  CONSTRAINT [FK_HR_tbl_department] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[HR_Department] ([DepartmentId])
GO
ALTER TABLE [dbo].[HR_tbl_ROP_report] CHECK CONSTRAINT [FK_HR_tbl_department]
GO
ALTER TABLE [dbo].[HR_tbl_SummaryReport]  WITH CHECK ADD  CONSTRAINT [FK_Employee] FOREIGN KEY([EmpId])
REFERENCES [dbo].[HR_tbl_Employee] ([EMP_ID])
GO
ALTER TABLE [dbo].[HR_tbl_SummaryReport] CHECK CONSTRAINT [FK_Employee]
GO
ALTER TABLE [dbo].[HR_tbl_SummaryReport]  WITH CHECK ADD  CONSTRAINT [FK_summaryDepartment] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[HR_Department] ([DepartmentId])
GO
ALTER TABLE [dbo].[HR_tbl_SummaryReport] CHECK CONSTRAINT [FK_summaryDepartment]
GO
ALTER TABLE [dbo].[HR_tbl_TakenLeave]  WITH CHECK ADD  CONSTRAINT [FK_HR_tbl_TakenLeave_HR_LeaveType] FOREIGN KEY([LeaveTypeID])
REFERENCES [dbo].[HR_LeaveType] ([LeaveTypeID])
GO
ALTER TABLE [dbo].[HR_tbl_TakenLeave] CHECK CONSTRAINT [FK_HR_tbl_TakenLeave_HR_LeaveType]
GO
ALTER TABLE [dbo].[tbl_val_sex]  WITH CHECK ADD  CONSTRAINT [FK_tbl_val_sex_tbl_val_sex] FOREIGN KEY([sid])
REFERENCES [dbo].[tbl_val_sex] ([sid])
GO
ALTER TABLE [dbo].[tbl_val_sex] CHECK CONSTRAINT [FK_tbl_val_sex_tbl_val_sex]
GO
/****** Object:  StoredProcedure [dbo].[spGetDeptAttendance]    Script Date: 27/04/2021 4:20:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[spGetDeptAttendance]@deptID int
AS
Begin

SELECT TOP (1000) [AttendanceID]
	,ar.[Emp_Id]
	,emp.firstName+' '+emp.Lastname as FullName
	,AttendanceDate
	,[TimeIN]
	,[TimeOUT]
	--,[AttendLeaveID]
	,case
		when Absent= 1 then 'Present'
		else 'Absent'
	end as Absent
	,[note]
	,ar.[DateCreated]
FROM [dbo].[HR_AttendanceRegister] as ar
inner join dbo.HR_tbl_Employee emp on emp.EMP_ID=ar.EMP_Id
left join dbo.HR_Department as dept on dept.DepartmentId=emp.DepartmentID


where dept.DepartmentId=@deptID
order by ar.[AttendanceID] desc
End
GO
