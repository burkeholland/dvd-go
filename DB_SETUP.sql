USE [master]
GO

/****** Object:  Database [DVDGo]    Script Date: 10/21/2016 4:29:12 PM ******/
CREATE DATABASE [DVDGo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DVDGo', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\DVDGo.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DVDGo_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\DVDGo_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO

ALTER DATABASE [DVDGo] SET COMPATIBILITY_LEVEL = 130
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DVDGo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [DVDGo] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [DVDGo] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [DVDGo] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [DVDGo] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [DVDGo] SET ARITHABORT OFF 
GO

ALTER DATABASE [DVDGo] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [DVDGo] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [DVDGo] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [DVDGo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [DVDGo] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [DVDGo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [DVDGo] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [DVDGo] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [DVDGo] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [DVDGo] SET  DISABLE_BROKER 
GO

ALTER DATABASE [DVDGo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [DVDGo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [DVDGo] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [DVDGo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [DVDGo] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [DVDGo] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [DVDGo] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [DVDGo] SET RECOVERY SIMPLE 
GO

ALTER DATABASE [DVDGo] SET  MULTI_USER 
GO

ALTER DATABASE [DVDGo] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [DVDGo] SET DB_CHAINING OFF 
GO

ALTER DATABASE [DVDGo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [DVDGo] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [DVDGo] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [DVDGo] SET QUERY_STORE = OFF
GO

USE [DVDGo]
GO

ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO

ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO

ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO

ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO

ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO

ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO

ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO

ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO

ALTER DATABASE [DVDGo] SET  READ_WRITE 
GO

USE [DVDGo]
GO

/****** Object:  Table [dbo].[Video]    Script Date: 10/21/2016 4:31:00 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Video](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[GenreId] [int] NOT NULL,
	[RatingId] [int] NOT NULL,
	[DVD] [bit] NOT NULL,
	[BlueRay] [bit] NOT NULL,
	[Rating] [int] NULL
) ON [PRIMARY]

GO

USE [DVDGo]
GO

/****** Object:  Table [dbo].[Rating]    Script Date: 10/21/2016 4:31:14 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Rating](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL
) ON [PRIMARY]

GO

USE [DVDGo]
GO

/****** Object:  Table [dbo].[Genre]    Script Date: 10/21/2016 4:31:26 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Genre](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL
) ON [PRIMARY]

GO


USE [DVDGo]
GO

/****** Object:  User [DVDGoUser]    Script Date: 10/21/2016 4:32:48 PM ******/
CREATE USER [DVDGoUser] FOR LOGIN [DVDGoUser] WITH DEFAULT_SCHEMA=[db_owner]
GO

/* Create Rating Data */

INSERT INTO Rating (Name) VALUES ('G')
INSERT INTO Rating (Name) VALUES ('PG')
INSERT INTO Rating (Name) VALUES ('PG-13')
INSERT INTO Rating (Name) VALUES ('R')
INSERT INTO Rating (Name) VALUES ('E')
INSERT INTO Rating (Name) VALUES ('T')
INSERT INTO Rating (Name) VALUES ('TV-14')
INSERT INTO Rating (Name) VALUES ('TV-MA')

/* Create Genre Data */

INSERT INTO Genre (Name) VALUES ('Action & Adventure')
INSERT INTO Genre (Name) VALUES ('Anime')
INSERT INTO Genre (Name) VALUES ('Children & Family')
INSERT INTO Genre (Name) VALUES ('Classic')
INSERT INTO Genre (Name) VALUES ('Comedy')
INSERT INTO Genre (Name) VALUES ('Documentary')
INSERT INTO Genre (Name) VALUES ('Drama')
INSERT INTO Genre (Name) VALUES ('Faith & Spirituality')
INSERT INTO Genre (Name) VALUES ('Horror')
INSERT INTO Genre (Name) VALUES ('Independent')
INSERT INTO Genre (Name) VALUES ('International')
INSERT INTO Genre (Name) VALUES ('Romantic')
INSERT INTO Genre (Name) VALUES ('Sci-Fi & Fantasy')
INSERT INTO Genre (Name) VALUES ('Sports & Fitness')
INSERT INTO Genre (Name) VALUES ('Thriller')
INSERT INTO Genre (Name) VALUES ('Other')

/* Create Video Data */
INSERT INTO Video (Name, GenreId, RatingId, DVD, BlueRay) VALUES ('Nacho Libre',5,3,1,0)
INSERT INTO Video (Name, GenreId, RatingId, DVD, BlueRay) VALUES ('Napoleon Dynamite',5,3,1,0)
INSERT INTO Video (Name, GenreId, RatingId, DVD, BlueRay) VALUES ('Cloudy With A Chance Of Meatballs',3,2,1,1)
INSERT INTO Video (Name, GenreId, RatingId, DVD, BlueRay) VALUES ('The Dark Knight',1,3,0,1)
INSERT INTO Video (Name, GenreId, RatingId, DVD, BlueRay) VALUES ('Frozen',3,1,0,1)
INSERT INTO Video (Name, GenreId, RatingId, DVD, BlueRay) VALUES ('Enders Game',16,3,1,1)
INSERT INTO Video (Name, GenreId, RatingId, DVD, BlueRay) VALUES ('The Goonies',1,2,0,1)
INSERT INTO Video (Name, GenreId, RatingId, DVD, BlueRay) VALUES ('Hellboy',1,3,0,1)
INSERT INTO Video (Name, GenreId, RatingId, DVD, BlueRay) VALUES ('Kung Fu Panda',3,1,1,1)
INSERT INTO Video (Name, GenreId, RatingId, DVD, BlueRay) VALUES ('LOTR - The Two Towers',16,3,0,1)
INSERT INTO Video (Name, GenreId, RatingId, DVD, BlueRay) VALUES ('LOTR - The Fellowship Of The Ring',1,3,0,1)
INSERT INTO Video (Name, GenreId, RatingId, DVD, BlueRay) VALUES ('Narnia - The Lion, The Witch And The Wardrobe',16,2,0,1)
INSERT INTO Video (Name, GenreId, RatingId, DVD, BlueRay) VALUES ('The Sandlot',8,2,0,1)
INSERT INTO Video (Name, GenreId, RatingId, DVD, BlueRay) VALUES ('About A Boy',8,3,1,0)
INSERT INTO Video (Name, GenreId, RatingId, DVD, BlueRay) VALUES ('Anchorman',5,4,1,0)
INSERT INTO Video (Name, GenreId, RatingId, DVD, BlueRay) VALUES ('Apollo 13',8,2,1,0)
INSERT INTO Video (Name, GenreId, RatingId, DVD, BlueRay) VALUES ('Field Of Dreams',8,2,1,0)
INSERT INTO Video (Name, GenreId, RatingId, DVD, BlueRay) VALUES ('Seabiscuit',8,3,1,0)
INSERT INTO Video (Name, GenreId, RatingId, DVD, BlueRay) VALUES ('BoxTrolls',3,1,1,0)
INSERT INTO Video (Name, GenreId, RatingId, DVD, BlueRay) VALUES ('Brave',3,1,0,1)
INSERT INTO Video (Name, GenreId, RatingId, DVD, BlueRay) VALUES ('Batman',1,3,1,0)
INSERT INTO Video (Name, GenreId, RatingId, DVD, BlueRay) VALUES ('Batman Returns',1,3,1,0)
INSERT INTO Video (Name, GenreId, RatingId, DVD, BlueRay) VALUES ('Batman Forever',1,3,1,0)
INSERT INTO Video (Name, GenreId, RatingId, DVD, BlueRay) VALUES ('Batman & Robin',1,3,1,0)
INSERT INTO Video (Name, GenreId, RatingId, DVD, BlueRay) VALUES ('Best In Show',5,3,1,0)
INSERT INTO Video (Name, GenreId, RatingId, DVD, BlueRay) VALUES ('Bee Movie',3,2,1,0)
INSERT INTO Video (Name, GenreId, RatingId, DVD, BlueRay) VALUES ('Christmas Vacation',5,3,1,0)
INSERT INTO Video (Name, GenreId, RatingId, DVD, BlueRay) VALUES ('A Charlie Brown Christmas',3,1,1,0)
INSERT INTO Video (Name, GenreId, RatingId, DVD, BlueRay) VALUES ('The Count Of Monte Cristo',8,3,1,0)
INSERT INTO Video (Name, GenreId, RatingId, DVD, BlueRay) VALUES ('A Christmas Story',5,3,1,0)
INSERT INTO Video (Name, GenreId, RatingId, DVD, BlueRay) VALUES ('Constantine',1,4,1,0)
INSERT INTO Video (Name, GenreId, RatingId, DVD, BlueRay) VALUES ('Dispicable Me',3,2,1,0)
INSERT INTO Video (Name, GenreId, RatingId, DVD, BlueRay) VALUES ('Dispicable Me 2',3,2,1,0)
INSERT INTO Video (Name, GenreId, RatingId, DVD, BlueRay) VALUES ('Diary Of A Wimpy Kid',5,2,1,0)
INSERT INTO Video (Name, GenreId, RatingId, DVD, BlueRay) VALUES ('Diary Of A Wimpy Kid - Dog Days',5,2,1,0)
INSERT INTO Video (Name, GenreId, RatingId, DVD, BlueRay) VALUES ('The Dark Knight Rises',1,3,1,0)
INSERT INTO Video (Name, GenreId, RatingId, DVD, BlueRay) VALUES ('Enemy At The Gates',8,4,1,0)
INSERT INTO Video (Name, GenreId, RatingId, DVD, BlueRay) VALUES ('Elf',5,3,1,0)
INSERT INTO Video (Name, GenreId, RatingId, DVD, BlueRay) VALUES ('Ernest - Triple Feature',3,2,1,0)
INSERT INTO Video (Name, GenreId, RatingId, DVD, BlueRay) VALUES ('Ernest Goes To Camp',3,2,1,0)
INSERT INTO Video (Name, GenreId, RatingId, DVD, BlueRay) VALUES ('Ernest Scared Stupid',3,2,1,0)
INSERT INTO Video (Name, GenreId, RatingId, DVD, BlueRay) VALUES ('Ernest Goes To Jail',3,2,1,0)
INSERT INTO Video (Name, GenreId, RatingId, DVD, BlueRay) VALUES ('The Fox And The Hound',3,1,1,0)
INSERT INTO Video (Name, GenreId, RatingId, DVD, BlueRay) VALUES ('The Fox And The Hound 2',3,1,1,0)
INSERT INTO Video (Name, GenreId, RatingId, DVD, BlueRay) VALUES ('Flight Of The Navigator',1,2,1,0)
INSERT INTO Video (Name, GenreId, RatingId, DVD, BlueRay) VALUES ('Fight Club',18,4,1,0)
INSERT INTO Video (Name, GenreId, RatingId, DVD, BlueRay) VALUES ('Flight Of The Conchords - Season 1',5,8,1,0)
INSERT INTO Video (Name, GenreId, RatingId, DVD, BlueRay) VALUES ('Gettysburg',8,2,1,0)
INSERT INTO Video (Name, GenreId, RatingId, DVD, BlueRay) VALUES ('Gremlins',10,2,1,0)
INSERT INTO Video (Name, GenreId, RatingId, DVD, BlueRay) VALUES ('Gentleman Broncos',5,3,1,0)
INSERT INTO Video (Name, GenreId, RatingId, DVD, BlueRay) VALUES ('Guardians Of The Galaxy',1,3,1,0)
INSERT INTO Video (Name, GenreId, RatingId, DVD, BlueRay) VALUES ('The Golden Compass',1,3,1,0)
INSERT INTO Video (Name, GenreId, RatingId, DVD, BlueRay) VALUES ('Harry Potter And The Scorcers Stone',16,2,1,0)
INSERT INTO Video (Name, GenreId, RatingId, DVD, BlueRay) VALUES ('Harry Potter And The Chamber Of Secrets',16,2,1,0)
INSERT INTO Video (Name, GenreId, RatingId, DVD, BlueRay) VALUES ('Harry Potter And The Prisoner Of Azkaban',16,2,1,0)
INSERT INTO Video (Name, GenreId, RatingId, DVD, BlueRay) VALUES ('Harry Potter And The Goblet Of Fire',16,3,1,0)
INSERT INTO Video (Name, GenreId, RatingId, DVD, BlueRay) VALUES ('Harry Potter And The Order Of The Phoenix',16,3,1,0)
INSERT INTO Video (Name, GenreId, RatingId, DVD, BlueRay) VALUES ('How To Train Your Dragon',3,2,1,0)
INSERT INTO Video (Name, GenreId, RatingId, DVD, BlueRay) VALUES ('Ironman',1,3,1,0)
INSERT INTO Video (Name, GenreId, RatingId, DVD, BlueRay) VALUES ('Inglorious Bastards',1,4,1,0)
INSERT INTO Video (Name, GenreId, RatingId, DVD, BlueRay) VALUES ('The Illusionist',8,3,1,0)
INSERT INTO Video (Name, GenreId, RatingId, DVD, BlueRay) VALUES ('I Want A Dog For Chistmas, Charlie Brown',3,1,1,0)
INSERT INTO Video (Name, GenreId, RatingId, DVD, BlueRay) VALUES ('Indiana Jones And The Kingdom Of The Crystal Skull',1,3,1,0)
INSERT INTO Video (Name, GenreId, RatingId, DVD, BlueRay) VALUES ('Journey To The Center Of The Earth',1,2,1,0)
INSERT INTO Video (Name, GenreId, RatingId, DVD, BlueRay) VALUES ('The Outlaw Josey Wales - Pale Rider',4,2,1,0)
INSERT INTO Video (Name, GenreId, RatingId, DVD, BlueRay) VALUES ('Jurassic Park',1,3,1,0)
INSERT INTO Video (Name, GenreId, RatingId, DVD, BlueRay) VALUES ('King Kong',1,3,1,0)
INSERT INTO Video (Name, GenreId, RatingId, DVD, BlueRay) VALUES ('The Lion King',3,1,1,0)
INSERT INTO Video (Name, GenreId, RatingId, DVD, BlueRay) VALUES ('Labyrinth',16,2,1,0)
INSERT INTO Video (Name, GenreId, RatingId, DVD, BlueRay) VALUES ('Jurassic Park - The Lost World',1,3,1,0)
INSERT INTO Video (Name, GenreId, RatingId, DVD, BlueRay) VALUES ('Lego Movie',3,2,1,0)
INSERT INTO Video (Name, GenreId, RatingId, DVD, BlueRay) VALUES ('Little Rascals',3,2,1,0)
INSERT INTO Video (Name, GenreId, RatingId, DVD, BlueRay) VALUES ('Little Women',8,2,1,0)
