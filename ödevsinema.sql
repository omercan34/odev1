USE [sinema]
GO
/****** Object:  Table [dbo].[film_oyunculari]    Script Date: 22.01.2021 13:49:07 ******/
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
/****** Object:  Table [dbo].[film_turleri]    Script Date: 22.01.2021 13:49:07 ******/
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
/****** Object:  Table [dbo].[Filmler]    Script Date: 22.01.2021 13:49:07 ******/
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
/****** Object:  Table [dbo].[Karakterler]    Script Date: 22.01.2021 13:49:07 ******/
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
/****** Object:  Table [dbo].[Oyuncular]    Script Date: 22.01.2021 13:49:07 ******/
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
/****** Object:  Table [dbo].[Turler]    Script Date: 22.01.2021 13:49:07 ******/
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
/****** Object:  Table [dbo].[Yonetmenler]    Script Date: 22.01.2021 13:49:07 ******/
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
ALTER TABLE [dbo].[Oyuncular]  WITH CHECK ADD  CONSTRAINT [FK_Oyuncular_Karakterler] FOREIGN KEY([KarakterId])
REFERENCES [dbo].[Karakterler] ([Id])
GO
ALTER TABLE [dbo].[Oyuncular] CHECK CONSTRAINT [FK_Oyuncular_Karakterler]
GO
