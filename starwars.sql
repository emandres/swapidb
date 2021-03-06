USE [master]
GO
/****** Object:  Database [StarWars]    Script Date: 3/12/2020 11:25:40 AM ******/
CREATE DATABASE [StarWars]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'StarWars', FILENAME = N'/var/opt/mssql/data/StarWars.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'StarWars_log', FILENAME = N'/var/opt/mssql/data/StarWars_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [StarWars] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StarWars].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StarWars] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StarWars] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StarWars] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StarWars] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StarWars] SET ARITHABORT OFF 
GO
ALTER DATABASE [StarWars] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [StarWars] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StarWars] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StarWars] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StarWars] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StarWars] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StarWars] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StarWars] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StarWars] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StarWars] SET  ENABLE_BROKER 
GO
ALTER DATABASE [StarWars] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StarWars] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StarWars] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StarWars] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StarWars] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StarWars] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [StarWars] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StarWars] SET RECOVERY FULL 
GO
ALTER DATABASE [StarWars] SET  MULTI_USER 
GO
ALTER DATABASE [StarWars] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StarWars] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StarWars] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StarWars] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [StarWars] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'StarWars', N'ON'
GO
ALTER DATABASE [StarWars] SET QUERY_STORE = OFF
GO
USE [StarWars]
GO
/****** Object:  User [starwars]    Script Date: 3/12/2020 11:25:40 AM ******/
CREATE USER [starwars] FOR LOGIN [starwars] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [starwars]
GO
/****** Object:  Table [dbo].[FilmCharactersRaw]    Script Date: 3/12/2020 11:25:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FilmCharactersRaw](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FilmId] [int] NOT NULL,
	[PersonId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FilmPlanetsRaw]    Script Date: 3/12/2020 11:25:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FilmPlanetsRaw](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FilmId] [int] NOT NULL,
	[PlanetId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FilmSpeciesRaw]    Script Date: 3/12/2020 11:25:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FilmSpeciesRaw](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FilmId] [int] NOT NULL,
	[SpeciesId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FilmsRaw]    Script Date: 3/12/2020 11:25:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FilmsRaw](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Edited] [nvarchar](100) NOT NULL,
	[Producer] [nvarchar](100) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Created] [nvarchar](100) NOT NULL,
	[EpisodeId] [int] NOT NULL,
	[Director] [nvarchar](100) NOT NULL,
	[ReleaseDate] [nvarchar](100) NOT NULL,
	[OpeningCrawl] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FilmStarshipsRaw]    Script Date: 3/12/2020 11:25:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FilmStarshipsRaw](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FilmId] [int] NOT NULL,
	[StarshipId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FilmVehiclesRaw]    Script Date: 3/12/2020 11:25:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FilmVehiclesRaw](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FilmId] [int] NOT NULL,
	[VehicleId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PeopleRaw]    Script Date: 3/12/2020 11:25:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PeopleRaw](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Edited] [nvarchar](100) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Gender] [nvarchar](100) NOT NULL,
	[SkinColor] [nvarchar](100) NOT NULL,
	[HairColor] [nvarchar](100) NOT NULL,
	[Height] [nvarchar](100) NOT NULL,
	[EyeColor] [nvarchar](100) NOT NULL,
	[Mass] [nvarchar](100) NOT NULL,
	[Homeworld] [int] NULL,
	[BirthYear] [nvarchar](100) NOT NULL,
	[Created] [nvarchar](100) NOT NULL,
	[BirthYearParsed] [float] NULL,
	[MassParsed] [float] NULL,
	[HeightParsed] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlanetsRaw]    Script Date: 3/12/2020 11:25:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlanetsRaw](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Edited] [nvarchar](100) NOT NULL,
	[Climate] [nvarchar](100) NOT NULL,
	[SurfaceWater] [nvarchar](100) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Diameter] [nvarchar](100) NOT NULL,
	[RotationPeriod] [nvarchar](100) NOT NULL,
	[Created] [nvarchar](100) NOT NULL,
	[Terrain] [nvarchar](100) NOT NULL,
	[Gravity] [nvarchar](100) NOT NULL,
	[OrbitalPeriod] [nvarchar](100) NOT NULL,
	[Population] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SpeciesPeopleRaw]    Script Date: 3/12/2020 11:25:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SpeciesPeopleRaw](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SpeciesId] [int] NOT NULL,
	[PersonId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SpeciesRaw]    Script Date: 3/12/2020 11:25:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SpeciesRaw](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Edited] [nvarchar](100) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Designation] [nvarchar](100) NOT NULL,
	[Created] [nvarchar](100) NOT NULL,
	[EyeColors] [nvarchar](100) NOT NULL,
	[SkinColors] [nvarchar](100) NOT NULL,
	[Language] [nvarchar](100) NOT NULL,
	[HairColors] [nvarchar](100) NOT NULL,
	[Homeworld] [int] NULL,
	[AverageLifespan] [nvarchar](100) NOT NULL,
	[AverageHeight] [nvarchar](100) NOT NULL,
	[Classification] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StarshipPilotsRaw]    Script Date: 3/12/2020 11:25:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StarshipPilotsRaw](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StarshipId] [int] NOT NULL,
	[PersonId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StarshipsRaw]    Script Date: 3/12/2020 11:25:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StarshipsRaw](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MGLT] [nvarchar](100) NOT NULL,
	[StarshipClass] [nvarchar](100) NOT NULL,
	[HyperdriveRating] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransportsRaw]    Script Date: 3/12/2020 11:25:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransportsRaw](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Edited] [nvarchar](100) NOT NULL,
	[Consumables] [nvarchar](100) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Created] [nvarchar](100) NOT NULL,
	[CargoCapacity] [nvarchar](100) NOT NULL,
	[Passengers] [nvarchar](100) NOT NULL,
	[MaxAtmospheringSpeed] [nvarchar](100) NOT NULL,
	[Crew] [nvarchar](100) NOT NULL,
	[Length] [nvarchar](100) NOT NULL,
	[Model] [nvarchar](100) NOT NULL,
	[CostInCredits] [nvarchar](100) NOT NULL,
	[Manufacturer] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VehiclePilotsRaw]    Script Date: 3/12/2020 11:25:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VehiclePilotsRaw](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[VehicleId] [int] NOT NULL,
	[PersonId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VehiclesRaw]    Script Date: 3/12/2020 11:25:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VehiclesRaw](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[VehicleClass] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[FilmCharactersRaw] ON 

INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (1, 1, 1)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (2, 1, 2)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (3, 1, 3)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (4, 1, 4)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (5, 1, 5)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (6, 1, 6)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (7, 1, 7)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (8, 1, 8)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (9, 1, 9)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (10, 1, 10)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (11, 1, 12)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (12, 1, 13)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (13, 1, 14)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (14, 1, 15)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (15, 1, 16)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (16, 1, 18)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (17, 1, 19)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (18, 1, 81)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (19, 2, 1)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (20, 2, 2)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (21, 2, 3)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (22, 2, 4)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (23, 2, 5)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (24, 2, 10)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (25, 2, 13)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (26, 2, 14)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (27, 2, 18)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (28, 2, 20)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (29, 2, 21)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (30, 2, 22)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (31, 2, 23)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (32, 2, 24)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (33, 2, 25)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (34, 2, 26)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (35, 3, 1)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (36, 3, 2)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (37, 3, 3)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (38, 3, 4)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (39, 3, 5)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (40, 3, 10)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (41, 3, 13)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (42, 3, 14)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (43, 3, 16)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (44, 3, 18)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (45, 3, 20)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (46, 3, 21)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (47, 3, 22)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (48, 3, 25)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (49, 3, 27)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (50, 3, 28)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (51, 3, 29)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (52, 3, 30)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (53, 3, 31)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (54, 3, 45)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (55, 4, 2)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (56, 4, 3)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (57, 4, 10)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (58, 4, 11)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (59, 4, 16)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (60, 4, 20)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (61, 4, 21)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (62, 4, 32)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (63, 4, 33)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (64, 4, 34)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (65, 4, 35)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (66, 4, 36)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (67, 4, 37)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (68, 4, 38)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (69, 4, 39)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (70, 4, 40)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (71, 4, 41)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (72, 4, 42)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (73, 4, 43)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (74, 4, 44)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (75, 4, 46)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (76, 4, 47)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (77, 4, 48)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (78, 4, 49)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (79, 4, 50)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (80, 4, 51)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (81, 4, 52)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (82, 4, 53)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (83, 4, 54)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (84, 4, 55)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (85, 4, 56)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (86, 4, 57)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (87, 4, 58)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (88, 4, 59)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (89, 5, 2)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (90, 5, 3)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (91, 5, 6)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (92, 5, 7)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (93, 5, 10)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (94, 5, 11)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (95, 5, 20)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (96, 5, 21)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (97, 5, 22)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (98, 5, 33)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (99, 5, 35)
GO
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (100, 5, 36)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (101, 5, 40)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (102, 5, 43)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (103, 5, 46)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (104, 5, 51)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (105, 5, 52)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (106, 5, 53)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (107, 5, 58)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (108, 5, 59)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (109, 5, 60)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (110, 5, 61)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (111, 5, 62)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (112, 5, 63)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (113, 5, 64)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (114, 5, 65)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (115, 5, 66)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (116, 5, 67)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (117, 5, 68)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (118, 5, 69)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (119, 5, 70)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (120, 5, 71)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (121, 5, 72)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (122, 5, 73)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (123, 5, 74)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (124, 5, 75)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (125, 5, 76)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (126, 5, 77)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (127, 5, 78)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (128, 5, 82)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (129, 6, 1)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (130, 6, 2)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (131, 6, 3)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (132, 6, 4)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (133, 6, 5)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (134, 6, 6)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (135, 6, 7)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (136, 6, 10)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (137, 6, 11)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (138, 6, 12)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (139, 6, 13)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (140, 6, 20)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (141, 6, 21)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (142, 6, 33)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (143, 6, 35)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (144, 6, 46)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (145, 6, 51)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (146, 6, 52)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (147, 6, 53)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (148, 6, 54)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (149, 6, 55)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (150, 6, 56)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (151, 6, 58)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (152, 6, 63)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (153, 6, 64)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (154, 6, 67)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (155, 6, 68)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (156, 6, 75)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (157, 6, 78)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (158, 6, 79)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (159, 6, 80)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (160, 6, 81)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (161, 6, 82)
INSERT [dbo].[FilmCharactersRaw] ([Id], [FilmId], [PersonId]) VALUES (162, 6, 83)
SET IDENTITY_INSERT [dbo].[FilmCharactersRaw] OFF
SET IDENTITY_INSERT [dbo].[FilmPlanetsRaw] ON 

INSERT [dbo].[FilmPlanetsRaw] ([Id], [FilmId], [PlanetId]) VALUES (1, 1, 1)
INSERT [dbo].[FilmPlanetsRaw] ([Id], [FilmId], [PlanetId]) VALUES (2, 1, 2)
INSERT [dbo].[FilmPlanetsRaw] ([Id], [FilmId], [PlanetId]) VALUES (3, 1, 3)
INSERT [dbo].[FilmPlanetsRaw] ([Id], [FilmId], [PlanetId]) VALUES (4, 2, 4)
INSERT [dbo].[FilmPlanetsRaw] ([Id], [FilmId], [PlanetId]) VALUES (5, 2, 5)
INSERT [dbo].[FilmPlanetsRaw] ([Id], [FilmId], [PlanetId]) VALUES (6, 2, 6)
INSERT [dbo].[FilmPlanetsRaw] ([Id], [FilmId], [PlanetId]) VALUES (7, 2, 27)
INSERT [dbo].[FilmPlanetsRaw] ([Id], [FilmId], [PlanetId]) VALUES (8, 3, 1)
INSERT [dbo].[FilmPlanetsRaw] ([Id], [FilmId], [PlanetId]) VALUES (9, 3, 5)
INSERT [dbo].[FilmPlanetsRaw] ([Id], [FilmId], [PlanetId]) VALUES (10, 3, 7)
INSERT [dbo].[FilmPlanetsRaw] ([Id], [FilmId], [PlanetId]) VALUES (11, 3, 8)
INSERT [dbo].[FilmPlanetsRaw] ([Id], [FilmId], [PlanetId]) VALUES (12, 3, 9)
INSERT [dbo].[FilmPlanetsRaw] ([Id], [FilmId], [PlanetId]) VALUES (13, 4, 1)
INSERT [dbo].[FilmPlanetsRaw] ([Id], [FilmId], [PlanetId]) VALUES (14, 4, 8)
INSERT [dbo].[FilmPlanetsRaw] ([Id], [FilmId], [PlanetId]) VALUES (15, 4, 9)
INSERT [dbo].[FilmPlanetsRaw] ([Id], [FilmId], [PlanetId]) VALUES (16, 5, 1)
INSERT [dbo].[FilmPlanetsRaw] ([Id], [FilmId], [PlanetId]) VALUES (17, 5, 8)
INSERT [dbo].[FilmPlanetsRaw] ([Id], [FilmId], [PlanetId]) VALUES (18, 5, 9)
INSERT [dbo].[FilmPlanetsRaw] ([Id], [FilmId], [PlanetId]) VALUES (19, 5, 10)
INSERT [dbo].[FilmPlanetsRaw] ([Id], [FilmId], [PlanetId]) VALUES (20, 5, 11)
INSERT [dbo].[FilmPlanetsRaw] ([Id], [FilmId], [PlanetId]) VALUES (21, 6, 1)
INSERT [dbo].[FilmPlanetsRaw] ([Id], [FilmId], [PlanetId]) VALUES (22, 6, 2)
INSERT [dbo].[FilmPlanetsRaw] ([Id], [FilmId], [PlanetId]) VALUES (23, 6, 5)
INSERT [dbo].[FilmPlanetsRaw] ([Id], [FilmId], [PlanetId]) VALUES (24, 6, 8)
INSERT [dbo].[FilmPlanetsRaw] ([Id], [FilmId], [PlanetId]) VALUES (25, 6, 9)
INSERT [dbo].[FilmPlanetsRaw] ([Id], [FilmId], [PlanetId]) VALUES (26, 6, 12)
INSERT [dbo].[FilmPlanetsRaw] ([Id], [FilmId], [PlanetId]) VALUES (27, 6, 13)
INSERT [dbo].[FilmPlanetsRaw] ([Id], [FilmId], [PlanetId]) VALUES (28, 6, 14)
INSERT [dbo].[FilmPlanetsRaw] ([Id], [FilmId], [PlanetId]) VALUES (29, 6, 15)
INSERT [dbo].[FilmPlanetsRaw] ([Id], [FilmId], [PlanetId]) VALUES (30, 6, 16)
INSERT [dbo].[FilmPlanetsRaw] ([Id], [FilmId], [PlanetId]) VALUES (31, 6, 17)
INSERT [dbo].[FilmPlanetsRaw] ([Id], [FilmId], [PlanetId]) VALUES (32, 6, 18)
INSERT [dbo].[FilmPlanetsRaw] ([Id], [FilmId], [PlanetId]) VALUES (33, 6, 19)
SET IDENTITY_INSERT [dbo].[FilmPlanetsRaw] OFF
SET IDENTITY_INSERT [dbo].[FilmSpeciesRaw] ON 

INSERT [dbo].[FilmSpeciesRaw] ([Id], [FilmId], [SpeciesId]) VALUES (1, 1, 1)
INSERT [dbo].[FilmSpeciesRaw] ([Id], [FilmId], [SpeciesId]) VALUES (2, 1, 2)
INSERT [dbo].[FilmSpeciesRaw] ([Id], [FilmId], [SpeciesId]) VALUES (3, 1, 3)
INSERT [dbo].[FilmSpeciesRaw] ([Id], [FilmId], [SpeciesId]) VALUES (4, 1, 4)
INSERT [dbo].[FilmSpeciesRaw] ([Id], [FilmId], [SpeciesId]) VALUES (5, 1, 5)
INSERT [dbo].[FilmSpeciesRaw] ([Id], [FilmId], [SpeciesId]) VALUES (6, 2, 1)
INSERT [dbo].[FilmSpeciesRaw] ([Id], [FilmId], [SpeciesId]) VALUES (7, 2, 2)
INSERT [dbo].[FilmSpeciesRaw] ([Id], [FilmId], [SpeciesId]) VALUES (8, 2, 3)
INSERT [dbo].[FilmSpeciesRaw] ([Id], [FilmId], [SpeciesId]) VALUES (9, 2, 6)
INSERT [dbo].[FilmSpeciesRaw] ([Id], [FilmId], [SpeciesId]) VALUES (10, 2, 7)
INSERT [dbo].[FilmSpeciesRaw] ([Id], [FilmId], [SpeciesId]) VALUES (11, 3, 1)
INSERT [dbo].[FilmSpeciesRaw] ([Id], [FilmId], [SpeciesId]) VALUES (12, 3, 2)
INSERT [dbo].[FilmSpeciesRaw] ([Id], [FilmId], [SpeciesId]) VALUES (13, 3, 3)
INSERT [dbo].[FilmSpeciesRaw] ([Id], [FilmId], [SpeciesId]) VALUES (14, 3, 5)
INSERT [dbo].[FilmSpeciesRaw] ([Id], [FilmId], [SpeciesId]) VALUES (15, 3, 6)
INSERT [dbo].[FilmSpeciesRaw] ([Id], [FilmId], [SpeciesId]) VALUES (16, 3, 8)
INSERT [dbo].[FilmSpeciesRaw] ([Id], [FilmId], [SpeciesId]) VALUES (17, 3, 9)
INSERT [dbo].[FilmSpeciesRaw] ([Id], [FilmId], [SpeciesId]) VALUES (18, 3, 10)
INSERT [dbo].[FilmSpeciesRaw] ([Id], [FilmId], [SpeciesId]) VALUES (19, 3, 15)
INSERT [dbo].[FilmSpeciesRaw] ([Id], [FilmId], [SpeciesId]) VALUES (20, 4, 1)
INSERT [dbo].[FilmSpeciesRaw] ([Id], [FilmId], [SpeciesId]) VALUES (21, 4, 2)
INSERT [dbo].[FilmSpeciesRaw] ([Id], [FilmId], [SpeciesId]) VALUES (22, 4, 6)
INSERT [dbo].[FilmSpeciesRaw] ([Id], [FilmId], [SpeciesId]) VALUES (23, 4, 11)
INSERT [dbo].[FilmSpeciesRaw] ([Id], [FilmId], [SpeciesId]) VALUES (24, 4, 12)
INSERT [dbo].[FilmSpeciesRaw] ([Id], [FilmId], [SpeciesId]) VALUES (25, 4, 13)
INSERT [dbo].[FilmSpeciesRaw] ([Id], [FilmId], [SpeciesId]) VALUES (26, 4, 14)
INSERT [dbo].[FilmSpeciesRaw] ([Id], [FilmId], [SpeciesId]) VALUES (27, 4, 15)
INSERT [dbo].[FilmSpeciesRaw] ([Id], [FilmId], [SpeciesId]) VALUES (28, 4, 16)
INSERT [dbo].[FilmSpeciesRaw] ([Id], [FilmId], [SpeciesId]) VALUES (29, 4, 17)
INSERT [dbo].[FilmSpeciesRaw] ([Id], [FilmId], [SpeciesId]) VALUES (30, 4, 18)
INSERT [dbo].[FilmSpeciesRaw] ([Id], [FilmId], [SpeciesId]) VALUES (31, 4, 19)
INSERT [dbo].[FilmSpeciesRaw] ([Id], [FilmId], [SpeciesId]) VALUES (32, 4, 20)
INSERT [dbo].[FilmSpeciesRaw] ([Id], [FilmId], [SpeciesId]) VALUES (33, 4, 21)
INSERT [dbo].[FilmSpeciesRaw] ([Id], [FilmId], [SpeciesId]) VALUES (34, 4, 22)
INSERT [dbo].[FilmSpeciesRaw] ([Id], [FilmId], [SpeciesId]) VALUES (35, 4, 23)
INSERT [dbo].[FilmSpeciesRaw] ([Id], [FilmId], [SpeciesId]) VALUES (36, 4, 24)
INSERT [dbo].[FilmSpeciesRaw] ([Id], [FilmId], [SpeciesId]) VALUES (37, 4, 25)
INSERT [dbo].[FilmSpeciesRaw] ([Id], [FilmId], [SpeciesId]) VALUES (38, 4, 26)
INSERT [dbo].[FilmSpeciesRaw] ([Id], [FilmId], [SpeciesId]) VALUES (39, 4, 27)
INSERT [dbo].[FilmSpeciesRaw] ([Id], [FilmId], [SpeciesId]) VALUES (40, 5, 1)
INSERT [dbo].[FilmSpeciesRaw] ([Id], [FilmId], [SpeciesId]) VALUES (41, 5, 2)
INSERT [dbo].[FilmSpeciesRaw] ([Id], [FilmId], [SpeciesId]) VALUES (42, 5, 6)
INSERT [dbo].[FilmSpeciesRaw] ([Id], [FilmId], [SpeciesId]) VALUES (43, 5, 12)
INSERT [dbo].[FilmSpeciesRaw] ([Id], [FilmId], [SpeciesId]) VALUES (44, 5, 13)
INSERT [dbo].[FilmSpeciesRaw] ([Id], [FilmId], [SpeciesId]) VALUES (45, 5, 15)
INSERT [dbo].[FilmSpeciesRaw] ([Id], [FilmId], [SpeciesId]) VALUES (46, 5, 28)
INSERT [dbo].[FilmSpeciesRaw] ([Id], [FilmId], [SpeciesId]) VALUES (47, 5, 29)
INSERT [dbo].[FilmSpeciesRaw] ([Id], [FilmId], [SpeciesId]) VALUES (48, 5, 30)
INSERT [dbo].[FilmSpeciesRaw] ([Id], [FilmId], [SpeciesId]) VALUES (49, 5, 31)
INSERT [dbo].[FilmSpeciesRaw] ([Id], [FilmId], [SpeciesId]) VALUES (50, 5, 32)
INSERT [dbo].[FilmSpeciesRaw] ([Id], [FilmId], [SpeciesId]) VALUES (51, 5, 33)
INSERT [dbo].[FilmSpeciesRaw] ([Id], [FilmId], [SpeciesId]) VALUES (52, 5, 34)
INSERT [dbo].[FilmSpeciesRaw] ([Id], [FilmId], [SpeciesId]) VALUES (53, 5, 35)
INSERT [dbo].[FilmSpeciesRaw] ([Id], [FilmId], [SpeciesId]) VALUES (54, 6, 1)
INSERT [dbo].[FilmSpeciesRaw] ([Id], [FilmId], [SpeciesId]) VALUES (55, 6, 2)
INSERT [dbo].[FilmSpeciesRaw] ([Id], [FilmId], [SpeciesId]) VALUES (56, 6, 3)
INSERT [dbo].[FilmSpeciesRaw] ([Id], [FilmId], [SpeciesId]) VALUES (57, 6, 6)
INSERT [dbo].[FilmSpeciesRaw] ([Id], [FilmId], [SpeciesId]) VALUES (58, 6, 15)
INSERT [dbo].[FilmSpeciesRaw] ([Id], [FilmId], [SpeciesId]) VALUES (59, 6, 19)
INSERT [dbo].[FilmSpeciesRaw] ([Id], [FilmId], [SpeciesId]) VALUES (60, 6, 20)
INSERT [dbo].[FilmSpeciesRaw] ([Id], [FilmId], [SpeciesId]) VALUES (61, 6, 23)
INSERT [dbo].[FilmSpeciesRaw] ([Id], [FilmId], [SpeciesId]) VALUES (62, 6, 24)
INSERT [dbo].[FilmSpeciesRaw] ([Id], [FilmId], [SpeciesId]) VALUES (63, 6, 25)
INSERT [dbo].[FilmSpeciesRaw] ([Id], [FilmId], [SpeciesId]) VALUES (64, 6, 26)
INSERT [dbo].[FilmSpeciesRaw] ([Id], [FilmId], [SpeciesId]) VALUES (65, 6, 27)
INSERT [dbo].[FilmSpeciesRaw] ([Id], [FilmId], [SpeciesId]) VALUES (66, 6, 28)
INSERT [dbo].[FilmSpeciesRaw] ([Id], [FilmId], [SpeciesId]) VALUES (67, 6, 29)
INSERT [dbo].[FilmSpeciesRaw] ([Id], [FilmId], [SpeciesId]) VALUES (68, 6, 30)
INSERT [dbo].[FilmSpeciesRaw] ([Id], [FilmId], [SpeciesId]) VALUES (69, 6, 33)
INSERT [dbo].[FilmSpeciesRaw] ([Id], [FilmId], [SpeciesId]) VALUES (70, 6, 34)
INSERT [dbo].[FilmSpeciesRaw] ([Id], [FilmId], [SpeciesId]) VALUES (71, 6, 35)
INSERT [dbo].[FilmSpeciesRaw] ([Id], [FilmId], [SpeciesId]) VALUES (72, 6, 36)
INSERT [dbo].[FilmSpeciesRaw] ([Id], [FilmId], [SpeciesId]) VALUES (73, 6, 37)
SET IDENTITY_INSERT [dbo].[FilmSpeciesRaw] OFF
SET IDENTITY_INSERT [dbo].[FilmsRaw] ON 

INSERT [dbo].[FilmsRaw] ([Id], [Edited], [Producer], [Title], [Created], [EpisodeId], [Director], [ReleaseDate], [OpeningCrawl]) VALUES (1, N'2014-12-20T19:49:45.256Z', N'Gary Kurtz, Rick McCallum', N'A New Hope', N'2014-12-10T14:23:31.880Z', 4, N'George Lucas', N'1977-05-25', N'It is a period of civil war.
Rebel spaceships, striking
from a hidden base, have won
their first victory against
the evil Galactic Empire.

During the battle, Rebel
spies managed to steal secret
plans to the Empire''s
ultimate weapon, the DEATH
STAR, an armored space
station with enough power
to destroy an entire planet.

Pursued by the Empire''s
sinister agents, Princess
Leia races home aboard her
starship, custodian of the
stolen plans that can save her
people and restore
freedom to the galaxy....')
INSERT [dbo].[FilmsRaw] ([Id], [Edited], [Producer], [Title], [Created], [EpisodeId], [Director], [ReleaseDate], [OpeningCrawl]) VALUES (2, N'2014-12-15T13:07:53.386Z', N'Gary Kurtz, Rick McCallum', N'The Empire Strikes Back', N'2014-12-12T11:26:24.656Z', 5, N'Irvin Kershner', N'1980-05-17', N'It is a dark time for the
Rebellion. Although the Death
Star has been destroyed,
Imperial troops have driven the
Rebel forces from their hidden
base and pursued them across
the galaxy.

Evading the dreaded Imperial
Starfleet, a group of freedom
fighters led by Luke Skywalker
has established a new secret
base on the remote ice world
of Hoth.

The evil lord Darth Vader,
obsessed with finding young
Skywalker, has dispatched
thousands of remote probes into
the far reaches of space....')
INSERT [dbo].[FilmsRaw] ([Id], [Edited], [Producer], [Title], [Created], [EpisodeId], [Director], [ReleaseDate], [OpeningCrawl]) VALUES (3, N'2014-12-20T09:48:37.462Z', N'Howard G. Kazanjian, George Lucas, Rick McCallum', N'Return of the Jedi', N'2014-12-18T10:39:33.255Z', 6, N'Richard Marquand', N'1983-05-25', N'Luke Skywalker has returned to
his home planet of Tatooine in
an attempt to rescue his
friend Han Solo from the
clutches of the vile gangster
Jabba the Hutt.

Little does Luke know that the
GALACTIC EMPIRE has secretly
begun construction on a new
armored space station even
more powerful than the first
dreaded Death Star.

When completed, this ultimate
weapon will spell certain doom
for the small band of rebels
struggling to restore freedom
to the galaxy...')
INSERT [dbo].[FilmsRaw] ([Id], [Edited], [Producer], [Title], [Created], [EpisodeId], [Director], [ReleaseDate], [OpeningCrawl]) VALUES (4, N'2014-12-20T10:54:07.216Z', N'Rick McCallum', N'The Phantom Menace', N'2014-12-19T16:52:55.740Z', 1, N'George Lucas', N'1999-05-19', N'Turmoil has engulfed the
Galactic Republic. The taxation
of trade routes to outlying star
systems is in dispute.

Hoping to resolve the matter
with a blockade of deadly
battleships, the greedy Trade
Federation has stopped all
shipping to the small planet
of Naboo.

While the Congress of the
Republic endlessly debates
this alarming chain of events,
the Supreme Chancellor has
secretly dispatched two Jedi
Knights, the guardians of
peace and justice in the
galaxy, to settle the conflict....')
INSERT [dbo].[FilmsRaw] ([Id], [Edited], [Producer], [Title], [Created], [EpisodeId], [Director], [ReleaseDate], [OpeningCrawl]) VALUES (5, N'2014-12-20T20:18:48.516Z', N'Rick McCallum', N'Attack of the Clones', N'2014-12-20T10:57:57.886Z', 2, N'George Lucas', N'2002-05-16', N'There is unrest in the Galactic
Senate. Several thousand solar
systems have declared their
intentions to leave the Republic.

This separatist movement,
under the leadership of the
mysterious Count Dooku, has
made it difficult for the limited
number of Jedi Knights to maintain 
peace and order in the galaxy.

Senator Amidala, the former
Queen of Naboo, is returning
to the Galactic Senate to vote
on the critical issue of creating
an ARMY OF THE REPUBLIC
to assist the overwhelmed
Jedi....')
INSERT [dbo].[FilmsRaw] ([Id], [Edited], [Producer], [Title], [Created], [EpisodeId], [Director], [ReleaseDate], [OpeningCrawl]) VALUES (6, N'2014-12-20T20:47:52.073Z', N'Rick McCallum', N'Revenge of the Sith', N'2014-12-20T18:49:38.403Z', 3, N'George Lucas', N'2005-05-19', N'War! The Republic is crumbling
under attacks by the ruthless
Sith Lord, Count Dooku.
There are heroes on both sides.
Evil is everywhere.

In a stunning move, the
fiendish droid leader, General
Grievous, has swept into the
Republic capital and kidnapped
Chancellor Palpatine, leader of
the Galactic Senate.

As the Separatist Droid Army
attempts to flee the besieged
capital with their valuable
hostage, two Jedi Knights lead a
desperate mission to rescue the
captive Chancellor....')
SET IDENTITY_INSERT [dbo].[FilmsRaw] OFF
SET IDENTITY_INSERT [dbo].[FilmStarshipsRaw] ON 

INSERT [dbo].[FilmStarshipsRaw] ([Id], [FilmId], [StarshipId]) VALUES (1, 1, 2)
INSERT [dbo].[FilmStarshipsRaw] ([Id], [FilmId], [StarshipId]) VALUES (2, 1, 3)
INSERT [dbo].[FilmStarshipsRaw] ([Id], [FilmId], [StarshipId]) VALUES (3, 1, 5)
INSERT [dbo].[FilmStarshipsRaw] ([Id], [FilmId], [StarshipId]) VALUES (4, 1, 9)
INSERT [dbo].[FilmStarshipsRaw] ([Id], [FilmId], [StarshipId]) VALUES (5, 1, 10)
INSERT [dbo].[FilmStarshipsRaw] ([Id], [FilmId], [StarshipId]) VALUES (6, 1, 11)
INSERT [dbo].[FilmStarshipsRaw] ([Id], [FilmId], [StarshipId]) VALUES (7, 1, 12)
INSERT [dbo].[FilmStarshipsRaw] ([Id], [FilmId], [StarshipId]) VALUES (8, 1, 13)
INSERT [dbo].[FilmStarshipsRaw] ([Id], [FilmId], [StarshipId]) VALUES (9, 2, 3)
INSERT [dbo].[FilmStarshipsRaw] ([Id], [FilmId], [StarshipId]) VALUES (10, 2, 10)
INSERT [dbo].[FilmStarshipsRaw] ([Id], [FilmId], [StarshipId]) VALUES (11, 2, 11)
INSERT [dbo].[FilmStarshipsRaw] ([Id], [FilmId], [StarshipId]) VALUES (12, 2, 12)
INSERT [dbo].[FilmStarshipsRaw] ([Id], [FilmId], [StarshipId]) VALUES (13, 2, 15)
INSERT [dbo].[FilmStarshipsRaw] ([Id], [FilmId], [StarshipId]) VALUES (14, 2, 17)
INSERT [dbo].[FilmStarshipsRaw] ([Id], [FilmId], [StarshipId]) VALUES (15, 2, 21)
INSERT [dbo].[FilmStarshipsRaw] ([Id], [FilmId], [StarshipId]) VALUES (16, 2, 22)
INSERT [dbo].[FilmStarshipsRaw] ([Id], [FilmId], [StarshipId]) VALUES (17, 2, 23)
INSERT [dbo].[FilmStarshipsRaw] ([Id], [FilmId], [StarshipId]) VALUES (18, 3, 2)
INSERT [dbo].[FilmStarshipsRaw] ([Id], [FilmId], [StarshipId]) VALUES (19, 3, 3)
INSERT [dbo].[FilmStarshipsRaw] ([Id], [FilmId], [StarshipId]) VALUES (20, 3, 10)
INSERT [dbo].[FilmStarshipsRaw] ([Id], [FilmId], [StarshipId]) VALUES (21, 3, 11)
INSERT [dbo].[FilmStarshipsRaw] ([Id], [FilmId], [StarshipId]) VALUES (22, 3, 12)
INSERT [dbo].[FilmStarshipsRaw] ([Id], [FilmId], [StarshipId]) VALUES (23, 3, 15)
INSERT [dbo].[FilmStarshipsRaw] ([Id], [FilmId], [StarshipId]) VALUES (24, 3, 17)
INSERT [dbo].[FilmStarshipsRaw] ([Id], [FilmId], [StarshipId]) VALUES (25, 3, 22)
INSERT [dbo].[FilmStarshipsRaw] ([Id], [FilmId], [StarshipId]) VALUES (26, 3, 23)
INSERT [dbo].[FilmStarshipsRaw] ([Id], [FilmId], [StarshipId]) VALUES (27, 3, 27)
INSERT [dbo].[FilmStarshipsRaw] ([Id], [FilmId], [StarshipId]) VALUES (28, 3, 28)
INSERT [dbo].[FilmStarshipsRaw] ([Id], [FilmId], [StarshipId]) VALUES (29, 3, 29)
INSERT [dbo].[FilmStarshipsRaw] ([Id], [FilmId], [StarshipId]) VALUES (30, 4, 31)
INSERT [dbo].[FilmStarshipsRaw] ([Id], [FilmId], [StarshipId]) VALUES (31, 4, 32)
INSERT [dbo].[FilmStarshipsRaw] ([Id], [FilmId], [StarshipId]) VALUES (32, 4, 39)
INSERT [dbo].[FilmStarshipsRaw] ([Id], [FilmId], [StarshipId]) VALUES (33, 4, 40)
INSERT [dbo].[FilmStarshipsRaw] ([Id], [FilmId], [StarshipId]) VALUES (34, 4, 41)
INSERT [dbo].[FilmStarshipsRaw] ([Id], [FilmId], [StarshipId]) VALUES (35, 5, 21)
INSERT [dbo].[FilmStarshipsRaw] ([Id], [FilmId], [StarshipId]) VALUES (36, 5, 32)
INSERT [dbo].[FilmStarshipsRaw] ([Id], [FilmId], [StarshipId]) VALUES (37, 5, 39)
INSERT [dbo].[FilmStarshipsRaw] ([Id], [FilmId], [StarshipId]) VALUES (38, 5, 43)
INSERT [dbo].[FilmStarshipsRaw] ([Id], [FilmId], [StarshipId]) VALUES (39, 5, 47)
INSERT [dbo].[FilmStarshipsRaw] ([Id], [FilmId], [StarshipId]) VALUES (40, 5, 48)
INSERT [dbo].[FilmStarshipsRaw] ([Id], [FilmId], [StarshipId]) VALUES (41, 5, 49)
INSERT [dbo].[FilmStarshipsRaw] ([Id], [FilmId], [StarshipId]) VALUES (42, 5, 52)
INSERT [dbo].[FilmStarshipsRaw] ([Id], [FilmId], [StarshipId]) VALUES (43, 5, 58)
INSERT [dbo].[FilmStarshipsRaw] ([Id], [FilmId], [StarshipId]) VALUES (44, 6, 2)
INSERT [dbo].[FilmStarshipsRaw] ([Id], [FilmId], [StarshipId]) VALUES (45, 6, 32)
INSERT [dbo].[FilmStarshipsRaw] ([Id], [FilmId], [StarshipId]) VALUES (46, 6, 48)
INSERT [dbo].[FilmStarshipsRaw] ([Id], [FilmId], [StarshipId]) VALUES (47, 6, 59)
INSERT [dbo].[FilmStarshipsRaw] ([Id], [FilmId], [StarshipId]) VALUES (48, 6, 61)
INSERT [dbo].[FilmStarshipsRaw] ([Id], [FilmId], [StarshipId]) VALUES (49, 6, 63)
INSERT [dbo].[FilmStarshipsRaw] ([Id], [FilmId], [StarshipId]) VALUES (50, 6, 64)
INSERT [dbo].[FilmStarshipsRaw] ([Id], [FilmId], [StarshipId]) VALUES (51, 6, 65)
INSERT [dbo].[FilmStarshipsRaw] ([Id], [FilmId], [StarshipId]) VALUES (52, 6, 66)
INSERT [dbo].[FilmStarshipsRaw] ([Id], [FilmId], [StarshipId]) VALUES (53, 6, 68)
INSERT [dbo].[FilmStarshipsRaw] ([Id], [FilmId], [StarshipId]) VALUES (54, 6, 74)
INSERT [dbo].[FilmStarshipsRaw] ([Id], [FilmId], [StarshipId]) VALUES (55, 6, 75)
SET IDENTITY_INSERT [dbo].[FilmStarshipsRaw] OFF
SET IDENTITY_INSERT [dbo].[FilmVehiclesRaw] ON 

INSERT [dbo].[FilmVehiclesRaw] ([Id], [FilmId], [VehicleId]) VALUES (1, 1, 4)
INSERT [dbo].[FilmVehiclesRaw] ([Id], [FilmId], [VehicleId]) VALUES (2, 1, 6)
INSERT [dbo].[FilmVehiclesRaw] ([Id], [FilmId], [VehicleId]) VALUES (3, 1, 7)
INSERT [dbo].[FilmVehiclesRaw] ([Id], [FilmId], [VehicleId]) VALUES (4, 1, 8)
INSERT [dbo].[FilmVehiclesRaw] ([Id], [FilmId], [VehicleId]) VALUES (5, 2, 8)
INSERT [dbo].[FilmVehiclesRaw] ([Id], [FilmId], [VehicleId]) VALUES (6, 2, 14)
INSERT [dbo].[FilmVehiclesRaw] ([Id], [FilmId], [VehicleId]) VALUES (7, 2, 16)
INSERT [dbo].[FilmVehiclesRaw] ([Id], [FilmId], [VehicleId]) VALUES (8, 2, 18)
INSERT [dbo].[FilmVehiclesRaw] ([Id], [FilmId], [VehicleId]) VALUES (9, 2, 19)
INSERT [dbo].[FilmVehiclesRaw] ([Id], [FilmId], [VehicleId]) VALUES (10, 2, 20)
INSERT [dbo].[FilmVehiclesRaw] ([Id], [FilmId], [VehicleId]) VALUES (11, 3, 8)
INSERT [dbo].[FilmVehiclesRaw] ([Id], [FilmId], [VehicleId]) VALUES (12, 3, 16)
INSERT [dbo].[FilmVehiclesRaw] ([Id], [FilmId], [VehicleId]) VALUES (13, 3, 18)
INSERT [dbo].[FilmVehiclesRaw] ([Id], [FilmId], [VehicleId]) VALUES (14, 3, 19)
INSERT [dbo].[FilmVehiclesRaw] ([Id], [FilmId], [VehicleId]) VALUES (15, 3, 24)
INSERT [dbo].[FilmVehiclesRaw] ([Id], [FilmId], [VehicleId]) VALUES (16, 3, 25)
INSERT [dbo].[FilmVehiclesRaw] ([Id], [FilmId], [VehicleId]) VALUES (17, 3, 26)
INSERT [dbo].[FilmVehiclesRaw] ([Id], [FilmId], [VehicleId]) VALUES (18, 3, 30)
INSERT [dbo].[FilmVehiclesRaw] ([Id], [FilmId], [VehicleId]) VALUES (19, 4, 33)
INSERT [dbo].[FilmVehiclesRaw] ([Id], [FilmId], [VehicleId]) VALUES (20, 4, 34)
INSERT [dbo].[FilmVehiclesRaw] ([Id], [FilmId], [VehicleId]) VALUES (21, 4, 35)
INSERT [dbo].[FilmVehiclesRaw] ([Id], [FilmId], [VehicleId]) VALUES (22, 4, 36)
INSERT [dbo].[FilmVehiclesRaw] ([Id], [FilmId], [VehicleId]) VALUES (23, 4, 37)
INSERT [dbo].[FilmVehiclesRaw] ([Id], [FilmId], [VehicleId]) VALUES (24, 4, 38)
INSERT [dbo].[FilmVehiclesRaw] ([Id], [FilmId], [VehicleId]) VALUES (25, 4, 42)
INSERT [dbo].[FilmVehiclesRaw] ([Id], [FilmId], [VehicleId]) VALUES (26, 5, 4)
INSERT [dbo].[FilmVehiclesRaw] ([Id], [FilmId], [VehicleId]) VALUES (27, 5, 44)
INSERT [dbo].[FilmVehiclesRaw] ([Id], [FilmId], [VehicleId]) VALUES (28, 5, 45)
INSERT [dbo].[FilmVehiclesRaw] ([Id], [FilmId], [VehicleId]) VALUES (29, 5, 46)
INSERT [dbo].[FilmVehiclesRaw] ([Id], [FilmId], [VehicleId]) VALUES (30, 5, 50)
INSERT [dbo].[FilmVehiclesRaw] ([Id], [FilmId], [VehicleId]) VALUES (31, 5, 51)
INSERT [dbo].[FilmVehiclesRaw] ([Id], [FilmId], [VehicleId]) VALUES (32, 5, 53)
INSERT [dbo].[FilmVehiclesRaw] ([Id], [FilmId], [VehicleId]) VALUES (33, 5, 54)
INSERT [dbo].[FilmVehiclesRaw] ([Id], [FilmId], [VehicleId]) VALUES (34, 5, 55)
INSERT [dbo].[FilmVehiclesRaw] ([Id], [FilmId], [VehicleId]) VALUES (35, 5, 56)
INSERT [dbo].[FilmVehiclesRaw] ([Id], [FilmId], [VehicleId]) VALUES (36, 5, 57)
INSERT [dbo].[FilmVehiclesRaw] ([Id], [FilmId], [VehicleId]) VALUES (37, 6, 33)
INSERT [dbo].[FilmVehiclesRaw] ([Id], [FilmId], [VehicleId]) VALUES (38, 6, 50)
INSERT [dbo].[FilmVehiclesRaw] ([Id], [FilmId], [VehicleId]) VALUES (39, 6, 53)
INSERT [dbo].[FilmVehiclesRaw] ([Id], [FilmId], [VehicleId]) VALUES (40, 6, 56)
INSERT [dbo].[FilmVehiclesRaw] ([Id], [FilmId], [VehicleId]) VALUES (41, 6, 60)
INSERT [dbo].[FilmVehiclesRaw] ([Id], [FilmId], [VehicleId]) VALUES (42, 6, 62)
INSERT [dbo].[FilmVehiclesRaw] ([Id], [FilmId], [VehicleId]) VALUES (43, 6, 67)
INSERT [dbo].[FilmVehiclesRaw] ([Id], [FilmId], [VehicleId]) VALUES (44, 6, 69)
INSERT [dbo].[FilmVehiclesRaw] ([Id], [FilmId], [VehicleId]) VALUES (45, 6, 70)
INSERT [dbo].[FilmVehiclesRaw] ([Id], [FilmId], [VehicleId]) VALUES (46, 6, 71)
INSERT [dbo].[FilmVehiclesRaw] ([Id], [FilmId], [VehicleId]) VALUES (47, 6, 72)
INSERT [dbo].[FilmVehiclesRaw] ([Id], [FilmId], [VehicleId]) VALUES (48, 6, 73)
INSERT [dbo].[FilmVehiclesRaw] ([Id], [FilmId], [VehicleId]) VALUES (49, 6, 76)
SET IDENTITY_INSERT [dbo].[FilmVehiclesRaw] OFF
SET IDENTITY_INSERT [dbo].[PeopleRaw] ON 

INSERT [dbo].[PeopleRaw] ([Id], [Edited], [Name], [Gender], [SkinColor], [HairColor], [Height], [EyeColor], [Mass], [Homeworld], [BirthYear], [Created], [BirthYearParsed], [MassParsed], [HeightParsed]) VALUES (1, N'2014-12-20T21:17:56.891Z', N'Luke Skywalker', N'male', N'fair', N'blond', N'172', N'blue', N'77', 1, N'19BBY', N'2014-12-09T13:50:51.644Z', -19, 77, 172)
INSERT [dbo].[PeopleRaw] ([Id], [Edited], [Name], [Gender], [SkinColor], [HairColor], [Height], [EyeColor], [Mass], [Homeworld], [BirthYear], [Created], [BirthYearParsed], [MassParsed], [HeightParsed]) VALUES (2, N'2014-12-20T21:17:50.309Z', N'C-3PO', N'n/a', N'gold', N'n/a', N'167', N'yellow', N'75', 1, N'112BBY', N'2014-12-10T15:10:51.357Z', -112, 75, 167)
INSERT [dbo].[PeopleRaw] ([Id], [Edited], [Name], [Gender], [SkinColor], [HairColor], [Height], [EyeColor], [Mass], [Homeworld], [BirthYear], [Created], [BirthYearParsed], [MassParsed], [HeightParsed]) VALUES (3, N'2014-12-20T21:17:50.311Z', N'R2-D2', N'n/a', N'white, blue', N'n/a', N'96', N'red', N'32', 8, N'33BBY', N'2014-12-10T15:11:50.376Z', -33, 32, 96)
INSERT [dbo].[PeopleRaw] ([Id], [Edited], [Name], [Gender], [SkinColor], [HairColor], [Height], [EyeColor], [Mass], [Homeworld], [BirthYear], [Created], [BirthYearParsed], [MassParsed], [HeightParsed]) VALUES (4, N'2014-12-20T21:17:50.313Z', N'Darth Vader', N'male', N'white', N'none', N'202', N'yellow', N'136', 1, N'41.9BBY', N'2014-12-10T15:18:20.704Z', -41.9, 136, 202)
INSERT [dbo].[PeopleRaw] ([Id], [Edited], [Name], [Gender], [SkinColor], [HairColor], [Height], [EyeColor], [Mass], [Homeworld], [BirthYear], [Created], [BirthYearParsed], [MassParsed], [HeightParsed]) VALUES (5, N'2014-12-20T21:17:50.315Z', N'Leia Organa', N'female', N'light', N'brown', N'150', N'brown', N'49', 2, N'19BBY', N'2014-12-10T15:20:09.791Z', -19, 49, 150)
INSERT [dbo].[PeopleRaw] ([Id], [Edited], [Name], [Gender], [SkinColor], [HairColor], [Height], [EyeColor], [Mass], [Homeworld], [BirthYear], [Created], [BirthYearParsed], [MassParsed], [HeightParsed]) VALUES (6, N'2014-12-20T21:17:50.317Z', N'Owen Lars', N'male', N'light', N'brown, grey', N'178', N'blue', N'120', 1, N'52BBY', N'2014-12-10T15:52:14.024Z', -52, 120, 178)
INSERT [dbo].[PeopleRaw] ([Id], [Edited], [Name], [Gender], [SkinColor], [HairColor], [Height], [EyeColor], [Mass], [Homeworld], [BirthYear], [Created], [BirthYearParsed], [MassParsed], [HeightParsed]) VALUES (7, N'2014-12-20T21:17:50.319Z', N'Beru Whitesun lars', N'female', N'light', N'brown', N'165', N'blue', N'75', 1, N'47BBY', N'2014-12-10T15:53:41.121Z', -47, 75, 165)
INSERT [dbo].[PeopleRaw] ([Id], [Edited], [Name], [Gender], [SkinColor], [HairColor], [Height], [EyeColor], [Mass], [Homeworld], [BirthYear], [Created], [BirthYearParsed], [MassParsed], [HeightParsed]) VALUES (8, N'2014-12-20T21:17:50.321Z', N'R5-D4', N'n/a', N'white, red', N'n/a', N'97', N'red', N'32', 1, N'unknown', N'2014-12-10T15:57:50.959Z', NULL, 32, 97)
INSERT [dbo].[PeopleRaw] ([Id], [Edited], [Name], [Gender], [SkinColor], [HairColor], [Height], [EyeColor], [Mass], [Homeworld], [BirthYear], [Created], [BirthYearParsed], [MassParsed], [HeightParsed]) VALUES (9, N'2014-12-20T21:17:50.323Z', N'Biggs Darklighter', N'male', N'light', N'black', N'183', N'brown', N'84', 1, N'24BBY', N'2014-12-10T15:59:50.509Z', -24, 84, 183)
INSERT [dbo].[PeopleRaw] ([Id], [Edited], [Name], [Gender], [SkinColor], [HairColor], [Height], [EyeColor], [Mass], [Homeworld], [BirthYear], [Created], [BirthYearParsed], [MassParsed], [HeightParsed]) VALUES (10, N'2014-12-20T21:17:50.325Z', N'Obi-Wan Kenobi', N'male', N'fair', N'auburn, white', N'182', N'blue-gray', N'77', 20, N'57BBY', N'2014-12-10T16:16:29.192Z', -57, 77, 182)
INSERT [dbo].[PeopleRaw] ([Id], [Edited], [Name], [Gender], [SkinColor], [HairColor], [Height], [EyeColor], [Mass], [Homeworld], [BirthYear], [Created], [BirthYearParsed], [MassParsed], [HeightParsed]) VALUES (11, N'2014-12-20T21:17:50.327Z', N'Anakin Skywalker', N'male', N'fair', N'blond', N'188', N'blue', N'84', 1, N'41.9BBY', N'2014-12-10T16:20:44.310Z', -41.9, 84, 188)
INSERT [dbo].[PeopleRaw] ([Id], [Edited], [Name], [Gender], [SkinColor], [HairColor], [Height], [EyeColor], [Mass], [Homeworld], [BirthYear], [Created], [BirthYearParsed], [MassParsed], [HeightParsed]) VALUES (12, N'2014-12-20T21:17:50.330Z', N'Wilhuff Tarkin', N'male', N'fair', N'auburn, grey', N'180', N'blue', N'unknown', 21, N'64BBY', N'2014-12-10T16:26:56.138Z', -64, NULL, NULL)
INSERT [dbo].[PeopleRaw] ([Id], [Edited], [Name], [Gender], [SkinColor], [HairColor], [Height], [EyeColor], [Mass], [Homeworld], [BirthYear], [Created], [BirthYearParsed], [MassParsed], [HeightParsed]) VALUES (13, N'2014-12-20T21:17:50.332Z', N'Chewbacca', N'male', N'unknown', N'brown', N'228', N'blue', N'112', 14, N'200BBY', N'2014-12-10T16:42:45.066Z', -200, 112, 228)
INSERT [dbo].[PeopleRaw] ([Id], [Edited], [Name], [Gender], [SkinColor], [HairColor], [Height], [EyeColor], [Mass], [Homeworld], [BirthYear], [Created], [BirthYearParsed], [MassParsed], [HeightParsed]) VALUES (14, N'2014-12-20T21:17:50.334Z', N'Han Solo', N'male', N'fair', N'brown', N'180', N'brown', N'80', 22, N'29BBY', N'2014-12-10T16:49:14.582Z', -29, 80, 180)
INSERT [dbo].[PeopleRaw] ([Id], [Edited], [Name], [Gender], [SkinColor], [HairColor], [Height], [EyeColor], [Mass], [Homeworld], [BirthYear], [Created], [BirthYearParsed], [MassParsed], [HeightParsed]) VALUES (15, N'2014-12-20T21:17:50.336Z', N'Greedo', N'male', N'green', N'n/a', N'173', N'black', N'74', 23, N'44BBY', N'2014-12-10T17:03:30.334Z', -44, 74, 173)
INSERT [dbo].[PeopleRaw] ([Id], [Edited], [Name], [Gender], [SkinColor], [HairColor], [Height], [EyeColor], [Mass], [Homeworld], [BirthYear], [Created], [BirthYearParsed], [MassParsed], [HeightParsed]) VALUES (16, N'2014-12-20T21:17:50.338Z', N'Jabba Desilijic Tiure', N'hermaphrodite', N'green-tan, brown', N'n/a', N'175', N'orange', N'1358', 24, N'600BBY', N'2014-12-10T17:11:31.638Z', -600, 1358, 175)
INSERT [dbo].[PeopleRaw] ([Id], [Edited], [Name], [Gender], [SkinColor], [HairColor], [Height], [EyeColor], [Mass], [Homeworld], [BirthYear], [Created], [BirthYearParsed], [MassParsed], [HeightParsed]) VALUES (18, N'2014-12-20T21:17:50.341Z', N'Wedge Antilles', N'male', N'fair', N'brown', N'170', N'hazel', N'77', 22, N'21BBY', N'2014-12-12T11:08:06.469Z', -21, 77, 170)
INSERT [dbo].[PeopleRaw] ([Id], [Edited], [Name], [Gender], [SkinColor], [HairColor], [Height], [EyeColor], [Mass], [Homeworld], [BirthYear], [Created], [BirthYearParsed], [MassParsed], [HeightParsed]) VALUES (19, N'2014-12-20T21:17:50.343Z', N'Jek Tono Porkins', N'male', N'fair', N'brown', N'180', N'blue', N'110', 26, N'unknown', N'2014-12-12T11:16:56.569Z', NULL, 110, 180)
INSERT [dbo].[PeopleRaw] ([Id], [Edited], [Name], [Gender], [SkinColor], [HairColor], [Height], [EyeColor], [Mass], [Homeworld], [BirthYear], [Created], [BirthYearParsed], [MassParsed], [HeightParsed]) VALUES (20, N'2014-12-20T21:17:50.345Z', N'Yoda', N'male', N'green', N'white', N'66', N'brown', N'17', 28, N'896BBY', N'2014-12-15T12:26:01.042Z', -896, 17, 66)
INSERT [dbo].[PeopleRaw] ([Id], [Edited], [Name], [Gender], [SkinColor], [HairColor], [Height], [EyeColor], [Mass], [Homeworld], [BirthYear], [Created], [BirthYearParsed], [MassParsed], [HeightParsed]) VALUES (21, N'2014-12-20T21:17:50.347Z', N'Palpatine', N'male', N'pale', N'grey', N'170', N'yellow', N'75', 8, N'82BBY', N'2014-12-15T12:48:05.971Z', -82, 75, 170)
INSERT [dbo].[PeopleRaw] ([Id], [Edited], [Name], [Gender], [SkinColor], [HairColor], [Height], [EyeColor], [Mass], [Homeworld], [BirthYear], [Created], [BirthYearParsed], [MassParsed], [HeightParsed]) VALUES (22, N'2014-12-20T21:17:50.349Z', N'Boba Fett', N'male', N'fair', N'black', N'183', N'brown', N'78.2', 10, N'31.5BBY', N'2014-12-15T12:49:32.457Z', -31.5, 78.2, 183)
INSERT [dbo].[PeopleRaw] ([Id], [Edited], [Name], [Gender], [SkinColor], [HairColor], [Height], [EyeColor], [Mass], [Homeworld], [BirthYear], [Created], [BirthYearParsed], [MassParsed], [HeightParsed]) VALUES (23, N'2014-12-20T21:17:50.351Z', N'IG-88', N'n/a', N'metal', N'none', N'200', N'red', N'140', 28, N'15BBY', N'2014-12-15T12:51:10.076Z', -15, 140, 200)
INSERT [dbo].[PeopleRaw] ([Id], [Edited], [Name], [Gender], [SkinColor], [HairColor], [Height], [EyeColor], [Mass], [Homeworld], [BirthYear], [Created], [BirthYearParsed], [MassParsed], [HeightParsed]) VALUES (24, N'2014-12-20T21:17:50.355Z', N'Bossk', N'male', N'green', N'none', N'190', N'red', N'113', 29, N'53BBY', N'2014-12-15T12:53:49.297Z', -53, 113, 190)
INSERT [dbo].[PeopleRaw] ([Id], [Edited], [Name], [Gender], [SkinColor], [HairColor], [Height], [EyeColor], [Mass], [Homeworld], [BirthYear], [Created], [BirthYearParsed], [MassParsed], [HeightParsed]) VALUES (25, N'2014-12-20T21:17:50.357Z', N'Lando Calrissian', N'male', N'dark', N'black', N'177', N'brown', N'79', 30, N'31BBY', N'2014-12-15T12:56:32.683Z', -31, 79, 177)
INSERT [dbo].[PeopleRaw] ([Id], [Edited], [Name], [Gender], [SkinColor], [HairColor], [Height], [EyeColor], [Mass], [Homeworld], [BirthYear], [Created], [BirthYearParsed], [MassParsed], [HeightParsed]) VALUES (26, N'2014-12-20T21:17:50.359Z', N'Lobot', N'male', N'light', N'none', N'175', N'blue', N'79', 6, N'37BBY', N'2014-12-15T13:01:57.178Z', -37, 79, 175)
INSERT [dbo].[PeopleRaw] ([Id], [Edited], [Name], [Gender], [SkinColor], [HairColor], [Height], [EyeColor], [Mass], [Homeworld], [BirthYear], [Created], [BirthYearParsed], [MassParsed], [HeightParsed]) VALUES (27, N'2014-12-20T21:17:50.362Z', N'Ackbar', N'male', N'brown mottle', N'none', N'180', N'orange', N'83', 31, N'41BBY', N'2014-12-18T11:07:50.584Z', -41, 83, 180)
INSERT [dbo].[PeopleRaw] ([Id], [Edited], [Name], [Gender], [SkinColor], [HairColor], [Height], [EyeColor], [Mass], [Homeworld], [BirthYear], [Created], [BirthYearParsed], [MassParsed], [HeightParsed]) VALUES (28, N'2014-12-20T21:17:50.364Z', N'Mon Mothma', N'female', N'fair', N'auburn', N'150', N'blue', N'unknown', 32, N'48BBY', N'2014-12-18T11:12:38.895Z', -48, 50, NULL)
INSERT [dbo].[PeopleRaw] ([Id], [Edited], [Name], [Gender], [SkinColor], [HairColor], [Height], [EyeColor], [Mass], [Homeworld], [BirthYear], [Created], [BirthYearParsed], [MassParsed], [HeightParsed]) VALUES (29, N'2014-12-20T21:17:50.367Z', N'Arvel Crynyd', N'male', N'fair', N'brown', N'unknown', N'brown', N'unknown', 28, N'unknown', N'2014-12-18T11:16:33.020Z', NULL, NULL, NULL)
INSERT [dbo].[PeopleRaw] ([Id], [Edited], [Name], [Gender], [SkinColor], [HairColor], [Height], [EyeColor], [Mass], [Homeworld], [BirthYear], [Created], [BirthYearParsed], [MassParsed], [HeightParsed]) VALUES (30, N'2014-12-20T21:17:50.369Z', N'Wicket Systri Warrick', N'male', N'brown', N'brown', N'88', N'brown', N'20', 7, N'8BBY', N'2014-12-18T11:21:58.954Z', -8, 20, 88)
INSERT [dbo].[PeopleRaw] ([Id], [Edited], [Name], [Gender], [SkinColor], [HairColor], [Height], [EyeColor], [Mass], [Homeworld], [BirthYear], [Created], [BirthYearParsed], [MassParsed], [HeightParsed]) VALUES (31, N'2014-12-20T21:17:50.371Z', N'Nien Nunb', N'male', N'grey', N'none', N'160', N'black', N'68', 33, N'unknown', N'2014-12-18T11:26:18.541Z', NULL, 68, 160)
INSERT [dbo].[PeopleRaw] ([Id], [Edited], [Name], [Gender], [SkinColor], [HairColor], [Height], [EyeColor], [Mass], [Homeworld], [BirthYear], [Created], [BirthYearParsed], [MassParsed], [HeightParsed]) VALUES (32, N'2014-12-20T21:17:50.375Z', N'Qui-Gon Jinn', N'male', N'fair', N'brown', N'193', N'blue', N'89', 28, N'92BBY', N'2014-12-19T16:54:53.618Z', -92, 89, 193)
INSERT [dbo].[PeopleRaw] ([Id], [Edited], [Name], [Gender], [SkinColor], [HairColor], [Height], [EyeColor], [Mass], [Homeworld], [BirthYear], [Created], [BirthYearParsed], [MassParsed], [HeightParsed]) VALUES (33, N'2014-12-20T21:17:50.377Z', N'Nute Gunray', N'male', N'mottled green', N'none', N'191', N'red', N'90', 18, N'unknown', N'2014-12-19T17:05:57.357Z', NULL, 90, 191)
INSERT [dbo].[PeopleRaw] ([Id], [Edited], [Name], [Gender], [SkinColor], [HairColor], [Height], [EyeColor], [Mass], [Homeworld], [BirthYear], [Created], [BirthYearParsed], [MassParsed], [HeightParsed]) VALUES (34, N'2014-12-20T21:17:50.379Z', N'Finis Valorum', N'male', N'fair', N'blond', N'170', N'blue', N'unknown', 9, N'91BBY', N'2014-12-19T17:21:45.915Z', -91, NULL, NULL)
INSERT [dbo].[PeopleRaw] ([Id], [Edited], [Name], [Gender], [SkinColor], [HairColor], [Height], [EyeColor], [Mass], [Homeworld], [BirthYear], [Created], [BirthYearParsed], [MassParsed], [HeightParsed]) VALUES (35, N'2014-12-20T21:17:50.381Z', N'Padmé Amidala', N'female', N'light', N'brown', N'185', N'brown', N'45', 8, N'46BBY', N'2014-12-19T17:28:26.926Z', -46, 45, 185)
INSERT [dbo].[PeopleRaw] ([Id], [Edited], [Name], [Gender], [SkinColor], [HairColor], [Height], [EyeColor], [Mass], [Homeworld], [BirthYear], [Created], [BirthYearParsed], [MassParsed], [HeightParsed]) VALUES (36, N'2014-12-20T21:17:50.383Z', N'Jar Jar Binks', N'male', N'orange', N'none', N'196', N'orange', N'66', 8, N'52BBY', N'2014-12-19T17:29:32.489Z', -52, 66, 196)
INSERT [dbo].[PeopleRaw] ([Id], [Edited], [Name], [Gender], [SkinColor], [HairColor], [Height], [EyeColor], [Mass], [Homeworld], [BirthYear], [Created], [BirthYearParsed], [MassParsed], [HeightParsed]) VALUES (37, N'2014-12-20T21:17:50.385Z', N'Roos Tarpals', N'male', N'grey', N'none', N'224', N'orange', N'82', 8, N'unknown', N'2014-12-19T17:32:56.741Z', NULL, 82, 224)
INSERT [dbo].[PeopleRaw] ([Id], [Edited], [Name], [Gender], [SkinColor], [HairColor], [Height], [EyeColor], [Mass], [Homeworld], [BirthYear], [Created], [BirthYearParsed], [MassParsed], [HeightParsed]) VALUES (38, N'2014-12-20T21:17:50.388Z', N'Rugor Nass', N'male', N'green', N'none', N'206', N'orange', N'unknown', 8, N'unknown', N'2014-12-19T17:33:38.909Z', NULL, NULL, NULL)
INSERT [dbo].[PeopleRaw] ([Id], [Edited], [Name], [Gender], [SkinColor], [HairColor], [Height], [EyeColor], [Mass], [Homeworld], [BirthYear], [Created], [BirthYearParsed], [MassParsed], [HeightParsed]) VALUES (39, N'2014-12-20T21:17:50.392Z', N'Ric Olié', N'male', N'fair', N'brown', N'183', N'blue', N'unknown', 8, N'unknown', N'2014-12-19T17:45:01.522Z', NULL, NULL, NULL)
INSERT [dbo].[PeopleRaw] ([Id], [Edited], [Name], [Gender], [SkinColor], [HairColor], [Height], [EyeColor], [Mass], [Homeworld], [BirthYear], [Created], [BirthYearParsed], [MassParsed], [HeightParsed]) VALUES (40, N'2014-12-20T21:17:50.395Z', N'Watto', N'male', N'blue, grey', N'black', N'137', N'yellow', N'unknown', 34, N'unknown', N'2014-12-19T17:48:54.647Z', NULL, NULL, NULL)
INSERT [dbo].[PeopleRaw] ([Id], [Edited], [Name], [Gender], [SkinColor], [HairColor], [Height], [EyeColor], [Mass], [Homeworld], [BirthYear], [Created], [BirthYearParsed], [MassParsed], [HeightParsed]) VALUES (41, N'2014-12-20T21:17:50.397Z', N'Sebulba', N'male', N'grey, red', N'none', N'112', N'orange', N'40', 35, N'unknown', N'2014-12-19T17:53:02.586Z', NULL, 40, 112)
INSERT [dbo].[PeopleRaw] ([Id], [Edited], [Name], [Gender], [SkinColor], [HairColor], [Height], [EyeColor], [Mass], [Homeworld], [BirthYear], [Created], [BirthYearParsed], [MassParsed], [HeightParsed]) VALUES (42, N'2014-12-20T21:17:50.399Z', N'Quarsh Panaka', N'male', N'dark', N'black', N'183', N'brown', N'unknown', 8, N'62BBY', N'2014-12-19T17:55:43.348Z', -62, NULL, NULL)
INSERT [dbo].[PeopleRaw] ([Id], [Edited], [Name], [Gender], [SkinColor], [HairColor], [Height], [EyeColor], [Mass], [Homeworld], [BirthYear], [Created], [BirthYearParsed], [MassParsed], [HeightParsed]) VALUES (43, N'2014-12-20T21:17:50.401Z', N'Shmi Skywalker', N'female', N'fair', N'black', N'163', N'brown', N'unknown', 1, N'72BBY', N'2014-12-19T17:57:41.191Z', -72, 50, NULL)
INSERT [dbo].[PeopleRaw] ([Id], [Edited], [Name], [Gender], [SkinColor], [HairColor], [Height], [EyeColor], [Mass], [Homeworld], [BirthYear], [Created], [BirthYearParsed], [MassParsed], [HeightParsed]) VALUES (44, N'2014-12-20T21:17:50.403Z', N'Darth Maul', N'male', N'red', N'none', N'175', N'yellow', N'80', 36, N'54BBY', N'2014-12-19T18:00:41.929Z', -54, 80, 175)
INSERT [dbo].[PeopleRaw] ([Id], [Edited], [Name], [Gender], [SkinColor], [HairColor], [Height], [EyeColor], [Mass], [Homeworld], [BirthYear], [Created], [BirthYearParsed], [MassParsed], [HeightParsed]) VALUES (45, N'2014-12-20T21:17:50.407Z', N'Bib Fortuna', N'male', N'pale', N'none', N'180', N'pink', N'unknown', 37, N'unknown', N'2014-12-20T09:47:02.512Z', NULL, NULL, NULL)
INSERT [dbo].[PeopleRaw] ([Id], [Edited], [Name], [Gender], [SkinColor], [HairColor], [Height], [EyeColor], [Mass], [Homeworld], [BirthYear], [Created], [BirthYearParsed], [MassParsed], [HeightParsed]) VALUES (46, N'2014-12-20T21:17:50.409Z', N'Ayla Secura', N'female', N'blue', N'none', N'178', N'hazel', N'55', 37, N'48BBY', N'2014-12-20T09:48:01.172Z', -48, 55, 178)
INSERT [dbo].[PeopleRaw] ([Id], [Edited], [Name], [Gender], [SkinColor], [HairColor], [Height], [EyeColor], [Mass], [Homeworld], [BirthYear], [Created], [BirthYearParsed], [MassParsed], [HeightParsed]) VALUES (47, N'2014-12-20T21:17:50.410Z', N'Ratts Tyerel', N'male', N'grey, blue', N'none', N'79', N'unknown', N'15', 38, N'unknown', N'2014-12-20T09:53:15.086Z', NULL, 15, 79)
INSERT [dbo].[PeopleRaw] ([Id], [Edited], [Name], [Gender], [SkinColor], [HairColor], [Height], [EyeColor], [Mass], [Homeworld], [BirthYear], [Created], [BirthYearParsed], [MassParsed], [HeightParsed]) VALUES (48, N'2014-12-20T21:17:50.414Z', N'Dud Bolt', N'male', N'blue, grey', N'none', N'94', N'yellow', N'45', 39, N'unknown', N'2014-12-20T09:57:31.858Z', NULL, 45, 94)
INSERT [dbo].[PeopleRaw] ([Id], [Edited], [Name], [Gender], [SkinColor], [HairColor], [Height], [EyeColor], [Mass], [Homeworld], [BirthYear], [Created], [BirthYearParsed], [MassParsed], [HeightParsed]) VALUES (49, N'2014-12-20T21:17:50.416Z', N'Gasgano', N'male', N'white, blue', N'none', N'122', N'black', N'unknown', 40, N'unknown', N'2014-12-20T10:02:12.223Z', NULL, NULL, NULL)
INSERT [dbo].[PeopleRaw] ([Id], [Edited], [Name], [Gender], [SkinColor], [HairColor], [Height], [EyeColor], [Mass], [Homeworld], [BirthYear], [Created], [BirthYearParsed], [MassParsed], [HeightParsed]) VALUES (50, N'2014-12-20T21:17:50.417Z', N'Ben Quadinaros', N'male', N'grey, green, yellow', N'none', N'163', N'orange', N'65', 41, N'unknown', N'2014-12-20T10:08:33.777Z', NULL, 65, 163)
INSERT [dbo].[PeopleRaw] ([Id], [Edited], [Name], [Gender], [SkinColor], [HairColor], [Height], [EyeColor], [Mass], [Homeworld], [BirthYear], [Created], [BirthYearParsed], [MassParsed], [HeightParsed]) VALUES (51, N'2014-12-20T21:17:50.420Z', N'Mace Windu', N'male', N'dark', N'none', N'188', N'brown', N'84', 42, N'72BBY', N'2014-12-20T10:12:30.846Z', -72, 84, 188)
INSERT [dbo].[PeopleRaw] ([Id], [Edited], [Name], [Gender], [SkinColor], [HairColor], [Height], [EyeColor], [Mass], [Homeworld], [BirthYear], [Created], [BirthYearParsed], [MassParsed], [HeightParsed]) VALUES (52, N'2014-12-20T21:17:50.422Z', N'Ki-Adi-Mundi', N'male', N'pale', N'white', N'198', N'yellow', N'82', 43, N'92BBY', N'2014-12-20T10:15:32.293Z', -92, 82, 198)
INSERT [dbo].[PeopleRaw] ([Id], [Edited], [Name], [Gender], [SkinColor], [HairColor], [Height], [EyeColor], [Mass], [Homeworld], [BirthYear], [Created], [BirthYearParsed], [MassParsed], [HeightParsed]) VALUES (53, N'2014-12-20T21:17:50.424Z', N'Kit Fisto', N'male', N'green', N'none', N'196', N'black', N'87', 44, N'unknown', N'2014-12-20T10:18:57.202Z', NULL, 87, 196)
INSERT [dbo].[PeopleRaw] ([Id], [Edited], [Name], [Gender], [SkinColor], [HairColor], [Height], [EyeColor], [Mass], [Homeworld], [BirthYear], [Created], [BirthYearParsed], [MassParsed], [HeightParsed]) VALUES (54, N'2014-12-20T21:17:50.427Z', N'Eeth Koth', N'male', N'brown', N'black', N'171', N'brown', N'unknown', 45, N'unknown', N'2014-12-20T10:26:47.902Z', NULL, NULL, NULL)
INSERT [dbo].[PeopleRaw] ([Id], [Edited], [Name], [Gender], [SkinColor], [HairColor], [Height], [EyeColor], [Mass], [Homeworld], [BirthYear], [Created], [BirthYearParsed], [MassParsed], [HeightParsed]) VALUES (55, N'2014-12-20T21:17:50.432Z', N'Adi Gallia', N'female', N'dark', N'none', N'184', N'blue', N'50', 9, N'unknown', N'2014-12-20T10:29:11.661Z', NULL, 50, 184)
INSERT [dbo].[PeopleRaw] ([Id], [Edited], [Name], [Gender], [SkinColor], [HairColor], [Height], [EyeColor], [Mass], [Homeworld], [BirthYear], [Created], [BirthYearParsed], [MassParsed], [HeightParsed]) VALUES (56, N'2014-12-20T21:17:50.434Z', N'Saesee Tiin', N'male', N'pale', N'none', N'188', N'orange', N'unknown', 47, N'unknown', N'2014-12-20T10:32:11.669Z', NULL, NULL, NULL)
INSERT [dbo].[PeopleRaw] ([Id], [Edited], [Name], [Gender], [SkinColor], [HairColor], [Height], [EyeColor], [Mass], [Homeworld], [BirthYear], [Created], [BirthYearParsed], [MassParsed], [HeightParsed]) VALUES (57, N'2014-12-20T21:17:50.437Z', N'Yarael Poof', N'male', N'white', N'none', N'264', N'yellow', N'unknown', 48, N'unknown', N'2014-12-20T10:34:48.725Z', NULL, NULL, NULL)
INSERT [dbo].[PeopleRaw] ([Id], [Edited], [Name], [Gender], [SkinColor], [HairColor], [Height], [EyeColor], [Mass], [Homeworld], [BirthYear], [Created], [BirthYearParsed], [MassParsed], [HeightParsed]) VALUES (58, N'2014-12-20T21:17:50.439Z', N'Plo Koon', N'male', N'orange', N'none', N'188', N'black', N'80', 49, N'22BBY', N'2014-12-20T10:49:19.859Z', -22, 80, 188)
INSERT [dbo].[PeopleRaw] ([Id], [Edited], [Name], [Gender], [SkinColor], [HairColor], [Height], [EyeColor], [Mass], [Homeworld], [BirthYear], [Created], [BirthYearParsed], [MassParsed], [HeightParsed]) VALUES (59, N'2014-12-20T21:17:50.442Z', N'Mas Amedda', N'male', N'blue', N'none', N'196', N'blue', N'unknown', 50, N'unknown', N'2014-12-20T10:53:26.457Z', NULL, NULL, NULL)
INSERT [dbo].[PeopleRaw] ([Id], [Edited], [Name], [Gender], [SkinColor], [HairColor], [Height], [EyeColor], [Mass], [Homeworld], [BirthYear], [Created], [BirthYearParsed], [MassParsed], [HeightParsed]) VALUES (60, N'2014-12-20T21:17:50.445Z', N'Gregar Typho', N'male', N'dark', N'black', N'185', N'brown', N'85', 8, N'unknown', N'2014-12-20T11:10:10.381Z', NULL, 85, 185)
INSERT [dbo].[PeopleRaw] ([Id], [Edited], [Name], [Gender], [SkinColor], [HairColor], [Height], [EyeColor], [Mass], [Homeworld], [BirthYear], [Created], [BirthYearParsed], [MassParsed], [HeightParsed]) VALUES (61, N'2014-12-20T21:17:50.449Z', N'Cordé', N'female', N'light', N'brown', N'157', N'brown', N'unknown', 8, N'unknown', N'2014-12-20T11:11:39.630Z', NULL, NULL, NULL)
INSERT [dbo].[PeopleRaw] ([Id], [Edited], [Name], [Gender], [SkinColor], [HairColor], [Height], [EyeColor], [Mass], [Homeworld], [BirthYear], [Created], [BirthYearParsed], [MassParsed], [HeightParsed]) VALUES (62, N'2014-12-20T21:17:50.451Z', N'Cliegg Lars', N'male', N'fair', N'brown', N'183', N'blue', N'unknown', 1, N'82BBY', N'2014-12-20T15:59:03.958Z', -82, NULL, NULL)
INSERT [dbo].[PeopleRaw] ([Id], [Edited], [Name], [Gender], [SkinColor], [HairColor], [Height], [EyeColor], [Mass], [Homeworld], [BirthYear], [Created], [BirthYearParsed], [MassParsed], [HeightParsed]) VALUES (63, N'2014-12-20T21:17:50.453Z', N'Poggle the Lesser', N'male', N'green', N'none', N'183', N'yellow', N'80', 11, N'unknown', N'2014-12-20T16:40:43.977Z', NULL, 80, 183)
INSERT [dbo].[PeopleRaw] ([Id], [Edited], [Name], [Gender], [SkinColor], [HairColor], [Height], [EyeColor], [Mass], [Homeworld], [BirthYear], [Created], [BirthYearParsed], [MassParsed], [HeightParsed]) VALUES (64, N'2014-12-20T21:17:50.455Z', N'Luminara Unduli', N'female', N'yellow', N'black', N'170', N'blue', N'56.2', 51, N'58BBY', N'2014-12-20T16:45:53.668Z', -58, 56.2, 170)
INSERT [dbo].[PeopleRaw] ([Id], [Edited], [Name], [Gender], [SkinColor], [HairColor], [Height], [EyeColor], [Mass], [Homeworld], [BirthYear], [Created], [BirthYearParsed], [MassParsed], [HeightParsed]) VALUES (65, N'2014-12-20T21:17:50.457Z', N'Barriss Offee', N'female', N'yellow', N'black', N'166', N'blue', N'50', 51, N'40BBY', N'2014-12-20T16:46:40.440Z', -40, 50, 166)
INSERT [dbo].[PeopleRaw] ([Id], [Edited], [Name], [Gender], [SkinColor], [HairColor], [Height], [EyeColor], [Mass], [Homeworld], [BirthYear], [Created], [BirthYearParsed], [MassParsed], [HeightParsed]) VALUES (66, N'2014-12-20T21:17:50.460Z', N'Dormé', N'female', N'light', N'brown', N'165', N'brown', N'unknown', 8, N'unknown', N'2014-12-20T16:49:14.640Z', NULL, NULL, NULL)
INSERT [dbo].[PeopleRaw] ([Id], [Edited], [Name], [Gender], [SkinColor], [HairColor], [Height], [EyeColor], [Mass], [Homeworld], [BirthYear], [Created], [BirthYearParsed], [MassParsed], [HeightParsed]) VALUES (67, N'2014-12-20T21:17:50.462Z', N'Dooku', N'male', N'fair', N'white', N'193', N'brown', N'80', 52, N'102BBY', N'2014-12-20T16:52:14.726Z', -102, 80, 193)
INSERT [dbo].[PeopleRaw] ([Id], [Edited], [Name], [Gender], [SkinColor], [HairColor], [Height], [EyeColor], [Mass], [Homeworld], [BirthYear], [Created], [BirthYearParsed], [MassParsed], [HeightParsed]) VALUES (68, N'2014-12-20T21:17:50.463Z', N'Bail Prestor Organa', N'male', N'tan', N'black', N'191', N'brown', N'unknown', 2, N'67BBY', N'2014-12-20T16:53:08.575Z', -67, NULL, NULL)
INSERT [dbo].[PeopleRaw] ([Id], [Edited], [Name], [Gender], [SkinColor], [HairColor], [Height], [EyeColor], [Mass], [Homeworld], [BirthYear], [Created], [BirthYearParsed], [MassParsed], [HeightParsed]) VALUES (69, N'2014-12-20T21:17:50.465Z', N'Jango Fett', N'male', N'tan', N'black', N'183', N'brown', N'79', 53, N'66BBY', N'2014-12-20T16:54:41.620Z', -66, 79, 183)
INSERT [dbo].[PeopleRaw] ([Id], [Edited], [Name], [Gender], [SkinColor], [HairColor], [Height], [EyeColor], [Mass], [Homeworld], [BirthYear], [Created], [BirthYearParsed], [MassParsed], [HeightParsed]) VALUES (70, N'2014-12-20T21:17:50.468Z', N'Zam Wesell', N'female', N'fair, green, yellow', N'blonde', N'168', N'yellow', N'55', 54, N'unknown', N'2014-12-20T16:57:44.471Z', NULL, 55, 168)
INSERT [dbo].[PeopleRaw] ([Id], [Edited], [Name], [Gender], [SkinColor], [HairColor], [Height], [EyeColor], [Mass], [Homeworld], [BirthYear], [Created], [BirthYearParsed], [MassParsed], [HeightParsed]) VALUES (71, N'2014-12-20T21:17:50.470Z', N'Dexter Jettster', N'male', N'brown', N'none', N'198', N'yellow', N'102', 55, N'unknown', N'2014-12-20T17:28:27.248Z', NULL, 102, 198)
INSERT [dbo].[PeopleRaw] ([Id], [Edited], [Name], [Gender], [SkinColor], [HairColor], [Height], [EyeColor], [Mass], [Homeworld], [BirthYear], [Created], [BirthYearParsed], [MassParsed], [HeightParsed]) VALUES (72, N'2014-12-20T21:17:50.473Z', N'Lama Su', N'male', N'grey', N'none', N'229', N'black', N'88', 10, N'unknown', N'2014-12-20T17:30:50.416Z', NULL, 88, 229)
INSERT [dbo].[PeopleRaw] ([Id], [Edited], [Name], [Gender], [SkinColor], [HairColor], [Height], [EyeColor], [Mass], [Homeworld], [BirthYear], [Created], [BirthYearParsed], [MassParsed], [HeightParsed]) VALUES (73, N'2014-12-20T21:17:50.474Z', N'Taun We', N'female', N'grey', N'none', N'213', N'black', N'unknown', 10, N'unknown', N'2014-12-20T17:31:21.195Z', NULL, NULL, NULL)
INSERT [dbo].[PeopleRaw] ([Id], [Edited], [Name], [Gender], [SkinColor], [HairColor], [Height], [EyeColor], [Mass], [Homeworld], [BirthYear], [Created], [BirthYearParsed], [MassParsed], [HeightParsed]) VALUES (74, N'2014-12-20T21:17:50.476Z', N'Jocasta Nu', N'female', N'fair', N'white', N'167', N'blue', N'unknown', 9, N'unknown', N'2014-12-20T17:32:51.996Z', NULL, NULL, NULL)
INSERT [dbo].[PeopleRaw] ([Id], [Edited], [Name], [Gender], [SkinColor], [HairColor], [Height], [EyeColor], [Mass], [Homeworld], [BirthYear], [Created], [BirthYearParsed], [MassParsed], [HeightParsed]) VALUES (75, N'2014-12-20T21:17:50.478Z', N'R4-P17', N'female', N'silver, red', N'none', N'96', N'red, blue', N'unknown', 28, N'unknown', N'2014-12-20T17:43:36.409Z', NULL, NULL, NULL)
INSERT [dbo].[PeopleRaw] ([Id], [Edited], [Name], [Gender], [SkinColor], [HairColor], [Height], [EyeColor], [Mass], [Homeworld], [BirthYear], [Created], [BirthYearParsed], [MassParsed], [HeightParsed]) VALUES (76, N'2014-12-20T21:17:50.481Z', N'Wat Tambor', N'male', N'green, grey', N'none', N'193', N'unknown', N'48', 56, N'unknown', N'2014-12-20T17:53:52.607Z', NULL, 48, 193)
INSERT [dbo].[PeopleRaw] ([Id], [Edited], [Name], [Gender], [SkinColor], [HairColor], [Height], [EyeColor], [Mass], [Homeworld], [BirthYear], [Created], [BirthYearParsed], [MassParsed], [HeightParsed]) VALUES (77, N'2014-12-20T21:17:50.484Z', N'San Hill', N'male', N'grey', N'none', N'191', N'gold', N'unknown', 57, N'unknown', N'2014-12-20T17:58:17.049Z', NULL, NULL, NULL)
INSERT [dbo].[PeopleRaw] ([Id], [Edited], [Name], [Gender], [SkinColor], [HairColor], [Height], [EyeColor], [Mass], [Homeworld], [BirthYear], [Created], [BirthYearParsed], [MassParsed], [HeightParsed]) VALUES (78, N'2014-12-20T21:17:50.486Z', N'Shaak Ti', N'female', N'red, blue, white', N'none', N'178', N'black', N'57', 58, N'unknown', N'2014-12-20T18:44:01.103Z', NULL, 57, 178)
INSERT [dbo].[PeopleRaw] ([Id], [Edited], [Name], [Gender], [SkinColor], [HairColor], [Height], [EyeColor], [Mass], [Homeworld], [BirthYear], [Created], [BirthYearParsed], [MassParsed], [HeightParsed]) VALUES (79, N'2014-12-20T21:17:50.488Z', N'Grievous', N'male', N'brown, white', N'none', N'216', N'green, yellow', N'159', 59, N'unknown', N'2014-12-20T19:43:53.348Z', NULL, 159, 216)
INSERT [dbo].[PeopleRaw] ([Id], [Edited], [Name], [Gender], [SkinColor], [HairColor], [Height], [EyeColor], [Mass], [Homeworld], [BirthYear], [Created], [BirthYearParsed], [MassParsed], [HeightParsed]) VALUES (80, N'2014-12-20T21:17:50.491Z', N'Tarfful', N'male', N'brown', N'brown', N'234', N'blue', N'136', 14, N'unknown', N'2014-12-20T19:46:34.209Z', NULL, 136, 234)
INSERT [dbo].[PeopleRaw] ([Id], [Edited], [Name], [Gender], [SkinColor], [HairColor], [Height], [EyeColor], [Mass], [Homeworld], [BirthYear], [Created], [BirthYearParsed], [MassParsed], [HeightParsed]) VALUES (81, N'2014-12-20T21:17:50.493Z', N'Raymus Antilles', N'male', N'light', N'brown', N'188', N'brown', N'79', 2, N'unknown', N'2014-12-20T19:49:35.583Z', NULL, 79, 188)
INSERT [dbo].[PeopleRaw] ([Id], [Edited], [Name], [Gender], [SkinColor], [HairColor], [Height], [EyeColor], [Mass], [Homeworld], [BirthYear], [Created], [BirthYearParsed], [MassParsed], [HeightParsed]) VALUES (82, N'2014-12-20T21:17:50.496Z', N'Sly Moore', N'female', N'pale', N'none', N'178', N'white', N'48', 60, N'unknown', N'2014-12-20T20:18:37.619Z', NULL, 48, 178)
INSERT [dbo].[PeopleRaw] ([Id], [Edited], [Name], [Gender], [SkinColor], [HairColor], [Height], [EyeColor], [Mass], [Homeworld], [BirthYear], [Created], [BirthYearParsed], [MassParsed], [HeightParsed]) VALUES (83, N'2014-12-20T21:17:50.498Z', N'Tion Medon', N'male', N'grey', N'none', N'206', N'black', N'80', 12, N'unknown', N'2014-12-20T20:35:04.260Z', NULL, 80, 206)
SET IDENTITY_INSERT [dbo].[PeopleRaw] OFF
SET IDENTITY_INSERT [dbo].[PlanetsRaw] ON 

INSERT [dbo].[PlanetsRaw] ([Id], [Edited], [Climate], [SurfaceWater], [Name], [Diameter], [RotationPeriod], [Created], [Terrain], [Gravity], [OrbitalPeriod], [Population]) VALUES (1, N'2014-12-20T20:58:18.411Z', N'arid', N'1', N'Tatooine', N'10465', N'23', N'2014-12-09T13:50:49.641Z', N'desert', N'1 standard', N'304', N'200000')
INSERT [dbo].[PlanetsRaw] ([Id], [Edited], [Climate], [SurfaceWater], [Name], [Diameter], [RotationPeriod], [Created], [Terrain], [Gravity], [OrbitalPeriod], [Population]) VALUES (2, N'2014-12-20T20:58:18.420Z', N'temperate', N'40', N'Alderaan', N'12500', N'24', N'2014-12-10T11:35:48.479Z', N'grasslands, mountains', N'1 standard', N'364', N'2000000000')
INSERT [dbo].[PlanetsRaw] ([Id], [Edited], [Climate], [SurfaceWater], [Name], [Diameter], [RotationPeriod], [Created], [Terrain], [Gravity], [OrbitalPeriod], [Population]) VALUES (3, N'2014-12-20T20:58:18.421Z', N'temperate, tropical', N'8', N'Yavin IV', N'10200', N'24', N'2014-12-10T11:37:19.144Z', N'jungle, rainforests', N'1 standard', N'4818', N'1000')
INSERT [dbo].[PlanetsRaw] ([Id], [Edited], [Climate], [SurfaceWater], [Name], [Diameter], [RotationPeriod], [Created], [Terrain], [Gravity], [OrbitalPeriod], [Population]) VALUES (4, N'2014-12-20T20:58:18.423Z', N'frozen', N'100', N'Hoth', N'7200', N'23', N'2014-12-10T11:39:13.934Z', N'tundra, ice caves, mountain ranges', N'1.1 standard', N'549', N'unknown')
INSERT [dbo].[PlanetsRaw] ([Id], [Edited], [Climate], [SurfaceWater], [Name], [Diameter], [RotationPeriod], [Created], [Terrain], [Gravity], [OrbitalPeriod], [Population]) VALUES (5, N'2014-12-20T20:58:18.425Z', N'murky', N'8', N'Dagobah', N'8900', N'23', N'2014-12-10T11:42:22.590Z', N'swamp, jungles', N'N/A', N'341', N'unknown')
INSERT [dbo].[PlanetsRaw] ([Id], [Edited], [Climate], [SurfaceWater], [Name], [Diameter], [RotationPeriod], [Created], [Terrain], [Gravity], [OrbitalPeriod], [Population]) VALUES (6, N'2014-12-20T20:58:18.427Z', N'temperate', N'0', N'Bespin', N'118000', N'12', N'2014-12-10T11:43:55.240Z', N'gas giant', N'1.5 (surface), 1 standard (Cloud City)', N'5110', N'6000000')
INSERT [dbo].[PlanetsRaw] ([Id], [Edited], [Climate], [SurfaceWater], [Name], [Diameter], [RotationPeriod], [Created], [Terrain], [Gravity], [OrbitalPeriod], [Population]) VALUES (7, N'2014-12-20T20:58:18.429Z', N'temperate', N'8', N'Endor', N'4900', N'18', N'2014-12-10T11:50:29.349Z', N'forests, mountains, lakes', N'0.85 standard', N'402', N'30000000')
INSERT [dbo].[PlanetsRaw] ([Id], [Edited], [Climate], [SurfaceWater], [Name], [Diameter], [RotationPeriod], [Created], [Terrain], [Gravity], [OrbitalPeriod], [Population]) VALUES (8, N'2014-12-20T20:58:18.430Z', N'temperate', N'12', N'Naboo', N'12120', N'26', N'2014-12-10T11:52:31.066Z', N'grassy hills, swamps, forests, mountains', N'1 standard', N'312', N'4500000000')
INSERT [dbo].[PlanetsRaw] ([Id], [Edited], [Climate], [SurfaceWater], [Name], [Diameter], [RotationPeriod], [Created], [Terrain], [Gravity], [OrbitalPeriod], [Population]) VALUES (9, N'2014-12-20T20:58:18.432Z', N'temperate', N'unknown', N'Coruscant', N'12240', N'24', N'2014-12-10T11:54:13.921Z', N'cityscape, mountains', N'1 standard', N'368', N'1000000000000')
INSERT [dbo].[PlanetsRaw] ([Id], [Edited], [Climate], [SurfaceWater], [Name], [Diameter], [RotationPeriod], [Created], [Terrain], [Gravity], [OrbitalPeriod], [Population]) VALUES (10, N'2014-12-20T20:58:18.434Z', N'temperate', N'100', N'Kamino', N'19720', N'27', N'2014-12-10T12:45:06.577Z', N'ocean', N'1 standard', N'463', N'1000000000')
INSERT [dbo].[PlanetsRaw] ([Id], [Edited], [Climate], [SurfaceWater], [Name], [Diameter], [RotationPeriod], [Created], [Terrain], [Gravity], [OrbitalPeriod], [Population]) VALUES (11, N'2014-12-20T20:58:18.437Z', N'temperate, arid', N'5', N'Geonosis', N'11370', N'30', N'2014-12-10T12:47:22.350Z', N'rock, desert, mountain, barren', N'0.9 standard', N'256', N'100000000000')
INSERT [dbo].[PlanetsRaw] ([Id], [Edited], [Climate], [SurfaceWater], [Name], [Diameter], [RotationPeriod], [Created], [Terrain], [Gravity], [OrbitalPeriod], [Population]) VALUES (12, N'2014-12-20T20:58:18.439Z', N'temperate, arid, windy', N'0.9', N'Utapau', N'12900', N'27', N'2014-12-10T12:49:01.491Z', N'scrublands, savanna, canyons, sinkholes', N'1 standard', N'351', N'95000000')
INSERT [dbo].[PlanetsRaw] ([Id], [Edited], [Climate], [SurfaceWater], [Name], [Diameter], [RotationPeriod], [Created], [Terrain], [Gravity], [OrbitalPeriod], [Population]) VALUES (13, N'2014-12-20T20:58:18.440Z', N'hot', N'0', N'Mustafar', N'4200', N'36', N'2014-12-10T12:50:16.526Z', N'volcanoes, lava rivers, mountains, caves', N'1 standard', N'412', N'20000')
INSERT [dbo].[PlanetsRaw] ([Id], [Edited], [Climate], [SurfaceWater], [Name], [Diameter], [RotationPeriod], [Created], [Terrain], [Gravity], [OrbitalPeriod], [Population]) VALUES (14, N'2014-12-20T20:58:18.442Z', N'tropical', N'60', N'Kashyyyk', N'12765', N'26', N'2014-12-10T13:32:00.124Z', N'jungle, forests, lakes, rivers', N'1 standard', N'381', N'45000000')
INSERT [dbo].[PlanetsRaw] ([Id], [Edited], [Climate], [SurfaceWater], [Name], [Diameter], [RotationPeriod], [Created], [Terrain], [Gravity], [OrbitalPeriod], [Population]) VALUES (15, N'2014-12-20T20:58:18.444Z', N'artificial temperate ', N'0', N'Polis Massa', N'0', N'24', N'2014-12-10T13:33:46.405Z', N'airless asteroid', N'0.56 standard', N'590', N'1000000')
INSERT [dbo].[PlanetsRaw] ([Id], [Edited], [Climate], [SurfaceWater], [Name], [Diameter], [RotationPeriod], [Created], [Terrain], [Gravity], [OrbitalPeriod], [Population]) VALUES (16, N'2014-12-20T20:58:18.446Z', N'frigid', N'unknown', N'Mygeeto', N'10088', N'12', N'2014-12-10T13:43:39.139Z', N'glaciers, mountains, ice canyons', N'1 standard', N'167', N'19000000')
INSERT [dbo].[PlanetsRaw] ([Id], [Edited], [Climate], [SurfaceWater], [Name], [Diameter], [RotationPeriod], [Created], [Terrain], [Gravity], [OrbitalPeriod], [Population]) VALUES (17, N'2014-12-20T20:58:18.447Z', N'hot, humid', N'unknown', N'Felucia', N'9100', N'34', N'2014-12-10T13:44:50.397Z', N'fungus forests', N'0.75 standard', N'231', N'8500000')
INSERT [dbo].[PlanetsRaw] ([Id], [Edited], [Climate], [SurfaceWater], [Name], [Diameter], [RotationPeriod], [Created], [Terrain], [Gravity], [OrbitalPeriod], [Population]) VALUES (18, N'2014-12-20T20:58:18.449Z', N'temperate, moist', N'unknown', N'Cato Neimoidia', N'0', N'25', N'2014-12-10T13:46:28.704Z', N'mountains, fields, forests, rock arches', N'1 standard', N'278', N'10000000')
INSERT [dbo].[PlanetsRaw] ([Id], [Edited], [Climate], [SurfaceWater], [Name], [Diameter], [RotationPeriod], [Created], [Terrain], [Gravity], [OrbitalPeriod], [Population]) VALUES (19, N'2014-12-20T20:58:18.450Z', N'hot', N'unknown', N'Saleucami', N'14920', N'26', N'2014-12-10T13:47:46.874Z', N'caves, desert, mountains, volcanoes', N'unknown', N'392', N'1400000000')
INSERT [dbo].[PlanetsRaw] ([Id], [Edited], [Climate], [SurfaceWater], [Name], [Diameter], [RotationPeriod], [Created], [Terrain], [Gravity], [OrbitalPeriod], [Population]) VALUES (20, N'2014-12-20T20:58:18.452Z', N'temperate', N'unknown', N'Stewjon', N'0', N'unknown', N'2014-12-10T16:16:26.566Z', N'grass', N'1 standard', N'unknown', N'unknown')
INSERT [dbo].[PlanetsRaw] ([Id], [Edited], [Climate], [SurfaceWater], [Name], [Diameter], [RotationPeriod], [Created], [Terrain], [Gravity], [OrbitalPeriod], [Population]) VALUES (21, N'2014-12-20T20:58:18.454Z', N'polluted', N'unknown', N'Eriadu', N'13490', N'24', N'2014-12-10T16:26:54.384Z', N'cityscape', N'1 standard', N'360', N'22000000000')
INSERT [dbo].[PlanetsRaw] ([Id], [Edited], [Climate], [SurfaceWater], [Name], [Diameter], [RotationPeriod], [Created], [Terrain], [Gravity], [OrbitalPeriod], [Population]) VALUES (22, N'2014-12-20T20:58:18.456Z', N'temperate', N'70', N'Corellia', N'11000', N'25', N'2014-12-10T16:49:12.453Z', N'plains, urban, hills, forests', N'1 standard', N'329', N'3000000000')
INSERT [dbo].[PlanetsRaw] ([Id], [Edited], [Climate], [SurfaceWater], [Name], [Diameter], [RotationPeriod], [Created], [Terrain], [Gravity], [OrbitalPeriod], [Population]) VALUES (23, N'2014-12-20T20:58:18.458Z', N'hot', N'60', N'Rodia', N'7549', N'29', N'2014-12-10T17:03:28.110Z', N'jungles, oceans, urban, swamps', N'1 standard', N'305', N'1300000000')
INSERT [dbo].[PlanetsRaw] ([Id], [Edited], [Climate], [SurfaceWater], [Name], [Diameter], [RotationPeriod], [Created], [Terrain], [Gravity], [OrbitalPeriod], [Population]) VALUES (24, N'2014-12-20T20:58:18.460Z', N'temperate', N'unknown', N'Nal Hutta', N'12150', N'87', N'2014-12-10T17:11:29.452Z', N'urban, oceans, swamps, bogs', N'1 standard', N'413', N'7000000000')
INSERT [dbo].[PlanetsRaw] ([Id], [Edited], [Climate], [SurfaceWater], [Name], [Diameter], [RotationPeriod], [Created], [Terrain], [Gravity], [OrbitalPeriod], [Population]) VALUES (25, N'2014-12-20T20:58:18.461Z', N'temperate', N'unknown', N'Dantooine', N'9830', N'25', N'2014-12-10T17:23:29.896Z', N'oceans, savannas, mountains, grasslands', N'1 standard', N'378', N'1000')
INSERT [dbo].[PlanetsRaw] ([Id], [Edited], [Climate], [SurfaceWater], [Name], [Diameter], [RotationPeriod], [Created], [Terrain], [Gravity], [OrbitalPeriod], [Population]) VALUES (26, N'2014-12-20T20:58:18.463Z', N'temperate', N'98', N'Bestine IV', N'6400', N'26', N'2014-12-12T11:16:55.078Z', N'rocky islands, oceans', N'unknown', N'680', N'62000000')
INSERT [dbo].[PlanetsRaw] ([Id], [Edited], [Climate], [SurfaceWater], [Name], [Diameter], [RotationPeriod], [Created], [Terrain], [Gravity], [OrbitalPeriod], [Population]) VALUES (27, N'2014-12-20T20:58:18.464Z', N'temperate', N'10', N'Ord Mantell', N'14050', N'26', N'2014-12-15T12:23:41.661Z', N'plains, seas, mesas', N'1 standard', N'334', N'4000000000')
INSERT [dbo].[PlanetsRaw] ([Id], [Edited], [Climate], [SurfaceWater], [Name], [Diameter], [RotationPeriod], [Created], [Terrain], [Gravity], [OrbitalPeriod], [Population]) VALUES (28, N'2014-12-20T20:58:18.466Z', N'unknown', N'unknown', N'unknown', N'0', N'0', N'2014-12-15T12:25:59.569Z', N'unknown', N'unknown', N'0', N'unknown')
INSERT [dbo].[PlanetsRaw] ([Id], [Edited], [Climate], [SurfaceWater], [Name], [Diameter], [RotationPeriod], [Created], [Terrain], [Gravity], [OrbitalPeriod], [Population]) VALUES (29, N'2014-12-20T20:58:18.468Z', N'arid', N'unknown', N'Trandosha', N'0', N'25', N'2014-12-15T12:53:47.695Z', N'mountains, seas, grasslands, deserts', N'0.62 standard', N'371', N'42000000')
INSERT [dbo].[PlanetsRaw] ([Id], [Edited], [Climate], [SurfaceWater], [Name], [Diameter], [RotationPeriod], [Created], [Terrain], [Gravity], [OrbitalPeriod], [Population]) VALUES (30, N'2014-12-20T20:58:18.469Z', N'arid', N'unknown', N'Socorro', N'0', N'20', N'2014-12-15T12:56:31.121Z', N'deserts, mountains', N'1 standard', N'326', N'300000000')
INSERT [dbo].[PlanetsRaw] ([Id], [Edited], [Climate], [SurfaceWater], [Name], [Diameter], [RotationPeriod], [Created], [Terrain], [Gravity], [OrbitalPeriod], [Population]) VALUES (31, N'2014-12-20T20:58:18.471Z', N'temperate', N'100', N'Mon Cala', N'11030', N'21', N'2014-12-18T11:07:01.792Z', N'oceans, reefs, islands', N'1', N'398', N'27000000000')
INSERT [dbo].[PlanetsRaw] ([Id], [Edited], [Climate], [SurfaceWater], [Name], [Diameter], [RotationPeriod], [Created], [Terrain], [Gravity], [OrbitalPeriod], [Population]) VALUES (32, N'2014-12-20T20:58:18.472Z', N'temperate', N'40', N'Chandrila', N'13500', N'20', N'2014-12-18T11:11:51.872Z', N'plains, forests', N'1', N'368', N'1200000000')
INSERT [dbo].[PlanetsRaw] ([Id], [Edited], [Climate], [SurfaceWater], [Name], [Diameter], [RotationPeriod], [Created], [Terrain], [Gravity], [OrbitalPeriod], [Population]) VALUES (33, N'2014-12-20T20:58:18.474Z', N'superheated', N'5', N'Sullust', N'12780', N'20', N'2014-12-18T11:25:40.243Z', N'mountains, volcanoes, rocky deserts', N'1', N'263', N'18500000000')
INSERT [dbo].[PlanetsRaw] ([Id], [Edited], [Climate], [SurfaceWater], [Name], [Diameter], [RotationPeriod], [Created], [Terrain], [Gravity], [OrbitalPeriod], [Population]) VALUES (34, N'2014-12-20T20:58:18.476Z', N'temperate', N'unknown', N'Toydaria', N'7900', N'21', N'2014-12-19T17:47:54.403Z', N'swamps, lakes', N'1', N'184', N'11000000')
INSERT [dbo].[PlanetsRaw] ([Id], [Edited], [Climate], [SurfaceWater], [Name], [Diameter], [RotationPeriod], [Created], [Terrain], [Gravity], [OrbitalPeriod], [Population]) VALUES (35, N'2014-12-20T20:58:18.478Z', N'arid, temperate, tropical', N'unknown', N'Malastare', N'18880', N'26', N'2014-12-19T17:52:13.106Z', N'swamps, deserts, jungles, mountains', N'1.56', N'201', N'2000000000')
INSERT [dbo].[PlanetsRaw] ([Id], [Edited], [Climate], [SurfaceWater], [Name], [Diameter], [RotationPeriod], [Created], [Terrain], [Gravity], [OrbitalPeriod], [Population]) VALUES (36, N'2014-12-20T20:58:18.480Z', N'temperate', N'unknown', N'Dathomir', N'10480', N'24', N'2014-12-19T18:00:40.142Z', N'forests, deserts, savannas', N'0.9', N'491', N'5200')
INSERT [dbo].[PlanetsRaw] ([Id], [Edited], [Climate], [SurfaceWater], [Name], [Diameter], [RotationPeriod], [Created], [Terrain], [Gravity], [OrbitalPeriod], [Population]) VALUES (37, N'2014-12-20T20:58:18.481Z', N'temperate, arid, subartic', N'5', N'Ryloth', N'10600', N'30', N'2014-12-20T09:46:25.740Z', N'mountains, valleys, deserts, tundra', N'1', N'305', N'1500000000')
INSERT [dbo].[PlanetsRaw] ([Id], [Edited], [Climate], [SurfaceWater], [Name], [Diameter], [RotationPeriod], [Created], [Terrain], [Gravity], [OrbitalPeriod], [Population]) VALUES (38, N'2014-12-20T20:58:18.483Z', N'unknown', N'unknown', N'Aleen Minor', N'unknown', N'unknown', N'2014-12-20T09:52:23.452Z', N'unknown', N'unknown', N'unknown', N'unknown')
INSERT [dbo].[PlanetsRaw] ([Id], [Edited], [Climate], [SurfaceWater], [Name], [Diameter], [RotationPeriod], [Created], [Terrain], [Gravity], [OrbitalPeriod], [Population]) VALUES (39, N'2014-12-20T20:58:18.485Z', N'temperate, artic', N'unknown', N'Vulpter', N'14900', N'22', N'2014-12-20T09:56:58.874Z', N'urban, barren', N'1', N'391', N'421000000')
INSERT [dbo].[PlanetsRaw] ([Id], [Edited], [Climate], [SurfaceWater], [Name], [Diameter], [RotationPeriod], [Created], [Terrain], [Gravity], [OrbitalPeriod], [Population]) VALUES (40, N'2014-12-20T20:58:18.487Z', N'unknown', N'unknown', N'Troiken', N'unknown', N'unknown', N'2014-12-20T10:01:37.395Z', N'desert, tundra, rainforests, mountains', N'unknown', N'unknown', N'unknown')
INSERT [dbo].[PlanetsRaw] ([Id], [Edited], [Climate], [SurfaceWater], [Name], [Diameter], [RotationPeriod], [Created], [Terrain], [Gravity], [OrbitalPeriod], [Population]) VALUES (41, N'2014-12-20T20:58:18.489Z', N'unknown', N'unknown', N'Tund', N'12190', N'48', N'2014-12-20T10:07:29.578Z', N'barren, ash', N'unknown', N'1770', N'0')
INSERT [dbo].[PlanetsRaw] ([Id], [Edited], [Climate], [SurfaceWater], [Name], [Diameter], [RotationPeriod], [Created], [Terrain], [Gravity], [OrbitalPeriod], [Population]) VALUES (42, N'2014-12-20T20:58:18.491Z', N'temperate', N'unknown', N'Haruun Kal', N'10120', N'25', N'2014-12-20T10:12:28.980Z', N'toxic cloudsea, plateaus, volcanoes', N'0.98', N'383', N'705300')
INSERT [dbo].[PlanetsRaw] ([Id], [Edited], [Climate], [SurfaceWater], [Name], [Diameter], [RotationPeriod], [Created], [Terrain], [Gravity], [OrbitalPeriod], [Population]) VALUES (43, N'2014-12-20T20:58:18.493Z', N'temperate', N'20', N'Cerea', N'unknown', N'27', N'2014-12-20T10:14:48.178Z', N'verdant', N'1', N'386', N'450000000')
INSERT [dbo].[PlanetsRaw] ([Id], [Edited], [Climate], [SurfaceWater], [Name], [Diameter], [RotationPeriod], [Created], [Terrain], [Gravity], [OrbitalPeriod], [Population]) VALUES (44, N'2014-12-20T20:58:18.495Z', N'tropical, temperate', N'80', N'Glee Anselm', N'15600', N'33', N'2014-12-20T10:18:26.110Z', N'lakes, islands, swamps, seas', N'1', N'206', N'500000000')
INSERT [dbo].[PlanetsRaw] ([Id], [Edited], [Climate], [SurfaceWater], [Name], [Diameter], [RotationPeriod], [Created], [Terrain], [Gravity], [OrbitalPeriod], [Population]) VALUES (45, N'2014-12-20T20:58:18.497Z', N'unknown', N'unknown', N'Iridonia', N'unknown', N'29', N'2014-12-20T10:26:05.788Z', N'rocky canyons, acid pools', N'unknown', N'413', N'unknown')
INSERT [dbo].[PlanetsRaw] ([Id], [Edited], [Climate], [SurfaceWater], [Name], [Diameter], [RotationPeriod], [Created], [Terrain], [Gravity], [OrbitalPeriod], [Population]) VALUES (46, N'2014-12-20T20:58:18.498Z', N'unknown', N'unknown', N'Tholoth', N'unknown', N'unknown', N'2014-12-20T10:28:31.117Z', N'unknown', N'unknown', N'unknown', N'unknown')
INSERT [dbo].[PlanetsRaw] ([Id], [Edited], [Climate], [SurfaceWater], [Name], [Diameter], [RotationPeriod], [Created], [Terrain], [Gravity], [OrbitalPeriod], [Population]) VALUES (47, N'2014-12-20T20:58:18.500Z', N'arid, rocky, windy', N'unknown', N'Iktotch', N'unknown', N'22', N'2014-12-20T10:31:32.413Z', N'rocky', N'1', N'481', N'unknown')
INSERT [dbo].[PlanetsRaw] ([Id], [Edited], [Climate], [SurfaceWater], [Name], [Diameter], [RotationPeriod], [Created], [Terrain], [Gravity], [OrbitalPeriod], [Population]) VALUES (48, N'2014-12-20T20:58:18.502Z', N'unknown', N'unknown', N'Quermia', N'unknown', N'unknown', N'2014-12-20T10:34:08.249Z', N'unknown', N'unknown', N'unknown', N'unknown')
INSERT [dbo].[PlanetsRaw] ([Id], [Edited], [Climate], [SurfaceWater], [Name], [Diameter], [RotationPeriod], [Created], [Terrain], [Gravity], [OrbitalPeriod], [Population]) VALUES (49, N'2014-12-20T20:58:18.504Z', N'temperate', N'unknown', N'Dorin', N'13400', N'22', N'2014-12-20T10:48:36.141Z', N'unknown', N'1', N'409', N'unknown')
INSERT [dbo].[PlanetsRaw] ([Id], [Edited], [Climate], [SurfaceWater], [Name], [Diameter], [RotationPeriod], [Created], [Terrain], [Gravity], [OrbitalPeriod], [Population]) VALUES (50, N'2014-12-20T20:58:18.506Z', N'temperate', N'unknown', N'Champala', N'unknown', N'27', N'2014-12-20T10:52:51.524Z', N'oceans, rainforests, plateaus', N'1', N'318', N'3500000000')
INSERT [dbo].[PlanetsRaw] ([Id], [Edited], [Climate], [SurfaceWater], [Name], [Diameter], [RotationPeriod], [Created], [Terrain], [Gravity], [OrbitalPeriod], [Population]) VALUES (51, N'2014-12-20T20:58:18.508Z', N'unknown', N'unknown', N'Mirial', N'unknown', N'unknown', N'2014-12-20T16:44:46.318Z', N'deserts', N'unknown', N'unknown', N'unknown')
INSERT [dbo].[PlanetsRaw] ([Id], [Edited], [Climate], [SurfaceWater], [Name], [Diameter], [RotationPeriod], [Created], [Terrain], [Gravity], [OrbitalPeriod], [Population]) VALUES (52, N'2014-12-20T20:58:18.510Z', N'unknown', N'unknown', N'Serenno', N'unknown', N'unknown', N'2014-12-20T16:52:13.357Z', N'rainforests, rivers, mountains', N'unknown', N'unknown', N'unknown')
INSERT [dbo].[PlanetsRaw] ([Id], [Edited], [Climate], [SurfaceWater], [Name], [Diameter], [RotationPeriod], [Created], [Terrain], [Gravity], [OrbitalPeriod], [Population]) VALUES (53, N'2014-12-20T20:58:18.512Z', N'unknown', N'unknown', N'Concord Dawn', N'unknown', N'unknown', N'2014-12-20T16:54:39.909Z', N'jungles, forests, deserts', N'unknown', N'unknown', N'unknown')
INSERT [dbo].[PlanetsRaw] ([Id], [Edited], [Climate], [SurfaceWater], [Name], [Diameter], [RotationPeriod], [Created], [Terrain], [Gravity], [OrbitalPeriod], [Population]) VALUES (54, N'2014-12-20T20:58:18.514Z', N'unknown', N'unknown', N'Zolan', N'unknown', N'unknown', N'2014-12-20T16:56:37.250Z', N'unknown', N'unknown', N'unknown', N'unknown')
INSERT [dbo].[PlanetsRaw] ([Id], [Edited], [Climate], [SurfaceWater], [Name], [Diameter], [RotationPeriod], [Created], [Terrain], [Gravity], [OrbitalPeriod], [Population]) VALUES (55, N'2014-12-20T20:58:18.516Z', N'frigid', N'100', N'Ojom', N'unknown', N'unknown', N'2014-12-20T17:27:41.286Z', N'oceans, glaciers', N'unknown', N'unknown', N'500000000')
INSERT [dbo].[PlanetsRaw] ([Id], [Edited], [Climate], [SurfaceWater], [Name], [Diameter], [RotationPeriod], [Created], [Terrain], [Gravity], [OrbitalPeriod], [Population]) VALUES (56, N'2014-12-20T20:58:18.517Z', N'temperate', N'unknown', N'Skako', N'unknown', N'27', N'2014-12-20T17:50:47.864Z', N'urban, vines', N'1', N'384', N'500000000000')
INSERT [dbo].[PlanetsRaw] ([Id], [Edited], [Climate], [SurfaceWater], [Name], [Diameter], [RotationPeriod], [Created], [Terrain], [Gravity], [OrbitalPeriod], [Population]) VALUES (57, N'2014-12-20T20:58:18.519Z', N'temperate', N'25', N'Muunilinst', N'13800', N'28', N'2014-12-20T17:57:47.420Z', N'plains, forests, hills, mountains', N'1', N'412', N'5000000000')
INSERT [dbo].[PlanetsRaw] ([Id], [Edited], [Climate], [SurfaceWater], [Name], [Diameter], [RotationPeriod], [Created], [Terrain], [Gravity], [OrbitalPeriod], [Population]) VALUES (58, N'2014-12-20T20:58:18.521Z', N'temperate', N'unknown', N'Shili', N'unknown', N'unknown', N'2014-12-20T18:43:14.049Z', N'cities, savannahs, seas, plains', N'1', N'unknown', N'unknown')
INSERT [dbo].[PlanetsRaw] ([Id], [Edited], [Climate], [SurfaceWater], [Name], [Diameter], [RotationPeriod], [Created], [Terrain], [Gravity], [OrbitalPeriod], [Population]) VALUES (59, N'2014-12-20T20:58:18.523Z', N'arid, temperate, tropical', N'unknown', N'Kalee', N'13850', N'23', N'2014-12-20T19:43:51.278Z', N'rainforests, cliffs, canyons, seas', N'1', N'378', N'4000000000')
INSERT [dbo].[PlanetsRaw] ([Id], [Edited], [Climate], [SurfaceWater], [Name], [Diameter], [RotationPeriod], [Created], [Terrain], [Gravity], [OrbitalPeriod], [Population]) VALUES (60, N'2014-12-20T20:58:18.525Z', N'unknown', N'unknown', N'Umbara', N'unknown', N'unknown', N'2014-12-20T20:18:36.256Z', N'unknown', N'unknown', N'unknown', N'unknown')
SET IDENTITY_INSERT [dbo].[PlanetsRaw] OFF
SET IDENTITY_INSERT [dbo].[SpeciesPeopleRaw] ON 

INSERT [dbo].[SpeciesPeopleRaw] ([Id], [SpeciesId], [PersonId]) VALUES (1, 1, 66)
INSERT [dbo].[SpeciesPeopleRaw] ([Id], [SpeciesId], [PersonId]) VALUES (2, 1, 67)
INSERT [dbo].[SpeciesPeopleRaw] ([Id], [SpeciesId], [PersonId]) VALUES (3, 1, 68)
INSERT [dbo].[SpeciesPeopleRaw] ([Id], [SpeciesId], [PersonId]) VALUES (4, 1, 74)
INSERT [dbo].[SpeciesPeopleRaw] ([Id], [SpeciesId], [PersonId]) VALUES (5, 2, 2)
INSERT [dbo].[SpeciesPeopleRaw] ([Id], [SpeciesId], [PersonId]) VALUES (6, 2, 3)
INSERT [dbo].[SpeciesPeopleRaw] ([Id], [SpeciesId], [PersonId]) VALUES (7, 2, 8)
INSERT [dbo].[SpeciesPeopleRaw] ([Id], [SpeciesId], [PersonId]) VALUES (8, 2, 23)
INSERT [dbo].[SpeciesPeopleRaw] ([Id], [SpeciesId], [PersonId]) VALUES (9, 3, 13)
INSERT [dbo].[SpeciesPeopleRaw] ([Id], [SpeciesId], [PersonId]) VALUES (10, 3, 80)
INSERT [dbo].[SpeciesPeopleRaw] ([Id], [SpeciesId], [PersonId]) VALUES (11, 4, 15)
INSERT [dbo].[SpeciesPeopleRaw] ([Id], [SpeciesId], [PersonId]) VALUES (12, 5, 16)
INSERT [dbo].[SpeciesPeopleRaw] ([Id], [SpeciesId], [PersonId]) VALUES (13, 6, 20)
INSERT [dbo].[SpeciesPeopleRaw] ([Id], [SpeciesId], [PersonId]) VALUES (14, 7, 24)
INSERT [dbo].[SpeciesPeopleRaw] ([Id], [SpeciesId], [PersonId]) VALUES (15, 8, 27)
INSERT [dbo].[SpeciesPeopleRaw] ([Id], [SpeciesId], [PersonId]) VALUES (16, 9, 30)
INSERT [dbo].[SpeciesPeopleRaw] ([Id], [SpeciesId], [PersonId]) VALUES (17, 10, 31)
INSERT [dbo].[SpeciesPeopleRaw] ([Id], [SpeciesId], [PersonId]) VALUES (18, 11, 33)
INSERT [dbo].[SpeciesPeopleRaw] ([Id], [SpeciesId], [PersonId]) VALUES (19, 12, 36)
INSERT [dbo].[SpeciesPeopleRaw] ([Id], [SpeciesId], [PersonId]) VALUES (20, 12, 37)
INSERT [dbo].[SpeciesPeopleRaw] ([Id], [SpeciesId], [PersonId]) VALUES (21, 12, 38)
INSERT [dbo].[SpeciesPeopleRaw] ([Id], [SpeciesId], [PersonId]) VALUES (22, 13, 40)
INSERT [dbo].[SpeciesPeopleRaw] ([Id], [SpeciesId], [PersonId]) VALUES (23, 14, 41)
INSERT [dbo].[SpeciesPeopleRaw] ([Id], [SpeciesId], [PersonId]) VALUES (24, 15, 45)
INSERT [dbo].[SpeciesPeopleRaw] ([Id], [SpeciesId], [PersonId]) VALUES (25, 15, 46)
INSERT [dbo].[SpeciesPeopleRaw] ([Id], [SpeciesId], [PersonId]) VALUES (26, 16, 47)
INSERT [dbo].[SpeciesPeopleRaw] ([Id], [SpeciesId], [PersonId]) VALUES (27, 17, 48)
INSERT [dbo].[SpeciesPeopleRaw] ([Id], [SpeciesId], [PersonId]) VALUES (28, 18, 49)
INSERT [dbo].[SpeciesPeopleRaw] ([Id], [SpeciesId], [PersonId]) VALUES (29, 19, 50)
INSERT [dbo].[SpeciesPeopleRaw] ([Id], [SpeciesId], [PersonId]) VALUES (30, 20, 52)
INSERT [dbo].[SpeciesPeopleRaw] ([Id], [SpeciesId], [PersonId]) VALUES (31, 21, 53)
INSERT [dbo].[SpeciesPeopleRaw] ([Id], [SpeciesId], [PersonId]) VALUES (32, 22, 44)
INSERT [dbo].[SpeciesPeopleRaw] ([Id], [SpeciesId], [PersonId]) VALUES (33, 22, 54)
INSERT [dbo].[SpeciesPeopleRaw] ([Id], [SpeciesId], [PersonId]) VALUES (34, 23, 55)
INSERT [dbo].[SpeciesPeopleRaw] ([Id], [SpeciesId], [PersonId]) VALUES (35, 24, 56)
INSERT [dbo].[SpeciesPeopleRaw] ([Id], [SpeciesId], [PersonId]) VALUES (36, 25, 57)
INSERT [dbo].[SpeciesPeopleRaw] ([Id], [SpeciesId], [PersonId]) VALUES (37, 26, 58)
INSERT [dbo].[SpeciesPeopleRaw] ([Id], [SpeciesId], [PersonId]) VALUES (38, 27, 59)
INSERT [dbo].[SpeciesPeopleRaw] ([Id], [SpeciesId], [PersonId]) VALUES (39, 28, 63)
INSERT [dbo].[SpeciesPeopleRaw] ([Id], [SpeciesId], [PersonId]) VALUES (40, 29, 64)
INSERT [dbo].[SpeciesPeopleRaw] ([Id], [SpeciesId], [PersonId]) VALUES (41, 29, 65)
INSERT [dbo].[SpeciesPeopleRaw] ([Id], [SpeciesId], [PersonId]) VALUES (42, 30, 70)
INSERT [dbo].[SpeciesPeopleRaw] ([Id], [SpeciesId], [PersonId]) VALUES (43, 31, 71)
INSERT [dbo].[SpeciesPeopleRaw] ([Id], [SpeciesId], [PersonId]) VALUES (44, 32, 72)
INSERT [dbo].[SpeciesPeopleRaw] ([Id], [SpeciesId], [PersonId]) VALUES (45, 32, 73)
INSERT [dbo].[SpeciesPeopleRaw] ([Id], [SpeciesId], [PersonId]) VALUES (46, 33, 76)
INSERT [dbo].[SpeciesPeopleRaw] ([Id], [SpeciesId], [PersonId]) VALUES (47, 34, 77)
INSERT [dbo].[SpeciesPeopleRaw] ([Id], [SpeciesId], [PersonId]) VALUES (48, 35, 78)
INSERT [dbo].[SpeciesPeopleRaw] ([Id], [SpeciesId], [PersonId]) VALUES (49, 36, 79)
INSERT [dbo].[SpeciesPeopleRaw] ([Id], [SpeciesId], [PersonId]) VALUES (50, 37, 83)
SET IDENTITY_INSERT [dbo].[SpeciesPeopleRaw] OFF
SET IDENTITY_INSERT [dbo].[SpeciesRaw] ON 

INSERT [dbo].[SpeciesRaw] ([Id], [Edited], [Name], [Designation], [Created], [EyeColors], [SkinColors], [Language], [HairColors], [Homeworld], [AverageLifespan], [AverageHeight], [Classification]) VALUES (1, N'2014-12-20T21:36:42.136Z', N'Human', N'sentient', N'2014-12-10T13:52:11.567Z', N'brown, blue, green, hazel, grey, amber', N'caucasian, black, asian, hispanic', N'Galactic Basic', N'blonde, brown, black, red', 9, N'120', N'180', N'mammal')
INSERT [dbo].[SpeciesRaw] ([Id], [Edited], [Name], [Designation], [Created], [EyeColors], [SkinColors], [Language], [HairColors], [Homeworld], [AverageLifespan], [AverageHeight], [Classification]) VALUES (2, N'2014-12-20T21:36:42.139Z', N'Droid', N'sentient', N'2014-12-10T15:16:16.259Z', N'n/a', N'n/a', N'n/a', N'n/a', NULL, N'indefinite', N'n/a', N'artificial')
INSERT [dbo].[SpeciesRaw] ([Id], [Edited], [Name], [Designation], [Created], [EyeColors], [SkinColors], [Language], [HairColors], [Homeworld], [AverageLifespan], [AverageHeight], [Classification]) VALUES (3, N'2014-12-20T21:36:42.142Z', N'Wookie', N'sentient', N'2014-12-10T16:44:31.486Z', N'blue, green, yellow, brown, golden, red', N'gray', N'Shyriiwook', N'black, brown', 14, N'400', N'210', N'mammal')
INSERT [dbo].[SpeciesRaw] ([Id], [Edited], [Name], [Designation], [Created], [EyeColors], [SkinColors], [Language], [HairColors], [Homeworld], [AverageLifespan], [AverageHeight], [Classification]) VALUES (4, N'2014-12-20T21:36:42.144Z', N'Rodian', N'reptilian', N'2014-12-10T17:05:26.471Z', N'black', N'green, blue', N'Galatic Basic', N'n/a', 23, N'unknown', N'170', N'sentient')
INSERT [dbo].[SpeciesRaw] ([Id], [Edited], [Name], [Designation], [Created], [EyeColors], [SkinColors], [Language], [HairColors], [Homeworld], [AverageLifespan], [AverageHeight], [Classification]) VALUES (5, N'2014-12-20T21:36:42.146Z', N'Hutt', N'sentient', N'2014-12-10T17:12:50.410Z', N'yellow, red', N'green, brown, tan', N'Huttese', N'n/a', 24, N'1000', N'300', N'gastropod')
INSERT [dbo].[SpeciesRaw] ([Id], [Edited], [Name], [Designation], [Created], [EyeColors], [SkinColors], [Language], [HairColors], [Homeworld], [AverageLifespan], [AverageHeight], [Classification]) VALUES (6, N'2014-12-20T21:36:42.148Z', N'Yoda''s species', N'sentient', N'2014-12-15T12:27:22.877Z', N'brown, green, yellow', N'green, yellow', N'Galactic basic', N'brown, white', 28, N'900', N'66', N'mammal')
INSERT [dbo].[SpeciesRaw] ([Id], [Edited], [Name], [Designation], [Created], [EyeColors], [SkinColors], [Language], [HairColors], [Homeworld], [AverageLifespan], [AverageHeight], [Classification]) VALUES (7, N'2014-12-20T21:36:42.151Z', N'Trandoshan', N'sentient', N'2014-12-15T13:07:47.704Z', N'yellow, orange', N'brown, green', N'Dosh', N'none', 29, N'unknown', N'200', N'reptile')
INSERT [dbo].[SpeciesRaw] ([Id], [Edited], [Name], [Designation], [Created], [EyeColors], [SkinColors], [Language], [HairColors], [Homeworld], [AverageLifespan], [AverageHeight], [Classification]) VALUES (8, N'2014-12-20T21:36:42.153Z', N'Mon Calamari', N'sentient', N'2014-12-18T11:09:52.263Z', N'yellow', N'red, blue, brown, magenta', N'Mon Calamarian', N'none', 31, N'unknown', N'160', N'amphibian')
INSERT [dbo].[SpeciesRaw] ([Id], [Edited], [Name], [Designation], [Created], [EyeColors], [SkinColors], [Language], [HairColors], [Homeworld], [AverageLifespan], [AverageHeight], [Classification]) VALUES (9, N'2014-12-20T21:36:42.155Z', N'Ewok', N'sentient', N'2014-12-18T11:22:00.285Z', N'orange, brown', N'brown', N'Ewokese', N'white, brown, black', 7, N'unknown', N'100', N'mammal')
INSERT [dbo].[SpeciesRaw] ([Id], [Edited], [Name], [Designation], [Created], [EyeColors], [SkinColors], [Language], [HairColors], [Homeworld], [AverageLifespan], [AverageHeight], [Classification]) VALUES (10, N'2014-12-20T21:36:42.157Z', N'Sullustan', N'sentient', N'2014-12-18T11:26:20.103Z', N'black', N'pale', N'Sullutese', N'none', 33, N'unknown', N'180', N'mammal')
INSERT [dbo].[SpeciesRaw] ([Id], [Edited], [Name], [Designation], [Created], [EyeColors], [SkinColors], [Language], [HairColors], [Homeworld], [AverageLifespan], [AverageHeight], [Classification]) VALUES (11, N'2014-12-20T21:36:42.160Z', N'Neimodian', N'sentient', N'2014-12-19T17:07:31.319Z', N'red, pink', N'grey, green', N'Neimoidia', N'none', 18, N'unknown', N'180', N'unknown')
INSERT [dbo].[SpeciesRaw] ([Id], [Edited], [Name], [Designation], [Created], [EyeColors], [SkinColors], [Language], [HairColors], [Homeworld], [AverageLifespan], [AverageHeight], [Classification]) VALUES (12, N'2014-12-20T21:36:42.163Z', N'Gungan', N'sentient', N'2014-12-19T17:30:37.341Z', N'orange', N'brown, green', N'Gungan basic', N'none', 8, N'unknown', N'190', N'amphibian')
INSERT [dbo].[SpeciesRaw] ([Id], [Edited], [Name], [Designation], [Created], [EyeColors], [SkinColors], [Language], [HairColors], [Homeworld], [AverageLifespan], [AverageHeight], [Classification]) VALUES (13, N'2014-12-20T21:36:42.165Z', N'Toydarian', N'sentient', N'2014-12-19T17:48:56.893Z', N'yellow', N'blue, green, grey', N'Toydarian', N'none', 34, N'91', N'120', N'mammal')
INSERT [dbo].[SpeciesRaw] ([Id], [Edited], [Name], [Designation], [Created], [EyeColors], [SkinColors], [Language], [HairColors], [Homeworld], [AverageLifespan], [AverageHeight], [Classification]) VALUES (14, N'2014-12-20T21:36:42.167Z', N'Dug', N'sentient', N'2014-12-19T17:53:11.214Z', N'yellow, blue', N'brown, purple, grey, red', N'Dugese', N'none', 35, N'unknown', N'100', N'mammal')
INSERT [dbo].[SpeciesRaw] ([Id], [Edited], [Name], [Designation], [Created], [EyeColors], [SkinColors], [Language], [HairColors], [Homeworld], [AverageLifespan], [AverageHeight], [Classification]) VALUES (15, N'2014-12-20T21:36:42.169Z', N'Twi''lek', N'sentient', N'2014-12-20T09:48:02.406Z', N'blue, brown, orange, pink', N'orange, yellow, blue, green, pink, purple, tan', N'Twi''leki', N'none', 37, N'unknown', N'200', N'mammals')
INSERT [dbo].[SpeciesRaw] ([Id], [Edited], [Name], [Designation], [Created], [EyeColors], [SkinColors], [Language], [HairColors], [Homeworld], [AverageLifespan], [AverageHeight], [Classification]) VALUES (16, N'2014-12-20T21:36:42.171Z', N'Aleena', N'sentient', N'2014-12-20T09:53:16.481Z', N'unknown', N'blue, gray', N'Aleena', N'none', 38, N'79', N'80', N'reptile')
INSERT [dbo].[SpeciesRaw] ([Id], [Edited], [Name], [Designation], [Created], [EyeColors], [SkinColors], [Language], [HairColors], [Homeworld], [AverageLifespan], [AverageHeight], [Classification]) VALUES (17, N'2014-12-20T21:36:42.173Z', N'Vulptereen', N'sentient', N'2014-12-20T09:57:33.128Z', N'yellow', N'grey', N'vulpterish', N'none', 39, N'unknown', N'100', N'unknown')
INSERT [dbo].[SpeciesRaw] ([Id], [Edited], [Name], [Designation], [Created], [EyeColors], [SkinColors], [Language], [HairColors], [Homeworld], [AverageLifespan], [AverageHeight], [Classification]) VALUES (18, N'2014-12-20T21:36:42.175Z', N'Xexto', N'sentient', N'2014-12-20T10:02:13.915Z', N'black', N'grey, yellow, purple', N'Xextese', N'none', 40, N'unknown', N'125', N'unknown')
INSERT [dbo].[SpeciesRaw] ([Id], [Edited], [Name], [Designation], [Created], [EyeColors], [SkinColors], [Language], [HairColors], [Homeworld], [AverageLifespan], [AverageHeight], [Classification]) VALUES (19, N'2014-12-20T21:36:42.177Z', N'Toong', N'sentient', N'2014-12-20T10:08:36.795Z', N'orange', N'grey, green, yellow', N'Tundan', N'none', 41, N'unknown', N'200', N'unknown')
INSERT [dbo].[SpeciesRaw] ([Id], [Edited], [Name], [Designation], [Created], [EyeColors], [SkinColors], [Language], [HairColors], [Homeworld], [AverageLifespan], [AverageHeight], [Classification]) VALUES (20, N'2014-12-20T21:36:42.179Z', N'Cerean', N'sentient', N'2014-12-20T10:15:33.765Z', N'hazel', N'pale pink', N'Cerean', N'red, blond, black, white', 43, N'unknown', N'200', N'mammal')
INSERT [dbo].[SpeciesRaw] ([Id], [Edited], [Name], [Designation], [Created], [EyeColors], [SkinColors], [Language], [HairColors], [Homeworld], [AverageLifespan], [AverageHeight], [Classification]) VALUES (21, N'2014-12-20T21:36:42.181Z', N'Nautolan', N'sentient', N'2014-12-20T10:18:58.610Z', N'black', N'green, blue, brown, red', N'Nautila', N'none', 44, N'70', N'180', N'amphibian')
INSERT [dbo].[SpeciesRaw] ([Id], [Edited], [Name], [Designation], [Created], [EyeColors], [SkinColors], [Language], [HairColors], [Homeworld], [AverageLifespan], [AverageHeight], [Classification]) VALUES (22, N'2014-12-20T21:36:42.183Z', N'Zabrak', N'sentient', N'2014-12-20T10:26:59.894Z', N'brown, orange', N'pale, brown, red, orange, yellow', N'Zabraki', N'black', 45, N'unknown', N'180', N'mammal')
INSERT [dbo].[SpeciesRaw] ([Id], [Edited], [Name], [Designation], [Created], [EyeColors], [SkinColors], [Language], [HairColors], [Homeworld], [AverageLifespan], [AverageHeight], [Classification]) VALUES (23, N'2014-12-20T21:36:42.186Z', N'Tholothian', N'sentient', N'2014-12-20T10:29:13.798Z', N'blue, indigo', N'dark', N'unknown', N'unknown', 46, N'unknown', N'unknown', N'mammal')
INSERT [dbo].[SpeciesRaw] ([Id], [Edited], [Name], [Designation], [Created], [EyeColors], [SkinColors], [Language], [HairColors], [Homeworld], [AverageLifespan], [AverageHeight], [Classification]) VALUES (24, N'2014-12-20T21:36:42.188Z', N'Iktotchi', N'sentient', N'2014-12-20T10:32:13.046Z', N'orange', N'pink', N'Iktotchese', N'none', 47, N'unknown', N'180', N'unknown')
INSERT [dbo].[SpeciesRaw] ([Id], [Edited], [Name], [Designation], [Created], [EyeColors], [SkinColors], [Language], [HairColors], [Homeworld], [AverageLifespan], [AverageHeight], [Classification]) VALUES (25, N'2014-12-20T21:36:42.189Z', N'Quermian', N'sentient', N'2014-12-20T10:34:50.827Z', N'yellow', N'white', N'Quermian', N'none', 48, N'86', N'240', N'mammal')
INSERT [dbo].[SpeciesRaw] ([Id], [Edited], [Name], [Designation], [Created], [EyeColors], [SkinColors], [Language], [HairColors], [Homeworld], [AverageLifespan], [AverageHeight], [Classification]) VALUES (26, N'2014-12-20T21:36:42.191Z', N'Kel Dor', N'sentient', N'2014-12-20T10:49:21.692Z', N'black, silver', N'peach, orange, red', N'Kel Dor', N'none', 49, N'70', N'180', N'unknown')
INSERT [dbo].[SpeciesRaw] ([Id], [Edited], [Name], [Designation], [Created], [EyeColors], [SkinColors], [Language], [HairColors], [Homeworld], [AverageLifespan], [AverageHeight], [Classification]) VALUES (27, N'2014-12-20T21:36:42.193Z', N'Chagrian', N'sentient', N'2014-12-20T10:53:28.795Z', N'blue', N'blue', N'Chagria', N'none', 50, N'unknown', N'190', N'amphibian')
INSERT [dbo].[SpeciesRaw] ([Id], [Edited], [Name], [Designation], [Created], [EyeColors], [SkinColors], [Language], [HairColors], [Homeworld], [AverageLifespan], [AverageHeight], [Classification]) VALUES (28, N'2014-12-20T21:36:42.195Z', N'Geonosian', N'sentient', N'2014-12-20T16:40:45.618Z', N'green, hazel', N'green, brown', N'Geonosian', N'none', 11, N'unknown', N'178', N'insectoid')
INSERT [dbo].[SpeciesRaw] ([Id], [Edited], [Name], [Designation], [Created], [EyeColors], [SkinColors], [Language], [HairColors], [Homeworld], [AverageLifespan], [AverageHeight], [Classification]) VALUES (29, N'2014-12-20T21:36:42.197Z', N'Mirialan', N'sentient', N'2014-12-20T16:46:48.290Z', N'blue, green, red, yellow, brown, orange', N'yellow, green', N'Mirialan', N'black, brown', 51, N'unknown', N'180', N'mammal')
INSERT [dbo].[SpeciesRaw] ([Id], [Edited], [Name], [Designation], [Created], [EyeColors], [SkinColors], [Language], [HairColors], [Homeworld], [AverageLifespan], [AverageHeight], [Classification]) VALUES (30, N'2014-12-20T21:36:42.199Z', N'Clawdite', N'sentient', N'2014-12-20T16:57:46.171Z', N'yellow', N'green, yellow', N'Clawdite', N'none', 54, N'70', N'180', N'reptilian')
INSERT [dbo].[SpeciesRaw] ([Id], [Edited], [Name], [Designation], [Created], [EyeColors], [SkinColors], [Language], [HairColors], [Homeworld], [AverageLifespan], [AverageHeight], [Classification]) VALUES (31, N'2014-12-20T21:36:42.200Z', N'Besalisk', N'sentient', N'2014-12-20T17:28:28.821Z', N'yellow', N'brown', N'besalisk', N'none', 55, N'75', N'178', N'amphibian')
INSERT [dbo].[SpeciesRaw] ([Id], [Edited], [Name], [Designation], [Created], [EyeColors], [SkinColors], [Language], [HairColors], [Homeworld], [AverageLifespan], [AverageHeight], [Classification]) VALUES (32, N'2014-12-20T21:36:42.202Z', N'Kaminoan', N'sentient', N'2014-12-20T17:31:24.838Z', N'black', N'grey, blue', N'Kaminoan', N'none', 10, N'80', N'220', N'amphibian')
INSERT [dbo].[SpeciesRaw] ([Id], [Edited], [Name], [Designation], [Created], [EyeColors], [SkinColors], [Language], [HairColors], [Homeworld], [AverageLifespan], [AverageHeight], [Classification]) VALUES (33, N'2014-12-20T21:36:42.204Z', N'Skakoan', N'sentient', N'2014-12-20T17:53:54.515Z', N'unknown', N'grey, green', N'Skakoan', N'none', 56, N'unknown', N'unknown', N'mammal')
INSERT [dbo].[SpeciesRaw] ([Id], [Edited], [Name], [Designation], [Created], [EyeColors], [SkinColors], [Language], [HairColors], [Homeworld], [AverageLifespan], [AverageHeight], [Classification]) VALUES (34, N'2014-12-20T21:36:42.207Z', N'Muun', N'sentient', N'2014-12-20T17:58:19.088Z', N'black', N'grey, white', N'Muun', N'none', 57, N'100', N'190', N'mammal')
INSERT [dbo].[SpeciesRaw] ([Id], [Edited], [Name], [Designation], [Created], [EyeColors], [SkinColors], [Language], [HairColors], [Homeworld], [AverageLifespan], [AverageHeight], [Classification]) VALUES (35, N'2014-12-20T21:36:42.209Z', N'Togruta', N'sentient', N'2014-12-20T18:44:03.246Z', N'red, orange, yellow, green, blue, black', N'red, white, orange, yellow, green, blue', N'Togruti', N'none', 58, N'94', N'180', N'mammal')
INSERT [dbo].[SpeciesRaw] ([Id], [Edited], [Name], [Designation], [Created], [EyeColors], [SkinColors], [Language], [HairColors], [Homeworld], [AverageLifespan], [AverageHeight], [Classification]) VALUES (36, N'2014-12-20T21:36:42.210Z', N'Kaleesh', N'sentient', N'2014-12-20T19:45:42.537Z', N'yellow', N'brown, orange, tan', N'Kaleesh', N'none', 59, N'80', N'170', N'reptile')
INSERT [dbo].[SpeciesRaw] ([Id], [Edited], [Name], [Designation], [Created], [EyeColors], [SkinColors], [Language], [HairColors], [Homeworld], [AverageLifespan], [AverageHeight], [Classification]) VALUES (37, N'2014-12-20T21:36:42.212Z', N'Pau''an', N'sentient', N'2014-12-20T20:35:06.777Z', N'black', N'grey', N'Utapese', N'none', 12, N'700', N'190', N'mammal')
SET IDENTITY_INSERT [dbo].[SpeciesRaw] OFF
SET IDENTITY_INSERT [dbo].[StarshipPilotsRaw] ON 

INSERT [dbo].[StarshipPilotsRaw] ([Id], [StarshipId], [PersonId]) VALUES (1, 10, 13)
INSERT [dbo].[StarshipPilotsRaw] ([Id], [StarshipId], [PersonId]) VALUES (2, 10, 14)
INSERT [dbo].[StarshipPilotsRaw] ([Id], [StarshipId], [PersonId]) VALUES (3, 10, 25)
INSERT [dbo].[StarshipPilotsRaw] ([Id], [StarshipId], [PersonId]) VALUES (4, 10, 31)
INSERT [dbo].[StarshipPilotsRaw] ([Id], [StarshipId], [PersonId]) VALUES (5, 12, 1)
INSERT [dbo].[StarshipPilotsRaw] ([Id], [StarshipId], [PersonId]) VALUES (6, 12, 9)
INSERT [dbo].[StarshipPilotsRaw] ([Id], [StarshipId], [PersonId]) VALUES (7, 12, 18)
INSERT [dbo].[StarshipPilotsRaw] ([Id], [StarshipId], [PersonId]) VALUES (8, 12, 19)
INSERT [dbo].[StarshipPilotsRaw] ([Id], [StarshipId], [PersonId]) VALUES (9, 13, 4)
INSERT [dbo].[StarshipPilotsRaw] ([Id], [StarshipId], [PersonId]) VALUES (10, 21, 22)
INSERT [dbo].[StarshipPilotsRaw] ([Id], [StarshipId], [PersonId]) VALUES (11, 22, 1)
INSERT [dbo].[StarshipPilotsRaw] ([Id], [StarshipId], [PersonId]) VALUES (12, 22, 13)
INSERT [dbo].[StarshipPilotsRaw] ([Id], [StarshipId], [PersonId]) VALUES (13, 22, 14)
INSERT [dbo].[StarshipPilotsRaw] ([Id], [StarshipId], [PersonId]) VALUES (14, 28, 29)
INSERT [dbo].[StarshipPilotsRaw] ([Id], [StarshipId], [PersonId]) VALUES (15, 39, 11)
INSERT [dbo].[StarshipPilotsRaw] ([Id], [StarshipId], [PersonId]) VALUES (16, 39, 35)
INSERT [dbo].[StarshipPilotsRaw] ([Id], [StarshipId], [PersonId]) VALUES (17, 39, 60)
INSERT [dbo].[StarshipPilotsRaw] ([Id], [StarshipId], [PersonId]) VALUES (18, 40, 39)
INSERT [dbo].[StarshipPilotsRaw] ([Id], [StarshipId], [PersonId]) VALUES (19, 41, 44)
INSERT [dbo].[StarshipPilotsRaw] ([Id], [StarshipId], [PersonId]) VALUES (20, 48, 10)
INSERT [dbo].[StarshipPilotsRaw] ([Id], [StarshipId], [PersonId]) VALUES (21, 48, 58)
INSERT [dbo].[StarshipPilotsRaw] ([Id], [StarshipId], [PersonId]) VALUES (22, 49, 35)
INSERT [dbo].[StarshipPilotsRaw] ([Id], [StarshipId], [PersonId]) VALUES (23, 59, 10)
INSERT [dbo].[StarshipPilotsRaw] ([Id], [StarshipId], [PersonId]) VALUES (24, 59, 11)
INSERT [dbo].[StarshipPilotsRaw] ([Id], [StarshipId], [PersonId]) VALUES (25, 64, 10)
INSERT [dbo].[StarshipPilotsRaw] ([Id], [StarshipId], [PersonId]) VALUES (26, 64, 35)
INSERT [dbo].[StarshipPilotsRaw] ([Id], [StarshipId], [PersonId]) VALUES (27, 65, 10)
INSERT [dbo].[StarshipPilotsRaw] ([Id], [StarshipId], [PersonId]) VALUES (28, 65, 11)
INSERT [dbo].[StarshipPilotsRaw] ([Id], [StarshipId], [PersonId]) VALUES (29, 74, 10)
INSERT [dbo].[StarshipPilotsRaw] ([Id], [StarshipId], [PersonId]) VALUES (30, 74, 79)
SET IDENTITY_INSERT [dbo].[StarshipPilotsRaw] OFF
SET IDENTITY_INSERT [dbo].[StarshipsRaw] ON 

INSERT [dbo].[StarshipsRaw] ([Id], [MGLT], [StarshipClass], [HyperdriveRating]) VALUES (2, N'60', N'corvette', N'2.0')
INSERT [dbo].[StarshipsRaw] ([Id], [MGLT], [StarshipClass], [HyperdriveRating]) VALUES (3, N'60', N'Star Destroyer', N'2.0')
INSERT [dbo].[StarshipsRaw] ([Id], [MGLT], [StarshipClass], [HyperdriveRating]) VALUES (5, N'70', N'landing craft', N'1.0')
INSERT [dbo].[StarshipsRaw] ([Id], [MGLT], [StarshipClass], [HyperdriveRating]) VALUES (9, N'10', N'Deep Space Mobile Battlestation', N'4.0')
INSERT [dbo].[StarshipsRaw] ([Id], [MGLT], [StarshipClass], [HyperdriveRating]) VALUES (10, N'75', N'Light freighter', N'0.5')
INSERT [dbo].[StarshipsRaw] ([Id], [MGLT], [StarshipClass], [HyperdriveRating]) VALUES (11, N'80', N'assault starfighter', N'1.0')
INSERT [dbo].[StarshipsRaw] ([Id], [MGLT], [StarshipClass], [HyperdriveRating]) VALUES (12, N'100', N'Starfighter', N'1.0')
INSERT [dbo].[StarshipsRaw] ([Id], [MGLT], [StarshipClass], [HyperdriveRating]) VALUES (13, N'105', N'Starfighter', N'1.0')
INSERT [dbo].[StarshipsRaw] ([Id], [MGLT], [StarshipClass], [HyperdriveRating]) VALUES (15, N'40', N'Star dreadnought', N'2.0')
INSERT [dbo].[StarshipsRaw] ([Id], [MGLT], [StarshipClass], [HyperdriveRating]) VALUES (17, N'20', N'Medium transport', N'4.0')
INSERT [dbo].[StarshipsRaw] ([Id], [MGLT], [StarshipClass], [HyperdriveRating]) VALUES (21, N'70', N'Patrol craft', N'3.0')
INSERT [dbo].[StarshipsRaw] ([Id], [MGLT], [StarshipClass], [HyperdriveRating]) VALUES (22, N'50', N'Armed government transport', N'1.0')
INSERT [dbo].[StarshipsRaw] ([Id], [MGLT], [StarshipClass], [HyperdriveRating]) VALUES (23, N'40', N'Escort ship', N'2.0')
INSERT [dbo].[StarshipsRaw] ([Id], [MGLT], [StarshipClass], [HyperdriveRating]) VALUES (27, N'60', N'Star Cruiser', N'1.0')
INSERT [dbo].[StarshipsRaw] ([Id], [MGLT], [StarshipClass], [HyperdriveRating]) VALUES (28, N'120', N'Starfighter', N'1.0')
INSERT [dbo].[StarshipsRaw] ([Id], [MGLT], [StarshipClass], [HyperdriveRating]) VALUES (29, N'91', N'Assault Starfighter', N'2.0')
INSERT [dbo].[StarshipsRaw] ([Id], [MGLT], [StarshipClass], [HyperdriveRating]) VALUES (31, N'unknown', N'Space cruiser', N'2.0')
INSERT [dbo].[StarshipsRaw] ([Id], [MGLT], [StarshipClass], [HyperdriveRating]) VALUES (32, N'unknown', N'Droid control ship', N'2.0')
INSERT [dbo].[StarshipsRaw] ([Id], [MGLT], [StarshipClass], [HyperdriveRating]) VALUES (39, N'unknown', N'Starfighter', N'1.0')
INSERT [dbo].[StarshipsRaw] ([Id], [MGLT], [StarshipClass], [HyperdriveRating]) VALUES (40, N'unknown', N'yacht', N'1.8')
INSERT [dbo].[StarshipsRaw] ([Id], [MGLT], [StarshipClass], [HyperdriveRating]) VALUES (41, N'unknown', N'Space Transport', N'1.5')
INSERT [dbo].[StarshipsRaw] ([Id], [MGLT], [StarshipClass], [HyperdriveRating]) VALUES (43, N'unknown', N'Diplomatic barge', N'0.7')
INSERT [dbo].[StarshipsRaw] ([Id], [MGLT], [StarshipClass], [HyperdriveRating]) VALUES (47, N'unknown', N'freighter', N'unknown')
INSERT [dbo].[StarshipsRaw] ([Id], [MGLT], [StarshipClass], [HyperdriveRating]) VALUES (48, N'unknown', N'Starfighter', N'1.0')
INSERT [dbo].[StarshipsRaw] ([Id], [MGLT], [StarshipClass], [HyperdriveRating]) VALUES (49, N'unknown', N'yacht', N'0.9')
INSERT [dbo].[StarshipsRaw] ([Id], [MGLT], [StarshipClass], [HyperdriveRating]) VALUES (52, N'unknown', N'assault ship', N'0.6')
INSERT [dbo].[StarshipsRaw] ([Id], [MGLT], [StarshipClass], [HyperdriveRating]) VALUES (58, N'unknown', N'yacht', N'1.5')
INSERT [dbo].[StarshipsRaw] ([Id], [MGLT], [StarshipClass], [HyperdriveRating]) VALUES (59, N'unknown', N'capital ship', N'1.5')
INSERT [dbo].[StarshipsRaw] ([Id], [MGLT], [StarshipClass], [HyperdriveRating]) VALUES (61, N'unknown', N'transport', N'1.0')
INSERT [dbo].[StarshipsRaw] ([Id], [MGLT], [StarshipClass], [HyperdriveRating]) VALUES (63, N'unknown', N'star destroyer', N'1.0')
INSERT [dbo].[StarshipsRaw] ([Id], [MGLT], [StarshipClass], [HyperdriveRating]) VALUES (64, N'unknown', N'yacht', N'0.5')
INSERT [dbo].[StarshipsRaw] ([Id], [MGLT], [StarshipClass], [HyperdriveRating]) VALUES (65, N'unknown', N'starfighter', N'1.0')
INSERT [dbo].[StarshipsRaw] ([Id], [MGLT], [StarshipClass], [HyperdriveRating]) VALUES (66, N'100', N'starfighter', N'1.0')
INSERT [dbo].[StarshipsRaw] ([Id], [MGLT], [StarshipClass], [HyperdriveRating]) VALUES (68, N'unknown', N'cruiser', N'1.0')
INSERT [dbo].[StarshipsRaw] ([Id], [MGLT], [StarshipClass], [HyperdriveRating]) VALUES (74, N'unknown', N'starfighter', N'6')
INSERT [dbo].[StarshipsRaw] ([Id], [MGLT], [StarshipClass], [HyperdriveRating]) VALUES (75, N'unknown', N'starfighter', N'1.0')
SET IDENTITY_INSERT [dbo].[StarshipsRaw] OFF
SET IDENTITY_INSERT [dbo].[TransportsRaw] ON 

INSERT [dbo].[TransportsRaw] ([Id], [Edited], [Consumables], [Name], [Created], [CargoCapacity], [Passengers], [MaxAtmospheringSpeed], [Crew], [Length], [Model], [CostInCredits], [Manufacturer]) VALUES (2, N'2014-12-20T21:23:49.867Z', N'1 year', N'CR90 corvette', N'2014-12-10T14:20:33.369Z', N'3000000', N'600', N'950', N'30-165', N'150', N'CR90 corvette', N'3500000', N'Corellian Engineering Corporation')
INSERT [dbo].[TransportsRaw] ([Id], [Edited], [Consumables], [Name], [Created], [CargoCapacity], [Passengers], [MaxAtmospheringSpeed], [Crew], [Length], [Model], [CostInCredits], [Manufacturer]) VALUES (3, N'2014-12-20T21:23:49.870Z', N'2 years', N'Star Destroyer', N'2014-12-10T15:08:19.848Z', N'36000000', N'n/a', N'975', N'47,060', N'1,600', N'Imperial I-class Star Destroyer', N'150000000', N'Kuat Drive Yards')
INSERT [dbo].[TransportsRaw] ([Id], [Edited], [Consumables], [Name], [Created], [CargoCapacity], [Passengers], [MaxAtmospheringSpeed], [Crew], [Length], [Model], [CostInCredits], [Manufacturer]) VALUES (4, N'2014-12-20T21:30:21.661Z', N'2 months', N'Sand Crawler', N'2014-12-10T15:36:25.724Z', N'50000', N'30', N'30', N'46', N'36.8 ', N'Digger Crawler', N'150000', N'Corellia Mining Corporation')
INSERT [dbo].[TransportsRaw] ([Id], [Edited], [Consumables], [Name], [Created], [CargoCapacity], [Passengers], [MaxAtmospheringSpeed], [Crew], [Length], [Model], [CostInCredits], [Manufacturer]) VALUES (5, N'2014-12-20T21:23:49.873Z', N'1 month', N'Sentinel-class landing craft', N'2014-12-10T15:48:00.586Z', N'180000', N'75', N'1000', N'5', N'38', N'Sentinel-class landing craft', N'240000', N'Sienar Fleet Systems, Cyngus Spaceworks')
INSERT [dbo].[TransportsRaw] ([Id], [Edited], [Consumables], [Name], [Created], [CargoCapacity], [Passengers], [MaxAtmospheringSpeed], [Crew], [Length], [Model], [CostInCredits], [Manufacturer]) VALUES (6, N'2014-12-20T21:30:21.665Z', N'0', N'T-16 skyhopper', N'2014-12-10T16:01:52.434Z', N'50', N'1', N'1200', N'1', N'10.4 ', N'T-16 skyhopper', N'14500', N'Incom Corporation')
INSERT [dbo].[TransportsRaw] ([Id], [Edited], [Consumables], [Name], [Created], [CargoCapacity], [Passengers], [MaxAtmospheringSpeed], [Crew], [Length], [Model], [CostInCredits], [Manufacturer]) VALUES (7, N'2014-12-20T21:30:21.668Z', N'unknown', N'X-34 landspeeder', N'2014-12-10T16:13:52.586Z', N'5', N'1', N'250', N'1', N'3.4 ', N'X-34 landspeeder', N'10550', N'SoroSuub Corporation')
INSERT [dbo].[TransportsRaw] ([Id], [Edited], [Consumables], [Name], [Created], [CargoCapacity], [Passengers], [MaxAtmospheringSpeed], [Crew], [Length], [Model], [CostInCredits], [Manufacturer]) VALUES (8, N'2014-12-20T21:30:21.670Z', N'2 days', N'TIE/LN starfighter', N'2014-12-10T16:33:52.860Z', N'65', N'0', N'1200', N'1', N'6.4', N'Twin Ion Engine/Ln Starfighter', N'unknown', N'Sienar Fleet Systems')
INSERT [dbo].[TransportsRaw] ([Id], [Edited], [Consumables], [Name], [Created], [CargoCapacity], [Passengers], [MaxAtmospheringSpeed], [Crew], [Length], [Model], [CostInCredits], [Manufacturer]) VALUES (9, N'2014-12-20T21:26:24.783Z', N'3 years', N'Death Star', N'2014-12-10T16:36:50.509Z', N'1000000000000', N'843,342', N'n/a', N'342,953', N'120000', N'DS-1 Orbital Battle Station', N'1000000000000', N'Imperial Department of Military Research, Sienar Fleet Systems')
INSERT [dbo].[TransportsRaw] ([Id], [Edited], [Consumables], [Name], [Created], [CargoCapacity], [Passengers], [MaxAtmospheringSpeed], [Crew], [Length], [Model], [CostInCredits], [Manufacturer]) VALUES (10, N'2014-12-20T21:23:49.880Z', N'2 months', N'Millennium Falcon', N'2014-12-10T16:59:45.094Z', N'100000', N'6', N'1050', N'4', N'34.37', N'YT-1300 light freighter', N'100000', N'Corellian Engineering Corporation')
INSERT [dbo].[TransportsRaw] ([Id], [Edited], [Consumables], [Name], [Created], [CargoCapacity], [Passengers], [MaxAtmospheringSpeed], [Crew], [Length], [Model], [CostInCredits], [Manufacturer]) VALUES (11, N'2014-12-20T21:23:49.883Z', N'1 week', N'Y-wing', N'2014-12-12T11:00:39.817Z', N'110', N'0', N'1000km', N'2', N'14', N'BTL Y-wing', N'134999', N'Koensayr Manufacturing')
INSERT [dbo].[TransportsRaw] ([Id], [Edited], [Consumables], [Name], [Created], [CargoCapacity], [Passengers], [MaxAtmospheringSpeed], [Crew], [Length], [Model], [CostInCredits], [Manufacturer]) VALUES (12, N'2014-12-20T21:23:49.886Z', N'1 week', N'X-wing', N'2014-12-12T11:19:05.340Z', N'110', N'0', N'1050', N'1', N'12.5', N'T-65 X-wing', N'149999', N'Incom Corporation')
INSERT [dbo].[TransportsRaw] ([Id], [Edited], [Consumables], [Name], [Created], [CargoCapacity], [Passengers], [MaxAtmospheringSpeed], [Crew], [Length], [Model], [CostInCredits], [Manufacturer]) VALUES (13, N'2014-12-20T21:23:49.889Z', N'5 days', N'TIE Advanced x1', N'2014-12-12T11:21:32.991Z', N'150', N'0', N'1200', N'1', N'9.2', N'Twin Ion Engine Advanced x1', N'unknown', N'Sienar Fleet Systems')
INSERT [dbo].[TransportsRaw] ([Id], [Edited], [Consumables], [Name], [Created], [CargoCapacity], [Passengers], [MaxAtmospheringSpeed], [Crew], [Length], [Model], [CostInCredits], [Manufacturer]) VALUES (14, N'2014-12-20T21:30:21.672Z', N'none', N'Snowspeeder', N'2014-12-15T12:22:12Z', N'10', N'0', N'650', N'2', N'4.5', N't-47 airspeeder', N'unknown', N'Incom corporation')
INSERT [dbo].[TransportsRaw] ([Id], [Edited], [Consumables], [Name], [Created], [CargoCapacity], [Passengers], [MaxAtmospheringSpeed], [Crew], [Length], [Model], [CostInCredits], [Manufacturer]) VALUES (15, N'2014-12-20T21:23:49.893Z', N'6 years', N'Executor', N'2014-12-15T12:31:42.547Z', N'250000000', N'38000', N'n/a', N'279,144', N'19000', N'Executor-class star dreadnought', N'1143350000', N'Kuat Drive Yards, Fondor Shipyards')
INSERT [dbo].[TransportsRaw] ([Id], [Edited], [Consumables], [Name], [Created], [CargoCapacity], [Passengers], [MaxAtmospheringSpeed], [Crew], [Length], [Model], [CostInCredits], [Manufacturer]) VALUES (16, N'2014-12-20T21:30:21.675Z', N'2 days', N'TIE bomber', N'2014-12-15T12:33:15.838Z', N'none', N'0', N'850', N'1', N'7.8', N'TIE/sa bomber', N'unknown', N'Sienar Fleet Systems')
INSERT [dbo].[TransportsRaw] ([Id], [Edited], [Consumables], [Name], [Created], [CargoCapacity], [Passengers], [MaxAtmospheringSpeed], [Crew], [Length], [Model], [CostInCredits], [Manufacturer]) VALUES (17, N'2014-12-20T21:23:49.895Z', N'6 months', N'Rebel transport', N'2014-12-15T12:34:52.264Z', N'19000000', N'90', N'650', N'6', N'90', N'GR-75 medium transport', N'unknown', N'Gallofree Yards, Inc.')
INSERT [dbo].[TransportsRaw] ([Id], [Edited], [Consumables], [Name], [Created], [CargoCapacity], [Passengers], [MaxAtmospheringSpeed], [Crew], [Length], [Model], [CostInCredits], [Manufacturer]) VALUES (18, N'2014-12-20T21:30:21.677Z', N'unknown', N'AT-AT', N'2014-12-15T12:38:25.937Z', N'1000', N'40', N'60', N'5', N'20', N'All Terrain Armored Transport', N'unknown', N'Kuat Drive Yards, Imperial Department of Military Research')
INSERT [dbo].[TransportsRaw] ([Id], [Edited], [Consumables], [Name], [Created], [CargoCapacity], [Passengers], [MaxAtmospheringSpeed], [Crew], [Length], [Model], [CostInCredits], [Manufacturer]) VALUES (19, N'2014-12-20T21:30:21.679Z', N'none', N'AT-ST', N'2014-12-15T12:46:42.384Z', N'200', N'0', N'90', N'2', N'2', N'All Terrain Scout Transport', N'unknown', N'Kuat Drive Yards, Imperial Department of Military Research')
INSERT [dbo].[TransportsRaw] ([Id], [Edited], [Consumables], [Name], [Created], [CargoCapacity], [Passengers], [MaxAtmospheringSpeed], [Crew], [Length], [Model], [CostInCredits], [Manufacturer]) VALUES (20, N'2014-12-20T21:30:21.681Z', N'1 day', N'Storm IV Twin-Pod cloud car', N'2014-12-15T12:58:50.530Z', N'10', N'0', N'1500', N'2', N'7', N'Storm IV Twin-Pod', N'75000', N'Bespin Motors')
INSERT [dbo].[TransportsRaw] ([Id], [Edited], [Consumables], [Name], [Created], [CargoCapacity], [Passengers], [MaxAtmospheringSpeed], [Crew], [Length], [Model], [CostInCredits], [Manufacturer]) VALUES (21, N'2014-12-20T21:23:49.897Z', N'1 month', N'Slave 1', N'2014-12-15T13:00:56.332Z', N'70000', N'6', N'1000', N'1', N'21.5', N'Firespray-31-class patrol and attack', N'unknown', N'Kuat Systems Engineering')
INSERT [dbo].[TransportsRaw] ([Id], [Edited], [Consumables], [Name], [Created], [CargoCapacity], [Passengers], [MaxAtmospheringSpeed], [Crew], [Length], [Model], [CostInCredits], [Manufacturer]) VALUES (22, N'2014-12-20T21:23:49.900Z', N'2 months', N'Imperial shuttle', N'2014-12-15T13:04:47.235Z', N'80000', N'20', N'850', N'6', N'20', N'Lambda-class T-4a shuttle', N'240000', N'Sienar Fleet Systems')
INSERT [dbo].[TransportsRaw] ([Id], [Edited], [Consumables], [Name], [Created], [CargoCapacity], [Passengers], [MaxAtmospheringSpeed], [Crew], [Length], [Model], [CostInCredits], [Manufacturer]) VALUES (23, N'2014-12-20T21:23:49.902Z', N'2 years', N'EF76 Nebulon-B escort frigate', N'2014-12-15T13:06:30.813Z', N'6000000', N'75', N'800', N'854', N'300', N'EF76 Nebulon-B escort frigate', N'8500000', N'Kuat Drive Yards')
INSERT [dbo].[TransportsRaw] ([Id], [Edited], [Consumables], [Name], [Created], [CargoCapacity], [Passengers], [MaxAtmospheringSpeed], [Crew], [Length], [Model], [CostInCredits], [Manufacturer]) VALUES (24, N'2014-12-20T21:30:21.684Z', N'Live food tanks', N'Sail barge', N'2014-12-18T10:44:14.217Z', N'2000000', N'500', N'100', N'26', N'30', N'Modified Luxury Sail Barge', N'285000', N'Ubrikkian Industries Custom Vehicle Division')
INSERT [dbo].[TransportsRaw] ([Id], [Edited], [Consumables], [Name], [Created], [CargoCapacity], [Passengers], [MaxAtmospheringSpeed], [Crew], [Length], [Model], [CostInCredits], [Manufacturer]) VALUES (25, N'2014-12-20T21:30:21.688Z', N'1 day', N'Bantha-II cargo skiff', N'2014-12-18T10:48:03.208Z', N'135000', N'16', N'250', N'5', N'9.5', N'Bantha-II', N'8000', N'Ubrikkian Industries')
INSERT [dbo].[TransportsRaw] ([Id], [Edited], [Consumables], [Name], [Created], [CargoCapacity], [Passengers], [MaxAtmospheringSpeed], [Crew], [Length], [Model], [CostInCredits], [Manufacturer]) VALUES (26, N'2014-12-20T21:30:21.691Z', N'2 days', N'TIE/IN interceptor', N'2014-12-18T10:50:28.225Z', N'75', N'0', N'1250', N'1', N'9.6', N'Twin Ion Engine Interceptor', N'unknown', N'Sienar Fleet Systems')
INSERT [dbo].[TransportsRaw] ([Id], [Edited], [Consumables], [Name], [Created], [CargoCapacity], [Passengers], [MaxAtmospheringSpeed], [Crew], [Length], [Model], [CostInCredits], [Manufacturer]) VALUES (27, N'2014-12-20T21:23:49.904Z', N'2 years', N'Calamari Cruiser', N'2014-12-18T10:54:57.804Z', N'unknown', N'1200', N'n/a', N'5400', N'1200', N'MC80 Liberty type Star Cruiser', N'104000000', N'Mon Calamari shipyards')
INSERT [dbo].[TransportsRaw] ([Id], [Edited], [Consumables], [Name], [Created], [CargoCapacity], [Passengers], [MaxAtmospheringSpeed], [Crew], [Length], [Model], [CostInCredits], [Manufacturer]) VALUES (28, N'2014-12-20T21:23:49.907Z', N'1 week', N'A-wing', N'2014-12-18T11:16:34.542Z', N'40', N'0', N'1300', N'1', N'9.6', N'RZ-1 A-wing Interceptor', N'175000', N'Alliance Underground Engineering, Incom Corporation')
INSERT [dbo].[TransportsRaw] ([Id], [Edited], [Consumables], [Name], [Created], [CargoCapacity], [Passengers], [MaxAtmospheringSpeed], [Crew], [Length], [Model], [CostInCredits], [Manufacturer]) VALUES (29, N'2014-12-20T21:23:49.909Z', N'1 week', N'B-wing', N'2014-12-18T11:18:04.763Z', N'45', N'0', N'950', N'1', N'16.9', N'A/SF-01 B-wing starfighter', N'220000', N'Slayn & Korpil')
INSERT [dbo].[TransportsRaw] ([Id], [Edited], [Consumables], [Name], [Created], [CargoCapacity], [Passengers], [MaxAtmospheringSpeed], [Crew], [Length], [Model], [CostInCredits], [Manufacturer]) VALUES (30, N'2014-12-20T21:30:21.693Z', N'1 day', N'Imperial Speeder Bike', N'2014-12-18T11:20:04.625Z', N'4', N'1', N'360', N'1', N'3', N'74-Z speeder bike', N'8000', N'Aratech Repulsor Company')
INSERT [dbo].[TransportsRaw] ([Id], [Edited], [Consumables], [Name], [Created], [CargoCapacity], [Passengers], [MaxAtmospheringSpeed], [Crew], [Length], [Model], [CostInCredits], [Manufacturer]) VALUES (31, N'2014-12-20T21:23:49.912Z', N'unknown', N'Republic Cruiser', N'2014-12-19T17:01:31.488Z', N'unknown', N'16', N'900', N'9', N'115', N'Consular-class cruiser', N'unknown', N'Corellian Engineering Corporation')
INSERT [dbo].[TransportsRaw] ([Id], [Edited], [Consumables], [Name], [Created], [CargoCapacity], [Passengers], [MaxAtmospheringSpeed], [Crew], [Length], [Model], [CostInCredits], [Manufacturer]) VALUES (32, N'2014-12-20T21:23:49.915Z', N'500 days', N'Droid control ship', N'2014-12-19T17:04:06.323Z', N'4000000000', N'139000', N'n/a', N'175', N'3170', N'Lucrehulk-class Droid Control Ship', N'unknown', N'Hoersch-Kessel Drive, Inc.')
INSERT [dbo].[TransportsRaw] ([Id], [Edited], [Consumables], [Name], [Created], [CargoCapacity], [Passengers], [MaxAtmospheringSpeed], [Crew], [Length], [Model], [CostInCredits], [Manufacturer]) VALUES (33, N'2014-12-20T21:30:21.697Z', N'none', N'Vulture Droid', N'2014-12-19T17:09:53.584Z', N'0', N'0', N'1200', N'0', N'3.5', N'Vulture-class droid starfighter', N'unknown', N'Haor Chall Engineering, Baktoid Armor Workshop')
INSERT [dbo].[TransportsRaw] ([Id], [Edited], [Consumables], [Name], [Created], [CargoCapacity], [Passengers], [MaxAtmospheringSpeed], [Crew], [Length], [Model], [CostInCredits], [Manufacturer]) VALUES (34, N'2014-12-20T21:30:21.700Z', N'unknown', N'Multi-Troop Transport', N'2014-12-19T17:12:04.400Z', N'12000', N'112', N'35', N'4', N'31', N'Multi-Troop Transport', N'138000', N'Baktoid Armor Workshop')
INSERT [dbo].[TransportsRaw] ([Id], [Edited], [Consumables], [Name], [Created], [CargoCapacity], [Passengers], [MaxAtmospheringSpeed], [Crew], [Length], [Model], [CostInCredits], [Manufacturer]) VALUES (35, N'2014-12-20T21:30:21.703Z', N'unknown', N'Armored Assault Tank', N'2014-12-19T17:13:29.799Z', N'unknown', N'6', N'55', N'4', N'9.75', N'Armoured Assault Tank', N'unknown', N'Baktoid Armor Workshop')
INSERT [dbo].[TransportsRaw] ([Id], [Edited], [Consumables], [Name], [Created], [CargoCapacity], [Passengers], [MaxAtmospheringSpeed], [Crew], [Length], [Model], [CostInCredits], [Manufacturer]) VALUES (36, N'2014-12-20T21:30:21.705Z', N'none', N'Single Trooper Aerial Platform', N'2014-12-19T17:15:09.511Z', N'none', N'0', N'400', N'1', N'2', N'Single Trooper Aerial Platform', N'2500', N'Baktoid Armor Workshop')
INSERT [dbo].[TransportsRaw] ([Id], [Edited], [Consumables], [Name], [Created], [CargoCapacity], [Passengers], [MaxAtmospheringSpeed], [Crew], [Length], [Model], [CostInCredits], [Manufacturer]) VALUES (37, N'2014-12-20T21:30:21.707Z', N'1 day', N'C-9979 landing craft', N'2014-12-19T17:20:36.373Z', N'1800000', N'284', N'587', N'140', N'210', N'C-9979 landing craft', N'200000', N'Haor Chall Engineering')
INSERT [dbo].[TransportsRaw] ([Id], [Edited], [Consumables], [Name], [Created], [CargoCapacity], [Passengers], [MaxAtmospheringSpeed], [Crew], [Length], [Model], [CostInCredits], [Manufacturer]) VALUES (38, N'2014-12-20T21:30:21.710Z', N'unknown', N'Tribubble bongo', N'2014-12-19T17:37:37.924Z', N'1600', N'2', N'85', N'1', N'15', N'Tribubble bongo', N'unknown', N'Otoh Gunga Bongameken Cooperative')
INSERT [dbo].[TransportsRaw] ([Id], [Edited], [Consumables], [Name], [Created], [CargoCapacity], [Passengers], [MaxAtmospheringSpeed], [Crew], [Length], [Model], [CostInCredits], [Manufacturer]) VALUES (39, N'2014-12-20T21:23:49.917Z', N'7 days', N'Naboo fighter', N'2014-12-19T17:39:17.582Z', N'65', N'0', N'1100', N'1', N'11', N'N-1 starfighter', N'200000', N'Theed Palace Space Vessel Engineering Corps')
INSERT [dbo].[TransportsRaw] ([Id], [Edited], [Consumables], [Name], [Created], [CargoCapacity], [Passengers], [MaxAtmospheringSpeed], [Crew], [Length], [Model], [CostInCredits], [Manufacturer]) VALUES (40, N'2014-12-20T21:23:49.919Z', N'unknown', N'Naboo Royal Starship', N'2014-12-19T17:45:03.506Z', N'unknown', N'unknown', N'920', N'8', N'76', N'J-type 327 Nubian royal starship', N'unknown', N'Theed Palace Space Vessel Engineering Corps, Nubia Star Drives')
INSERT [dbo].[TransportsRaw] ([Id], [Edited], [Consumables], [Name], [Created], [CargoCapacity], [Passengers], [MaxAtmospheringSpeed], [Crew], [Length], [Model], [CostInCredits], [Manufacturer]) VALUES (41, N'2014-12-20T21:23:49.922Z', N'30 days', N'Scimitar', N'2014-12-20T09:39:56.116Z', N'2500000', N'6', N'1180', N'1', N'26.5', N'Star Courier', N'55000000', N'Republic Sienar Systems')
INSERT [dbo].[TransportsRaw] ([Id], [Edited], [Consumables], [Name], [Created], [CargoCapacity], [Passengers], [MaxAtmospheringSpeed], [Crew], [Length], [Model], [CostInCredits], [Manufacturer]) VALUES (42, N'2014-12-20T21:30:21.712Z', N'unknown', N'Sith speeder', N'2014-12-20T10:09:56.095Z', N'2', N'0', N'180', N'1', N'1.5', N'FC-20 speeder bike', N'4000', N'Razalon')
INSERT [dbo].[TransportsRaw] ([Id], [Edited], [Consumables], [Name], [Created], [CargoCapacity], [Passengers], [MaxAtmospheringSpeed], [Crew], [Length], [Model], [CostInCredits], [Manufacturer]) VALUES (43, N'2014-12-20T21:23:49.925Z', N'1 year', N'J-type diplomatic barge', N'2014-12-20T11:05:51.237Z', N'unknown', N'10', N'2000', N'5', N'39', N'J-type diplomatic barge', N'2000000', N'Theed Palace Space Vessel Engineering Corps, Nubia Star Drives')
INSERT [dbo].[TransportsRaw] ([Id], [Edited], [Consumables], [Name], [Created], [CargoCapacity], [Passengers], [MaxAtmospheringSpeed], [Crew], [Length], [Model], [CostInCredits], [Manufacturer]) VALUES (44, N'2014-12-20T21:30:21.714Z', N'none', N'Zephyr-G swoop bike', N'2014-12-20T16:24:16.026Z', N'200', N'1', N'350', N'1', N'3.68', N'Zephyr-G swoop bike', N'5750', N'Mobquet Swoops and Speeders')
INSERT [dbo].[TransportsRaw] ([Id], [Edited], [Consumables], [Name], [Created], [CargoCapacity], [Passengers], [MaxAtmospheringSpeed], [Crew], [Length], [Model], [CostInCredits], [Manufacturer]) VALUES (45, N'2014-12-20T21:30:21.716Z', N'unknown', N'Koro-2 Exodrive airspeeder', N'2014-12-20T17:17:33.526Z', N'80', N'1', N'800', N'1', N'6.6', N'Koro-2 Exodrive airspeeder', N'unknown', N'Desler Gizh Outworld Mobility Corporation')
INSERT [dbo].[TransportsRaw] ([Id], [Edited], [Consumables], [Name], [Created], [CargoCapacity], [Passengers], [MaxAtmospheringSpeed], [Crew], [Length], [Model], [CostInCredits], [Manufacturer]) VALUES (46, N'2014-12-20T21:30:21.719Z', N'unknown', N'XJ-6 airspeeder', N'2014-12-20T17:19:19.991Z', N'unknown', N'1', N'720', N'1', N'6.23', N'XJ-6 airspeeder', N'unknown', N'Narglatch AirTech prefabricated kit')
INSERT [dbo].[TransportsRaw] ([Id], [Edited], [Consumables], [Name], [Created], [CargoCapacity], [Passengers], [MaxAtmospheringSpeed], [Crew], [Length], [Model], [CostInCredits], [Manufacturer]) VALUES (47, N'2014-12-20T21:23:49.928Z', N'unknown', N'AA-9 Coruscant freighter', N'2014-12-20T17:24:23.509Z', N'unknown', N'30000', N'unknown', N'unknown', N'390', N'Botajef AA-9 Freighter-Liner', N'unknown', N'Botajef Shipyards')
INSERT [dbo].[TransportsRaw] ([Id], [Edited], [Consumables], [Name], [Created], [CargoCapacity], [Passengers], [MaxAtmospheringSpeed], [Crew], [Length], [Model], [CostInCredits], [Manufacturer]) VALUES (48, N'2014-12-20T21:23:49.930Z', N'7 days', N'Jedi starfighter', N'2014-12-20T17:35:23.906Z', N'60', N'0', N'1150', N'1', N'8', N'Delta-7 Aethersprite-class interceptor', N'180000', N'Kuat Systems Engineering')
INSERT [dbo].[TransportsRaw] ([Id], [Edited], [Consumables], [Name], [Created], [CargoCapacity], [Passengers], [MaxAtmospheringSpeed], [Crew], [Length], [Model], [CostInCredits], [Manufacturer]) VALUES (49, N'2014-12-20T21:23:49.932Z', N'unknown', N'H-type Nubian yacht', N'2014-12-20T17:46:46.847Z', N'unknown', N'unknown', N'8000', N'4', N'47.9', N'H-type Nubian yacht', N'unknown', N'Theed Palace Space Vessel Engineering Corps')
INSERT [dbo].[TransportsRaw] ([Id], [Edited], [Consumables], [Name], [Created], [CargoCapacity], [Passengers], [MaxAtmospheringSpeed], [Crew], [Length], [Model], [CostInCredits], [Manufacturer]) VALUES (50, N'2014-12-20T21:30:21.723Z', N'unknown', N'LAAT/i', N'2014-12-20T18:01:21.014Z', N'170', N'30', N'620', N'6', N'17.4', N'Low Altitude Assault Transport/infrantry', N'unknown', N'Rothana Heavy Engineering')
INSERT [dbo].[TransportsRaw] ([Id], [Edited], [Consumables], [Name], [Created], [CargoCapacity], [Passengers], [MaxAtmospheringSpeed], [Crew], [Length], [Model], [CostInCredits], [Manufacturer]) VALUES (51, N'2014-12-20T21:30:21.725Z', N'unknown', N'LAAT/c', N'2014-12-20T18:02:46.802Z', N'40000', N'0', N'620', N'1', N'28.82', N'Low Altitude Assault Transport/carrier', N'unknown', N'Rothana Heavy Engineering')
INSERT [dbo].[TransportsRaw] ([Id], [Edited], [Consumables], [Name], [Created], [CargoCapacity], [Passengers], [MaxAtmospheringSpeed], [Crew], [Length], [Model], [CostInCredits], [Manufacturer]) VALUES (52, N'2014-12-20T21:23:49.935Z', N'2 years', N'Republic Assault ship', N'2014-12-20T18:08:42.926Z', N'11250000', N'16000', N'unknown', N'700', N'752', N'Acclamator I-class assault ship', N'unknown', N'Rothana Heavy Engineering')
INSERT [dbo].[TransportsRaw] ([Id], [Edited], [Consumables], [Name], [Created], [CargoCapacity], [Passengers], [MaxAtmospheringSpeed], [Crew], [Length], [Model], [CostInCredits], [Manufacturer]) VALUES (53, N'2014-12-20T21:30:21.728Z', N'21 days', N'AT-TE', N'2014-12-20T18:10:07.560Z', N'10000', N'36', N'60', N'6', N'13.2', N'All Terrain Tactical Enforcer', N'unknown', N'Rothana Heavy Engineering, Kuat Drive Yards')
INSERT [dbo].[TransportsRaw] ([Id], [Edited], [Consumables], [Name], [Created], [CargoCapacity], [Passengers], [MaxAtmospheringSpeed], [Crew], [Length], [Model], [CostInCredits], [Manufacturer]) VALUES (54, N'2014-12-20T21:30:21.731Z', N'7 days', N'SPHA', N'2014-12-20T18:12:32.315Z', N'500', N'30', N'35', N'25', N'140', N'Self-Propelled Heavy Artillery', N'unknown', N'Rothana Heavy Engineering')
INSERT [dbo].[TransportsRaw] ([Id], [Edited], [Consumables], [Name], [Created], [CargoCapacity], [Passengers], [MaxAtmospheringSpeed], [Crew], [Length], [Model], [CostInCredits], [Manufacturer]) VALUES (55, N'2014-12-20T21:30:21.735Z', N'unknown', N'Flitknot speeder', N'2014-12-20T18:15:20.312Z', N'unknown', N'0', N'634', N'1', N'2', N'Flitknot speeder', N'8000', N'Huppla Pasa Tisc Shipwrights Collective')
INSERT [dbo].[TransportsRaw] ([Id], [Edited], [Consumables], [Name], [Created], [CargoCapacity], [Passengers], [MaxAtmospheringSpeed], [Crew], [Length], [Model], [CostInCredits], [Manufacturer]) VALUES (56, N'2014-12-20T21:30:21.739Z', N'7 days', N'Neimoidian shuttle', N'2014-12-20T18:25:44.912Z', N'1000', N'6', N'880', N'2', N'20', N'Sheathipede-class transport shuttle', N'unknown', N'Haor Chall Engineering')
INSERT [dbo].[TransportsRaw] ([Id], [Edited], [Consumables], [Name], [Created], [CargoCapacity], [Passengers], [MaxAtmospheringSpeed], [Crew], [Length], [Model], [CostInCredits], [Manufacturer]) VALUES (57, N'2014-12-20T21:30:21.742Z', N'unknown', N'Geonosian starfighter', N'2014-12-20T18:34:12.541Z', N'unknown', N'0', N'20000', N'1', N'9.8', N'Nantex-class territorial defense', N'unknown', N'Huppla Pasa Tisc Shipwrights Collective')
INSERT [dbo].[TransportsRaw] ([Id], [Edited], [Consumables], [Name], [Created], [CargoCapacity], [Passengers], [MaxAtmospheringSpeed], [Crew], [Length], [Model], [CostInCredits], [Manufacturer]) VALUES (58, N'2014-12-20T21:23:49.937Z', N'7 days', N'Solar Sailer', N'2014-12-20T18:37:56.969Z', N'240', N'11', N'1600', N'3', N'15.2', N'Punworcca 116-class interstellar sloop', N'35700', N'Huppla Pasa Tisc Shipwrights Collective')
INSERT [dbo].[TransportsRaw] ([Id], [Edited], [Consumables], [Name], [Created], [CargoCapacity], [Passengers], [MaxAtmospheringSpeed], [Crew], [Length], [Model], [CostInCredits], [Manufacturer]) VALUES (59, N'2014-12-20T21:23:49.941Z', N'4 years', N'Trade Federation cruiser', N'2014-12-20T19:40:21.902Z', N'50000000', N'48247', N'1050', N'600', N'1088', N'Providence-class carrier/destroyer', N'125000000', N'Rendili StarDrive, Free Dac Volunteers Engineering corps.')
INSERT [dbo].[TransportsRaw] ([Id], [Edited], [Consumables], [Name], [Created], [CargoCapacity], [Passengers], [MaxAtmospheringSpeed], [Crew], [Length], [Model], [CostInCredits], [Manufacturer]) VALUES (60, N'2014-12-20T21:30:21.745Z', N'none', N'Tsmeu-6 personal wheel bike', N'2014-12-20T19:43:54.870Z', N'10', N'1', N'330', N'1', N'3.5', N'Tsmeu-6 personal wheel bike', N'15000', N'Z-Gomot Ternbuell Guppat Corporation')
INSERT [dbo].[TransportsRaw] ([Id], [Edited], [Consumables], [Name], [Created], [CargoCapacity], [Passengers], [MaxAtmospheringSpeed], [Crew], [Length], [Model], [CostInCredits], [Manufacturer]) VALUES (61, N'2014-12-20T21:23:49.944Z', N'56 days', N'Theta-class T-2c shuttle', N'2014-12-20T19:48:40.409Z', N'50000', N'16', N'2000', N'5', N'18.5', N'Theta-class T-2c shuttle', N'1000000', N'Cygnus Spaceworks')
INSERT [dbo].[TransportsRaw] ([Id], [Edited], [Consumables], [Name], [Created], [CargoCapacity], [Passengers], [MaxAtmospheringSpeed], [Crew], [Length], [Model], [CostInCredits], [Manufacturer]) VALUES (62, N'2014-12-20T21:30:21.749Z', N'unknown', N'Emergency Firespeeder', N'2014-12-20T19:50:58.559Z', N'unknown', N'unknown', N'unknown', N'2', N'unknown', N'Fire suppression speeder', N'unknown', N'unknown')
INSERT [dbo].[TransportsRaw] ([Id], [Edited], [Consumables], [Name], [Created], [CargoCapacity], [Passengers], [MaxAtmospheringSpeed], [Crew], [Length], [Model], [CostInCredits], [Manufacturer]) VALUES (63, N'2014-12-20T21:23:49.946Z', N'2 years', N'Republic attack cruiser', N'2014-12-20T19:52:56.232Z', N'20000000', N'2000', N'975', N'7400', N'1137', N'Senator-class Star Destroyer', N'59000000', N'Kuat Drive Yards, Allanteen Six shipyards')
INSERT [dbo].[TransportsRaw] ([Id], [Edited], [Consumables], [Name], [Created], [CargoCapacity], [Passengers], [MaxAtmospheringSpeed], [Crew], [Length], [Model], [CostInCredits], [Manufacturer]) VALUES (64, N'2014-12-20T21:23:49.948Z', N'unknown', N'Naboo star skiff', N'2014-12-20T19:55:15.396Z', N'unknown', N'3', N'1050', N'3', N'29.2', N'J-type star skiff', N'unknown', N'Theed Palace Space Vessel Engineering Corps/Nubia Star Drives, Incorporated')
INSERT [dbo].[TransportsRaw] ([Id], [Edited], [Consumables], [Name], [Created], [CargoCapacity], [Passengers], [MaxAtmospheringSpeed], [Crew], [Length], [Model], [CostInCredits], [Manufacturer]) VALUES (65, N'2014-12-20T21:23:49.951Z', N'2 days', N'Jedi Interceptor', N'2014-12-20T19:56:57.468Z', N'60', N'0', N'1500', N'1', N'5.47', N'Eta-2 Actis-class light interceptor', N'320000', N'Kuat Systems Engineering')
INSERT [dbo].[TransportsRaw] ([Id], [Edited], [Consumables], [Name], [Created], [CargoCapacity], [Passengers], [MaxAtmospheringSpeed], [Crew], [Length], [Model], [CostInCredits], [Manufacturer]) VALUES (66, N'2014-12-20T21:23:49.953Z', N'5 days', N'arc-170', N'2014-12-20T20:03:48.603Z', N'110', N'0', N'1000', N'3', N'14.5', N'Aggressive Reconnaissance-170 starfighte', N'155000', N'Incom Corporation, Subpro Corporation')
INSERT [dbo].[TransportsRaw] ([Id], [Edited], [Consumables], [Name], [Created], [CargoCapacity], [Passengers], [MaxAtmospheringSpeed], [Crew], [Length], [Model], [CostInCredits], [Manufacturer]) VALUES (67, N'2014-12-20T21:30:21.752Z', N'none', N'Droid tri-fighter', N'2014-12-20T20:05:19.992Z', N'0', N'0', N'1180', N'1', N'5.4', N'tri-fighter', N'20000', N'Colla Designs, Phlac-Arphocc Automata Industries')
INSERT [dbo].[TransportsRaw] ([Id], [Edited], [Consumables], [Name], [Created], [CargoCapacity], [Passengers], [MaxAtmospheringSpeed], [Crew], [Length], [Model], [CostInCredits], [Manufacturer]) VALUES (68, N'2014-12-20T21:23:49.956Z', N'2 years', N'Banking clan frigte', N'2014-12-20T20:07:11.538Z', N'40000000', N'unknown', N'unknown', N'200', N'825', N'Munificent-class star frigate', N'57000000', N'Hoersch-Kessel Drive, Inc, Gwori Revolutionary Industries')
INSERT [dbo].[TransportsRaw] ([Id], [Edited], [Consumables], [Name], [Created], [CargoCapacity], [Passengers], [MaxAtmospheringSpeed], [Crew], [Length], [Model], [CostInCredits], [Manufacturer]) VALUES (69, N'2014-12-20T21:30:21.756Z', N'3 days', N'Oevvaor jet catamaran', N'2014-12-20T20:20:53.931Z', N'50', N'2', N'420', N'2', N'15.1', N'Oevvaor jet catamaran', N'12125', N'Appazanna Engineering Works')
INSERT [dbo].[TransportsRaw] ([Id], [Edited], [Consumables], [Name], [Created], [CargoCapacity], [Passengers], [MaxAtmospheringSpeed], [Crew], [Length], [Model], [CostInCredits], [Manufacturer]) VALUES (70, N'2014-12-20T21:30:21.759Z', N'none', N'Raddaugh Gnasp fluttercraft', N'2014-12-20T20:21:55.648Z', N'20', N'0', N'310', N'2', N'7', N'Raddaugh Gnasp fluttercraft', N'14750', N'Appazanna Engineering Works')
INSERT [dbo].[TransportsRaw] ([Id], [Edited], [Consumables], [Name], [Created], [CargoCapacity], [Passengers], [MaxAtmospheringSpeed], [Crew], [Length], [Model], [CostInCredits], [Manufacturer]) VALUES (71, N'2014-12-20T21:30:21.762Z', N'20 days', N'Clone turbo tank', N'2014-12-20T20:24:45.587Z', N'30000', N'300', N'160', N'20', N'49.4', N'HAVw A6 Juggernaut', N'350000', N'Kuat Drive Yards')
INSERT [dbo].[TransportsRaw] ([Id], [Edited], [Consumables], [Name], [Created], [CargoCapacity], [Passengers], [MaxAtmospheringSpeed], [Crew], [Length], [Model], [CostInCredits], [Manufacturer]) VALUES (72, N'2014-12-20T21:30:21.765Z', N'none', N'Corporate Alliance tank droid', N'2014-12-20T20:26:55.522Z', N'none', N'4', N'100', N'0', N'10.96', N'NR-N99 Persuader-class droid enforcer', N'49000', N'Techno Union')
INSERT [dbo].[TransportsRaw] ([Id], [Edited], [Consumables], [Name], [Created], [CargoCapacity], [Passengers], [MaxAtmospheringSpeed], [Crew], [Length], [Model], [CostInCredits], [Manufacturer]) VALUES (73, N'2014-12-20T21:30:21.768Z', N'none', N'Droid gunship', N'2014-12-20T20:32:05.687Z', N'0', N'0', N'820', N'0', N'12.3', N'HMP droid gunship', N'60000', N'Baktoid Fleet Ordnance, Haor Chall Engineering')
INSERT [dbo].[TransportsRaw] ([Id], [Edited], [Consumables], [Name], [Created], [CargoCapacity], [Passengers], [MaxAtmospheringSpeed], [Crew], [Length], [Model], [CostInCredits], [Manufacturer]) VALUES (74, N'2014-12-20T21:23:49.959Z', N'7 days', N'Belbullab-22 starfighter', N'2014-12-20T20:38:05.031Z', N'140', N'0', N'1100', N'1', N'6.71', N'Belbullab-22 starfighter', N'168000', N'Feethan Ottraw Scalable Assemblies')
INSERT [dbo].[TransportsRaw] ([Id], [Edited], [Consumables], [Name], [Created], [CargoCapacity], [Passengers], [MaxAtmospheringSpeed], [Crew], [Length], [Model], [CostInCredits], [Manufacturer]) VALUES (75, N'2014-12-20T21:23:49.961Z', N'15 hours', N'V-wing', N'2014-12-20T20:43:04.349Z', N'60', N'0', N'1050', N'1', N'7.9', N'Alpha-3 Nimbus-class V-wing starfighter', N'102500', N'Kuat Systems Engineering')
INSERT [dbo].[TransportsRaw] ([Id], [Edited], [Consumables], [Name], [Created], [CargoCapacity], [Passengers], [MaxAtmospheringSpeed], [Crew], [Length], [Model], [CostInCredits], [Manufacturer]) VALUES (76, N'2014-12-20T21:30:21.772Z', N'1 day', N'AT-RT', N'2014-12-20T20:47:49.189Z', N'20', N'0', N'90', N'1', N'3.2', N'All Terrain Recon Transport', N'40000', N'Kuat Drive Yards')
SET IDENTITY_INSERT [dbo].[TransportsRaw] OFF
SET IDENTITY_INSERT [dbo].[VehiclePilotsRaw] ON 

INSERT [dbo].[VehiclePilotsRaw] ([Id], [VehicleId], [PersonId]) VALUES (1, 14, 1)
INSERT [dbo].[VehiclePilotsRaw] ([Id], [VehicleId], [PersonId]) VALUES (2, 14, 18)
INSERT [dbo].[VehiclePilotsRaw] ([Id], [VehicleId], [PersonId]) VALUES (3, 19, 13)
INSERT [dbo].[VehiclePilotsRaw] ([Id], [VehicleId], [PersonId]) VALUES (4, 30, 1)
INSERT [dbo].[VehiclePilotsRaw] ([Id], [VehicleId], [PersonId]) VALUES (5, 30, 5)
INSERT [dbo].[VehiclePilotsRaw] ([Id], [VehicleId], [PersonId]) VALUES (6, 38, 10)
INSERT [dbo].[VehiclePilotsRaw] ([Id], [VehicleId], [PersonId]) VALUES (7, 38, 32)
INSERT [dbo].[VehiclePilotsRaw] ([Id], [VehicleId], [PersonId]) VALUES (8, 42, 44)
INSERT [dbo].[VehiclePilotsRaw] ([Id], [VehicleId], [PersonId]) VALUES (9, 44, 11)
INSERT [dbo].[VehiclePilotsRaw] ([Id], [VehicleId], [PersonId]) VALUES (10, 45, 70)
INSERT [dbo].[VehiclePilotsRaw] ([Id], [VehicleId], [PersonId]) VALUES (11, 46, 11)
INSERT [dbo].[VehiclePilotsRaw] ([Id], [VehicleId], [PersonId]) VALUES (12, 55, 67)
INSERT [dbo].[VehiclePilotsRaw] ([Id], [VehicleId], [PersonId]) VALUES (13, 60, 79)
SET IDENTITY_INSERT [dbo].[VehiclePilotsRaw] OFF
SET IDENTITY_INSERT [dbo].[VehiclesRaw] ON 

INSERT [dbo].[VehiclesRaw] ([Id], [VehicleClass]) VALUES (4, N'wheeled')
INSERT [dbo].[VehiclesRaw] ([Id], [VehicleClass]) VALUES (6, N'repulsorcraft')
INSERT [dbo].[VehiclesRaw] ([Id], [VehicleClass]) VALUES (7, N'repulsorcraft')
INSERT [dbo].[VehiclesRaw] ([Id], [VehicleClass]) VALUES (8, N'starfighter')
INSERT [dbo].[VehiclesRaw] ([Id], [VehicleClass]) VALUES (14, N'airspeeder')
INSERT [dbo].[VehiclesRaw] ([Id], [VehicleClass]) VALUES (16, N'space/planetary bomber')
INSERT [dbo].[VehiclesRaw] ([Id], [VehicleClass]) VALUES (18, N'assault walker')
INSERT [dbo].[VehiclesRaw] ([Id], [VehicleClass]) VALUES (19, N'walker')
INSERT [dbo].[VehiclesRaw] ([Id], [VehicleClass]) VALUES (20, N'repulsorcraft')
INSERT [dbo].[VehiclesRaw] ([Id], [VehicleClass]) VALUES (24, N'sail barge')
INSERT [dbo].[VehiclesRaw] ([Id], [VehicleClass]) VALUES (25, N'repulsorcraft cargo skiff')
INSERT [dbo].[VehiclesRaw] ([Id], [VehicleClass]) VALUES (26, N'starfighter')
INSERT [dbo].[VehiclesRaw] ([Id], [VehicleClass]) VALUES (30, N'speeder')
INSERT [dbo].[VehiclesRaw] ([Id], [VehicleClass]) VALUES (33, N'starfighter')
INSERT [dbo].[VehiclesRaw] ([Id], [VehicleClass]) VALUES (34, N'repulsorcraft')
INSERT [dbo].[VehiclesRaw] ([Id], [VehicleClass]) VALUES (35, N'repulsorcraft')
INSERT [dbo].[VehiclesRaw] ([Id], [VehicleClass]) VALUES (36, N'repulsorcraft')
INSERT [dbo].[VehiclesRaw] ([Id], [VehicleClass]) VALUES (37, N'landing craft')
INSERT [dbo].[VehiclesRaw] ([Id], [VehicleClass]) VALUES (38, N'submarine')
INSERT [dbo].[VehiclesRaw] ([Id], [VehicleClass]) VALUES (42, N'speeder')
INSERT [dbo].[VehiclesRaw] ([Id], [VehicleClass]) VALUES (44, N'repulsorcraft')
INSERT [dbo].[VehiclesRaw] ([Id], [VehicleClass]) VALUES (45, N'airspeeder')
INSERT [dbo].[VehiclesRaw] ([Id], [VehicleClass]) VALUES (46, N'airspeeder')
INSERT [dbo].[VehiclesRaw] ([Id], [VehicleClass]) VALUES (50, N'gunship')
INSERT [dbo].[VehiclesRaw] ([Id], [VehicleClass]) VALUES (51, N'gunship')
INSERT [dbo].[VehiclesRaw] ([Id], [VehicleClass]) VALUES (53, N'walker')
INSERT [dbo].[VehiclesRaw] ([Id], [VehicleClass]) VALUES (54, N'walker')
INSERT [dbo].[VehiclesRaw] ([Id], [VehicleClass]) VALUES (55, N'speeder')
INSERT [dbo].[VehiclesRaw] ([Id], [VehicleClass]) VALUES (56, N'transport')
INSERT [dbo].[VehiclesRaw] ([Id], [VehicleClass]) VALUES (57, N'starfighter')
INSERT [dbo].[VehiclesRaw] ([Id], [VehicleClass]) VALUES (60, N'wheeled walker')
INSERT [dbo].[VehiclesRaw] ([Id], [VehicleClass]) VALUES (62, N'fire suppression ship')
INSERT [dbo].[VehiclesRaw] ([Id], [VehicleClass]) VALUES (67, N'droid starfighter')
INSERT [dbo].[VehiclesRaw] ([Id], [VehicleClass]) VALUES (69, N'airspeeder')
INSERT [dbo].[VehiclesRaw] ([Id], [VehicleClass]) VALUES (70, N'air speeder')
INSERT [dbo].[VehiclesRaw] ([Id], [VehicleClass]) VALUES (71, N'wheeled walker')
INSERT [dbo].[VehiclesRaw] ([Id], [VehicleClass]) VALUES (72, N'droid tank')
INSERT [dbo].[VehiclesRaw] ([Id], [VehicleClass]) VALUES (73, N'airspeeder')
INSERT [dbo].[VehiclesRaw] ([Id], [VehicleClass]) VALUES (76, N'walker')
SET IDENTITY_INSERT [dbo].[VehiclesRaw] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [PeopleByGenderAndBirthYearDesc]    Script Date: 3/12/2020 11:25:41 AM ******/
CREATE NONCLUSTERED INDEX [PeopleByGenderAndBirthYearDesc] ON [dbo].[PeopleRaw]
(
	[Gender] ASC,
	[BirthYearParsed] DESC
)
WHERE ([BirthYearParsed] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [StarWars] SET  READ_WRITE 
GO
