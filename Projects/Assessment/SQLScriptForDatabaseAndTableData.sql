USE [master]
GO
/****** Object:  Database [Assesment]    Script Date: 08-08-2023 11.07.05 AM ******/
CREATE DATABASE [Assesment]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Assesment', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Assesment.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Assesment_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Assesment_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Assesment] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Assesment].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Assesment] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Assesment] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Assesment] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Assesment] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Assesment] SET ARITHABORT OFF 
GO
ALTER DATABASE [Assesment] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Assesment] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Assesment] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Assesment] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Assesment] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Assesment] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Assesment] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Assesment] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Assesment] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Assesment] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Assesment] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Assesment] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Assesment] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Assesment] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Assesment] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Assesment] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Assesment] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Assesment] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Assesment] SET  MULTI_USER 
GO
ALTER DATABASE [Assesment] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Assesment] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Assesment] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Assesment] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Assesment] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Assesment] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Assesment] SET QUERY_STORE = ON
GO
ALTER DATABASE [Assesment] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Assesment]
GO
/****** Object:  UserDefinedTableType [dbo].[EmployeeHobbiesType]    Script Date: 08-08-2023 11.07.06 AM ******/
CREATE TYPE [dbo].[EmployeeHobbiesType] AS TABLE(
	[Id] [int] NULL,
	[EmployeeId] [int] NULL,
	[HobbyId] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[IsActive] [bit] NULL,
	[ModifiedDate] [datetime] NULL
)
GO
/****** Object:  Table [dbo].[City]    Script Date: 08-08-2023 11.07.06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[StateId] [int] NOT NULL,
 CONSTRAINT [PK_City_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 08-08-2023 11.07.06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeId] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeName] [nvarchar](128) NOT NULL,
	[EmployeeDOB] [datetime] NOT NULL,
	[Gender] [int] NOT NULL,
	[Address] [nvarchar](max) NULL,
	[State] [int] NOT NULL,
	[City] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[IsActive] [bit] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeHobbies]    Script Date: 08-08-2023 11.07.06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeHobbies](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[HobbyId] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[IsActive] [bit] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_EmployeeHobbies] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeePhoto]    Script Date: 08-08-2023 11.07.06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeePhoto](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[Photo] [varbinary](max) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[IsActive] [bit] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_EmployeePhoto] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 08-08-2023 11.07.06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Gender_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hobbies]    Script Date: 08-08-2023 11.07.06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hobbies](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Hobbies_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Logs]    Script Date: 08-08-2023 11.07.06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Logs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LogLevel] [nvarchar](50) NULL,
	[Message] [nvarchar](max) NULL,
	[InputParameters] [nvarchar](max) NULL,
	[Exception] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_Logs_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[State]    Script Date: 08-08-2023 11.07.06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[State](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_State_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[City] ON 
GO
INSERT [dbo].[City] ([Id], [Name], [StateId]) VALUES (1, N'Chennai', 23)
GO
INSERT [dbo].[City] ([Id], [Name], [StateId]) VALUES (2, N'Coimbatore', 23)
GO
INSERT [dbo].[City] ([Id], [Name], [StateId]) VALUES (3, N'Madurai', 23)
GO
INSERT [dbo].[City] ([Id], [Name], [StateId]) VALUES (4, N'Tiruchirappalli', 23)
GO
INSERT [dbo].[City] ([Id], [Name], [StateId]) VALUES (5, N'Salem', 23)
GO
INSERT [dbo].[City] ([Id], [Name], [StateId]) VALUES (6, N'Tirunelveli', 23)
GO
INSERT [dbo].[City] ([Id], [Name], [StateId]) VALUES (7, N'Vellore', 23)
GO
INSERT [dbo].[City] ([Id], [Name], [StateId]) VALUES (8, N'Thoothukudi', 23)
GO
INSERT [dbo].[City] ([Id], [Name], [StateId]) VALUES (9, N'Thanjavur', 23)
GO
INSERT [dbo].[City] ([Id], [Name], [StateId]) VALUES (10, N'Erode', 23)
GO
INSERT [dbo].[City] ([Id], [Name], [StateId]) VALUES (11, N'Bengaluru', 11)
GO
INSERT [dbo].[City] ([Id], [Name], [StateId]) VALUES (12, N'Mysuru', 11)
GO
INSERT [dbo].[City] ([Id], [Name], [StateId]) VALUES (13, N'Hubballi', 11)
GO
INSERT [dbo].[City] ([Id], [Name], [StateId]) VALUES (14, N'Mangaluru', 11)
GO
INSERT [dbo].[City] ([Id], [Name], [StateId]) VALUES (15, N'Belagavi', 11)
GO
INSERT [dbo].[City] ([Id], [Name], [StateId]) VALUES (16, N'Shivamogga', 11)
GO
INSERT [dbo].[City] ([Id], [Name], [StateId]) VALUES (17, N'Tumakuru', 11)
GO
INSERT [dbo].[City] ([Id], [Name], [StateId]) VALUES (18, N'Ballari', 11)
GO
INSERT [dbo].[City] ([Id], [Name], [StateId]) VALUES (19, N'Vijayapura', 11)
GO
INSERT [dbo].[City] ([Id], [Name], [StateId]) VALUES (20, N'Kalaburagi', 11)
GO
SET IDENTITY_INSERT [dbo].[City] OFF
GO
SET IDENTITY_INSERT [dbo].[Gender] ON 
GO
INSERT [dbo].[Gender] ([Id], [Name]) VALUES (1, N'Male')
GO
INSERT [dbo].[Gender] ([Id], [Name]) VALUES (2, N'Female')
GO
INSERT [dbo].[Gender] ([Id], [Name]) VALUES (3, N'Other')
GO
SET IDENTITY_INSERT [dbo].[Gender] OFF
GO
SET IDENTITY_INSERT [dbo].[Hobbies] ON 
GO
INSERT [dbo].[Hobbies] ([Id], [Name]) VALUES (1, N'Reading')
GO
INSERT [dbo].[Hobbies] ([Id], [Name]) VALUES (2, N'Gardening')
GO
INSERT [dbo].[Hobbies] ([Id], [Name]) VALUES (3, N'Painting')
GO
INSERT [dbo].[Hobbies] ([Id], [Name]) VALUES (4, N'Cooking')
GO
INSERT [dbo].[Hobbies] ([Id], [Name]) VALUES (5, N'Photography')
GO
INSERT [dbo].[Hobbies] ([Id], [Name]) VALUES (6, N'Traveling')
GO
INSERT [dbo].[Hobbies] ([Id], [Name]) VALUES (7, N'Music')
GO
INSERT [dbo].[Hobbies] ([Id], [Name]) VALUES (8, N'Sports')
GO
INSERT [dbo].[Hobbies] ([Id], [Name]) VALUES (9, N'Gaming')
GO
INSERT [dbo].[Hobbies] ([Id], [Name]) VALUES (10, N'Crafting')
GO
SET IDENTITY_INSERT [dbo].[Hobbies] OFF
GO
SET IDENTITY_INSERT [dbo].[State] ON 
GO
INSERT [dbo].[State] ([Id], [Name]) VALUES (1, N'Andhra Pradesh')
GO
INSERT [dbo].[State] ([Id], [Name]) VALUES (2, N'Arunachal Pradesh')
GO
INSERT [dbo].[State] ([Id], [Name]) VALUES (3, N'Assam')
GO
INSERT [dbo].[State] ([Id], [Name]) VALUES (4, N'Bihar')
GO
INSERT [dbo].[State] ([Id], [Name]) VALUES (5, N'Chhattisgarh')
GO
INSERT [dbo].[State] ([Id], [Name]) VALUES (6, N'Goa')
GO
INSERT [dbo].[State] ([Id], [Name]) VALUES (7, N'Gujarat')
GO
INSERT [dbo].[State] ([Id], [Name]) VALUES (8, N'Haryana')
GO
INSERT [dbo].[State] ([Id], [Name]) VALUES (9, N'Himachal Pradesh')
GO
INSERT [dbo].[State] ([Id], [Name]) VALUES (10, N'Jharkhand')
GO
INSERT [dbo].[State] ([Id], [Name]) VALUES (11, N'Karnataka')
GO
INSERT [dbo].[State] ([Id], [Name]) VALUES (12, N'Kerala')
GO
INSERT [dbo].[State] ([Id], [Name]) VALUES (13, N'Madhya Pradesh')
GO
INSERT [dbo].[State] ([Id], [Name]) VALUES (14, N'Maharashtra')
GO
INSERT [dbo].[State] ([Id], [Name]) VALUES (15, N'Manipur')
GO
INSERT [dbo].[State] ([Id], [Name]) VALUES (16, N'Meghalaya')
GO
INSERT [dbo].[State] ([Id], [Name]) VALUES (17, N'Mizoram')
GO
INSERT [dbo].[State] ([Id], [Name]) VALUES (18, N'Nagaland')
GO
INSERT [dbo].[State] ([Id], [Name]) VALUES (19, N'Odisha')
GO
INSERT [dbo].[State] ([Id], [Name]) VALUES (20, N'Punjab')
GO
INSERT [dbo].[State] ([Id], [Name]) VALUES (21, N'Rajasthan')
GO
INSERT [dbo].[State] ([Id], [Name]) VALUES (22, N'Sikkim')
GO
INSERT [dbo].[State] ([Id], [Name]) VALUES (23, N'Tamil Nadu')
GO
INSERT [dbo].[State] ([Id], [Name]) VALUES (24, N'Telangana')
GO
INSERT [dbo].[State] ([Id], [Name]) VALUES (25, N'Tripura')
GO
INSERT [dbo].[State] ([Id], [Name]) VALUES (26, N'Uttar Pradesh')
GO
INSERT [dbo].[State] ([Id], [Name]) VALUES (27, N'Uttarakhand')
GO
INSERT [dbo].[State] ([Id], [Name]) VALUES (28, N'West Bengal')
GO
SET IDENTITY_INSERT [dbo].[State] OFF
GO
ALTER TABLE [dbo].[Employee] ADD  CONSTRAINT [DF_Employee_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[EmployeeHobbies] ADD  CONSTRAINT [DF_EmployeeHobbies_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[EmployeePhoto] ADD  CONSTRAINT [DF_EmployeePhoto_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[City]  WITH CHECK ADD  CONSTRAINT [FK_City_StateId] FOREIGN KEY([StateId])
REFERENCES [dbo].[State] ([Id])
GO
ALTER TABLE [dbo].[City] CHECK CONSTRAINT [FK_City_StateId]
GO
ALTER TABLE [dbo].[EmployeeHobbies]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeHobbies_EmployeeId] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([EmployeeId])
GO
ALTER TABLE [dbo].[EmployeeHobbies] CHECK CONSTRAINT [FK_EmployeeHobbies_EmployeeId]
GO
ALTER TABLE [dbo].[EmployeePhoto]  WITH CHECK ADD  CONSTRAINT [FK_EmployeePhoto_EmployeeId] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([EmployeeId])
GO
ALTER TABLE [dbo].[EmployeePhoto] CHECK CONSTRAINT [FK_EmployeePhoto_EmployeeId]
GO
/****** Object:  StoredProcedure [dbo].[DeleteEmployeeById]    Script Date: 08-08-2023 11.07.06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteEmployeeById]
(
@Id INT
)
AS
BEGIN;
	DELETE FROM dbo.EmployeeHobbies WHERE EmployeeId = @Id;

	DELETE FROM [dbo].[EmployeePhoto] WHERE EmployeeId = @Id;

	DELETE FROM [dbo].[Employee] WHERE EmployeeId = @Id;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetCity]    Script Date: 08-08-2023 11.07.06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCity]
(
@StateId INT NULL = NULL
)
AS
BEGIN;
	SELECT [Id]
		  ,[Name]
  FROM [dbo].[City] WHERE StateId = ISNULL(@StateId, StateId)
END;
GO
/****** Object:  StoredProcedure [dbo].[GetEmployeeById]    Script Date: 08-08-2023 11.07.06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetEmployeeById](  
@EmployeeId INT  
)  
AS  
BEGIN;  
SELECT emp.[EmployeeId]  
      ,emp.[EmployeeName]  
      ,emp.[EmployeeDOB]  
      ,emp.[Gender]  
      ,emp.[Address]  
      ,emp.[State]  
      ,emp.[City]  
      ,emp.[CreatedDate]  
   ,emp.[ModifiedDate]  
   ,photo.Id PhotoId  
   ,photo.Photo  
   ,emph.Id EmployeeHobbyId  
   ,emph.HobbyId  
  FROM [dbo].[Employee] emp  
  INNER JOIN [dbo].[EmployeePhoto] photo on emp.EmployeeId = Photo.EmployeeId and Photo.IsActive = 1  
  LEFT JOIN [dbo].[EmployeeHobbies] emph on emp.EmployeeId = emph.EmployeeId and emph.IsActive = 1  
  WHERE emp.IsActive = 1 AND emp.EmployeeId = @EmployeeId  
END;  
GO
/****** Object:  StoredProcedure [dbo].[GetEmployees]    Script Date: 08-08-2023 11.07.06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetEmployees]
AS
BEGIN;
SELECT [EmployeeId]
      ,[EmployeeName]
      ,[EmployeeDOB]
      ,[State]
      ,[City]
  FROM [dbo].[Employee] WHERE IsActive = 1
END;
GO
/****** Object:  StoredProcedure [dbo].[GetGender]    Script Date: 08-08-2023 11.07.06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetGender]
AS
BEGIN;
	SELECT Id, Name FROM Gender
END;
GO
/****** Object:  StoredProcedure [dbo].[GetHobbies]    Script Date: 08-08-2023 11.07.06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetHobbies]
AS
BEGIN;
	SELECT [Id]
		  ,[Name]
  FROM [dbo].[Hobbies]
END;
GO
/****** Object:  StoredProcedure [dbo].[GetState]    Script Date: 08-08-2023 11.07.06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetState]
AS
BEGIN;
	SELECT [Id]
		  ,[Name]
  FROM [dbo].[State]
END;
GO
/****** Object:  StoredProcedure [dbo].[InsertEmployee]    Script Date: 08-08-2023 11.07.06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[InsertEmployee]    
(    
@EmployeeName NVARCHAR(128),    
@EmployeeDOB DATETIME,    
@Gender INT,    
@Address NVARCHAR(MAX),    
@State INT,    
@City INT,    
@CreatedDate DATETIME
)    
AS    
BEGIN;    
 INSERT INTO [dbo].[Employee]    
      ([EmployeeName],[EmployeeDOB],[Gender]    
      ,[Address],[State],[City]    
      ,[CreatedDate])    
 OUTPUT inserted.EmployeeId  
 VALUES    
      (@EmployeeName,@EmployeeDOB,@Gender    
      ,@Address,@State,@City    
      ,@CreatedDate)    
END;
GO
/****** Object:  StoredProcedure [dbo].[InsertEmployeePhoto]    Script Date: 08-08-2023 11.07.06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertEmployeePhoto]  
(  
@EmployeeId INT,  
@Photo VARBINARY(MAX) NULL = NULL,  
@CreatedDate DATETIME  
)  
AS  
BEGIN;  
 INSERT INTO [dbo].[EmployeePhoto]  
           ([EmployeeId]  
           ,[Photo]  
           ,[CreatedDate])  
     VALUES  
           (@EmployeeId  
           ,@Photo  
           ,@CreatedDate)  
END;
GO
/****** Object:  StoredProcedure [dbo].[InsertLogDetails]    Script Date: 08-08-2023 11.07.06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[InsertLogDetails]  
(  
@LogLevel NVARCHAR(50),  
@Message NVARCHAR(MAX),  
@InputParameters NVARCHAR(MAX) = NULL,  
@Exception NVARCHAR(MAX) = NULL,  
@CreatedDate DATETIME  
)  
AS  
BEGIN;  
INSERT INTO [dbo].[Logs]  
           ([LogLevel]  
           ,[Message]  
           ,[InputParameters]  
           ,[Exception]  
           ,[CreatedDate])  
     VALUES  
           (@LogLevel  
           ,@Message  
           ,@InputParameters  
           ,@Exception  
           ,@CreatedDate)  
END;
GO
/****** Object:  StoredProcedure [dbo].[InsertOrUpdateEmployeeHobbies]    Script Date: 08-08-2023 11.07.06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertOrUpdateEmployeeHobbies]  
(  
@EmployeeHobbies AS dbo.EmployeeHobbiesType READONLY,
@EmployeeId INT
)  
AS  
BEGIN;  
 MERGE [dbo].[EmployeeHobbies] AS target  
 USING @EmployeeHobbies AS source  
 ON target.Id = source.Id AND target.IsActive = 1  
 WHEN MATCHED THEN  
  UPDATE SET   
   target.[HobbyId] = source.HobbyId,  
   target.[ModifiedDate] = source.ModifiedDate,  
   target.[IsActive] = source.IsActive  
 WHEN NOT MATCHED BY target THEN  
   INSERT ([EmployeeId],[HobbyId],[CreatedDate])  
   VALUES (@EmployeeId,source.HobbyId,source.CreatedDate);  
END;
GO
/****** Object:  StoredProcedure [dbo].[UpdateEmployee]    Script Date: 08-08-2023 11.07.06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateEmployee]
(
@EmployeeId INT,
@EmployeeName NVARCHAR(128),
@EmployeeDOB DATETIME,
@Gender INT,
@Address NVARCHAR(MAX),
@State INT,
@City INT,
@ModifiedDate DATETIME,
@IsActive BIT
)
AS
BEGIN;
	UPDATE [dbo].[Employee]
	SET [EmployeeName] = @EmployeeName
		,[EmployeeDOB] = @EmployeeDOB
		,[Gender] = @Gender
		,[Address] = @Address
		,[State] = @State
		,[City] = @City
		,[IsActive] = @IsActive
		,[ModifiedDate] = @ModifiedDate
	WHERE employeeid = @EmployeeId
END;
GO
/****** Object:  StoredProcedure [dbo].[UpdateEmployeePhoto]    Script Date: 08-08-2023 11.07.06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[UpdateEmployeePhoto]  
(  
@Id INT,  
@Photo VARBINARY(MAX) NULL = NULL,  
@ModifiedDate DATETIME,  
@IsActive BIT  
)  
AS  
BEGIN;  
 UPDATE [dbo].[EmployeePhoto]  
 SET [Photo] = @Photo  
  ,[IsActive] = @IsActive  
  ,[ModifiedDate] = @ModifiedDate  
 WHERE Id = @Id  
END;
GO
USE [master]
GO
ALTER DATABASE [Assesment] SET  READ_WRITE 
GO
