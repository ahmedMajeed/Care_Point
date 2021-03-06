/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.4206)
    Source Database Engine Edition : Microsoft SQL Server Express Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
USE [master]
GO
/****** Object:  Database [CarePoint]    Script Date: 1/21/2018 2:00:53 PM ******/
CREATE DATABASE [CarePoint]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CarePoint', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.ANDREW\MSSQL\DATA\CarePoint.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CarePoint_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.ANDREW\MSSQL\DATA\CarePoint_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [CarePoint] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CarePoint].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CarePoint] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CarePoint] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CarePoint] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CarePoint] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CarePoint] SET ARITHABORT OFF 
GO
ALTER DATABASE [CarePoint] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CarePoint] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CarePoint] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CarePoint] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CarePoint] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CarePoint] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CarePoint] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CarePoint] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CarePoint] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CarePoint] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CarePoint] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CarePoint] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CarePoint] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CarePoint] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CarePoint] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CarePoint] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CarePoint] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CarePoint] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CarePoint] SET  MULTI_USER 
GO
ALTER DATABASE [CarePoint] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CarePoint] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CarePoint] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CarePoint] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CarePoint] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CarePoint] SET QUERY_STORE = OFF
GO
USE [CarePoint]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [CarePoint]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 1/21/2018 2:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ActiveIngredients]    Script Date: 1/21/2018 2:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActiveIngredients](
	[ID] [bigint] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_ActiveIngredients] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Attachments]    Script Date: 1/21/2018 2:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attachments](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[TypeID] [bigint] NOT NULL,
	[File] [varbinary](max) NOT NULL,
	[Date] [date] NOT NULL,
	[IsRead] [bit] NULL,
	[SpecialistID] [bigint] NOT NULL,
	[CitizenID] [bigint] NOT NULL,
 CONSTRAINT [PK_Attachments] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AttachmentTypes]    Script Date: 1/21/2018 2:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AttachmentTypes](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_AttachmentTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BloodTypes]    Script Date: 1/21/2018 2:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BloodTypes](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_BloodTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CareRequests]    Script Date: 1/21/2018 2:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CareRequests](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[RequestMakerID] [bigint] NOT NULL,
	[MedicalPlaceID] [bigint] NOT NULL,
	[CareUnitID] [bigint] NOT NULL,
	[CaseDescription] [nvarchar](max) NOT NULL,
	[StatusID] [bigint] NOT NULL,
	[RequestTime] [datetime] NOT NULL,
	[IsConfirmed] [bit] NOT NULL,
 CONSTRAINT [PK_CareRequests] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CareUnitMembershipRequests]    Script Date: 1/21/2018 2:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CareUnitMembershipRequests](
	[SpecialistID] [bigint] NOT NULL,
	[CareUnitID] [bigint] NOT NULL,
	[RequestTime] [datetime] NOT NULL,
	[IsConfirmed] [bit] NULL,
 CONSTRAINT [PK_CareUnitSpecialists] PRIMARY KEY CLUSTERED 
(
	[SpecialistID] ASC,
	[CareUnitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CareUnitRatings]    Script Date: 1/21/2018 2:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CareUnitRatings](
	[CitizenID] [bigint] NOT NULL,
	[CareUnitID] [bigint] NOT NULL,
	[Rating] [int] NULL,
 CONSTRAINT [PK_CareUnitRatings] PRIMARY KEY CLUSTERED 
(
	[CitizenID] ASC,
	[CareUnitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CareUnits]    Script Date: 1/21/2018 2:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CareUnits](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[ProviderID] [bigint] NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Cost] [money] NULL,
	[AvailableRoomCount] [int] NULL,
	[LastUpdate] [datetime] NULL,
	[CareUnitTypeID] [bigint] NOT NULL,
 CONSTRAINT [PK_CareUnit] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CareUnitTypes]    Script Date: 1/21/2018 2:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CareUnitTypes](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_CareUnitTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Citizens]    Script Date: 1/21/2018 2:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Citizens](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Gender] [nvarchar](max) NOT NULL,
	[BloodTypeID] [bigint] NULL,
	[Photo] [image] NULL,
	[DateOfBirth] [date] NULL,
 CONSTRAINT [PK_dbo.Citizens] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Diseases]    Script Date: 1/21/2018 2:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Diseases](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[GeneticVotes] [bigint] NULL,
 CONSTRAINT [PK_Diseases] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doses]    Script Date: 1/21/2018 2:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doses](
	[HistoryRecordID] [bigint] NOT NULL,
	[MedicineID] [bigint] NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Doses] PRIMARY KEY CLUSTERED 
(
	[HistoryRecordID] ASC,
	[MedicineID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HistoryRecordDiseases]    Script Date: 1/21/2018 2:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HistoryRecordDiseases](
	[HistoryRecordID] [bigint] NOT NULL,
	[DiseaseID] [bigint] NOT NULL,
 CONSTRAINT [PK_HistoryRecordDiseases] PRIMARY KEY CLUSTERED 
(
	[HistoryRecordID] ASC,
	[DiseaseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HistoryRecords]    Script Date: 1/21/2018 2:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HistoryRecords](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Date] [date] NOT NULL,
	[Remarks] [nvarchar](max) NULL,
	[IsRead] [bit] NULL,
	[CitizenID] [bigint] NOT NULL,
	[MedicalPlaceID] [bigint] NULL,
	[SpecialistID] [bigint] NOT NULL,
 CONSTRAINT [PK_HistoryRecords] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HistoryRecordSymptoms]    Script Date: 1/21/2018 2:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HistoryRecordSymptoms](
	[HistoryRecordID] [bigint] NOT NULL,
	[SymptomID] [bigint] NOT NULL,
 CONSTRAINT [PK_HistoryRecordSymptoms] PRIMARY KEY CLUSTERED 
(
	[HistoryRecordID] ASC,
	[SymptomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MedicalPlace]    Script Date: 1/21/2018 2:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicalPlace](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[TypeID] [bigint] NOT NULL,
	[Location] [geography] NOT NULL,
	[Photo] [image] NULL,
	[IsConfirmed] [bit] NOT NULL,
	[Permission] [image] NULL,
	[Description] [nvarchar](max) NULL,
	[OwnerID] [bigint] NULL,
 CONSTRAINT [PK_MedicalGroup] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MedicalPlaceAdmins]    Script Date: 1/21/2018 2:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicalPlaceAdmins](
	[SpecialistID] [bigint] NOT NULL,
	[MedicalPlaceID] [bigint] NOT NULL,
 CONSTRAINT [PK_MedicalGroupAdmins] PRIMARY KEY CLUSTERED 
(
	[SpecialistID] ASC,
	[MedicalPlaceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MedicalPlaceTypes]    Script Date: 1/21/2018 2:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicalPlaceTypes](
	[ID] [bigint] NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_MedicalGroupTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MedicineActiveIngredients]    Script Date: 1/21/2018 2:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicineActiveIngredients](
	[MedicineID] [bigint] NOT NULL,
	[ActiveIngredientID] [bigint] NOT NULL,
	[Concentration] [float] NOT NULL,
 CONSTRAINT [PK_MedicineActiveIngredients] PRIMARY KEY CLUSTERED 
(
	[MedicineID] ASC,
	[ActiveIngredientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MedicineForms]    Script Date: 1/21/2018 2:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicineForms](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_MedicineForms] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicines]    Script Date: 1/21/2018 2:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicines](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Price] [money] NOT NULL,
	[Usage] [nvarchar](max) NULL,
	[SideEffects] [nvarchar](max) NULL,
	[FormID] [bigint] NOT NULL,
 CONSTRAINT [PK_Medicines] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notifications]    Script Date: 1/21/2018 2:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notifications](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Text] [nvarchar](max) NOT NULL,
	[Time] [datetime] NOT NULL,
	[Read] [nchar](10) NOT NULL,
	[CitizenID] [bigint] NOT NULL,
 CONSTRAINT [PK_Notifications] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pharmacies]    Script Date: 1/21/2018 2:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pharmacies](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[OwnerID] [bigint] NULL,
	[Location] [geography] NOT NULL,
	[Photo] [image] NULL,
	[IsConfirmed] [bit] NOT NULL,
	[Permission] [image] NULL,
	[MedicalPlaceID] [bigint] NULL,
 CONSTRAINT [PK_Pharmacies] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PharmacyMedicines]    Script Date: 1/21/2018 2:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PharmacyMedicines](
	[PharmacyID] [bigint] NOT NULL,
	[MedicineID] [bigint] NOT NULL,
	[ExpirationDate] [date] NOT NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_PharmacyMedicines] PRIMARY KEY CLUSTERED 
(
	[PharmacyID] ASC,
	[MedicineID] ASC,
	[ExpirationDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PharmacyMembershipRequests]    Script Date: 1/21/2018 2:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PharmacyMembershipRequests](
	[SpecialistID] [bigint] NOT NULL,
	[PharmacyID] [bigint] NOT NULL,
	[RequestTime] [datetime] NOT NULL,
	[IsConfirmed] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PharmacyRatings]    Script Date: 1/21/2018 2:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PharmacyRatings](
	[CitizenID] [bigint] NOT NULL,
	[PharmacyID] [bigint] NOT NULL,
	[Rating] [int] NULL,
 CONSTRAINT [PK_PharmacyRatings] PRIMARY KEY CLUSTERED 
(
	[CitizenID] ASC,
	[PharmacyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReceiptMedicines]    Script Date: 1/21/2018 2:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReceiptMedicines](
	[ReceiptID] [bigint] NOT NULL,
	[MedicineID] [bigint] NOT NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_ReceiptMedicines] PRIMARY KEY CLUSTERED 
(
	[ReceiptID] ASC,
	[MedicineID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Receipts]    Script Date: 1/21/2018 2:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Receipts](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[PharmacyID] [bigint] NOT NULL,
	[PharmacistID] [bigint] NOT NULL,
	[CitizenID] [bigint] NOT NULL,
	[Time] [datetime] NOT NULL,
 CONSTRAINT [PK_Receipts] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RelationTypes]    Script Date: 1/21/2018 2:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RelationTypes](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_RelationTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Relatives]    Script Date: 1/21/2018 2:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Relatives](
	[CitizenID] [bigint] NOT NULL,
	[RelativeID] [bigint] NOT NULL,
	[IsRead] [bit] NULL,
	[RelationTypeID] [bigint] NOT NULL,
 CONSTRAINT [PK_Relatives] PRIMARY KEY CLUSTERED 
(
	[CitizenID] ASC,
	[RelativeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RequestStatuses]    Script Date: 1/21/2018 2:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RequestStatuses](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_SOSStatuses] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 1/21/2018 2:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiceCategories]    Script Date: 1/21/2018 2:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceCategories](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_ServiceCategories] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiceMembershipRequests]    Script Date: 1/21/2018 2:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceMembershipRequests](
	[SpecialistID] [bigint] NOT NULL,
	[ServiceID] [bigint] NOT NULL,
	[RequestTime] [datetime] NOT NULL,
	[IsConfirmed] [bit] NOT NULL,
 CONSTRAINT [PK_MedicalGroupDoctors] PRIMARY KEY CLUSTERED 
(
	[SpecialistID] ASC,
	[ServiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiceRatings]    Script Date: 1/21/2018 2:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceRatings](
	[CitizenID] [bigint] NOT NULL,
	[ServiceID] [bigint] NOT NULL,
	[Rating] [float] NULL,
 CONSTRAINT [PK_ServiceRatings] PRIMARY KEY CLUSTERED 
(
	[CitizenID] ASC,
	[ServiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Services]    Script Date: 1/21/2018 2:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Services](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[CategoryID] [bigint] NOT NULL,
	[Cost] [money] NULL,
	[ProviderID] [bigint] NULL,
 CONSTRAINT [PK_Services] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SOSs]    Script Date: 1/21/2018 2:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SOSs](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Location] [geography] NOT NULL,
	[Time] [datetime] NOT NULL,
	[IsAccepted] [bit] NOT NULL,
	[StatusID] [bigint] NOT NULL,
	[SenderID] [bigint] NOT NULL,
	[MedicalPlaceID] [bigint] NULL,
 CONSTRAINT [PK_SOSs] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Specialists]    Script Date: 1/21/2018 2:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Specialists](
	[ID] [bigint] NOT NULL,
	[ProfessionLicense] [image] NULL,
	[SpecialityID] [bigint] NOT NULL,
 CONSTRAINT [PK_Doctors] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Specialities]    Script Date: 1/21/2018 2:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Specialities](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Specialities] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symptoms]    Script Date: 1/21/2018 2:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symptoms](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Symptoms] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TimeSlots]    Script Date: 1/21/2018 2:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeSlots](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Start] [time](7) NULL,
	[Finish] [time](7) NULL,
	[WorkdayID] [bigint] NULL,
 CONSTRAINT [PK_TimeSlots] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserClaims]    Script Date: 1/21/2018 2:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [bigint] NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.UserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserLogins]    Script Date: 1/21/2018 2:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [bigint] NOT NULL,
 CONSTRAINT [PK_dbo.UserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 1/21/2018 2:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoles](
	[UserId] [bigint] NOT NULL,
	[RoleId] [bigint] NOT NULL,
 CONSTRAINT [PK_dbo.UserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkSlots]    Script Date: 1/21/2018 2:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkSlots](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[DayName] [nvarchar](max) NULL,
	[EndTime] [time](7) NULL,
	[StartTime] [time](7) NULL,
	[ServiceID] [bigint] NULL,
 CONSTRAINT [PK_Workdays] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 1/21/2018 2:00:53 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[Citizens]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 1/21/2018 2:00:53 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[Roles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserId]    Script Date: 1/21/2018 2:00:53 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[UserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserId]    Script Date: 1/21/2018 2:00:53 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[UserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RoleId]    Script Date: 1/21/2018 2:00:53 PM ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[UserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserId]    Script Date: 1/21/2018 2:00:53 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[UserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Attachments] ADD  CONSTRAINT [DF_Attachments_IsRead]  DEFAULT ((0)) FOR [IsRead]
GO
ALTER TABLE [dbo].[CareRequests] ADD  CONSTRAINT [DF_CareRequests_isAccepted]  DEFAULT ((0)) FOR [StatusID]
GO
ALTER TABLE [dbo].[CareRequests] ADD  CONSTRAINT [DF_CareRequests_IsRead1]  DEFAULT ((0)) FOR [IsConfirmed]
GO
ALTER TABLE [dbo].[CareUnitMembershipRequests] ADD  CONSTRAINT [DF_CareUnitSpecialists_Confirmed]  DEFAULT ((0)) FOR [IsConfirmed]
GO
ALTER TABLE [dbo].[Citizens] ADD  CONSTRAINT [DF_Citizens_Gender]  DEFAULT ('Male') FOR [Gender]
GO
ALTER TABLE [dbo].[HistoryRecords] ADD  CONSTRAINT [DF_HistoryRecords_IsRead]  DEFAULT ((0)) FOR [IsRead]
GO
ALTER TABLE [dbo].[MedicalPlace] ADD  CONSTRAINT [DF_MedicalGroup_Confirmed]  DEFAULT ((0)) FOR [IsConfirmed]
GO
ALTER TABLE [dbo].[Notifications] ADD  CONSTRAINT [DF_Notifications_Read]  DEFAULT ((0)) FOR [Read]
GO
ALTER TABLE [dbo].[Pharmacies] ADD  CONSTRAINT [DF_Pharmacies_Confirmed]  DEFAULT ((0)) FOR [IsConfirmed]
GO
ALTER TABLE [dbo].[PharmacyMembershipRequests] ADD  CONSTRAINT [DF_PharmacySpecialists_Confirmed_1]  DEFAULT ((0)) FOR [IsConfirmed]
GO
ALTER TABLE [dbo].[Relatives] ADD  CONSTRAINT [DF_Relatives_IsRead]  DEFAULT ((0)) FOR [IsRead]
GO
ALTER TABLE [dbo].[ServiceMembershipRequests] ADD  CONSTRAINT [DF_MedicalGroupDoctors_Confirmed]  DEFAULT ((0)) FOR [IsConfirmed]
GO
ALTER TABLE [dbo].[SOSs] ADD  CONSTRAINT [DF_SOSs_IsConfirmed]  DEFAULT ((0)) FOR [IsAccepted]
GO
ALTER TABLE [dbo].[Attachments]  WITH CHECK ADD  CONSTRAINT [FK_Attachments_AttachmentTypes] FOREIGN KEY([TypeID])
REFERENCES [dbo].[AttachmentTypes] ([ID])
GO
ALTER TABLE [dbo].[Attachments] CHECK CONSTRAINT [FK_Attachments_AttachmentTypes]
GO
ALTER TABLE [dbo].[Attachments]  WITH CHECK ADD  CONSTRAINT [FK_Attachments_Citizens] FOREIGN KEY([CitizenID])
REFERENCES [dbo].[Citizens] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Attachments] CHECK CONSTRAINT [FK_Attachments_Citizens]
GO
ALTER TABLE [dbo].[Attachments]  WITH CHECK ADD  CONSTRAINT [FK_Attachments_Specialists] FOREIGN KEY([SpecialistID])
REFERENCES [dbo].[Specialists] ([ID])
GO
ALTER TABLE [dbo].[Attachments] CHECK CONSTRAINT [FK_Attachments_Specialists]
GO
ALTER TABLE [dbo].[CareRequests]  WITH CHECK ADD  CONSTRAINT [FK_CareRequests_CareUnit] FOREIGN KEY([CareUnitID])
REFERENCES [dbo].[CareUnits] ([ID])
GO
ALTER TABLE [dbo].[CareRequests] CHECK CONSTRAINT [FK_CareRequests_CareUnit]
GO
ALTER TABLE [dbo].[CareRequests]  WITH CHECK ADD  CONSTRAINT [FK_CareRequests_MedicalPlace] FOREIGN KEY([MedicalPlaceID])
REFERENCES [dbo].[MedicalPlace] ([ID])
GO
ALTER TABLE [dbo].[CareRequests] CHECK CONSTRAINT [FK_CareRequests_MedicalPlace]
GO
ALTER TABLE [dbo].[CareRequests]  WITH CHECK ADD  CONSTRAINT [FK_CareRequests_RequestStatuses] FOREIGN KEY([StatusID])
REFERENCES [dbo].[RequestStatuses] ([ID])
GO
ALTER TABLE [dbo].[CareRequests] CHECK CONSTRAINT [FK_CareRequests_RequestStatuses]
GO
ALTER TABLE [dbo].[CareRequests]  WITH CHECK ADD  CONSTRAINT [FK_CareRequests_Specialists] FOREIGN KEY([RequestMakerID])
REFERENCES [dbo].[Specialists] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CareRequests] CHECK CONSTRAINT [FK_CareRequests_Specialists]
GO
ALTER TABLE [dbo].[CareUnitMembershipRequests]  WITH CHECK ADD  CONSTRAINT [FK_CareUnitSpecialists_CareUnit] FOREIGN KEY([CareUnitID])
REFERENCES [dbo].[CareUnits] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CareUnitMembershipRequests] CHECK CONSTRAINT [FK_CareUnitSpecialists_CareUnit]
GO
ALTER TABLE [dbo].[CareUnitMembershipRequests]  WITH CHECK ADD  CONSTRAINT [FK_CareUnitSpecialists_Specialists] FOREIGN KEY([SpecialistID])
REFERENCES [dbo].[Specialists] ([ID])
GO
ALTER TABLE [dbo].[CareUnitMembershipRequests] CHECK CONSTRAINT [FK_CareUnitSpecialists_Specialists]
GO
ALTER TABLE [dbo].[CareUnitRatings]  WITH CHECK ADD  CONSTRAINT [FK_CareUnitRatings_CareUnits] FOREIGN KEY([CareUnitID])
REFERENCES [dbo].[CareUnits] ([ID])
GO
ALTER TABLE [dbo].[CareUnitRatings] CHECK CONSTRAINT [FK_CareUnitRatings_CareUnits]
GO
ALTER TABLE [dbo].[CareUnitRatings]  WITH CHECK ADD  CONSTRAINT [FK_CareUnitRatings_Citizens] FOREIGN KEY([CitizenID])
REFERENCES [dbo].[Citizens] ([Id])
GO
ALTER TABLE [dbo].[CareUnitRatings] CHECK CONSTRAINT [FK_CareUnitRatings_Citizens]
GO
ALTER TABLE [dbo].[CareUnits]  WITH CHECK ADD  CONSTRAINT [FK_CareUnit_CareUnitTypes] FOREIGN KEY([CareUnitTypeID])
REFERENCES [dbo].[CareUnitTypes] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CareUnits] CHECK CONSTRAINT [FK_CareUnit_CareUnitTypes]
GO
ALTER TABLE [dbo].[Citizens]  WITH CHECK ADD  CONSTRAINT [FK_Citizens_BloodTypes] FOREIGN KEY([BloodTypeID])
REFERENCES [dbo].[BloodTypes] ([ID])
ON UPDATE SET NULL
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Citizens] CHECK CONSTRAINT [FK_Citizens_BloodTypes]
GO
ALTER TABLE [dbo].[Doses]  WITH CHECK ADD  CONSTRAINT [FK_Doses_HistoryRecords] FOREIGN KEY([HistoryRecordID])
REFERENCES [dbo].[HistoryRecords] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Doses] CHECK CONSTRAINT [FK_Doses_HistoryRecords]
GO
ALTER TABLE [dbo].[Doses]  WITH CHECK ADD  CONSTRAINT [FK_Doses_Medicines] FOREIGN KEY([MedicineID])
REFERENCES [dbo].[Medicines] ([ID])
GO
ALTER TABLE [dbo].[Doses] CHECK CONSTRAINT [FK_Doses_Medicines]
GO
ALTER TABLE [dbo].[HistoryRecordDiseases]  WITH CHECK ADD  CONSTRAINT [FK_HistoryRecordDiseases_Diseases] FOREIGN KEY([DiseaseID])
REFERENCES [dbo].[Diseases] ([ID])
GO
ALTER TABLE [dbo].[HistoryRecordDiseases] CHECK CONSTRAINT [FK_HistoryRecordDiseases_Diseases]
GO
ALTER TABLE [dbo].[HistoryRecordDiseases]  WITH CHECK ADD  CONSTRAINT [FK_HistoryRecordDiseases_HistoryRecords] FOREIGN KEY([HistoryRecordID])
REFERENCES [dbo].[HistoryRecords] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HistoryRecordDiseases] CHECK CONSTRAINT [FK_HistoryRecordDiseases_HistoryRecords]
GO
ALTER TABLE [dbo].[HistoryRecords]  WITH CHECK ADD  CONSTRAINT [FK_HistoryRecords_Citizens] FOREIGN KEY([CitizenID])
REFERENCES [dbo].[Citizens] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HistoryRecords] CHECK CONSTRAINT [FK_HistoryRecords_Citizens]
GO
ALTER TABLE [dbo].[HistoryRecords]  WITH CHECK ADD  CONSTRAINT [FK_HistoryRecords_MedicalPlace] FOREIGN KEY([MedicalPlaceID])
REFERENCES [dbo].[MedicalPlace] ([ID])
GO
ALTER TABLE [dbo].[HistoryRecords] CHECK CONSTRAINT [FK_HistoryRecords_MedicalPlace]
GO
ALTER TABLE [dbo].[HistoryRecords]  WITH CHECK ADD  CONSTRAINT [FK_HistoryRecords_Specialists] FOREIGN KEY([SpecialistID])
REFERENCES [dbo].[Specialists] ([ID])
GO
ALTER TABLE [dbo].[HistoryRecords] CHECK CONSTRAINT [FK_HistoryRecords_Specialists]
GO
ALTER TABLE [dbo].[HistoryRecordSymptoms]  WITH CHECK ADD  CONSTRAINT [FK_HistoryRecordSymptoms_HistoryRecords] FOREIGN KEY([HistoryRecordID])
REFERENCES [dbo].[HistoryRecords] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HistoryRecordSymptoms] CHECK CONSTRAINT [FK_HistoryRecordSymptoms_HistoryRecords]
GO
ALTER TABLE [dbo].[HistoryRecordSymptoms]  WITH CHECK ADD  CONSTRAINT [FK_HistoryRecordSymptoms_Symptoms] FOREIGN KEY([SymptomID])
REFERENCES [dbo].[Symptoms] ([ID])
GO
ALTER TABLE [dbo].[HistoryRecordSymptoms] CHECK CONSTRAINT [FK_HistoryRecordSymptoms_Symptoms]
GO
ALTER TABLE [dbo].[MedicalPlace]  WITH CHECK ADD  CONSTRAINT [FK_MedicalGroup_Citizens] FOREIGN KEY([OwnerID])
REFERENCES [dbo].[Specialists] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MedicalPlace] CHECK CONSTRAINT [FK_MedicalGroup_Citizens]
GO
ALTER TABLE [dbo].[MedicalPlace]  WITH CHECK ADD  CONSTRAINT [FK_MedicalGroup_MedicalGroupTypes] FOREIGN KEY([TypeID])
REFERENCES [dbo].[MedicalPlaceTypes] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MedicalPlace] CHECK CONSTRAINT [FK_MedicalGroup_MedicalGroupTypes]
GO
ALTER TABLE [dbo].[MedicalPlaceAdmins]  WITH CHECK ADD  CONSTRAINT [FK_MedicalGroupAdmins_Citizens] FOREIGN KEY([SpecialistID])
REFERENCES [dbo].[Specialists] ([ID])
GO
ALTER TABLE [dbo].[MedicalPlaceAdmins] CHECK CONSTRAINT [FK_MedicalGroupAdmins_Citizens]
GO
ALTER TABLE [dbo].[MedicalPlaceAdmins]  WITH CHECK ADD  CONSTRAINT [FK_MedicalGroupAdmins_MedicalGroup] FOREIGN KEY([MedicalPlaceID])
REFERENCES [dbo].[MedicalPlace] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MedicalPlaceAdmins] CHECK CONSTRAINT [FK_MedicalGroupAdmins_MedicalGroup]
GO
ALTER TABLE [dbo].[MedicineActiveIngredients]  WITH CHECK ADD  CONSTRAINT [FK_MedicineActiveIngredients_ActiveIngredients] FOREIGN KEY([ActiveIngredientID])
REFERENCES [dbo].[ActiveIngredients] ([ID])
GO
ALTER TABLE [dbo].[MedicineActiveIngredients] CHECK CONSTRAINT [FK_MedicineActiveIngredients_ActiveIngredients]
GO
ALTER TABLE [dbo].[MedicineActiveIngredients]  WITH CHECK ADD  CONSTRAINT [FK_MedicineActiveIngredients_Medicines] FOREIGN KEY([MedicineID])
REFERENCES [dbo].[Medicines] ([ID])
GO
ALTER TABLE [dbo].[MedicineActiveIngredients] CHECK CONSTRAINT [FK_MedicineActiveIngredients_Medicines]
GO
ALTER TABLE [dbo].[Medicines]  WITH CHECK ADD  CONSTRAINT [FK_Medicines_MedicineForms] FOREIGN KEY([FormID])
REFERENCES [dbo].[MedicineForms] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Medicines] CHECK CONSTRAINT [FK_Medicines_MedicineForms]
GO
ALTER TABLE [dbo].[Notifications]  WITH CHECK ADD  CONSTRAINT [FK_Notifications_Citizens] FOREIGN KEY([CitizenID])
REFERENCES [dbo].[Citizens] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Notifications] CHECK CONSTRAINT [FK_Notifications_Citizens]
GO
ALTER TABLE [dbo].[Pharmacies]  WITH CHECK ADD  CONSTRAINT [FK_Pharmacies_MedicalPlace] FOREIGN KEY([MedicalPlaceID])
REFERENCES [dbo].[MedicalPlace] ([ID])
GO
ALTER TABLE [dbo].[Pharmacies] CHECK CONSTRAINT [FK_Pharmacies_MedicalPlace]
GO
ALTER TABLE [dbo].[Pharmacies]  WITH CHECK ADD  CONSTRAINT [FK_Pharmacies_Specialists] FOREIGN KEY([OwnerID])
REFERENCES [dbo].[Specialists] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Pharmacies] CHECK CONSTRAINT [FK_Pharmacies_Specialists]
GO
ALTER TABLE [dbo].[PharmacyMedicines]  WITH CHECK ADD  CONSTRAINT [FK_PharmacyMedicines_Medicines] FOREIGN KEY([MedicineID])
REFERENCES [dbo].[Medicines] ([ID])
GO
ALTER TABLE [dbo].[PharmacyMedicines] CHECK CONSTRAINT [FK_PharmacyMedicines_Medicines]
GO
ALTER TABLE [dbo].[PharmacyMedicines]  WITH CHECK ADD  CONSTRAINT [FK_PharmacyMedicines_Pharmacies] FOREIGN KEY([PharmacyID])
REFERENCES [dbo].[Pharmacies] ([ID])
GO
ALTER TABLE [dbo].[PharmacyMedicines] CHECK CONSTRAINT [FK_PharmacyMedicines_Pharmacies]
GO
ALTER TABLE [dbo].[PharmacyMembershipRequests]  WITH CHECK ADD  CONSTRAINT [FK_PharmacySpecialists_Pharmacies] FOREIGN KEY([PharmacyID])
REFERENCES [dbo].[Pharmacies] ([ID])
GO
ALTER TABLE [dbo].[PharmacyMembershipRequests] CHECK CONSTRAINT [FK_PharmacySpecialists_Pharmacies]
GO
ALTER TABLE [dbo].[PharmacyMembershipRequests]  WITH CHECK ADD  CONSTRAINT [FK_PharmacySpecialists_Specialists] FOREIGN KEY([SpecialistID])
REFERENCES [dbo].[Specialists] ([ID])
GO
ALTER TABLE [dbo].[PharmacyMembershipRequests] CHECK CONSTRAINT [FK_PharmacySpecialists_Specialists]
GO
ALTER TABLE [dbo].[PharmacyRatings]  WITH CHECK ADD  CONSTRAINT [FK_PharmacyRatings_Citizens] FOREIGN KEY([CitizenID])
REFERENCES [dbo].[Citizens] ([Id])
GO
ALTER TABLE [dbo].[PharmacyRatings] CHECK CONSTRAINT [FK_PharmacyRatings_Citizens]
GO
ALTER TABLE [dbo].[PharmacyRatings]  WITH CHECK ADD  CONSTRAINT [FK_PharmacyRatings_Pharmacies] FOREIGN KEY([PharmacyID])
REFERENCES [dbo].[Pharmacies] ([ID])
GO
ALTER TABLE [dbo].[PharmacyRatings] CHECK CONSTRAINT [FK_PharmacyRatings_Pharmacies]
GO
ALTER TABLE [dbo].[ReceiptMedicines]  WITH CHECK ADD  CONSTRAINT [FK_ReceiptMedicines_Medicines] FOREIGN KEY([MedicineID])
REFERENCES [dbo].[Medicines] ([ID])
GO
ALTER TABLE [dbo].[ReceiptMedicines] CHECK CONSTRAINT [FK_ReceiptMedicines_Medicines]
GO
ALTER TABLE [dbo].[ReceiptMedicines]  WITH CHECK ADD  CONSTRAINT [FK_ReceiptMedicines_Receipts] FOREIGN KEY([ReceiptID])
REFERENCES [dbo].[Receipts] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ReceiptMedicines] CHECK CONSTRAINT [FK_ReceiptMedicines_Receipts]
GO
ALTER TABLE [dbo].[Receipts]  WITH CHECK ADD  CONSTRAINT [FK_Receipts_Citizens] FOREIGN KEY([CitizenID])
REFERENCES [dbo].[Citizens] ([Id])
GO
ALTER TABLE [dbo].[Receipts] CHECK CONSTRAINT [FK_Receipts_Citizens]
GO
ALTER TABLE [dbo].[Receipts]  WITH CHECK ADD  CONSTRAINT [FK_Receipts_Pharmacies] FOREIGN KEY([PharmacyID])
REFERENCES [dbo].[Pharmacies] ([ID])
GO
ALTER TABLE [dbo].[Receipts] CHECK CONSTRAINT [FK_Receipts_Pharmacies]
GO
ALTER TABLE [dbo].[Receipts]  WITH CHECK ADD  CONSTRAINT [FK_Receipts_Specialists] FOREIGN KEY([PharmacistID])
REFERENCES [dbo].[Specialists] ([ID])
GO
ALTER TABLE [dbo].[Receipts] CHECK CONSTRAINT [FK_Receipts_Specialists]
GO
ALTER TABLE [dbo].[Relatives]  WITH CHECK ADD  CONSTRAINT [FK_Relatives_Citizens] FOREIGN KEY([CitizenID])
REFERENCES [dbo].[Citizens] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Relatives] CHECK CONSTRAINT [FK_Relatives_Citizens]
GO
ALTER TABLE [dbo].[Relatives]  WITH CHECK ADD  CONSTRAINT [FK_Relatives_Citizens1] FOREIGN KEY([RelativeID])
REFERENCES [dbo].[Citizens] ([Id])
GO
ALTER TABLE [dbo].[Relatives] CHECK CONSTRAINT [FK_Relatives_Citizens1]
GO
ALTER TABLE [dbo].[Relatives]  WITH CHECK ADD  CONSTRAINT [FK_Relatives_RelationTypes] FOREIGN KEY([RelationTypeID])
REFERENCES [dbo].[RelationTypes] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Relatives] CHECK CONSTRAINT [FK_Relatives_RelationTypes]
GO
ALTER TABLE [dbo].[ServiceMembershipRequests]  WITH CHECK ADD  CONSTRAINT [FK_MedicalGroupDoctors_Doctors] FOREIGN KEY([SpecialistID])
REFERENCES [dbo].[Specialists] ([ID])
GO
ALTER TABLE [dbo].[ServiceMembershipRequests] CHECK CONSTRAINT [FK_MedicalGroupDoctors_Doctors]
GO
ALTER TABLE [dbo].[ServiceMembershipRequests]  WITH CHECK ADD  CONSTRAINT [FK_MedicalGroupDoctors_MedicalGroup] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Services] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ServiceMembershipRequests] CHECK CONSTRAINT [FK_MedicalGroupDoctors_MedicalGroup]
GO
ALTER TABLE [dbo].[ServiceRatings]  WITH CHECK ADD  CONSTRAINT [FK_ServiceRatings_Citizens] FOREIGN KEY([CitizenID])
REFERENCES [dbo].[Citizens] ([Id])
GO
ALTER TABLE [dbo].[ServiceRatings] CHECK CONSTRAINT [FK_ServiceRatings_Citizens]
GO
ALTER TABLE [dbo].[ServiceRatings]  WITH CHECK ADD  CONSTRAINT [FK_ServiceRatings_Services] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Services] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ServiceRatings] CHECK CONSTRAINT [FK_ServiceRatings_Services]
GO
ALTER TABLE [dbo].[Services]  WITH CHECK ADD  CONSTRAINT [FK_Services_MedicalGroup] FOREIGN KEY([ProviderID])
REFERENCES [dbo].[MedicalPlace] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Services] CHECK CONSTRAINT [FK_Services_MedicalGroup]
GO
ALTER TABLE [dbo].[Services]  WITH CHECK ADD  CONSTRAINT [FK_Services_ServiceCategories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[ServiceCategories] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Services] CHECK CONSTRAINT [FK_Services_ServiceCategories]
GO
ALTER TABLE [dbo].[SOSs]  WITH CHECK ADD  CONSTRAINT [FK_SOSs_Citizens] FOREIGN KEY([SenderID])
REFERENCES [dbo].[Citizens] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SOSs] CHECK CONSTRAINT [FK_SOSs_Citizens]
GO
ALTER TABLE [dbo].[SOSs]  WITH CHECK ADD  CONSTRAINT [FK_SOSs_MedicalPlace] FOREIGN KEY([MedicalPlaceID])
REFERENCES [dbo].[MedicalPlace] ([ID])
GO
ALTER TABLE [dbo].[SOSs] CHECK CONSTRAINT [FK_SOSs_MedicalPlace]
GO
ALTER TABLE [dbo].[SOSs]  WITH CHECK ADD  CONSTRAINT [FK_SOSs_SOSStatuses] FOREIGN KEY([StatusID])
REFERENCES [dbo].[RequestStatuses] ([ID])
GO
ALTER TABLE [dbo].[SOSs] CHECK CONSTRAINT [FK_SOSs_SOSStatuses]
GO
ALTER TABLE [dbo].[Specialists]  WITH CHECK ADD  CONSTRAINT [FK_Doctors_Citizens] FOREIGN KEY([ID])
REFERENCES [dbo].[Citizens] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Specialists] CHECK CONSTRAINT [FK_Doctors_Citizens]
GO
ALTER TABLE [dbo].[Specialists]  WITH CHECK ADD  CONSTRAINT [FK_Specialists_Specialities] FOREIGN KEY([SpecialityID])
REFERENCES [dbo].[Specialities] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Specialists] CHECK CONSTRAINT [FK_Specialists_Specialities]
GO
ALTER TABLE [dbo].[TimeSlots]  WITH CHECK ADD  CONSTRAINT [FK_TimeSlots_Workdays] FOREIGN KEY([WorkdayID])
REFERENCES [dbo].[WorkSlots] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TimeSlots] CHECK CONSTRAINT [FK_TimeSlots_Workdays]
GO
ALTER TABLE [dbo].[UserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UserClaims_dbo.Citizens_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Citizens] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserClaims] CHECK CONSTRAINT [FK_dbo.UserClaims_dbo.Citizens_UserId]
GO
ALTER TABLE [dbo].[UserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UserLogins_dbo.Citizens_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Citizens] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserLogins] CHECK CONSTRAINT [FK_dbo.UserLogins_dbo.Citizens_UserId]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UserRoles_dbo.Citizens_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Citizens] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_dbo.UserRoles_dbo.Citizens_UserId]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UserRoles_dbo.Roles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_dbo.UserRoles_dbo.Roles_RoleId]
GO
ALTER TABLE [dbo].[WorkSlots]  WITH CHECK ADD  CONSTRAINT [FK_Workdays_Services] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Services] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[WorkSlots] CHECK CONSTRAINT [FK_Workdays_Services]
GO
USE [master]
GO
ALTER DATABASE [CarePoint] SET  READ_WRITE 
GO
