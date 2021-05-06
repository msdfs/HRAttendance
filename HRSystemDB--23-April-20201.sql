USE [HRSystem]
GO
/****** Object:  Table [dbo].[HR_Department]    Script Date: 4/23/2021 8:41:32 AM ******/
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
/****** Object:  Table [dbo].[HR_tbl_Position]    Script Date: 4/23/2021 8:41:32 AM ******/
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
/****** Object:  Table [dbo].[HR_AttendanceRegister]    Script Date: 4/23/2021 8:41:32 AM ******/
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
/****** Object:  Table [dbo].[HR_tbl_Employee]    Script Date: 4/23/2021 8:41:32 AM ******/
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
/****** Object:  View [dbo].[View_Days_Worked]    Script Date: 4/23/2021 8:41:32 AM ******/
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
/****** Object:  Table [dbo].[Book1]    Script Date: 4/23/2021 8:41:32 AM ******/
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
/****** Object:  Table [dbo].[HR_ContactType]    Script Date: 4/23/2021 8:41:32 AM ******/
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
/****** Object:  Table [dbo].[HR_EmployeeContact]    Script Date: 4/23/2021 8:41:32 AM ******/
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
/****** Object:  Table [dbo].[HR_LeaveType]    Script Date: 4/23/2021 8:41:32 AM ******/
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
/****** Object:  Table [dbo].[HR_tbl_ApprovedLeave]    Script Date: 4/23/2021 8:41:32 AM ******/
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
/****** Object:  Table [dbo].[HR_tbl_Emp_Leave]    Script Date: 4/23/2021 8:41:32 AM ******/
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
/****** Object:  Table [dbo].[HR_tbl_employmentStatus]    Script Date: 4/23/2021 8:41:32 AM ******/
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
/****** Object:  Table [dbo].[HR_tbl_Location]    Script Date: 4/23/2021 8:41:32 AM ******/
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
/****** Object:  Table [dbo].[HR_tbl_ROP_report]    Script Date: 4/23/2021 8:41:32 AM ******/
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
/****** Object:  Table [dbo].[HR_tbl_SummaryReport]    Script Date: 4/23/2021 8:41:32 AM ******/
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
/****** Object:  Table [dbo].[HR_tbl_TakenLeave]    Script Date: 4/23/2021 8:41:32 AM ******/
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
/****** Object:  Table [dbo].[tbl_val_sex]    Script Date: 4/23/2021 8:41:32 AM ******/
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
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (21, 30, CAST(N'2021-02-01' AS Date), CAST(N'2021-04-19T08:23:00' AS SmallDateTime), CAST(N'2021-04-19T04:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (22, 30, CAST(N'2021-02-02' AS Date), CAST(N'2021-04-19T08:30:00' AS SmallDateTime), CAST(N'2021-04-19T04:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (23, 30, CAST(N'2021-02-04' AS Date), CAST(N'2021-02-04T00:00:00' AS SmallDateTime), CAST(N'2021-02-04T00:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (24, 30, CAST(N'2021-02-05' AS Date), CAST(N'2021-04-19T08:30:00' AS SmallDateTime), CAST(N'2021-04-19T04:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (36, 30, CAST(N'2021-02-08' AS Date), CAST(N'2021-02-08T08:30:00' AS SmallDateTime), CAST(N'2021-02-08T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (37, 30, CAST(N'2021-02-09' AS Date), CAST(N'2021-02-09T08:10:00' AS SmallDateTime), CAST(N'2021-02-09T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (38, 30, CAST(N'2021-02-10' AS Date), CAST(N'2021-02-10T09:15:00' AS SmallDateTime), CAST(N'2021-02-10T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (39, 30, CAST(N'2021-02-11' AS Date), CAST(N'2021-02-11T08:30:00' AS SmallDateTime), CAST(N'2021-02-11T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (40, 30, CAST(N'2021-02-12' AS Date), CAST(N'2021-02-12T09:00:00' AS SmallDateTime), CAST(N'2021-02-12T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (42, 12, CAST(N'2021-04-13' AS Date), CAST(N'2021-04-19T05:00:00' AS SmallDateTime), CAST(N'2021-04-19T07:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (50, 7, CAST(N'2021-02-01' AS Date), CAST(N'2021-02-01T07:00:00' AS SmallDateTime), CAST(N'2021-02-01T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 0)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (51, 8, CAST(N'2021-02-01' AS Date), CAST(N'2021-02-01T07:00:00' AS SmallDateTime), CAST(N'2021-02-01T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 0)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (52, 20, CAST(N'2021-02-01' AS Date), CAST(N'2021-02-01T00:00:00' AS SmallDateTime), CAST(N'2021-02-01T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (53, 11, CAST(N'2021-02-01' AS Date), CAST(N'2021-02-01T06:28:00' AS SmallDateTime), CAST(N'2021-02-01T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (54, 10, CAST(N'2021-02-01' AS Date), CAST(N'2021-02-01T06:22:00' AS SmallDateTime), CAST(N'2021-02-01T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (55, 13, CAST(N'2021-02-01' AS Date), CAST(N'2021-02-01T07:20:00' AS SmallDateTime), CAST(N'2021-02-01T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (56, 33, CAST(N'2021-02-01' AS Date), CAST(N'2021-02-01T08:00:00' AS SmallDateTime), CAST(N'2021-02-01T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (57, 15, CAST(N'2021-02-01' AS Date), CAST(N'2021-02-01T08:00:00' AS SmallDateTime), CAST(N'2021-02-01T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (58, 12, CAST(N'2021-02-01' AS Date), CAST(N'2021-02-01T08:35:00' AS SmallDateTime), CAST(N'2021-02-01T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (59, 32, CAST(N'2021-02-01' AS Date), CAST(N'2021-02-01T08:00:00' AS SmallDateTime), CAST(N'2021-02-01T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (60, 31, CAST(N'2021-02-01' AS Date), CAST(N'2021-02-01T07:02:00' AS SmallDateTime), CAST(N'2021-02-01T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (61, 14, CAST(N'2021-02-01' AS Date), CAST(N'2021-02-01T08:00:00' AS SmallDateTime), CAST(N'2021-02-01T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (62, 37, CAST(N'2021-02-01' AS Date), CAST(N'2021-02-01T06:10:00' AS SmallDateTime), CAST(N'2021-02-01T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (63, 38, CAST(N'2021-02-01' AS Date), CAST(N'2021-02-01T00:00:00' AS SmallDateTime), CAST(N'2021-02-01T00:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (64, 36, CAST(N'2021-02-01' AS Date), CAST(N'2021-02-01T09:12:00' AS SmallDateTime), CAST(N'2021-02-01T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (66, 19, CAST(N'2021-02-01' AS Date), CAST(N'2021-02-01T08:20:00' AS SmallDateTime), CAST(N'2021-02-01T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (67, 22, CAST(N'2021-02-01' AS Date), CAST(N'2021-02-01T08:20:00' AS SmallDateTime), CAST(N'2021-02-01T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (68, 21, CAST(N'2021-02-01' AS Date), CAST(N'2021-02-01T08:00:00' AS SmallDateTime), CAST(N'2021-02-01T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (69, 29, CAST(N'2021-02-01' AS Date), CAST(N'2021-02-01T06:15:00' AS SmallDateTime), CAST(N'2021-02-01T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (70, 27, CAST(N'2021-02-01' AS Date), CAST(N'2021-02-01T08:00:00' AS SmallDateTime), CAST(N'2021-02-01T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (71, 26, CAST(N'2021-02-01' AS Date), CAST(N'2021-02-01T07:20:00' AS SmallDateTime), CAST(N'2021-02-01T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (72, 25, CAST(N'2021-02-01' AS Date), CAST(N'2021-02-01T07:42:00' AS SmallDateTime), CAST(N'2021-02-01T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (73, 34, CAST(N'2021-02-01' AS Date), CAST(N'2021-02-01T08:30:00' AS SmallDateTime), CAST(N'2021-02-01T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (74, 24, CAST(N'2021-02-01' AS Date), CAST(N'2021-02-01T09:40:00' AS SmallDateTime), CAST(N'2021-02-01T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (75, 35, CAST(N'2021-02-01' AS Date), CAST(N'2021-02-01T07:50:00' AS SmallDateTime), CAST(N'2021-02-01T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (76, 28, CAST(N'2021-02-01' AS Date), CAST(N'2021-02-01T06:28:00' AS SmallDateTime), CAST(N'2021-02-01T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (77, 23, CAST(N'2021-02-01' AS Date), CAST(N'2021-02-01T08:17:00' AS SmallDateTime), CAST(N'2021-02-01T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (78, 18, CAST(N'2021-02-01' AS Date), CAST(N'2021-02-01T08:00:00' AS SmallDateTime), CAST(N'2021-02-01T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (79, 9, CAST(N'2021-02-01' AS Date), CAST(N'2021-02-01T08:00:00' AS SmallDateTime), CAST(N'2021-02-01T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (80, 16, CAST(N'2021-02-01' AS Date), CAST(N'2021-02-01T07:20:00' AS SmallDateTime), CAST(N'2021-02-01T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (81, 17, CAST(N'2021-02-01' AS Date), CAST(N'2021-02-01T08:00:00' AS SmallDateTime), CAST(N'2021-02-01T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (82, 7, CAST(N'2021-02-02' AS Date), CAST(N'2021-02-02T07:00:00' AS SmallDateTime), CAST(N'2021-02-02T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 0)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (83, 8, CAST(N'2021-02-02' AS Date), CAST(N'2021-02-02T00:00:00' AS SmallDateTime), CAST(N'2021-02-02T00:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 0)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (84, 20, CAST(N'2021-02-02' AS Date), CAST(N'2021-02-02T07:42:00' AS SmallDateTime), CAST(N'2021-02-02T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (85, 11, CAST(N'2021-02-02' AS Date), CAST(N'2021-02-02T06:30:00' AS SmallDateTime), CAST(N'2021-02-02T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (86, 10, CAST(N'2021-02-02' AS Date), CAST(N'2021-02-02T06:21:00' AS SmallDateTime), CAST(N'2021-02-02T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (87, 13, CAST(N'2021-02-02' AS Date), CAST(N'2021-02-02T07:15:00' AS SmallDateTime), CAST(N'2021-02-02T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (88, 33, CAST(N'2021-02-02' AS Date), CAST(N'2021-02-02T08:00:00' AS SmallDateTime), CAST(N'2021-02-02T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (89, 15, CAST(N'2021-02-02' AS Date), CAST(N'2021-02-02T08:00:00' AS SmallDateTime), CAST(N'2021-02-02T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (90, 12, CAST(N'2021-02-02' AS Date), CAST(N'2021-02-02T08:45:00' AS SmallDateTime), CAST(N'2021-02-02T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (91, 32, CAST(N'2021-02-02' AS Date), CAST(N'2021-02-02T08:00:00' AS SmallDateTime), CAST(N'2021-02-02T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (92, 31, CAST(N'2021-02-02' AS Date), CAST(N'2021-02-02T07:00:00' AS SmallDateTime), CAST(N'2021-02-02T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (93, 14, CAST(N'2021-02-02' AS Date), CAST(N'2021-02-02T08:00:00' AS SmallDateTime), CAST(N'2021-02-02T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (94, 37, CAST(N'2021-02-02' AS Date), CAST(N'2021-02-02T08:26:00' AS SmallDateTime), CAST(N'2021-02-02T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (95, 38, CAST(N'2021-02-02' AS Date), CAST(N'2021-02-02T00:00:00' AS SmallDateTime), CAST(N'2021-02-02T00:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (96, 36, CAST(N'2021-02-02' AS Date), CAST(N'2021-02-02T06:23:00' AS SmallDateTime), CAST(N'2021-02-02T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (98, 19, CAST(N'2021-02-02' AS Date), CAST(N'2021-02-02T08:23:00' AS SmallDateTime), CAST(N'2021-02-02T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (99, 22, CAST(N'2021-02-02' AS Date), CAST(N'2021-02-02T07:14:00' AS SmallDateTime), CAST(N'2021-02-02T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (100, 21, CAST(N'2021-02-02' AS Date), CAST(N'2021-02-02T07:03:00' AS SmallDateTime), CAST(N'2021-02-02T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (101, 29, CAST(N'2021-02-02' AS Date), CAST(N'2021-02-02T08:00:00' AS SmallDateTime), CAST(N'2021-02-02T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (102, 27, CAST(N'2021-02-02' AS Date), CAST(N'2021-02-02T07:46:00' AS SmallDateTime), CAST(N'2021-02-02T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (103, 26, CAST(N'2021-02-02' AS Date), CAST(N'2021-02-02T07:35:00' AS SmallDateTime), CAST(N'2021-02-02T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (104, 25, CAST(N'2021-02-02' AS Date), CAST(N'2021-02-02T07:54:00' AS SmallDateTime), CAST(N'2021-02-02T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (105, 34, CAST(N'2021-02-02' AS Date), CAST(N'2021-02-02T08:19:00' AS SmallDateTime), CAST(N'2021-02-02T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (106, 24, CAST(N'2021-02-02' AS Date), CAST(N'2021-02-02T09:35:00' AS SmallDateTime), CAST(N'2021-02-02T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (107, 35, CAST(N'2021-02-02' AS Date), CAST(N'2021-02-02T08:17:00' AS SmallDateTime), CAST(N'2021-02-02T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (108, 28, CAST(N'2021-02-02' AS Date), CAST(N'2021-02-02T06:22:00' AS SmallDateTime), CAST(N'2021-02-02T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (109, 23, CAST(N'2021-02-02' AS Date), CAST(N'2021-02-02T08:23:00' AS SmallDateTime), CAST(N'2021-02-02T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (110, 18, CAST(N'2021-02-02' AS Date), CAST(N'2021-02-02T07:52:00' AS SmallDateTime), CAST(N'2021-02-02T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (111, 9, CAST(N'2021-02-02' AS Date), CAST(N'2021-02-02T10:45:00' AS SmallDateTime), CAST(N'2021-02-02T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (112, 16, CAST(N'2021-02-02' AS Date), CAST(N'2021-02-02T08:05:00' AS SmallDateTime), CAST(N'2021-02-02T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (113, 17, CAST(N'2021-02-02' AS Date), CAST(N'2021-02-02T08:06:00' AS SmallDateTime), CAST(N'2021-02-02T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (114, 7, CAST(N'2021-02-03' AS Date), CAST(N'2021-02-03T07:00:00' AS SmallDateTime), CAST(N'2021-02-03T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 0)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (115, 8, CAST(N'2021-02-03' AS Date), CAST(N'2021-02-03T07:00:00' AS SmallDateTime), CAST(N'2021-02-03T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 0)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (116, 20, CAST(N'2021-02-03' AS Date), CAST(N'2021-02-03T07:52:00' AS SmallDateTime), CAST(N'2021-02-03T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (117, 11, CAST(N'2021-02-03' AS Date), CAST(N'2021-02-03T07:00:00' AS SmallDateTime), CAST(N'2021-02-03T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (118, 10, CAST(N'2021-02-03' AS Date), CAST(N'2021-02-03T06:23:00' AS SmallDateTime), CAST(N'2021-02-03T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (119, 13, CAST(N'2021-02-03' AS Date), CAST(N'2021-02-03T07:25:00' AS SmallDateTime), CAST(N'2021-02-03T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (120, 33, CAST(N'2021-02-03' AS Date), CAST(N'2021-02-03T08:00:00' AS SmallDateTime), CAST(N'2021-02-03T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (121, 15, CAST(N'2021-02-03' AS Date), CAST(N'2021-02-03T08:00:00' AS SmallDateTime), CAST(N'2021-02-03T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (122, 12, CAST(N'2021-02-03' AS Date), CAST(N'2021-02-03T08:33:00' AS SmallDateTime), CAST(N'2021-02-03T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (123, 32, CAST(N'2021-02-03' AS Date), CAST(N'2021-02-03T08:00:00' AS SmallDateTime), CAST(N'2021-02-03T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (124, 31, CAST(N'2021-02-03' AS Date), CAST(N'2021-02-03T06:33:00' AS SmallDateTime), CAST(N'2021-02-03T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (125, 14, CAST(N'2021-02-03' AS Date), CAST(N'2021-02-03T09:25:00' AS SmallDateTime), CAST(N'2021-02-03T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (126, 37, CAST(N'2021-02-03' AS Date), CAST(N'2021-02-03T06:50:00' AS SmallDateTime), CAST(N'2021-02-03T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (127, 38, CAST(N'2021-02-03' AS Date), CAST(N'2021-02-03T00:00:00' AS SmallDateTime), CAST(N'2021-02-03T00:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (128, 36, CAST(N'2021-02-03' AS Date), CAST(N'2021-02-03T00:00:00' AS SmallDateTime), CAST(N'2021-02-03T00:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (129, 19, CAST(N'2021-02-03' AS Date), CAST(N'2021-02-03T08:24:00' AS SmallDateTime), CAST(N'2021-02-03T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (130, 22, CAST(N'2021-02-03' AS Date), CAST(N'2021-02-03T07:08:00' AS SmallDateTime), CAST(N'2021-02-03T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (131, 21, CAST(N'2021-02-03' AS Date), CAST(N'2021-02-03T08:00:00' AS SmallDateTime), CAST(N'2021-02-03T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (132, 29, CAST(N'2021-02-03' AS Date), CAST(N'2021-02-03T06:22:00' AS SmallDateTime), CAST(N'2021-02-03T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (133, 27, CAST(N'2021-02-03' AS Date), CAST(N'2021-02-03T08:00:00' AS SmallDateTime), CAST(N'2021-02-03T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (134, 26, CAST(N'2021-02-03' AS Date), CAST(N'2021-02-03T07:25:00' AS SmallDateTime), CAST(N'2021-02-03T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (135, 25, CAST(N'2021-02-03' AS Date), CAST(N'2021-02-03T07:52:00' AS SmallDateTime), CAST(N'2021-02-03T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (136, 34, CAST(N'2021-02-03' AS Date), CAST(N'2021-02-03T08:20:00' AS SmallDateTime), CAST(N'2021-02-03T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (137, 24, CAST(N'2021-02-03' AS Date), CAST(N'2021-02-03T09:40:00' AS SmallDateTime), CAST(N'2021-02-03T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (138, 35, CAST(N'2021-02-03' AS Date), CAST(N'2021-02-03T07:35:00' AS SmallDateTime), CAST(N'2021-02-03T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (139, 28, CAST(N'2021-02-03' AS Date), CAST(N'2021-02-03T06:22:00' AS SmallDateTime), CAST(N'2021-02-03T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (140, 23, CAST(N'2021-02-03' AS Date), CAST(N'2021-02-03T08:12:00' AS SmallDateTime), CAST(N'2021-02-03T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (141, 18, CAST(N'2021-02-03' AS Date), CAST(N'2021-02-03T08:00:00' AS SmallDateTime), CAST(N'2021-02-03T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (142, 9, CAST(N'2021-02-03' AS Date), CAST(N'2021-02-03T07:10:00' AS SmallDateTime), CAST(N'2021-02-03T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (143, 16, CAST(N'2021-02-03' AS Date), CAST(N'2021-02-03T07:00:00' AS SmallDateTime), CAST(N'2021-02-03T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (144, 17, CAST(N'2021-02-03' AS Date), CAST(N'2021-02-03T07:55:00' AS SmallDateTime), CAST(N'2021-02-03T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (145, 7, CAST(N'2021-02-04' AS Date), CAST(N'2021-02-04T07:00:00' AS SmallDateTime), CAST(N'2021-02-04T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 0)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (146, 8, CAST(N'2021-02-04' AS Date), CAST(N'2021-02-04T07:00:00' AS SmallDateTime), CAST(N'2021-02-04T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 0)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (147, 20, CAST(N'2021-02-04' AS Date), CAST(N'2021-02-04T07:18:00' AS SmallDateTime), CAST(N'2021-02-04T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (148, 11, CAST(N'2021-02-04' AS Date), CAST(N'2021-02-04T07:00:00' AS SmallDateTime), CAST(N'2021-02-04T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (149, 10, CAST(N'2021-02-04' AS Date), CAST(N'2021-02-04T06:16:00' AS SmallDateTime), CAST(N'2021-02-04T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (150, 13, CAST(N'2021-02-04' AS Date), CAST(N'2021-02-04T07:50:00' AS SmallDateTime), CAST(N'2021-02-04T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (151, 33, CAST(N'2021-02-04' AS Date), CAST(N'2021-02-04T08:00:00' AS SmallDateTime), CAST(N'2021-02-04T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (152, 15, CAST(N'2021-02-04' AS Date), CAST(N'2021-02-04T07:51:00' AS SmallDateTime), CAST(N'2021-02-04T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (153, 12, CAST(N'2021-02-04' AS Date), CAST(N'2021-02-04T08:33:00' AS SmallDateTime), CAST(N'2021-02-04T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (154, 32, CAST(N'2021-02-04' AS Date), CAST(N'2021-02-04T08:00:00' AS SmallDateTime), CAST(N'2021-02-04T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (155, 31, CAST(N'2021-02-04' AS Date), CAST(N'2021-02-04T07:00:00' AS SmallDateTime), CAST(N'2021-02-04T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (156, 14, CAST(N'2021-02-04' AS Date), CAST(N'2021-02-04T08:00:00' AS SmallDateTime), CAST(N'2021-02-04T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (157, 37, CAST(N'2021-02-04' AS Date), CAST(N'2021-02-04T00:00:00' AS SmallDateTime), CAST(N'2021-02-04T00:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (158, 38, CAST(N'2021-02-04' AS Date), CAST(N'2021-02-04T00:00:00' AS SmallDateTime), CAST(N'2021-02-04T00:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (159, 36, CAST(N'2021-02-04' AS Date), CAST(N'2021-02-04T06:22:00' AS SmallDateTime), CAST(N'2021-02-04T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (160, 19, CAST(N'2021-02-04' AS Date), CAST(N'2021-02-04T08:18:00' AS SmallDateTime), CAST(N'2021-02-04T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (161, 22, CAST(N'2021-02-04' AS Date), CAST(N'2021-02-04T07:09:00' AS SmallDateTime), CAST(N'2021-02-04T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (162, 21, CAST(N'2021-02-04' AS Date), CAST(N'2021-02-04T06:35:00' AS SmallDateTime), CAST(N'2021-02-04T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (163, 29, CAST(N'2021-02-04' AS Date), CAST(N'2021-02-04T08:00:00' AS SmallDateTime), CAST(N'2021-02-04T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (164, 27, CAST(N'2021-02-04' AS Date), CAST(N'2021-02-04T07:53:00' AS SmallDateTime), CAST(N'2021-02-04T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (165, 26, CAST(N'2021-02-04' AS Date), CAST(N'2021-02-04T07:25:00' AS SmallDateTime), CAST(N'2021-02-04T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (166, 25, CAST(N'2021-02-04' AS Date), CAST(N'2021-02-04T07:46:00' AS SmallDateTime), CAST(N'2021-02-04T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (167, 34, CAST(N'2021-02-04' AS Date), CAST(N'2021-02-04T00:00:00' AS SmallDateTime), CAST(N'2021-02-04T00:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (168, 24, CAST(N'2021-02-04' AS Date), CAST(N'2021-02-04T09:41:00' AS SmallDateTime), CAST(N'2021-02-04T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (169, 35, CAST(N'2021-02-04' AS Date), CAST(N'2021-02-04T07:42:00' AS SmallDateTime), CAST(N'2021-02-04T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (170, 28, CAST(N'2021-02-04' AS Date), CAST(N'2021-02-04T06:19:00' AS SmallDateTime), CAST(N'2021-02-04T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (171, 23, CAST(N'2021-02-04' AS Date), CAST(N'2021-02-04T09:51:00' AS SmallDateTime), CAST(N'2021-02-04T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (172, 18, CAST(N'2021-02-04' AS Date), CAST(N'2021-02-04T08:07:00' AS SmallDateTime), CAST(N'2021-02-04T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (173, 9, CAST(N'2021-02-04' AS Date), CAST(N'2021-02-04T07:35:00' AS SmallDateTime), CAST(N'2021-02-04T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (174, 16, CAST(N'2021-02-04' AS Date), CAST(N'2021-02-04T06:50:00' AS SmallDateTime), CAST(N'2021-02-04T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (175, 17, CAST(N'2021-02-04' AS Date), CAST(N'2021-02-04T07:55:00' AS SmallDateTime), CAST(N'2021-02-04T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (176, 7, CAST(N'2021-02-05' AS Date), CAST(N'2021-02-05T07:00:00' AS SmallDateTime), CAST(N'2021-02-05T16:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 0)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (177, 8, CAST(N'2021-02-05' AS Date), CAST(N'2021-02-05T07:00:00' AS SmallDateTime), CAST(N'2021-02-05T15:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 0)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (178, 20, CAST(N'2021-02-05' AS Date), CAST(N'2021-02-05T08:05:00' AS SmallDateTime), CAST(N'2021-02-05T16:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (179, 11, CAST(N'2021-02-05' AS Date), CAST(N'2021-02-05T07:05:00' AS SmallDateTime), CAST(N'2021-02-05T15:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (180, 10, CAST(N'2021-02-05' AS Date), CAST(N'2021-02-05T06:21:00' AS SmallDateTime), CAST(N'2021-02-05T15:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (181, 13, CAST(N'2021-02-05' AS Date), CAST(N'2021-02-05T07:40:00' AS SmallDateTime), CAST(N'2021-02-05T16:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (182, 33, CAST(N'2021-02-05' AS Date), CAST(N'2021-02-05T05:25:00' AS SmallDateTime), CAST(N'2021-02-05T16:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (183, 15, CAST(N'2021-02-05' AS Date), CAST(N'2021-02-05T08:00:00' AS SmallDateTime), CAST(N'2021-02-05T16:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (184, 12, CAST(N'2021-02-05' AS Date), CAST(N'2021-02-05T08:35:00' AS SmallDateTime), CAST(N'2021-02-05T16:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (185, 32, CAST(N'2021-02-05' AS Date), CAST(N'2021-02-05T08:00:00' AS SmallDateTime), CAST(N'2021-02-05T16:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (186, 31, CAST(N'2021-02-05' AS Date), CAST(N'2021-02-05T06:55:00' AS SmallDateTime), CAST(N'2021-02-05T16:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (187, 14, CAST(N'2021-02-05' AS Date), CAST(N'2021-02-05T07:05:00' AS SmallDateTime), CAST(N'2021-02-05T16:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (188, 37, CAST(N'2021-02-05' AS Date), CAST(N'2021-02-05T07:00:00' AS SmallDateTime), CAST(N'2021-02-05T15:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (189, 38, CAST(N'2021-02-05' AS Date), CAST(N'2021-02-05T00:00:00' AS SmallDateTime), CAST(N'2021-02-05T00:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (190, 36, CAST(N'2021-02-05' AS Date), CAST(N'2021-02-05T06:20:00' AS SmallDateTime), CAST(N'2021-02-05T15:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (191, 19, CAST(N'2021-02-05' AS Date), CAST(N'2021-02-05T08:15:00' AS SmallDateTime), CAST(N'2021-02-05T16:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (192, 22, CAST(N'2021-02-05' AS Date), CAST(N'2021-02-05T07:28:00' AS SmallDateTime), CAST(N'2021-02-05T16:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (193, 21, CAST(N'2021-02-05' AS Date), CAST(N'2021-02-05T08:00:00' AS SmallDateTime), CAST(N'2021-02-05T16:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (194, 29, CAST(N'2021-02-05' AS Date), CAST(N'2021-02-05T06:15:00' AS SmallDateTime), CAST(N'2021-02-05T16:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (195, 27, CAST(N'2021-02-05' AS Date), CAST(N'2021-02-05T08:00:00' AS SmallDateTime), CAST(N'2021-02-05T16:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (196, 26, CAST(N'2021-02-05' AS Date), CAST(N'2021-02-05T07:15:00' AS SmallDateTime), CAST(N'2021-02-05T15:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (197, 25, CAST(N'2021-02-05' AS Date), CAST(N'2021-02-05T08:05:00' AS SmallDateTime), CAST(N'2021-02-05T16:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (198, 34, CAST(N'2021-02-05' AS Date), CAST(N'2021-02-05T08:40:00' AS SmallDateTime), CAST(N'2021-02-05T00:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (199, 24, CAST(N'2021-02-05' AS Date), CAST(N'2021-02-05T09:45:00' AS SmallDateTime), CAST(N'2021-02-05T16:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (200, 35, CAST(N'2021-02-05' AS Date), CAST(N'2021-02-05T07:15:00' AS SmallDateTime), CAST(N'2021-02-05T16:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (201, 28, CAST(N'2021-02-05' AS Date), CAST(N'2021-02-05T06:27:00' AS SmallDateTime), CAST(N'2021-02-05T15:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (202, 23, CAST(N'2021-02-05' AS Date), CAST(N'2021-02-05T08:30:00' AS SmallDateTime), CAST(N'2021-02-05T16:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (203, 18, CAST(N'2021-02-05' AS Date), CAST(N'2021-02-05T07:25:00' AS SmallDateTime), CAST(N'2021-02-05T16:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (204, 9, CAST(N'2021-02-05' AS Date), CAST(N'2021-02-05T07:45:00' AS SmallDateTime), CAST(N'2021-02-05T16:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (205, 16, CAST(N'2021-02-05' AS Date), CAST(N'2021-02-05T07:00:00' AS SmallDateTime), CAST(N'2021-02-05T15:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (207, 7, CAST(N'2021-02-08' AS Date), CAST(N'2021-02-08T07:00:00' AS SmallDateTime), CAST(N'2021-02-08T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 0)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (208, 8, CAST(N'2021-02-08' AS Date), CAST(N'2021-02-08T07:00:00' AS SmallDateTime), CAST(N'2021-02-08T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 0)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (209, 20, CAST(N'2021-02-08' AS Date), CAST(N'2021-02-08T08:20:00' AS SmallDateTime), CAST(N'2021-02-08T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (210, 11, CAST(N'2021-02-08' AS Date), CAST(N'2021-02-08T06:30:00' AS SmallDateTime), CAST(N'2021-02-08T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (211, 10, CAST(N'2021-02-08' AS Date), CAST(N'2021-02-08T06:23:00' AS SmallDateTime), CAST(N'2021-02-08T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (212, 13, CAST(N'2021-02-08' AS Date), CAST(N'2021-02-08T07:30:00' AS SmallDateTime), CAST(N'2021-02-08T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (213, 33, CAST(N'2021-02-08' AS Date), CAST(N'2021-02-08T08:00:00' AS SmallDateTime), CAST(N'2021-02-08T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (214, 15, CAST(N'2021-02-08' AS Date), CAST(N'2021-02-08T08:00:00' AS SmallDateTime), CAST(N'2021-02-08T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (215, 12, CAST(N'2021-02-08' AS Date), CAST(N'2021-02-08T08:15:00' AS SmallDateTime), CAST(N'2021-02-08T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (216, 32, CAST(N'2021-02-08' AS Date), CAST(N'2021-02-08T08:00:00' AS SmallDateTime), CAST(N'2021-02-08T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (217, 31, CAST(N'2021-02-08' AS Date), CAST(N'2021-02-08T06:51:00' AS SmallDateTime), CAST(N'2021-02-08T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (218, 14, CAST(N'2021-02-08' AS Date), CAST(N'2021-02-08T08:00:00' AS SmallDateTime), CAST(N'2021-02-08T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (219, 37, CAST(N'2021-02-08' AS Date), CAST(N'2021-02-08T06:44:00' AS SmallDateTime), CAST(N'2021-02-08T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (220, 38, CAST(N'2021-02-08' AS Date), CAST(N'2021-02-08T00:00:00' AS SmallDateTime), CAST(N'2021-02-08T00:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (221, 36, CAST(N'2021-02-08' AS Date), CAST(N'2021-02-08T06:23:00' AS SmallDateTime), CAST(N'2021-02-08T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (222, 19, CAST(N'2021-02-08' AS Date), CAST(N'2021-02-08T08:45:00' AS SmallDateTime), CAST(N'2021-02-08T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (223, 22, CAST(N'2021-02-08' AS Date), CAST(N'2021-02-08T08:15:00' AS SmallDateTime), CAST(N'2021-02-08T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (224, 21, CAST(N'2021-02-08' AS Date), CAST(N'2021-02-08T06:30:00' AS SmallDateTime), CAST(N'2021-02-08T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (225, 29, CAST(N'2021-02-08' AS Date), CAST(N'2021-02-08T06:20:00' AS SmallDateTime), CAST(N'2021-02-08T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (226, 27, CAST(N'2021-02-08' AS Date), CAST(N'2021-02-08T07:41:00' AS SmallDateTime), CAST(N'2021-02-08T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (227, 26, CAST(N'2021-02-08' AS Date), CAST(N'2021-02-08T07:20:00' AS SmallDateTime), CAST(N'2021-02-08T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (228, 25, CAST(N'2021-02-08' AS Date), CAST(N'2021-02-08T07:47:00' AS SmallDateTime), CAST(N'2021-02-08T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (229, 34, CAST(N'2021-02-08' AS Date), CAST(N'2021-02-08T08:30:00' AS SmallDateTime), CAST(N'2021-02-08T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (230, 24, CAST(N'2021-02-08' AS Date), CAST(N'2021-02-08T09:15:00' AS SmallDateTime), CAST(N'2021-02-08T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (231, 35, CAST(N'2021-02-08' AS Date), CAST(N'2021-02-08T08:30:00' AS SmallDateTime), CAST(N'2021-02-08T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (232, 28, CAST(N'2021-02-08' AS Date), CAST(N'2021-02-08T06:45:00' AS SmallDateTime), CAST(N'2021-02-08T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (233, 23, CAST(N'2021-02-08' AS Date), CAST(N'2021-02-08T08:45:00' AS SmallDateTime), CAST(N'2021-02-08T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (234, 18, CAST(N'2021-02-08' AS Date), CAST(N'2021-02-08T07:50:00' AS SmallDateTime), CAST(N'2021-02-08T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (235, 9, CAST(N'2021-02-08' AS Date), CAST(N'2021-02-08T08:00:00' AS SmallDateTime), CAST(N'2021-02-08T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (236, 16, CAST(N'2021-02-08' AS Date), CAST(N'2021-02-08T00:00:00' AS SmallDateTime), CAST(N'2021-02-08T00:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (237, 17, CAST(N'2021-02-08' AS Date), CAST(N'2021-02-08T08:00:00' AS SmallDateTime), CAST(N'2021-02-08T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (238, 7, CAST(N'2021-02-09' AS Date), CAST(N'2021-02-09T07:00:00' AS SmallDateTime), CAST(N'2021-02-09T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 0)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (239, 8, CAST(N'2021-02-09' AS Date), CAST(N'2021-02-09T07:00:00' AS SmallDateTime), CAST(N'2021-02-09T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 0)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (240, 20, CAST(N'2021-02-09' AS Date), CAST(N'2021-02-09T08:13:00' AS SmallDateTime), CAST(N'2021-02-09T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (241, 11, CAST(N'2021-02-09' AS Date), CAST(N'2021-02-09T06:30:00' AS SmallDateTime), CAST(N'2021-02-09T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (242, 10, CAST(N'2021-02-09' AS Date), CAST(N'2021-02-09T06:20:00' AS SmallDateTime), CAST(N'2021-02-09T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (243, 13, CAST(N'2021-02-09' AS Date), CAST(N'2021-02-09T07:35:00' AS SmallDateTime), CAST(N'2021-02-09T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (244, 33, CAST(N'2021-02-09' AS Date), CAST(N'2021-02-09T08:00:00' AS SmallDateTime), CAST(N'2021-02-09T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (245, 15, CAST(N'2021-02-09' AS Date), CAST(N'2021-02-09T00:00:00' AS SmallDateTime), CAST(N'2021-02-09T00:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (246, 12, CAST(N'2021-02-09' AS Date), CAST(N'2021-02-09T08:38:00' AS SmallDateTime), CAST(N'2021-02-09T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (247, 32, CAST(N'2021-02-09' AS Date), CAST(N'2021-02-09T08:00:00' AS SmallDateTime), CAST(N'2021-02-09T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (248, 31, CAST(N'2021-02-09' AS Date), CAST(N'2021-02-09T06:40:00' AS SmallDateTime), CAST(N'2021-02-09T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (249, 14, CAST(N'2021-02-09' AS Date), CAST(N'2021-02-09T08:00:00' AS SmallDateTime), CAST(N'2021-02-09T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (250, 37, CAST(N'2021-02-09' AS Date), CAST(N'2021-02-09T07:38:00' AS SmallDateTime), CAST(N'2021-02-09T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (251, 38, CAST(N'2021-02-09' AS Date), CAST(N'2021-02-09T00:00:00' AS SmallDateTime), CAST(N'2021-02-09T00:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (252, 36, CAST(N'2021-02-09' AS Date), CAST(N'2021-02-09T09:00:00' AS SmallDateTime), CAST(N'2021-02-09T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (253, 19, CAST(N'2021-02-09' AS Date), CAST(N'2021-02-09T08:35:00' AS SmallDateTime), CAST(N'2021-02-09T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (254, 22, CAST(N'2021-02-09' AS Date), CAST(N'2021-02-09T07:58:00' AS SmallDateTime), CAST(N'2021-02-09T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (255, 21, CAST(N'2021-02-09' AS Date), CAST(N'2021-02-09T08:00:00' AS SmallDateTime), CAST(N'2021-02-09T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (256, 29, CAST(N'2021-02-09' AS Date), CAST(N'2021-02-09T06:00:00' AS SmallDateTime), CAST(N'2021-02-09T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (257, 27, CAST(N'2021-02-09' AS Date), CAST(N'2021-02-09T00:00:00' AS SmallDateTime), CAST(N'2021-02-09T00:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (258, 26, CAST(N'2021-02-09' AS Date), CAST(N'2021-02-09T07:30:00' AS SmallDateTime), CAST(N'2021-02-09T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (259, 25, CAST(N'2021-02-09' AS Date), CAST(N'2021-02-09T08:33:00' AS SmallDateTime), CAST(N'2021-02-09T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (260, 34, CAST(N'2021-02-09' AS Date), CAST(N'2021-02-09T08:30:00' AS SmallDateTime), CAST(N'2021-02-09T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (261, 24, CAST(N'2021-02-09' AS Date), CAST(N'2021-02-09T09:15:00' AS SmallDateTime), CAST(N'2021-02-09T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (262, 35, CAST(N'2021-02-09' AS Date), CAST(N'2021-02-09T08:00:00' AS SmallDateTime), CAST(N'2021-02-09T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (263, 28, CAST(N'2021-02-09' AS Date), CAST(N'2021-02-09T06:20:00' AS SmallDateTime), CAST(N'2021-02-09T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (264, 23, CAST(N'2021-02-09' AS Date), CAST(N'2021-02-09T08:07:00' AS SmallDateTime), CAST(N'2021-02-09T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (265, 18, CAST(N'2021-02-09' AS Date), CAST(N'2021-02-09T07:30:00' AS SmallDateTime), CAST(N'2021-02-09T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (266, 9, CAST(N'2021-02-09' AS Date), CAST(N'2021-02-09T08:00:00' AS SmallDateTime), CAST(N'2021-02-09T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (267, 16, CAST(N'2021-02-09' AS Date), CAST(N'2021-02-09T07:00:00' AS SmallDateTime), CAST(N'2021-02-02T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (268, 17, CAST(N'2021-02-09' AS Date), CAST(N'2021-02-09T07:40:00' AS SmallDateTime), CAST(N'2021-02-09T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (269, 7, CAST(N'2021-02-10' AS Date), CAST(N'2021-02-10T07:00:00' AS SmallDateTime), CAST(N'2021-02-10T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 0)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (270, 8, CAST(N'2021-02-10' AS Date), CAST(N'2021-02-10T07:00:00' AS SmallDateTime), CAST(N'2021-02-10T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 0)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (271, 20, CAST(N'2021-02-10' AS Date), CAST(N'2021-02-10T07:48:00' AS SmallDateTime), CAST(N'2021-02-10T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (272, 11, CAST(N'2021-02-10' AS Date), CAST(N'2021-02-10T06:50:00' AS SmallDateTime), CAST(N'2021-02-10T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (273, 10, CAST(N'2021-02-10' AS Date), CAST(N'2021-02-10T06:25:00' AS SmallDateTime), CAST(N'2021-02-10T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (274, 13, CAST(N'2021-02-10' AS Date), CAST(N'2021-02-10T07:15:00' AS SmallDateTime), CAST(N'2021-02-10T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (275, 33, CAST(N'2021-02-10' AS Date), CAST(N'2021-02-10T08:00:00' AS SmallDateTime), CAST(N'2021-02-10T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (276, 15, CAST(N'2021-02-10' AS Date), CAST(N'2021-02-10T08:00:00' AS SmallDateTime), CAST(N'2021-02-10T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (277, 12, CAST(N'2021-02-10' AS Date), CAST(N'2021-02-10T08:28:00' AS SmallDateTime), CAST(N'2021-02-10T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (278, 32, CAST(N'2021-02-10' AS Date), CAST(N'2021-02-10T08:00:00' AS SmallDateTime), CAST(N'2021-02-10T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (279, 31, CAST(N'2021-02-10' AS Date), CAST(N'2021-02-10T06:38:00' AS SmallDateTime), CAST(N'2021-02-10T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (280, 14, CAST(N'2021-02-10' AS Date), CAST(N'2021-02-10T09:15:00' AS SmallDateTime), CAST(N'2021-02-10T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (281, 37, CAST(N'2021-02-10' AS Date), CAST(N'2021-02-10T07:00:00' AS SmallDateTime), CAST(N'2021-02-10T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (282, 38, CAST(N'2021-02-10' AS Date), CAST(N'2021-02-10T00:00:00' AS SmallDateTime), CAST(N'2021-02-10T00:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (283, 36, CAST(N'2021-02-10' AS Date), CAST(N'2021-02-10T06:30:00' AS SmallDateTime), CAST(N'2021-02-10T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (284, 19, CAST(N'2021-02-10' AS Date), CAST(N'2021-02-10T08:25:00' AS SmallDateTime), CAST(N'2021-02-10T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (285, 22, CAST(N'2021-02-10' AS Date), CAST(N'2021-02-10T00:00:00' AS SmallDateTime), CAST(N'2021-02-10T00:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (286, 21, CAST(N'2021-02-10' AS Date), CAST(N'2021-02-10T07:00:00' AS SmallDateTime), CAST(N'2021-02-10T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (287, 29, CAST(N'2021-02-10' AS Date), CAST(N'2021-02-10T06:20:00' AS SmallDateTime), CAST(N'2021-02-10T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (288, 27, CAST(N'2021-02-10' AS Date), CAST(N'2021-02-10T07:47:00' AS SmallDateTime), CAST(N'2021-02-10T00:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (289, 26, CAST(N'2021-02-10' AS Date), CAST(N'2021-02-10T07:30:00' AS SmallDateTime), CAST(N'2021-02-10T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (290, 25, CAST(N'2021-02-10' AS Date), CAST(N'2021-02-10T08:17:00' AS SmallDateTime), CAST(N'2021-02-10T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (291, 34, CAST(N'2021-02-10' AS Date), CAST(N'2021-02-10T08:30:00' AS SmallDateTime), CAST(N'2021-02-10T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (292, 24, CAST(N'2021-02-10' AS Date), CAST(N'2021-02-10T09:10:00' AS SmallDateTime), CAST(N'2021-02-10T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (293, 35, CAST(N'2021-02-10' AS Date), CAST(N'2021-02-10T07:40:00' AS SmallDateTime), CAST(N'2021-02-10T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (294, 28, CAST(N'2021-02-10' AS Date), CAST(N'2021-02-10T00:00:00' AS SmallDateTime), CAST(N'2021-02-10T00:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (295, 23, CAST(N'2021-02-10' AS Date), CAST(N'2021-02-10T07:52:00' AS SmallDateTime), CAST(N'2021-02-10T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (296, 18, CAST(N'2021-02-10' AS Date), CAST(N'2021-02-10T07:55:00' AS SmallDateTime), CAST(N'2021-02-10T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (297, 9, CAST(N'2021-02-10' AS Date), CAST(N'2021-02-10T08:00:00' AS SmallDateTime), CAST(N'2021-02-10T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (298, 16, CAST(N'2021-02-10' AS Date), CAST(N'2021-02-10T06:55:00' AS SmallDateTime), CAST(N'2021-02-10T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (299, 17, CAST(N'2021-02-10' AS Date), CAST(N'2021-02-10T07:50:00' AS SmallDateTime), CAST(N'2021-02-10T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (300, 7, CAST(N'2021-02-11' AS Date), CAST(N'2021-02-11T00:00:00' AS SmallDateTime), CAST(N'2021-02-11T00:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 0)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (301, 8, CAST(N'2021-02-11' AS Date), CAST(N'2021-02-11T07:00:00' AS SmallDateTime), CAST(N'2021-02-11T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 0)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (302, 20, CAST(N'2021-02-11' AS Date), CAST(N'2021-02-11T07:57:00' AS SmallDateTime), CAST(N'2021-02-11T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (303, 11, CAST(N'2021-02-11' AS Date), CAST(N'2021-02-11T06:25:00' AS SmallDateTime), CAST(N'2021-02-11T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (304, 10, CAST(N'2021-02-11' AS Date), CAST(N'2021-02-11T06:25:00' AS SmallDateTime), CAST(N'2021-02-11T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (305, 13, CAST(N'2021-02-11' AS Date), CAST(N'2021-02-11T07:35:00' AS SmallDateTime), CAST(N'2021-02-11T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (306, 33, CAST(N'2021-02-11' AS Date), CAST(N'2021-02-11T00:00:00' AS SmallDateTime), CAST(N'2021-02-11T00:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (307, 15, CAST(N'2021-02-11' AS Date), CAST(N'2021-02-11T07:35:00' AS SmallDateTime), CAST(N'2021-02-11T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (308, 12, CAST(N'2021-02-11' AS Date), CAST(N'2021-02-11T08:30:00' AS SmallDateTime), CAST(N'2021-02-11T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (309, 32, CAST(N'2021-02-11' AS Date), CAST(N'2021-02-11T05:00:00' AS SmallDateTime), CAST(N'2021-02-11T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (310, 31, CAST(N'2021-02-11' AS Date), CAST(N'2021-02-11T06:55:00' AS SmallDateTime), CAST(N'2021-02-11T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (311, 14, CAST(N'2021-02-11' AS Date), CAST(N'2021-02-11T08:00:00' AS SmallDateTime), CAST(N'2021-02-11T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (312, 37, CAST(N'2021-02-11' AS Date), CAST(N'2021-02-11T05:00:00' AS SmallDateTime), CAST(N'2021-02-11T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (313, 38, CAST(N'2021-02-11' AS Date), CAST(N'2021-02-11T00:00:00' AS SmallDateTime), CAST(N'2021-02-11T00:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (314, 36, CAST(N'2021-02-11' AS Date), CAST(N'2021-02-11T06:30:00' AS SmallDateTime), CAST(N'2021-02-11T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (315, 19, CAST(N'2021-02-11' AS Date), CAST(N'2021-02-11T07:34:00' AS SmallDateTime), CAST(N'2021-02-11T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (316, 22, CAST(N'2021-02-11' AS Date), CAST(N'2021-02-11T07:56:00' AS SmallDateTime), CAST(N'2021-02-11T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (317, 21, CAST(N'2021-02-11' AS Date), CAST(N'2021-02-11T07:10:00' AS SmallDateTime), CAST(N'2021-02-11T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (318, 29, CAST(N'2021-02-11' AS Date), CAST(N'2021-02-11T08:00:00' AS SmallDateTime), CAST(N'2021-02-11T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (319, 27, CAST(N'2021-02-11' AS Date), CAST(N'2021-02-11T07:35:00' AS SmallDateTime), CAST(N'2021-02-11T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (320, 26, CAST(N'2021-02-11' AS Date), CAST(N'2021-02-11T07:36:00' AS SmallDateTime), CAST(N'2021-02-11T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (321, 25, CAST(N'2021-02-11' AS Date), CAST(N'2021-02-11T08:06:00' AS SmallDateTime), CAST(N'2021-02-11T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (322, 34, CAST(N'2021-02-11' AS Date), CAST(N'2021-02-11T08:39:00' AS SmallDateTime), CAST(N'2021-02-11T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (323, 24, CAST(N'2021-02-11' AS Date), CAST(N'2021-02-11T00:00:00' AS SmallDateTime), CAST(N'2021-02-11T00:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (324, 35, CAST(N'2021-02-11' AS Date), CAST(N'2021-02-11T08:15:00' AS SmallDateTime), CAST(N'2021-02-11T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (325, 28, CAST(N'2021-02-11' AS Date), CAST(N'2021-02-11T06:24:00' AS SmallDateTime), CAST(N'2021-02-11T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (326, 23, CAST(N'2021-02-11' AS Date), CAST(N'2021-02-11T08:00:00' AS SmallDateTime), CAST(N'2021-02-11T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (327, 18, CAST(N'2021-02-11' AS Date), CAST(N'2021-02-11T08:00:00' AS SmallDateTime), CAST(N'2021-02-11T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (328, 9, CAST(N'2021-02-11' AS Date), CAST(N'2021-02-11T07:25:00' AS SmallDateTime), CAST(N'2021-02-11T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (329, 16, CAST(N'2021-02-11' AS Date), CAST(N'2021-02-11T07:12:00' AS SmallDateTime), CAST(N'2021-02-11T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (330, 17, CAST(N'2021-02-11' AS Date), CAST(N'2021-02-11T08:00:00' AS SmallDateTime), CAST(N'2021-02-11T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (331, 7, CAST(N'2021-02-12' AS Date), CAST(N'2021-02-12T07:00:00' AS SmallDateTime), CAST(N'2021-02-12T00:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 0)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (332, 8, CAST(N'2021-02-12' AS Date), CAST(N'2021-02-12T07:00:00' AS SmallDateTime), CAST(N'2021-02-12T00:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 0)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (333, 20, CAST(N'2021-02-12' AS Date), CAST(N'2021-02-12T08:12:00' AS SmallDateTime), CAST(N'2021-02-12T00:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (334, 11, CAST(N'2021-02-12' AS Date), CAST(N'2021-02-12T06:45:00' AS SmallDateTime), CAST(N'2021-02-12T00:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (335, 10, CAST(N'2021-02-12' AS Date), CAST(N'2021-02-12T06:30:00' AS SmallDateTime), CAST(N'2021-02-12T00:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (336, 13, CAST(N'2021-02-12' AS Date), CAST(N'2021-02-12T07:50:00' AS SmallDateTime), CAST(N'2021-02-12T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (337, 33, CAST(N'2021-02-12' AS Date), CAST(N'2021-02-12T08:00:00' AS SmallDateTime), CAST(N'2021-02-12T00:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (338, 15, CAST(N'2021-02-12' AS Date), CAST(N'2021-02-12T08:00:00' AS SmallDateTime), CAST(N'2021-02-12T00:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (339, 12, CAST(N'2021-02-12' AS Date), CAST(N'2021-02-12T08:50:00' AS SmallDateTime), CAST(N'2021-02-12T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (340, 32, CAST(N'2021-02-12' AS Date), CAST(N'2021-02-12T08:00:00' AS SmallDateTime), CAST(N'2021-02-12T00:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (341, 31, CAST(N'2021-02-12' AS Date), CAST(N'2021-02-12T00:00:00' AS SmallDateTime), CAST(N'2021-02-12T00:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (342, 14, CAST(N'2021-02-12' AS Date), CAST(N'2021-02-12T08:00:00' AS SmallDateTime), CAST(N'2021-02-12T00:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (343, 37, CAST(N'2021-02-12' AS Date), CAST(N'2021-02-12T05:40:00' AS SmallDateTime), CAST(N'2021-02-12T00:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (344, 38, CAST(N'2021-02-12' AS Date), CAST(N'2021-02-12T00:00:00' AS SmallDateTime), CAST(N'2021-02-12T00:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (345, 36, CAST(N'2021-02-12' AS Date), CAST(N'2021-02-12T06:33:00' AS SmallDateTime), CAST(N'2021-02-12T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (346, 19, CAST(N'2021-02-12' AS Date), CAST(N'2021-02-12T07:55:00' AS SmallDateTime), CAST(N'2021-02-12T00:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (347, 22, CAST(N'2021-02-12' AS Date), CAST(N'2021-02-12T08:05:00' AS SmallDateTime), CAST(N'2021-02-12T00:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (348, 21, CAST(N'2021-02-12' AS Date), CAST(N'2021-02-12T06:45:00' AS SmallDateTime), CAST(N'2021-02-12T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (349, 29, CAST(N'2021-02-12' AS Date), CAST(N'2021-02-12T06:42:00' AS SmallDateTime), CAST(N'2021-02-12T00:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (350, 27, CAST(N'2021-02-12' AS Date), CAST(N'2021-02-12T07:46:00' AS SmallDateTime), CAST(N'2021-02-12T00:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (351, 26, CAST(N'2021-02-12' AS Date), CAST(N'2021-02-12T00:00:00' AS SmallDateTime), CAST(N'2021-02-12T00:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (352, 25, CAST(N'2021-02-12' AS Date), CAST(N'2021-02-12T08:03:00' AS SmallDateTime), CAST(N'2021-02-12T00:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (353, 34, CAST(N'2021-02-12' AS Date), CAST(N'2021-02-12T08:10:00' AS SmallDateTime), CAST(N'2021-02-12T00:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (354, 24, CAST(N'2021-02-12' AS Date), CAST(N'2021-02-12T09:00:00' AS SmallDateTime), CAST(N'2021-02-12T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (355, 35, CAST(N'2021-02-12' AS Date), CAST(N'2021-02-12T08:30:00' AS SmallDateTime), CAST(N'2021-02-12T00:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (356, 28, CAST(N'2021-02-12' AS Date), CAST(N'2021-02-12T06:43:00' AS SmallDateTime), CAST(N'2021-02-12T00:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (357, 23, CAST(N'2021-02-12' AS Date), CAST(N'2021-02-12T00:00:00' AS SmallDateTime), CAST(N'2021-02-12T00:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (358, 18, CAST(N'2021-02-12' AS Date), CAST(N'2021-02-12T07:55:00' AS SmallDateTime), CAST(N'2021-02-12T00:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (359, 9, CAST(N'2021-02-12' AS Date), CAST(N'2021-02-12T08:00:00' AS SmallDateTime), CAST(N'2021-02-12T00:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (360, 16, CAST(N'2021-02-12' AS Date), CAST(N'2021-02-12T07:10:00' AS SmallDateTime), CAST(N'2021-02-12T00:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (361, 17, CAST(N'2021-02-12' AS Date), CAST(N'2021-02-12T08:00:00' AS SmallDateTime), CAST(N'2021-02-12T00:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (362, 7, CAST(N'2021-02-15' AS Date), CAST(N'2021-02-15T07:00:00' AS SmallDateTime), CAST(N'2021-02-15T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 0)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (363, 8, CAST(N'2021-02-15' AS Date), CAST(N'2021-02-15T07:00:00' AS SmallDateTime), CAST(N'2021-02-15T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 0)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (364, 20, CAST(N'2021-02-15' AS Date), CAST(N'2021-02-15T08:30:00' AS SmallDateTime), CAST(N'2021-02-15T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (365, 11, CAST(N'2021-02-15' AS Date), CAST(N'2021-02-15T06:40:00' AS SmallDateTime), CAST(N'2021-02-15T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (366, 10, CAST(N'2021-02-15' AS Date), CAST(N'2021-02-15T06:30:00' AS SmallDateTime), CAST(N'2021-02-15T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (367, 13, CAST(N'2021-02-15' AS Date), CAST(N'2021-02-15T07:25:00' AS SmallDateTime), CAST(N'2021-02-15T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (368, 33, CAST(N'2021-02-15' AS Date), CAST(N'2021-02-15T08:00:00' AS SmallDateTime), CAST(N'2021-02-15T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (369, 15, CAST(N'2021-02-15' AS Date), CAST(N'2021-02-15T08:00:00' AS SmallDateTime), CAST(N'2021-02-15T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (370, 12, CAST(N'2021-02-15' AS Date), CAST(N'2021-02-15T08:40:00' AS SmallDateTime), CAST(N'2021-02-15T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (371, 32, CAST(N'2021-02-15' AS Date), CAST(N'2021-02-15T08:00:00' AS SmallDateTime), CAST(N'2021-02-15T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (372, 31, CAST(N'2021-02-15' AS Date), CAST(N'2021-02-15T07:00:00' AS SmallDateTime), CAST(N'2021-02-15T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (373, 14, CAST(N'2021-02-15' AS Date), CAST(N'2021-02-15T08:00:00' AS SmallDateTime), CAST(N'2021-02-15T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (374, 37, CAST(N'2021-02-15' AS Date), CAST(N'2021-02-15T07:00:00' AS SmallDateTime), CAST(N'2021-02-15T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (375, 38, CAST(N'2021-02-15' AS Date), CAST(N'2021-02-15T00:00:00' AS SmallDateTime), CAST(N'2021-02-15T00:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (376, 36, CAST(N'2021-02-15' AS Date), CAST(N'2021-02-15T06:24:00' AS SmallDateTime), CAST(N'2021-02-15T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (377, 30, CAST(N'2021-02-15' AS Date), CAST(N'2021-02-15T08:00:00' AS SmallDateTime), CAST(N'2021-02-15T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (378, 19, CAST(N'2021-02-15' AS Date), CAST(N'2021-02-15T07:30:00' AS SmallDateTime), CAST(N'2021-02-15T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (379, 22, CAST(N'2021-02-15' AS Date), CAST(N'2021-02-15T07:45:00' AS SmallDateTime), CAST(N'2021-02-15T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (380, 21, CAST(N'2021-02-15' AS Date), CAST(N'2021-02-15T08:00:00' AS SmallDateTime), CAST(N'2021-02-15T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (381, 29, CAST(N'2021-02-15' AS Date), CAST(N'2021-02-15T06:11:00' AS SmallDateTime), CAST(N'2021-02-15T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (382, 27, CAST(N'2021-02-15' AS Date), CAST(N'2021-02-15T07:37:00' AS SmallDateTime), CAST(N'2021-02-15T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (383, 26, CAST(N'2021-02-15' AS Date), CAST(N'2021-02-15T07:08:00' AS SmallDateTime), CAST(N'2021-02-15T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (384, 25, CAST(N'2021-02-15' AS Date), CAST(N'2021-02-15T07:45:00' AS SmallDateTime), CAST(N'2021-02-15T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (385, 34, CAST(N'2021-02-15' AS Date), CAST(N'2021-02-15T08:40:00' AS SmallDateTime), CAST(N'2021-02-15T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (386, 24, CAST(N'2021-02-15' AS Date), CAST(N'2021-02-15T08:54:00' AS SmallDateTime), CAST(N'2021-02-15T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (387, 35, CAST(N'2021-02-15' AS Date), CAST(N'2021-02-15T07:50:00' AS SmallDateTime), CAST(N'2021-02-15T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (388, 28, CAST(N'2021-02-15' AS Date), CAST(N'2021-02-15T06:39:00' AS SmallDateTime), CAST(N'2021-02-15T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (389, 23, CAST(N'2021-02-15' AS Date), CAST(N'2021-02-15T08:54:00' AS SmallDateTime), CAST(N'2021-02-15T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (390, 18, CAST(N'2021-02-15' AS Date), CAST(N'2021-02-15T07:55:00' AS SmallDateTime), CAST(N'2021-02-15T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (391, 9, CAST(N'2021-02-15' AS Date), CAST(N'2021-02-15T07:45:00' AS SmallDateTime), CAST(N'2021-02-15T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (392, 16, CAST(N'2021-02-15' AS Date), CAST(N'2021-02-15T07:00:00' AS SmallDateTime), CAST(N'2021-02-15T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (393, 17, CAST(N'2021-02-15' AS Date), CAST(N'2021-02-15T07:55:00' AS SmallDateTime), CAST(N'2021-02-15T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (394, 7, CAST(N'2021-02-16' AS Date), CAST(N'2021-02-16T07:00:00' AS SmallDateTime), CAST(N'2021-02-16T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 0)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (395, 8, CAST(N'2021-02-16' AS Date), CAST(N'2021-02-16T07:00:00' AS SmallDateTime), CAST(N'2021-02-16T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 0)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (396, 20, CAST(N'2021-02-16' AS Date), CAST(N'2021-02-16T08:05:00' AS SmallDateTime), CAST(N'2021-02-16T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (397, 11, CAST(N'2021-02-16' AS Date), CAST(N'2021-02-16T06:50:00' AS SmallDateTime), CAST(N'2021-02-16T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (398, 10, CAST(N'2021-02-16' AS Date), CAST(N'2021-02-16T06:21:00' AS SmallDateTime), CAST(N'2021-02-16T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (399, 13, CAST(N'2021-02-16' AS Date), CAST(N'2021-02-16T07:35:00' AS SmallDateTime), CAST(N'2021-02-16T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (400, 33, CAST(N'2021-02-16' AS Date), CAST(N'2021-02-16T00:00:00' AS SmallDateTime), CAST(N'2021-02-16T00:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (401, 15, CAST(N'2021-02-16' AS Date), CAST(N'2021-02-16T08:00:00' AS SmallDateTime), CAST(N'2021-02-16T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (402, 12, CAST(N'2021-02-16' AS Date), CAST(N'2021-02-16T08:40:00' AS SmallDateTime), CAST(N'2021-02-16T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (403, 32, CAST(N'2021-02-16' AS Date), CAST(N'2021-02-16T08:00:00' AS SmallDateTime), CAST(N'2021-02-16T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (404, 31, CAST(N'2021-02-16' AS Date), CAST(N'2021-02-16T07:03:00' AS SmallDateTime), CAST(N'2021-02-16T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (405, 14, CAST(N'2021-02-16' AS Date), CAST(N'2021-02-16T08:00:00' AS SmallDateTime), CAST(N'2021-02-16T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (406, 37, CAST(N'2021-02-16' AS Date), CAST(N'2021-02-16T05:45:00' AS SmallDateTime), CAST(N'2021-02-16T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (407, 38, CAST(N'2021-02-16' AS Date), CAST(N'2021-02-16T00:00:00' AS SmallDateTime), CAST(N'2021-02-16T00:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (408, 36, CAST(N'2021-02-16' AS Date), CAST(N'2021-02-16T07:16:00' AS SmallDateTime), CAST(N'2021-02-16T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (409, 30, CAST(N'2021-02-16' AS Date), CAST(N'2021-02-16T08:00:00' AS SmallDateTime), CAST(N'2021-02-16T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (410, 19, CAST(N'2021-02-16' AS Date), CAST(N'2021-02-16T08:50:00' AS SmallDateTime), CAST(N'2021-02-16T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (411, 22, CAST(N'2021-02-16' AS Date), CAST(N'2021-02-16T08:00:00' AS SmallDateTime), CAST(N'2021-02-16T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (412, 21, CAST(N'2021-02-16' AS Date), CAST(N'2021-02-16T07:05:00' AS SmallDateTime), CAST(N'2021-02-16T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (413, 29, CAST(N'2021-02-16' AS Date), CAST(N'2021-02-16T06:25:00' AS SmallDateTime), CAST(N'2021-02-16T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (414, 27, CAST(N'2021-02-16' AS Date), CAST(N'2021-02-16T07:37:00' AS SmallDateTime), CAST(N'2021-02-16T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (415, 26, CAST(N'2021-02-16' AS Date), CAST(N'2021-02-16T07:40:00' AS SmallDateTime), CAST(N'2021-02-16T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (416, 25, CAST(N'2021-02-16' AS Date), CAST(N'2021-02-16T00:00:00' AS SmallDateTime), CAST(N'2021-02-16T00:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (417, 34, CAST(N'2021-02-16' AS Date), CAST(N'2021-02-16T08:40:00' AS SmallDateTime), CAST(N'2021-02-16T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (418, 24, CAST(N'2021-02-16' AS Date), CAST(N'2021-02-16T09:34:00' AS SmallDateTime), CAST(N'2021-02-16T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (419, 35, CAST(N'2021-02-16' AS Date), CAST(N'2021-02-16T07:30:00' AS SmallDateTime), CAST(N'2021-02-16T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (420, 28, CAST(N'2021-02-16' AS Date), CAST(N'2021-02-16T06:29:00' AS SmallDateTime), CAST(N'2021-02-16T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (421, 23, CAST(N'2021-02-16' AS Date), CAST(N'2021-02-16T08:30:00' AS SmallDateTime), CAST(N'2021-02-16T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (422, 18, CAST(N'2021-02-16' AS Date), CAST(N'2021-02-16T08:00:00' AS SmallDateTime), CAST(N'2021-02-16T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (423, 9, CAST(N'2021-02-16' AS Date), CAST(N'2021-02-16T06:35:00' AS SmallDateTime), CAST(N'2021-02-16T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (424, 16, CAST(N'2021-02-16' AS Date), CAST(N'2021-02-16T06:48:00' AS SmallDateTime), CAST(N'2021-02-16T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (425, 17, CAST(N'2021-02-16' AS Date), CAST(N'2021-02-16T07:50:00' AS SmallDateTime), CAST(N'2021-02-16T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (426, 7, CAST(N'2021-02-17' AS Date), CAST(N'2021-02-17T07:00:00' AS SmallDateTime), CAST(N'2021-02-17T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 0)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (427, 8, CAST(N'2021-02-17' AS Date), CAST(N'2021-02-17T07:00:00' AS SmallDateTime), CAST(N'2021-02-17T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 0)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (428, 20, CAST(N'2021-02-17' AS Date), CAST(N'2021-02-17T08:05:00' AS SmallDateTime), CAST(N'2021-02-17T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (429, 11, CAST(N'2021-02-17' AS Date), CAST(N'2021-02-17T06:55:00' AS SmallDateTime), CAST(N'2021-02-17T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (430, 10, CAST(N'2021-02-17' AS Date), CAST(N'2021-02-17T06:25:00' AS SmallDateTime), CAST(N'2021-02-17T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (431, 13, CAST(N'2021-02-17' AS Date), CAST(N'2021-02-17T08:20:00' AS SmallDateTime), CAST(N'2021-02-17T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (432, 33, CAST(N'2021-02-17' AS Date), CAST(N'2021-02-17T00:00:00' AS SmallDateTime), CAST(N'2021-02-17T00:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (433, 15, CAST(N'2021-02-17' AS Date), CAST(N'2021-02-17T08:00:00' AS SmallDateTime), CAST(N'2021-02-17T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (434, 12, CAST(N'2021-02-17' AS Date), CAST(N'2021-02-17T08:30:00' AS SmallDateTime), CAST(N'2021-02-17T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (435, 32, CAST(N'2021-02-17' AS Date), CAST(N'2021-02-17T08:00:00' AS SmallDateTime), CAST(N'2021-02-17T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (436, 31, CAST(N'2021-02-17' AS Date), CAST(N'2021-02-17T07:41:00' AS SmallDateTime), CAST(N'2021-02-17T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (437, 14, CAST(N'2021-02-17' AS Date), CAST(N'2021-02-17T09:20:00' AS SmallDateTime), CAST(N'2021-02-17T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (438, 37, CAST(N'2021-02-17' AS Date), CAST(N'2021-02-17T06:33:00' AS SmallDateTime), CAST(N'2021-02-17T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (439, 38, CAST(N'2021-02-17' AS Date), CAST(N'2021-02-17T00:00:00' AS SmallDateTime), CAST(N'2021-02-17T00:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (440, 36, CAST(N'2021-02-17' AS Date), CAST(N'2021-02-17T06:22:00' AS SmallDateTime), CAST(N'2021-02-17T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (441, 30, CAST(N'2021-02-17' AS Date), CAST(N'2021-02-17T00:00:00' AS SmallDateTime), CAST(N'2021-02-17T00:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (442, 19, CAST(N'2021-02-17' AS Date), CAST(N'2021-02-17T08:42:00' AS SmallDateTime), CAST(N'2021-02-17T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (443, 22, CAST(N'2021-02-17' AS Date), CAST(N'2021-02-17T08:10:00' AS SmallDateTime), CAST(N'2021-02-17T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (444, 21, CAST(N'2021-02-17' AS Date), CAST(N'2021-02-17T08:00:00' AS SmallDateTime), CAST(N'2021-02-17T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (445, 29, CAST(N'2021-02-17' AS Date), CAST(N'2021-02-17T06:18:00' AS SmallDateTime), CAST(N'2021-02-17T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (446, 27, CAST(N'2021-02-17' AS Date), CAST(N'2021-02-17T07:44:00' AS SmallDateTime), CAST(N'2021-02-17T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (447, 26, CAST(N'2021-02-17' AS Date), CAST(N'2021-02-17T07:30:00' AS SmallDateTime), CAST(N'2021-02-17T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (448, 25, CAST(N'2021-02-17' AS Date), CAST(N'2021-02-17T07:47:00' AS SmallDateTime), CAST(N'2021-02-17T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (449, 34, CAST(N'2021-02-17' AS Date), CAST(N'2021-02-17T08:40:00' AS SmallDateTime), CAST(N'2021-02-17T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (450, 24, CAST(N'2021-02-17' AS Date), CAST(N'2021-02-17T09:34:00' AS SmallDateTime), CAST(N'2021-02-17T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (451, 35, CAST(N'2021-02-17' AS Date), CAST(N'2021-02-17T08:00:00' AS SmallDateTime), CAST(N'2021-02-17T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (452, 28, CAST(N'2021-02-17' AS Date), CAST(N'2021-02-17T06:52:00' AS SmallDateTime), CAST(N'2021-02-17T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (453, 23, CAST(N'2021-02-17' AS Date), CAST(N'2021-02-17T08:34:00' AS SmallDateTime), CAST(N'2021-02-17T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (454, 18, CAST(N'2021-02-17' AS Date), CAST(N'2021-02-17T07:55:00' AS SmallDateTime), CAST(N'2021-02-17T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (455, 9, CAST(N'2021-02-17' AS Date), CAST(N'2021-02-17T07:15:00' AS SmallDateTime), CAST(N'2021-02-17T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (456, 16, CAST(N'2021-02-17' AS Date), CAST(N'2021-02-17T07:50:00' AS SmallDateTime), CAST(N'2021-02-17T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (457, 17, CAST(N'2021-02-17' AS Date), CAST(N'2021-02-17T08:00:00' AS SmallDateTime), CAST(N'2021-02-17T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (458, 7, CAST(N'2021-02-18' AS Date), CAST(N'2021-02-18T07:00:00' AS SmallDateTime), CAST(N'2021-02-18T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 0)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (459, 7, CAST(N'2021-02-19' AS Date), CAST(N'2021-02-19T07:00:00' AS SmallDateTime), CAST(N'2021-02-19T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 0)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (460, 7, CAST(N'2021-02-22' AS Date), CAST(N'2021-02-22T07:00:00' AS SmallDateTime), CAST(N'2021-02-22T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 0)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (461, 7, CAST(N'2021-02-23' AS Date), CAST(N'2021-02-23T07:00:00' AS SmallDateTime), CAST(N'2021-02-23T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 0)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (462, 7, CAST(N'2021-02-24' AS Date), CAST(N'2021-02-24T07:00:00' AS SmallDateTime), CAST(N'2021-02-24T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 0)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (463, 7, CAST(N'2021-02-25' AS Date), CAST(N'2021-02-25T07:00:00' AS SmallDateTime), CAST(N'2021-02-25T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 0)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (464, 7, CAST(N'2021-02-26' AS Date), CAST(N'2021-02-26T07:00:00' AS SmallDateTime), CAST(N'2021-02-26T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 0)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (465, 8, CAST(N'2021-02-18' AS Date), CAST(N'2021-02-18T07:00:00' AS SmallDateTime), CAST(N'2021-02-18T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 0)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (466, 8, CAST(N'2021-02-19' AS Date), CAST(N'2021-02-19T07:00:00' AS SmallDateTime), CAST(N'2021-02-19T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 0)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (467, 8, CAST(N'2021-02-22' AS Date), CAST(N'2021-02-22T07:00:00' AS SmallDateTime), CAST(N'2021-02-22T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 0)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (468, 8, CAST(N'2021-02-23' AS Date), CAST(N'2021-02-23T07:00:00' AS SmallDateTime), CAST(N'2021-02-23T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 0)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (469, 8, CAST(N'2021-02-24' AS Date), CAST(N'2021-02-24T07:00:00' AS SmallDateTime), CAST(N'2021-02-24T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 0)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (470, 8, CAST(N'2021-02-25' AS Date), CAST(N'2021-02-25T07:00:00' AS SmallDateTime), CAST(N'2021-02-25T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 0)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (471, 8, CAST(N'2021-02-26' AS Date), CAST(N'2021-02-26T07:00:00' AS SmallDateTime), CAST(N'2021-02-26T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 0)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (472, 9, CAST(N'2021-02-18' AS Date), CAST(N'2021-02-18T07:20:00' AS SmallDateTime), CAST(N'2021-02-18T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (473, 9, CAST(N'2021-02-19' AS Date), CAST(N'2021-02-19T07:05:00' AS SmallDateTime), CAST(N'2021-02-19T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (474, 9, CAST(N'2021-02-22' AS Date), CAST(N'2021-02-22T07:15:00' AS SmallDateTime), CAST(N'2021-02-22T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (475, 9, CAST(N'2021-02-23' AS Date), CAST(N'2021-02-23T08:00:00' AS SmallDateTime), CAST(N'2021-02-23T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (476, 9, CAST(N'2021-02-24' AS Date), CAST(N'2021-02-24T07:15:00' AS SmallDateTime), CAST(N'2021-02-24T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (477, 9, CAST(N'2021-02-25' AS Date), CAST(N'2021-02-25T07:15:00' AS SmallDateTime), CAST(N'2021-02-25T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (478, 9, CAST(N'2021-02-26' AS Date), CAST(N'2021-02-26T07:50:00' AS SmallDateTime), CAST(N'2021-02-26T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (479, 10, CAST(N'2021-02-18' AS Date), CAST(N'2021-02-18T06:20:00' AS SmallDateTime), CAST(N'2021-02-18T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (480, 10, CAST(N'2021-02-19' AS Date), CAST(N'2021-02-19T06:25:00' AS SmallDateTime), CAST(N'2021-02-19T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (481, 10, CAST(N'2021-02-22' AS Date), CAST(N'2021-02-22T06:25:00' AS SmallDateTime), CAST(N'2021-02-22T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (482, 10, CAST(N'2021-02-23' AS Date), CAST(N'2021-02-23T06:22:00' AS SmallDateTime), CAST(N'2021-02-23T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (483, 10, CAST(N'2021-02-24' AS Date), CAST(N'2021-02-24T06:22:00' AS SmallDateTime), CAST(N'2021-02-24T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (484, 10, CAST(N'2021-02-25' AS Date), CAST(N'2021-02-25T06:22:00' AS SmallDateTime), CAST(N'2021-02-25T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (485, 10, CAST(N'2021-02-26' AS Date), CAST(N'2021-02-26T06:25:00' AS SmallDateTime), CAST(N'2021-02-26T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (486, 11, CAST(N'2021-02-18' AS Date), CAST(N'2021-02-18T06:55:00' AS SmallDateTime), CAST(N'2021-02-18T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (487, 11, CAST(N'2021-02-19' AS Date), CAST(N'2021-02-19T06:45:00' AS SmallDateTime), CAST(N'2021-02-19T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (488, 11, CAST(N'2021-02-22' AS Date), CAST(N'2021-02-22T06:41:00' AS SmallDateTime), CAST(N'2021-02-22T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (489, 11, CAST(N'2021-02-23' AS Date), CAST(N'2021-02-23T06:45:00' AS SmallDateTime), CAST(N'2021-02-23T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (490, 11, CAST(N'2021-02-24' AS Date), CAST(N'2021-02-24T06:05:00' AS SmallDateTime), CAST(N'2021-02-24T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (491, 11, CAST(N'2021-02-25' AS Date), CAST(N'2021-02-25T07:00:00' AS SmallDateTime), CAST(N'2021-02-25T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (492, 11, CAST(N'2021-02-26' AS Date), CAST(N'2021-02-26T07:05:00' AS SmallDateTime), CAST(N'2021-02-26T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (493, 12, CAST(N'2021-02-18' AS Date), CAST(N'2021-02-18T08:40:00' AS SmallDateTime), CAST(N'2021-02-18T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (494, 12, CAST(N'2021-02-19' AS Date), CAST(N'2021-02-19T08:38:00' AS SmallDateTime), CAST(N'2021-02-19T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (495, 12, CAST(N'2021-02-22' AS Date), CAST(N'2021-02-22T08:30:00' AS SmallDateTime), CAST(N'2021-02-22T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (496, 12, CAST(N'2021-02-23' AS Date), CAST(N'2021-02-23T00:00:00' AS SmallDateTime), CAST(N'2021-02-23T00:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (497, 12, CAST(N'2021-02-24' AS Date), CAST(N'2021-02-24T00:00:00' AS SmallDateTime), CAST(N'2021-02-24T00:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (498, 12, CAST(N'2021-02-25' AS Date), CAST(N'2021-02-25T08:40:00' AS SmallDateTime), CAST(N'2021-02-25T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (499, 12, CAST(N'2021-02-26' AS Date), CAST(N'2021-02-26T08:00:00' AS SmallDateTime), CAST(N'2021-02-26T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (500, 13, CAST(N'2021-02-18' AS Date), CAST(N'2021-02-18T07:30:00' AS SmallDateTime), CAST(N'2021-02-18T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (501, 13, CAST(N'2021-02-19' AS Date), CAST(N'2021-02-19T00:00:00' AS SmallDateTime), CAST(N'2021-02-19T00:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (502, 13, CAST(N'2021-02-22' AS Date), CAST(N'2021-02-22T07:55:00' AS SmallDateTime), CAST(N'2021-02-22T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (503, 13, CAST(N'2021-02-23' AS Date), CAST(N'2021-02-23T07:45:00' AS SmallDateTime), CAST(N'2021-02-23T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (504, 13, CAST(N'2021-02-24' AS Date), CAST(N'2021-02-24T07:55:00' AS SmallDateTime), CAST(N'2021-02-24T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (505, 13, CAST(N'2021-02-25' AS Date), CAST(N'2021-02-25T07:45:00' AS SmallDateTime), CAST(N'2021-02-25T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (506, 13, CAST(N'2021-02-26' AS Date), CAST(N'2021-02-26T08:00:00' AS SmallDateTime), CAST(N'2021-02-26T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (507, 14, CAST(N'2021-02-18' AS Date), CAST(N'2021-02-18T08:00:00' AS SmallDateTime), CAST(N'2021-02-18T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (508, 14, CAST(N'2021-02-19' AS Date), CAST(N'2021-02-19T08:00:00' AS SmallDateTime), CAST(N'2021-02-19T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (509, 14, CAST(N'2021-02-22' AS Date), CAST(N'2021-02-22T08:00:00' AS SmallDateTime), CAST(N'2021-02-22T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (510, 14, CAST(N'2021-02-23' AS Date), CAST(N'2021-02-23T08:00:00' AS SmallDateTime), CAST(N'2021-02-23T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (511, 14, CAST(N'2021-02-24' AS Date), CAST(N'2021-02-24T09:25:00' AS SmallDateTime), CAST(N'2021-02-24T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (512, 14, CAST(N'2021-02-25' AS Date), CAST(N'2021-02-25T08:00:00' AS SmallDateTime), CAST(N'2021-02-25T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (513, 14, CAST(N'2021-02-26' AS Date), CAST(N'2021-02-26T08:00:00' AS SmallDateTime), CAST(N'2021-02-26T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (514, 15, CAST(N'2021-02-18' AS Date), CAST(N'2021-02-18T07:33:00' AS SmallDateTime), CAST(N'2021-02-18T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (515, 15, CAST(N'2021-02-19' AS Date), CAST(N'2021-02-19T08:00:00' AS SmallDateTime), CAST(N'2021-02-19T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (516, 15, CAST(N'2021-02-22' AS Date), CAST(N'2021-02-22T08:00:00' AS SmallDateTime), CAST(N'2021-02-22T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (517, 15, CAST(N'2021-02-23' AS Date), CAST(N'2021-02-23T08:00:00' AS SmallDateTime), CAST(N'2021-02-23T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (518, 15, CAST(N'2021-02-24' AS Date), CAST(N'2021-02-24T08:00:00' AS SmallDateTime), CAST(N'2021-02-24T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (519, 15, CAST(N'2021-02-25' AS Date), CAST(N'2021-02-25T07:36:00' AS SmallDateTime), CAST(N'2021-02-25T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (520, 15, CAST(N'2021-02-26' AS Date), CAST(N'2021-02-26T08:00:00' AS SmallDateTime), CAST(N'2021-02-26T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (521, 16, CAST(N'2021-02-18' AS Date), CAST(N'2021-02-18T07:30:00' AS SmallDateTime), CAST(N'2021-02-18T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (522, 16, CAST(N'2021-02-19' AS Date), CAST(N'2021-02-19T07:24:00' AS SmallDateTime), CAST(N'2021-02-19T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (523, 16, CAST(N'2021-02-22' AS Date), CAST(N'2021-02-22T06:47:00' AS SmallDateTime), CAST(N'2021-02-22T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (524, 16, CAST(N'2021-02-23' AS Date), CAST(N'2021-02-23T07:49:00' AS SmallDateTime), CAST(N'2021-02-23T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (525, 16, CAST(N'2021-02-24' AS Date), CAST(N'2021-02-24T07:10:00' AS SmallDateTime), CAST(N'2021-02-24T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (526, 16, CAST(N'2021-02-25' AS Date), CAST(N'2021-02-25T07:50:00' AS SmallDateTime), CAST(N'2021-02-25T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (527, 16, CAST(N'2021-02-26' AS Date), CAST(N'2021-02-26T08:00:00' AS SmallDateTime), CAST(N'2021-02-26T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (528, 17, CAST(N'2021-02-18' AS Date), CAST(N'2021-02-18T08:00:00' AS SmallDateTime), CAST(N'2021-02-18T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (529, 17, CAST(N'2021-02-19' AS Date), CAST(N'2021-02-19T07:30:00' AS SmallDateTime), CAST(N'2021-02-19T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (530, 17, CAST(N'2021-02-22' AS Date), CAST(N'2021-02-22T07:45:00' AS SmallDateTime), CAST(N'2021-02-22T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (531, 17, CAST(N'2021-02-23' AS Date), CAST(N'2021-02-23T08:00:00' AS SmallDateTime), CAST(N'2021-02-23T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (532, 17, CAST(N'2021-02-24' AS Date), CAST(N'2021-02-24T07:15:00' AS SmallDateTime), CAST(N'2021-02-24T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (533, 17, CAST(N'2021-02-25' AS Date), CAST(N'2021-02-25T08:00:00' AS SmallDateTime), CAST(N'2021-02-25T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (534, 17, CAST(N'2021-02-26' AS Date), CAST(N'2021-02-26T08:00:00' AS SmallDateTime), CAST(N'2021-02-26T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (535, 18, CAST(N'2021-02-18' AS Date), CAST(N'2021-02-18T08:05:00' AS SmallDateTime), CAST(N'2021-02-18T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (536, 18, CAST(N'2021-02-19' AS Date), CAST(N'2021-02-19T08:05:00' AS SmallDateTime), CAST(N'2021-02-19T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (537, 18, CAST(N'2021-02-22' AS Date), CAST(N'2021-02-22T07:50:00' AS SmallDateTime), CAST(N'2021-02-22T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (538, 18, CAST(N'2021-02-23' AS Date), CAST(N'2021-02-23T08:05:00' AS SmallDateTime), CAST(N'2021-02-23T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (539, 18, CAST(N'2021-02-24' AS Date), CAST(N'2021-02-24T08:03:00' AS SmallDateTime), CAST(N'2021-02-24T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (540, 18, CAST(N'2021-02-25' AS Date), CAST(N'2021-02-25T08:08:00' AS SmallDateTime), CAST(N'2021-02-25T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (541, 18, CAST(N'2021-02-26' AS Date), CAST(N'2021-02-26T08:06:00' AS SmallDateTime), CAST(N'2021-02-26T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (542, 19, CAST(N'2021-02-18' AS Date), CAST(N'2021-02-18T07:50:00' AS SmallDateTime), CAST(N'2021-02-18T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (543, 19, CAST(N'2021-02-19' AS Date), CAST(N'2021-02-19T07:40:00' AS SmallDateTime), CAST(N'2021-02-19T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (544, 19, CAST(N'2021-02-22' AS Date), CAST(N'2021-02-22T07:40:00' AS SmallDateTime), CAST(N'2021-02-22T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (545, 19, CAST(N'2021-02-23' AS Date), CAST(N'2021-02-23T08:30:00' AS SmallDateTime), CAST(N'2021-02-23T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (546, 19, CAST(N'2021-02-24' AS Date), CAST(N'2021-02-24T08:00:00' AS SmallDateTime), CAST(N'2021-02-24T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (547, 19, CAST(N'2021-02-25' AS Date), CAST(N'2021-02-25T07:40:00' AS SmallDateTime), CAST(N'2021-02-25T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (548, 19, CAST(N'2021-02-26' AS Date), CAST(N'2021-02-26T08:30:00' AS SmallDateTime), CAST(N'2021-02-26T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (549, 20, CAST(N'2021-02-18' AS Date), CAST(N'2021-02-18T08:04:00' AS SmallDateTime), CAST(N'2021-02-18T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (550, 20, CAST(N'2021-02-19' AS Date), CAST(N'2021-02-19T08:00:00' AS SmallDateTime), CAST(N'2021-02-19T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (551, 20, CAST(N'2021-02-22' AS Date), CAST(N'2021-02-22T07:35:00' AS SmallDateTime), CAST(N'2021-02-22T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (552, 20, CAST(N'2021-02-23' AS Date), CAST(N'2021-02-23T07:40:00' AS SmallDateTime), CAST(N'2021-02-23T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (553, 20, CAST(N'2021-02-24' AS Date), CAST(N'2021-02-24T07:40:00' AS SmallDateTime), CAST(N'2021-02-24T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (554, 20, CAST(N'2021-02-25' AS Date), CAST(N'2021-02-25T08:14:00' AS SmallDateTime), CAST(N'2021-02-25T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (555, 20, CAST(N'2021-02-26' AS Date), CAST(N'2021-02-26T07:50:00' AS SmallDateTime), CAST(N'2021-02-26T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (556, 21, CAST(N'2021-02-18' AS Date), CAST(N'2021-02-18T07:30:00' AS SmallDateTime), CAST(N'2021-02-18T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (557, 21, CAST(N'2021-02-19' AS Date), CAST(N'2021-02-19T08:00:00' AS SmallDateTime), CAST(N'2021-02-19T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (558, 21, CAST(N'2021-02-22' AS Date), CAST(N'2021-02-22T07:40:00' AS SmallDateTime), CAST(N'2021-02-22T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (559, 21, CAST(N'2021-02-23' AS Date), CAST(N'2021-02-23T08:00:00' AS SmallDateTime), CAST(N'2021-02-23T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (560, 21, CAST(N'2021-02-24' AS Date), CAST(N'2021-02-24T00:00:00' AS SmallDateTime), CAST(N'2021-02-24T00:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (561, 21, CAST(N'2021-02-25' AS Date), CAST(N'2021-02-25T08:00:00' AS SmallDateTime), CAST(N'2021-02-25T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (562, 21, CAST(N'2021-02-26' AS Date), CAST(N'2021-02-26T07:10:00' AS SmallDateTime), CAST(N'2021-02-26T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (563, 22, CAST(N'2021-02-18' AS Date), CAST(N'2021-02-18T07:55:00' AS SmallDateTime), CAST(N'2021-02-18T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (564, 22, CAST(N'2021-02-19' AS Date), CAST(N'2021-02-19T07:56:00' AS SmallDateTime), CAST(N'2021-02-19T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (565, 22, CAST(N'2021-02-22' AS Date), CAST(N'2021-02-22T07:40:00' AS SmallDateTime), CAST(N'2021-02-22T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (566, 22, CAST(N'2021-02-23' AS Date), CAST(N'2021-02-23T07:40:00' AS SmallDateTime), CAST(N'2021-02-23T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (567, 22, CAST(N'2021-02-24' AS Date), CAST(N'2021-02-24T07:42:00' AS SmallDateTime), CAST(N'2021-02-24T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (568, 22, CAST(N'2021-02-25' AS Date), CAST(N'2021-02-25T07:50:00' AS SmallDateTime), CAST(N'2021-02-25T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (569, 22, CAST(N'2021-02-26' AS Date), CAST(N'2021-02-26T09:05:00' AS SmallDateTime), CAST(N'2021-02-26T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (570, 23, CAST(N'2021-02-18' AS Date), CAST(N'2021-02-18T08:14:00' AS SmallDateTime), CAST(N'2021-02-18T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (571, 23, CAST(N'2021-02-19' AS Date), CAST(N'2021-02-19T11:30:00' AS SmallDateTime), CAST(N'2021-02-19T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (572, 23, CAST(N'2021-02-22' AS Date), CAST(N'2021-02-22T08:34:00' AS SmallDateTime), CAST(N'2021-02-22T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (573, 23, CAST(N'2021-02-23' AS Date), CAST(N'2021-02-23T08:31:00' AS SmallDateTime), CAST(N'2021-02-23T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (574, 23, CAST(N'2021-02-24' AS Date), CAST(N'2021-02-24T08:31:00' AS SmallDateTime), CAST(N'2021-02-24T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (575, 23, CAST(N'2021-02-25' AS Date), CAST(N'2021-02-25T08:35:00' AS SmallDateTime), CAST(N'2021-02-25T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (576, 23, CAST(N'2021-02-26' AS Date), CAST(N'2021-02-26T08:00:00' AS SmallDateTime), CAST(N'2021-02-26T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (577, 24, CAST(N'2021-02-18' AS Date), CAST(N'2021-02-18T09:25:00' AS SmallDateTime), CAST(N'2021-02-18T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (578, 24, CAST(N'2021-02-19' AS Date), CAST(N'2021-02-19T09:30:00' AS SmallDateTime), CAST(N'2021-02-19T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (579, 24, CAST(N'2021-02-22' AS Date), CAST(N'2021-02-22T09:15:00' AS SmallDateTime), CAST(N'2021-02-22T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (580, 24, CAST(N'2021-02-23' AS Date), CAST(N'2021-02-23T09:20:00' AS SmallDateTime), CAST(N'2021-02-23T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (581, 24, CAST(N'2021-02-24' AS Date), CAST(N'2021-02-24T00:00:00' AS SmallDateTime), CAST(N'2021-02-24T00:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (582, 24, CAST(N'2021-02-25' AS Date), CAST(N'2021-02-25T09:30:00' AS SmallDateTime), CAST(N'2021-02-25T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (583, 24, CAST(N'2021-02-26' AS Date), CAST(N'2021-02-26T09:25:00' AS SmallDateTime), CAST(N'2021-02-26T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (584, 25, CAST(N'2021-02-18' AS Date), CAST(N'2021-02-18T07:50:00' AS SmallDateTime), CAST(N'2021-02-18T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (585, 25, CAST(N'2021-02-19' AS Date), CAST(N'2021-02-19T07:55:00' AS SmallDateTime), CAST(N'2021-02-19T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (586, 25, CAST(N'2021-02-22' AS Date), CAST(N'2021-02-22T08:11:00' AS SmallDateTime), CAST(N'2021-02-22T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (587, 25, CAST(N'2021-02-23' AS Date), CAST(N'2021-02-23T07:52:00' AS SmallDateTime), CAST(N'2021-02-23T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (588, 25, CAST(N'2021-02-24' AS Date), CAST(N'2021-02-24T07:52:00' AS SmallDateTime), CAST(N'2021-02-24T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (589, 25, CAST(N'2021-02-25' AS Date), CAST(N'2021-02-25T08:00:00' AS SmallDateTime), CAST(N'2021-02-25T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (590, 25, CAST(N'2021-02-26' AS Date), CAST(N'2021-02-26T07:46:00' AS SmallDateTime), CAST(N'2021-02-26T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (591, 26, CAST(N'2021-02-18' AS Date), CAST(N'2021-02-18T07:15:00' AS SmallDateTime), CAST(N'2021-02-18T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (592, 26, CAST(N'2021-02-19' AS Date), CAST(N'2021-02-19T07:45:00' AS SmallDateTime), CAST(N'2021-02-19T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (593, 26, CAST(N'2021-02-22' AS Date), CAST(N'2021-02-22T07:15:00' AS SmallDateTime), CAST(N'2021-02-22T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (594, 26, CAST(N'2021-02-23' AS Date), CAST(N'2021-02-23T07:30:00' AS SmallDateTime), CAST(N'2021-02-23T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (595, 26, CAST(N'2021-02-24' AS Date), CAST(N'2021-02-24T07:50:00' AS SmallDateTime), CAST(N'2021-02-24T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (596, 26, CAST(N'2021-02-25' AS Date), CAST(N'2021-02-25T07:25:00' AS SmallDateTime), CAST(N'2021-02-25T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (597, 26, CAST(N'2021-02-26' AS Date), CAST(N'2021-02-26T07:45:00' AS SmallDateTime), CAST(N'2021-02-26T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (598, 27, CAST(N'2021-02-18' AS Date), CAST(N'2021-02-18T07:48:00' AS SmallDateTime), CAST(N'2021-02-18T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (599, 27, CAST(N'2021-02-19' AS Date), CAST(N'2021-02-19T07:26:00' AS SmallDateTime), CAST(N'2021-02-19T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (600, 27, CAST(N'2021-02-22' AS Date), CAST(N'2021-02-22T07:45:00' AS SmallDateTime), CAST(N'2021-02-22T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (601, 27, CAST(N'2021-02-23' AS Date), CAST(N'2021-02-23T07:49:00' AS SmallDateTime), CAST(N'2021-02-23T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (602, 27, CAST(N'2021-02-24' AS Date), CAST(N'2021-02-24T07:45:00' AS SmallDateTime), CAST(N'2021-02-24T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (603, 27, CAST(N'2021-02-25' AS Date), CAST(N'2021-02-25T08:08:00' AS SmallDateTime), CAST(N'2021-02-25T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (604, 27, CAST(N'2021-02-26' AS Date), CAST(N'2021-02-26T07:58:00' AS SmallDateTime), CAST(N'2021-02-26T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (605, 28, CAST(N'2021-02-18' AS Date), CAST(N'2021-02-18T07:00:00' AS SmallDateTime), CAST(N'2021-02-18T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (606, 28, CAST(N'2021-02-19' AS Date), CAST(N'2021-02-19T06:20:00' AS SmallDateTime), CAST(N'2021-02-19T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (607, 28, CAST(N'2021-02-22' AS Date), CAST(N'2021-02-22T06:41:00' AS SmallDateTime), CAST(N'2021-02-22T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (608, 28, CAST(N'2021-02-23' AS Date), CAST(N'2021-02-23T07:00:00' AS SmallDateTime), CAST(N'2021-02-23T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (609, 28, CAST(N'2021-02-24' AS Date), CAST(N'2021-02-24T06:15:00' AS SmallDateTime), CAST(N'2021-02-24T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (610, 28, CAST(N'2021-02-25' AS Date), CAST(N'2021-02-25T06:57:00' AS SmallDateTime), CAST(N'2021-02-25T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (611, 28, CAST(N'2021-02-26' AS Date), CAST(N'2021-02-26T06:25:00' AS SmallDateTime), CAST(N'2021-02-26T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (612, 29, CAST(N'2021-02-18' AS Date), CAST(N'2021-02-18T06:30:00' AS SmallDateTime), CAST(N'2021-02-18T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (613, 29, CAST(N'2021-02-19' AS Date), CAST(N'2021-02-19T06:17:00' AS SmallDateTime), CAST(N'2021-02-19T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (614, 29, CAST(N'2021-02-22' AS Date), CAST(N'2021-02-22T06:18:00' AS SmallDateTime), CAST(N'2021-02-22T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (615, 29, CAST(N'2021-02-23' AS Date), CAST(N'2021-02-23T06:34:00' AS SmallDateTime), CAST(N'2021-02-23T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (616, 29, CAST(N'2021-02-24' AS Date), CAST(N'2021-02-24T06:20:00' AS SmallDateTime), CAST(N'2021-02-24T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (617, 29, CAST(N'2021-02-25' AS Date), CAST(N'2021-02-25T06:20:00' AS SmallDateTime), CAST(N'2021-02-25T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (618, 29, CAST(N'2021-02-26' AS Date), CAST(N'2021-02-26T06:20:00' AS SmallDateTime), CAST(N'2021-02-26T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (619, 30, CAST(N'2021-02-18' AS Date), CAST(N'2021-02-18T08:22:00' AS SmallDateTime), CAST(N'2021-02-18T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (620, 30, CAST(N'2021-02-19' AS Date), CAST(N'2021-02-19T08:00:00' AS SmallDateTime), CAST(N'2021-02-19T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (621, 30, CAST(N'2021-02-22' AS Date), CAST(N'2021-02-22T08:30:00' AS SmallDateTime), CAST(N'2021-02-22T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (622, 30, CAST(N'2021-02-23' AS Date), CAST(N'2021-02-23T08:34:00' AS SmallDateTime), CAST(N'2021-02-23T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (623, 30, CAST(N'2021-02-24' AS Date), CAST(N'2021-02-24T08:00:00' AS SmallDateTime), CAST(N'2021-02-24T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (624, 30, CAST(N'2021-02-25' AS Date), CAST(N'2021-02-25T08:30:00' AS SmallDateTime), CAST(N'2021-02-25T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (625, 30, CAST(N'2021-02-26' AS Date), CAST(N'2021-02-26T00:00:00' AS SmallDateTime), CAST(N'2021-02-26T00:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (626, 31, CAST(N'2021-02-18' AS Date), CAST(N'2021-02-18T07:41:00' AS SmallDateTime), CAST(N'2021-02-18T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (627, 31, CAST(N'2021-02-19' AS Date), CAST(N'2021-02-19T07:05:00' AS SmallDateTime), CAST(N'2021-02-19T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (628, 31, CAST(N'2021-02-22' AS Date), CAST(N'2021-02-22T07:08:00' AS SmallDateTime), CAST(N'2021-02-22T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (629, 31, CAST(N'2021-02-23' AS Date), CAST(N'2021-02-23T07:33:00' AS SmallDateTime), CAST(N'2021-02-23T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (630, 31, CAST(N'2021-02-24' AS Date), CAST(N'2021-02-24T07:20:00' AS SmallDateTime), CAST(N'2021-02-24T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (631, 31, CAST(N'2021-02-25' AS Date), CAST(N'2021-02-25T00:00:00' AS SmallDateTime), CAST(N'2021-02-25T00:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (632, 31, CAST(N'2021-02-26' AS Date), CAST(N'2021-02-26T07:54:00' AS SmallDateTime), CAST(N'2021-02-26T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (633, 32, CAST(N'2021-02-18' AS Date), CAST(N'2021-02-18T08:00:00' AS SmallDateTime), CAST(N'2021-02-18T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (634, 32, CAST(N'2021-02-19' AS Date), CAST(N'2021-02-19T08:00:00' AS SmallDateTime), CAST(N'2021-02-19T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (635, 32, CAST(N'2021-02-22' AS Date), CAST(N'2021-02-22T08:00:00' AS SmallDateTime), CAST(N'2021-02-22T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (636, 32, CAST(N'2021-02-23' AS Date), CAST(N'2021-02-23T08:00:00' AS SmallDateTime), CAST(N'2021-02-23T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (637, 32, CAST(N'2021-02-24' AS Date), CAST(N'2021-02-24T08:00:00' AS SmallDateTime), CAST(N'2021-02-24T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (638, 32, CAST(N'2021-02-25' AS Date), CAST(N'2021-02-25T08:00:00' AS SmallDateTime), CAST(N'2021-02-25T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (639, 32, CAST(N'2021-02-26' AS Date), CAST(N'2021-02-26T08:00:00' AS SmallDateTime), CAST(N'2021-02-26T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (640, 33, CAST(N'2021-02-18' AS Date), CAST(N'2021-02-18T08:00:00' AS SmallDateTime), CAST(N'2021-02-18T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (641, 33, CAST(N'2021-02-19' AS Date), CAST(N'2021-02-19T05:30:00' AS SmallDateTime), CAST(N'2021-02-19T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (642, 33, CAST(N'2021-02-22' AS Date), CAST(N'2021-02-22T08:00:00' AS SmallDateTime), CAST(N'2021-02-22T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (643, 33, CAST(N'2021-02-23' AS Date), CAST(N'2021-02-23T08:00:00' AS SmallDateTime), CAST(N'2021-02-23T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (644, 33, CAST(N'2021-02-24' AS Date), CAST(N'2021-02-24T05:40:00' AS SmallDateTime), CAST(N'2021-02-24T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (645, 33, CAST(N'2021-02-25' AS Date), CAST(N'2021-02-25T08:00:00' AS SmallDateTime), CAST(N'2021-02-25T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (646, 33, CAST(N'2021-02-26' AS Date), CAST(N'2021-02-26T05:20:00' AS SmallDateTime), CAST(N'2021-02-26T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (647, 34, CAST(N'2021-02-18' AS Date), CAST(N'2021-02-18T07:59:00' AS SmallDateTime), CAST(N'2021-02-18T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (648, 34, CAST(N'2021-02-19' AS Date), CAST(N'2021-02-19T08:30:00' AS SmallDateTime), CAST(N'2021-02-19T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (649, 34, CAST(N'2021-02-22' AS Date), CAST(N'2021-02-22T08:20:00' AS SmallDateTime), CAST(N'2021-02-22T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (650, 34, CAST(N'2021-02-23' AS Date), CAST(N'2021-02-23T08:20:00' AS SmallDateTime), CAST(N'2021-02-23T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (651, 34, CAST(N'2021-02-24' AS Date), CAST(N'2021-02-24T08:30:00' AS SmallDateTime), CAST(N'2021-02-24T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (652, 34, CAST(N'2021-02-25' AS Date), CAST(N'2021-02-25T08:40:00' AS SmallDateTime), CAST(N'2021-02-25T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (653, 34, CAST(N'2021-02-26' AS Date), CAST(N'2021-02-26T08:20:00' AS SmallDateTime), CAST(N'2021-02-26T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (654, 35, CAST(N'2021-02-18' AS Date), CAST(N'2021-02-18T07:30:00' AS SmallDateTime), CAST(N'2021-02-18T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (655, 35, CAST(N'2021-02-19' AS Date), CAST(N'2021-02-19T07:40:00' AS SmallDateTime), CAST(N'2021-02-19T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (656, 35, CAST(N'2021-02-22' AS Date), CAST(N'2021-02-22T00:00:00' AS SmallDateTime), CAST(N'2021-02-22T00:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (657, 35, CAST(N'2021-02-23' AS Date), CAST(N'2021-02-23T08:10:00' AS SmallDateTime), CAST(N'2021-02-23T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (658, 35, CAST(N'2021-02-24' AS Date), CAST(N'2021-02-24T08:55:00' AS SmallDateTime), CAST(N'2021-02-24T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (659, 35, CAST(N'2021-02-25' AS Date), CAST(N'2021-02-25T08:50:00' AS SmallDateTime), CAST(N'2021-02-25T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (660, 35, CAST(N'2021-02-26' AS Date), CAST(N'2021-02-26T08:10:00' AS SmallDateTime), CAST(N'2021-02-26T16:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (661, 36, CAST(N'2021-02-18' AS Date), CAST(N'2021-02-18T08:18:00' AS SmallDateTime), CAST(N'2021-02-18T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (662, 36, CAST(N'2021-02-19' AS Date), CAST(N'2021-02-19T06:30:00' AS SmallDateTime), CAST(N'2021-02-19T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (663, 36, CAST(N'2021-02-22' AS Date), CAST(N'2021-02-22T00:00:00' AS SmallDateTime), CAST(N'2021-02-22T00:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (664, 36, CAST(N'2021-02-23' AS Date), CAST(N'2021-02-23T06:30:00' AS SmallDateTime), CAST(N'2021-02-23T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (665, 36, CAST(N'2021-02-24' AS Date), CAST(N'2021-02-24T08:00:00' AS SmallDateTime), CAST(N'2021-02-24T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (666, 36, CAST(N'2021-02-25' AS Date), CAST(N'2021-02-25T06:26:00' AS SmallDateTime), CAST(N'2021-02-25T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (667, 36, CAST(N'2021-02-26' AS Date), CAST(N'2021-02-26T06:22:00' AS SmallDateTime), CAST(N'2021-02-26T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (668, 37, CAST(N'2021-02-18' AS Date), CAST(N'2021-02-18T06:10:00' AS SmallDateTime), CAST(N'2021-02-18T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (669, 37, CAST(N'2021-02-19' AS Date), CAST(N'2021-02-19T06:15:00' AS SmallDateTime), CAST(N'2021-02-19T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (670, 37, CAST(N'2021-02-22' AS Date), CAST(N'2021-02-22T06:50:00' AS SmallDateTime), CAST(N'2021-02-22T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (671, 37, CAST(N'2021-02-23' AS Date), CAST(N'2021-02-23T06:22:00' AS SmallDateTime), CAST(N'2021-02-23T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (672, 37, CAST(N'2021-02-24' AS Date), CAST(N'2021-02-24T05:41:00' AS SmallDateTime), CAST(N'2021-02-24T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (673, 37, CAST(N'2021-02-25' AS Date), CAST(N'2021-02-25T07:10:00' AS SmallDateTime), CAST(N'2021-02-25T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (674, 37, CAST(N'2021-02-26' AS Date), CAST(N'2021-02-26T07:00:00' AS SmallDateTime), CAST(N'2021-02-26T15:15:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (675, 38, CAST(N'2021-02-18' AS Date), CAST(N'2021-02-18T00:00:00' AS SmallDateTime), CAST(N'2021-02-18T00:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (676, 38, CAST(N'2021-02-19' AS Date), CAST(N'2021-02-19T00:00:00' AS SmallDateTime), CAST(N'2021-02-19T00:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (677, 38, CAST(N'2021-02-22' AS Date), CAST(N'2021-02-22T00:00:00' AS SmallDateTime), CAST(N'2021-02-22T00:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (678, 38, CAST(N'2021-02-23' AS Date), CAST(N'2021-02-23T00:00:00' AS SmallDateTime), CAST(N'2021-02-23T00:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (679, 38, CAST(N'2021-02-24' AS Date), CAST(N'2021-02-24T00:00:00' AS SmallDateTime), CAST(N'2021-02-24T00:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (680, 38, CAST(N'2021-02-25' AS Date), CAST(N'2021-02-25T00:00:00' AS SmallDateTime), CAST(N'2021-02-25T00:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (681, 38, CAST(N'2021-02-26' AS Date), CAST(N'2021-02-26T00:00:00' AS SmallDateTime), CAST(N'2021-02-26T00:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (682, 9, CAST(N'2021-04-17' AS Date), CAST(N'2021-04-19T04:00:00' AS SmallDateTime), CAST(N'2021-04-19T17:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (683, 22, CAST(N'2021-04-18' AS Date), CAST(N'2021-04-19T06:00:00' AS SmallDateTime), CAST(N'2021-04-19T13:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T09:28:27.130' AS DateTime), NULL, 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (684, 22, CAST(N'2021-04-20' AS Date), CAST(N'2021-04-20T08:00:00' AS SmallDateTime), CAST(N'2021-04-20T16:00:00' AS SmallDateTime), NULL, NULL, N'SOCIAL\napoleon.okunna', 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (688, 8, CAST(N'2021-04-20' AS Date), CAST(N'2021-04-20T08:00:00' AS SmallDateTime), CAST(N'2021-04-20T07:00:00' AS SmallDateTime), NULL, NULL, N'SOCIAL\napoleon.okunna', 0)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (689, 20, CAST(N'2021-04-20' AS Date), CAST(N'2021-04-20T04:00:00' AS SmallDateTime), CAST(N'2021-04-20T17:00:00' AS SmallDateTime), NULL, NULL, N'SOCIAL\napoleon.okunna', 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (690, 7, CAST(N'2021-04-20' AS Date), CAST(N'2021-04-20T07:00:00' AS SmallDateTime), CAST(N'2021-04-20T18:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T12:10:18.253' AS DateTime), N'SOCIAL\napoleon.okunna', 0)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (692, 11, CAST(N'2021-04-24' AS Date), CAST(N'2021-04-20T06:00:00' AS SmallDateTime), CAST(N'2021-04-20T15:00:00' AS SmallDateTime), NULL, NULL, N'SOCIAL\napoleon.okunna', 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (693, 9, CAST(N'2021-04-24' AS Date), CAST(N'2021-04-24T07:00:00' AS SmallDateTime), CAST(N'2021-04-24T16:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T12:16:05.280' AS DateTime), N'SOCIAL\napoleon.okunna', 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (694, 9, CAST(N'2021-04-24' AS Date), CAST(N'2021-04-24T07:00:00' AS SmallDateTime), CAST(N'2021-04-24T16:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T12:16:05.307' AS DateTime), N'SOCIAL\napoleon.okunna', 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (695, 9, CAST(N'2021-04-20' AS Date), CAST(N'2021-04-20T04:00:00' AS SmallDateTime), CAST(N'2021-04-20T17:00:00' AS SmallDateTime), NULL, NULL, N'SOCIAL\napoleon.okunna', 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (696, 14, CAST(N'2021-04-20' AS Date), CAST(N'2021-04-20T05:00:00' AS SmallDateTime), CAST(N'2021-04-20T18:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T12:33:32.823' AS DateTime), N'SOCIAL\napoleon.okunna', 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (702, 19, CAST(N'2021-04-20' AS Date), CAST(N'2021-04-20T05:00:00' AS SmallDateTime), CAST(N'2021-04-20T07:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T14:34:08.250' AS DateTime), N'SOCIAL\napoleon.okunna', 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (703, 14, CAST(N'2021-04-21' AS Date), CAST(N'2021-04-21T05:00:00' AS SmallDateTime), CAST(N'2021-04-21T07:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-20T14:34:37.980' AS DateTime), N'SOCIAL\napoleon.okunna', 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (705, 21, CAST(N'2021-04-21' AS Date), CAST(N'2021-04-21T04:00:00' AS SmallDateTime), CAST(N'2021-04-21T17:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-21T11:27:08.743' AS DateTime), N'SOCIAL\napoleon.okunna', 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (708, 7, CAST(N'2021-04-21' AS Date), CAST(N'2021-04-21T06:00:00' AS SmallDateTime), CAST(N'2021-04-21T17:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-21T15:40:43.113' AS DateTime), N'SOCIAL\napoleon.okunna', 0)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (709, 8, CAST(N'2021-04-21' AS Date), CAST(N'2021-04-21T06:00:00' AS SmallDateTime), CAST(N'2021-04-21T17:00:00' AS SmallDateTime), NULL, CAST(N'2021-04-21T15:43:42.703' AS DateTime), N'SOCIAL\napoleon.okunna', 0)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (710, 12, CAST(N'2021-04-21' AS Date), CAST(N'2021-04-21T06:00:00' AS SmallDateTime), CAST(N'2021-04-21T17:00:00' AS SmallDateTime), N'test nanotes', CAST(N'2021-04-21T15:46:14.033' AS DateTime), N'SOCIAL\napoleon.okunna', 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (711, 9, CAST(N'2021-04-21' AS Date), CAST(N'2021-04-21T06:00:00' AS SmallDateTime), CAST(N'2021-04-21T17:00:00' AS SmallDateTime), NULL, NULL, N'SOCIAL\napoleon.okunna', 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (712, 10, CAST(N'2021-04-21' AS Date), CAST(N'2021-04-21T06:00:00' AS SmallDateTime), CAST(N'2021-04-21T17:00:00' AS SmallDateTime), N'aaaa', CAST(N'2021-04-21T16:18:30.393' AS DateTime), N'SOCIAL\napoleon.okunna', 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (713, 7, CAST(N'2021-04-21' AS Date), CAST(N'2021-04-21T08:00:00' AS SmallDateTime), CAST(N'2021-04-21T17:00:00' AS SmallDateTime), N'wwwwwwwwwwwwwwwwwwwww1235', NULL, N'SOCIAL\napoleon.okunna', 0)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (714, 7, CAST(N'2021-04-22' AS Date), CAST(N'2021-04-22T05:00:00' AS SmallDateTime), CAST(N'2021-04-22T17:00:00' AS SmallDateTime), N'', CAST(N'2021-04-22T12:34:47.583' AS DateTime), N'DESKTOP-FMJSKQ6\nokun', 0)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (715, 8, CAST(N'2021-04-22' AS Date), CAST(N'2021-04-22T05:00:00' AS SmallDateTime), CAST(N'2021-04-22T16:00:00' AS SmallDateTime), N'', CAST(N'2021-04-22T16:10:40.680' AS DateTime), N'DESKTOP-FMJSKQ6\nokun', 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (716, 9, CAST(N'2021-04-22' AS Date), CAST(N'2021-04-22T05:00:00' AS SmallDateTime), CAST(N'2021-04-22T11:00:00' AS SmallDateTime), N'', CAST(N'2021-04-22T16:27:43.217' AS DateTime), N'DESKTOP-FMJSKQ6\nokun', 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (717, 9, CAST(N'2021-04-23' AS Date), CAST(N'2021-04-23T05:00:00' AS SmallDateTime), CAST(N'2021-04-23T11:00:00' AS SmallDateTime), N'', CAST(N'2021-04-22T16:28:23.000' AS DateTime), N'DESKTOP-FMJSKQ6\nokun', 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (719, 10, CAST(N'2021-04-22' AS Date), CAST(N'2021-04-22T09:00:00' AS SmallDateTime), CAST(N'2021-04-22T15:00:00' AS SmallDateTime), N'', CAST(N'2021-04-22T16:35:26.750' AS DateTime), N'DESKTOP-FMJSKQ6\nokun', 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (721, 10, CAST(N'2021-04-23' AS Date), CAST(N'2021-04-23T06:00:00' AS SmallDateTime), CAST(N'2021-04-23T18:00:00' AS SmallDateTime), N'', CAST(N'2021-04-22T16:38:08.857' AS DateTime), N'DESKTOP-FMJSKQ6\nokun', 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (722, 11, CAST(N'2021-04-23' AS Date), CAST(N'2021-04-23T07:00:00' AS SmallDateTime), CAST(N'2021-04-23T18:00:00' AS SmallDateTime), N'', CAST(N'2021-04-22T16:41:59.987' AS DateTime), N'DESKTOP-FMJSKQ6\nokun', 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (729, 9, CAST(N'2021-04-24' AS Date), CAST(N'2021-04-24T07:00:00' AS SmallDateTime), CAST(N'2021-04-24T16:00:00' AS SmallDateTime), N'qqqqqqqqqqqqqq', CAST(N'2021-04-22T17:35:51.293' AS DateTime), N'DESKTOP-FMJSKQ6\nokun', 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (731, 9, CAST(N'2021-04-25' AS Date), CAST(N'2021-04-25T07:00:00' AS SmallDateTime), CAST(N'2021-04-25T16:00:00' AS SmallDateTime), N'qqqqqqqqqqqqqq', CAST(N'2021-04-22T17:37:41.453' AS DateTime), N'DESKTOP-FMJSKQ6\nokun', 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (738, 7, CAST(N'2021-04-23' AS Date), CAST(N'2021-04-23T05:00:00' AS SmallDateTime), CAST(N'2021-04-23T14:00:00' AS SmallDateTime), N'', CAST(N'2021-04-22T17:51:02.723' AS DateTime), N'DESKTOP-FMJSKQ6\nokun', 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (741, 7, CAST(N'2021-04-27' AS Date), CAST(N'2021-04-22T09:00:00' AS SmallDateTime), CAST(N'2021-04-22T15:00:00' AS SmallDateTime), N'jjjjjjjj', NULL, N'DESKTOP-FMJSKQ6\nokun', 0)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (744, 9, CAST(N'2021-05-05' AS Date), CAST(N'2021-05-05T06:00:00' AS SmallDateTime), CAST(N'2021-05-05T17:00:00' AS SmallDateTime), N'Special duty leave', CAST(N'2021-04-22T18:23:24.633' AS DateTime), N'DESKTOP-FMJSKQ6\nokun', 0)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (745, 17, CAST(N'2021-04-22' AS Date), CAST(N'2021-04-22T05:00:00' AS SmallDateTime), CAST(N'2021-04-22T15:00:00' AS SmallDateTime), N'', CAST(N'2021-04-22T20:39:04.663' AS DateTime), N'DESKTOP-FMJSKQ6\nokun', 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (746, 20, CAST(N'2021-05-02' AS Date), CAST(N'2021-05-02T05:00:00' AS SmallDateTime), CAST(N'2021-05-02T16:00:00' AS SmallDateTime), N'', CAST(N'2021-04-22T20:42:57.730' AS DateTime), N'DESKTOP-FMJSKQ6\nokun', 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (747, 33, CAST(N'2021-04-22' AS Date), CAST(N'2021-04-22T07:00:00' AS SmallDateTime), CAST(N'2021-04-22T18:00:00' AS SmallDateTime), N'', CAST(N'2021-04-22T20:44:00.397' AS DateTime), N'DESKTOP-FMJSKQ6\nokun', 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (748, 28, CAST(N'2022-01-04' AS Date), CAST(N'2022-01-04T04:00:00' AS SmallDateTime), CAST(N'2022-01-04T17:00:00' AS SmallDateTime), N'', CAST(N'2021-04-22T20:48:29.737' AS DateTime), N'DESKTOP-FMJSKQ6\nokun', 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (749, 13, CAST(N'2007-01-05' AS Date), CAST(N'2007-01-05T06:00:00' AS SmallDateTime), CAST(N'2007-01-05T16:00:00' AS SmallDateTime), N'', CAST(N'2021-04-22T20:49:30.847' AS DateTime), N'DESKTOP-FMJSKQ6\nokun', 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (750, 25, CAST(N'2022-01-04' AS Date), CAST(N'2022-01-04T07:00:00' AS SmallDateTime), CAST(N'2022-01-04T18:00:00' AS SmallDateTime), N'', CAST(N'2021-04-22T20:52:46.597' AS DateTime), N'DESKTOP-FMJSKQ6\nokun', 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (751, 21, CAST(N'2022-01-04' AS Date), CAST(N'2022-01-04T05:00:00' AS SmallDateTime), CAST(N'2022-01-04T16:00:00' AS SmallDateTime), N'', CAST(N'2021-04-22T20:53:37.903' AS DateTime), N'DESKTOP-FMJSKQ6\nokun', 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (752, 19, CAST(N'2022-01-04' AS Date), CAST(N'2022-01-04T09:00:00' AS SmallDateTime), CAST(N'2022-01-04T15:00:00' AS SmallDateTime), N'', CAST(N'2021-04-22T20:54:10.283' AS DateTime), N'DESKTOP-FMJSKQ6\nokun', 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (753, 22, CAST(N'2022-01-04' AS Date), CAST(N'2022-01-04T07:00:00' AS SmallDateTime), CAST(N'2022-01-04T15:00:00' AS SmallDateTime), N'', CAST(N'2021-04-22T21:00:44.493' AS DateTime), N'DESKTOP-FMJSKQ6\nokun', 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (754, 38, CAST(N'2022-01-04' AS Date), CAST(N'2022-01-04T04:00:00' AS SmallDateTime), CAST(N'2022-01-04T15:00:00' AS SmallDateTime), N'', CAST(N'2021-04-22T21:03:45.963' AS DateTime), N'DESKTOP-FMJSKQ6\nokun', 1)
GO
INSERT [dbo].[HR_AttendanceRegister] ([AttendanceID], [Emp_Id], [AttendanceDate], [TimeIN], [TimeOUT], [note], [DateCreated], [CreatedBy], [Absent]) VALUES (755, 33, CAST(N'2008-01-05' AS Date), CAST(N'2008-01-05T04:00:00' AS SmallDateTime), CAST(N'2008-01-05T18:00:00' AS SmallDateTime), N'', CAST(N'2021-04-22T21:07:36.093' AS DateTime), N'DESKTOP-FMJSKQ6\nokun', 1)
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
INSERT [dbo].[HR_tbl_TakenLeave] ([TakenLeaveID], [LeaveTypeID], [isactive], [EMP_ID], [start_date], [end_date], [LeaveDate]) VALUES (6, 16, NULL, 9, CAST(N'2021-05-05T00:00:00.000' AS DateTime), CAST(N'2021-05-05T00:00:00.000' AS DateTime), CAST(N'2021-05-05' AS Date))
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
/****** Object:  StoredProcedure [dbo].[spGetDeptAttendance]    Script Date: 4/23/2021 8:41:32 AM ******/
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