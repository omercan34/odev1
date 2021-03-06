USE [master]
GO
/****** Object:  Database [sinema]    Script Date: 24.01.2021 19:16:42 ******/
CREATE DATABASE [sinema]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'sinema', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\sinema.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'sinema_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\sinema_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [sinema] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [sinema].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [sinema] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [sinema] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [sinema] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [sinema] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [sinema] SET ARITHABORT OFF 
GO
ALTER DATABASE [sinema] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [sinema] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [sinema] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [sinema] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [sinema] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [sinema] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [sinema] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [sinema] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [sinema] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [sinema] SET  DISABLE_BROKER 
GO
ALTER DATABASE [sinema] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [sinema] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [sinema] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [sinema] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [sinema] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [sinema] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [sinema] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [sinema] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [sinema] SET  MULTI_USER 
GO
ALTER DATABASE [sinema] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [sinema] SET DB_CHAINING OFF 
GO
ALTER DATABASE [sinema] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [sinema] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [sinema] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [sinema] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [sinema] SET QUERY_STORE = OFF
GO
USE [sinema]
GO
/****** Object:  Table [dbo].[film_oyunculari]    Script Date: 24.01.2021 19:16:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[film_oyunculari](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[filmId] [int] NULL,
	[oyuncuId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[film_turleri]    Script Date: 24.01.2021 19:16:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[film_turleri](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[filmId] [int] NULL,
	[turId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Filmler]    Script Date: 24.01.2021 19:16:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Filmler](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Adi] [varchar](100) NULL,
	[YapimYili] [int] NULL,
	[Gisesi] [int] NULL,
	[YonetmenId] [int] NULL,
 CONSTRAINT [PK_Filmler] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Karakterler]    Script Date: 24.01.2021 19:16:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Karakterler](
	[Id] [int] NOT NULL,
	[AdiSoyad] [varchar](100) NULL,
 CONSTRAINT [PK_Karakterler] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Oyuncular]    Script Date: 24.01.2021 19:16:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Oyuncular](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Adi] [varchar](100) NULL,
	[Soyadi] [varchar](100) NULL,
	[DogumTarihi] [datetime] NULL,
	[KarakterId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Turler]    Script Date: 24.01.2021 19:16:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Turler](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Adi] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Yonetmenler]    Script Date: 24.01.2021 19:16:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Yonetmenler](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Adi] [varchar](100) NULL,
	[Soyadi] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[film_oyunculari] ON 

INSERT [dbo].[film_oyunculari] ([Id], [filmId], [oyuncuId]) VALUES (1, 3, 1)
INSERT [dbo].[film_oyunculari] ([Id], [filmId], [oyuncuId]) VALUES (5, 5, 3)
INSERT [dbo].[film_oyunculari] ([Id], [filmId], [oyuncuId]) VALUES (6, 6, 4)
INSERT [dbo].[film_oyunculari] ([Id], [filmId], [oyuncuId]) VALUES (7, 7, 5)
SET IDENTITY_INSERT [dbo].[film_oyunculari] OFF
GO
SET IDENTITY_INSERT [dbo].[film_turleri] ON 

INSERT [dbo].[film_turleri] ([Id], [filmId], [turId]) VALUES (1, 3, 1)
INSERT [dbo].[film_turleri] ([Id], [filmId], [turId]) VALUES (2, 5, 2)
INSERT [dbo].[film_turleri] ([Id], [filmId], [turId]) VALUES (3, 6, 3)
INSERT [dbo].[film_turleri] ([Id], [filmId], [turId]) VALUES (4, 7, 4)
SET IDENTITY_INSERT [dbo].[film_turleri] OFF
GO
SET IDENTITY_INSERT [dbo].[Filmler] ON 

INSERT [dbo].[Filmler] ([Id], [Adi], [YapimYili], [Gisesi], [YonetmenId]) VALUES (3, N'pek yakında', 2018, 1000000, 1)
INSERT [dbo].[Filmler] ([Id], [Adi], [YapimYili], [Gisesi], [YonetmenId]) VALUES (5, N'organizeişler', 2020, 1500000, 2)
INSERT [dbo].[Filmler] ([Id], [Adi], [YapimYili], [Gisesi], [YonetmenId]) VALUES (6, N'olumlu dunya', 2019, 750000, 3)
INSERT [dbo].[Filmler] ([Id], [Adi], [YapimYili], [Gisesi], [YonetmenId]) VALUES (7, N'babam ve oğlum', 2005, 2000000, 4)
SET IDENTITY_INSERT [dbo].[Filmler] OFF
GO
INSERT [dbo].[Karakterler] ([Id], [AdiSoyad]) VALUES (1, N'nare çelebi')
INSERT [dbo].[Karakterler] ([Id], [AdiSoyad]) VALUES (2, N'yamaç koçovalı')
INSERT [dbo].[Karakterler] ([Id], [AdiSoyad]) VALUES (3, N'nazlı noyan')
INSERT [dbo].[Karakterler] ([Id], [AdiSoyad]) VALUES (4, N'eda yılzız')
GO
SET IDENTITY_INSERT [dbo].[Oyuncular] ON 

INSERT [dbo].[Oyuncular] ([Id], [Adi], [Soyadi], [DogumTarihi], [KarakterId]) VALUES (1, N'neslihan', N'atagul', CAST(N'1993-03-03T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Oyuncular] ([Id], [Adi], [Soyadi], [DogumTarihi], [KarakterId]) VALUES (3, N'aras', N'bulut', CAST(N'1993-04-04T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Oyuncular] ([Id], [Adi], [Soyadi], [DogumTarihi], [KarakterId]) VALUES (4, N'bensu', N'soral', CAST(N'1993-06-06T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Oyuncular] ([Id], [Adi], [Soyadi], [DogumTarihi], [KarakterId]) VALUES (5, N'hande ', N'erçel', CAST(N'1997-07-07T00:00:00.000' AS DateTime), 4)
SET IDENTITY_INSERT [dbo].[Oyuncular] OFF
GO
SET IDENTITY_INSERT [dbo].[Turler] ON 

INSERT [dbo].[Turler] ([Id], [Adi]) VALUES (1, N'komedi')
INSERT [dbo].[Turler] ([Id], [Adi]) VALUES (2, N'korku')
INSERT [dbo].[Turler] ([Id], [Adi]) VALUES (3, N'dram')
INSERT [dbo].[Turler] ([Id], [Adi]) VALUES (4, N'aksiyon')
SET IDENTITY_INSERT [dbo].[Turler] OFF
GO
SET IDENTITY_INSERT [dbo].[Yonetmenler] ON 

INSERT [dbo].[Yonetmenler] ([Id], [Adi], [Soyadi]) VALUES (1, N'cem ', N'yılmaz')
INSERT [dbo].[Yonetmenler] ([Id], [Adi], [Soyadi]) VALUES (2, N'yılmaz', N'erdoğan')
INSERT [dbo].[Yonetmenler] ([Id], [Adi], [Soyadi]) VALUES (3, N'murat', N'cemcir')
INSERT [dbo].[Yonetmenler] ([Id], [Adi], [Soyadi]) VALUES (4, N'ahmet ', N'kural')
SET IDENTITY_INSERT [dbo].[Yonetmenler] OFF
GO
ALTER TABLE [dbo].[film_oyunculari]  WITH CHECK ADD  CONSTRAINT [FK_film_oyunculari_Filmler] FOREIGN KEY([filmId])
REFERENCES [dbo].[Filmler] ([Id])
GO
ALTER TABLE [dbo].[film_oyunculari] CHECK CONSTRAINT [FK_film_oyunculari_Filmler]
GO
ALTER TABLE [dbo].[film_oyunculari]  WITH CHECK ADD  CONSTRAINT [FK_film_oyunculari_Oyuncular] FOREIGN KEY([oyuncuId])
REFERENCES [dbo].[Oyuncular] ([Id])
GO
ALTER TABLE [dbo].[film_oyunculari] CHECK CONSTRAINT [FK_film_oyunculari_Oyuncular]
GO
ALTER TABLE [dbo].[film_turleri]  WITH CHECK ADD  CONSTRAINT [FK_film_turleri_Filmler] FOREIGN KEY([filmId])
REFERENCES [dbo].[Filmler] ([Id])
GO
ALTER TABLE [dbo].[film_turleri] CHECK CONSTRAINT [FK_film_turleri_Filmler]
GO
ALTER TABLE [dbo].[film_turleri]  WITH CHECK ADD  CONSTRAINT [FK_film_turleri_Turler] FOREIGN KEY([turId])
REFERENCES [dbo].[Turler] ([Id])
GO
ALTER TABLE [dbo].[film_turleri] CHECK CONSTRAINT [FK_film_turleri_Turler]
GO
ALTER TABLE [dbo].[Filmler]  WITH CHECK ADD  CONSTRAINT [FK_Filmler_Yonetmenler1] FOREIGN KEY([YonetmenId])
REFERENCES [dbo].[Yonetmenler] ([Id])
GO
ALTER TABLE [dbo].[Filmler] CHECK CONSTRAINT [FK_Filmler_Yonetmenler1]
GO
ALTER TABLE [dbo].[Oyuncular]  WITH CHECK ADD  CONSTRAINT [FK_Oyuncular_Karakterler] FOREIGN KEY([KarakterId])
REFERENCES [dbo].[Karakterler] ([Id])
GO
ALTER TABLE [dbo].[Oyuncular] CHECK CONSTRAINT [FK_Oyuncular_Karakterler]
GO
USE [master]
GO
ALTER DATABASE [sinema] SET  READ_WRITE 
GO
