/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.4001)
    Source Database Engine Edition : Microsoft SQL Server Enterprise Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
USE [master]
GO
/****** Object:  Database [Sinema]    Script Date: 15.02.2020 17:12:31 ******/
CREATE DATABASE [Sinema]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Sinema', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\Sinema.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Sinema_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\Sinema_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Sinema] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Sinema].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Sinema] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Sinema] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Sinema] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Sinema] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Sinema] SET ARITHABORT OFF 
GO
ALTER DATABASE [Sinema] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Sinema] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Sinema] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Sinema] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Sinema] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Sinema] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Sinema] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Sinema] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Sinema] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Sinema] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Sinema] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Sinema] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Sinema] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Sinema] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Sinema] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Sinema] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Sinema] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Sinema] SET RECOVERY FULL 
GO
ALTER DATABASE [Sinema] SET  MULTI_USER 
GO
ALTER DATABASE [Sinema] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Sinema] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Sinema] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Sinema] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Sinema] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Sinema', N'ON'
GO
ALTER DATABASE [Sinema] SET QUERY_STORE = OFF
GO
USE [Sinema]
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
USE [Sinema]
GO
/****** Object:  Table [dbo].[Bilet]    Script Date: 15.02.2020 17:12:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bilet](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FilmID] [int] NOT NULL,
	[SalonID] [int] NOT NULL,
	[SeansID] [int] NOT NULL,
	[CalisanID] [int] NOT NULL,
	[MusteriID] [int] NOT NULL,
	[Tarih] [datetime] NULL,
	[KoltukNo] [nchar](5) NOT NULL,
	[Fiyat] [money] NOT NULL,
 CONSTRAINT [PK_Bilet] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Calisan]    Script Date: 15.02.2020 17:12:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Calisan](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Adi] [nvarchar](50) NULL,
	[Soyadi] [nvarchar](50) NULL,
	[TCKN] [char](11) NULL,
	[KullaniciAdi] [nvarchar](50) NULL,
	[Parola] [nvarchar](50) NULL,
	[DogumTarihi] [datetime] NULL,
 CONSTRAINT [PK_Calisan] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Film]    Script Date: 15.02.2020 17:12:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Film](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Adi] [nvarchar](100) NOT NULL,
	[UcBoyutluMu] [bit] NULL,
	[Sure] [int] NULL,
	[YerliMi] [bit] NULL,
	[TurID] [int] NOT NULL,
 CONSTRAINT [PK_Film] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FilmTur]    Script Date: 15.02.2020 17:12:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FilmTur](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Adi] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_FilmTur] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Musteri]    Script Date: 15.02.2020 17:12:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Musteri](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Adi] [nvarchar](50) NULL,
	[Soyadi] [nvarchar](50) NULL,
 CONSTRAINT [PK_Musteri] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Salon]    Script Date: 15.02.2020 17:12:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Salon](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Adi] [nvarchar](50) NOT NULL,
	[Kapasitesi] [int] NULL,
 CONSTRAINT [PK_Salon] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Seans]    Script Date: 15.02.2020 17:12:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Seans](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Saat] [time](7) NULL,
 CONSTRAINT [PK_Seans] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Bilet] ON 

INSERT [dbo].[Bilet] ([ID], [FilmID], [SalonID], [SeansID], [CalisanID], [MusteriID], [Tarih], [KoltukNo], [Fiyat]) VALUES (1, 2, 1, 3, 1, 4, CAST(N'2017-02-11T16:40:42.910' AS DateTime), N'A4   ', 20.0000)
INSERT [dbo].[Bilet] ([ID], [FilmID], [SalonID], [SeansID], [CalisanID], [MusteriID], [Tarih], [KoltukNo], [Fiyat]) VALUES (2, 2, 4, 1, 2, 5, CAST(N'2017-02-11T16:41:29.680' AS DateTime), N'S4   ', 25.0000)
INSERT [dbo].[Bilet] ([ID], [FilmID], [SalonID], [SeansID], [CalisanID], [MusteriID], [Tarih], [KoltukNo], [Fiyat]) VALUES (3, 4, 2, 3, 1, 5, CAST(N'2017-01-11T00:00:00.000' AS DateTime), N'G2   ', 25.0000)
INSERT [dbo].[Bilet] ([ID], [FilmID], [SalonID], [SeansID], [CalisanID], [MusteriID], [Tarih], [KoltukNo], [Fiyat]) VALUES (4, 4, 1, 4, 1, 2, CAST(N'2017-02-11T16:42:48.733' AS DateTime), N'J2   ', 20.0000)
INSERT [dbo].[Bilet] ([ID], [FilmID], [SalonID], [SeansID], [CalisanID], [MusteriID], [Tarih], [KoltukNo], [Fiyat]) VALUES (5, 1, 1, 3, 2, 1, CAST(N'2017-02-11T16:43:33.827' AS DateTime), N'H4   ', 30.0000)
INSERT [dbo].[Bilet] ([ID], [FilmID], [SalonID], [SeansID], [CalisanID], [MusteriID], [Tarih], [KoltukNo], [Fiyat]) VALUES (6, 1, 3, 5, 1, 7, CAST(N'2017-01-01T00:00:00.000' AS DateTime), N'K2   ', 35.0000)
INSERT [dbo].[Bilet] ([ID], [FilmID], [SalonID], [SeansID], [CalisanID], [MusteriID], [Tarih], [KoltukNo], [Fiyat]) VALUES (7, 3, 2, 4, 2, 9, CAST(N'2017-02-11T16:44:43.820' AS DateTime), N'L4   ', 40.0000)
SET IDENTITY_INSERT [dbo].[Bilet] OFF
SET IDENTITY_INSERT [dbo].[Calisan] ON 

INSERT [dbo].[Calisan] ([ID], [Adi], [Soyadi], [TCKN], [KullaniciAdi], [Parola], [DogumTarihi]) VALUES (1, N'Ezgi', N'Peker', N'12345      ', N'Ezgip', N'ezgi123', CAST(N'1988-10-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Calisan] ([ID], [Adi], [Soyadi], [TCKN], [KullaniciAdi], [Parola], [DogumTarihi]) VALUES (2, N'Turan', N'Ünlüer', N'67890      ', N'Turanu', N'turan123', CAST(N'1987-11-17T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Calisan] OFF
SET IDENTITY_INSERT [dbo].[Film] ON 

INSERT [dbo].[Film] ([ID], [Adi], [UcBoyutluMu], [Sure], [YerliMi], [TurID]) VALUES (1, N'John Wick', 0, 98, 0, 3)
INSERT [dbo].[Film] ([ID], [Adi], [UcBoyutluMu], [Sure], [YerliMi], [TurID]) VALUES (2, N'Halka 3', 1, 150, 0, 1)
INSERT [dbo].[Film] ([ID], [Adi], [UcBoyutluMu], [Sure], [YerliMi], [TurID]) VALUES (3, N'Recep İvedik 5', 0, 120, 1, 4)
INSERT [dbo].[Film] ([ID], [Adi], [UcBoyutluMu], [Sure], [YerliMi], [TurID]) VALUES (4, N'Troller', 0, 95, 0, 6)
SET IDENTITY_INSERT [dbo].[Film] OFF
SET IDENTITY_INSERT [dbo].[FilmTur] ON 

INSERT [dbo].[FilmTur] ([ID], [Adi]) VALUES (1, N'Korku')
INSERT [dbo].[FilmTur] ([ID], [Adi]) VALUES (2, N'Macera')
INSERT [dbo].[FilmTur] ([ID], [Adi]) VALUES (3, N'Aksiyon')
INSERT [dbo].[FilmTur] ([ID], [Adi]) VALUES (4, N'Komedi')
INSERT [dbo].[FilmTur] ([ID], [Adi]) VALUES (5, N'Bilim Kurgu')
INSERT [dbo].[FilmTur] ([ID], [Adi]) VALUES (6, N'Animasyon')
SET IDENTITY_INSERT [dbo].[FilmTur] OFF
SET IDENTITY_INSERT [dbo].[Musteri] ON 

INSERT [dbo].[Musteri] ([ID], [Adi], [Soyadi]) VALUES (1, N'Süleyman', N'Bayoba')
INSERT [dbo].[Musteri] ([ID], [Adi], [Soyadi]) VALUES (2, N'İnan', N'Görür')
INSERT [dbo].[Musteri] ([ID], [Adi], [Soyadi]) VALUES (3, N'Hakan', N'Hıfzıoğlu')
INSERT [dbo].[Musteri] ([ID], [Adi], [Soyadi]) VALUES (4, N'Abdullah', N'Şahin')
INSERT [dbo].[Musteri] ([ID], [Adi], [Soyadi]) VALUES (5, N'Melda', N'Dinçer')
INSERT [dbo].[Musteri] ([ID], [Adi], [Soyadi]) VALUES (6, N'Ali Kemal', N'Özaslan')
INSERT [dbo].[Musteri] ([ID], [Adi], [Soyadi]) VALUES (7, N'Emre', N'Güzel')
INSERT [dbo].[Musteri] ([ID], [Adi], [Soyadi]) VALUES (8, N'Furkan', N'Uçkaç')
INSERT [dbo].[Musteri] ([ID], [Adi], [Soyadi]) VALUES (9, N'Sümeyra', N'Can')
INSERT [dbo].[Musteri] ([ID], [Adi], [Soyadi]) VALUES (10, N'Zafer', N'Cihangir')
SET IDENTITY_INSERT [dbo].[Musteri] OFF
SET IDENTITY_INSERT [dbo].[Salon] ON 

INSERT [dbo].[Salon] ([ID], [Adi], [Kapasitesi]) VALUES (1, N'1', 150)
INSERT [dbo].[Salon] ([ID], [Adi], [Kapasitesi]) VALUES (2, N'2', 90)
INSERT [dbo].[Salon] ([ID], [Adi], [Kapasitesi]) VALUES (3, N'3', 400)
INSERT [dbo].[Salon] ([ID], [Adi], [Kapasitesi]) VALUES (4, N'4', 125)
SET IDENTITY_INSERT [dbo].[Salon] OFF
SET IDENTITY_INSERT [dbo].[Seans] ON 

INSERT [dbo].[Seans] ([ID], [Saat]) VALUES (1, CAST(N'09:30:00' AS Time))
INSERT [dbo].[Seans] ([ID], [Saat]) VALUES (2, CAST(N'11:00:00' AS Time))
INSERT [dbo].[Seans] ([ID], [Saat]) VALUES (3, CAST(N'14:30:00' AS Time))
INSERT [dbo].[Seans] ([ID], [Saat]) VALUES (4, CAST(N'16:00:00' AS Time))
INSERT [dbo].[Seans] ([ID], [Saat]) VALUES (5, CAST(N'18:45:00' AS Time))
INSERT [dbo].[Seans] ([ID], [Saat]) VALUES (6, CAST(N'21:00:00' AS Time))
SET IDENTITY_INSERT [dbo].[Seans] OFF
ALTER TABLE [dbo].[Bilet] ADD  CONSTRAINT [DF_Bilet_Tarih]  DEFAULT (getdate()) FOR [Tarih]
GO
ALTER TABLE [dbo].[Bilet]  WITH CHECK ADD  CONSTRAINT [FK_Bilet_Calisan] FOREIGN KEY([CalisanID])
REFERENCES [dbo].[Calisan] ([ID])
GO
ALTER TABLE [dbo].[Bilet] CHECK CONSTRAINT [FK_Bilet_Calisan]
GO
ALTER TABLE [dbo].[Bilet]  WITH CHECK ADD  CONSTRAINT [FK_Bilet_Film] FOREIGN KEY([FilmID])
REFERENCES [dbo].[Film] ([ID])
GO
ALTER TABLE [dbo].[Bilet] CHECK CONSTRAINT [FK_Bilet_Film]
GO
ALTER TABLE [dbo].[Bilet]  WITH CHECK ADD  CONSTRAINT [FK_Bilet_Musteri] FOREIGN KEY([MusteriID])
REFERENCES [dbo].[Musteri] ([ID])
GO
ALTER TABLE [dbo].[Bilet] CHECK CONSTRAINT [FK_Bilet_Musteri]
GO
ALTER TABLE [dbo].[Bilet]  WITH CHECK ADD  CONSTRAINT [FK_Bilet_Salon] FOREIGN KEY([SalonID])
REFERENCES [dbo].[Salon] ([ID])
GO
ALTER TABLE [dbo].[Bilet] CHECK CONSTRAINT [FK_Bilet_Salon]
GO
ALTER TABLE [dbo].[Bilet]  WITH CHECK ADD  CONSTRAINT [FK_Bilet_Seans] FOREIGN KEY([SeansID])
REFERENCES [dbo].[Seans] ([ID])
GO
ALTER TABLE [dbo].[Bilet] CHECK CONSTRAINT [FK_Bilet_Seans]
GO
ALTER TABLE [dbo].[Film]  WITH CHECK ADD  CONSTRAINT [FK_Film_FilmTur] FOREIGN KEY([TurID])
REFERENCES [dbo].[FilmTur] ([ID])
GO
ALTER TABLE [dbo].[Film] CHECK CONSTRAINT [FK_Film_FilmTur]
GO
/****** Object:  StoredProcedure [dbo].[sp_AyinFilmi]    Script Date: 15.02.2020 17:12:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_AyinFilmi]
as
select top 1 Film.Adi,count(FilmID) as Katilim from Bilet
join Film on Film.ID=Bilet.FilmID
where month(getdate()) - month(Tarih) <=1
group by Film.Adi
order by Katilim desc
GO
/****** Object:  StoredProcedure [dbo].[sp_BiletEkle]    Script Date: 15.02.2020 17:12:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_BiletEkle]
@FilmID int,
@SalonID int,
@SeansID int,
@CalisanID int,
@MusteriID int,
@tarih datetime,
@KoltukNo nchar(5),
@Fiyat money
as
insert into Bilet values (@FilmID,@SalonID,@SeansID,@CalisanID,@MusteriID,@tarih,@KoltukNo,@Fiyat)
GO
/****** Object:  StoredProcedure [dbo].[sp_BiletGetir]    Script Date: 15.02.2020 17:12:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_BiletGetir]
@ID int
as
select * from Bilet where ID=@ID
GO
/****** Object:  StoredProcedure [dbo].[sp_BiletGuncelle]    Script Date: 15.02.2020 17:12:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_BiletGuncelle]
@ID int,
@FilmID int,
@SalonID int,
@SeansID int,
@CalisanID int,
@MusteriID int,
@tarih datetime,
@KoltukNo nchar(5),
@Fiyat money
as
update Bilet set FilmID=@FilmID,SalonID=@SalonID,SeansID=@SeansID,CalisanID=@CalisanID,MusteriID=@MusteriID,Tarih=@tarih,KoltukNo=@KoltukNo,Fiyat=@Fiyat where ID =@ID
GO
/****** Object:  StoredProcedure [dbo].[sp_BiletSil]    Script Date: 15.02.2020 17:12:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_BiletSil]
@ID int
as
delete from Bilet where ID=@ID
GO
/****** Object:  StoredProcedure [dbo].[sp_EnCokKazandiran]    Script Date: 15.02.2020 17:12:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_EnCokKazandiran]
as
select top 1 count(Film.ID) as Katilim,Film.Adi,sum(Bilet.Fiyat) as ToplamFiyat from Bilet
join Film on Film.ID=Bilet.FilmID 
group by Film.Adi order by ToplamFiyat desc
GO
/****** Object:  StoredProcedure [dbo].[sp_FilmeGidenler]    Script Date: 15.02.2020 17:12:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_FilmeGidenler]
@FilmAdi nvarchar(100)
as
select f.Adi as FilmAdi,m.Adi+' '+m.Soyadi as Müşteri from Film f
join Bilet b on b.FilmID=f.ID
join Musteri m on m.ID = b.MusteriID
where f.Adi=@FilmAdi
GO
/****** Object:  StoredProcedure [dbo].[sp_FilmTur]    Script Date: 15.02.2020 17:12:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_FilmTur]
as
select FilmTur.Adi,count(Film.ID) from FilmTur
join Film on Film.TurID=FilmTur.ID
group by FilmTur.Adi
GO
/****** Object:  StoredProcedure [dbo].[sp_MusteriFilm]    Script Date: 15.02.2020 17:12:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_MusteriFilm]
@MusteriID int
as
select m.Adi+' '+m.Soyadi as Ad,f.Adi as FilmAdi from Musteri m
join Bilet b on b.MusteriID=m.ID
join Film f on f.ID=b.FilmID
where m.ID = @MusteriID
GO
/****** Object:  StoredProcedure [dbo].[sp_TahsilatRaporu]    Script Date: 15.02.2020 17:12:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_TahsilatRaporu]
as
select count(Film.ID) as Katilim,Film.Adi,sum(Bilet.Fiyat) as ToplamFiyat from Bilet
join Film on Film.ID=Bilet.FilmID 
group by Film.Adi
GO
USE [master]
GO
ALTER DATABASE [Sinema] SET  READ_WRITE 
GO
