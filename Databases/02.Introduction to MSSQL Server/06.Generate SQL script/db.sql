USE [master]
GO
/****** Object:  Database [School]    Script Date: 2/7/2015 1:37:15 AM ******/
CREATE DATABASE [School]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'School', FILENAME = N'C:\MSSQL\Data\School.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'School_log', FILENAME = N'C:\MSSQL\Data\School_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [School] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [School].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [School] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [School] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [School] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [School] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [School] SET ARITHABORT OFF 
GO
ALTER DATABASE [School] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [School] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [School] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [School] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [School] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [School] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [School] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [School] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [School] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [School] SET  DISABLE_BROKER 
GO
ALTER DATABASE [School] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [School] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [School] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [School] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [School] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [School] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [School] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [School] SET RECOVERY FULL 
GO
ALTER DATABASE [School] SET  MULTI_USER 
GO
ALTER DATABASE [School] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [School] SET DB_CHAINING OFF 
GO
ALTER DATABASE [School] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [School] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [School] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'School', N'ON'
GO
USE [School]
GO
/****** Object:  User [babatidonka]    Script Date: 2/7/2015 1:37:15 AM ******/
CREATE USER [babatidonka] FOR LOGIN [babatidonka] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [babatidonka]
GO
/****** Object:  Table [dbo].[Classes]    Script Date: 2/7/2015 1:37:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Classes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[MaxStudents] [int] NOT NULL,
 CONSTRAINT [PK_Classes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Students]    Script Date: 2/7/2015 1:37:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Age] [int] NULL,
	[PhoneNumber] [nvarchar](15) NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Classes] ON 

GO
INSERT [dbo].[Classes] ([Id], [Name], [MaxStudents]) VALUES (1, N'Math 101', 100)
GO
INSERT [dbo].[Classes] ([Id], [Name], [MaxStudents]) VALUES (2, N'Biology', 40)
GO
INSERT [dbo].[Classes] ([Id], [Name], [MaxStudents]) VALUES (3, N'Electronics', 15)
GO
INSERT [dbo].[Classes] ([Id], [Name], [MaxStudents]) VALUES (4, N'Astronomy', 40)
GO
INSERT [dbo].[Classes] ([Id], [Name], [MaxStudents]) VALUES (5, N'English Entry', 100)
GO
INSERT [dbo].[Classes] ([Id], [Name], [MaxStudents]) VALUES (6, N'English Advanced', 50)
GO
SET IDENTITY_INSERT [dbo].[Classes] OFF
GO
SET IDENTITY_INSERT [dbo].[Students] ON 

GO
INSERT [dbo].[Students] ([Id], [Name], [Age], [PhoneNumber]) VALUES (1, N'Svetlin Nakov', 22, NULL)
GO
INSERT [dbo].[Students] ([Id], [Name], [Age], [PhoneNumber]) VALUES (2, N'Vladimir Georgiev', 25, N'1234567')
GO
INSERT [dbo].[Students] ([Id], [Name], [Age], [PhoneNumber]) VALUES (3, N'Inchuchuna Chihuahua', 100, N'000-0000-00')
GO
INSERT [dbo].[Students] ([Id], [Name], [Age], [PhoneNumber]) VALUES (4, N'Haralampi Madagskarov', 10, N'1-2-3-4-999')
GO
SET IDENTITY_INSERT [dbo].[Students] OFF
GO
USE [master]
GO
ALTER DATABASE [School] SET  READ_WRITE 
GO
