USE [master]
GO
/****** Object:  Database [asliceofcolumbia_db]    Script Date: 6/4/2014 8:19:35 AM ******/
CREATE DATABASE [asliceofcolumbia_db]
GO
ALTER DATABASE [asliceofcolumbia_db] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [asliceofcolumbia_db].[dbo].[sp_fulltext_database] @action = 'disable'
end
GO
ALTER DATABASE [asliceofcolumbia_db] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [asliceofcolumbia_db] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [asliceofcolumbia_db] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [asliceofcolumbia_db] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [asliceofcolumbia_db] SET ARITHABORT OFF 
GO
ALTER DATABASE [asliceofcolumbia_db] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [asliceofcolumbia_db] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [asliceofcolumbia_db] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [asliceofcolumbia_db] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [asliceofcolumbia_db] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [asliceofcolumbia_db] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [asliceofcolumbia_db] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [asliceofcolumbia_db] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [asliceofcolumbia_db] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [asliceofcolumbia_db] SET  DISABLE_BROKER 
GO
ALTER DATABASE [asliceofcolumbia_db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [asliceofcolumbia_db] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [asliceofcolumbia_db] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [asliceofcolumbia_db] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [asliceofcolumbia_db] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [asliceofcolumbia_db] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [asliceofcolumbia_db] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [asliceofcolumbia_db] SET RECOVERY FULL 
GO
ALTER DATABASE [asliceofcolumbia_db] SET  MULTI_USER 
GO
ALTER DATABASE [asliceofcolumbia_db] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [asliceofcolumbia_db] SET DB_CHAINING OFF 
GO
USE [asliceofcolumbia_db]
GO
/****** Object:  UserDefinedFunction [dbo].[getClosestLocationFUNC]    Script Date: 6/4/2014 8:19:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[getClosestLocationFUNC]
(@Location GEOGRAPHY)
RETURNS FLOAT
AS
	BEGIN
		DECLARE @Distance FLOAT

		SELECT
			@Distance = MIN(@Location.STDistance(dbo.Locations.SpatialLocation))
		FROM dbo.Locations

		RETURN @Distance
	END
GO
/****** Object:  Table [dbo].[DeviceTypes]    Script Date: 6/4/2014 8:19:35 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DeviceTypes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](50) NOT NULL,
 CONSTRAINT [PrimaryKey_aff2c901-fd81-43e7-a053-226d55066aa2] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 6/4/2014 8:19:35 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Locations](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](50) NOT NULL,
	[IsOpen24Hours] [bit] NOT NULL,
	[PhoneNumber] [varchar](50) NOT NULL,
	[SpatialLocation] [geography] NOT NULL,
 CONSTRAINT [PrimaryKey_6317693f-a618-4469-8e6f-e1241a4c8ce4] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NearByRequests]    Script Date: 6/4/2014 8:19:35 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NearByRequests](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TimeOfRequest] [datetime] NOT NULL,
	[DeviceTypeID] [int] NOT NULL,
	[SpatialLocation] [geography] NULL,
 CONSTRAINT [PrimaryKey_f975f1ee-a00e-4835-bc62-46333ac6b2e7] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET IDENTITY_INSERT [dbo].[DeviceTypes] ON 

INSERT [dbo].[DeviceTypes] ([ID], [Description]) VALUES (1, N'WindowsPhone')
INSERT [dbo].[DeviceTypes] ([ID], [Description]) VALUES (2, N'Web')
SET IDENTITY_INSERT [dbo].[DeviceTypes] OFF
SET IDENTITY_INSERT [dbo].[Locations] ON 

INSERT [dbo].[Locations] ([ID], [Description], [IsOpen24Hours], [PhoneNumber], [SpatialLocation]) VALUES (1, N'Store 1', 1, N'1-987-654-3210', 0xE6100000010C81069B3A8F9843407AC4E8B9853653C0)
INSERT [dbo].[Locations] ([ID], [Description], [IsOpen24Hours], [PhoneNumber], [SpatialLocation]) VALUES (2, N'Store 2', 0, N'1-987-654-3219', 0xE6100000010C1F49490F439943403D2AFEEF883453C0)
SET IDENTITY_INSERT [dbo].[Locations] OFF
SET IDENTITY_INSERT [dbo].[NearByRequests] ON 

INSERT [dbo].[NearByRequests] ([ID], [TimeOfRequest], [DeviceTypeID], [SpatialLocation]) VALUES (3, CAST(N'2014-06-03 15:40:30.050' AS DateTime), 1, 0xE6100000010CFFFF8B30298E4340FEFFE5F5BF3253C0)
INSERT [dbo].[NearByRequests] ([ID], [TimeOfRequest], [DeviceTypeID], [SpatialLocation]) VALUES (4, CAST(N'2014-06-03 15:45:47.833' AS DateTime), 1, 0xE6100000010CFCFFBB0E2A8E4340FEFF4D7EC03253C0)
INSERT [dbo].[NearByRequests] ([ID], [TimeOfRequest], [DeviceTypeID], [SpatialLocation]) VALUES (5, CAST(N'2014-06-03 16:44:21.123' AS DateTime), 1, 0xE6100000010C0300748E2E8E434001008CB7C13253C0)
INSERT [dbo].[NearByRequests] ([ID], [TimeOfRequest], [DeviceTypeID], [SpatialLocation]) VALUES (6, CAST(N'2014-06-03 20:10:53.057' AS DateTime), 1, 0xE6100000010C43E55FCB2B8E434032022A1CC13253C0)
INSERT [dbo].[NearByRequests] ([ID], [TimeOfRequest], [DeviceTypeID], [SpatialLocation]) VALUES (7, CAST(N'2014-06-03 20:10:56.303' AS DateTime), 1, 0xE6100000010C43E55FCB2B8E434032022A1CC13253C0)
INSERT [dbo].[NearByRequests] ([ID], [TimeOfRequest], [DeviceTypeID], [SpatialLocation]) VALUES (8, CAST(N'2014-06-03 20:12:04.067' AS DateTime), 1, 0xE6100000010C43E55FCB2B8E434032022A1CC13253C0)
INSERT [dbo].[NearByRequests] ([ID], [TimeOfRequest], [DeviceTypeID], [SpatialLocation]) VALUES (9, CAST(N'2014-06-03 20:12:05.990' AS DateTime), 1, 0xE6100000010C43E55FCB2B8E434032022A1CC13253C0)
INSERT [dbo].[NearByRequests] ([ID], [TimeOfRequest], [DeviceTypeID], [SpatialLocation]) VALUES (10, CAST(N'2014-06-03 20:12:07.513' AS DateTime), 1, 0xE6100000010C43E55FCB2B8E434032022A1CC13253C0)
INSERT [dbo].[NearByRequests] ([ID], [TimeOfRequest], [DeviceTypeID], [SpatialLocation]) VALUES (11, CAST(N'2014-06-03 21:46:58.563' AS DateTime), 1, 0xE6100000010CF796AF0C2C8E434029A5E503C13253C0)
INSERT [dbo].[NearByRequests] ([ID], [TimeOfRequest], [DeviceTypeID], [SpatialLocation]) VALUES (12, CAST(N'2014-06-03 22:18:42.137' AS DateTime), 1, 0xE6100000010CFFFF17A9D88E4340FDFF59C4D83153C0)
INSERT [dbo].[NearByRequests] ([ID], [TimeOfRequest], [DeviceTypeID], [SpatialLocation]) VALUES (13, CAST(N'2014-06-03 22:23:29.470' AS DateTime), 1, 0xE6100000010C0700C8A812964340FFFFD7971C3353C0)
INSERT [dbo].[NearByRequests] ([ID], [TimeOfRequest], [DeviceTypeID], [SpatialLocation]) VALUES (14, CAST(N'2014-06-03 22:27:19.387' AS DateTime), 1, 0xE6100000010CFEFF3747319643400000B463FC3253C0)
INSERT [dbo].[NearByRequests] ([ID], [TimeOfRequest], [DeviceTypeID], [SpatialLocation]) VALUES (15, CAST(N'2014-06-03 22:45:29.227' AS DateTime), 1, 0xE6100000010CCCDB12E9919743401253C8F34F3353C0)
INSERT [dbo].[NearByRequests] ([ID], [TimeOfRequest], [DeviceTypeID], [SpatialLocation]) VALUES (16, CAST(N'2014-06-03 23:51:59.367' AS DateTime), 1, 0xE6100000010CDE34754493974340E538B499533353C0)
SET IDENTITY_INSERT [dbo].[NearByRequests] OFF
ALTER TABLE [dbo].[NearByRequests]  WITH CHECK ADD  CONSTRAINT [FK_NearByRequests_0] FOREIGN KEY([DeviceTypeID])
REFERENCES [dbo].[DeviceTypes] ([ID])
GO
ALTER TABLE [dbo].[NearByRequests] CHECK CONSTRAINT [FK_NearByRequests_0]
GO
/****** Object:  StoredProcedure [dbo].[REPORT_getRequestLocationsSP]    Script Date: 6/4/2014 8:19:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[REPORT_getRequestLocationsSP]
(@StartDate DATETIME, @EndDate DATETIME)
AS
	SELECT
		dbo.NearbyRequests.TimeOfRequest,
		CAST(dbo.NearByRequests.SpatialLocation AS VARBINARY(MAX)) AS SpatialData
	FROM dbo.NearbyRequests
	WHERE dbo.NearbyRequests.TimeOfRequest BETWEEN @StartDate AND @EndDate
GO
/****** Object:  StoredProcedure [dbo].[REPORT_getRequestLocationsToClosestLocationSP]    Script Date: 6/4/2014 8:19:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[REPORT_getRequestLocationsToClosestLocationSP]
(@StartDate DATETIME, @EndDate DATETIME)
AS
	SELECT
		dbo.NearbyRequests.TimeOfRequest,
		dbo.getClosestLocationFUNC(dbo.NearbyRequests.SpatialLocation) AS ClosestLocation,
		CAST(dbo.NearbyRequests.SpatialLocation AS VARBINARY(MAX)) AS SpatialData
	FROM dbo.NearbyRequests
	WHERE dbo.NearbyRequests.TimeOfRequest BETWEEN @StartDate AND @EndDate
GO
/****** Object:  StoredProcedure [dbo].[WEBAPI_getNearByLocationsSP]    Script Date: 6/4/2014 8:19:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WEBAPI_getNearByLocationsSP]
(@spatialLocation GEOGRAPHY, @DeviceTypeID INT, @SRID INT)
AS
	BEGIN
		INSERT INTO dbo.NearByRequests VALUES (GETDATE(), @DeviceTypeID, @spatialLocation)

		SELECT 
			* 
		FROM (
			SELECT
				dbo.Locations.Description,
				dbo.Locations.IsOpen24Hours,
				dbo.Locations.PhoneNumber,
				@spatialLocation.STDistance(dbo.Locations.SpatialLocation) AS Distance
			FROM dbo.Locations
		) AS Result
		ORDER BY Result.Distance ASC
	END

GO
USE [master]
GO
ALTER DATABASE [asliceofcolumbia_db] SET  READ_WRITE 
GO
