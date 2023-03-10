USE [master]
GO
/****** Object:  Database [CSLG Access reservation system]    Script Date: 03/07/2017 22:22:08 ******/
CREATE DATABASE [CSLG Access reservation system] ON  PRIMARY 
( NAME = N'CSLG Access reservation system', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL\DATA\CSLG Access reservation system.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CSLG Access reservation system_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL\DATA\CSLG Access reservation system_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CSLG Access reservation system] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CSLG Access reservation system].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CSLG Access reservation system] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [CSLG Access reservation system] SET ANSI_NULLS OFF
GO
ALTER DATABASE [CSLG Access reservation system] SET ANSI_PADDING OFF
GO
ALTER DATABASE [CSLG Access reservation system] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [CSLG Access reservation system] SET ARITHABORT OFF
GO
ALTER DATABASE [CSLG Access reservation system] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [CSLG Access reservation system] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [CSLG Access reservation system] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [CSLG Access reservation system] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [CSLG Access reservation system] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [CSLG Access reservation system] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [CSLG Access reservation system] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [CSLG Access reservation system] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [CSLG Access reservation system] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [CSLG Access reservation system] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [CSLG Access reservation system] SET  DISABLE_BROKER
GO
ALTER DATABASE [CSLG Access reservation system] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [CSLG Access reservation system] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [CSLG Access reservation system] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [CSLG Access reservation system] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [CSLG Access reservation system] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [CSLG Access reservation system] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [CSLG Access reservation system] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [CSLG Access reservation system] SET  READ_WRITE
GO
ALTER DATABASE [CSLG Access reservation system] SET RECOVERY FULL
GO
ALTER DATABASE [CSLG Access reservation system] SET  MULTI_USER
GO
ALTER DATABASE [CSLG Access reservation system] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [CSLG Access reservation system] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'CSLG Access reservation system', N'ON'
GO
USE [CSLG Access reservation system]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 03/07/2017 22:22:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[userName] [varchar](20) NOT NULL,
	[password] [varchar](16) NOT NULL,
	[wechat_id] [varchar](16) NULL,
	[phone_number] [varchar](13) NULL,
	[identity_number] [varchar](9) NULL,
	[is_temporary] [bit] NULL,
	[is_manager] [bit] NULL,
	[information] [varchar](max) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Reservations]    Script Date: 03/07/2017 22:22:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Reservations](
	[reservation_Id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[room_id] [int] NULL,
	[valid] [bit] NOT NULL,
	[lock] [bit] NOT NULL,
	[year] [int] NULL,
	[month] [int] NULL,
	[day] [int] NULL,
	[start] [int] NULL,
	[finish] [int] NULL,
	[qr_location] [varchar](50) NULL,
	[information] [varchar](max) NULL,
 CONSTRAINT [PK_Reservations] PRIMARY KEY CLUSTERED 
(
	[reservation_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Reservations] SET (LOCK_ESCALATION = DISABLE)
GO
/****** Object:  Table [dbo].[ActivityRooms]    Script Date: 03/07/2017 22:22:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ActivityRooms](
	[room_Id] [int] IDENTITY(1,1) NOT NULL,
	[room_name] [varchar](20) NOT NULL,
	[information] [varchar](max) NULL,
 CONSTRAINT [PK_ActivityRooms] PRIMARY KEY CLUSTERED 
(
	[room_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
