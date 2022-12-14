USE [master]
GO
/****** Object:  Database [фахретдинов_Tours]    Script Date: 9/27/2022 5:09:08 PM ******/
CREATE DATABASE [фахретдинов_Tours]
 CONTAINMENT = NONE

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [фахретдинов_Tours].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [фахретдинов_Tours] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [фахретдинов_Tours] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [фахретдинов_Tours] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [фахретдинов_Tours] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [фахретдинов_Tours] SET ARITHABORT OFF 
GO
ALTER DATABASE [фахретдинов_Tours] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [фахретдинов_Tours] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [фахретдинов_Tours] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [фахретдинов_Tours] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [фахретдинов_Tours] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [фахретдинов_Tours] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [фахретдинов_Tours] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [фахретдинов_Tours] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [фахретдинов_Tours] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [фахретдинов_Tours] SET  DISABLE_BROKER 
GO
ALTER DATABASE [фахретдинов_Tours] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [фахретдинов_Tours] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [фахретдинов_Tours] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [фахретдинов_Tours] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [фахретдинов_Tours] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [фахретдинов_Tours] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [фахретдинов_Tours] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [фахретдинов_Tours] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [фахретдинов_Tours] SET  MULTI_USER 
GO
ALTER DATABASE [фахретдинов_Tours] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [фахретдинов_Tours] SET DB_CHAINING OFF 
GO
ALTER DATABASE [фахретдинов_Tours] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [фахретдинов_Tours] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [фахретдинов_Tours] SET DELAYED_DURABILITY = DISABLED 
GO
USE [фахретдинов_Tours]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 9/27/2022 5:09:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[Code] [nchar](2) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hotel]    Script Date: 9/27/2022 5:09:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotel](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[CountOfStars] [int] NOT NULL,
	[CountryCode] [nchar](2) NOT NULL,
 CONSTRAINT [PK_Hotel] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HotelComment]    Script Date: 9/27/2022 5:09:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelComment](
	[Id] [int] NOT NULL,
	[HotelId] [int] NOT NULL,
	[Text] [nvarchar](max) NOT NULL,
	[Author] [nvarchar](100) NOT NULL,
	[CreationDate] [datetime] NOT NULL,
 CONSTRAINT [PK_HotelComment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HotelImage]    Script Date: 9/27/2022 5:09:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelImage](
	[Id] [int] NOT NULL,
	[HotelId] [int] NOT NULL,
	[ImageSource] [varbinary](max) NOT NULL,
 CONSTRAINT [PK_HotelImage] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HotelOfTour]    Script Date: 9/27/2022 5:09:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelOfTour](
	[Hotelid] [int] NOT NULL,
	[tourid] [int] NOT NULL,
 CONSTRAINT [PK_HotelOfTour] PRIMARY KEY CLUSTERED 
(
	[Hotelid] ASC,
	[tourid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tour]    Script Date: 9/27/2022 5:09:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tour](
	[Id] [int] NOT NULL,
	[TicketCount] [int] NULL,
	[Name] [nvarchar](100) NULL,
	[Description] [nvarchar](max) NULL,
	[ImagePreview] [varbinary](max) NULL,
	[Price] [money] NULL,
	[IsActual] [bit] NULL,
 CONSTRAINT [PK_Tour] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Type]    Script Date: 9/27/2022 5:09:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Type] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeOfTour]    Script Date: 9/27/2022 5:09:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeOfTour](
	[TourId] [int] NOT NULL,
	[TypeId] [int] NOT NULL,
 CONSTRAINT [PK_TypeOfTour] PRIMARY KEY CLUSTERED 
(
	[TourId] ASC,
	[TypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'AB', N'Абхазия')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'AI', N'Англия')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'BG', N'Болгария')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'DE', N'Германия')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'EG', N'Египет')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'GE', N'Грузия')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'IL', N'Израиль')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'RU', N'Россия')
GO
SET IDENTITY_INSERT [dbo].[Type] ON 

INSERT [dbo].[Type] ([Id], [Name], [Description]) VALUES (1, N'Тип 1', NULL)
INSERT [dbo].[Type] ([Id], [Name], [Description]) VALUES (2, N'Тип 2', NULL)
INSERT [dbo].[Type] ([Id], [Name], [Description]) VALUES (3, N'Тип 3', NULL)
INSERT [dbo].[Type] ([Id], [Name], [Description]) VALUES (4, N'Тип 4', NULL)
INSERT [dbo].[Type] ([Id], [Name], [Description]) VALUES (5, N'Тип 5', NULL)
SET IDENTITY_INSERT [dbo].[Type] OFF
GO
ALTER TABLE [dbo].[Hotel]  WITH CHECK ADD  CONSTRAINT [FK_Hotel_Country] FOREIGN KEY([CountryCode])
REFERENCES [dbo].[Country] ([Code])
GO
ALTER TABLE [dbo].[Hotel] CHECK CONSTRAINT [FK_Hotel_Country]
GO
ALTER TABLE [dbo].[HotelComment]  WITH CHECK ADD  CONSTRAINT [FK_HotelComment_Hotel] FOREIGN KEY([HotelId])
REFERENCES [dbo].[Hotel] ([Id])
GO
ALTER TABLE [dbo].[HotelComment] CHECK CONSTRAINT [FK_HotelComment_Hotel]
GO
ALTER TABLE [dbo].[HotelImage]  WITH CHECK ADD  CONSTRAINT [FK_HotelImage_Hotel] FOREIGN KEY([HotelId])
REFERENCES [dbo].[Hotel] ([Id])
GO
ALTER TABLE [dbo].[HotelImage] CHECK CONSTRAINT [FK_HotelImage_Hotel]
GO
ALTER TABLE [dbo].[HotelOfTour]  WITH CHECK ADD  CONSTRAINT [FK_HotelOfTour_Hotel] FOREIGN KEY([Hotelid])
REFERENCES [dbo].[Hotel] ([Id])
GO
ALTER TABLE [dbo].[HotelOfTour] CHECK CONSTRAINT [FK_HotelOfTour_Hotel]
GO
ALTER TABLE [dbo].[HotelOfTour]  WITH CHECK ADD  CONSTRAINT [FK_HotelOfTour_Tour] FOREIGN KEY([tourid])
REFERENCES [dbo].[Tour] ([Id])
GO
ALTER TABLE [dbo].[HotelOfTour] CHECK CONSTRAINT [FK_HotelOfTour_Tour]
GO
ALTER TABLE [dbo].[TypeOfTour]  WITH CHECK ADD  CONSTRAINT [FK_TypeOfTour_Tour] FOREIGN KEY([TourId])
REFERENCES [dbo].[Tour] ([Id])
GO
ALTER TABLE [dbo].[TypeOfTour] CHECK CONSTRAINT [FK_TypeOfTour_Tour]
GO
ALTER TABLE [dbo].[TypeOfTour]  WITH CHECK ADD  CONSTRAINT [FK_TypeOfTour_Type] FOREIGN KEY([TypeId])
REFERENCES [dbo].[Type] ([Id])
GO
ALTER TABLE [dbo].[TypeOfTour] CHECK CONSTRAINT [FK_TypeOfTour_Type]
GO
USE [master]
GO
ALTER DATABASE [фахретдинов_Tours] SET  READ_WRITE 
GO
