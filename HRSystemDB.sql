USE [HRSystemDB]
GO
/****** Object:  Table [dbo].[Book1]    Script Date: 09/04/2021 3:17:41 PM ******/
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
/****** Object:  Table [dbo].[HR_AttendanceRegister]    Script Date: 09/04/2021 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HR_AttendanceRegister](
	[AttendanceID] [int] IDENTITY(1,1) NOT NULL,
	[Emp_Id] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[TimeIN] [time](0) NULL,
	[TimeOUT] [time](0) NULL,
	[AttendLeaveID] [int] NULL,
	[note] [varchar](50) NULL,
 CONSTRAINT [PK_HR_AttendanceRegister] PRIMARY KEY CLUSTERED 
(
	[AttendanceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HR_ContactType]    Script Date: 09/04/2021 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HR_ContactType](
	[ContactTypeID] [int] NOT NULL,
	[ContactTypeName] [varchar](50) NULL,
 CONSTRAINT [PK_HR_ContactType] PRIMARY KEY CLUSTERED 
(
	[ContactTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HR_Department]    Script Date: 09/04/2021 3:17:41 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HR_EmployeeContact]    Script Date: 09/04/2021 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HR_EmployeeContact](
	[contactID] [int] NOT NULL,
	[Contact] [varchar](8) NULL,
	[ContactTypeID] [int] NOT NULL,
	[EMP_ID] [int] NULL,
 CONSTRAINT [PK_HR_EmployeeContact] PRIMARY KEY CLUSTERED 
(
	[contactID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HR_LeaveType]    Script Date: 09/04/2021 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HR_LeaveType](
	[LeaveTypeID] [int] NOT NULL,
	[LTname] [varchar](50) NULL,
	[isactive] [int] NULL,
 CONSTRAINT [PK_HR_LeaveType] PRIMARY KEY CLUSTERED 
(
	[LeaveTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HR_tbl_ApprovedLeave]    Script Date: 09/04/2021 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HR_tbl_ApprovedLeave](
	[ApprovedLeaveID] [int] NOT NULL,
	[LeaveFrom] [date] NULL,
	[Leaveto] [date] NULL,
	[LeavetypeID] [int] NULL,
	[daterequested] [date] NULL,
	[recommended] [varchar](3) NULL,
	[approvedBy] [int] NULL,
	[medicalrequired] [varchar](3) NULL,
	[medicalForm] [varchar](50) NULL,
	[isactive] [int] NULL,
 CONSTRAINT [PK_HR_tbl_ApprovedLeave] PRIMARY KEY CLUSTERED 
(
	[ApprovedLeaveID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HR_tbl_AttendanceLeave]    Script Date: 09/04/2021 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HR_tbl_AttendanceLeave](
	[AttendLeaveID] [int] NOT NULL,
	[ApproveLeaveID] [int] NULL,
	[TakenLeaveID] [int] NULL,
 CONSTRAINT [PK_HR_tbl_AttendanceLeave] PRIMARY KEY CLUSTERED 
(
	[AttendLeaveID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HR_tbl_Emp_Leave]    Script Date: 09/04/2021 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HR_tbl_Emp_Leave](
	[EMP_leave_ID] [int] NOT NULL,
	[EmpID] [int] NULL,
	[LeavetypeID] [int] NULL,
	[Leave_limit] [int] NULL,
	[Leave_used] [int] NULL,
	[PeriodStart] [date] NULL,
	[PeriodEnd] [date] NULL,
	[isactive] [int] NULL,
 CONSTRAINT [PK_HR_tbl_Emp_Leave] PRIMARY KEY CLUSTERED 
(
	[EMP_leave_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HR_tbl_Employee]    Script Date: 09/04/2021 3:17:41 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HR_tbl_employmentStatus]    Script Date: 09/04/2021 3:17:41 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HR_tbl_Location]    Script Date: 09/04/2021 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HR_tbl_Location](
	[LocationID] [int] NOT NULL,
	[LocationName] [varchar](50) NULL,
	[address] [varchar](50) NULL,
	[isactive] [int] NULL,
 CONSTRAINT [PK_HR_tbl_Location] PRIMARY KEY CLUSTERED 
(
	[LocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HR_tbl_Position]    Script Date: 09/04/2021 3:17:41 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HR_tbl_ROP_report]    Script Date: 09/04/2021 3:17:41 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HR_tbl_SummaryReport]    Script Date: 09/04/2021 3:17:41 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HR_tbl_TakenLeave]    Script Date: 09/04/2021 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HR_tbl_TakenLeave](
	[TakenLeaveID] [int] NOT NULL,
	[LeaveTypeID] [int] NULL,
	[leavedate] [date] NULL,
	[isactive] [int] NULL,
 CONSTRAINT [PK_HR_tbl_TakenLeave] PRIMARY KEY CLUSTERED 
(
	[TakenLeaveID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_val_sex]    Script Date: 09/04/2021 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_val_sex](
	[sid] [int] IDENTITY(1,1) NOT NULL,
	[sex] [varchar](100) NOT NULL,
	[description] [varchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[sid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
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
SET IDENTITY_INSERT [dbo].[HR_Department] ON 
GO
INSERT [dbo].[HR_Department] ([DepartmentId], [DepartmentName], [isactive]) VALUES (1, N'Information and Communcation Techology Department', 1)
GO
SET IDENTITY_INSERT [dbo].[HR_Department] OFF
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
SET IDENTITY_INSERT [dbo].[HR_tbl_Employee] ON 
GO
INSERT [dbo].[HR_tbl_Employee] ([EMP_ID], [firstName], [Lastname], [gender], [contactID], [email], [Estatus], [PosID], [dateJoin], [dateLeave], [ServiceYears], [ReportingManager], [DepartmentID], [LocationID], [createdBy], [modifiedBy], [createDate], [modifiedDate], [isactive]) VALUES (7, N'Paul', N'Kanneh', NULL, NULL, N'paul.kanneh@social.gov.tt', 1, 5, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[HR_tbl_Employee] ([EMP_ID], [firstName], [Lastname], [gender], [contactID], [email], [Estatus], [PosID], [dateJoin], [dateLeave], [ServiceYears], [ReportingManager], [DepartmentID], [LocationID], [createdBy], [modifiedBy], [createDate], [modifiedDate], [isactive]) VALUES (8, N'Adesh', N'Seegobin', NULL, NULL, N'adesh.seegobin@social.gov.tt', 1, 7, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[HR_tbl_Employee] ([EMP_ID], [firstName], [Lastname], [gender], [contactID], [email], [Estatus], [PosID], [dateJoin], [dateLeave], [ServiceYears], [ReportingManager], [DepartmentID], [LocationID], [createdBy], [modifiedBy], [createDate], [modifiedDate], [isactive]) VALUES (9, N'Dave', N'Charles', NULL, NULL, N'dave.charles@social.gov.tt', 1, 14, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[HR_tbl_Employee] ([EMP_ID], [firstName], [Lastname], [gender], [contactID], [email], [Estatus], [PosID], [dateJoin], [dateLeave], [ServiceYears], [ReportingManager], [DepartmentID], [LocationID], [createdBy], [modifiedBy], [createDate], [modifiedDate], [isactive]) VALUES (10, N'Leslie-Ann', N'Douglas', NULL, NULL, N'leslieann.douglas@social.gov.tt', 1, 16, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[HR_tbl_Employee] ([EMP_ID], [firstName], [Lastname], [gender], [contactID], [email], [Estatus], [PosID], [dateJoin], [dateLeave], [ServiceYears], [ReportingManager], [DepartmentID], [LocationID], [createdBy], [modifiedBy], [createDate], [modifiedDate], [isactive]) VALUES (11, N'Kevon', N'Gibbs', NULL, NULL, N'kevon.gibbs@social.gov.tt', 1, 16, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[HR_tbl_Employee] ([EMP_ID], [firstName], [Lastname], [gender], [contactID], [email], [Estatus], [PosID], [dateJoin], [dateLeave], [ServiceYears], [ReportingManager], [DepartmentID], [LocationID], [createdBy], [modifiedBy], [createDate], [modifiedDate], [isactive]) VALUES (12, N'Michael', N'Pierre', NULL, NULL, N'michael.pierre@social.gov.tt', 1, 16, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[HR_tbl_Employee] ([EMP_ID], [firstName], [Lastname], [gender], [contactID], [email], [Estatus], [PosID], [dateJoin], [dateLeave], [ServiceYears], [ReportingManager], [DepartmentID], [LocationID], [createdBy], [modifiedBy], [createDate], [modifiedDate], [isactive]) VALUES (13, N'Timothy', N'Geelalsingh', NULL, NULL, N'timothy.geelalsingh@social.gov.tt', 1, 16, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[HR_tbl_Employee] ([EMP_ID], [firstName], [Lastname], [gender], [contactID], [email], [Estatus], [PosID], [dateJoin], [dateLeave], [ServiceYears], [ReportingManager], [DepartmentID], [LocationID], [createdBy], [modifiedBy], [createDate], [modifiedDate], [isactive]) VALUES (14, N'Keron', N'Joseph', NULL, NULL, N'keron.joseph@social.gov.tt', 1, 16, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[HR_tbl_Employee] ([EMP_ID], [firstName], [Lastname], [gender], [contactID], [email], [Estatus], [PosID], [dateJoin], [dateLeave], [ServiceYears], [ReportingManager], [DepartmentID], [LocationID], [createdBy], [modifiedBy], [createDate], [modifiedDate], [isactive]) VALUES (15, N'Kyle', N'Scott', NULL, NULL, N'kyle.scott@social.gov.tt', 1, 16, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[HR_tbl_Employee] ([EMP_ID], [firstName], [Lastname], [gender], [contactID], [email], [Estatus], [PosID], [dateJoin], [dateLeave], [ServiceYears], [ReportingManager], [DepartmentID], [LocationID], [createdBy], [modifiedBy], [createDate], [modifiedDate], [isactive]) VALUES (16, N'Reena', N'Pearalal', NULL, NULL, N'reena.pearalal@social.gov.tt', 1, 3, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[HR_tbl_Employee] ([EMP_ID], [firstName], [Lastname], [gender], [contactID], [email], [Estatus], [PosID], [dateJoin], [dateLeave], [ServiceYears], [ReportingManager], [DepartmentID], [LocationID], [createdBy], [modifiedBy], [createDate], [modifiedDate], [isactive]) VALUES (17, N'Carlan', N'Spooner', NULL, NULL, N'carlan.spooner@social.gov.tt', 1, 3, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[HR_tbl_Employee] ([EMP_ID], [firstName], [Lastname], [gender], [contactID], [email], [Estatus], [PosID], [dateJoin], [dateLeave], [ServiceYears], [ReportingManager], [DepartmentID], [LocationID], [createdBy], [modifiedBy], [createDate], [modifiedDate], [isactive]) VALUES (18, N'Charles', N'Glasgow', NULL, NULL, N'charles.glasgow@social.gov.tt', 1, 8, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[HR_tbl_Employee] ([EMP_ID], [firstName], [Lastname], [gender], [contactID], [email], [Estatus], [PosID], [dateJoin], [dateLeave], [ServiceYears], [ReportingManager], [DepartmentID], [LocationID], [createdBy], [modifiedBy], [createDate], [modifiedDate], [isactive]) VALUES (19, N'Sharlan', N'Deosaran', NULL, NULL, N'sharlan.deosaran@social.gov.tt', 1, 13, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[HR_tbl_Employee] ([EMP_ID], [firstName], [Lastname], [gender], [contactID], [email], [Estatus], [PosID], [dateJoin], [dateLeave], [ServiceYears], [ReportingManager], [DepartmentID], [LocationID], [createdBy], [modifiedBy], [createDate], [modifiedDate], [isactive]) VALUES (20, N'Gerald', N'Martinez', NULL, NULL, N'gerald.martinez@social.gov.tt', 1, 12, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[HR_tbl_Employee] ([EMP_ID], [firstName], [Lastname], [gender], [contactID], [email], [Estatus], [PosID], [dateJoin], [dateLeave], [ServiceYears], [ReportingManager], [DepartmentID], [LocationID], [createdBy], [modifiedBy], [createDate], [modifiedDate], [isactive]) VALUES (21, N'Sean', N'Defour', NULL, NULL, N'sean.defour@social.gov.tt', 1, 4, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[HR_tbl_Employee] ([EMP_ID], [firstName], [Lastname], [gender], [contactID], [email], [Estatus], [PosID], [dateJoin], [dateLeave], [ServiceYears], [ReportingManager], [DepartmentID], [LocationID], [createdBy], [modifiedBy], [createDate], [modifiedDate], [isactive]) VALUES (22, N'Evrol', N'Mark', NULL, NULL, N'evrol.mark@social.gov.tt', 1, 6, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[HR_tbl_Employee] ([EMP_ID], [firstName], [Lastname], [gender], [contactID], [email], [Estatus], [PosID], [dateJoin], [dateLeave], [ServiceYears], [ReportingManager], [DepartmentID], [LocationID], [createdBy], [modifiedBy], [createDate], [modifiedDate], [isactive]) VALUES (23, N'Napoleon', N'Okunna', NULL, NULL, N'napoleon.okunna@social.gov.tt', 1, 1, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[HR_tbl_Employee] ([EMP_ID], [firstName], [Lastname], [gender], [contactID], [email], [Estatus], [PosID], [dateJoin], [dateLeave], [ServiceYears], [ReportingManager], [DepartmentID], [LocationID], [createdBy], [modifiedBy], [createDate], [modifiedDate], [isactive]) VALUES (24, N'JD', N'Sookdeo', NULL, NULL, N'jd.sookdeo@social.gov.tt', 2, 10, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[HR_tbl_Employee] ([EMP_ID], [firstName], [Lastname], [gender], [contactID], [email], [Estatus], [PosID], [dateJoin], [dateLeave], [ServiceYears], [ReportingManager], [DepartmentID], [LocationID], [createdBy], [modifiedBy], [createDate], [modifiedDate], [isactive]) VALUES (25, N'Justin', N'Patterson', NULL, NULL, N'justin.patterson@social.gov.tt', 2, 10, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[HR_tbl_Employee] ([EMP_ID], [firstName], [Lastname], [gender], [contactID], [email], [Estatus], [PosID], [dateJoin], [dateLeave], [ServiceYears], [ReportingManager], [DepartmentID], [LocationID], [createdBy], [modifiedBy], [createDate], [modifiedDate], [isactive]) VALUES (26, N'Fariah', N'Ali', NULL, NULL, N'fariah.ali@social.gov.tt', 2, 10, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[HR_tbl_Employee] ([EMP_ID], [firstName], [Lastname], [gender], [contactID], [email], [Estatus], [PosID], [dateJoin], [dateLeave], [ServiceYears], [ReportingManager], [DepartmentID], [LocationID], [createdBy], [modifiedBy], [createDate], [modifiedDate], [isactive]) VALUES (27, N'Destine', N'Christopher', NULL, NULL, N'destine.christopher@social.gov.tt', 2, 10, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[HR_tbl_Employee] ([EMP_ID], [firstName], [Lastname], [gender], [contactID], [email], [Estatus], [PosID], [dateJoin], [dateLeave], [ServiceYears], [ReportingManager], [DepartmentID], [LocationID], [createdBy], [modifiedBy], [createDate], [modifiedDate], [isactive]) VALUES (28, N'Sara', N'Shoon', NULL, NULL, N'sara.shoon@social.gov.tt', 2, 10, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[HR_tbl_Employee] ([EMP_ID], [firstName], [Lastname], [gender], [contactID], [email], [Estatus], [PosID], [dateJoin], [dateLeave], [ServiceYears], [ReportingManager], [DepartmentID], [LocationID], [createdBy], [modifiedBy], [createDate], [modifiedDate], [isactive]) VALUES (29, N'Jehvern', N'Dubois', NULL, NULL, N'jehvern.dubois@social.gov.tt', 2, 10, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[HR_tbl_Employee] ([EMP_ID], [firstName], [Lastname], [gender], [contactID], [email], [Estatus], [PosID], [dateJoin], [dateLeave], [ServiceYears], [ReportingManager], [DepartmentID], [LocationID], [createdBy], [modifiedBy], [createDate], [modifiedDate], [isactive]) VALUES (30, N'Chris', N'Scott', NULL, NULL, N'Christopher.scott@social.gov.tt', 1, 11, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[HR_tbl_Employee] ([EMP_ID], [firstName], [Lastname], [gender], [contactID], [email], [Estatus], [PosID], [dateJoin], [dateLeave], [ServiceYears], [ReportingManager], [DepartmentID], [LocationID], [createdBy], [modifiedBy], [createDate], [modifiedDate], [isactive]) VALUES (31, N'Rajesh', N'Nandram', NULL, NULL, N'rajesh.nandram@social.gov.tt', 1, 15, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[HR_tbl_Employee] ([EMP_ID], [firstName], [Lastname], [gender], [contactID], [email], [Estatus], [PosID], [dateJoin], [dateLeave], [ServiceYears], [ReportingManager], [DepartmentID], [LocationID], [createdBy], [modifiedBy], [createDate], [modifiedDate], [isactive]) VALUES (32, N'Sheldon', N'Mohammed', NULL, NULL, N'sheldon.mohammed@social.gov.tt', 1, 9, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[HR_tbl_Employee] ([EMP_ID], [firstName], [Lastname], [gender], [contactID], [email], [Estatus], [PosID], [dateJoin], [dateLeave], [ServiceYears], [ReportingManager], [DepartmentID], [LocationID], [createdBy], [modifiedBy], [createDate], [modifiedDate], [isactive]) VALUES (33, N'Ameair', N'Ibrahim', NULL, NULL, N'ameair.ibrahim@social.gov.tt', 1, 16, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[HR_tbl_Employee] ([EMP_ID], [firstName], [Lastname], [gender], [contactID], [email], [Estatus], [PosID], [dateJoin], [dateLeave], [ServiceYears], [ReportingManager], [DepartmentID], [LocationID], [createdBy], [modifiedBy], [createDate], [modifiedDate], [isactive]) VALUES (34, N'Claude', N'Henry-Subance', NULL, NULL, N'claude-henry.subance@social.gov.tt', 2, 10, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[HR_tbl_Employee] ([EMP_ID], [firstName], [Lastname], [gender], [contactID], [email], [Estatus], [PosID], [dateJoin], [dateLeave], [ServiceYears], [ReportingManager], [DepartmentID], [LocationID], [createdBy], [modifiedBy], [createDate], [modifiedDate], [isactive]) VALUES (35, N'Mikel', N'Garcia', NULL, NULL, N'mikel.garcia@social.gov.tt', 2, 10, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[HR_tbl_Employee] ([EMP_ID], [firstName], [Lastname], [gender], [contactID], [email], [Estatus], [PosID], [dateJoin], [dateLeave], [ServiceYears], [ReportingManager], [DepartmentID], [LocationID], [createdBy], [modifiedBy], [createDate], [modifiedDate], [isactive]) VALUES (36, N'Whitnii', N'Ali-Khan', NULL, NULL, N'whitnii.ali@social.gov.tt', 1, 2, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[HR_tbl_Employee] ([EMP_ID], [firstName], [Lastname], [gender], [contactID], [email], [Estatus], [PosID], [dateJoin], [dateLeave], [ServiceYears], [ReportingManager], [DepartmentID], [LocationID], [createdBy], [modifiedBy], [createDate], [modifiedDate], [isactive]) VALUES (37, N'Jevon', N'Phillip', NULL, NULL, N'jevon.phillip@social.gov.tt', 1, 2, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[HR_tbl_Employee] ([EMP_ID], [firstName], [Lastname], [gender], [contactID], [email], [Estatus], [PosID], [dateJoin], [dateLeave], [ServiceYears], [ReportingManager], [DepartmentID], [LocationID], [createdBy], [modifiedBy], [createDate], [modifiedDate], [isactive]) VALUES (38, N'Shani', N'Gay', NULL, NULL, N'shani.gay@social.gov.tt', 1, 2, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL)
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
SET IDENTITY_INSERT [dbo].[HR_tbl_Position] ON 
GO
INSERT [dbo].[HR_tbl_Position] ([Pos_ID], [Pos_Name], [PositionSalary], [createdBy], [modifiedBy], [isActive]) VALUES (1, N'Analyst/Programmer', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[HR_tbl_Position] ([Pos_ID], [Pos_Name], [PositionSalary], [createdBy], [modifiedBy], [isActive]) VALUES (2, N'Business Operations Assistant I', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[HR_tbl_Position] ([Pos_ID], [Pos_Name], [PositionSalary], [createdBy], [modifiedBy], [isActive]) VALUES (3, N'Business Operations Assistant I (Help desk)', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[HR_tbl_Position] ([Pos_ID], [Pos_Name], [PositionSalary], [createdBy], [modifiedBy], [isActive]) VALUES (4, N'Database Specialist', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[HR_tbl_Position] ([Pos_ID], [Pos_Name], [PositionSalary], [createdBy], [modifiedBy], [isActive]) VALUES (5, N'Director ', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[HR_tbl_Position] ([Pos_ID], [Pos_Name], [PositionSalary], [createdBy], [modifiedBy], [isActive]) VALUES (6, N'Information Systems Specialist', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[HR_tbl_Position] ([Pos_ID], [Pos_Name], [PositionSalary], [createdBy], [modifiedBy], [isActive]) VALUES (7, N'Manager Service Delivery & Support', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[HR_tbl_Position] ([Pos_ID], [Pos_Name], [PositionSalary], [createdBy], [modifiedBy], [isActive]) VALUES (8, N'Manager Solutions Development and Implementation', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[HR_tbl_Position] ([Pos_ID], [Pos_Name], [PositionSalary], [createdBy], [modifiedBy], [isActive]) VALUES (9, N'Networking Specialist', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[HR_tbl_Position] ([Pos_ID], [Pos_Name], [PositionSalary], [createdBy], [modifiedBy], [isActive]) VALUES (10, N'On the Job Trainee', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[HR_tbl_Position] ([Pos_ID], [Pos_Name], [PositionSalary], [createdBy], [modifiedBy], [isActive]) VALUES (11, N'Security Specialist', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[HR_tbl_Position] ([Pos_ID], [Pos_Name], [PositionSalary], [createdBy], [modifiedBy], [isActive]) VALUES (12, N'Senior Database Specialist', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[HR_tbl_Position] ([Pos_ID], [Pos_Name], [PositionSalary], [createdBy], [modifiedBy], [isActive]) VALUES (13, N'Senior Information Systems Specialist ', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[HR_tbl_Position] ([Pos_ID], [Pos_Name], [PositionSalary], [createdBy], [modifiedBy], [isActive]) VALUES (14, N'Senior Information Systems Support Specialist', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[HR_tbl_Position] ([Pos_ID], [Pos_Name], [PositionSalary], [createdBy], [modifiedBy], [isActive]) VALUES (15, N'Senior Network Specialist', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[HR_tbl_Position] ([Pos_ID], [Pos_Name], [PositionSalary], [createdBy], [modifiedBy], [isActive]) VALUES (16, N'Technical Officer', NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[HR_tbl_Position] OFF
GO
ALTER TABLE [dbo].[HR_AttendanceRegister]  WITH CHECK ADD  CONSTRAINT [FK_HR_AttendanceRegister_AttendanceLeave] FOREIGN KEY([AttendLeaveID])
REFERENCES [dbo].[HR_tbl_AttendanceLeave] ([AttendLeaveID])
GO
ALTER TABLE [dbo].[HR_AttendanceRegister] CHECK CONSTRAINT [FK_HR_AttendanceRegister_AttendanceLeave]
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
ALTER TABLE [dbo].[HR_tbl_AttendanceLeave]  WITH CHECK ADD  CONSTRAINT [FK_HR_tbl_AttendanceLeave_HR_tbl_ApprovedLeave] FOREIGN KEY([ApproveLeaveID])
REFERENCES [dbo].[HR_tbl_ApprovedLeave] ([ApprovedLeaveID])
GO
ALTER TABLE [dbo].[HR_tbl_AttendanceLeave] CHECK CONSTRAINT [FK_HR_tbl_AttendanceLeave_HR_tbl_ApprovedLeave]
GO
ALTER TABLE [dbo].[HR_tbl_AttendanceLeave]  WITH CHECK ADD  CONSTRAINT [FK_HR_tbl_AttendanceLeave_HR_tbl_TakenLeave] FOREIGN KEY([TakenLeaveID])
REFERENCES [dbo].[HR_tbl_TakenLeave] ([TakenLeaveID])
GO
ALTER TABLE [dbo].[HR_tbl_AttendanceLeave] CHECK CONSTRAINT [FK_HR_tbl_AttendanceLeave_HR_tbl_TakenLeave]
GO
ALTER TABLE [dbo].[HR_tbl_Emp_Leave]  WITH CHECK ADD  CONSTRAINT [FK_EmpLeave] FOREIGN KEY([EmpID])
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
