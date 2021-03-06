USE [master]
GO
/****** Object:  Database [eConnectApp]    Script Date: 6/23/2021 3:28:33 PM ******/
CREATE DATABASE [eConnectApp]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'eConnectApp', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\eConnectApp.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'eConnectApp_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\eConnectApp_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [eConnectApp] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [eConnectApp].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [eConnectApp] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [eConnectApp] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [eConnectApp] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [eConnectApp] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [eConnectApp] SET ARITHABORT OFF 
GO
ALTER DATABASE [eConnectApp] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [eConnectApp] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [eConnectApp] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [eConnectApp] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [eConnectApp] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [eConnectApp] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [eConnectApp] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [eConnectApp] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [eConnectApp] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [eConnectApp] SET  DISABLE_BROKER 
GO
ALTER DATABASE [eConnectApp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [eConnectApp] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [eConnectApp] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [eConnectApp] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [eConnectApp] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [eConnectApp] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [eConnectApp] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [eConnectApp] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [eConnectApp] SET  MULTI_USER 
GO
ALTER DATABASE [eConnectApp] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [eConnectApp] SET DB_CHAINING OFF 
GO
ALTER DATABASE [eConnectApp] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [eConnectApp] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [eConnectApp] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [eConnectApp] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [eConnectApp] SET QUERY_STORE = OFF
GO
USE [eConnectApp]
GO
/****** Object:  User [EgraminWeb]    Script Date: 6/23/2021 3:28:33 PM ******/
CREATE USER [EgraminWeb] FOR LOGIN [EgraminWeb] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[tblAnnouncement]    Script Date: 6/23/2021 3:28:34 PM ******/
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
/****** Object:  Table [dbo].[tblApplicationSettings]    Script Date: 6/23/2021 3:28:34 PM ******/
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
/****** Object:  Table [dbo].[tblBusiness]    Script Date: 6/23/2021 3:28:34 PM ******/
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
/****** Object:  Table [dbo].[tblBusinessDetailReport]    Script Date: 6/23/2021 3:28:34 PM ******/
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
/****** Object:  Table [dbo].[tblCategory]    Script Date: 6/23/2021 3:28:34 PM ******/
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
/****** Object:  Table [dbo].[tblCity]    Script Date: 6/23/2021 3:28:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCity](
	[CityId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[StateId] [int] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_tblCity] PRIMARY KEY CLUSTERED 
(
	[CityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCommissionReport]    Script Date: 6/23/2021 3:28:34 PM ******/
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
/****** Object:  Table [dbo].[tblCommissionReportTransactionType]    Script Date: 6/23/2021 3:28:34 PM ******/
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
/****** Object:  Table [dbo].[tblConfiguration]    Script Date: 6/23/2021 3:28:34 PM ******/
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
/****** Object:  Table [dbo].[tblCountry]    Script Date: 6/23/2021 3:28:34 PM ******/
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
/****** Object:  Table [dbo].[tblCSPDetail]    Script Date: 6/23/2021 3:28:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCSPDetail](
	[CSPId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](200) NULL,
	[CSPCode] [varchar](100) NULL,
	[BranchCode] [varchar](100) NULL,
	[CityId] [int] NULL,
	[ExpiryDate] [date] NULL,
	[BankName] [varchar](50) NULL,
	[BankAccountNumber] [varchar](50) NULL,
	[IFSC] [varchar](50) NULL,
	[FatherName] [varchar](200) NULL,
	[MotherName] [varchar](200) NULL,
	[EmailId] [varchar](200) NULL,
	[EmergencyContactNumber] [varchar](100) NULL,
	[PAN] [varchar](20) NULL,
	[VoterId] [varchar](50) NULL,
	[AadharNo] [varchar](50) NULL,
	[ProfilePicSource] [varchar](200) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[Education] [varchar](50) NULL,
	[VoterIdSource] [varchar](200) NULL,
	[PANSource] [varchar](200) NULL,
	[AadharCardSource] [varchar](200) NULL,
	[EducationProofSource] [varchar](200) NULL,
	[IIBFCertificationSource] [varchar](200) NULL,
 CONSTRAINT [PK_tblCSPDetail] PRIMARY KEY CLUSTERED 
(
	[CSPId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblDepartment]    Script Date: 6/23/2021 3:28:34 PM ******/
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
/****** Object:  Table [dbo].[tblDepositRequest]    Script Date: 6/23/2021 3:28:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDepositRequest](
	[DepositeRequestId] [bigint] NOT NULL,
	[Amount] [decimal](19, 6) NULL,
	[RaisedBy] [int] NULL,
	[Status] [tinyint] NULL,
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
/****** Object:  Table [dbo].[tblDesignation]    Script Date: 6/23/2021 3:28:34 PM ******/
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
/****** Object:  Table [dbo].[tblDocuments]    Script Date: 6/23/2021 3:28:34 PM ******/
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
/****** Object:  Table [dbo].[tblEducation]    Script Date: 6/23/2021 3:28:34 PM ******/
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
/****** Object:  Table [dbo].[tblErrorLog]    Script Date: 6/23/2021 3:28:34 PM ******/
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
/****** Object:  Table [dbo].[tblFolderDetails]    Script Date: 6/23/2021 3:28:34 PM ******/
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
/****** Object:  Table [dbo].[tblFolderImageDetails]    Script Date: 6/23/2021 3:28:34 PM ******/
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
/****** Object:  Table [dbo].[tblHoliday]    Script Date: 6/23/2021 3:28:34 PM ******/
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
/****** Object:  Table [dbo].[tblMenuMain]    Script Date: 6/23/2021 3:28:34 PM ******/
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
/****** Object:  Table [dbo].[tblMenuSub]    Script Date: 6/23/2021 3:28:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMenuSub](
	[MenuSubId] [int] IDENTITY(1,1) NOT NULL,
	[MenuMainId] [int] NOT NULL,
	[RoleId] [int] NULL,
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
 CONSTRAINT [PK_tblMenuSub] PRIMARY KEY CLUSTERED 
(
	[MenuSubId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProblemType]    Script Date: 6/23/2021 3:28:34 PM ******/
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
/****** Object:  Table [dbo].[tblReportType]    Script Date: 6/23/2021 3:28:34 PM ******/
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
/****** Object:  Table [dbo].[tblRequestType]    Script Date: 6/23/2021 3:28:34 PM ******/
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
/****** Object:  Table [dbo].[tblRoleMaster]    Script Date: 6/23/2021 3:28:34 PM ******/
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
/****** Object:  Table [dbo].[tblScreen]    Script Date: 6/23/2021 3:28:34 PM ******/
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
/****** Object:  Table [dbo].[tblScreenRole]    Script Date: 6/23/2021 3:28:34 PM ******/
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
/****** Object:  Table [dbo].[tblState]    Script Date: 6/23/2021 3:28:34 PM ******/
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
/****** Object:  Table [dbo].[tblStatus]    Script Date: 6/23/2021 3:28:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblStatus](
	[StatusId] [tinyint] IDENTITY(1,1) NOT NULL,
	[Type] [varchar](50) NULL,
	[Name] [varchar](50) NULL,
 CONSTRAINT [PK_tblStatus] PRIMARY KEY CLUSTERED 
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTechRequest]    Script Date: 6/23/2021 3:28:34 PM ******/
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
	[Status] [tinyint] NULL,
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
/****** Object:  Table [dbo].[tblUploader]    Script Date: 6/23/2021 3:28:34 PM ******/
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
	[ApplyTDS] [decimal](10, 9) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_tblUploader] PRIMARY KEY CLUSTERED 
(
	[UploaderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUserDetail]    Script Date: 6/23/2021 3:28:34 PM ******/
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
/****** Object:  Table [dbo].[tblUserLoginLog]    Script Date: 6/23/2021 3:28:34 PM ******/
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
/****** Object:  Table [dbo].[tblUsers]    Script Date: 6/23/2021 3:28:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsers](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](20) NULL,
	[Password] [varchar](20) NULL,
	[UserType] [tinyint] NULL,
	[UserSourceId] [int] NULL,
	[Status] [tinyint] NULL,
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
/****** Object:  Table [dbo].[tblWebFeedback]    Script Date: 6/23/2021 3:28:34 PM ******/
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
/****** Object:  Table [dbo].[tblWithdrawalRequest]    Script Date: 6/23/2021 3:28:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblWithdrawalRequest](
	[WithdrawalRequestId] [bigint] IDENTITY(1,1) NOT NULL,
	[Amount] [decimal](19, 6) NULL,
	[RaisedBy] [int] NULL,
	[Status] [tinyint] NULL,
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
SET IDENTITY_INSERT [dbo].[tblApplicationSettings] ON 

INSERT [dbo].[tblApplicationSettings] ([SettingId], [BusinessId], [ApplicationName], [AutoBackUp], [AutoBackUpDuration], [DataRetention], [Status], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, 1, N'eConnect', N'Yes', N'Weekly', 20, 1, NULL, NULL, CAST(N'2021-06-23T14:46:59.107' AS DateTime), 2)
SET IDENTITY_INSERT [dbo].[tblApplicationSettings] OFF
GO
SET IDENTITY_INSERT [dbo].[tblBusiness] ON 

INSERT [dbo].[tblBusiness] ([BusinessId], [Name], [Description], [CreatedOn], [Status]) VALUES (1, N'BusinessA', N'This is business A', NULL, 3)
INSERT [dbo].[tblBusiness] ([BusinessId], [Name], [Description], [CreatedOn], [Status]) VALUES (2, N'Business B', N'Business b', NULL, 5)
SET IDENTITY_INSERT [dbo].[tblBusiness] OFF
GO
SET IDENTITY_INSERT [dbo].[tblCity] ON 

INSERT [dbo].[tblCity] ([CityId], [Name], [StateId], [Status]) VALUES (1, N'Gurgaon', 1, 1)
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

INSERT [dbo].[tblCountry] ([CountryId], [Name], [Status]) VALUES (2, N'India', 1)
SET IDENTITY_INSERT [dbo].[tblCountry] OFF
GO
SET IDENTITY_INSERT [dbo].[tblCSPDetail] ON 

INSERT [dbo].[tblCSPDetail] ([CSPId], [Name], [CSPCode], [BranchCode], [CityId], [ExpiryDate], [BankName], [BankAccountNumber], [IFSC], [FatherName], [MotherName], [EmailId], [EmergencyContactNumber], [PAN], [VoterId], [AadharNo], [ProfilePicSource], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Education], [VoterIdSource], [PANSource], [AadharCardSource], [EducationProofSource], [IIBFCertificationSource]) VALUES (1, N'CSP', N'AB', N'W301', 1, CAST(N'2021-05-21' AS Date), N'HDFC', N'0012921939132', N'1292', N'Father', N'Mother', N'abc@adc.co', N'9815098150', N'DTHSKFJDSKJD', N'899WEFE', N'JJKNJ990JK', NULL, CAST(N'2021-05-28T22:12:22.457' AS DateTime), NULL, CAST(N'2021-05-28T22:12:22.457' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[tblCSPDetail] OFF
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
INSERT [dbo].[tblMenuMain] ([MenuMainId], [Tittle], [Controller], [Action], [Description], [Status], [Priority], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (4, N'Reports', N'Home', N'Report', NULL, 1, 5, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblMenuMain] ([MenuMainId], [Tittle], [Controller], [Action], [Description], [Status], [Priority], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (5, N'Application', N'Home', N'ApplicationSetting', NULL, 1, 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblMenuMain] ([MenuMainId], [Tittle], [Controller], [Action], [Description], [Status], [Priority], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (6, N'CSP Dashboard', N'Home', N'CSPDashboard', NULL, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblMenuMain] ([MenuMainId], [Tittle], [Controller], [Action], [Description], [Status], [Priority], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (7, N'Raise Request', N'Home', N'RaiseRequest', NULL, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblMenuMain] ([MenuMainId], [Tittle], [Controller], [Action], [Description], [Status], [Priority], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (8, N'My Profile', N'Home', N'ProfileUpdate', NULL, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblMenuMain] ([MenuMainId], [Tittle], [Controller], [Action], [Description], [Status], [Priority], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (9, N'Reports', N'Home', N'CSPReports', NULL, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblMenuMain] ([MenuMainId], [Tittle], [Controller], [Action], [Description], [Status], [Priority], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (10, N'Application', N'Home', N'Application', NULL, 0, 2, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[tblMenuMain] OFF
GO
SET IDENTITY_INSERT [dbo].[tblMenuSub] ON 

INSERT [dbo].[tblMenuSub] ([MenuSubId], [MenuMainId], [RoleId], [Tittle], [Controller], [Action], [Description], [Status], [Priority], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, 1, 1, N'Dashboard', N'Home', N'Dashboard', NULL, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblMenuSub] ([MenuSubId], [MenuMainId], [RoleId], [Tittle], [Controller], [Action], [Description], [Status], [Priority], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (2, 2, 1, N'Technical Support', N'Home', N'TechnicalSupport', NULL, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblMenuSub] ([MenuSubId], [MenuMainId], [RoleId], [Tittle], [Controller], [Action], [Description], [Status], [Priority], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (3, 2, 1, N'Deposit Request', N'Home', N'DepositRequest', NULL, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblMenuSub] ([MenuSubId], [MenuMainId], [RoleId], [Tittle], [Controller], [Action], [Description], [Status], [Priority], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (4, 2, 1, N'Withdrawal Request', N'Home', N'WithdrawalRequest', NULL, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblMenuSub] ([MenuSubId], [MenuMainId], [RoleId], [Tittle], [Controller], [Action], [Description], [Status], [Priority], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (5, 3, 1, N'Users', N'Home', N'Users', NULL, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblMenuSub] ([MenuSubId], [MenuMainId], [RoleId], [Tittle], [Controller], [Action], [Description], [Status], [Priority], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (6, 3, 1, N'CSP', N'Home', N'CSP', NULL, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblMenuSub] ([MenuSubId], [MenuMainId], [RoleId], [Tittle], [Controller], [Action], [Description], [Status], [Priority], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (7, 4, 1, N'Business Report', N'Home', N'Report', NULL, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblMenuSub] ([MenuSubId], [MenuMainId], [RoleId], [Tittle], [Controller], [Action], [Description], [Status], [Priority], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (8, 4, 1, N'Commission Report', N'Home', N'Report', NULL, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblMenuSub] ([MenuSubId], [MenuMainId], [RoleId], [Tittle], [Controller], [Action], [Description], [Status], [Priority], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (9, 4, 1, N'Absentism Report', N'Home', N'Report', NULL, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblMenuSub] ([MenuSubId], [MenuMainId], [RoleId], [Tittle], [Controller], [Action], [Description], [Status], [Priority], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (10, 6, 3, N'CSP Dashboard', N'Home', N'CSPDashboard', NULL, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblMenuSub] ([MenuSubId], [MenuMainId], [RoleId], [Tittle], [Controller], [Action], [Description], [Status], [Priority], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (11, 7, 3, N'Technical Support', N'Home', N'TechnicalSupport', NULL, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblMenuSub] ([MenuSubId], [MenuMainId], [RoleId], [Tittle], [Controller], [Action], [Description], [Status], [Priority], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (12, 7, 3, N'Deposit Request', N'Home', N'DepositRequest', NULL, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblMenuSub] ([MenuSubId], [MenuMainId], [RoleId], [Tittle], [Controller], [Action], [Description], [Status], [Priority], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (13, 7, 3, N'Withdrawal Request', N'Home', N'WithdrawalRequest', NULL, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblMenuSub] ([MenuSubId], [MenuMainId], [RoleId], [Tittle], [Controller], [Action], [Description], [Status], [Priority], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (14, 8, 3, N'Profile Update', N'Home', N'ProfileUpdate', NULL, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblMenuSub] ([MenuSubId], [MenuMainId], [RoleId], [Tittle], [Controller], [Action], [Description], [Status], [Priority], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (16, 9, 3, N'Commission Report', N'Home', N'Report', NULL, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblMenuSub] ([MenuSubId], [MenuMainId], [RoleId], [Tittle], [Controller], [Action], [Description], [Status], [Priority], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (17, 5, 1, N'Application Setting', N'Admin', N'_EditApplicationSetting', NULL, 1, 1, NULL, NULL, NULL, NULL)
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

INSERT [dbo].[tblState] ([StateId], [Name], [CountryId], [Status]) VALUES (1, N'Haryana', 2, 1)
SET IDENTITY_INSERT [dbo].[tblState] OFF
GO
SET IDENTITY_INSERT [dbo].[tblStatus] ON 

INSERT [dbo].[tblStatus] ([StatusId], [Type], [Name]) VALUES (1, N'1', N'Open')
INSERT [dbo].[tblStatus] ([StatusId], [Type], [Name]) VALUES (2, N'2', N'In-Progress')
INSERT [dbo].[tblStatus] ([StatusId], [Type], [Name]) VALUES (3, N'3', N'Completed')
INSERT [dbo].[tblStatus] ([StatusId], [Type], [Name]) VALUES (4, N'4', N'On-Hold')
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

INSERT [dbo].[tblUploader] ([UploaderId], [ReportType], [Month], [Year], [FileName], [FileSource], [ApplyTDS], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, 1, 6, 2021, N'TestExcel.xlsx', NULL, NULL, NULL, NULL, CAST(N'2021-05-19T19:39:38.207' AS DateTime), NULL)
INSERT [dbo].[tblUploader] ([UploaderId], [ReportType], [Month], [Year], [FileName], [FileSource], [ApplyTDS], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (2, 1, 6, 2021, N'TestExcel.xlsx', NULL, CAST(3.400000000 AS Decimal(10, 9)), NULL, NULL, CAST(N'2021-05-19T19:39:38.207' AS DateTime), NULL)
INSERT [dbo].[tblUploader] ([UploaderId], [ReportType], [Month], [Year], [FileName], [FileSource], [ApplyTDS], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (3, 1, 6, 2021, N'TestExcel.xlsx', NULL, NULL, NULL, NULL, CAST(N'2021-06-04T14:07:28.897' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[tblUploader] OFF
GO
SET IDENTITY_INSERT [dbo].[tblUserLoginLog] ON 

INSERT [dbo].[tblUserLoginLog] ([Id], [UserId], [LoginTimeStamp], [IpAddress], [HostName]) VALUES (5, 2, CAST(N'2021-06-23T01:39:23.253' AS DateTime), N'fe80::799b:f7d2:10c2:8b5%5', N'DESKTOP-JJIM67D')
INSERT [dbo].[tblUserLoginLog] ([Id], [UserId], [LoginTimeStamp], [IpAddress], [HostName]) VALUES (6, 2, CAST(N'2021-06-23T01:39:58.767' AS DateTime), N'fe80::799b:f7d2:10c2:8b5%5', N'DESKTOP-JJIM67D')
INSERT [dbo].[tblUserLoginLog] ([Id], [UserId], [LoginTimeStamp], [IpAddress], [HostName]) VALUES (7, 2, CAST(N'2021-06-23T12:53:08.733' AS DateTime), N'fe80::799b:f7d2:10c2:8b5%5', N'DESKTOP-JJIM67D')
INSERT [dbo].[tblUserLoginLog] ([Id], [UserId], [LoginTimeStamp], [IpAddress], [HostName]) VALUES (8, 2, CAST(N'2021-06-23T12:58:53.387' AS DateTime), N'fe80::799b:f7d2:10c2:8b5%5', N'DESKTOP-JJIM67D')
INSERT [dbo].[tblUserLoginLog] ([Id], [UserId], [LoginTimeStamp], [IpAddress], [HostName]) VALUES (9, 2, CAST(N'2021-06-23T13:28:11.210' AS DateTime), N'fe80::799b:f7d2:10c2:8b5%5', N'DESKTOP-JJIM67D')
INSERT [dbo].[tblUserLoginLog] ([Id], [UserId], [LoginTimeStamp], [IpAddress], [HostName]) VALUES (10, 2, CAST(N'2021-06-23T13:28:11.193' AS DateTime), N'fe80::799b:f7d2:10c2:8b5%5', N'DESKTOP-JJIM67D')
INSERT [dbo].[tblUserLoginLog] ([Id], [UserId], [LoginTimeStamp], [IpAddress], [HostName]) VALUES (11, 2, CAST(N'2021-06-23T13:34:17.050' AS DateTime), N'fe80::799b:f7d2:10c2:8b5%5', N'DESKTOP-JJIM67D')
INSERT [dbo].[tblUserLoginLog] ([Id], [UserId], [LoginTimeStamp], [IpAddress], [HostName]) VALUES (12, 2, CAST(N'2021-06-23T13:50:28.820' AS DateTime), N'fe80::799b:f7d2:10c2:8b5%5', N'DESKTOP-JJIM67D')
INSERT [dbo].[tblUserLoginLog] ([Id], [UserId], [LoginTimeStamp], [IpAddress], [HostName]) VALUES (13, 2, CAST(N'2021-06-23T14:12:06.797' AS DateTime), N'fe80::799b:f7d2:10c2:8b5%5', N'DESKTOP-JJIM67D')
INSERT [dbo].[tblUserLoginLog] ([Id], [UserId], [LoginTimeStamp], [IpAddress], [HostName]) VALUES (14, 2, CAST(N'2021-06-23T14:43:18.890' AS DateTime), N'fe80::799b:f7d2:10c2:8b5%5', N'DESKTOP-JJIM67D')
SET IDENTITY_INSERT [dbo].[tblUserLoginLog] OFF
GO
SET IDENTITY_INSERT [dbo].[tblUsers] ON 

INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (2, N'Diwesh', N'123456', 1, 1, 1, CAST(N'2021-05-19T19:39:38.207' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (3, N'Dilpreet', N'123456', 1, 1, 1, CAST(N'2021-06-17T23:17:10.500' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Password], [UserType], [UserSourceId], [Status], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (4, N'CSPUser', N'123456', 3, 1, 1, CAST(N'2021-06-22T16:33:15.030' AS DateTime), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[tblUsers] OFF
GO
ALTER TABLE [dbo].[tblCSPDetail] ADD  CONSTRAINT [DF_tblCSPDetail_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tblCSPDetail] ADD  CONSTRAINT [DF_tblCSPDetail_UpdatedDate]  DEFAULT (getdate()) FOR [UpdatedDate]
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
ALTER TABLE [dbo].[tblBusinessDetailReport]  WITH CHECK ADD  CONSTRAINT [FK_tblBusinessDetailReport_tblUploader] FOREIGN KEY([UploaderId])
REFERENCES [dbo].[tblUploader] ([UploaderId])
GO
ALTER TABLE [dbo].[tblBusinessDetailReport] CHECK CONSTRAINT [FK_tblBusinessDetailReport_tblUploader]
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
ALTER TABLE [dbo].[tblConfiguration]  WITH CHECK ADD  CONSTRAINT [FK_tblConfiguration_tblBusiness] FOREIGN KEY([BusinessId])
REFERENCES [dbo].[tblBusiness] ([BusinessId])
GO
ALTER TABLE [dbo].[tblConfiguration] CHECK CONSTRAINT [FK_tblConfiguration_tblBusiness]
GO
ALTER TABLE [dbo].[tblCSPDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblCSPDetail_tblCity] FOREIGN KEY([CityId])
REFERENCES [dbo].[tblCity] ([CityId])
GO
ALTER TABLE [dbo].[tblCSPDetail] CHECK CONSTRAINT [FK_tblCSPDetail_tblCity]
GO
ALTER TABLE [dbo].[tblCSPDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblCSPDetail_tblUsers] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[tblUsers] ([UserId])
GO
ALTER TABLE [dbo].[tblCSPDetail] CHECK CONSTRAINT [FK_tblCSPDetail_tblUsers]
GO
ALTER TABLE [dbo].[tblCSPDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblCSPDetail_tblUsers1] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[tblUsers] ([UserId])
GO
ALTER TABLE [dbo].[tblCSPDetail] CHECK CONSTRAINT [FK_tblCSPDetail_tblUsers1]
GO
ALTER TABLE [dbo].[tblDepositRequest]  WITH CHECK ADD  CONSTRAINT [FK_tblDepositRequest_tblCSPDetail] FOREIGN KEY([RaisedBy])
REFERENCES [dbo].[tblCSPDetail] ([CSPId])
GO
ALTER TABLE [dbo].[tblDepositRequest] CHECK CONSTRAINT [FK_tblDepositRequest_tblCSPDetail]
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
ALTER TABLE [dbo].[tblTechRequest]  WITH CHECK ADD  CONSTRAINT [FK_tblTechRequest_tblProblemType] FOREIGN KEY([ProblemType])
REFERENCES [dbo].[tblProblemType] ([ProblemTypeId])
GO
ALTER TABLE [dbo].[tblTechRequest] CHECK CONSTRAINT [FK_tblTechRequest_tblProblemType]
GO
ALTER TABLE [dbo].[tblTechRequest]  WITH CHECK ADD  CONSTRAINT [FK_tblTechRequest_tblUsers] FOREIGN KEY([RaisedBy])
REFERENCES [dbo].[tblCSPDetail] ([CSPId])
GO
ALTER TABLE [dbo].[tblTechRequest] CHECK CONSTRAINT [FK_tblTechRequest_tblUsers]
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
ALTER TABLE [dbo].[tblUserDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblUserDetail_tblCity] FOREIGN KEY([CityId])
REFERENCES [dbo].[tblCity] ([CityId])
GO
ALTER TABLE [dbo].[tblUserDetail] CHECK CONSTRAINT [FK_tblUserDetail_tblCity]
GO
ALTER TABLE [dbo].[tblUserDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblUserDetail_tblUsers] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[tblUsers] ([UserId])
GO
ALTER TABLE [dbo].[tblUserDetail] CHECK CONSTRAINT [FK_tblUserDetail_tblUsers]
GO
ALTER TABLE [dbo].[tblUserDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblUserDetail_tblUsers1] FOREIGN KEY([CreaterdBy])
REFERENCES [dbo].[tblUsers] ([UserId])
GO
ALTER TABLE [dbo].[tblUserDetail] CHECK CONSTRAINT [FK_tblUserDetail_tblUsers1]
GO
ALTER TABLE [dbo].[tblUserDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblUserDetail_tblUsers2] FOREIGN KEY([UserId])
REFERENCES [dbo].[tblUsers] ([UserId])
GO
ALTER TABLE [dbo].[tblUserDetail] CHECK CONSTRAINT [FK_tblUserDetail_tblUsers2]
GO
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD  CONSTRAINT [FK_tblUsers_tblStatus] FOREIGN KEY([Status])
REFERENCES [dbo].[tblStatus] ([StatusId])
GO
ALTER TABLE [dbo].[tblUsers] CHECK CONSTRAINT [FK_tblUsers_tblStatus]
GO
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD  CONSTRAINT [FK_tblUsers_tblUsers] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[tblUsers] ([UserId])
GO
ALTER TABLE [dbo].[tblUsers] CHECK CONSTRAINT [FK_tblUsers_tblUsers]
GO
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD  CONSTRAINT [FK_tblUsers_tblUsers1] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[tblUsers] ([UserId])
GO
ALTER TABLE [dbo].[tblUsers] CHECK CONSTRAINT [FK_tblUsers_tblUsers1]
GO
ALTER TABLE [dbo].[tblWithdrawalRequest]  WITH CHECK ADD  CONSTRAINT [FK_tblWithdrawalRequest_tblCSPDetail] FOREIGN KEY([RaisedBy])
REFERENCES [dbo].[tblCSPDetail] ([CSPId])
GO
ALTER TABLE [dbo].[tblWithdrawalRequest] CHECK CONSTRAINT [FK_tblWithdrawalRequest_tblCSPDetail]
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
USE [master]
GO
ALTER DATABASE [eConnectApp] SET  READ_WRITE 
GO
