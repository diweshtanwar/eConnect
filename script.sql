USE [eConnectApp]
GO
/****** Object:  Table [dbo].[tblAnnouncement]    Script Date: 7/14/2021 9:43:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAnnouncement](
	[AnnouncementId] [int] IDENTITY(1,1) NOT NULL,
	[Source] [char](3) NULL,
	[Message] [varchar](500) NULL,
	[Detail] [varchar](8000) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_tblAnnouncement] PRIMARY KEY CLUSTERED 
(
	[AnnouncementId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblApplicationSettings]    Script Date: 7/14/2021 9:43:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblApplicationSettings](
	[SettingId] [int] IDENTITY(1,1) NOT NULL,
	[BusinessId] [int] NULL,
	[ApplicationName] [varchar](200) NULL,
	[AutoBackUp] [varchar](10) NULL,
	[AutoBackUpDuration] [varchar](200) NULL,
	[DataRetention] [int] NULL,
	[Status] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_tblApplicationSettings] PRIMARY KEY CLUSTERED 
(
	[SettingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblBusiness]    Script Date: 7/14/2021 9:43:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBusiness](
	[BusinessId] [int] NOT NULL,
	[Name] [varchar](200) NULL,
	[Description] [varchar](300) NULL,
	[CreatedOn] [datetime] NULL,
	[Status] [tinyint] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_tblBusiness] PRIMARY KEY CLUSTERED 
(
	[BusinessId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblBusinessDetailReport]    Script Date: 7/14/2021 9:43:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBusinessDetailReport](
	[BusinessDetailReportId] [bigint] IDENTITY(1,1) NOT NULL,
	[UploaderId] [int] NULL,
	[Month] [int] NULL,
	[Year] [int] NULL,
	[CSPCode] [varchar](50) NULL,
	[SavingsAccountEnrollment] [int] NULL,
	[SavingsAccountOpen] [int] NULL,
	[SHGAccountEnrollment] [int] NULL,
	[SHGAccountOpen] [int] NULL,
	[StateATMCards] [int] NULL,
	[CashReceiptNo] [int] NULL,
	[CashReceiptAmount] [decimal](19, 6) NULL,
	[CashPaymentNo] [int] NULL,
	[CashPaymentAmount] [decimal](19, 6) NULL,
	[FundTransferNo] [int] NULL,
	[FundTransferAmount] [decimal](19, 6) NULL,
	[MoneyTransferNo] [int] NULL,
	[MoneyTransferAmount] [decimal](19, 6) NULL,
	[IMPSNo] [int] NULL,
 CONSTRAINT [PK_tblBusinessDetailReport] PRIMARY KEY CLUSTERED 
(
	[BusinessDetailReportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCategory]    Script Date: 7/14/2021 9:43:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategory](
	[CategoryId] [tinyint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Code] [varchar](50) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_tblCategory] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCity]    Script Date: 7/14/2021 9:43:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCity](
	[CityId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Code] [nchar](10) NULL,
	[StateId] [int] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_tblCity] PRIMARY KEY CLUSTERED 
(
	[CityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCommissionReport]    Script Date: 7/14/2021 9:43:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCommissionReport](
	[CommissionReportId] [bigint] IDENTITY(1,1) NOT NULL,
	[CSPCode] [int] NULL,
	[Month] [int] NULL,
	[Year] [int] NULL,
	[CommissionReportTransactionType] [int] NULL,
	[NumberOfTransactions] [bigint] NULL,
	[Commission] [decimal](19, 6) NULL,
 CONSTRAINT [PK_tblCommissionReport] PRIMARY KEY CLUSTERED 
(
	[CommissionReportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCommissionReportMain]    Script Date: 7/14/2021 9:43:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCommissionReportMain](
	[TransactionCommissionId] [bigint] IDENTITY(1,1) NOT NULL,
	[Circle] [nvarchar](50) NULL,
	[CircleName] [nvarchar](50) NULL,
	[BCBF_Code] [nvarchar](max) NULL,
	[CSPCode] [nvarchar](50) NULL,
	[CSPName] [nvarchar](50) NULL,
	[TransactionType] [nvarchar](max) NULL,
	[NoOfTransactions] [decimal](18, 4) NULL,
	[Commission] [decimal](18, 4) NULL,
	[UploaderId] [int] NULL,
 CONSTRAINT [PK_tblCommissionReportMain] PRIMARY KEY CLUSTERED 
(
	[TransactionCommissionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCommissionReportMonthly]    Script Date: 7/14/2021 9:43:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCommissionReportMonthly](
	[MonthlyCommissionReportID] [bigint] IDENTITY(1,1) NOT NULL,
	[CSPCode] [varchar](100) NULL,
	[CSPName] [varchar](200) NULL,
	[Transation] [decimal](18, 2) NULL,
	[Incentive] [decimal](18, 2) NULL,
	[Rural] [decimal](18, 2) NULL,
	[Total] [decimal](18, 2) NULL,
	[TDS] [decimal](18, 2) NULL,
	[PayableToCSP] [decimal](18, 2) NULL,
	[NetPayable] [decimal](18, 4) NULL,
	[Month] [int] NULL,
	[Year] [int] NULL,
	[UploaderId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.CommissionReportMonthly] PRIMARY KEY CLUSTERED 
(
	[MonthlyCommissionReportID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCommissionReportNew]    Script Date: 7/14/2021 9:43:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCommissionReportNew](
	[TransactionCommissionId] [bigint] IDENTITY(1,1) NOT NULL,
	[Circle] [nvarchar](50) NULL,
	[CircleName] [nvarchar](50) NULL,
	[BCBF_Code] [nvarchar](max) NULL,
	[CSPCode] [nvarchar](50) NULL,
	[CSPName] [nvarchar](50) NULL,
	[TransactionType] [nvarchar](max) NULL,
	[NoOfTransactions] [decimal](18, 4) NULL,
	[Commission] [decimal](18, 4) NULL,
	[UploaderId] [int] NULL,
 CONSTRAINT [PK_tblCommissionReportNew] PRIMARY KEY CLUSTERED 
(
	[TransactionCommissionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCommissionReportTransactionType]    Script Date: 7/14/2021 9:43:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCommissionReportTransactionType](
	[CommissionReportTransactionTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](200) NULL,
	[HOCommission] [decimal](18, 0) NULL,
	[CSPCommission] [decimal](18, 0) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_tblCommissionReportTransactionType] PRIMARY KEY CLUSTERED 
(
	[CommissionReportTransactionTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblConfiguration]    Script Date: 7/14/2021 9:43:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblConfiguration](
	[ConfigurationId] [int] IDENTITY(1,1) NOT NULL,
	[BusinessId] [int] NULL,
	[DeactiveAccountDaysForInvalidPwd] [int] NULL,
	[LockAccountDaysForInvalidPwd] [int] NULL,
	[AutoUnlockAccountMinutes] [int] NULL,
	[PasswordAutoExpireInDays] [int] NULL,
	[IsPasswordNeverExpired] [bit] NULL,
	[ChangedPwdOnNextLogin] [bit] NULL,
	[PasswordLength] [int] NULL,
	[NotifiedToCSP] [bit] NULL,
 CONSTRAINT [PK_tblConfiguration] PRIMARY KEY CLUSTERED 
(
	[ConfigurationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCountry]    Script Date: 7/14/2021 9:43:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCountry](
	[CountryId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_tblCountry] PRIMARY KEY CLUSTERED 
(
	[CountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblDepartment]    Script Date: 7/14/2021 9:43:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDepartment](
	[DepartmentId] [tinyint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
 CONSTRAINT [PK_tblDepartment] PRIMARY KEY CLUSTERED 
(
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblDepositRequest]    Script Date: 7/14/2021 9:43:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDepositRequest](
	[DepositeRequestId] [bigint] NOT NULL,
	[Amount] [decimal](19, 6) NULL,
	[RaisedBy] [int] NULL,
	[Status] [int] NULL,
	[RequestedDate] [datetime] NULL,
	[CompletionDate] [datetime] NULL,
	[HasReceipt] [bit] NULL,
	[ReceiptSource] [varchar](200) NULL,
	[IsVerified] [bit] NULL,
	[ResolutionDetail] [varchar](500) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_tblDepositRequest] PRIMARY KEY CLUSTERED 
(
	[DepositeRequestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblDesignation]    Script Date: 7/14/2021 9:43:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDesignation](
	[DesignationId] [tinyint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
 CONSTRAINT [PK_tblDesignation] PRIMARY KEY CLUSTERED 
(
	[DesignationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblDocuments]    Script Date: 7/14/2021 9:43:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDocuments](
	[DocumentId] [int] IDENTITY(1,1) NOT NULL,
	[Source] [char](3) NULL,
	[Name] [varchar](200) NULL,
	[Detail] [varchar](500) NULL,
	[FilePath] [varchar](200) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_tblDocuments] PRIMARY KEY CLUSTERED 
(
	[DocumentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEducation]    Script Date: 7/14/2021 9:43:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEducation](
	[EducationId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](200) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_tblEducation] PRIMARY KEY CLUSTERED 
(
	[EducationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblErrorLog]    Script Date: 7/14/2021 9:43:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblErrorLog](
	[ErrorLogId] [bigint] IDENTITY(1,1) NOT NULL,
	[LogDate] [datetime] NULL,
	[UserId] [int] NULL,
	[Detail] [varchar](500) NULL,
	[IpAddress] [varchar](200) NULL,
 CONSTRAINT [PK_tblErrorLog] PRIMARY KEY CLUSTERED 
(
	[ErrorLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblFolderDetails]    Script Date: 7/14/2021 9:43:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFolderDetails](
	[FolderId] [int] IDENTITY(1,1) NOT NULL,
	[FolderName] [varchar](100) NOT NULL,
	[Priority] [tinyint] NOT NULL,
	[InActive] [bit] NOT NULL,
 CONSTRAINT [PK_tblFolderDetails] PRIMARY KEY CLUSTERED 
(
	[FolderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblFolderImageDetails]    Script Date: 7/14/2021 9:43:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFolderImageDetails](
	[FolderImageId] [int] IDENTITY(1,1) NOT NULL,
	[FolderId] [int] NOT NULL,
	[UploadedBy] [int] NOT NULL,
	[UploadedDate] [datetime] NOT NULL,
	[InActive] [bit] NOT NULL,
	[ImageName] [varchar](100) NOT NULL,
 CONSTRAINT [PK_tblFolderImageDetails] PRIMARY KEY CLUSTERED 
(
	[FolderImageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblHoliday]    Script Date: 7/14/2021 9:43:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblHoliday](
	[Id] [int] NOT NULL,
	[Name] [varchar](200) NULL,
	[Date] [date] NULL,
	[Status] [tinyint] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_tblHoliday] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblMenuMain]    Script Date: 7/14/2021 9:43:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMenuMain](
	[MenuMainId] [int] IDENTITY(1,1) NOT NULL,
	[Tittle] [varchar](20) NULL,
	[Controller] [varchar](30) NULL,
	[Action] [varchar](30) NULL,
	[Description] [varchar](50) NULL,
	[Status] [bit] NULL,
	[Priority] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_tblMenuMain] PRIMARY KEY CLUSTERED 
(
	[MenuMainId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblMenuSub]    Script Date: 7/14/2021 9:43:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMenuSub](
	[MenuSubId] [int] IDENTITY(1,1) NOT NULL,
	[MenuMainId] [int] NOT NULL,
	[RoleId] [int] NULL,
	[Tittle] [varchar](40) NULL,
	[Controller] [varchar](40) NULL,
	[Action] [varchar](40) NULL,
	[Description] [varchar](50) NULL,
	[Status] [bit] NULL,
	[Priority] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_tblMenuSub] PRIMARY KEY CLUSTERED 
(
	[MenuSubId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProblemType]    Script Date: 7/14/2021 9:43:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProblemType](
	[ProblemTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](200) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_tblProblemType] PRIMARY KEY CLUSTERED 
(
	[ProblemTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblReportType]    Script Date: 7/14/2021 9:43:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblReportType](
	[ReportTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_tblReportType] PRIMARY KEY CLUSTERED 
(
	[ReportTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRequestType]    Script Date: 7/14/2021 9:43:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRequestType](
	[RequestId] [tinyint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_tblRequestType] PRIMARY KEY CLUSTERED 
(
	[RequestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRoleMaster]    Script Date: 7/14/2021 9:43:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRoleMaster](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
 CONSTRAINT [PK_tblRoleMaster] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblScreen]    Script Date: 7/14/2021 9:43:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblScreen](
	[ScreenId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_tblScreen] PRIMARY KEY CLUSTERED 
(
	[ScreenId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblScreenRole]    Script Date: 7/14/2021 9:43:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblScreenRole](
	[ScreenId] [int] NOT NULL,
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[Access] [tinyint] NULL,
	[LastUpdatedOn] [datetime] NULL,
	[LastUpdatedBy] [int] NULL,
 CONSTRAINT [PK_tblScreenRole] PRIMARY KEY CLUSTERED 
(
	[ScreenId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblState]    Script Date: 7/14/2021 9:43:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblState](
	[StateId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[CountryId] [int] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_tblState] PRIMARY KEY CLUSTERED 
(
	[StateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblStatus]    Script Date: 7/14/2021 9:43:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblStatus](
	[StatusId] [int] IDENTITY(1,1) NOT NULL,
	[Type] [varchar](50) NULL,
	[Name] [varchar](50) NULL,
 CONSTRAINT [PK_tblStatus] PRIMARY KEY CLUSTERED 
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTechRequest]    Script Date: 7/14/2021 9:43:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTechRequest](
	[TechRequestId] [bigint] IDENTITY(1,1) NOT NULL,
	[Summary] [varchar](200) NULL,
	[ProblemType] [int] NULL,
	[Description] [varchar](500) NULL,
	[MobileNo] [varchar](20) NULL,
	[RaisedBy] [int] NULL,
	[Status] [int] NULL,
	[RequestedDate] [datetime] NULL,
	[CompletionDate] [datetime] NULL,
	[ResolutionProvidedBy] [int] NULL,
	[ResolutionDetail] [varchar](500) NULL,
	[Attachment] [varchar](200) NULL,
	[AttachmentSource] [varchar](200) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
 CONSTRAINT [PK_tblTechRequest] PRIMARY KEY CLUSTERED 
(
	[TechRequestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUploader]    Script Date: 7/14/2021 9:43:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUploader](
	[UploaderId] [int] IDENTITY(1,1) NOT NULL,
	[ReportType] [int] NULL,
	[Month] [int] NULL,
	[Year] [int] NULL,
	[FileName] [varchar](200) NULL,
	[FileSource] [varchar](200) NULL,
	[ApplyTDS] [decimal](18, 4) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[InActive] [bit] NOT NULL,
	[StatusID] [int] NULL,
 CONSTRAINT [PK_tblUploader] PRIMARY KEY CLUSTERED 
(
	[UploaderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUserCSPDetail]    Script Date: 7/14/2021 9:43:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUserCSPDetail](
	[CSPId] [int] IDENTITY(1,1) NOT NULL,
	[CSPName] [varchar](200) NULL,
	[CSPCode] [varchar](100) NULL,
	[BranchCode] [varchar](100) NULL,
	[ExpiryDate] [date] NULL,
	[BankName] [varchar](50) NULL,
	[BankAccount] [varchar](50) NULL,
	[IFSC] [varchar](50) NULL,
	[CertificateStatus] [varchar](20) NULL,
	[Status] [int] NULL,
	[FatherName] [varchar](200) NULL,
	[MotherName] [varchar](200) NULL,
	[Country] [int] NULL,
	[State] [int] NULL,
	[City] [int] NULL,
	[Location] [nvarchar](50) NULL,
	[Category] [nvarchar](50) NULL,
	[PAN] [varchar](20) NULL,
	[VoterId] [varchar](50) NULL,
	[AadharNo] [varchar](50) NULL,
	[Education] [varchar](50) NULL,
	[Email] [varchar](200) NULL,
	[Mobile] [varchar](100) NULL,
	[EmergencyContactNumber] [varchar](100) NULL,
	[PassportSizePhoto] [varchar](200) NULL,
	[VoterIdImage] [varchar](200) NULL,
	[PANImage] [varchar](200) NULL,
	[AadharImage] [varchar](200) NULL,
	[LatestEducationProofImage] [varchar](200) NULL,
	[IIBFCertificationImage] [varchar](200) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_tblUserCSPDetail] PRIMARY KEY CLUSTERED 
(
	[CSPId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUserDetail]    Script Date: 7/14/2021 9:43:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUserDetail](
	[UserDetailId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](200) NULL,
	[FatherName] [varchar](200) NULL,
	[MotherName] [varchar](200) NULL,
	[EmailId] [varchar](200) NULL,
	[MobileNumber] [varchar](20) NULL,
	[CityId] [int] NULL,
	[Address] [varchar](300) NULL,
	[EmergencyContactNumber] [varchar](100) NULL,
	[DepartmentId] [int] NULL,
	[DesignationId] [int] NULL,
	[Qualification] [varchar](200) NULL,
	[ProfilePicSource] [varchar](200) NULL,
	[CreatedDate] [datetime] NULL,
	[CreaterdBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UserId] [int] NULL,
 CONSTRAINT [PK_tblUserDetail] PRIMARY KEY CLUSTERED 
(
	[UserDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUserLoginLog]    Script Date: 7/14/2021 9:43:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUserLoginLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[LoginTimeStamp] [datetime] NULL,
	[IpAddress] [varchar](200) NULL,
	[HostName] [varchar](200) NULL,
 CONSTRAINT [PK_tblUserLoginLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 7/14/2021 9:43:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsers](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](20) NULL,
	[Password] [varchar](20) NULL,
	[UserType] [int] NULL,
	[UserSourceId] [int] NULL,
	[Status] [int] NULL,
	[IsPasswordReset] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_tblUsers] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUserStatus]    Script Date: 7/14/2021 9:43:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUserStatus](
	[StatusId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
 CONSTRAINT [PK_tblUserStatus] PRIMARY KEY CLUSTERED 
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblWebFeedback]    Script Date: 7/14/2021 9:43:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblWebFeedback](
	[FeedbackId] [int] IDENTITY(1,1) NOT NULL,
	[Requestor] [varchar](200) NULL,
	[EmailId] [varchar](200) NULL,
	[MobileNo] [varchar](20) NULL,
	[Message] [varchar](500) NULL,
	[receivedOn] [datetime] NULL,
	[IsReplied] [bit] NULL,
	[RepliedBy] [int] NULL,
 CONSTRAINT [PK_tblWebFeedback] PRIMARY KEY CLUSTERED 
(
	[FeedbackId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblWithdrawalRequest]    Script Date: 7/14/2021 9:43:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblWithdrawalRequest](
	[WithdrawalRequestId] [bigint] IDENTITY(1,1) NOT NULL,
	[Amount] [decimal](19, 6) NULL,
	[RaisedBy] [int] NULL,
	[Status] [int] NULL,
	[RequestedDate] [datetime] NULL,
	[CompletionDate] [datetime] NULL,
	[IsConfigured] [bit] NULL,
	[IsMake] [bit] NULL,
	[IsAuthorized] [bit] NULL,
	[ResolutionDetail] [varchar](500) NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[Account] [bigint] NULL,
 CONSTRAINT [PK_tblWithdrawalRequest] PRIMARY KEY CLUSTERED 
(
	[WithdrawalRequestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblAnnouncement] ON 

INSERT [dbo].[tblAnnouncement] ([AnnouncementId], [Source], [Message], [Detail], [Status]) VALUES (1, NULL, N'New Branch of SBI CSP Coming in Dispur, Assam                    ', N'Hi There- New Branch of SBI CSP Coming in Dispur, Assam- corners of North-Eastern region. Our mission is to bring convenience to the consumers doorstep, enabling them to access a diversified range of B2C services through a vibrant delivery mechanism by developing rural level entrepreneurs.', 1)
SET IDENTITY_INSERT [dbo].[tblAnnouncement] OFF
GO
SET IDENTITY_INSERT [dbo].[tblApplicationSettings] ON 

INSERT [dbo].[tblApplicationSettings] ([SettingId], [BusinessId], [ApplicationName], [AutoBackUp], [AutoBackUpDuration], [DataRetention], [Status], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, 1, N'eConnect', N'Yes', N'Weekly', 60, 1, NULL, NULL, CAST(N'2021-07-09T22:30:40.430' AS DateTime), 5)
SET IDENTITY_INSERT [dbo].[tblApplicationSettings] OFF
GO
SET IDENTITY_INSERT [dbo].[tblBusiness] ON 

INSERT [dbo].[tblBusiness] ([BusinessId], [Name], [Description], [CreatedOn], [Status]) VALUES (1, N'BusinessA', N'This is business A', NULL, 3)
INSERT [dbo].[tblBusiness] ([BusinessId], [Name], [Description], [CreatedOn], [Status]) VALUES (2, N'Business B', N'Business b', NULL, 5)
SET IDENTITY_INSERT [dbo].[tblBusiness] OFF
GO
SET IDENTITY_INSERT [dbo].[tblCity] ON 

INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (1, N'Alipur', N'101       ', 1, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (2, N'Andaman Island', N'102       ', 1, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (3, N'Anderson Island', N'103       ', 1, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (4, N'Arainj-Laka-Punga', N'104       ', 1, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (5, N'Austinabad', N'105       ', 1, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (6, N'Bamboo Flat', N'106       ', 1, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (7, N'Barren Island', N'107       ', 1, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (8, N'Beadonabad', N'108       ', 1, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (9, N'Betapur', N'109       ', 1, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (10, N'Bindraban', N'110       ', 1, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (11, N'Bonington', N'111       ', 1, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (12, N'Brookesabad', N'112       ', 1, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (13, N'Cadell Point', N'113       ', 1, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (14, N'Calicut', N'114       ', 1, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (15, N'Chetamale', N'115       ', 1, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (16, N'Cinque Islands', N'116       ', 1, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (17, N'Defence Island', N'117       ', 1, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (18, N'Digilpur', N'118       ', 1, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (19, N'Dolyganj', N'119       ', 1, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (20, N'Flat Island', N'120       ', 1, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (21, N'Geinyale', N'121       ', 1, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (22, N'Great Coco Island', N'122       ', 1, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (23, N'Haddo', N'123       ', 1, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (24, N'Havelock Island', N'124       ', 1, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (25, N'Henry Lawrence Island', N'125       ', 1, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (26, N'Herbertabad', N'126       ', 1, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (27, N'Hobdaypur', N'127       ', 1, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (28, N'Ilichar', N'128       ', 1, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (29, N'Ingoie', N'128       ', 1, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (30, N'Inteview Island', N'130       ', 1, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (31, N'Jangli Ghat', N'131       ', 1, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (32, N'Jhon Lawrence Island', N'132       ', 1, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (33, N'Karen', N'133       ', 1, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (34, N'Kartara', N'134       ', 1, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (35, N'KYD Islannd', N'135       ', 1, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (36, N'Landfall Island', N'136       ', 1, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (37, N'Little Andmand', N'137       ', 1, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (38, N'Little Coco Island', N'138       ', 1, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (39, N'Long Island', N'138       ', 1, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (40, N'Maimyo', N'140       ', 1, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (41, N'Malappuram', N'141       ', 1, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (42, N'Manglutan', N'142       ', 1, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (43, N'Manpur', N'143       ', 1, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (44, N'Mitha Khari', N'144       ', 1, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (45, N'Neill Island', N'145       ', 1, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (46, N'Nicobar Island', N'146       ', 1, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (47, N'North Brother Island', N'147       ', 1, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (48, N'North Passage Island', N'148       ', 1, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (49, N'North Sentinel Island', N'149       ', 1, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (50, N'Nothen Reef Island', N'150       ', 1, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (51, N'Outram Island', N'151       ', 1, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (52, N'Pahlagaon', N'152       ', 1, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (53, N'Palalankwe', N'153       ', 1, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (54, N'Passage Island', N'154       ', 1, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (55, N'Phaiapong', N'155       ', 1, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (56, N'Phoenix Island', N'156       ', 1, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (57, N'Port Blair', N'157       ', 1, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (58, N'Preparis Island', N'158       ', 1, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (59, N'Protheroepur', N'159       ', 1, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (60, N'Rangachang', N'160       ', 1, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (61, N'Rongat', N'161       ', 1, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (62, N'Rutland Island', N'162       ', 1, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (63, N'Sabari', N'163       ', 1, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (64, N'Saddle Peak', N'164       ', 1, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (65, N'Shadipur', N'165       ', 1, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (66, N'Smith Island', N'166       ', 1, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (67, N'Sound Island', N'167       ', 1, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (68, N'South Sentinel Island', N'168       ', 1, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (69, N'Spike Island', N'169       ', 1, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (70, N'Tarmugli Island', N'170       ', 1, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (71, N'Taylerabad', N'171       ', 1, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (72, N'Titaije', N'172       ', 1, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (73, N'Toibalawe', N'173       ', 1, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (74, N'Tusonabad', N'174       ', 1, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (75, N'West Island', N'175       ', 1, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (76, N'Wimberleyganj', N'176       ', 1, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (77, N'Yadita', N'177       ', 1, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (78, N'Adilabad', N'201       ', 2, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (79, N'Anantapur', N'201       ', 2, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (80, N'Chittoor', N'203       ', 2, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (81, N'Cuddapah', N'204       ', 2, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (82, N'East Godavari', N'205       ', 2, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (83, N'Guntur', N'206       ', 2, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (84, N'Hyderabad', N'207       ', 2, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (85, N'Karimnagar', N'208       ', 2, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (86, N'Khammam', N'209       ', 2, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (87, N'Krishna', N'210       ', 2, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (88, N'Kurnool', N'211       ', 2, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (89, N'Mahabubnagar', N'212       ', 2, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (90, N'Medak', N'213       ', 2, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (91, N'Nalgonda', N'214       ', 2, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (92, N'Nellore', N'215       ', 2, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (93, N'Nizamabad', N'216       ', 2, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (94, N'Prakasam', N'217       ', 2, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (95, N'Rangareddy', N'218       ', 2, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (96, N'Srikakulam', N'219       ', 2, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (97, N'Visakhapatnam', N'220       ', 2, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (98, N'Vizianagaram', N'221       ', 2, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (99, N'Warangal', N'222       ', 2, NULL)
GO
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (100, N'West Godavari', N'223       ', 2, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (101, N'Anjaw', N'301       ', 3, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (102, N'Changlang', N'302       ', 3, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (103, N'Dibang Valley', N'303       ', 3, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (104, N'East Kameng', N'304       ', 3, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (105, N'East Siang', N'305       ', 3, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (106, N'Itanagar', N'306       ', 3, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (107, N'Kurung Kumey', N'307       ', 3, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (108, N'Lohit', N'308       ', 3, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (109, N'Lower Dibang Valley', N'309       ', 3, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (110, N'Lower Subansiri', N'310       ', 3, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (111, N'Papum Pare', N'311       ', 3, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (112, N'Tawang', N'312       ', 3, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (113, N'Tirap', N'313       ', 3, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (114, N'Upper Siang', N'314       ', 3, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (115, N'Upper Subansiri', N'315       ', 3, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (116, N'West Kameng', N'316       ', 3, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (117, N'West Siang', N'317       ', 3, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (118, N'Barpeta', N'401       ', 4, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (119, N'Bongaigaon', N'402       ', 4, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (120, N'Cachar', N'403       ', 4, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (121, N'Darrang', N'404       ', 4, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (122, N'Dhemaji', N'405       ', 4, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (123, N'Dhubri', N'406       ', 4, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (124, N'Dibrugarh', N'407       ', 4, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (125, N'Goalpara', N'408       ', 4, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (126, N'Golaghat', N'409       ', 4, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (127, N'Guwahati', N'410       ', 4, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (128, N'Hailakandi', N'411       ', 4, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (129, N'Jorhat', N'412       ', 4, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (130, N'Kamrup', N'413       ', 4, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (131, N'Karbi Anglong', N'414       ', 4, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (132, N'Karimganj', N'415       ', 4, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (133, N'Kokrajhar', N'416       ', 4, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (134, N'Lakhimpur', N'417       ', 4, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (135, N'Marigaon', N'418       ', 4, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (136, N'Nagaon', N'419       ', 4, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (137, N'Nalbari', N'420       ', 4, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (138, N'North Cachar Hills', N'421       ', 4, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (139, N'Silchar', N'422       ', 4, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (140, N'Sivasagar', N'423       ', 4, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (141, N'Sonitpur', N'424       ', 4, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (142, N'Tinsukia', N'425       ', 4, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (143, N'Udalguri', N'426       ', 4, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (144, N'Araria', N'501       ', 5, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (145, N'Aurangabad', N'502       ', 5, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (146, N'Banka', N'503       ', 5, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (147, N'Begusarai', N'504       ', 5, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (148, N'Bhagalpur', N'505       ', 5, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (149, N'Bhojpur', N'506       ', 5, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (150, N'Buxar', N'507       ', 5, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (151, N'Darbhanga', N'508       ', 5, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (152, N'East Champaran', N'509       ', 5, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (153, N'Gaya', N'510       ', 5, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (154, N'Gopalganj', N'511       ', 5, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (155, N'Jamshedpur', N'512       ', 5, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (156, N'Jamui', N'513       ', 5, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (157, N'Jehanabad', N'514       ', 5, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (158, N'Kaimur (Bhabua)', N'515       ', 5, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (159, N'Katihar', N'516       ', 5, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (160, N'Khagaria', N'517       ', 5, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (161, N'Kishanganj', N'518       ', 5, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (162, N'Lakhisarai', N'519       ', 5, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (163, N'Madhepura', N'520       ', 5, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (164, N'Madhubani', N'521       ', 5, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (165, N'Munger', N'522       ', 5, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (166, N'Muzaffarpur', N'523       ', 5, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (167, N'Nalanda', N'524       ', 5, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (168, N'Nawada', N'525       ', 5, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (169, N'Patna', N'526       ', 5, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (170, N'Purnia', N'527       ', 5, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (171, N'Rohtas', N'528       ', 5, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (172, N'Saharsa', N'529       ', 5, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (173, N'Samastipur', N'530       ', 5, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (174, N'Saran', N'531       ', 5, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (175, N'Sheikhpura', N'532       ', 5, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (176, N'Sheohar', N'533       ', 5, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (177, N'Sitamarhi', N'534       ', 5, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (178, N'Siwan', N'535       ', 5, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (179, N'Supaul', N'536       ', 5, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (180, N'Vaishali', N'537       ', 5, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (181, N'West Champaran', N'538       ', 5, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (182, N'Chandigarh', N'601       ', 6, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (183, N'Mani Marja', N'602       ', 6, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (184, N'Bastar', N'701       ', 7, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (185, N'Bhilai', N'702       ', 7, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (186, N'Bijapur', N'703       ', 7, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (187, N'Bilaspur', N'704       ', 7, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (188, N'Dhamtari', N'705       ', 7, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (189, N'Durg', N'706       ', 7, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (190, N'Janjgir-Champa', N'707       ', 7, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (191, N'Jashpur', N'708       ', 7, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (192, N'Kabirdham-Kawardha', N'709       ', 7, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (193, N'Korba', N'710       ', 7, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (194, N'Korea', N'711       ', 7, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (195, N'Mahasamund', N'712       ', 7, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (196, N'Narayanpur', N'713       ', 7, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (197, N'Norh Bastar-Kanker', N'714       ', 7, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (198, N'Raigarh', N'715       ', 7, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (199, N'Raipur', N'716       ', 7, NULL)
GO
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (200, N'Rajnandgaon', N'717       ', 7, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (201, N'South Bastar-Dantewada', N'718       ', 7, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (202, N'Surguja', N'719       ', 7, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (203, N'Amal', N'801       ', 8, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (204, N'Amli', N'802       ', 8, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (205, N'Bedpa', N'803       ', 8, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (206, N'Chikhli', N'804       ', 8, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (207, N'Dadra & Nagar Haveli', N'805       ', 8, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (208, N'Dahikhed', N'806       ', 8, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (209, N'Dolara', N'807       ', 8, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (210, N'Galonda', N'808       ', 8, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (211, N'Kanadi', N'809       ', 8, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (212, N'Karchond', N'810       ', 8, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (213, N'Khadoli', N'811       ', 8, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (214, N'Kharadpada', N'812       ', 8, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (215, N'Kherabari', N'813       ', 8, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (216, N'Kherdi', N'814       ', 8, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (217, N'Kothar', N'815       ', 8, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (218, N'Luari', N'816       ', 8, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (219, N'Mashat', N'817       ', 8, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (220, N'Rakholi', N'818       ', 8, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (221, N'Rudana', N'819       ', 8, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (222, N'Saili', N'820       ', 8, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (223, N'Sili', N'821       ', 8, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (224, N'Silvassa', N'822       ', 8, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (225, N'Sindavni', N'823       ', 8, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (226, N'Udva', N'824       ', 8, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (227, N'Umbarkoi', N'825       ', 8, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (228, N'Vansda', N'826       ', 8, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (229, N'Vasona', N'827       ', 8, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (230, N'Velugam', N'828       ', 8, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (231, N'Brancavare', N'901       ', 9, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (232, N'Dagasi', N'902       ', 9, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (233, N'Daman', N'903       ', 9, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (234, N'Diu', N'904       ', 9, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (235, N'Magarvara', N'905       ', 9, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (236, N'Nagwa', N'906       ', 9, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (237, N'Pariali', N'907       ', 9, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (238, N'Passo Covo', N'908       ', 9, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (239, N'Central Delhi', N'1001      ', 10, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (240, N'East Delhi', N'1002      ', 10, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (241, N'New Delhi', N'1003      ', 10, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (242, N'North Delhi', N'1004      ', 10, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (243, N'North East Delhi', N'1005      ', 10, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (244, N'North West Delhi', N'1006      ', 10, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (245, N'Old Delhi', N'1007      ', 10, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (246, N'South Delhi', N'1008      ', 10, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (247, N'South West Delhi', N'1009      ', 10, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (248, N'West Delhi', N'1010      ', 10, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (249, N'Canacona', N'1101      ', 11, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (250, N'Candolim', N'1102      ', 11, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (251, N'Chinchinim', N'1103      ', 11, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (252, N'Cortalim', N'1104      ', 11, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (253, N'Goa', N'1105      ', 11, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (254, N'Jua', N'1106      ', 11, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (255, N'Madgaon', N'1107      ', 11, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (256, N'Mahem', N'1108      ', 11, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (257, N'Mapuca', N'1109      ', 11, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (258, N'Marmagao', N'1110      ', 11, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (259, N'Panji', N'1111      ', 11, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (260, N'Ponda', N'1112      ', 11, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (261, N'Sanvordem', N'1113      ', 11, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (262, N'Terekhol', N'1114      ', 11, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (263, N'Ahmedabad', N'1201      ', 12, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (264, N'Amreli', N'1202      ', 12, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (265, N'Anand', N'1203      ', 12, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (266, N'Banaskantha', N'1204      ', 12, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (267, N'Baroda', N'1205      ', 12, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (268, N'Bharuch', N'1206      ', 12, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (269, N'Bhavnagar', N'1207      ', 12, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (270, N'Dahod', N'1208      ', 12, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (271, N'Dang', N'1209      ', 12, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (272, N'Dwarka', N'1210      ', 12, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (273, N'Gandhinagar', N'1211      ', 12, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (274, N'Jamnagar', N'1212      ', 12, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (275, N'Junagadh', N'1213      ', 12, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (276, N'Kheda', N'1214      ', 12, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (277, N'Kutch', N'1215      ', 12, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (278, N'Mehsana', N'1216      ', 12, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (279, N'Nadiad', N'1217      ', 12, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (280, N'Narmada', N'1218      ', 12, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (281, N'Navsari', N'1219      ', 12, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (282, N'Panchmahals', N'1220      ', 12, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (283, N'Patan', N'1221      ', 12, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (284, N'Porbandar', N'1222      ', 12, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (285, N'Rajkot', N'1223      ', 12, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (286, N'Sabarkantha', N'1224      ', 12, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (287, N'Surat', N'1225      ', 12, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (288, N'Surendranagar', N'1226      ', 12, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (289, N'Vadodara', N'1227      ', 12, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (290, N'Valsad', N'1228      ', 12, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (291, N'Vapi', N'1229      ', 12, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (292, N'Ambala', N'1301      ', 13, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (293, N'Bhiwani', N'1302      ', 13, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (294, N'Faridabad', N'1303      ', 13, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (295, N'Fatehabad', N'1304      ', 13, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (296, N'Gurgaon', N'1305      ', 13, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (297, N'Hisar', N'1306      ', 13, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (298, N'Jhajjar', N'1307      ', 13, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (299, N'Jind', N'1308      ', 13, NULL)
GO
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (300, N'Kaithal', N'1309      ', 13, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (301, N'Karnal', N'1310      ', 13, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (302, N'Kurukshetra', N'1311      ', 13, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (303, N'Mahendragarh', N'1312      ', 13, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (304, N'Mewat', N'1313      ', 13, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (305, N'Panchkula', N'1314      ', 13, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (306, N'Panipat', N'1315      ', 13, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (307, N'Rewari', N'1316      ', 13, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (308, N'Rohtak', N'1317      ', 13, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (309, N'Sirsa', N'1318      ', 13, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (310, N'Sonipat', N'1319      ', 13, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (311, N'Yamunanagar', N'1320      ', 13, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (312, N'Bilaspur', N'1401      ', 14, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (313, N'Chamba', N'1402      ', 14, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (314, N'Dalhousie', N'1403      ', 14, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (315, N'Hamirpur', N'1404      ', 14, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (316, N'Kangra', N'1405      ', 14, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (317, N'Kinnaur', N'1406      ', 14, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (318, N'Kullu', N'1407      ', 14, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (319, N'Lahaul & Spiti', N'1408      ', 14, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (320, N'Mandi', N'1409      ', 14, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (321, N'Shimla', N'1410      ', 14, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (322, N'Sirmaur', N'1411      ', 14, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (323, N'Solan', N'1412      ', 14, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (324, N'Una', N'1413      ', 14, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (325, N'Anantnag', N'1501      ', 15, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (326, N'Baramulla', N'1502      ', 15, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (327, N'Budgam', N'1503      ', 15, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (328, N'Doda', N'1504      ', 15, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (329, N'Jammu', N'1505      ', 15, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (330, N'Kargil', N'1506      ', 15, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (331, N'Kathua', N'1507      ', 15, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (332, N'Kupwara', N'1508      ', 15, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (333, N'Leh', N'1509      ', 15, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (334, N'Poonch', N'1510      ', 15, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (335, N'Pulwama', N'1511      ', 15, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (336, N'Rajauri', N'1512      ', 15, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (337, N'Srinagar', N'1513      ', 15, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (338, N'Udhampur', N'1514      ', 15, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (339, N'Bokaro', N'1601      ', 16, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (340, N'Chatra', N'1602      ', 16, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (341, N'Deoghar', N'1603      ', 16, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (342, N'Dhanbad', N'1604      ', 16, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (343, N'Dumka', N'1605      ', 16, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (344, N'East Singhbhum', N'1606      ', 16, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (345, N'Garhwa', N'1607      ', 16, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (346, N'Giridih', N'1608      ', 16, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (347, N'Godda', N'1609      ', 16, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (348, N'Gumla', N'1610      ', 16, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (349, N'Hazaribag', N'1611      ', 16, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (350, N'Jamtara', N'1612      ', 16, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (351, N'Koderma', N'1613      ', 16, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (352, N'Latehar', N'1614      ', 16, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (353, N'Lohardaga', N'1615      ', 16, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (354, N'Pakur', N'1616      ', 16, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (355, N'Palamu', N'1617      ', 16, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (356, N'Ranchi', N'1618      ', 16, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (357, N'Sahibganj', N'1619      ', 16, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (358, N'Seraikela', N'1620      ', 16, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (359, N'Simdega', N'1621      ', 16, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (360, N'West Singhbhum', N'1622      ', 16, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (361, N'Bagalkot', N'1701      ', 17, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (362, N'Bangalore', N'1702      ', 17, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (363, N'Bangalore Rural', N'1703      ', 17, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (364, N'Belgaum', N'1704      ', 17, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (365, N'Bellary', N'1705      ', 17, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (366, N'Bhatkal', N'1706      ', 17, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (367, N'Bidar', N'1707      ', 17, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (368, N'Bijapur', N'1708      ', 17, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (369, N'Chamrajnagar', N'1709      ', 17, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (370, N'Chickmagalur', N'1710      ', 17, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (371, N'Chikballapur', N'1711      ', 17, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (372, N'Chitradurga', N'1712      ', 17, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (373, N'Dakshina Kannada', N'1713      ', 17, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (374, N'Davanagere', N'1714      ', 17, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (375, N'Dharwad', N'1715      ', 17, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (376, N'Gadag', N'1716      ', 17, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (377, N'Gulbarga', N'1717      ', 17, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (378, N'Hampi', N'1718      ', 17, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (379, N'Hassan', N'1719      ', 17, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (380, N'Haveri', N'1720      ', 17, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (381, N'Hospet', N'1721      ', 17, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (382, N'Karwar', N'1722      ', 17, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (383, N'Kodagu', N'1723      ', 17, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (384, N'Kolar', N'1724      ', 17, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (385, N'Koppal', N'1725      ', 17, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (386, N'Madikeri', N'1726      ', 17, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (387, N'Mandya', N'1727      ', 17, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (388, N'Mangalore', N'1728      ', 17, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (389, N'Manipal', N'1729      ', 17, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (390, N'Mysore', N'1730      ', 17, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (391, N'Raichur', N'1731      ', 17, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (392, N'Shimoga', N'1732      ', 17, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (393, N'Sirsi', N'1733      ', 17, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (394, N'Sringeri', N'1734      ', 17, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (395, N'Srirangapatna', N'1735      ', 17, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (396, N'Tumkur', N'1736      ', 17, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (397, N'Udupi', N'1737      ', 17, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (398, N'Uttara Kannada', N'1738      ', 17, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (399, N'Alappuzha', N'1801      ', 18, NULL)
GO
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (400, N'Alleppey', N'1802      ', 18, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (401, N'Alwaye', N'1803      ', 18, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (402, N'Ernakulam', N'1804      ', 18, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (403, N'Idukki', N'1805      ', 18, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (404, N'Kannur', N'1806      ', 18, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (405, N'Kasargod', N'1807      ', 18, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (406, N'Kochi', N'1808      ', 18, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (407, N'Kollam', N'1809      ', 18, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (408, N'Kottayam', N'1810      ', 18, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (409, N'Kovalam', N'1811      ', 18, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (410, N'Kozhikode', N'1812      ', 18, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (411, N'Malappuram', N'1813      ', 18, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (412, N'Palakkad', N'1814      ', 18, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (413, N'Pathanamthitta', N'1815      ', 18, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (414, N'Perumbavoor', N'1816      ', 18, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (415, N'Thiruvananthapuram', N'1817      ', 18, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (416, N'Thrissur', N'1818      ', 18, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (417, N'Trichur', N'1819      ', 18, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (418, N'Trivandrum', N'1820      ', 18, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (419, N'Wayanad', N'1821      ', 18, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (420, N'Agatti Island', N'1901      ', 19, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (421, N'Bingaram Island', N'1902      ', 19, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (422, N'Bitra Island', N'1903      ', 19, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (423, N'Chetlat Island', N'1904      ', 19, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (424, N'Kadmat Island', N'1905      ', 19, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (425, N'Kalpeni Island', N'1906      ', 19, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (426, N'Kavaratti Island', N'1907      ', 19, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (427, N'Kiltan Island', N'1908      ', 19, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (428, N'Lakshadweep Sea', N'1909      ', 19, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (429, N'Minicoy Island', N'1910      ', 19, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (430, N'North Island', N'1911      ', 19, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (431, N'South Island', N'1912      ', 19, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (432, N'Anuppur', N'2001      ', 20, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (433, N'Ashoknagar', N'2002      ', 20, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (434, N'Balaghat', N'2003      ', 20, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (435, N'Barwani', N'2004      ', 20, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (436, N'Betul', N'2005      ', 20, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (437, N'Bhind', N'2006      ', 20, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (438, N'Bhopal', N'2007      ', 20, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (439, N'Burhanpur', N'2008      ', 20, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (440, N'Chhatarpur', N'2009      ', 20, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (441, N'Chhindwara', N'2010      ', 20, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (442, N'Damoh', N'2011      ', 20, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (443, N'Datia', N'2012      ', 20, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (444, N'Dewas', N'2013      ', 20, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (445, N'Dhar', N'2014      ', 20, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (446, N'Dindori', N'2015      ', 20, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (447, N'Guna', N'2016      ', 20, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (448, N'Gwalior', N'2017      ', 20, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (449, N'Harda', N'2018      ', 20, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (450, N'Hoshangabad', N'2019      ', 20, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (451, N'Indore', N'2020      ', 20, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (452, N'Jabalpur', N'2021      ', 20, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (453, N'Jagdalpur', N'2022      ', 20, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (454, N'Jhabua', N'2023      ', 20, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (455, N'Katni', N'2024      ', 20, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (456, N'Khandwa', N'2025      ', 20, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (457, N'Khargone', N'2026      ', 20, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (458, N'Mandla', N'2027      ', 20, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (459, N'Mandsaur', N'2028      ', 20, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (460, N'Morena', N'2029      ', 20, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (461, N'Narsinghpur', N'2030      ', 20, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (462, N'Neemuch', N'2031      ', 20, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (463, N'Panna', N'2032      ', 20, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (464, N'Raisen', N'2033      ', 20, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (465, N'Rajgarh', N'2034      ', 20, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (466, N'Ratlam', N'2035      ', 20, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (467, N'Rewa', N'2036      ', 20, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (468, N'Sagar', N'2037      ', 20, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (469, N'Satna', N'2038      ', 20, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (470, N'Sehore', N'2039      ', 20, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (471, N'Seoni', N'2040      ', 20, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (472, N'Shahdol', N'2041      ', 20, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (473, N'Shajapur', N'2042      ', 20, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (474, N'Sheopur', N'2043      ', 20, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (475, N'Shivpuri', N'2044      ', 20, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (476, N'Sidhi', N'2045      ', 20, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (477, N'Tikamgarh', N'2046      ', 20, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (478, N'Ujjain', N'2047      ', 20, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (479, N'Umaria', N'2048      ', 20, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (480, N'Vidisha', N'2049      ', 20, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (481, N'Ahmednagar', N'2101      ', 21, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (482, N'Akola', N'2102      ', 21, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (483, N'Amravati', N'2103      ', 21, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (484, N'Aurangabad', N'2104      ', 21, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (485, N'Beed', N'2105      ', 21, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (486, N'Bhandara', N'2106      ', 21, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (487, N'Buldhana', N'2107      ', 21, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (488, N'Chandrapur', N'2108      ', 21, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (489, N'Dhule', N'2109      ', 21, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (490, N'Gadchiroli', N'2110      ', 21, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (491, N'Gondia', N'2111      ', 21, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (492, N'Hingoli', N'2112      ', 21, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (493, N'Jalgaon', N'2113      ', 21, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (494, N'Jalna', N'2114      ', 21, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (495, N'Kolhapur', N'2115      ', 21, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (496, N'Latur', N'2116      ', 21, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (497, N'Mahabaleshwar', N'2117      ', 21, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (498, N'Mumbai', N'2118      ', 21, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (499, N'Mumbai City', N'2119      ', 21, NULL)
GO
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (500, N'Mumbai Suburban', N'2120      ', 21, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (501, N'Nagpur', N'2121      ', 21, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (502, N'Nanded', N'2122      ', 21, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (503, N'Nandurbar', N'2123      ', 21, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (504, N'Nashik', N'2124      ', 21, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (505, N'Osmanabad', N'2125      ', 21, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (506, N'Parbhani', N'2126      ', 21, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (507, N'Pune', N'2127      ', 21, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (508, N'Raigad', N'2128      ', 21, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (509, N'Ratnagiri', N'2129      ', 21, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (510, N'Sangli', N'2130      ', 21, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (511, N'Satara', N'2131      ', 21, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (512, N'Sholapur', N'2132      ', 21, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (513, N'Sindhudurg', N'2133      ', 21, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (514, N'Thane', N'2134      ', 21, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (515, N'Wardha', N'2135      ', 21, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (516, N'Washim', N'2136      ', 21, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (517, N'Yavatmal', N'2137      ', 21, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (518, N'Bishnupur', N'2201      ', 22, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (519, N'Chandel', N'2202      ', 22, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (520, N'Churachandpur', N'2203      ', 22, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (521, N'Imphal East', N'2204      ', 22, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (522, N'Imphal West', N'2205      ', 22, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (523, N'Senapati', N'2206      ', 22, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (524, N'Tamenglong', N'2207      ', 22, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (525, N'Thoubal', N'2208      ', 22, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (526, N'Ukhrul', N'2209      ', 22, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (527, N'East Garo Hills', N'2301      ', 23, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (528, N'East Khasi Hills', N'2302      ', 23, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (529, N'Jaintia Hills', N'2303      ', 23, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (530, N'Ri Bhoi', N'2304      ', 23, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (531, N'Shillong', N'2305      ', 23, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (532, N'South Garo Hills', N'2306      ', 23, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (533, N'West Garo Hills', N'2307      ', 23, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (534, N'West Khasi Hills', N'2308      ', 23, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (535, N'Aizawl', N'2401      ', 24, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (536, N'Champhai', N'2402      ', 24, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (537, N'Kolasib', N'2403      ', 24, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (538, N'Lawngtlai', N'2404      ', 24, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (539, N'Lunglei', N'2405      ', 24, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (540, N'Mamit', N'2406      ', 24, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (541, N'Saiha', N'2407      ', 24, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (542, N'Serchhip', N'2408      ', 24, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (543, N'Dimapur', N'2501      ', 25, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (544, N'Kohima', N'2502      ', 25, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (545, N'Mokokchung', N'2503      ', 25, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (546, N'Mon', N'2504      ', 25, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (547, N'Phek', N'2505      ', 25, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (548, N'Tuensang', N'2506      ', 25, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (549, N'Wokha', N'2507      ', 25, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (550, N'Zunheboto', N'2508      ', 25, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (551, N'Angul', N'2601      ', 26, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (552, N'Balangir', N'2602      ', 26, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (553, N'Balasore', N'2603      ', 26, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (554, N'Baleswar', N'2604      ', 26, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (555, N'Bargarh', N'2605      ', 26, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (556, N'Berhampur', N'2606      ', 26, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (557, N'Bhadrak', N'2607      ', 26, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (558, N'Bhubaneswar', N'2608      ', 26, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (559, N'Boudh', N'2609      ', 26, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (560, N'Cuttack', N'2610      ', 26, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (561, N'Deogarh', N'2611      ', 26, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (562, N'Dhenkanal', N'2612      ', 26, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (563, N'Gajapati', N'2613      ', 26, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (564, N'Ganjam', N'2614      ', 26, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (565, N'Jagatsinghapur', N'2615      ', 26, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (566, N'Jajpur', N'2616      ', 26, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (567, N'Jharsuguda', N'2617      ', 26, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (568, N'Kalahandi', N'2618      ', 26, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (569, N'Kandhamal', N'2619      ', 26, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (570, N'Kendrapara', N'2620      ', 26, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (571, N'Kendujhar', N'2621      ', 26, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (572, N'Khordha', N'2622      ', 26, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (573, N'Koraput', N'2623      ', 26, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (574, N'Malkangiri', N'2624      ', 26, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (575, N'Mayurbhanj', N'2625      ', 26, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (576, N'Nabarangapur', N'2626      ', 26, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (577, N'Nayagarh', N'2627      ', 26, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (578, N'Nuapada', N'2628      ', 26, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (579, N'Puri', N'2629      ', 26, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (580, N'Rayagada', N'2630      ', 26, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (581, N'Rourkela', N'2631      ', 26, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (582, N'Sambalpur', N'2632      ', 26, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (583, N'Subarnapur', N'2633      ', 26, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (584, N'Sundergarh', N'2634      ', 26, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (585, N'Bahur', N'2701      ', 27, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (586, N'Karaikal', N'2701      ', 27, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (587, N'Mahe', N'2701      ', 27, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (588, N'Pondicherry', N'2701      ', 27, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (589, N'Purnankuppam', N'2701      ', 27, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (590, N'Valudavur', N'2701      ', 27, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (591, N'Villianur', N'2701      ', 27, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (592, N'Yanam', N'2701      ', 27, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (593, N'Amritsar', N'2801      ', 28, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (594, N'Barnala', N'2801      ', 28, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (595, N'Bathinda', N'2801      ', 28, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (596, N'Faridkot', N'2801      ', 28, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (597, N'Fatehgarh Sahib', N'2801      ', 28, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (598, N'Ferozepur', N'2801      ', 28, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (599, N'Gurdaspur', N'2801      ', 28, NULL)
GO
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (600, N'Hoshiarpur', N'2801      ', 28, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (601, N'Jalandhar', N'2801      ', 28, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (602, N'Kapurthala', N'2801      ', 28, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (603, N'Ludhiana', N'2801      ', 28, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (604, N'Mansa', N'2801      ', 28, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (605, N'Moga', N'2801      ', 28, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (606, N'Muktsar', N'2801      ', 28, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (607, N'Nawanshahr', N'2801      ', 28, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (608, N'Pathankot', N'2801      ', 28, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (609, N'Patiala', N'2801      ', 28, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (610, N'Rupnagar', N'2801      ', 28, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (611, N'Sangrur', N'2801      ', 28, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (612, N'SAS Nagar', N'2801      ', 28, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (613, N'Tarn Taran', N'2801      ', 28, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (614, N'Ajmer', N'2901      ', 29, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (615, N'Alwar', N'2902      ', 29, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (616, N'Banswara', N'2903      ', 29, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (617, N'Baran', N'2904      ', 29, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (618, N'Barmer', N'2905      ', 29, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (619, N'Bharatpur', N'2906      ', 29, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (620, N'Bhilwara', N'2907      ', 29, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (621, N'Bikaner', N'2908      ', 29, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (622, N'Bundi', N'2909      ', 29, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (623, N'Chittorgarh', N'2910      ', 29, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (624, N'Churu', N'2911      ', 29, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (625, N'Dausa', N'2912      ', 29, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (626, N'Dholpur', N'2913      ', 29, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (627, N'Dungarpur', N'2914      ', 29, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (628, N'Hanumangarh', N'2915      ', 29, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (629, N'Jaipur', N'2916      ', 29, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (630, N'Jaisalmer', N'2917      ', 29, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (631, N'Jalore', N'2918      ', 29, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (632, N'Jhalawar', N'2919      ', 29, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (633, N'Jhunjhunu', N'2920      ', 29, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (634, N'Jodhpur', N'2921      ', 29, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (635, N'Karauli', N'2922      ', 29, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (636, N'Kota', N'2923      ', 29, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (637, N'Nagaur', N'2924      ', 29, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (638, N'Pali', N'2925      ', 29, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (639, N'Pilani', N'2926      ', 29, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (640, N'Rajsamand', N'2927      ', 29, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (641, N'Sawai Madhopur', N'2928      ', 29, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (642, N'Sikar', N'2929      ', 29, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (643, N'Sirohi', N'2930      ', 29, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (644, N'Sri Ganganagar', N'2931      ', 29, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (645, N'Tonk', N'2932      ', 29, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (646, N'Udaipur', N'2933      ', 29, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (647, N'Barmiak', N'3001      ', 30, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (648, N'Be', N'3002      ', 30, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (649, N'Bhurtuk', N'3003      ', 30, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (650, N'Chhubakha', N'3004      ', 30, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (651, N'Chidam', N'3005      ', 30, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (652, N'Chubha', N'3006      ', 30, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (653, N'Chumikteng', N'3007      ', 30, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (654, N'Dentam', N'3008      ', 30, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (655, N'Dikchu', N'3009      ', 30, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (656, N'Dzongri', N'3010      ', 30, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (657, N'Gangtok', N'3011      ', 30, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (658, N'Gauzing', N'3012      ', 30, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (659, N'Gyalshing', N'3013      ', 30, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (660, N'Hema', N'3014      ', 30, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (661, N'Kerung', N'3015      ', 30, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (662, N'Lachen', N'3016      ', 30, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (663, N'Lachung', N'3017      ', 30, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (664, N'Lema', N'3018      ', 30, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (665, N'Lingtam', N'3019      ', 30, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (666, N'Lungthu', N'3020      ', 30, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (667, N'Mangan', N'3021      ', 30, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (668, N'Namchi', N'3022      ', 30, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (669, N'Namthang', N'3023      ', 30, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (670, N'Nanga', N'3024      ', 30, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (671, N'Nantang', N'3025      ', 30, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (672, N'Naya Bazar', N'3026      ', 30, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (673, N'Padamachen', N'3027      ', 30, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (674, N'Pakhyong', N'3028      ', 30, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (675, N'Pemayangtse', N'3029      ', 30, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (676, N'Phensang', N'3030      ', 30, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (677, N'Rangli', N'3031      ', 30, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (678, N'Rinchingpong', N'3032      ', 30, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (679, N'Sakyong', N'3033      ', 30, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (680, N'Samdong', N'3034      ', 30, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (681, N'Singtam', N'3035      ', 30, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (682, N'Siniolchu', N'3035      ', 30, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (683, N'Sombari', N'3036      ', 30, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (684, N'Soreng', N'3037      ', 30, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (685, N'Sosing', N'3038      ', 30, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (686, N'Tekhug', N'3039      ', 30, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (687, N'Temi', N'3040      ', 30, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (688, N'Tsetang', N'3041      ', 30, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (689, N'Tsomgo', N'3042      ', 30, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (690, N'Tumlong', N'3043      ', 30, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (691, N'Yangang', N'3044      ', 30, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (692, N'Yumtang', N'3045      ', 30, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (693, N'Chennai', N'3101      ', 31, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (694, N'Chidambaram', N'3102      ', 31, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (695, N'Chingleput', N'3103      ', 31, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (696, N'Coimbatore', N'3104      ', 31, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (697, N'Courtallam', N'3105      ', 31, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (698, N'Cuddalore', N'3106      ', 31, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (699, N'Dharmapuri', N'3107      ', 31, NULL)
GO
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (700, N'Dindigul', N'3108      ', 31, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (701, N'Erode', N'3109      ', 31, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (702, N'Hosur', N'3110      ', 31, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (703, N'Kanchipuram', N'3111      ', 31, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (704, N'Kanyakumari', N'3112      ', 31, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (705, N'Karaikudi', N'3113      ', 31, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (706, N'Karur', N'3114      ', 31, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (707, N'Kodaikanal', N'3115      ', 31, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (708, N'Kovilpatti', N'3116      ', 31, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (709, N'Krishnagiri', N'3117      ', 31, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (710, N'Kumbakonam', N'3118      ', 31, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (711, N'Madurai', N'3119      ', 31, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (712, N'Mayiladuthurai', N'3120      ', 31, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (713, N'Nagapattinam', N'3121      ', 31, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (714, N'Nagarcoil', N'3122      ', 31, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (715, N'Namakkal', N'3123      ', 31, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (716, N'Neyveli', N'3124      ', 31, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (717, N'Nilgiris', N'3125      ', 31, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (718, N'Ooty', N'3126      ', 31, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (719, N'Palani', N'3127      ', 31, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (720, N'Perambalur', N'3128      ', 31, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (721, N'Pollachi', N'3129      ', 31, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (722, N'Pudukkottai', N'3130      ', 31, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (723, N'Rajapalayam', N'3131      ', 31, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (724, N'Ramanathapuram', N'3132      ', 31, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (725, N'Salem', N'3133      ', 31, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (726, N'Sivaganga', N'3134      ', 31, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (727, N'Sivakasi', N'3135      ', 31, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (728, N'Thanjavur', N'3136      ', 31, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (729, N'Theni', N'3137      ', 31, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (730, N'Thoothukudi', N'3138      ', 31, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (731, N'Tiruchirappalli', N'3139      ', 31, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (732, N'Tirunelveli', N'3140      ', 31, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (733, N'Tirupur', N'3141      ', 31, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (734, N'Tiruvallur', N'3142      ', 31, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (735, N'Tiruvannamalai', N'3143      ', 31, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (736, N'Tiruvarur', N'3144      ', 31, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (737, N'Trichy', N'3145      ', 31, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (738, N'Tuticorin', N'3146      ', 31, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (739, N'Vellore', N'3147      ', 31, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (740, N'Villupuram', N'3148      ', 31, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (741, N'Virudhunagar', N'3149      ', 31, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (742, N'Yercaud', N'3150      ', 31, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (743, N'Agartala', N'3201      ', 32, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (744, N'Ambasa', N'3202      ', 32, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (745, N'Bampurbari', N'3203      ', 32, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (746, N'Belonia', N'3204      ', 32, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (747, N'Dhalai', N'3205      ', 32, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (748, N'Dharam Nagar', N'3206      ', 32, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (749, N'Kailashahar', N'3207      ', 32, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (750, N'Kamal Krishnabari', N'3208      ', 32, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (751, N'Khopaiyapara', N'3209      ', 32, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (752, N'Khowai', N'3210      ', 32, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (753, N'Phuldungsei', N'3211      ', 32, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (754, N'Radha Kishore Pur', N'3212      ', 32, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (755, N'Tripura', N'3213      ', 32, NULL)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (756, N'KIPHIRE', N'          ', 25, 1)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (757, N'LONGLENG', N'          ', 25, 1)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (758, N'LONGSA', N'          ', 25, 1)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (759, N'PEREN', N'          ', 25, 1)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (760, N'BAKSA', N'          ', 4, 1)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (761, N'BISWANATH', N'          ', 4, 1)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (762, N'CHARAIDEO', N'          ', 4, 1)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (763, N'CHIRANG', N'          ', 4, 1)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (764, N'DIMAHASAO', N'          ', 4, 1)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (765, N'GOLGHAT', N'          ', 4, 1)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (766, N'KAMRUP[R]', N'          ', 4, 1)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (767, N'KAMRUP[M]', N'          ', 4, 1)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (768, N'MORIGAON', N'          ', 4, 1)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (769, N'SOUTH SALMARA MANKACHAR', N'          ', 4, 1)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (770, N'LOHIT NAMSAI', N'          ', 3, 1)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (771, N'LOWER DIBANG VALLY', N'          ', 3, 1)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (772, N'NAMSAI', N'          ', 3, 1)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (773, N'PAPUMPARE', N'          ', 3, 1)
INSERT [dbo].[tblCity] ([CityId], [Name], [Code], [StateId], [Status]) VALUES (774, N'WEST IMPHAL', N'          ', 22, 1)
SET IDENTITY_INSERT [dbo].[tblCity] OFF
GO
SET IDENTITY_INSERT [dbo].[tblConfiguration] ON 

INSERT [dbo].[tblConfiguration] ([ConfigurationId], [BusinessId], [DeactiveAccountDaysForInvalidPwd], [LockAccountDaysForInvalidPwd], [AutoUnlockAccountMinutes], [PasswordAutoExpireInDays], [IsPasswordNeverExpired], [ChangedPwdOnNextLogin], [PasswordLength], [NotifiedToCSP]) VALUES (1, 2, 0, 300, 400, 500, 1, 1, 800, 1)
INSERT [dbo].[tblConfiguration] ([ConfigurationId], [BusinessId], [DeactiveAccountDaysForInvalidPwd], [LockAccountDaysForInvalidPwd], [AutoUnlockAccountMinutes], [PasswordAutoExpireInDays], [IsPasswordNeverExpired], [ChangedPwdOnNextLogin], [PasswordLength], [NotifiedToCSP]) VALUES (3, 1, 2, 3, 4, 5, 1, 1, 8, 1)
INSERT [dbo].[tblConfiguration] ([ConfigurationId], [BusinessId], [DeactiveAccountDaysForInvalidPwd], [LockAccountDaysForInvalidPwd], [AutoUnlockAccountMinutes], [PasswordAutoExpireInDays], [IsPasswordNeverExpired], [ChangedPwdOnNextLogin], [PasswordLength], [NotifiedToCSP]) VALUES (5, 1, 9, 8, 7, 6, 0, 0, 9, 0)
INSERT [dbo].[tblConfiguration] ([ConfigurationId], [BusinessId], [DeactiveAccountDaysForInvalidPwd], [LockAccountDaysForInvalidPwd], [AutoUnlockAccountMinutes], [PasswordAutoExpireInDays], [IsPasswordNeverExpired], [ChangedPwdOnNextLogin], [PasswordLength], [NotifiedToCSP]) VALUES (6, 1, 4, 5, 6, 7, 1, 1, 4, 0)
SET IDENTITY_INSERT [dbo].[tblConfiguration] OFF
GO
SET IDENTITY_INSERT [dbo].[tblCountry] ON 

INSERT [dbo].[tblCountry] ([CountryId], [Name], [Status]) VALUES (1, N'India', 1)
SET IDENTITY_INSERT [dbo].[tblCountry] OFF
GO
SET IDENTITY_INSERT [dbo].[tblFolderDetails] ON 

INSERT [dbo].[tblFolderDetails] ([FolderId], [FolderName], [Priority], [InActive]) VALUES (1, N'2021', 1, 0)
INSERT [dbo].[tblFolderDetails] ([FolderId], [FolderName], [Priority], [InActive]) VALUES (2, N'2020', 2, 0)
SET IDENTITY_INSERT [dbo].[tblFolderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[tblMenuMain] ON 

INSERT [dbo].[tblMenuMain] ([MenuMainId], [Tittle], [Controller], [Action], [Description], [Status], [Priority], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, N'Dashboard', N'Home', N'Dashboard', NULL, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblMenuMain] ([MenuMainId], [Tittle], [Controller], [Action], [Description], [Status], [Priority], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (2, N'Manage Request', N'Home', N'ManageRequest', NULL, 1, 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblMenuMain] ([MenuMainId], [Tittle], [Controller], [Action], [Description], [Status], [Priority], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (3, N'Manage User', N'Home', N'ManageUsers', NULL, 1, 4, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblMenuMain] ([MenuMainId], [Tittle], [Controller], [Action], [Description], [Status], [Priority], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (4, N'Upload Reports', N'Home', N'Report', NULL, 1, 5, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblMenuMain] ([MenuMainId], [Tittle], [Controller], [Action], [Description], [Status], [Priority], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (5, N'Application', N'Home', N'ApplicationSetting', NULL, 1, 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblMenuMain] ([MenuMainId], [Tittle], [Controller], [Action], [Description], [Status], [Priority], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (6, N'CSP Dashboard', N'Home', N'CSPDashboard', NULL, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblMenuMain] ([MenuMainId], [Tittle], [Controller], [Action], [Description], [Status], [Priority], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (7, N'Raise Request', N'Home', N'RaiseRequest', NULL, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblMenuMain] ([MenuMainId], [Tittle], [Controller], [Action], [Description], [Status], [Priority], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (8, N'My Profile', N'Home', N'ProfileUpdate', NULL, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblMenuMain] ([MenuMainId], [Tittle], [Controller], [Action], [Description], [Status], [Priority], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (9, N'Reports', N'Home', N'CSPReports', NULL, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblMenuMain] ([MenuMainId], [Tittle], [Controller], [Action], [Description], [Status], [Priority], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (10, N'Application', N'Home', N'Application', NULL, 0, 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblMenuMain] ([MenuMainId], [Tittle], [Controller], [Action], [Description], [Status], [Priority], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (11, N'Download Reports', N'Home', N'Report', NULL, 1, 6, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[tblMenuMain] OFF
GO
SET IDENTITY_INSERT [dbo].[tblMenuSub] ON 

INSERT [dbo].[tblMenuSub] ([MenuSubId], [MenuMainId], [RoleId], [Tittle], [Controller], [Action], [Description], [Status], [Priority], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, 1, 1, N'Dashboard', N'Admin', N'Dashboard', NULL, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblMenuSub] ([MenuSubId], [MenuMainId], [RoleId], [Tittle], [Controller], [Action], [Description], [Status], [Priority], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (2, 2, 1, N'Technical Support', N'Home', N'TechnicalSupport', NULL, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblMenuSub] ([MenuSubId], [MenuMainId], [RoleId], [Tittle], [Controller], [Action], [Description], [Status], [Priority], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (3, 2, 1, N'Deposit Request', N'Home', N'DepositRequest', NULL, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblMenuSub] ([MenuSubId], [MenuMainId], [RoleId], [Tittle], [Controller], [Action], [Description], [Status], [Priority], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (4, 2, 1, N'Withdrawal Request', N'Home', N'WithdrawalRequest', NULL, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblMenuSub] ([MenuSubId], [MenuMainId], [RoleId], [Tittle], [Controller], [Action], [Description], [Status], [Priority], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (5, 3, 1, N'Users', N'User', N'Index', NULL, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblMenuSub] ([MenuSubId], [MenuMainId], [RoleId], [Tittle], [Controller], [Action], [Description], [Status], [Priority], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (6, 3, 1, N'CSP', N'CSP', N'Index', NULL, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblMenuSub] ([MenuSubId], [MenuMainId], [RoleId], [Tittle], [Controller], [Action], [Description], [Status], [Priority], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (7, 4, 1, N'Uploader Report', N'Admin', N'Uploader', NULL, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblMenuSub] ([MenuSubId], [MenuMainId], [RoleId], [Tittle], [Controller], [Action], [Description], [Status], [Priority], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (8, 4, 1, N'Commission Uploader', N'Admin', N'UploadCommissionReport', NULL, 1, 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblMenuSub] ([MenuSubId], [MenuMainId], [RoleId], [Tittle], [Controller], [Action], [Description], [Status], [Priority], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (9, 10, 1, N'Commission Report', N'Home', N'Report', NULL, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblMenuSub] ([MenuSubId], [MenuMainId], [RoleId], [Tittle], [Controller], [Action], [Description], [Status], [Priority], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (10, 6, 3, N'CSP Dashboard', N'CSP', N'Dashboard', NULL, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblMenuSub] ([MenuSubId], [MenuMainId], [RoleId], [Tittle], [Controller], [Action], [Description], [Status], [Priority], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (11, 7, 3, N'Technical Support', N'Home', N'TechnicalSupport', NULL, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblMenuSub] ([MenuSubId], [MenuMainId], [RoleId], [Tittle], [Controller], [Action], [Description], [Status], [Priority], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (12, 7, 3, N'Deposit Request', N'Home', N'DepositRequest', NULL, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblMenuSub] ([MenuSubId], [MenuMainId], [RoleId], [Tittle], [Controller], [Action], [Description], [Status], [Priority], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (13, 7, 3, N'Withdrawal Request', N'Home', N'WithdrawalRequest', NULL, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblMenuSub] ([MenuSubId], [MenuMainId], [RoleId], [Tittle], [Controller], [Action], [Description], [Status], [Priority], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (14, 8, 3, N'Profile Update', N'CSP', N'EditCSPProfile', NULL, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblMenuSub] ([MenuSubId], [MenuMainId], [RoleId], [Tittle], [Controller], [Action], [Description], [Status], [Priority], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (16, 9, 3, N'Commission Report', N'Home', N'Report', NULL, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblMenuSub] ([MenuSubId], [MenuMainId], [RoleId], [Tittle], [Controller], [Action], [Description], [Status], [Priority], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (17, 5, 1, N'Application Setting', N'Admin', N'_EditApplicationSetting', NULL, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblMenuSub] ([MenuSubId], [MenuMainId], [RoleId], [Tittle], [Controller], [Action], [Description], [Status], [Priority], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (18, 10, 1, N'Transaction Wise Commission', N'Reports', N'DownloadCommissionReport', NULL, 1, 1, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[tblMenuSub] OFF
GO
SET IDENTITY_INSERT [dbo].[tblProblemType] ON 

INSERT [dbo].[tblProblemType] ([ProblemTypeId], [Name], [Status]) VALUES (1, N'Technical', 1)
INSERT [dbo].[tblProblemType] ([ProblemTypeId], [Name], [Status]) VALUES (2, N'Support', NULL)
SET IDENTITY_INSERT [dbo].[tblProblemType] OFF
GO
SET IDENTITY_INSERT [dbo].[tblReportType] ON 

INSERT [dbo].[tblReportType] ([ReportTypeId], [Name], [Status]) VALUES (1, N'Commission', 0)
INSERT [dbo].[tblReportType] ([ReportTypeId], [Name], [Status]) VALUES (2, N'Business Detail', 0)
INSERT [dbo].[tblReportType] ([ReportTypeId], [Name], [Status]) VALUES (3, N'Commission Monthly', 1)
SET IDENTITY_INSERT [dbo].[tblReportType] OFF
GO
SET IDENTITY_INSERT [dbo].[tblRoleMaster] ON 

INSERT [dbo].[tblRoleMaster] ([RoleId], [Name]) VALUES (1, N'Super Admin')
INSERT [dbo].[tblRoleMaster] ([RoleId], [Name]) VALUES (2, N'Admin')
INSERT [dbo].[tblRoleMaster] ([RoleId], [Name]) VALUES (3, N'CSP')
INSERT [dbo].[tblRoleMaster] ([RoleId], [Name]) VALUES (4, N'User')
SET IDENTITY_INSERT [dbo].[tblRoleMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[tblState] ON 

INSERT [dbo].[tblState] ([StateId], [Name], [CountryId], [Status]) VALUES (1, N'Andaman & Nicobar [AN]', 1, 1)
INSERT [dbo].[tblState] ([StateId], [Name], [CountryId], [Status]) VALUES (2, N'Andhra Pradesh [AP]', 1, 1)
INSERT [dbo].[tblState] ([StateId], [Name], [CountryId], [Status]) VALUES (3, N'Arunachal Pradesh [AR]', 1, 1)
INSERT [dbo].[tblState] ([StateId], [Name], [CountryId], [Status]) VALUES (4, N'Assam [AS]', 1, 1)
INSERT [dbo].[tblState] ([StateId], [Name], [CountryId], [Status]) VALUES (5, N'Bihar [BH]', 1, 1)
INSERT [dbo].[tblState] ([StateId], [Name], [CountryId], [Status]) VALUES (6, N'Chandigarh [CH]', 1, 1)
INSERT [dbo].[tblState] ([StateId], [Name], [CountryId], [Status]) VALUES (7, N'Chhattisgarh [CG]', 1, 1)
INSERT [dbo].[tblState] ([StateId], [Name], [CountryId], [Status]) VALUES (8, N'Dadra & Nagar Haveli [DN]', 1, 1)
INSERT [dbo].[tblState] ([StateId], [Name], [CountryId], [Status]) VALUES (9, N'Daman & Diu [DD]', 1, 1)
INSERT [dbo].[tblState] ([StateId], [Name], [CountryId], [Status]) VALUES (10, N'Delhi [DL]', 1, 1)
INSERT [dbo].[tblState] ([StateId], [Name], [CountryId], [Status]) VALUES (11, N'Goa [GO]', 1, 1)
INSERT [dbo].[tblState] ([StateId], [Name], [CountryId], [Status]) VALUES (12, N'Gujarat [GU]', 1, 1)
INSERT [dbo].[tblState] ([StateId], [Name], [CountryId], [Status]) VALUES (13, N'Haryana [HR]', 1, 1)
INSERT [dbo].[tblState] ([StateId], [Name], [CountryId], [Status]) VALUES (14, N'Himachal Pradesh [HP]', 1, 1)
INSERT [dbo].[tblState] ([StateId], [Name], [CountryId], [Status]) VALUES (15, N'Jammu & Kashmir [JK]', 1, 1)
INSERT [dbo].[tblState] ([StateId], [Name], [CountryId], [Status]) VALUES (16, N'Jharkhand [JH]', 1, 1)
INSERT [dbo].[tblState] ([StateId], [Name], [CountryId], [Status]) VALUES (17, N'Karnataka [KR]', 1, 1)
INSERT [dbo].[tblState] ([StateId], [Name], [CountryId], [Status]) VALUES (18, N'Kerala [KL]', 1, 1)
INSERT [dbo].[tblState] ([StateId], [Name], [CountryId], [Status]) VALUES (19, N'Lakshadweep [LD]', 1, 1)
INSERT [dbo].[tblState] ([StateId], [Name], [CountryId], [Status]) VALUES (20, N'Madhya Pradesh [MP]', 1, 1)
INSERT [dbo].[tblState] ([StateId], [Name], [CountryId], [Status]) VALUES (21, N'Maharashtra [MH]', 1, 1)
INSERT [dbo].[tblState] ([StateId], [Name], [CountryId], [Status]) VALUES (22, N'Manipur [MN]', 1, 1)
INSERT [dbo].[tblState] ([StateId], [Name], [CountryId], [Status]) VALUES (23, N'Meghalaya [ML]', 1, 1)
INSERT [dbo].[tblState] ([StateId], [Name], [CountryId], [Status]) VALUES (24, N'Mizoram [MM]', 1, 1)
INSERT [dbo].[tblState] ([StateId], [Name], [CountryId], [Status]) VALUES (25, N'Nagaland [NL]', 1, 1)
INSERT [dbo].[tblState] ([StateId], [Name], [CountryId], [Status]) VALUES (26, N'Orissa [OR]', 1, 1)
INSERT [dbo].[tblState] ([StateId], [Name], [CountryId], [Status]) VALUES (27, N'Pondicherry [PC]', 1, 1)
INSERT [dbo].[tblState] ([StateId], [Name], [CountryId], [Status]) VALUES (28, N'Punjab [PJ]', 1, 1)
INSERT [dbo].[tblState] ([StateId], [Name], [CountryId], [Status]) VALUES (29, N'Rajasthan [RJ]', 1, 1)
INSERT [dbo].[tblState] ([StateId], [Name], [CountryId], [Status]) VALUES (30, N'Sikkim [SK]', 1, 1)
INSERT [dbo].[tblState] ([StateId], [Name], [CountryId], [Status]) VALUES (31, N'Tamil Nadu [TN]', 1, 1)
INSERT [dbo].[tblState] ([StateId], [Name], [CountryId], [Status]) VALUES (32, N'Tripura [TR]', 1, 1)
INSERT [dbo].[tblState] ([StateId], [Name], [CountryId], [Status]) VALUES (33, N'Uttar Pradesh [UP]', 1, 1)
INSERT [dbo].[tblState] ([StateId], [Name], [CountryId], [Status]) VALUES (34, N'Uttaranchal [UT]', 1, 1)
INSERT [dbo].[tblState] ([StateId], [Name], [CountryId], [Status]) VALUES (35, N'West Bengal [WB]', 1, 1)
SET IDENTITY_INSERT [dbo].[tblState] OFF
GO
SET IDENTITY_INSERT [dbo].[tblStatus] ON 

INSERT [dbo].[tblStatus] ([StatusId], [Type], [Name]) VALUES (1, N'1', N'Open')
INSERT [dbo].[tblStatus] ([StatusId], [Type], [Name]) VALUES (2, N'2', N'In-Progress')
INSERT [dbo].[tblStatus] ([StatusId], [Type], [Name]) VALUES (3, N'3', N'Completed')
INSERT [dbo].[tblStatus] ([StatusId], [Type], [Name]) VALUES (4, N'4', N'On-Hold')
INSERT [dbo].[tblStatus] ([StatusId], [Type], [Name]) VALUES (5, N'5', N'NotPublished')
INSERT [dbo].[tblStatus] ([StatusId], [Type], [Name]) VALUES (6, N'6', N'Published')
SET IDENTITY_INSERT [dbo].[tblStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[tblTechRequest] ON 

INSERT [dbo].[tblTechRequest] ([TechRequestId], [Summary], [ProblemType], [Description], [MobileNo], [RaisedBy], [Status], [RequestedDate], [CompletionDate], [ResolutionProvidedBy], [ResolutionDetail], [Attachment], [AttachmentSource], [CreatedDate], [UpdatedBy], [UpdatedDate], [CreatedBy]) VALUES (2, N'This is test dfds', 1, N'test cdsc fdv', N'8822282', 1, 4, CAST(N'2021-05-22T19:41:06.570' AS DateTime), NULL, NULL, N'  <p>
        <b style="color:red;">This is test </b>
    </p>', NULL, NULL, CAST(N'2021-05-19T19:41:06.570' AS DateTime), NULL, CAST(N'2021-05-19T19:41:06.570' AS DateTime), NULL)
INSERT [dbo].[tblTechRequest] ([TechRequestId], [Summary], [ProblemType], [Description], [MobileNo], [RaisedBy], [Status], [RequestedDate], [CompletionDate], [ResolutionProvidedBy], [ResolutionDetail], [Attachment], [AttachmentSource], [CreatedDate], [UpdatedBy], [UpdatedDate], [CreatedBy]) VALUES (3, N'This is test', 1, N'test', N'8822282', 1, 2, CAST(N'2021-05-22T19:41:06.570' AS DateTime), NULL, NULL, NULL, NULL, NULL, CAST(N'2021-05-19T19:41:06.570' AS DateTime), NULL, CAST(N'2021-05-19T19:41:06.570' AS DateTime), NULL)
INSERT [dbo].[tblTechRequest] ([TechRequestId], [Summary], [ProblemType], [Description], [MobileNo], [RaisedBy], [Status], [RequestedDate], [CompletionDate], [ResolutionProvidedBy], [ResolutionDetail], [Attachment], [AttachmentSource], [CreatedDate], [UpdatedBy], [UpdatedDate], [CreatedBy]) VALUES (4, N'This is test', 1, N'test', N'8822282', 1, 3, CAST(N'2021-05-22T19:41:06.570' AS DateTime), NULL, NULL, N'<b>This is resolution details</b>', NULL, NULL, CAST(N'2021-05-19T19:41:06.570' AS DateTime), NULL, CAST(N'2021-05-19T19:41:06.570' AS DateTime), NULL)
INSERT [dbo].[tblTechRequest] ([TechRequestId], [Summary], [ProblemType], [Description], [MobileNo], [RaisedBy], [Status], [RequestedDate], [CompletionDate], [ResolutionProvidedBy], [ResolutionDetail], [Attachment], [AttachmentSource], [CreatedDate], [UpdatedBy], [UpdatedDate], [CreatedBy]) VALUES (5, N'This is test', 1, N'test', N'8822282', 1, 2, CAST(N'2021-05-22T19:41:06.570' AS DateTime), NULL, NULL, N'This is resolution details', NULL, NULL, CAST(N'2021-05-19T19:41:06.570' AS DateTime), NULL, CAST(N'2021-05-19T19:41:06.570' AS DateTime), NULL)
INSERT [dbo].[tblTechRequest] ([TechRequestId], [Summary], [ProblemType], [Description], [MobileNo], [RaisedBy], [Status], [RequestedDate], [CompletionDate], [ResolutionProvidedBy], [ResolutionDetail], [Attachment], [AttachmentSource], [CreatedDate], [UpdatedBy], [UpdatedDate], [CreatedBy]) VALUES (6, N'This is test', 1, N'test', N'8822282', 1, 3, CAST(N'2021-05-22T19:41:06.570' AS DateTime), NULL, NULL, N'This is resolution details', NULL, NULL, CAST(N'2021-05-19T19:41:06.570' AS DateTime), NULL, CAST(N'2021-05-19T19:41:06.570' AS DateTime), NULL)
INSERT [dbo].[tblTechRequest] ([TechRequestId], [Summary], [ProblemType], [Description], [MobileNo], [RaisedBy], [Status], [RequestedDate], [CompletionDate], [ResolutionProvidedBy], [ResolutionDetail], [Attachment], [AttachmentSource], [CreatedDate], [UpdatedBy], [UpdatedDate], [CreatedBy]) VALUES (7, N'This is test', 1, N'test', N'8822282', 1, 4, CAST(N'2021-05-22T19:41:06.570' AS DateTime), NULL, NULL, NULL, NULL, NULL, CAST(N'2021-05-19T19:41:06.570' AS DateTime), NULL, CAST(N'2021-05-19T19:41:06.570' AS DateTime), NULL)
INSERT [dbo].[tblTechRequest] ([TechRequestId], [Summary], [ProblemType], [Description], [MobileNo], [RaisedBy], [Status], [RequestedDate], [CompletionDate], [ResolutionProvidedBy], [ResolutionDetail], [Attachment], [AttachmentSource], [CreatedDate], [UpdatedBy], [UpdatedDate], [CreatedBy]) VALUES (8, N'This is test', 1, N'test', N'33221312', 1, 1, CAST(N'2021-05-22T19:41:06.570' AS DateTime), NULL, NULL, N'This is resolution details', NULL, NULL, CAST(N'2021-05-19T19:41:06.570' AS DateTime), NULL, CAST(N'2021-05-19T19:41:06.570' AS DateTime), NULL)
INSERT [dbo].[tblTechRequest] ([TechRequestId], [Summary], [ProblemType], [Description], [MobileNo], [RaisedBy], [Status], [RequestedDate], [CompletionDate], [ResolutionProvidedBy], [ResolutionDetail], [Attachment], [AttachmentSource], [CreatedDate], [UpdatedBy], [UpdatedDate], [CreatedBy]) VALUES (9, N'ABC is test', 1, N'acd', N'31343', 1, 2, CAST(N'2021-05-25T19:41:06.570' AS DateTime), NULL, NULL, N'This is resolution details', NULL, NULL, CAST(N'2021-05-25T15:35:48.730' AS DateTime), NULL, CAST(N'2021-05-25T15:35:48.730' AS DateTime), NULL)
INSERT [dbo].[tblTechRequest] ([TechRequestId], [Summary], [ProblemType], [Description], [MobileNo], [RaisedBy], [Status], [RequestedDate], [CompletionDate], [ResolutionProvidedBy], [ResolutionDetail], [Attachment], [AttachmentSource], [CreatedDate], [UpdatedBy], [UpdatedDate], [CreatedBy]) VALUES (12, N'ABC is test', 1, N'acd', N'31343', 1, 3, CAST(N'2021-05-25T19:41:06.570' AS DateTime), NULL, NULL, N'This is resolution details', NULL, NULL, CAST(N'2021-05-25T15:35:48.730' AS DateTime), NULL, CAST(N'2021-05-25T15:35:48.730' AS DateTime), NULL)
INSERT [dbo].[tblTechRequest] ([TechRequestId], [Summary], [ProblemType], [Description], [MobileNo], [RaisedBy], [Status], [RequestedDate], [CompletionDate], [ResolutionProvidedBy], [ResolutionDetail], [Attachment], [AttachmentSource], [CreatedDate], [UpdatedBy], [UpdatedDate], [CreatedBy]) VALUES (15, N'This is test', 1, N'test', N'8822282', 1, 1, CAST(N'2021-05-22T19:41:06.570' AS DateTime), NULL, NULL, NULL, NULL, NULL, CAST(N'2021-05-19T19:41:06.570' AS DateTime), NULL, CAST(N'2021-05-19T19:41:06.570' AS DateTime), NULL)
INSERT [dbo].[tblTechRequest] ([TechRequestId], [Summary], [ProblemType], [Description], [MobileNo], [RaisedBy], [Status], [RequestedDate], [CompletionDate], [ResolutionProvidedBy], [ResolutionDetail], [Attachment], [AttachmentSource], [CreatedDate], [UpdatedBy], [UpdatedDate], [CreatedBy]) VALUES (16, N'This is test', 1, N'test', N'8822282', 1, 4, CAST(N'2021-05-22T19:41:06.570' AS DateTime), NULL, NULL, N'This is resolution details', NULL, NULL, CAST(N'2021-05-19T19:41:06.570' AS DateTime), NULL, CAST(N'2021-05-19T19:41:06.570' AS DateTime), NULL)
INSERT [dbo].[tblTechRequest] ([TechRequestId], [Summary], [ProblemType], [Description], [MobileNo], [RaisedBy], [Status], [RequestedDate], [CompletionDate], [ResolutionProvidedBy], [ResolutionDetail], [Attachment], [AttachmentSource], [CreatedDate], [UpdatedBy], [UpdatedDate], [CreatedBy]) VALUES (17, N'This is test', 1, N'test', N'8822282', 1, 3, CAST(N'2021-05-22T19:41:06.570' AS DateTime), NULL, NULL, N'This is resolution details', NULL, NULL, CAST(N'2021-05-19T19:41:06.570' AS DateTime), NULL, CAST(N'2021-05-19T19:41:06.570' AS DateTime), NULL)
INSERT [dbo].[tblTechRequest] ([TechRequestId], [Summary], [ProblemType], [Description], [MobileNo], [RaisedBy], [Status], [RequestedDate], [CompletionDate], [ResolutionProvidedBy], [ResolutionDetail], [Attachment], [AttachmentSource], [CreatedDate], [UpdatedBy], [UpdatedDate], [CreatedBy]) VALUES (18, N'This is test', 1, N'test', N'33221312', 1, 2, CAST(N'2021-05-22T19:41:06.570' AS DateTime), NULL, NULL, N'This is resolution details', NULL, NULL, CAST(N'2021-05-19T19:41:06.570' AS DateTime), NULL, CAST(N'2021-05-19T19:41:06.570' AS DateTime), NULL)
INSERT [dbo].[tblTechRequest] ([TechRequestId], [Summary], [ProblemType], [Description], [MobileNo], [RaisedBy], [Status], [RequestedDate], [CompletionDate], [ResolutionProvidedBy], [ResolutionDetail], [Attachment], [AttachmentSource], [CreatedDate], [UpdatedBy], [UpdatedDate], [CreatedBy]) VALUES (19, N'ABC is test', 1, N'acd', N'31343', 1, 2, CAST(N'2021-05-25T19:41:06.570' AS DateTime), NULL, NULL, N'This is resolution details', NULL, NULL, CAST(N'2021-05-25T15:35:48.730' AS DateTime), NULL, CAST(N'2021-05-25T15:35:48.730' AS DateTime), NULL)
INSERT [dbo].[tblTechRequest] ([TechRequestId], [Summary], [ProblemType], [Description], [MobileNo], [RaisedBy], [Status], [RequestedDate], [CompletionDate], [ResolutionProvidedBy], [ResolutionDetail], [Attachment], [AttachmentSource], [CreatedDate], [UpdatedBy], [UpdatedDate], [CreatedBy]) VALUES (20, N'ABC is test', 1, N'acd', N'31343', 1, 1, CAST(N'2021-05-25T19:41:06.570' AS DateTime), NULL, NULL, N'This is resolution details', NULL, NULL, CAST(N'2021-05-25T15:35:48.730' AS DateTime), NULL, CAST(N'2021-05-25T15:35:48.730' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[tblTechRequest] OFF
GO
SET IDENTITY_INSERT [dbo].[tblUploader] ON 

INSERT [dbo].[tblUploader] ([UploaderId], [ReportType], [Month], [Year], [FileName], [FileSource], [ApplyTDS], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [InActive], [StatusID]) VALUES (1, 1, 7, 2021, N'EGRAMIN TRANSCATION WISE COMISSION MAY-2021.xlsx', NULL, CAST(3.7500 AS Decimal(18, 4)), CAST(N'2021-07-09T21:29:47.490' AS DateTime), NULL, CAST(N'2021-07-09T21:29:47.487' AS DateTime), NULL, 0, 4)
INSERT [dbo].[tblUploader] ([UploaderId], [ReportType], [Month], [Year], [FileName], [FileSource], [ApplyTDS], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [InActive], [StatusID]) VALUES (2, 1, 7, 2020, N'EGRAMIN TRANSCATION WISE COMISSION MAY-2021.xlsx', NULL, CAST(3.7500 AS Decimal(18, 4)), CAST(N'2021-07-09T22:02:05.373' AS DateTime), NULL, CAST(N'2021-07-09T22:02:05.373' AS DateTime), NULL, 0, 4)
SET IDENTITY_INSERT [dbo].[tblUploader] OFF
GO
SET IDENTITY_INSERT [dbo].[tblUserCSPDetail] ON 

INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, N'NUNGSHIMOA JAMIR', N'3C440010', N'6510', CAST(N'0001-01-01' AS Date), NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 25, 545, N'LONGKONG', N'Rural-Tier6a', N'ANLPJ7195F', NULL, NULL, NULL, NULL, NULL, NULL, N'1-1.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-07-09T22:34:15.220' AS DateTime), 4)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (2, N'TEMSUYANGER LONGKUMER', N'3C440011', N'6510', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 25, 758, N'LONGSA', N'Rural-Tier6a', N'AHJPL5307R', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (3, N'CHINGPAI B PHOM', N'3C440012', N'5838', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 25, 757, N'TAMLU(SSA)', N'Rural-Tier6b', N'CYMPP6494F', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (4, N'AULONG PHOM', N'3C440013', N'5838', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 25, 757, N'YACHEM', N'Rural-Tier5', N'CIYPP2973D', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (5, N'TONGPENG MONGLA', N'3C440015', N'5838', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 25, 545, N'ARTANG WARD /PINLE WARD', N'Semi Urban-Tier4', N'BDRPJ1304B', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (6, N'ANJU ARA BEGUM', N'3C440016', N'17221', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 121, N'SANTIPUKHURI', N'Rural-Tier6a', N'CLVPB0321B', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (7, N'PROGESH MILI', N'3C440017', N'145', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 134, N'CHANDMARI', N'Semi Urban-Tier4', N'CPCPM5378E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (8, N'BITOPAN DEKA', N'3C440018', N'7118', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 143, N'WARD NO 3 TANGLA', N'Rural-Tier5', N'ASTPD9298E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (9, N'SARADA DEVI', N'3C440019', N'12972', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 141, N'KHATOWAL GAON', N'Rural-Tier5', N'CDQPD6296J', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (10, N'DEBAJIT DEKA', N'3C440020', N'12977', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 121, N'CHOTO ATHIABARI', N'Rural-Tier5', N'BSVPD0949M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (11, N'CHINMOYEE DEVI', N'3C440021', N'130', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 121, N'RAMHARI', N'Rural-Tier5', N'COMPD1114G', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (12, N'DIPEN DUARAH', N'3C440022', N'5821', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 3, 109, N'CHETA I', N'Rural-Tier6a', N'BZQPD0060D', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (13, N'KAMAL RABHA', N'3C440023', N'7118', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 143, N'WARD NO 4.TANGLA', N'Semi Urban-Tier2', N'AVIPR5563J', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (14, N'SAHABUDDIN AHMED', N'3C440026', N'17221', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 121, N'NO 1 SUKTAGURI', N'Rural-Tier5', N'AUSPA3070C', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (15, N'SALAMUDDIN AHMED', N'3C440027', N'17221', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 121, N'DHALPUR PT III', N'Rural-Tier5', N'AWPPA5142G', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (16, N'JIARUL HOQUE', N'3C440028', N'12977', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 121, N'BANDIA CHAPARI', N'Rural-Tier5', N'AGNPH1876N', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (17, N'MRIDUL BARCHUNG', N'3C440029', N'13378', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 143, N'KHOIRABARI', N'Rural-Tier5', N'BSOPB2734D', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (18, N'NABAJYOTI BORO', N'3C440030', N'13378', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 143, N'NO 3 SUKLAIKHUTI', N'Rural-Tier5', N'ATKPB9182D', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (19, N'RAMESH ADHIKARI', N'3C440031', N'2065', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 136, N'ITAKHOLA', N'Rural-Tier5', N'BPOPA1787E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (20, N'TIMAK DEKA', N'3C440032', N'130', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 121, N'WARD NO 4 MANGALDOI', N'Semi Urban-Tier3', N'GJKPS3612H', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (21, N'DWIPEN BARMAN', N'3C440037', N'16940', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 763, N'KASHIKOTRA NO I', N'Rural-Tier5', N'BFLPB1929Q', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (22, N'NIJANUR RAHMAN', N'3C440041', N'12977', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 121, N'BAGHPORI CHAPORI', N'Rural-Tier5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (23, N'NEIKETO THEYO', N'3C440043', N'214', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 25, 544, N'RUSOMA', N'Semi Urban-Tier4', N'ALFPT5556Q', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (24, N'NIDHAN HAZONG', N'3C440046', N'15198', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 3, 102, N'RAJANAGAR,DIYUN', N'Rural-Tier5', N'ADSPH4996B', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (25, N'NGAYIR KATO', N'3C440047', N'1677', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 3, 117, N'DARKA', N'Rural-Tier5', N'DEFPK6640C', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (26, N'MITHU RABHA', N'3C440050', N'9970', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 23, 533, N'BAMUNDANGA', N'Rural-Tier5', N'CFYPR4740B', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (27, N'JEETEN BORO', N'3C440052', N'7431', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 143, N'BONGALIGAON', N'Rural-Tier5', N'AZFPB8224P', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (28, N'JAYANTA BISWAS', N'3C440053', N'13254', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 136, N'HOJAI WARD NO 1', N'Urban-Tier1c', N'ASAPB8430F', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (29, N'LAKSHMON SHILL', N'3C440054', N'2048', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 126, N'NO 1 JORAGURI', N'Rural-Tier5', N'BZGPS5482L', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (30, N'BIJOY PANKAJ SARMAH', N'3C440055', N'2048', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 126, N'MISSAMORA BAGICHA', N'Rural-Tier5', N'AWCPS4947E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (31, N'GAUTAM PHUKAN', N'3C440056', N'7431', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 143, N'KOUPATI BAGICHA', N'Rural-Tier5', N'BBSPP7993K', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (32, N'M WONCHIO ODYUO', N'3C440057', N'3613', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 25, 549, N'RIPHYIM NEW', N'Rural-Tier5', N'AAWPO0125G', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (33, N'JAHNABI DEVI', N'3C440058', N'15338', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 3, 773, N'BANDERDEWA PTC', N'Rural-Tier5', N'AQMPD2398A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (34, N'SUBIR MALLICK', N'3C440059', N'5821', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 3, 109, N'EZENGO', N'Rural-Tier5', N'BKQPM8593P', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (35, N'PRANITA DAS', N'3C440060', N'10413', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 760, N'BANGALIPARA', N'Rural-Tier5', N'CAXPD5298Q', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (36, N'RIDIP DEKA', N'3C440061', N'10413', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 760, N'DEUCHUNGA', N'Rural-Tier5', N'BDWPR9544L', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (37, N'JYOSHNA PAO', N'3C440062', N'11624', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 142, N'CHAPAKHOWA TOWN SANTIPUR WARD NO 4', N'Rural-Tier5', N'ATBPN1652P', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (38, N'NRIPEN SARKAR', N'3C440063', N'5081', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 129, N'GARMUR SATRA', N'Rural-Tier6a', N'EOEPS8755G', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (39, N'TEMSUWAPANG', N'3C440065', N'1193', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 25, 545, N'ALICHEN', N'Rural-Tier6a', N'ALOPT4783A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (40, N'ANSUMI SWARGIARY', N'3C440068', N'7947', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 143, N'UDALGURI WARD NO 5', N'Rural-Tier5', N'GLUPS4310G', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (41, N'ABHIMUNYA RABHA', N'3C440071', N'6906', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 23, 527, N'LOWER MANIKGANJ', N'Semi Urban-Tier4', N'ATPPR2999P', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (42, N'NIRMAL BHADRA', N'3C440075', N'6009', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 3, 772, N'ALUBARI', N'Semi Urban-Tier4', N'AWOPB0091L', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (43, N'RITU NAYAK', N'3C440079', N'10307', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 126, N'BONGAON', N'Semi Urban-Tier4', N'AVWPN6118K', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (44, N'SAILENDRA KUMAR NATH', N'3C440080', N'17221', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 121, N'BISHNUPUR', N'Rural-Tier5', N'AKPPN1537J', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (45, N'MOHAN REDDY', N'3C440081', N'9864', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 126, N'LETEKUJAN GRANT', N'Rural-Tier5', N'BXDPR0546M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (46, N'BRINAN BORO', N'3C440082', N'17203', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 760, N'KAMARDAICHA', N'Rural-Tier5', N'BQYPB3318P', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (47, N'JAKIR HUSSAIN', N'3C440083', N'3378', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 143, N'ROWTA BAGAN', N'Rural-Tier5', N'BXDPR0546M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (48, N'MD JAMAL UDDIN', N'3C440085', N'12973', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 141, N'GUDAMGHAT MIRI', N'Semi Urban-Tier4', N'AEBPU7715D', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (49, N'BISWAJIT GHOSH', N'3C440087', N'11615', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 125, N'DHUPDHARA PT 3', N'Semi Urban-Tier4', N'BTFPG9347D', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (50, N'THOUNAOJAM HEROJIT SINGH', N'3C440088', N'18546', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 22, 774, N'SAGOLBAND', N'Semi Urban-Tier4', N'BDQPM6071D', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (51, N'JUGANANDA BHUYAN', N'3C440089', N'1426', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 122, N'SHAMARJAN', N'Rural-Tier5', N'BMDPB8986J', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (52, N'AMZAD MAZUMDAR', N'3C440090', N'3378', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 143, N'BHALUKMARI', N'Rural-Tier5', N'CDNPM1561Q', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (53, N'MRIDUL ISWARY', N'3C440092', N'119', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 133, N'SIZUGURI', N'Rural-Tier5', N'ABFPI3190P', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (54, N'PRADUNNA DOLEY', N'3C440093', N'16934', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 122, N'PURANA PARGHAT', N'Rural-Tier5', N'CGJPD7302M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (55, N'PUJA DAS', N'3C440094', N'11616', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 767, N'BARUABARI,SONAPUR', N'Rural-Tier5', N'BKUPD5120M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (56, N'VEVOYI RINGA', N'3C440098', N'6008', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 25, 547, N'CHESEZU NASA(SSA)', N'Rural-Tier5', N'CHSPR0501C', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (57, N'BAHAR UDDIN LASKAR', N'3C440099', N'13250', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 128, N'LALA WARD NO-10', N'Urban-Tier1c', N'ANAPL3432C', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (58, N'RANJIT BHATTACHARJEE', N'3C440100', N'7648', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 132, N'WARD NO 2 BADARPUR', N'Urban-Tier1c', N'AJIPB0194R', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (59, N'NAMIT MANDAL', N'3C440102', N'17660', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 141, N'BORAJULI NEPALI', N'Rural-Tier5', N'CCGPM5289M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (60, N'SOJESH LONGMAILAI', N'3C440105', N'247', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 764, N'GUNJUNG', N'Rural-Tier6a', N'AGKPL8295J', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (61, N'LIANMINTHANG KHONGSAI', N'3C440106', N'15027', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 22, 520, N'TUIBUNG,KHOPIVENG', N'Rural-Tier5', N'ELTPK2824N', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (62, N'SHAMNUN SHAH', N'3C440113', N'8267', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 123, N'MANULLAPARA', N'Rural-Tier5', N'CGUPS8727E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (63, N'AMINUL ISLAM SIKDAR', N'3C440114', N'7389', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 130, N'NAGARBERA', N'Semi Urban-Tier4', N'DAGPS8414F', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (64, N'KRISHNA BORPATRA GOHAIN', N'3C440115', N'1426', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 122, N'BUTIKUR', N'Semi Urban-Tier4', N'BQEPG0765K', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (65, N'ANIL BURMAN', N'3C440116', N'13311', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 3, 108, N'2 MILE', N'Semi Urban-Tier4', N'ARMPB6418L', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (66, N'RAJIV KR BORAH', N'3C440117', N'13292', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 767, N'WARD 31.GUWAHATI BAGHARBORI', N'Semi Urban-Tier4', N'AKJPB5165A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (67, N'PRANJIT DUTTA', N'3C440118', N'17208', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 134, N'PANBARI', N'Semi Urban-Tier4', N'BBCPD9525K', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (68, N'DEBASIS DEKA', N'3C440120', N'10307', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 765, N'KAMARGAON', N'Semi Urban-Tier4', N'CACPD0927R', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (69, N'SARAT BARUAH', N'3C440121', N'9864', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 126, N'THURAJAN GRANT', N'Semi Urban-Tier4', N'BUDPB4129H', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (70, N'GWMJWR BORO', N'3C440122', N'5243', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 760, N'DALBARI', N'Semi Urban-Tier4', N'CNKPB1656C', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (71, N'CHOSATO DAWHUO', N'3C440126', N'6008', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 25, 547, N'THENYIZUMI', N'Rural-Tier6a', N'EWRPD8431D', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (72, N'LANUCHUBA', N'3C440129', N'3598', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 25, 543, N'AOYIMKUM', N'Semi Urban-Tier4', N'AIBPL9513G', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (73, N'SAMSUL HAQUE', N'3C440130', N'2049', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 141, N'PALASH BASTI NO 2', N'Semi Urban-Tier4', N'AHAPH7030E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (74, N'RAHUL PAUL', N'3C440131', N'7431', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 121, N'NO 1 BARJHAR', N'Semi Urban-Tier4', N'CRDPP5324G', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (75, N'JITU SARMAH', N'3C440132', N'17217', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 143, N'DALAIPARA', N'Semi Urban-Tier4', N'FQMPS7210F', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (76, N'SHIBA DAS', N'3C440133', N'5787', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 142, N'WARD NO 4 MARGHERITA', N'Rural-Tier6a', N'CEEPD0812B', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (77, N'DIPALI BORGOHAIN', N'3C440134', N'5787', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 142, N'BARGALAI II(CT)', N'Rural-Tier6a', N'BSJPB2791P', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (78, N'SAIFUL ISLAM', N'3C440135', N'14256', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 125, N'BANGALJHAR', N'Rural-Tier6a', N'ABIPI9467N', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (79, N'SHORIFUL ISLAM', N'3C440136', N'14256', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 125, N'GHUGUDOBA', N'Rural-Tier6a', N'ADLPI1122M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (80, N'FIRDUS RAHMAN MAZUMDER', N'3C440137', N'8407', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 128, N'BASDHAR II,I', N'Rural-Tier6a', N'CGRPM1484K', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (81, N'Y.TEZKUMAR SINGH', N'3C440138', N'18390', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 22, 522, NULL, N'Semi Urban-Tier3', N'BFPPS0071C', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (82, N'JIARUL AHMED', N'3C440139', N'11615', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 125, N'KATHALBARI', N'Semi Urban-Tier4', N'CQGPM2477P', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (83, N'MAHIBUL ISLAM', N'3C440140', N'12260', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 125, N'KARIPARA PT-II', N'Rural-Tier6a', N'ABLPI7575E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (84, N'SHAHA ALOM AHMED', N'3C440141', N'5049', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 143, N'SIMALUGURI', N'Semi Urban-Tier4', N'ATYPA4355K', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (85, N'PRATIMA BRAHMA', N'3C440142', N'7947', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 143, N'GOLANDI HABI', N'Semi Urban-Tier4', N'CCSPB6191F', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (86, N'SAMSWRANG NARZARY', N'3C440144', N'13255', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 133, N'KASHIABARI BAZAR', N'Semi Urban-Tier4', N'ATEPN4525C', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (87, N'BHRIGU KUMAR DAS', N'3C440145', N'9433', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 143, N'NALBARI BAZAR', N'Semi Urban-Tier4', N'BLDPD7383N', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (88, N'PRAKASH CH BARMAN', N'3C440146', N'14256', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 125, N'RAKHALKILLA', N'Rural-Tier6a', N'ASEPB5051G', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (89, N'ABUL KALAM AZAD', N'3C440147', N'7431', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 121, N'KOUPATI GAON', N'Rural-Tier5', N'AQDPA6674M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (90, N'KHETRAMOHAN SINGHA', N'3C440148', N'9409', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 126, N'CHATIONA PATHAR', N'Rural-Tier6a', N'CGWPS3628E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (91, N'IFTIKAR HUSSAIN', N'3C440149', N'2103', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 136, N'SALMARA', N'Rural-Tier6a', N'AKHPH4813R', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (92, N'SADHAN CHAKRABORTY', N'3C440150', N'7217', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 120, N'CHANDIGHAT,MADHURA BAZAR', N'Rural-Tier6a', N'ARVPC8905G', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (93, N'MONSUR AHMED BARBHUIYA', N'3C440152', N'5541', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 120, N'NISCHINTAPUR', N'Rural-Tier6a', N'BNQPB1006B', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (94, N'KAMAL HUSSAIN BARBHUIYA', N'3C440153', N'14261', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 120, N'SEWTI PT III', N'Rural-Tier6a', N'BCDPB5348E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (95, N'HEMENDRA DEY', N'3C440154', N'5541', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 120, N'DIGOR SRIKONA PT II', N'Rural-Tier6a', N'CNRPD5700N', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (96, N'JUNAID AHMED LASKAR', N'3C440155', N'5541', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 120, N'MASUGHAT', N'Rural-Tier6a', N'ANSPL1343C', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (97, N'AKADDAS ALI LASKAR', N'3C440156', N'5541', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 120, N'SUNAPUR PT I,II,III', N'Rural-Tier6a', N'APJPL3429E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (98, N'SAKIL AHMED LASKAR', N'3C440158', N'17222', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 120, N'DAKSHIN MOHANPUR PT VI', N'Rural-Tier6a', N'ALQPL7179J', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (99, N'JUNAYED AHMED LASKAR', N'3C440160', N'17401', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 120, N'GOBINDAPUR PT III', N'Rural-Tier6a', N'AMAPL6529M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (100, N'HAMIDUR RAHMAN LASKAR', N'3C440161', N'17222', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 120, N'RANGIRGHAT PT III', N'Rural-Tier6a', N'AEDPL0181J', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (101, N'MEHFUZ AHMED LASKAR', N'3C440162', N'5541', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 120, N'UJANGRAM', N'Rural-Tier6a', N'AMPPL3271P', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (102, N'KAJAL HUSSAIN BARBHUIYA', N'3C440163', N'14261', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 120, N'DUDPUR III', N'Rural-Tier6a', N'BGHPB1260P', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (103, N'AKTHER ZABED LASKAR', N'3C440165', N'17222', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 120, N'DHANIPUR', N'Rural-Tier6a', N'AEYPL3165P', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (104, N'ANSWER AHMED BARBHUIYA', N'3C440169', N'17401', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 120, N'BANSKANDI I,II,III,IV', N'Rural-Tier6a', N'BBAPB2179P', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (105, N'NASIM AHMED BARBHUYAN', N'3C440170', N'7648', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 132, N'BADARPUR WARD NO I', N'Rural-Tier6a', N'AWKPB1881A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (106, N'AYAN DAS', N'3C440171', N'13251', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 132, N'NAGENDRA NAGAR, GOBINDA GANJ BAZAR', N'Rural-Tier6a', N'AQRPD4928K', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (107, N'IMDADUL ISLAM BARBHUIYA', N'3C440172', N'87', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 128, N'NARAINPUR Pt-I', N'Rural-Tier6a', N'BUDPB0574L', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (108, N'MANJURUL AMIN', N'3C440175', N'14261', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 120, N'BURUNGA PT II,JALAGRAM', N'Rural-Tier6a', N'ASEPA1584H', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (109, N'SANJU ROY', N'3C440177', N'5541', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 120, N'DHOLACHERRA GRANT', N'Rural-Tier6a', N'BLIPR9225C', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (110, N'SHILA GOSWAMI', N'3C440178', N'14261', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 120, N'BEHARA PT II', N'Rural-Tier6a', N'BOPPG9743E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (111, N'NIRMAL BORO', N'3C440180', N'7118', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 143, N'RATANPUR', N'Semi Urban-Tier3', N'BGXPB7686M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (112, N'GIRIN CH SINGHA', N'3C440182', N'7431', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 121, N'BARJHAR', N'Rural-Tier6b', N'GKSPS3234Q', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (113, N'SURAJIT DEKA', N'3C440183', N'17221', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 121, N'MAHTALI', N'Semi Urban-Tier3', N'CBNPD2211E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (114, N'MD SANOWAR ALI KHAN', N'3C440184', N'13090', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 133, N'PANI JANI PT I', N'Semi Urban-Tier4', N'CVUPK2837E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (115, N'SUBHON CHANDRA PAYENG', N'3C440187', N'2048', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 126, N'RANGAGARA GHAT', N'Rural-Tier6a', N'CSYPP8427J', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (116, N'DHANJIT DEKA', N'3C440189', N'11611', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 118, N'BARSOLA BILORPATHAR (NEWLARBHITHA )', N'Rural-Tier6b', N'COHPD7007P', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (117, N'GITIKA PATOWARI', N'3C440190', N'11611', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 118, N'BAMUN PAKA (SARTHEBARI)', N'Rural-Tier6b', N'CZYPP5541G', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (118, N'QUAMRUL HOQUE CHOUDHURY', N'3C440193', N'109', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 132, N'JABDA', N'Semi Urban-Tier4', N'ALBPC8421H', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (119, N'JOYDEEP TANTI', N'3C440197', N'13257', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 762, N'BHUYANKHAT', N'Semi Urban-Tier4', N'AVNPT2873J', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (120, N'SANJOY KR HAZARIKA', N'3C440198', N'7648', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 132, N'ANGLAR BAZAR,BARGOOL', N'Semi Urban-Tier4', N'ACZPH7315L', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (121, N'ABUL FAZAL AHMED', N'3C440199', N'8506', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 122, N'DIGHALIGAON', N'Rural-Tier6b', N'BUAPA5525P', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (122, N'DIPANJAN SHARMA', N'3C440202', N'7648', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 132, N'UMARPUR PT I', N'Semi Urban-Tier4', N'FFDPS3269N', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (123, N'IMRAN ALI', N'3C440203', N'5400', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 133, N'BANDARCHARA', N'Semi Urban-Tier4', N'BQLPA7887H', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (124, N'MUZAKKIR HUSSAIN LASKAR', N'3C440204', N'17401', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 120, N'RONGPUR PT I', N'Semi Urban-Tier4', N'AHLPL5461G', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (125, N'RUHUL AMIN', N'3C440205', N'SBIN0007373', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 123, N'PATAKATA PT II', N'Rural-Tier6b', N'ARBPA3663R', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (126, N'KUMUD MEDHI', N'3C440206', N'11615', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 125, N'TIPALI PT I', N'Rural-Tier5', N'AWGPM8791G', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (127, N'TAFAJUL ISLAM', N'3C440207', N'7412', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 134, N'NOI BORCHOLA', N'Semi Urban-Tier4', N'AFZPI8817B', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (128, N'NARGIS SULTANA', N'3C440208', N'5462', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 136, N'BHUYANPATTI', N'Semi Urban-Tier4', N'NOMPS5837G', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (129, N'HEMANTO SINGHA', N'3C440209', N'4873', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 131, N'BITHUNG RF', N'Semi Urban-Tier4', N'CKHPS8336J', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (130, N'AZAD UDDIN CHOUDHURY', N'3C440210', N'14261', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 120, N'SAIDPUR II', N'Semi Urban-Tier4', N'APJPC7042L', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (131, N'NAJRUL HOQUE', N'3C440211', N'13090', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 123, N'SAPATGRAM WARD NO 1', N'Semi Urban-Tier4', N'ADLPH9942A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (132, N'NADIM JAVED', N'3C440212', N'2077', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 121, N'KHETASWAR', N'Semi Urban-Tier4', N'AVNPJ9727H', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (133, N'ESHA HOQUE ALI', N'3C440213', N'SBIN0014253', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 125, N'HASHDOBA', N'Rural-Tier6a', N'AGPPA9175P', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (134, N'AKIDUL ALI', N'3C440214', N'1684', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 119, N'KAIMARI LOHRA PAR', N'Rural-Tier6c', N'BDVPA9842F', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (135, N'JOHIRUL ISLAM', N'3C440215', N'14256', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 125, N'FARINGA PARA', N'Rural-Tier6a', N'ACYPI7995N', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (136, N'A DEBANANDA SINGHA', N'3C440219', N'17401', CAST(N'2021-07-30' AS Date), NULL, NULL, NULL, N'No', 2, NULL, NULL, 1, 4, 120, N'NIZ BANSKANDI PT III', N'Rural-Tier6a', N'CVJPS2964K', NULL, NULL, NULL, NULL, NULL, NULL, N'136-1.png', N'136-2.png', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-07-14T21:13:53.440' AS DateTime), 1)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (137, N'BHIMLAL SARMAH', N'3C440220', N'17660', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 141, N'GADHARIA PATHAR', N'Semi Urban-Tier4', N'BAJPS6895P', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (138, N'JASHIM UDDIN', N'3C440221', N'13251', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 132, N'LAKSHIPUR', N'Rural-Tier5', N'ACTPU3519K', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (139, N'SHOHIDUL ISLAM', N'3C440225', N'82', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 125, N'BATABARI', N'Rural-Tier5', N'ABQPI7053Q', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (140, N'INAMUL HOQUE SHIKDAR', N'3C440226', N'82', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 125, N'MARKULA', N'Rural-Tier6a', N'CCIPS4967E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (141, N'NUR ISLAM KHAN', N'3C440227', N'82', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 125, N'KHARMUZA', N'Rural-Tier6b', N'ENGPK2600K', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (142, N'ABDUL HALIM', N'3C440228', N'82', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 125, N'RAKHYANINI', N'Semi Urban-Tier4', N'AIYPH4595F', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (143, N'P LAMTHAI', N'3C440229', N'1328', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 25, 548, N'PATHASO(SSA)', N'Metro-Tier1b', N'AJEPL3391E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (144, N'ELASHI DEORI', N'3C440230', N'15198', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 3, 102, N'MUDOI.MANABHUMI HQ', N'Rural-Tier6b', N'BUAPD6547C', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (145, N'KAILASH RABHA', N'3C440231', N'12260', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 125, N'BARDAMAL', N'Rural-Tier6a', N'AYRPR1083M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (146, N'V BOKASHE AYE', N'3C440233', N'15289', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 25, 543, N'KUHUBOTO', N'Semi Urban-Tier4', N'BBLPA7627N', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (147, N'J ABENTHUNG KIKON', N'3C440235', N'7444', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 25, 549, N'HAYIAN, BHANDARI', N'Semi Urban-Tier4', N'CTXPK1261M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (148, N'SANDEEP DEY', N'3C440238', N'11796', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 124, N'CHABUA WARD NO 4', N'Semi Urban-Tier4', N'AVVPD2624F', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (149, N'BISHNU BAHADUR NEWAR', N'3C440239', N'11796', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 124, N'BALIJAN T.E.', N'Semi Urban-Tier4', N'AMJPN1237D', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (150, N'MAHABOBUR RAHMAN', N'3C440240', N'9148', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 125, N'MOIJONGA', N'Rural-Tier5', N'ALRPR8967P', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (151, N'ROFIQUL ISLAM', N'3C440241', N'82', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 125, N'HELAPAKHRI', N'Rural-Tier5', N'AFBPI4815B', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (152, N'JIAUL ISLAM', N'3C440242', N'82', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 125, N'BHATIPARA', N'Semi Urban-Tier4', N'ADDPI9160R', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (153, N'MONOWAR HUSSAIN', N'3C440244', N'8286', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 123, N'CHAGOLCHARA PT I', N'Rural-Tier5', N'AGJPH8758B', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (154, N'YONKONG LAMBA', N'3C440245', N'1328', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 25, 548, N'CHINGMEI(SSA)', N'Rural-Tier6a', N'AMJPL2182K', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (155, N'BECHARAM DAS', N'3C440246', N'9144', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 136, N'AMPUKHURI', N'Semi Urban-Tier4', N'AXRPD7568C', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (156, N'ASMA BEGUM', N'3C440247', N'12973', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 141, N'KHONAMUKH', N'Rural-Tier6b', N'CGAPB6851Q', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (157, N'ANOWARA KHATUN', N'3C440248', N'14256', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 125, N'BOROUDMARI', N'Rural-Tier6b', N'EOMPK9759E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (158, N'MOYNUL HOQUE', N'3C440249', N'9148', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 125, N'MONAKOSHA', N'Semi Urban-Tier4', N'AJGPH2586R', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (159, N'DHAN GOGOI', N'3C440251', N'2604', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 122, N'LALUNG GAON', N'Semi Urban-Tier4', N'AVJPG1508K', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (160, N'NAMITA CHETIA', N'3C440252', N'1426', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 122, N'WARD NO 3 DHEMAJI', N'Semi Urban-Tier4', N'BQRPC3848L', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (161, N'DHRUBAJYOTI SHARMA', N'3C440255', N'9196', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 132, N'BALESWAR, KALIGANJ BAZAR', N'Semi Urban-Tier4', N'GJNPS6399G', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (162, N'RAMEN DEKA', N'3C440256', N'17217', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 121, N'BALIPOTA', N'Rural-Tier5', N'AKWPD3788J', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (163, N'DIPAL BORAH', N'3C440258', N'17660', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 141, N'SERELIA', N'Rural-Tier6a', N'FKKPB8095R', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (164, N'ABUL AHAB', N'3C440259', N'2013', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 118, N'KATAJHARGAON', N'Rural-Tier6b', N'BRIPA2470A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (165, N'MEGHRAJ BASUMATARY', N'3C440260', N'3372', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 143, N'NO-2 NAHARBARI', N'Rural-Tier5', N'CCSPB3509F', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (166, N'ANJU AKTAR', N'3C440261', N'69', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 123, N'PUTHIA', N'Rural-Tier6a', N'BTZPA3816P', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (167, N'GOLAP BARMAN', N'3C440262', N'9864', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 126, N'NO 2 PANKAGRANT', N'Rural-Tier5', N'CDPPB2358L', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (168, N'RAHI MASUM FARUQ', N'3C440265', N'16935', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 125, N'SALPARA MULANDUBI  PT(I)', N'Rural-Tier5', N'ABUPF6486G', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (169, N'THOUNAOJAM JITEN SINGH', N'3C440267', N'10757', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 22, 525, N'WABAGAI', N'Semi Urban-Tier4', N'FDVPS2792N', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (170, N'AKHRUZZAMAN MOLLAH', N'3C440268', N'8267', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 123, N'NIZ MONIRCHAR', N'Rural-Tier6a', N'BUDPM3728B', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (171, N'RUKMAL SAHARIA', N'3C440269', N'17221', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 121, N'KABEICHUBA', N'Rural-Tier5', N'CMLPS7035Q', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (172, N'RAFIQUL ISLAM', N'3C440270', N'SBIN0008286', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 123, N'DURAHATI', N'Rural-Tier6b', N'ACKPI3778D', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (173, N'LAKSHI RAM DEKA', N'3C440271', N'7118', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 143, N'PURANDIA', N'Semi Urban-Tier4', N'BBQPD6454F', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (174, N'KALIPRASHAD SAHANI', N'3C440272', N'2049', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 141, N'RAKSHASMARI', N'Rural-Tier5', N'DESPS1643A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (175, N'SAIFUL ALI', N'3C440273', N'5092', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 137, N'CHAMARKUCHI', N'Semi Urban-Tier4', N'BAMPA9579B', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (176, N'ARIF HUSSAIN MIAH', N'3C440274', N'8267', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 769, N'KUKURMARA', N'Rural-Tier6a', N'CUMPM5429D', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (177, N'SHIKHAMONI KONWAR', N'3C440277', N'6891', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 134, N'KB ROAD', N'Urban-Tier1c', N'EPSPK7488M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (178, N'RUPALI BORAH', N'3C440278', N'SBIN0009140', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 141, N'BALIJAN', N'Semi Urban-Tier4', N'CKFPB8692A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (179, N'JOYSHREE BORUAH', N'3C440279', N'17659', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 134, N'LACHIT NAGAR', N'Semi Urban-Tier4', N'CVRPB4500L', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (180, N'NAZRUL HOQUE', N'3C440280', N'14258', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 119, N'BECHIMARI', N'Rural-Tier5', N'AEEPH3401G', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (181, N'RINKU BARUAH', N'3C440282', N'7648', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 132, N'TIKARPARA', N'Semi Urban-Tier4', N'BJMPB8321F', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (182, N'MOHI UDDIN MAZUMDER', N'3C440283', N'87', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 128, N'HAILAKANDI WARD NO 12', N'Semi Urban-Tier3', N'EPDPM0587Q', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (183, N'JAHURUL HOQUE', N'3C440284', N'SBIN0013251', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 132, N'RANGAMATI FV', N'Rural-Tier6b', N'APFPH2577H', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (184, N'SADIQUL ALAM LASKAR', N'3C440286', N'87', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 128, N'RATANPUR PT II', N'Rural-Tier5', N'AGRPL5927G', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (185, N'PHUKAN CH HUJURI', N'3C440287', N'5092', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 137, N'BARGACHA', N'Rural-Tier5', N'AARPH1816J', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (186, N'SHARJAN HUSSAIN MAZUMDER', N'3C440288', N'SBIN0017218', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 128, N'JAMIRA PT IV', N'Rural-Tier5', N'BSPPM3465B', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (187, N'SONJIB BORO', N'3C440289', N'13378', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 143, N'BORENGAJULI T.E.', N'Rural-Tier5', N'ALUPB1810G', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (188, N'SOHRAI MAHALI', N'3C440291', N'7118', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 143, N'BHUTIACHANG T.E.', N'Rural-Tier5', N'CIHPM4026M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (189, N'GITU CH BORO', N'3C440292', N'7118', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 143, N'BHUTIACHANG T.E.', N'Rural-Tier5', N'ATDPB3555F', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (190, N'DIPENDRA BAISHYA ', N'3C440293', N'13378', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 143, N'DIMAKUCHI T.E.', N'Rural-Tier5', N'BNGPB1080B', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (191, N'DEEPSON KULDEEP', N'3C440294', N'7118', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 143, N'ATHERIKHAT T.E.', N'Rural-Tier5', N'ETXPK9808J', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (192, N'TIKEN JYOTI SAIKIA', N'3C440295', N'130', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 121, N'SAIKIAPARA', N'Rural-Tier5', N'KTIPS03421', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (193, N'LAKHYA JYOTI NATH', N'3C440296', N'130', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 121, N'NIZ MANGALBEECHA', N'Rural-Tier6b', N'AOUPN0795D', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (194, N'HIRAK JYOTI BORAH', N'3C440298', N'7118', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 143, N'ATHERIKHAT T.E', N'Rural-Tier5', N'BZIPB7601Q', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (195, N'DURGA CHOUDHURI', N'3C440300', N'7118', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 143, N'PANERI T.E.', N'Semi Urban-Tier4', N'BTWPC0341L', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (196, N'MANISHA SWANSI', N'3C440302', N'7947', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 143, N'CORRAMORE T.E.', N'Semi Urban-Tier4', N'HGDPS2445M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (197, N'JUWEL KHAKHA', N'3C440303', N'7947', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 143, N'CORRAMORE T.E. KHERKHERI GRANT', N'Rural-Tier5', N'BOOPK7272K', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (198, N'JANIFUL ISLAM', N'3C440304', N'5049', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 121, N'SILBARI', N'Semi Urban-Tier4', N'ACPPI6230D', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (199, N'RAJEEV KHANAL', N'3C440305', N'2049', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 141, N'BALIJAN BONGALI ARUN T.E', N'Rural-Tier5', N'BKOPK5724N', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (200, N'NIRAN BASUMATARY', N'3C440306 ', N'13378', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 143, N'BHERGAON TE MAHALIAPARA', N'#N/A', N'CCDPB8473M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (201, N'MIZANUR RAHMAN', N'3C440308', N'13255', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 133, N'BHOMRABIL', N'Rural-Tier5', N'ARZPR8624B', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (202, N'MUSTAFIZUR RAHMAN', N'3C440309', N'5049', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 121, N'PUB PADUGHAT', N'Semi Urban-Tier4', N'ARNPR6271J', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (203, N'MEDA GOYARY', N'3C440311', N'7388', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 763, N'PANBARI BAZAR', N'Rural-Tier5', N'BQHPG8296C', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (204, N'MANESWAR GOGOI', N'3C440312', N'SBIN0001426', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 122, N'SANTIPUR NO 1', N'Rural-Tier5', N'BEYPG6913D', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (205, N'HASSAN ALI AHMED', N'3C440313', N'5091', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 118, N'CHENIMARI', N'Semi Urban-Tier4', N'BCUPA8937R', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (206, N'LEISHANGTHEM MANGLEMBA SINGH', N'3C440314', N'18390', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 22, 522, N'LAMDENG AWANG LEIKH LAMSHANG (NP)', N'Semi Urban-Tier4', N'FAXPS5725Q', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (207, N'C LALPIAN MAWIA', N'3C440315', N'3810', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 24, 539, N'LUNGLEI,LUNGLAWN', N'Semi Urban-Tier4', N'ANKPL3786F', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (208, N'AJAY CHAKMA', N'3C440316', N'15198', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 3, 102, N'MANBHUMI HQ', N'Semi Urban-Tier4', N'BGBPC6946F', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (209, N'ARAMBAM BIKEN SING', N'3C440317', N'12265', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 22, 518, N'MOIRANG,TRONGLAOBI MAKHA LEIKH', N'Semi Urban-Tier4', N'DBVPS2146L', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (210, N'RAFIUL FARUQUE', N'3C440318', N'16935', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 125, N'KHARIJA PIKUN', N'Rural-Tier6a', N'ACWPF2937M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (211, N'MINTU TAMULY', N'3C440319', N'9864', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 126, N'SHYAMRAIPUR BAGAN', N'Rural-Tier5', N'AITPT0907A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (212, N'ANJIMA NARZARY', N'3C440320', N'7171', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 763, N'MALVITA', N'Rural-Tier5', N'AOFPN4221B', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (213, N'BIKASH BORAH', N'3C440321', N'83', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 126, N'ABHYJAN BAGAN', N'Rural-Tier5', N'ATSPB5996K', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (214, N'MONJOY BAGH', N'3C440322', N'7118', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 143, N'NONAIPARA TE', N'Rural-Tier5', N'AZZPB2072P', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (215, N'KAMAL BORO', N'3C440324', N'SBIN0007118', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 143, N'BORANGAJULI T.E.', N'Rural-Tier5', N'EFVPB2658B', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (216, N'AJIT DEKA', N'3C440325', N'7118', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 143, N'BADLAPARA TE', N'Rural-Tier5', N'BALPD9456K', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (217, N'KULEN NATH', N'3C440326', N'7118', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 143, N'DHARMAJULI TE', N'Rural-Tier5', N'AFVPN9208B', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (218, N'PROTULA IMSONG', N'3C440328', N'3598', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 25, 543, N'SEWAK COLONY', N'Rural-Tier6a', N'ABFPI0864G', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (219, N'B.NGANMLHET PHOM', N'3C440329', N'5838', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 25, 757, N'YAONGYIMCHEN', N'Rural-Tier6a', N'CGNPP9153J', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (220, N'A KONYAU', N'3C440330', N'5806', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 25, 756, N'SITIMI', N'Rural-Tier6a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (221, N'SHAH ALAM SK', N'3C440331', N'82', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 125, N'TUKURA PT I', N'Rural-Tier5', N'HMBPS7724B', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (222, N'DHAN MIYA', N'3C440333', N'9141', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 141, N'ARABARI NON KE JAPORIGURI', N'Rural-Tier6a', N'CCYPM7428N', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (223, N'SAHABUR ISLAM', N'3C440334', N'9141', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 141, N'NIZ BISWANATH', N'Rural-Tier5', N'ABNPI3863P', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (224, N'RAMTHANSANGA', N'3C440336', N'3810', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 24, 539, N'BAZAR LUNGLEI NT', N'Rural-Tier6a', N'CZYPR2074N', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (225, N'MARVIN C LALBIAKTLIUANGA', N'3C440337', N'3810', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 24, 539, N'HAULAWNG', N'Rural-Tier6a', N'AUNPL8392B', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (226, N'SHAHANUR ISLAM MOLLAH', N'3C440338', N'11618', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 125, N'ROUMARI JOYPUR BAZAR', N'Rural-Tier6a', N'BAXPM1723N', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (227, N'ROBIUL HOQUE', N'3C440339', N'82', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 125, N'MORICHBARI RESERVE', N'Rural-Tier5', N'AQMPH9230M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (228, N'MONUJ KR DOLEY', N'3C440345', N'1426', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 122, N'SISSIKOLAGHAR', N'Rural-Tier6a', N'CFFPD8093C', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (229, N'ALTAF  HUSSAIN MAZUMDAR', N'3C440346', N'9970', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 23, 533, N'UPPER KAMARI', N'Semi Urban-Tier4', N'CQGPM2477P', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (230, N'HARUN RASHID', N'3C440347', N'7389', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 130, N'NO 1 JOGIPARA PATHAR', N'Rural-Tier6b', N'AVZPR4493A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (231, N'BISWAJIT BAISHNAB', N'3C440348', N'2068', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 768, N'GOPAL KRISHNA T.E. PALAHGURI', N'Rural-Tier6a', N'CFJPB6155F', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (232, N'BIJEN KAIRI', N'3C440349', N'11612', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 120, N'BINNAKANDI PT II', N'Rural-Tier6a', N'BNOPK0598M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (233, N'NASRIN HAIDAR BARBHUIYA', N'3C440350', N'17401', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 120, N'DURGANAGAR PT-III', N'Semi Urban-Tier4', N'CPGPB9923L', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (234, N'JASIM UDDIN LASKAR', N'3C440351', N'17401', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 120, N'RONGPUR PT I', N'Rural-Tier6a', N'AGVPL5900B', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (235, N'RAMEN BORA', N'3C440352', N'4573', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 129, N' CHENIJAN, ANNAPURNA', N'Rural-Tier6a', N'BSWPB7251F', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (236, N'RITURAJ KASHYAP THAKUR', N'3C440353', N'9192', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 129, N'GAYAN GAON', N'Rural-Tier5', N'AMAPT6915B', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (237, N'ANUP CHIRING', N'3C440354', N'SBIN0011624', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 142, N'TELIKOLA HOLLOW', N'Rural-Tier5', N'ASNPC9605N', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (238, N'SOMWANG WANGSA', N'3C440355', N'6013', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 3, 113, N'LONGKAI', N'Rural-Tier6a', N'ADHPW3006A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (239, N'ABINASH BORDOLOI', N'3C440356', N'5604', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 129, N'GUWAL GAON', N'Rural-Tier6a', N'APXPB8222R', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (240, N'LOKAPRIYA DUTTA', N'3c440357', N'10307', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 126, N'BORJURI', N'Rural-Tier5', N'CNAPD9358K', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (241, N'LONGNA KONYAK E', N'3C440359', N'3604', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 25, 546, N'MON TOWN', N'Rural-Tier6a', N'CTDPK7641D', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (242, N'Y ABRAHAM KONYAK', N'3C440360', N'3604', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 25, 546, N'MON TC CHINGAI WARD', N'Rural-Tier6a', N'CTNPK1676E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (243, N'JONMONI BARO', N'3C440361', N'7118', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 143, N'ATELIAPARA', N'Rural-Tier5', N'CMMPB0474P', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (244, N'JUNALI BORAH', N'3C440363', N'11796', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 124, N'CHABUA T.E.', N'Rural-Tier5', N'BJGPB7661E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (245, N'SIRAJUL HAQUE', N'3C440365', N'2126', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 118, N'FEWRA KHOWA', N'Rural-Tier6a', N'ABWPH0111J', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (246, N'KUSHA DAS', N'3C440367', N'15026', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 760, N'DONGPAR', N'Rural-Tier5', N'BBPPD9363J', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (247, N'KRISHNA MAHATO', N'3C440368', N'9411', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 136, N'KRISHNA NAGAR', N'Rural-Tier6a', N'DBSPM8642A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (248, N'IMLIWAPANG JAMIR', N'3C440369', N'5542', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 25, 759, N'PEREN, WARD NO 4', N'Rural-Tier6a', N'AZNPJ3067C', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (249, N'MACHIHEING NDANG', N'3C440370', N'5542', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 25, 759, N'PEREN', N'Rural-Tier6a', N'AHOPN5603K', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (250, N'SUNMONI GOGOI', N'3C440371', N'13257', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 762, N'BORHAT BAGICHA', N'Rural-Tier6a', N'AWLPG2513K', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (251, N'SWADESH DEY', N'3C440372', N'3378', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 143, N'MAZBAT TE', N'Rural-Tier5', N'ARRPD5002H', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (252, N'BHASWATI SARMA', N'3C440373', N'130', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 121, N'MAHALIPARA', N'Semi Urban-Tier4', N'NAUPS5787K', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (253, N'PANKAJ KUMAR DEKA', N'3C440374', NULL, NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 121, N'DIPILA KAMARGAON', N'Semi Urban-Tier4', N'BNPPA5623Q', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (254, N'PINKY DEORI MANGAR', N'3C440375', N'130', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 121, N'TANGNIJHAR T.E.', N'Rural-Tier5', N'FXXPM7446F', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (255, N'KALYANI TANTI', N'3C440376', N'130', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 121, N'TANGNIJHAR T.E.', N'Rural-Tier5', N'ARQPT3761J', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (256, N'MONI KUMAR MAGAR', N'3C440377', N'5865', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 141, N'KHALAHUBARI', N'Rural-Tier6b', N'DYNPM8613M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (257, N'SEVIKA BASUMATARY', N'3C440378', N'9140', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 141, N'GAROBASTI', N'Rural-Tier5', N'ATGPBS275M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (258, N'DIPUL BASUMATARY', N'3C440379', N'9140', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 141, N'DANGTALA', N'Rural-Tier5', N'BZOPB5160J', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (259, N'ABDUL KASIM MAZUMDER', N'3C440380', N'17401', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 120, N'RONGPUR IV', N'Rural-Tier5', N'DTAPM0584D', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (260, N'MAKBUL HUSSAIN CHOUDHURY', N'3C440381', N'17401', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 120, N'ALGAPUR', N'Rural-Tier5', N'ATPPC1175Q', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (261, N'AHMED ISMAIL MAZUMDER', N'3C440382', N'17401', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 120, N'ARKATIPUR', N'Semi Urban-Tier4', N'BOEPM1055C', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (262, N'TAZIMUDDIN AHMED', N'3C440383', N'130', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 121, N'RUPARKASH', N'Rural-Tier5', N'BUOPA9181R', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (263, N'SADDAM HUSSAIN', N'3C440384', N'130', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 121, N'MANGALDOI WARD NO 1', N'Rural-Tier5', N'APAPH1634N', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (264, N'TAPASH DEBNATH', N'3C440385', N'6848', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 132, N'MAHAKAL Pt I', N'Rural-Tier5', N'ANKPN0589L', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (265, N'MOINUL HOQUE', N'3C440386', N'6848', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 132, N'MIRJAPUR Pt I', N'Semi Urban-Tier4', N'ASIPH4254R', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (266, N'HAINSHA BORO', N'3C440387', N'9201', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 130, N'SILAMAHEKHAITY', N'Rural-Tier5', N'AYCPB1796Q', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (267, N'FAROK ABDULLA', N'3C440388', N'2068', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 768, N'GARJAN', N'Rural-Tier6a', N'AUXPA6567H', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (268, N'ANSUMAI GAYARY', N'3C440391', N'2049', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 141, N'1 NO PIRAKATA', N'Rural-Tier5', N'BPAPG6204E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (269, N'UDDHAM DAS', N'3C440392', N'9141', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 141, N'GOWAL TOLI', N'Semi Urban-Tier4', N'CKJPD3693P', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (270, N'PANKAJ KR SHARMA', N'3C440394', N'6009', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 3, 108, N'MEDO', N'Rural-Tier6b', N'HCOPS3473N', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (271, N'MUNO L', N'3C440396', N'SBIN0005840', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 25, 548, N'NOKLAK VILLAGE', N'Rural-Tier6a', N'DPRPM5093G', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (272, N'ROBERT CHANG', N'3C440398', N'15288', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 25, 548, N'SANGSANGYU,TUENSANG TC', N'Rural-Tier5', N'BDUPC8683H', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (273, N'PAHI PATIRI', N'3C440399', N'9140', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 141, N'RAWNAMUKH PATHAR', N'Rural-Tier5', N'FISPP8261H', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (274, N'CHUBAKUMBA CHANG', N'3C440400', N'15288', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 25, 548, N'HIGH SCHOOL.TUENSANG TC', N'Rural-Tier5', N'BDUPC8683H', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (275, N'PULAK HALOI', N'3C440402', N'6196', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 767, N'NOONMATI WARD NO 48', N'Urban-Tier1c', N'ACCPH0781P', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (276, N'PRONAB JYOTI DEURI', N'3C440403', N'10759', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 134, N'MORNOI THENGAL', N'Rural-Tier6b', N'DBOPD3150A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (277, N'MITALI DHEKIAL PHUKAN', N'3C440404', N'9434', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 134, N'DHARAMPUR NO 3', N'Rural-Tier6a', N'FHHPP9784H', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (278, N'SHARIFUL ISLAM', N'3C440405', N'9434', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 134, N'NO 2 ISLAMPUR', N'Rural-Tier6a', N'ABIPI5588G', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (279, N'RATUL DOLEY', N'3C440406', N'16936', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 134, N'ASSERAKATA', N'Rural-Tier5', N'CGPPD2519E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (280, N'IMRAN HUSSAIN', N'3C440408', N'9439', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 130, N'BHAURIA BHITHA', N'Rural-Tier6a', N'AGMPH3323B', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (281, N'RUPALI DEVI', N'3C440409', N'10413', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 760, N'GORESWAR', N'Rural-Tier5', N'CBWPD3765Q', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (282, N'SHOHIDUL ISLAM', N'3C440410', N'15304', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 766, N'NO 2 BHELKAR', N'Rural-Tier5', N'AFCPI1786A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (283, N'KASIM UDDIN', N'3C440412', N'SBIN0018805', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 118, N'BAGURIGURI GAON', N'Rural-Tier6a', N'AFEPU9148L', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (284, N'ANUP DEKA', N'3C440413', N'10413', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 760, N'RANCHAJHAR', N'Rural-Tier6a', N'DFPPD2694Q', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (285, N'GEETAWALI SARMAH', N'3C440414', N'7947', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 143, N'WARD NO 4.UDALGURI TOWN', N'Semi Urban-Tier3', N'HKKPS0294H', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (286, N'GENDAN LHATON', N'3C440416', N'5844', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 3, 112, N'MUKTO', N'Rural-Tier6b', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (287, N'MIRJAUL HOQUE', N'3C440418', N'SBIN0017217', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 143, N'NO 2 KALAIGAON', N'Rural-Tier5', N'ADXPH9111R', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (288, N'NITYANANDA BAISHNAB', N'3C440419', N'17660', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 141, N'BEDETI', N'Rural-Tier5', N'ASSPB49828', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (289, N'DIPMONI BARUAH', N'3C440420', N'17660', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 761, N'TOKOWBARI', N'Rural-Tier6a', N'CAPPB9376P', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (290, N'ABUL KASHEM', N'3C440422', N'7431', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 121, N'BADLICHAR', N'Rural-Tier6a', N'DEVPK0040C', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (291, N'DIBAKAR DOLEY', N'3C440425', N'16936', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 134, N'MOIDAMIA', N'Rural-Tier5', N'CGRPK0932N', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (292, N'ABHUMERAJ SYED HAMIDULLA', N'3C440426', N'6891', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 134, N'NORAGAON', N'Rural-Tier6a', N'AHUPH4907N', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (293, N'PRANJIT DEKA', N'3C440427', N'5049', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 121, N'NO 3 CHIKONMATI', N'Rural-Tier6a', N'BADPD9901K', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (294, N'ANSRUL HOQUE BARBHUIYA', N'3C440428', N'17401', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 120, N'GOSSAIPUR PT II', N'Rural-Tier5', N'CKTPB6334F', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (295, N'BHUBESH DEKA', N'3C440429', N'10413', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 760, N'JOKEMARI', N'Rural-Tier5', N'ALKPD5084A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (296, N'NAJIR UDDIN AHMED', N'3C440430', N'15304', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 130, N'DAKHIN GAONBURAR PAM', N'Rural-Tier5', N'AQWPA0333J', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (297, N'A JOSEPH HAJAM', N'3C440431', N'3604', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 25, 546, N'TECHA WARD(MON TC)', N'Semi Urban-Tier4', N'ANAPH6697R', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (298, N'AVEO KHUSOH', N'3C440434', N'15289', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 25, 543, N'CHUMUKEDIMA', N'Semi Urban-Tier4', N'BEUPK3084F', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (299, N'NOKRANGBA LEMTUR', N'3C440435', N'10762', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 25, 543, N'DIPHUPAR(DIMAPUR MC)', N'Semi Urban-Tier4', N'ANGPL3313G', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (300, N'ANOWAR HUSSAIN', N'3C440437', N'9148', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 125, N'NAYAPARA PT I', N'Rural-Tier5', N'ALGPH2698E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (301, N'DEBARAJ BARO', N'3C440438', N'17217', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 143, N'BHAKATPARA', N'Rural-Tier6a', N'ATCPD1850E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (302, N'SARMINA IASMIN', N'3C440439', N'1684', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 119, N'BIRJHORA TE', N'Rural-Tier5', N'AFMTI8352N', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (303, N'IGNESIUS KERKETTA', N'3C440440', N'5243', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 760, N'KARAMTULI T.E.', N'Rural-Tier5', N'DOIPK8008F', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (304, N'KAFNUR ALI', N'3C440441', N'5092', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 137, N'DOKOHA', N'Rural-Tier5', N'AMCPA0782H', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (305, N'HARISA GOYARI', N'3C440442', N'17203', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 760, N'GOLAGAON', N'Rural-Tier5', N'ALEPG0460F', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (306, N'ETHEL CHUNG', N'3C440443', N'5845', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 25, 544, N'TESOPHENYU(SSA)', N'Rural-Tier5', N'BHYPC0213M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (307, N'SUDHANGSHU ROY', N'3C440444', N'7037', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 120, N'HAWAITHANG', N'Semi Urban-Tier4', N'BGQPR7454A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (308, N'AFRUJA KHATUN', N'3c440445', N'12977', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 121, N'GERIMARI', N'Rural-Tier5', N'HNDPK6129K', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (309, N'CHANDAN SAHA', N'3C440446', N'5049', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 121, N'DALGAON', N'Rural-Tier5', N'JCIPS6391M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (310, N'ROFIQ MAZUMDAR', N'3C440447', N'16942', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 766, N'MAHBER PATHER', N'Rural-Tier5', N'CLVPM6307G', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (311, N'TENGSRANG K SANGMA', N'3C440448', N'6906', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 23, 527, N'DAMASH', N'Rural-Tier6a', N'ENQPS4994N', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (312, N'PURNIMA BHUYA DUTTA', N'3C440449', N'9436', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 129, N'BARMOINAPARIA', N'Rural-Tier6a', N'CFYPD6264G', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (313, N'NAZRUL ISLAM', N'3C440451', N'130', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 121, N'UPAHUPARA', N'Rural-Tier5', N'AGNPI6805L', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (314, N'MAKSUD AHMED', N'3C440452', N'2068', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 768, N'PALIGURI', N'Rural-Tier6a', N'BVIPA6579G', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (315, N'AMINUL ALAM', N'3C440453', N'5049', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 121, N'DALGAON', N'Rural-Tier5', N'AJEPA0320K', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (316, N'NURBOX KHALIDUZ JAMAN', N'3C440454', N'7947', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 143, N'SIBAPUR', N'Rural-Tier6a', N'AUHPJ0160F', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (317, N'PURNIMA MANDAL', N'3C440455', N'5821', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 3, 771, N'VILL LOKLUNG', N'Rural-Tier6b', N'DTFPM5278F', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (318, N'DURGESWAR PAIT', N'3C440456', N'5821', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 3, 771, N'VILLAGE KEBA', N'Rural-Tier6c', N'BALPP1927K', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (319, N'ASHOK DAS', N'3C440457', N'1520', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 3, 108, N'TEZU TOWN', N'Semi Urban-Tier3', N'DGQPD8194H', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (320, N'DAMPI INGO', N'3C440458', N'11623', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 3, 117, N'DAMDA DEBUK', N'Rural-Tier6c', N'AFXPI2080J', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (321, N'TARAM LIBANG', N'3C440461', N'7228', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 3, 114, N'SINGING', N'#N/A', N'AELPL5662G', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (322, N'ALOKONG LITIN', N'3C440464', N'7228', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 3, 114, N'PALLING H.Q', N'#N/A', N'BAGPL9284C', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (323, N'Gamyir Sora', N'3C440466', N'1677', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 3, 117, N'PUSHI DOKE', N'Rural-Tier6b', N'GRQPS1452B', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (324, N'LUCKY  TASUNG', N'3C440468', N'1395', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 3, 114, N'VILLAGE SILLI', N'Rural-Tier6c', N'BPNPT4839P', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (325, N'SURESH DOLEY', N'3C440469', N'9409', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 3, 105, N'VILLAGE MIREM', N'Rural-Tier6b', N'DLAPD3665J', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (326, N'DHARMJIT MADHESIA', N'3C440471', N'9409', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 3, 105, N'VILLAGE SIKA TODE', N'Rural-Tier6c', N'BROPM4774P', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (327, N'ODONG DAI', N'3C440472', N'13311', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 3, 770, N'VILLAGE WENGKO', N'Rural-Tier6c', N'FQGPD6681D', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (328, N'BIJAY SANKAR SARMAH', N'3C440473', N'6892', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 3, 773, N'YAYEE I', N'Rural-Tier6c', N'DHSPS3349E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (329, N'DIPANJALI DUARAH', N'3C440474', N'5821', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 3, 771, N'VILLAGE RUKMO', N'Rural-Tier6c', N'BBEPG7255B', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (330, N'SAMEER BARUAH', N'3C440475', N'13311', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 3, 770, N'VILLAGE NINGROO CHARALI', N'Rural-Tier6c', N'BZQPB1526E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (331, N'DEENESH KUMAR SINGH', N'3C440476', N'5821', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 3, 771, N'VILLAGE IPINGO SIX KM POINT', N'Rural-Tier6c', N'GFSPS0398N', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (332, N'PHANIDHAR DOLEY', N'3c440477', N'6012', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 3, 117, N'CHISI', N'Rural-Tier6c', N'CEDPD5842L', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (333, N'BHULA SANKAR KULI', N'3C440478', N'6012', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 3, 117, N'PADI', N'Rural-Tier6c', N'CGRPK0932N', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (334, N'NGUKA H KINNY', N'3C440479', N'7349', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 25, 550, N'ROTO (NEW)', N'Rural-Tier6c', N'IBAPK9332Q', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (335, N'SAKIL AHMED KHAN', N'3C440480', N'223', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 124, N'NAMRUP T.E', N'Rural-Tier6a', N'ARLPK7337E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (336, N'THUCHU PFITHU', N'3C440481', N'6565', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 25, 547, N'WEZIHO TOWN', N'Rural-Tier6a', N'CQXPP7943L', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (337, N'BONGNGAM PHOM', N'3C440482', N'5838', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 25, 757, N'YONGNYAH', N'Rural-Tier6b', N'CPTPP9973F', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (338, N'DEVID KUPUNGHO', N'3C440483', N'6565', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 25, 547, N'AKHEGWO', N'Rural-Tier6c', N'HSOPK5361P', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (339, N'VERAZO RHAKHO', N'3C440484', N'6008', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 25, 547, N'SEKRUZU', N'Rural-Tier6b', N'DFCPR8020F', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (340, N'MOAKUMBA CHANG', N'3C440485', N'5810', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 25, 548, N'ALISOPUR', N'Rural-Tier6c', N'FVZPM7311D', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (341, N'CHEMTOK KONYAK', N'3C440486', N'3604', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 25, 546, N'PONGKONG', N'Rural-Tier6b', N'DEJPK7010G', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (342, N'LUAPONG H', N'3C440487', N'15431', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 25, 548, N'BHUMPAK', N'Rural-Tier6c', N'BCTPL2737B', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (343, N'L PUKHO MEYO', N'3C440489', N'5840', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 25, 548, N'CHILLISO', N'Rural-Tier6b', N'FWRPM5311L', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (344, N'Y KHWINTSATHU', N'3C440490', N'6565', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 25, 547, N'PHOKHUNGRI VILL', N'Rural-Tier6b', N'ICIPK2591A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (345, N'C ANGTONG KONYAK', N'3C440491', N'17216', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 25, 546, N'CHINGPHOI', N'Rural-Tier6a', N'IEQPK5984H', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (346, N'ELIAS URAON', N'3C440492', N'9148', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 125, N'MAIJUNGA T.E.', N'Rural-Tier6a', N'ABNPU1378D', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (347, N'BINJAKOP CHANG', N'3C440493', N'1328', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 25, 548, N'TAKNYU', N'Rural-Tier6a', N'BXFPC5058P', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (348, N'NILUTPAL HAZARIKA', N'3C440494', N'10327', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 767, N'SIXMILE', N'Urban-Tier1c', N'ABVPH8694R', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (349, N'A TAHJAN KONYAK', N'3C440495', N'5838', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 25, 757, N'YONGSHEI', N'Rural-Tier6b', N'ISHPK2768C', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (350, N'MONUJ KURMI', N'3C440497', N'9864', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 126, N'GUBINDAPUR BAGAN', N'Rural-Tier6b', N'BLBPK5877J', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (351, N'RAJIB BAISHYA', N'3C440498', N'18806', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 136, N'KALIABOR T.E', N'Rural-Tier6a', N'CIBPB1215R', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (352, N'ABU MD MUHIT', N'3C440499', N'13251', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 132, N'BHUBRIGHAT T.E', N'Rural-Tier6a', N'CNIPM3918E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (353, N'Nripen Chandra Kumar', N'3C440501', N'7118', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 143, N'BHUTEACHANG T.E', N'Rural-Tier6a', N'CSXPK0089E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (354, N'MAHENDRA PAMEGAM', N'3C440502', N'4318', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 3, 107, N'MICHING', N'Rural-Tier6b', N'EWEPP3603J', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (355, N'CHANDANA KALITA', N'3C440503', N'2060', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 767, N'GARIGAON', N'Metro-Tier1b', N'DFGPK2051R', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (356, N'KHIRUD GOGOI', N'3C440504', N'9630', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 140, N'DEOPANI TEA ESTATE', N'Rural-Tier6b', N'BTWPG4422N', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUserCSPDetail] ([CSPId], [CSPName], [CSPCode], [BranchCode], [ExpiryDate], [BankName], [BankAccount], [IFSC], [CertificateStatus], [Status], [FatherName], [MotherName], [Country], [State], [City], [Location], [Category], [PAN], [VoterId], [AadharNo], [Education], [Email], [Mobile], [EmergencyContactNumber], [PassportSizePhoto], [VoterIdImage], [PANImage], [AadharImage], [LatestEducationProofImage], [IIBFCertificationImage], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (357, N'GHANASHYAM BORO', N'3C440505', N'7118', NULL, NULL, NULL, NULL, N'No', 1, NULL, NULL, 1, 4, 143, N'MAJULI TEA ESTATE', N'Rural-Tier6a', N'BRLPB7318D', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[tblUserCSPDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[tblUserDetail] ON 

INSERT [dbo].[tblUserDetail] ([UserDetailId], [Name], [FatherName], [MotherName], [EmailId], [MobileNumber], [CityId], [Address], [EmergencyContactNumber], [DepartmentId], [DesignationId], [Qualification], [ProfilePicSource], [CreatedDate], [CreaterdBy], [UpdatedDate], [UpdatedBy], [UserId]) VALUES (1, N'Aditya', N'Father', N'Mother', N'Aditya@gmail.com', N'78787878778', 1, N'Delhi', N'874512784512', 1, 1, N'MBBS', NULL, CAST(N'2021-07-13T21:03:19.470' AS DateTime), 0, CAST(N'2021-07-13T21:03:19.470' AS DateTime), 2, NULL)
SET IDENTITY_INSERT [dbo].[tblUserDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[tblUserLoginLog] ON 

INSERT [dbo].[tblUserLoginLog] ([Id], [UserId], [LoginTimeStamp], [IpAddress], [HostName]) VALUES (1, 2, CAST(N'2021-07-07T22:31:51.623' AS DateTime), N'fe80::799b:f7d2:10c2:8b5%5', N'DESKTOP-JJIM67D')
INSERT [dbo].[tblUserLoginLog] ([Id], [UserId], [LoginTimeStamp], [IpAddress], [HostName]) VALUES (2, 2, CAST(N'2021-07-07T22:43:14.863' AS DateTime), N'fe80::799b:f7d2:10c2:8b5%5', N'DESKTOP-JJIM67D')
INSERT [dbo].[tblUserLoginLog] ([Id], [UserId], [LoginTimeStamp], [IpAddress], [HostName]) VALUES (3, 4, CAST(N'2021-07-07T22:44:54.640' AS DateTime), N'fe80::799b:f7d2:10c2:8b5%5', N'DESKTOP-JJIM67D')
INSERT [dbo].[tblUserLoginLog] ([Id], [UserId], [LoginTimeStamp], [IpAddress], [HostName]) VALUES (4, 4, CAST(N'2021-07-07T22:46:44.960' AS DateTime), N'fe80::799b:f7d2:10c2:8b5%5', N'DESKTOP-JJIM67D')
INSERT [dbo].[tblUserLoginLog] ([Id], [UserId], [LoginTimeStamp], [IpAddress], [HostName]) VALUES (5, 4, CAST(N'2021-07-07T22:47:23.477' AS DateTime), N'fe80::799b:f7d2:10c2:8b5%5', N'DESKTOP-JJIM67D')
INSERT [dbo].[tblUserLoginLog] ([Id], [UserId], [LoginTimeStamp], [IpAddress], [HostName]) VALUES (6, 2, CAST(N'2021-07-07T22:48:26.473' AS DateTime), N'fe80::799b:f7d2:10c2:8b5%5', N'DESKTOP-JJIM67D')
INSERT [dbo].[tblUserLoginLog] ([Id], [UserId], [LoginTimeStamp], [IpAddress], [HostName]) VALUES (7, 2, CAST(N'2021-07-08T13:54:54.577' AS DateTime), N'fe80::799b:f7d2:10c2:8b5%5', N'DESKTOP-JJIM67D')
INSERT [dbo].[tblUserLoginLog] ([Id], [UserId], [LoginTimeStamp], [IpAddress], [HostName]) VALUES (8, 4, CAST(N'2021-07-08T13:59:39.840' AS DateTime), N'fe80::799b:f7d2:10c2:8b5%5', N'DESKTOP-JJIM67D')
INSERT [dbo].[tblUserLoginLog] ([Id], [UserId], [LoginTimeStamp], [IpAddress], [HostName]) VALUES (9, 2, CAST(N'2021-07-08T15:14:16.930' AS DateTime), N'fe80::799b:f7d2:10c2:8b5%5', N'DESKTOP-JJIM67D')
INSERT [dbo].[tblUserLoginLog] ([Id], [UserId], [LoginTimeStamp], [IpAddress], [HostName]) VALUES (10, 2, CAST(N'2021-07-08T21:42:28.447' AS DateTime), N'fe80::799b:f7d2:10c2:8b5%5', N'DESKTOP-JJIM67D')
INSERT [dbo].[tblUserLoginLog] ([Id], [UserId], [LoginTimeStamp], [IpAddress], [HostName]) VALUES (11, 2, CAST(N'2021-07-08T21:50:11.990' AS DateTime), N'fe80::799b:f7d2:10c2:8b5%5', N'DESKTOP-JJIM67D')
INSERT [dbo].[tblUserLoginLog] ([Id], [UserId], [LoginTimeStamp], [IpAddress], [HostName]) VALUES (12, 2, CAST(N'2021-07-08T21:50:52.483' AS DateTime), N'fe80::799b:f7d2:10c2:8b5%5', N'DESKTOP-JJIM67D')
INSERT [dbo].[tblUserLoginLog] ([Id], [UserId], [LoginTimeStamp], [IpAddress], [HostName]) VALUES (13, 2, CAST(N'2021-07-08T22:22:01.413' AS DateTime), N'fe80::799b:f7d2:10c2:8b5%5', N'DESKTOP-JJIM67D')
INSERT [dbo].[tblUserLoginLog] ([Id], [UserId], [LoginTimeStamp], [IpAddress], [HostName]) VALUES (14, 2, CAST(N'2021-07-08T22:29:28.213' AS DateTime), N'fe80::799b:f7d2:10c2:8b5%5', N'DESKTOP-JJIM67D')
INSERT [dbo].[tblUserLoginLog] ([Id], [UserId], [LoginTimeStamp], [IpAddress], [HostName]) VALUES (15, 2, CAST(N'2021-07-08T22:53:55.160' AS DateTime), N'fe80::799b:f7d2:10c2:8b5%5', N'DESKTOP-JJIM67D')
INSERT [dbo].[tblUserLoginLog] ([Id], [UserId], [LoginTimeStamp], [IpAddress], [HostName]) VALUES (16, 2, CAST(N'2021-07-08T23:01:53.410' AS DateTime), N'fe80::799b:f7d2:10c2:8b5%5', N'DESKTOP-JJIM67D')
INSERT [dbo].[tblUserLoginLog] ([Id], [UserId], [LoginTimeStamp], [IpAddress], [HostName]) VALUES (17, 2, CAST(N'2021-07-08T23:06:07.203' AS DateTime), N'fe80::799b:f7d2:10c2:8b5%5', N'DESKTOP-JJIM67D')
INSERT [dbo].[tblUserLoginLog] ([Id], [UserId], [LoginTimeStamp], [IpAddress], [HostName]) VALUES (18, 2, CAST(N'2021-07-08T23:06:59.180' AS DateTime), N'fe80::799b:f7d2:10c2:8b5%5', N'DESKTOP-JJIM67D')
INSERT [dbo].[tblUserLoginLog] ([Id], [UserId], [LoginTimeStamp], [IpAddress], [HostName]) VALUES (19, 2, CAST(N'2021-07-08T23:12:11.203' AS DateTime), N'fe80::799b:f7d2:10c2:8b5%5', N'DESKTOP-JJIM67D')
INSERT [dbo].[tblUserLoginLog] ([Id], [UserId], [LoginTimeStamp], [IpAddress], [HostName]) VALUES (20, 2, CAST(N'2021-07-09T20:08:58.213' AS DateTime), N'::1', N'DESKTOP-JJIM67D')
INSERT [dbo].[tblUserLoginLog] ([Id], [UserId], [LoginTimeStamp], [IpAddress], [HostName]) VALUES (21, 2, CAST(N'2021-07-09T20:35:19.940' AS DateTime), N'fe80::799b:f7d2:10c2:8b5%5', N'DESKTOP-JJIM67D')
INSERT [dbo].[tblUserLoginLog] ([Id], [UserId], [LoginTimeStamp], [IpAddress], [HostName]) VALUES (22, 2, CAST(N'2021-07-09T21:16:47.537' AS DateTime), N'fe80::799b:f7d2:10c2:8b5%5', N'DESKTOP-JJIM67D')
INSERT [dbo].[tblUserLoginLog] ([Id], [UserId], [LoginTimeStamp], [IpAddress], [HostName]) VALUES (23, 2, CAST(N'2021-07-09T21:19:11.613' AS DateTime), N'fe80::799b:f7d2:10c2:8b5%5', N'DESKTOP-JJIM67D')
INSERT [dbo].[tblUserLoginLog] ([Id], [UserId], [LoginTimeStamp], [IpAddress], [HostName]) VALUES (24, 2, CAST(N'2021-07-09T21:20:52.880' AS DateTime), N'fe80::799b:f7d2:10c2:8b5%5', N'DESKTOP-JJIM67D')
INSERT [dbo].[tblUserLoginLog] ([Id], [UserId], [LoginTimeStamp], [IpAddress], [HostName]) VALUES (25, 2, CAST(N'2021-07-09T21:27:16.417' AS DateTime), N'fe80::799b:f7d2:10c2:8b5%5', N'DESKTOP-JJIM67D')
INSERT [dbo].[tblUserLoginLog] ([Id], [UserId], [LoginTimeStamp], [IpAddress], [HostName]) VALUES (26, 2, CAST(N'2021-07-09T22:00:56.277' AS DateTime), N'fe80::799b:f7d2:10c2:8b5%5', N'DESKTOP-JJIM67D')
INSERT [dbo].[tblUserLoginLog] ([Id], [UserId], [LoginTimeStamp], [IpAddress], [HostName]) VALUES (27, 5, CAST(N'2021-07-09T22:29:35.713' AS DateTime), N'fe80::799b:f7d2:10c2:8b5%5', N'DESKTOP-JJIM67D')
INSERT [dbo].[tblUserLoginLog] ([Id], [UserId], [LoginTimeStamp], [IpAddress], [HostName]) VALUES (28, 4, CAST(N'2021-07-09T22:32:56.913' AS DateTime), N'fe80::799b:f7d2:10c2:8b5%5', N'DESKTOP-JJIM67D')
INSERT [dbo].[tblUserLoginLog] ([Id], [UserId], [LoginTimeStamp], [IpAddress], [HostName]) VALUES (29, 2, CAST(N'2021-07-09T22:36:11.180' AS DateTime), N'fe80::799b:f7d2:10c2:8b5%5', N'DESKTOP-JJIM67D')
INSERT [dbo].[tblUserLoginLog] ([Id], [UserId], [LoginTimeStamp], [IpAddress], [HostName]) VALUES (30, 2, CAST(N'2021-07-09T23:11:15.143' AS DateTime), N'fe80::799b:f7d2:10c2:8b5%5', N'DESKTOP-JJIM67D')
INSERT [dbo].[tblUserLoginLog] ([Id], [UserId], [LoginTimeStamp], [IpAddress], [HostName]) VALUES (31, 2, CAST(N'2021-07-12T12:05:29.947' AS DateTime), N'fe80::799b:f7d2:10c2:8b5%5', N'DESKTOP-JJIM67D')
INSERT [dbo].[tblUserLoginLog] ([Id], [UserId], [LoginTimeStamp], [IpAddress], [HostName]) VALUES (32, 2, CAST(N'2021-07-12T12:09:43.217' AS DateTime), N'fe80::799b:f7d2:10c2:8b5%5', N'DESKTOP-JJIM67D')
INSERT [dbo].[tblUserLoginLog] ([Id], [UserId], [LoginTimeStamp], [IpAddress], [HostName]) VALUES (33, 2, CAST(N'2021-07-12T12:17:08.247' AS DateTime), N'fe80::799b:f7d2:10c2:8b5%5', N'DESKTOP-JJIM67D')
INSERT [dbo].[tblUserLoginLog] ([Id], [UserId], [LoginTimeStamp], [IpAddress], [HostName]) VALUES (34, 2, CAST(N'2021-07-12T15:14:15.837' AS DateTime), N'fe80::799b:f7d2:10c2:8b5%5', N'DESKTOP-JJIM67D')
INSERT [dbo].[tblUserLoginLog] ([Id], [UserId], [LoginTimeStamp], [IpAddress], [HostName]) VALUES (35, 2, CAST(N'2021-07-12T15:17:47.260' AS DateTime), N'fe80::799b:f7d2:10c2:8b5%5', N'DESKTOP-JJIM67D')
INSERT [dbo].[tblUserLoginLog] ([Id], [UserId], [LoginTimeStamp], [IpAddress], [HostName]) VALUES (36, 2, CAST(N'2021-07-12T15:27:22.797' AS DateTime), N'fe80::799b:f7d2:10c2:8b5%5', N'DESKTOP-JJIM67D')
INSERT [dbo].[tblUserLoginLog] ([Id], [UserId], [LoginTimeStamp], [IpAddress], [HostName]) VALUES (37, 2, CAST(N'2021-07-12T16:02:47.820' AS DateTime), N'fe80::799b:f7d2:10c2:8b5%5', N'DESKTOP-JJIM67D')
INSERT [dbo].[tblUserLoginLog] ([Id], [UserId], [LoginTimeStamp], [IpAddress], [HostName]) VALUES (38, 2, CAST(N'2021-07-12T17:11:34.827' AS DateTime), N'fe80::799b:f7d2:10c2:8b5%5', N'DESKTOP-JJIM67D')
INSERT [dbo].[tblUserLoginLog] ([Id], [UserId], [LoginTimeStamp], [IpAddress], [HostName]) VALUES (39, 2, CAST(N'2021-07-12T17:13:53.293' AS DateTime), N'fe80::799b:f7d2:10c2:8b5%5', N'DESKTOP-JJIM67D')
INSERT [dbo].[tblUserLoginLog] ([Id], [UserId], [LoginTimeStamp], [IpAddress], [HostName]) VALUES (40, 2, CAST(N'2021-07-12T17:20:13.730' AS DateTime), N'fe80::799b:f7d2:10c2:8b5%5', N'DESKTOP-JJIM67D')
INSERT [dbo].[tblUserLoginLog] ([Id], [UserId], [LoginTimeStamp], [IpAddress], [HostName]) VALUES (41, 2, CAST(N'2021-07-12T17:21:39.927' AS DateTime), N'fe80::799b:f7d2:10c2:8b5%5', N'DESKTOP-JJIM67D')
INSERT [dbo].[tblUserLoginLog] ([Id], [UserId], [LoginTimeStamp], [IpAddress], [HostName]) VALUES (42, 2, CAST(N'2021-07-12T17:24:02.423' AS DateTime), N'fe80::799b:f7d2:10c2:8b5%5', N'DESKTOP-JJIM67D')
INSERT [dbo].[tblUserLoginLog] ([Id], [UserId], [LoginTimeStamp], [IpAddress], [HostName]) VALUES (43, 2, CAST(N'2021-07-12T17:42:57.200' AS DateTime), N'fe80::799b:f7d2:10c2:8b5%5', N'DESKTOP-JJIM67D')
INSERT [dbo].[tblUserLoginLog] ([Id], [UserId], [LoginTimeStamp], [IpAddress], [HostName]) VALUES (44, 2, CAST(N'2021-07-12T17:57:31.510' AS DateTime), N'fe80::799b:f7d2:10c2:8b5%5', N'DESKTOP-JJIM67D')
INSERT [dbo].[tblUserLoginLog] ([Id], [UserId], [LoginTimeStamp], [IpAddress], [HostName]) VALUES (45, 2, CAST(N'2021-07-12T18:40:36.183' AS DateTime), N'fe80::799b:f7d2:10c2:8b5%5', N'DESKTOP-JJIM67D')
INSERT [dbo].[tblUserLoginLog] ([Id], [UserId], [LoginTimeStamp], [IpAddress], [HostName]) VALUES (46, 2, CAST(N'2021-07-12T18:43:45.150' AS DateTime), N'fe80::799b:f7d2:10c2:8b5%5', N'DESKTOP-JJIM67D')
INSERT [dbo].[tblUserLoginLog] ([Id], [UserId], [LoginTimeStamp], [IpAddress], [HostName]) VALUES (47, 2, CAST(N'2021-07-12T18:49:37.770' AS DateTime), N'fe80::799b:f7d2:10c2:8b5%5', N'DESKTOP-JJIM67D')
INSERT [dbo].[tblUserLoginLog] ([Id], [UserId], [LoginTimeStamp], [IpAddress], [HostName]) VALUES (48, 2, CAST(N'2021-07-12T18:56:53.147' AS DateTime), N'fe80::799b:f7d2:10c2:8b5%5', N'DESKTOP-JJIM67D')
INSERT [dbo].[tblUserLoginLog] ([Id], [UserId], [LoginTimeStamp], [IpAddress], [HostName]) VALUES (49, 2, CAST(N'2021-07-12T19:09:10.147' AS DateTime), N'fe80::799b:f7d2:10c2:8b5%5', N'DESKTOP-JJIM67D')
INSERT [dbo].[tblUserLoginLog] ([Id], [UserId], [LoginTimeStamp], [IpAddress], [HostName]) VALUES (50, 2, CAST(N'2021-07-13T20:14:27.857' AS DateTime), N'fe80::799b:f7d2:10c2:8b5%5', N'DESKTOP-JJIM67D')
INSERT [dbo].[tblUserLoginLog] ([Id], [UserId], [LoginTimeStamp], [IpAddress], [HostName]) VALUES (51, 2, CAST(N'2021-07-13T20:48:51.723' AS DateTime), N'fe80::799b:f7d2:10c2:8b5%5', N'DESKTOP-JJIM67D')
INSERT [dbo].[tblUserLoginLog] ([Id], [UserId], [LoginTimeStamp], [IpAddress], [HostName]) VALUES (52, 2, CAST(N'2021-07-13T21:01:41.820' AS DateTime), N'fe80::799b:f7d2:10c2:8b5%5', N'DESKTOP-JJIM67D')
INSERT [dbo].[tblUserLoginLog] ([Id], [UserId], [LoginTimeStamp], [IpAddress], [HostName]) VALUES (53, 2, CAST(N'2021-07-13T22:35:13.197' AS DateTime), N'fe80::799b:f7d2:10c2:8b5%5', N'DESKTOP-JJIM67D')
INSERT [dbo].[tblUserLoginLog] ([Id], [UserId], [LoginTimeStamp], [IpAddress], [HostName]) VALUES (54, 2, CAST(N'2021-07-14T11:46:52.920' AS DateTime), N'fe80::799b:f7d2:10c2:8b5%5', N'DESKTOP-JJIM67D')
INSERT [dbo].[tblUserLoginLog] ([Id], [UserId], [LoginTimeStamp], [IpAddress], [HostName]) VALUES (55, 2, CAST(N'2021-07-14T12:05:04.800' AS DateTime), N'fe80::799b:f7d2:10c2:8b5%5', N'DESKTOP-JJIM67D')
INSERT [dbo].[tblUserLoginLog] ([Id], [UserId], [LoginTimeStamp], [IpAddress], [HostName]) VALUES (56, 2, CAST(N'2021-07-14T12:24:49.370' AS DateTime), N'fe80::799b:f7d2:10c2:8b5%5', N'DESKTOP-JJIM67D')
INSERT [dbo].[tblUserLoginLog] ([Id], [UserId], [LoginTimeStamp], [IpAddress], [HostName]) VALUES (57, 2, CAST(N'2021-07-14T12:29:55.407' AS DateTime), N'fe80::799b:f7d2:10c2:8b5%5', N'DESKTOP-JJIM67D')
INSERT [dbo].[tblUserLoginLog] ([Id], [UserId], [LoginTimeStamp], [IpAddress], [HostName]) VALUES (58, 2, CAST(N'2021-07-14T13:41:07.247' AS DateTime), N'fe80::799b:f7d2:10c2:8b5%5', N'DESKTOP-JJIM67D')
INSERT [dbo].[tblUserLoginLog] ([Id], [UserId], [LoginTimeStamp], [IpAddress], [HostName]) VALUES (59, 2, CAST(N'2021-07-14T13:41:29.793' AS DateTime), N'fe80::799b:f7d2:10c2:8b5%5', N'DESKTOP-JJIM67D')
INSERT [dbo].[tblUserLoginLog] ([Id], [UserId], [LoginTimeStamp], [IpAddress], [HostName]) VALUES (60, 1, CAST(N'2021-07-14T13:42:59.410' AS DateTime), N'fe80::799b:f7d2:10c2:8b5%5', N'DESKTOP-JJIM67D')
INSERT [dbo].[tblUserLoginLog] ([Id], [UserId], [LoginTimeStamp], [IpAddress], [HostName]) VALUES (61, 1, CAST(N'2021-07-14T13:43:14.940' AS DateTime), N'fe80::799b:f7d2:10c2:8b5%5', N'DESKTOP-JJIM67D')
INSERT [dbo].[tblUserLoginLog] ([Id], [UserId], [LoginTimeStamp], [IpAddress], [HostName]) VALUES (1031, 1, CAST(N'2021-07-14T13:59:13.120' AS DateTime), N'fe80::799b:f7d2:10c2:8b5%5', N'DESKTOP-JJIM67D')
INSERT [dbo].[tblUserLoginLog] ([Id], [UserId], [LoginTimeStamp], [IpAddress], [HostName]) VALUES (1032, 1, CAST(N'2021-07-14T14:51:37.777' AS DateTime), N'fe80::799b:f7d2:10c2:8b5%5', N'DESKTOP-JJIM67D')
INSERT [dbo].[tblUserLoginLog] ([Id], [UserId], [LoginTimeStamp], [IpAddress], [HostName]) VALUES (1033, 1, CAST(N'2021-07-14T15:01:38.427' AS DateTime), N'fe80::799b:f7d2:10c2:8b5%5', N'DESKTOP-JJIM67D')
INSERT [dbo].[tblUserLoginLog] ([Id], [UserId], [LoginTimeStamp], [IpAddress], [HostName]) VALUES (1034, 1, CAST(N'2021-07-14T20:30:39.313' AS DateTime), N'fe80::799b:f7d2:10c2:8b5%5', N'DESKTOP-JJIM67D')
INSERT [dbo].[tblUserLoginLog] ([Id], [UserId], [LoginTimeStamp], [IpAddress], [HostName]) VALUES (1035, 1, CAST(N'2021-07-14T20:43:28.943' AS DateTime), N'fe80::799b:f7d2:10c2:8b5%5', N'DESKTOP-JJIM67D')
INSERT [dbo].[tblUserLoginLog] ([Id], [UserId], [LoginTimeStamp], [IpAddress], [HostName]) VALUES (1036, 1, CAST(N'2021-07-14T20:51:21.883' AS DateTime), N'fe80::799b:f7d2:10c2:8b5%5', N'DESKTOP-JJIM67D')
INSERT [dbo].[tblUserLoginLog] ([Id], [UserId], [LoginTimeStamp], [IpAddress], [HostName]) VALUES (1037, 1, CAST(N'2021-07-14T21:07:27.320' AS DateTime), N'fe80::799b:f7d2:10c2:8b5%5', N'DESKTOP-JJIM67D')
INSERT [dbo].[tblUserLoginLog] ([Id], [UserId], [LoginTimeStamp], [IpAddress], [HostName]) VALUES (1038, 1, CAST(N'2021-07-14T21:11:26.093' AS DateTime), N'fe80::799b:f7d2:10c2:8b5%5', N'DESKTOP-JJIM67D')
INSERT [dbo].[tblUserLoginLog] ([Id], [UserId], [LoginTimeStamp], [IpAddress], [HostName]) VALUES (1039, 1, CAST(N'2021-07-14T21:13:12.887' AS DateTime), N'fe80::799b:f7d2:10c2:8b5%5', N'DESKTOP-JJIM67D')
SET IDENTITY_INSERT [dbo].[tblUserLoginLog] OFF
GO
SET IDENTITY_INSERT [dbo].[tblUsers] ON 

INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, N'SuperAdmin', N'1234567', 1, 0, 1, 1, CAST(N'2021-07-14T13:00:18.233' AS DateTime), NULL, CAST(N'2021-07-14T13:43:11.083' AS DateTime), NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (2, N'Admin', N'1234567', 2, 0, 1, 1, CAST(N'2021-07-14T13:00:55.100' AS DateTime), NULL, CAST(N'2021-07-14T13:41:17.553' AS DateTime), NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (3, N'CSP', N'1234567', 3, 0, 1, NULL, CAST(N'2021-07-14T13:01:39.727' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (4, N'User', N'1234567', 4, 0, 1, NULL, CAST(N'2021-07-14T13:02:18.067' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (5, N'3C440010', N'eConnect@ANLPJ7195F', 3, 1, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (6, N'3C440011', N'eConnect@AHJPL5307R', 3, 2, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (7, N'3C440012', N'eConnect@CYMPP6494F', 3, 3, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (8, N'3C440013', N'eConnect@CIYPP2973D', 3, 4, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (9, N'3C440015', N'eConnect@BDRPJ1304B', 3, 5, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (10, N'3C440016', N'eConnect@CLVPB0321B', 3, 6, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (11, N'3C440017', N'eConnect@CPCPM5378E', 3, 7, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (12, N'3C440018', N'eConnect@ASTPD9298E', 3, 8, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (13, N'3C440019', N'eConnect@CDQPD6296J', 3, 9, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (14, N'3C440020', N'eConnect@BSVPD0949M', 3, 10, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (15, N'3C440021', N'eConnect@COMPD1114G', 3, 11, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (16, N'3C440022', N'eConnect@BZQPD0060D', 3, 12, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (17, N'3C440023', N'eConnect@AVIPR5563J', 3, 13, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (18, N'3C440026', N'eConnect@AUSPA3070C', 3, 14, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (19, N'3C440027', N'eConnect@AWPPA5142G', 3, 15, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (20, N'3C440028', N'eConnect@AGNPH1876N', 3, 16, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (21, N'3C440029', N'eConnect@BSOPB2734D', 3, 17, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (22, N'3C440030', N'eConnect@ATKPB9182D', 3, 18, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (23, N'3C440031', N'eConnect@BPOPA1787E', 3, 19, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (24, N'3C440032', N'eConnect@GJKPS3612H', 3, 20, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (25, N'3C440037', N'eConnect@BFLPB1929Q', 3, 21, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (26, N'3C440041', NULL, 3, 22, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (27, N'3C440043', N'eConnect@ALFPT5556Q', 3, 23, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (28, N'3C440046', N'eConnect@ADSPH4996B', 3, 24, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (29, N'3C440047', N'eConnect@DEFPK6640C', 3, 25, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (30, N'3C440050', N'eConnect@CFYPR4740B', 3, 26, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (31, N'3C440052', N'eConnect@AZFPB8224P', 3, 27, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (32, N'3C440053', N'eConnect@ASAPB8430F', 3, 28, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (33, N'3C440054', N'eConnect@BZGPS5482L', 3, 29, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (34, N'3C440055', N'eConnect@AWCPS4947E', 3, 30, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (35, N'3C440056', N'eConnect@BBSPP7993K', 3, 31, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (36, N'3C440057', N'eConnect@AAWPO0125G', 3, 32, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (37, N'3C440058', N'eConnect@AQMPD2398A', 3, 33, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (38, N'3C440059', N'eConnect@BKQPM8593P', 3, 34, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (39, N'3C440060', N'eConnect@CAXPD5298Q', 3, 35, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (40, N'3C440061', N'eConnect@BDWPR9544L', 3, 36, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (41, N'3C440062', N'eConnect@ATBPN1652P', 3, 37, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (42, N'3C440063', N'eConnect@EOEPS8755G', 3, 38, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (43, N'3C440065', N'eConnect@ALOPT4783A', 3, 39, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (44, N'3C440068', N'eConnect@GLUPS4310G', 3, 40, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (45, N'3C440071', N'eConnect@ATPPR2999P', 3, 41, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (46, N'3C440075', N'eConnect@AWOPB0091L', 3, 42, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (47, N'3C440079', N'eConnect@AVWPN6118K', 3, 43, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (48, N'3C440080', N'eConnect@AKPPN1537J', 3, 44, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (49, N'3C440081', N'eConnect@BXDPR0546M', 3, 45, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (50, N'3C440082', N'eConnect@BQYPB3318P', 3, 46, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (51, N'3C440083', N'eConnect@BXDPR0546M', 3, 47, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (52, N'3C440085', N'eConnect@AEBPU7715D', 3, 48, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (53, N'3C440087', N'eConnect@BTFPG9347D', 3, 49, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (54, N'3C440088', N'eConnect@BDQPM6071D', 3, 50, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (55, N'3C440089', N'eConnect@BMDPB8986J', 3, 51, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (56, N'3C440090', N'eConnect@CDNPM1561Q', 3, 52, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (57, N'3C440092', N'eConnect@ABFPI3190P', 3, 53, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (58, N'3C440093', N'eConnect@CGJPD7302M', 3, 54, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (59, N'3C440094', N'eConnect@BKUPD5120M', 3, 55, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (60, N'3C440098', N'eConnect@CHSPR0501C', 3, 56, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (61, N'3C440099', N'eConnect@ANAPL3432C', 3, 57, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (62, N'3C440100', N'eConnect@AJIPB0194R', 3, 58, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (63, N'3C440102', N'eConnect@CCGPM5289M', 3, 59, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (64, N'3C440105', N'eConnect@AGKPL8295J', 3, 60, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (65, N'3C440106', N'eConnect@ELTPK2824N', 3, 61, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (66, N'3C440113', N'eConnect@CGUPS8727E', 3, 62, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (67, N'3C440114', N'eConnect@DAGPS8414F', 3, 63, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (68, N'3C440115', N'eConnect@BQEPG0765K', 3, 64, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (69, N'3C440116', N'eConnect@ARMPB6418L', 3, 65, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (70, N'3C440117', N'eConnect@AKJPB5165A', 3, 66, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (71, N'3C440118', N'eConnect@BBCPD9525K', 3, 67, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (72, N'3C440120', N'eConnect@CACPD0927R', 3, 68, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (73, N'3C440121', N'eConnect@BUDPB4129H', 3, 69, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (74, N'3C440122', N'eConnect@CNKPB1656C', 3, 70, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (75, N'3C440126', N'eConnect@EWRPD8431D', 3, 71, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (76, N'3C440129', N'eConnect@AIBPL9513G', 3, 72, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (77, N'3C440130', N'eConnect@AHAPH7030E', 3, 73, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (78, N'3C440131', N'eConnect@CRDPP5324G', 3, 74, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (79, N'3C440132', N'eConnect@FQMPS7210F', 3, 75, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (80, N'3C440133', N'eConnect@CEEPD0812B', 3, 76, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (81, N'3C440134', N'eConnect@BSJPB2791P', 3, 77, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (82, N'3C440135', N'eConnect@ABIPI9467N', 3, 78, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (83, N'3C440136', N'eConnect@ADLPI1122M', 3, 79, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (84, N'3C440137', N'eConnect@CGRPM1484K', 3, 80, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (85, N'3C440138', N'eConnect@BFPPS0071C', 3, 81, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (86, N'3C440139', N'eConnect@CQGPM2477P', 3, 82, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (87, N'3C440140', N'eConnect@ABLPI7575E', 3, 83, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (88, N'3C440141', N'eConnect@ATYPA4355K', 3, 84, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (89, N'3C440142', N'eConnect@CCSPB6191F', 3, 85, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (90, N'3C440144', N'eConnect@ATEPN4525C', 3, 86, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (91, N'3C440145', N'eConnect@BLDPD7383N', 3, 87, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (92, N'3C440146', N'eConnect@ASEPB5051G', 3, 88, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (93, N'3C440147', N'eConnect@AQDPA6674M', 3, 89, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (94, N'3C440148', N'eConnect@CGWPS3628E', 3, 90, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (95, N'3C440149', N'eConnect@AKHPH4813R', 3, 91, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (96, N'3C440150', N'eConnect@ARVPC8905G', 3, 92, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (97, N'3C440152', N'eConnect@BNQPB1006B', 3, 93, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (98, N'3C440153', N'eConnect@BCDPB5348E', 3, 94, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (99, N'3C440154', N'eConnect@CNRPD5700N', 3, 95, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (100, N'3C440155', N'eConnect@ANSPL1343C', 3, 96, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (101, N'3C440156', N'eConnect@APJPL3429E', 3, 97, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (102, N'3C440158', N'eConnect@ALQPL7179J', 3, 98, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (103, N'3C440160', N'eConnect@AMAPL6529M', 3, 99, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (104, N'3C440161', N'eConnect@AEDPL0181J', 3, 100, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (105, N'3C440162', N'eConnect@AMPPL3271P', 3, 101, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (106, N'3C440163', N'eConnect@BGHPB1260P', 3, 102, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (107, N'3C440165', N'eConnect@AEYPL3165P', 3, 103, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (108, N'3C440169', N'eConnect@BBAPB2179P', 3, 104, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (109, N'3C440170', N'eConnect@AWKPB1881A', 3, 105, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (110, N'3C440171', N'eConnect@AQRPD4928K', 3, 106, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (111, N'3C440172', N'eConnect@BUDPB0574L', 3, 107, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (112, N'3C440175', N'eConnect@ASEPA1584H', 3, 108, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (113, N'3C440177', N'eConnect@BLIPR9225C', 3, 109, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (114, N'3C440178', N'eConnect@BOPPG9743E', 3, 110, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (115, N'3C440180', N'eConnect@BGXPB7686M', 3, 111, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (116, N'3C440182', N'eConnect@GKSPS3234Q', 3, 112, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (117, N'3C440183', N'eConnect@CBNPD2211E', 3, 113, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (118, N'3C440184', N'eConnect@CVUPK2837E', 3, 114, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (119, N'3C440187', N'eConnect@CSYPP8427J', 3, 115, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (120, N'3C440189', N'eConnect@COHPD7007P', 3, 116, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (121, N'3C440190', N'eConnect@CZYPP5541G', 3, 117, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (122, N'3C440193', N'eConnect@ALBPC8421H', 3, 118, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (123, N'3C440197', N'eConnect@AVNPT2873J', 3, 119, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (124, N'3C440198', N'eConnect@ACZPH7315L', 3, 120, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (125, N'3C440199', N'eConnect@BUAPA5525P', 3, 121, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (126, N'3C440202', N'eConnect@FFDPS3269N', 3, 122, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (127, N'3C440203', N'eConnect@BQLPA7887H', 3, 123, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (128, N'3C440204', N'eConnect@AHLPL5461G', 3, 124, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (129, N'3C440205', N'eConnect@ARBPA3663R', 3, 125, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (130, N'3C440206', N'eConnect@AWGPM8791G', 3, 126, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (131, N'3C440207', N'eConnect@AFZPI8817B', 3, 127, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (132, N'3C440208', N'eConnect@NOMPS5837G', 3, 128, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (133, N'3C440209', N'eConnect@CKHPS8336J', 3, 129, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (134, N'3C440210', N'eConnect@APJPC7042L', 3, 130, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (135, N'3C440211', N'eConnect@ADLPH9942A', 3, 131, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (136, N'3C440212', N'eConnect@AVNPJ9727H', 3, 132, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (137, N'3C440213', N'eConnect@AGPPA9175P', 3, 133, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (138, N'3C440214', N'eConnect@BDVPA9842F', 3, 134, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (139, N'3C440215', N'eConnect@ACYPI7995N', 3, 135, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (140, N'3C440219', N'eConnect@CVJPS2964K', 3, 136, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (141, N'3C440220', N'eConnect@BAJPS6895P', 3, 137, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (142, N'3C440221', N'eConnect@ACTPU3519K', 3, 138, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (143, N'3C440225', N'eConnect@ABQPI7053Q', 3, 139, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (144, N'3C440226', N'eConnect@CCIPS4967E', 3, 140, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (145, N'3C440227', N'eConnect@ENGPK2600K', 3, 141, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (146, N'3C440228', N'eConnect@AIYPH4595F', 3, 142, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (147, N'3C440229', N'eConnect@AJEPL3391E', 3, 143, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (148, N'3C440230', N'eConnect@BUAPD6547C', 3, 144, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (149, N'3C440231', N'eConnect@AYRPR1083M', 3, 145, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (150, N'3C440233', N'eConnect@BBLPA7627N', 3, 146, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (151, N'3C440235', N'eConnect@CTXPK1261M', 3, 147, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (152, N'3C440238', N'eConnect@AVVPD2624F', 3, 148, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (153, N'3C440239', N'eConnect@AMJPN1237D', 3, 149, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (154, N'3C440240', N'eConnect@ALRPR8967P', 3, 150, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (155, N'3C440241', N'eConnect@AFBPI4815B', 3, 151, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (156, N'3C440242', N'eConnect@ADDPI9160R', 3, 152, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (157, N'3C440244', N'eConnect@AGJPH8758B', 3, 153, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (158, N'3C440245', N'eConnect@AMJPL2182K', 3, 154, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (159, N'3C440246', N'eConnect@AXRPD7568C', 3, 155, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (160, N'3C440247', N'eConnect@CGAPB6851Q', 3, 156, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (161, N'3C440248', N'eConnect@EOMPK9759E', 3, 157, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (162, N'3C440249', N'eConnect@AJGPH2586R', 3, 158, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (163, N'3C440251', N'eConnect@AVJPG1508K', 3, 159, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (164, N'3C440252', N'eConnect@BQRPC3848L', 3, 160, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (165, N'3C440255', N'eConnect@GJNPS6399G', 3, 161, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (166, N'3C440256', N'eConnect@AKWPD3788J', 3, 162, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (167, N'3C440258', N'eConnect@FKKPB8095R', 3, 163, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (168, N'3C440259', N'eConnect@BRIPA2470A', 3, 164, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (169, N'3C440260', N'eConnect@CCSPB3509F', 3, 165, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (170, N'3C440261', N'eConnect@BTZPA3816P', 3, 166, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (171, N'3C440262', N'eConnect@CDPPB2358L', 3, 167, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (172, N'3C440265', N'eConnect@ABUPF6486G', 3, 168, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (173, N'3C440267', N'eConnect@FDVPS2792N', 3, 169, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (174, N'3C440268', N'eConnect@BUDPM3728B', 3, 170, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (175, N'3C440269', N'eConnect@CMLPS7035Q', 3, 171, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (176, N'3C440270', N'eConnect@ACKPI3778D', 3, 172, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (177, N'3C440271', N'eConnect@BBQPD6454F', 3, 173, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (178, N'3C440272', N'eConnect@DESPS1643A', 3, 174, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (179, N'3C440273', N'eConnect@BAMPA9579B', 3, 175, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (180, N'3C440274', N'eConnect@CUMPM5429D', 3, 176, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (181, N'3C440277', N'eConnect@EPSPK7488M', 3, 177, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (182, N'3C440278', N'eConnect@CKFPB8692A', 3, 178, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (183, N'3C440279', N'eConnect@CVRPB4500L', 3, 179, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (184, N'3C440280', N'eConnect@AEEPH3401G', 3, 180, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (185, N'3C440282', N'eConnect@BJMPB8321F', 3, 181, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (186, N'3C440283', N'eConnect@EPDPM0587Q', 3, 182, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (187, N'3C440284', N'eConnect@APFPH2577H', 3, 183, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (188, N'3C440286', N'eConnect@AGRPL5927G', 3, 184, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (189, N'3C440287', N'eConnect@AARPH1816J', 3, 185, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (190, N'3C440288', N'eConnect@BSPPM3465B', 3, 186, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (191, N'3C440289', N'eConnect@ALUPB1810G', 3, 187, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (192, N'3C440291', N'eConnect@CIHPM4026M', 3, 188, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (193, N'3C440292', N'eConnect@ATDPB3555F', 3, 189, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (194, N'3C440293', N'eConnect@BNGPB1080B', 3, 190, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (195, N'3C440294', N'eConnect@ETXPK9808J', 3, 191, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (196, N'3C440295', N'eConnect@KTIPS03421', 3, 192, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (197, N'3C440296', N'eConnect@AOUPN0795D', 3, 193, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (198, N'3C440298', N'eConnect@BZIPB7601Q', 3, 194, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (199, N'3C440300', N'eConnect@BTWPC0341L', 3, 195, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (200, N'3C440302', N'eConnect@HGDPS2445M', 3, 196, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (201, N'3C440303', N'eConnect@BOOPK7272K', 3, 197, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (202, N'3C440304', N'eConnect@ACPPI6230D', 3, 198, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (203, N'3C440305', N'eConnect@BKOPK5724N', 3, 199, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (204, N'3C440306 ', N'eConnect@CCDPB8473M', 3, 200, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (205, N'3C440308', N'eConnect@ARZPR8624B', 3, 201, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (206, N'3C440309', N'eConnect@ARNPR6271J', 3, 202, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (207, N'3C440311', N'eConnect@BQHPG8296C', 3, 203, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (208, N'3C440312', N'eConnect@BEYPG6913D', 3, 204, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (209, N'3C440313', N'eConnect@BCUPA8937R', 3, 205, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (210, N'3C440314', N'eConnect@FAXPS5725Q', 3, 206, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (211, N'3C440315', N'eConnect@ANKPL3786F', 3, 207, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (212, N'3C440316', N'eConnect@BGBPC6946F', 3, 208, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (213, N'3C440317', N'eConnect@DBVPS2146L', 3, 209, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (214, N'3C440318', N'eConnect@ACWPF2937M', 3, 210, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (215, N'3C440319', N'eConnect@AITPT0907A', 3, 211, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (216, N'3C440320', N'eConnect@AOFPN4221B', 3, 212, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (217, N'3C440321', N'eConnect@ATSPB5996K', 3, 213, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (218, N'3C440322', N'eConnect@AZZPB2072P', 3, 214, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (219, N'3C440324', N'eConnect@EFVPB2658B', 3, 215, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (220, N'3C440325', N'eConnect@BALPD9456K', 3, 216, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (221, N'3C440326', N'eConnect@AFVPN9208B', 3, 217, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (222, N'3C440328', N'eConnect@ABFPI0864G', 3, 218, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (223, N'3C440329', N'eConnect@CGNPP9153J', 3, 219, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (224, N'3C440330', NULL, 3, 220, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (225, N'3C440331', N'eConnect@HMBPS7724B', 3, 221, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (226, N'3C440333', N'eConnect@CCYPM7428N', 3, 222, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (227, N'3C440334', N'eConnect@ABNPI3863P', 3, 223, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (228, N'3C440336', N'eConnect@CZYPR2074N', 3, 224, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (229, N'3C440337', N'eConnect@AUNPL8392B', 3, 225, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (230, N'3C440338', N'eConnect@BAXPM1723N', 3, 226, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (231, N'3C440339', N'eConnect@AQMPH9230M', 3, 227, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (232, N'3C440345', N'eConnect@CFFPD8093C', 3, 228, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (233, N'3C440346', N'eConnect@CQGPM2477P', 3, 229, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (234, N'3C440347', N'eConnect@AVZPR4493A', 3, 230, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (235, N'3C440348', N'eConnect@CFJPB6155F', 3, 231, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (236, N'3C440349', N'eConnect@BNOPK0598M', 3, 232, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (237, N'3C440350', N'eConnect@CPGPB9923L', 3, 233, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (238, N'3C440351', N'eConnect@AGVPL5900B', 3, 234, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (239, N'3C440352', N'eConnect@BSWPB7251F', 3, 235, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (240, N'3C440353', N'eConnect@AMAPT6915B', 3, 236, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (241, N'3C440354', N'eConnect@ASNPC9605N', 3, 237, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (242, N'3C440355', N'eConnect@ADHPW3006A', 3, 238, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (243, N'3C440356', N'eConnect@APXPB8222R', 3, 239, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (244, N'3c440357', N'eConnect@CNAPD9358K', 3, 240, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (245, N'3C440359', N'eConnect@CTDPK7641D', 3, 241, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (246, N'3C440360', N'eConnect@CTNPK1676E', 3, 242, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (247, N'3C440361', N'eConnect@CMMPB0474P', 3, 243, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (248, N'3C440363', N'eConnect@BJGPB7661E', 3, 244, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (249, N'3C440365', N'eConnect@ABWPH0111J', 3, 245, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (250, N'3C440367', N'eConnect@BBPPD9363J', 3, 246, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (251, N'3C440368', N'eConnect@DBSPM8642A', 3, 247, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (252, N'3C440369', N'eConnect@AZNPJ3067C', 3, 248, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (253, N'3C440370', N'eConnect@AHOPN5603K', 3, 249, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (254, N'3C440371', N'eConnect@AWLPG2513K', 3, 250, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (255, N'3C440372', N'eConnect@ARRPD5002H', 3, 251, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (256, N'3C440373', N'eConnect@NAUPS5787K', 3, 252, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (257, N'3C440374', N'eConnect@BNPPA5623Q', 3, 253, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (258, N'3C440375', N'eConnect@FXXPM7446F', 3, 254, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (259, N'3C440376', N'eConnect@ARQPT3761J', 3, 255, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (260, N'3C440377', N'eConnect@DYNPM8613M', 3, 256, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (261, N'3C440378', N'eConnect@ATGPBS275M', 3, 257, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (262, N'3C440379', N'eConnect@BZOPB5160J', 3, 258, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (263, N'3C440380', N'eConnect@DTAPM0584D', 3, 259, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (264, N'3C440381', N'eConnect@ATPPC1175Q', 3, 260, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (265, N'3C440382', N'eConnect@BOEPM1055C', 3, 261, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (266, N'3C440383', N'eConnect@BUOPA9181R', 3, 262, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (267, N'3C440384', N'eConnect@APAPH1634N', 3, 263, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (268, N'3C440385', N'eConnect@ANKPN0589L', 3, 264, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (269, N'3C440386', N'eConnect@ASIPH4254R', 3, 265, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (270, N'3C440387', N'eConnect@AYCPB1796Q', 3, 266, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (271, N'3C440388', N'eConnect@AUXPA6567H', 3, 267, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (272, N'3C440391', N'eConnect@BPAPG6204E', 3, 268, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (273, N'3C440392', N'eConnect@CKJPD3693P', 3, 269, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (274, N'3C440394', N'eConnect@HCOPS3473N', 3, 270, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (275, N'3C440396', N'eConnect@DPRPM5093G', 3, 271, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (276, N'3C440398', N'eConnect@BDUPC8683H', 3, 272, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (277, N'3C440399', N'eConnect@FISPP8261H', 3, 273, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (278, N'3C440400', N'eConnect@BDUPC8683H', 3, 274, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (279, N'3C440402', N'eConnect@ACCPH0781P', 3, 275, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (280, N'3C440403', N'eConnect@DBOPD3150A', 3, 276, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (281, N'3C440404', N'eConnect@FHHPP9784H', 3, 277, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (282, N'3C440405', N'eConnect@ABIPI5588G', 3, 278, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (283, N'3C440406', N'eConnect@CGPPD2519E', 3, 279, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (284, N'3C440408', N'eConnect@AGMPH3323B', 3, 280, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (285, N'3C440409', N'eConnect@CBWPD3765Q', 3, 281, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (286, N'3C440410', N'eConnect@AFCPI1786A', 3, 282, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (287, N'3C440412', N'eConnect@AFEPU9148L', 3, 283, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (288, N'3C440413', N'eConnect@DFPPD2694Q', 3, 284, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (289, N'3C440414', N'eConnect@HKKPS0294H', 3, 285, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (290, N'3C440416', NULL, 3, 286, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (291, N'3C440418', N'eConnect@ADXPH9111R', 3, 287, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (292, N'3C440419', N'eConnect@ASSPB49828', 3, 288, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (293, N'3C440420', N'eConnect@CAPPB9376P', 3, 289, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (294, N'3C440422', N'eConnect@DEVPK0040C', 3, 290, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (295, N'3C440425', N'eConnect@CGRPK0932N', 3, 291, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (296, N'3C440426', N'eConnect@AHUPH4907N', 3, 292, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (297, N'3C440427', N'eConnect@BADPD9901K', 3, 293, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (298, N'3C440428', N'eConnect@CKTPB6334F', 3, 294, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (299, N'3C440429', N'eConnect@ALKPD5084A', 3, 295, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (300, N'3C440430', N'eConnect@AQWPA0333J', 3, 296, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (301, N'3C440431', N'eConnect@ANAPH6697R', 3, 297, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (302, N'3C440434', N'eConnect@BEUPK3084F', 3, 298, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (303, N'3C440435', N'eConnect@ANGPL3313G', 3, 299, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (304, N'3C440437', N'eConnect@ALGPH2698E', 3, 300, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (305, N'3C440438', N'eConnect@ATCPD1850E', 3, 301, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (306, N'3C440439', N'eConnect@AFMTI8352N', 3, 302, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (307, N'3C440440', N'eConnect@DOIPK8008F', 3, 303, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (308, N'3C440441', N'eConnect@AMCPA0782H', 3, 304, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (309, N'3C440442', N'eConnect@ALEPG0460F', 3, 305, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (310, N'3C440443', N'eConnect@BHYPC0213M', 3, 306, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (311, N'3C440444', N'eConnect@BGQPR7454A', 3, 307, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (312, N'3c440445', N'eConnect@HNDPK6129K', 3, 308, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (313, N'3C440446', N'eConnect@JCIPS6391M', 3, 309, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (314, N'3C440447', N'eConnect@CLVPM6307G', 3, 310, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (315, N'3C440448', N'eConnect@ENQPS4994N', 3, 311, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (316, N'3C440449', N'eConnect@CFYPD6264G', 3, 312, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (317, N'3C440451', N'eConnect@AGNPI6805L', 3, 313, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (318, N'3C440452', N'eConnect@BVIPA6579G', 3, 314, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (319, N'3C440453', N'eConnect@AJEPA0320K', 3, 315, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (320, N'3C440454', N'eConnect@AUHPJ0160F', 3, 316, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (321, N'3C440455', N'eConnect@DTFPM5278F', 3, 317, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (322, N'3C440456', N'eConnect@BALPP1927K', 3, 318, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (323, N'3C440457', N'eConnect@DGQPD8194H', 3, 319, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (324, N'3C440458', N'eConnect@AFXPI2080J', 3, 320, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (325, N'3C440461', N'eConnect@AELPL5662G', 3, 321, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (326, N'3C440464', N'eConnect@BAGPL9284C', 3, 322, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (327, N'3C440466', N'eConnect@GRQPS1452B', 3, 323, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (328, N'3C440468', N'eConnect@BPNPT4839P', 3, 324, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (329, N'3C440469', N'eConnect@DLAPD3665J', 3, 325, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (330, N'3C440471', N'eConnect@BROPM4774P', 3, 326, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (331, N'3C440472', N'eConnect@FQGPD6681D', 3, 327, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (332, N'3C440473', N'eConnect@DHSPS3349E', 3, 328, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (333, N'3C440474', N'eConnect@BBEPG7255B', 3, 329, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (334, N'3C440475', N'eConnect@BZQPB1526E', 3, 330, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (335, N'3C440476', N'eConnect@GFSPS0398N', 3, 331, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (336, N'3c440477', N'eConnect@CEDPD5842L', 3, 332, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (337, N'3C440478', N'eConnect@CGRPK0932N', 3, 333, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (338, N'3C440479', N'eConnect@IBAPK9332Q', 3, 334, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (339, N'3C440480', N'eConnect@ARLPK7337E', 3, 335, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (340, N'3C440481', N'eConnect@CQXPP7943L', 3, 336, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (341, N'3C440482', N'eConnect@CPTPP9973F', 3, 337, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (342, N'3C440483', N'eConnect@HSOPK5361P', 3, 338, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (343, N'3C440484', N'eConnect@DFCPR8020F', 3, 339, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (344, N'3C440485', N'eConnect@FVZPM7311D', 3, 340, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (345, N'3C440486', N'eConnect@DEJPK7010G', 3, 341, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (346, N'3C440487', N'eConnect@BCTPL2737B', 3, 342, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (347, N'3C440489', N'eConnect@FWRPM5311L', 3, 343, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (348, N'3C440490', N'eConnect@ICIPK2591A', 3, 344, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (349, N'3C440491', N'eConnect@IEQPK5984H', 3, 345, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (350, N'3C440492', N'eConnect@ABNPU1378D', 3, 346, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (351, N'3C440493', N'eConnect@BXFPC5058P', 3, 347, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (352, N'3C440494', N'eConnect@ABVPH8694R', 3, 348, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (353, N'3C440495', N'eConnect@ISHPK2768C', 3, 349, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (354, N'3C440497', N'eConnect@BLBPK5877J', 3, 350, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (355, N'3C440498', N'eConnect@CIBPB1215R', 3, 351, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (356, N'3C440499', N'eConnect@CNIPM3918E', 3, 352, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (357, N'3C440501', N'eConnect@CSXPK0089E', 3, 353, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (358, N'3C440502', N'eConnect@EWEPP3603J', 3, 354, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (359, N'3C440503', N'eConnect@DFGPK2051R', 3, 355, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (360, N'3C440504', N'eConnect@BTWPG4422N', 3, 356, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [IsPasswordReset], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (361, N'3C440505', N'eConnect@BRLPB7318D', 3, 357, 1, NULL, CAST(N'2021-07-14T13:09:26.177' AS DateTime), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[tblUsers] OFF
GO
SET IDENTITY_INSERT [dbo].[tblUserStatus] ON 

INSERT [dbo].[tblUserStatus] ([StatusId], [Name]) VALUES (1, N'Active')
INSERT [dbo].[tblUserStatus] ([StatusId], [Name]) VALUES (2, N'InActive')
INSERT [dbo].[tblUserStatus] ([StatusId], [Name]) VALUES (3, N'Blocked')
SET IDENTITY_INSERT [dbo].[tblUserStatus] OFF
GO
ALTER TABLE [dbo].[tblDepositRequest] ADD  CONSTRAINT [DF_tblDepositRequest_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tblDepositRequest] ADD  CONSTRAINT [DF_tblDepositRequest_UpdatedDate]  DEFAULT (getdate()) FOR [UpdatedDate]
GO
ALTER TABLE [dbo].[tblFolderImageDetails] ADD  CONSTRAINT [DF_tblFolderImageDetails_UploadedDate]  DEFAULT (getdate()) FOR [UploadedDate]
GO
ALTER TABLE [dbo].[tblFolderImageDetails] ADD  CONSTRAINT [DF_tblFolderImageDetails_InActive]  DEFAULT ((1)) FOR [InActive]
GO
ALTER TABLE [dbo].[tblTechRequest] ADD  CONSTRAINT [DF_tblTechRequest_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tblTechRequest] ADD  CONSTRAINT [DF_tblTechRequest_UpdatedDate]  DEFAULT (getdate()) FOR [UpdatedDate]
GO
ALTER TABLE [dbo].[tblUploader] ADD  CONSTRAINT [DF_tblUploader_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tblUploader] ADD  CONSTRAINT [DF_tblUploader_UpdatedDate]  DEFAULT (getdate()) FOR [UpdatedDate]
GO
ALTER TABLE [dbo].[tblUploader] ADD  DEFAULT ((0)) FOR [InActive]
GO
ALTER TABLE [dbo].[tblUserDetail] ADD  CONSTRAINT [DF_tblUserDetail_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tblUsers] ADD  CONSTRAINT [DF_tblUsers_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tblWithdrawalRequest] ADD  CONSTRAINT [DF_tblWithdrawalRequest_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tblWithdrawalRequest] ADD  CONSTRAINT [DF_tblWithdrawalRequest_UpdatedDate]  DEFAULT (getdate()) FOR [UpdatedDate]
GO
ALTER TABLE [dbo].[tblApplicationSettings]  WITH CHECK ADD  CONSTRAINT [FK_tblApplicationSettings_tblBusiness] FOREIGN KEY([BusinessId])
REFERENCES [dbo].[tblBusiness] ([BusinessId])
GO
ALTER TABLE [dbo].[tblApplicationSettings] CHECK CONSTRAINT [FK_tblApplicationSettings_tblBusiness]
GO
ALTER TABLE [dbo].[tblCity]  WITH CHECK ADD  CONSTRAINT [FK_tblCity_tblState] FOREIGN KEY([StateId])
REFERENCES [dbo].[tblState] ([StateId])
GO
ALTER TABLE [dbo].[tblCity] CHECK CONSTRAINT [FK_tblCity_tblState]
GO
ALTER TABLE [dbo].[tblCommissionReport]  WITH CHECK ADD  CONSTRAINT [FK_tblCommissionReport_tblCommissionReportTransactionType] FOREIGN KEY([CommissionReportTransactionType])
REFERENCES [dbo].[tblCommissionReportTransactionType] ([CommissionReportTransactionTypeId])
GO
ALTER TABLE [dbo].[tblCommissionReport] CHECK CONSTRAINT [FK_tblCommissionReport_tblCommissionReportTransactionType]
GO
ALTER TABLE [dbo].[tblCommissionReportMain]  WITH NOCHECK ADD  CONSTRAINT [FK_tblCommissionReportMain_tblUploader] FOREIGN KEY([UploaderId])
REFERENCES [dbo].[tblUploader] ([UploaderId])
GO
ALTER TABLE [dbo].[tblCommissionReportMain] CHECK CONSTRAINT [FK_tblCommissionReportMain_tblUploader]
GO
ALTER TABLE [dbo].[tblCommissionReportMonthly]  WITH NOCHECK ADD  CONSTRAINT [FK_tblCommissionReportMonthly_tblUploader] FOREIGN KEY([UploaderId])
REFERENCES [dbo].[tblUploader] ([UploaderId])
GO
ALTER TABLE [dbo].[tblCommissionReportMonthly] CHECK CONSTRAINT [FK_tblCommissionReportMonthly_tblUploader]
GO
ALTER TABLE [dbo].[tblCommissionReportNew]  WITH NOCHECK ADD  CONSTRAINT [FK_tblCommissionReportNew_tblUploader] FOREIGN KEY([UploaderId])
REFERENCES [dbo].[tblUploader] ([UploaderId])
GO
ALTER TABLE [dbo].[tblCommissionReportNew] CHECK CONSTRAINT [FK_tblCommissionReportNew_tblUploader]
GO
ALTER TABLE [dbo].[tblConfiguration]  WITH CHECK ADD  CONSTRAINT [FK_tblConfiguration_tblBusiness] FOREIGN KEY([BusinessId])
REFERENCES [dbo].[tblBusiness] ([BusinessId])
GO
ALTER TABLE [dbo].[tblConfiguration] CHECK CONSTRAINT [FK_tblConfiguration_tblBusiness]
GO
ALTER TABLE [dbo].[tblDepositRequest]  WITH CHECK ADD  CONSTRAINT [FK_tblDepositRequest_tblStatus] FOREIGN KEY([Status])
REFERENCES [dbo].[tblStatus] ([StatusId])
GO
ALTER TABLE [dbo].[tblDepositRequest] CHECK CONSTRAINT [FK_tblDepositRequest_tblStatus]
GO
ALTER TABLE [dbo].[tblDepositRequest]  WITH CHECK ADD  CONSTRAINT [FK_tblDepositRequest_tblUsers] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[tblUsers] ([UserId])
GO
ALTER TABLE [dbo].[tblDepositRequest] CHECK CONSTRAINT [FK_tblDepositRequest_tblUsers]
GO
ALTER TABLE [dbo].[tblDepositRequest]  WITH CHECK ADD  CONSTRAINT [FK_tblDepositRequest_tblUsers1] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[tblUsers] ([UserId])
GO
ALTER TABLE [dbo].[tblDepositRequest] CHECK CONSTRAINT [FK_tblDepositRequest_tblUsers1]
GO
ALTER TABLE [dbo].[tblFolderImageDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblFolderImageDetails_tblFolderDetails] FOREIGN KEY([FolderId])
REFERENCES [dbo].[tblFolderDetails] ([FolderId])
GO
ALTER TABLE [dbo].[tblFolderImageDetails] CHECK CONSTRAINT [FK_tblFolderImageDetails_tblFolderDetails]
GO
ALTER TABLE [dbo].[tblMenuSub]  WITH CHECK ADD  CONSTRAINT [FK_tblMenuSub_tblMenuMain] FOREIGN KEY([MenuMainId])
REFERENCES [dbo].[tblMenuMain] ([MenuMainId])
GO
ALTER TABLE [dbo].[tblMenuSub] CHECK CONSTRAINT [FK_tblMenuSub_tblMenuMain]
GO
ALTER TABLE [dbo].[tblMenuSub]  WITH CHECK ADD  CONSTRAINT [FK_tblMenuSub_tblRoleMaster] FOREIGN KEY([RoleId])
REFERENCES [dbo].[tblRoleMaster] ([RoleId])
GO
ALTER TABLE [dbo].[tblMenuSub] CHECK CONSTRAINT [FK_tblMenuSub_tblRoleMaster]
GO
ALTER TABLE [dbo].[tblState]  WITH CHECK ADD  CONSTRAINT [FK_tblState_tblCountry] FOREIGN KEY([CountryId])
REFERENCES [dbo].[tblCountry] ([CountryId])
GO
ALTER TABLE [dbo].[tblState] CHECK CONSTRAINT [FK_tblState_tblCountry]
GO
ALTER TABLE [dbo].[tblTechRequest]  WITH CHECK ADD  CONSTRAINT [FK_tblTechRequest_tblUsers1] FOREIGN KEY([ResolutionProvidedBy])
REFERENCES [dbo].[tblUsers] ([UserId])
GO
ALTER TABLE [dbo].[tblTechRequest] CHECK CONSTRAINT [FK_tblTechRequest_tblUsers1]
GO
ALTER TABLE [dbo].[tblTechRequest]  WITH CHECK ADD  CONSTRAINT [FK_tblTechRequest_tblUsers2] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[tblUsers] ([UserId])
GO
ALTER TABLE [dbo].[tblTechRequest] CHECK CONSTRAINT [FK_tblTechRequest_tblUsers2]
GO
ALTER TABLE [dbo].[tblTechRequest]  WITH CHECK ADD  CONSTRAINT [FK_tblTechRequest_tblUsers3] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[tblUsers] ([UserId])
GO
ALTER TABLE [dbo].[tblTechRequest] CHECK CONSTRAINT [FK_tblTechRequest_tblUsers3]
GO
ALTER TABLE [dbo].[tblTechRequest]  WITH CHECK ADD  CONSTRAINT [fkey_Status_Detail] FOREIGN KEY([Status])
REFERENCES [dbo].[tblStatus] ([StatusId])
GO
ALTER TABLE [dbo].[tblTechRequest] CHECK CONSTRAINT [fkey_Status_Detail]
GO
ALTER TABLE [dbo].[tblUploader]  WITH CHECK ADD  CONSTRAINT [FK_tblUploader_tblReportType] FOREIGN KEY([ReportType])
REFERENCES [dbo].[tblReportType] ([ReportTypeId])
GO
ALTER TABLE [dbo].[tblUploader] CHECK CONSTRAINT [FK_tblUploader_tblReportType]
GO
ALTER TABLE [dbo].[tblUploader]  WITH CHECK ADD  CONSTRAINT [FK_tblUploader_tblStatus] FOREIGN KEY([StatusID])
REFERENCES [dbo].[tblStatus] ([StatusId])
GO
ALTER TABLE [dbo].[tblUploader] CHECK CONSTRAINT [FK_tblUploader_tblStatus]
GO
ALTER TABLE [dbo].[tblUploader]  WITH CHECK ADD  CONSTRAINT [FK_tblUploader_tblUsers] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[tblUsers] ([UserId])
GO
ALTER TABLE [dbo].[tblUploader] CHECK CONSTRAINT [FK_tblUploader_tblUsers]
GO
ALTER TABLE [dbo].[tblUploader]  WITH CHECK ADD  CONSTRAINT [FK_tblUploader_tblUsers1] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[tblUsers] ([UserId])
GO
ALTER TABLE [dbo].[tblUploader] CHECK CONSTRAINT [FK_tblUploader_tblUsers1]
GO
ALTER TABLE [dbo].[tblUserCSPDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblUserCSPDetail_tblCity] FOREIGN KEY([City])
REFERENCES [dbo].[tblCity] ([CityId])
GO
ALTER TABLE [dbo].[tblUserCSPDetail] CHECK CONSTRAINT [FK_tblUserCSPDetail_tblCity]
GO
ALTER TABLE [dbo].[tblUserCSPDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblUserCSPDetail_tblCountry] FOREIGN KEY([Country])
REFERENCES [dbo].[tblCountry] ([CountryId])
GO
ALTER TABLE [dbo].[tblUserCSPDetail] CHECK CONSTRAINT [FK_tblUserCSPDetail_tblCountry]
GO
ALTER TABLE [dbo].[tblUserCSPDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblUserCSPDetail_tblState] FOREIGN KEY([State])
REFERENCES [dbo].[tblState] ([StateId])
GO
ALTER TABLE [dbo].[tblUserCSPDetail] CHECK CONSTRAINT [FK_tblUserCSPDetail_tblState]
GO
ALTER TABLE [dbo].[tblUserCSPDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblUserCSPDetail_tblStatus] FOREIGN KEY([Status])
REFERENCES [dbo].[tblStatus] ([StatusId])
GO
ALTER TABLE [dbo].[tblUserCSPDetail] CHECK CONSTRAINT [FK_tblUserCSPDetail_tblStatus]
GO
ALTER TABLE [dbo].[tblUserDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblUserDetail_tblCity] FOREIGN KEY([CityId])
REFERENCES [dbo].[tblCity] ([CityId])
GO
ALTER TABLE [dbo].[tblUserDetail] CHECK CONSTRAINT [FK_tblUserDetail_tblCity]
GO
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD  CONSTRAINT [FK_tblUsers_tblRoleMaster] FOREIGN KEY([UserType])
REFERENCES [dbo].[tblRoleMaster] ([RoleId])
GO
ALTER TABLE [dbo].[tblUsers] CHECK CONSTRAINT [FK_tblUsers_tblRoleMaster]
GO
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD  CONSTRAINT [FK_tblUsers_tblStatus] FOREIGN KEY([Status])
REFERENCES [dbo].[tblStatus] ([StatusId])
GO
ALTER TABLE [dbo].[tblUsers] CHECK CONSTRAINT [FK_tblUsers_tblStatus]
GO
ALTER TABLE [dbo].[tblWithdrawalRequest]  WITH CHECK ADD  CONSTRAINT [FK_tblWithdrawalRequest_tblStatus] FOREIGN KEY([Status])
REFERENCES [dbo].[tblStatus] ([StatusId])
GO
ALTER TABLE [dbo].[tblWithdrawalRequest] CHECK CONSTRAINT [FK_tblWithdrawalRequest_tblStatus]
GO
ALTER TABLE [dbo].[tblWithdrawalRequest]  WITH CHECK ADD  CONSTRAINT [FK_tblWithdrawalRequest_tblUsers] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[tblUsers] ([UserId])
GO
ALTER TABLE [dbo].[tblWithdrawalRequest] CHECK CONSTRAINT [FK_tblWithdrawalRequest_tblUsers]
GO
ALTER TABLE [dbo].[tblWithdrawalRequest]  WITH CHECK ADD  CONSTRAINT [FK_tblWithdrawalRequest_tblUsers1] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[tblUsers] ([UserId])
GO
ALTER TABLE [dbo].[tblWithdrawalRequest] CHECK CONSTRAINT [FK_tblWithdrawalRequest_tblUsers1]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAppMenuWithSubMenu]    Script Date: 7/14/2021 9:43:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Diwesh>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetAppMenuWithSubMenu] 
	-- Add the parameters for the stored procedure here
	@RoleId int


	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


select tblMenuMain.Tittle, tblMenuMain.Controller,tblMenuMain.Action, * from tblMenuSub
inner join tblMenuMain on tblMenuMain.MenuMainId =tblMenuSub.MenuMainId
where tblMenuSub.RoleId=@RoleId and tblMenuSub.Status=1
END



GO
/****** Object:  StoredProcedure [dbo].[sp_GetCommissionReportByYearMonthandCSPName]    Script Date: 7/14/2021 9:43:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetCommissionReportByYearMonthandCSPName] -- 2014,7,'3C440011'
	-- Add the parameters for the stored procedure here
	@Year int ,
	@Month int
,	@CSPCode nvarchar(200) =null

	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


	if(@CSPCode !='' or @CSPCode !=null )
			Begin
SELECT tblCommissionReportMain.CSPCode,tblCommissionReportMain.CSPName, tblCommissionReportMain.TransactionType,
tblCommissionReportMain.NoOfTransactions,

(tblCommissionReportMain.Commission * tblCommissionReportTransactionType.CSPCommission /100 )as ActualCommission,

sum(tblCommissionReportMain.Commission * tblCommissionReportTransactionType.CSPCommission /100  + 
--((tblCommissionReportMain.Commission* tblCommissionReportTransactionType.CSPCommission /100  )* 3.75/100))
((tblCommissionReportMain.Commission* tblCommissionReportTransactionType.CSPCommission /100  )* tblUploader.ApplyTDS/100))
as IncludingTDS,

tblCommissionReportTransactionType.CSPCommission, tblCommissionReportMain.Commission as Total


FROM     tblCommissionReportMain INNER JOIN
                  tblUploader ON tblCommissionReportMain.UploaderId = tblUploader.UploaderId INNER JOIN
                  tblCommissionReportTransactionType ON tblCommissionReportMain.TransactionType = tblCommissionReportTransactionType.Name
				
				
				where Year=@Year
				 and Month=@Month
				
				and 	 tblCommissionReportMain.CSPCode=@CSPCode
				
				 group by  [dbo].[tblCommissionReportMain].TransactionCommissionId,
				 tblCommissionReportMain.CSPCode, tblCommissionReportMain.CSPName, tblCommissionReportMain.TransactionType,
tblCommissionReportMain.NoOfTransactions,tblCommissionReportTransactionType.CSPCommission, tblCommissionReportMain.Commission  print(@CSPCode)
END
else

			Begin
SELECT tblCommissionReportMain.CSPCode, tblCommissionReportMain.CSPName, tblCommissionReportMain.TransactionType,
tblCommissionReportMain.NoOfTransactions,

(tblCommissionReportMain.Commission * tblCommissionReportTransactionType.CSPCommission /100 )as ActualCommission,

sum(tblCommissionReportMain.Commission * tblCommissionReportTransactionType.CSPCommission /100  + 
((tblCommissionReportMain.Commission* tblCommissionReportTransactionType.CSPCommission /100  )*tblUploader.ApplyTDS/100))
as IncludingTDS,

tblCommissionReportTransactionType.CSPCommission, tblCommissionReportMain.Commission as Total


FROM     tblCommissionReportMain INNER JOIN
                  tblUploader ON tblCommissionReportMain.UploaderId = tblUploader.UploaderId INNER JOIN
                  tblCommissionReportTransactionType ON tblCommissionReportMain.TransactionType = tblCommissionReportTransactionType.Name
				
				
				where Year=@Year
				 and Month=@Month
				
				--and 	 [tblCommissionReportNew].CSPCode=@CSPCode
				
				 group by  [dbo].[tblCommissionReportMain].TransactionCommissionId,
				 tblCommissionReportMain.CSPCode,tblCommissionReportMain.CSPName,  tblCommissionReportMain.TransactionType,
tblCommissionReportMain.NoOfTransactions,tblCommissionReportTransactionType.CSPCommission, tblCommissionReportMain.Commission 

--order by CSPCode asc
--print(@CSPCode)
END


END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetMonthlyCommissionReportByYearMonthandCSPCode]    Script Date: 7/14/2021 9:43:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetMonthlyCommissionReportByYearMonthandCSPCode] --2021,7,'3C440011'
	-- Add the parameters for the stored procedure here
	@Year int ,
	@Month int
,	@CSPCode nvarchar(200) =null

	AS
BEGIN
	
	SET NOCOUNT ON;
	if(@CSPCode !='' or @CSPCode !=null )
	Begin
SELECT  MonthlyCommissionReportID, CSPCode, CSPName, Transation, Incentive, Rural, Total, TDS, PayableToCSP, NetPayable,tblUploader.Month, tblUploader.Year, tblUploader.UploaderId
FROM  dbo.tblCommissionReportMonthly INNER JOIN tblUploader ON tblCommissionReportMonthly.UploaderId = tblUploader.UploaderId
                
				where tblUploader.Year=@Year
				 and tblUploader.Month=@Month
				and tblCommissionReportMonthly.CSPCode=@CSPCode
				
END
else

			Begin
SELECT  MonthlyCommissionReportID, CSPCode, CSPName, Transation, Incentive, Rural, Total, TDS, PayableToCSP, NetPayable,tblUploader.Month, tblUploader.Year, tblUploader.UploaderId
FROM  dbo.tblCommissionReportMonthly INNER JOIN tblUploader ON tblCommissionReportMonthly.UploaderId = tblUploader.UploaderId
                
				where tblUploader.Year=@Year
				 and tblUploader.Month=@Month
				

order by CSPCode asc
--print(@CSPCode)
END


END
GO
/****** Object:  StoredProcedure [dbo].[sp_PublishCommissionReport]    Script Date: 7/14/2021 9:43:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_PublishCommissionReport]  
	-- Add the parameters for the stored procedure here

	@UploaderId int
--@Year int,
--@Month int,
--@ReportType nvarchar(200) =null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	Begin
	    SET FMTONLY OFF 

	insert into [dbo].[tblCommissionReportMain] (circle,circlename,[BCBF_Code],[CSPCode],
[CSPName],[TransactionType],[NoOfTransactions],[Commission],[UploaderId])


SELECT tblCommissionReportNew.Circle, tblCommissionReportNew.CircleName, tblCommissionReportNew.BCBF_Code, tblCommissionReportNew.CSPCode, 
tblCommissionReportNew.CSPName, 

tblCommissionReportNew.TransactionType,

tblCommissionReportNew.NoOfTransactions, tblCommissionReportNew.Commission, tblCommissionReportNew.UploaderId
				FROM tblCommissionReportNew INNER JOIN tblUploader ON tblCommissionReportNew.UploaderId = tblUploader.UploaderId
WHERE 
EXISTS (
    SELECT [dbo].[tblCommissionReportTransactionType].CommissionReportTransactionTypeId
    FROM [dbo].[tblCommissionReportTransactionType]  
    WHERE[TransactionType] = [dbo].[tblCommissionReportTransactionType].Name
)

and 	tblUploader.UploaderId=@UploaderId
--and .tblUploader.Month =@Month
--and tblUploader.ReportType =@ReportType

delete from tblCommissionReportNew where (SELECT TransactionType ) in (select Name from [tblCommissionReportTransactionType])
and 	tblCommissionReportNew.UploaderId=@UploaderId

update tblUploader set StatusID=5 where UploaderId=@UploaderId

 END
  


END
GO
