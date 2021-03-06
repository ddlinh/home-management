USE [master]
GO
/****** Object:  Database [QuanLyNha]    Script Date: 4/1/2021 1:32:52 PM ******/
CREATE DATABASE [QuanLyNha]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuanLyNha', FILENAME = N'D:\HQT_PROJET\QuanLyNha.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QuanLyNha_log', FILENAME = N'D:\HQT_PROJET\QuanLyNha_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [QuanLyNha] SET COMPATIBILITY_LEVEL = 150
GO
ALTER DATABASE [QuanLyNha] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanLyNha] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanLyNha] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanLyNha] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanLyNha] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanLyNha] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QuanLyNha] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanLyNha] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLyNha] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanLyNha] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanLyNha] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanLyNha] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanLyNha] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanLyNha] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanLyNha] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QuanLyNha] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanLyNha] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanLyNha] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanLyNha] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanLyNha] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanLyNha] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanLyNha] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanLyNha] SET RECOVERY FULL 
GO
ALTER DATABASE [QuanLyNha] SET  MULTI_USER 
GO
ALTER DATABASE [QuanLyNha] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanLyNha] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuanLyNha] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuanLyNha] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QuanLyNha] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QuanLyNha] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'QuanLyNha', N'ON'
GO
ALTER DATABASE [QuanLyNha] SET QUERY_STORE = OFF
GO

USE [QuanLyNha]
GO
/****** Object:  Table [dbo].[ChiNhanh]    Script Date: 4/1/2021 1:32:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiNhanh](
	[ID] [int] NOT NULL,
	[Duong] [nvarchar](50) NULL,
	[Khu_Vuc] [nvarchar](50) NULL,
	[Thanh_Pho] [nvarchar](50) NULL,
	[SDT] [char](8) NULL,
	[Fax] [char](8) NULL,
 CONSTRAINT [PK_ChiNhanh] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTiet_HopDong]    Script Date: 4/1/2021 1:32:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTiet_HopDong](
	[Ma_Nha] [int] NOT NULL,
	[Ma_NhanVien] [int] NOT NULL,
	[Ma_KhachHang] [int] NOT NULL,
	[Loai_HopDong] [bit] NULL,
	[NgayLap] [date] NULL,
	[NgayHetHan] [date] NULL,
 CONSTRAINT [PK_ChiTiet_HopDong] PRIMARY KEY CLUSTERED 
(
	[Ma_Nha] ASC,
	[Ma_NhanVien] ASC,
	[Ma_KhachHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTiet_XemNha]    Script Date: 4/1/2021 1:32:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTiet_XemNha](
	[Ma_KH] [int] NOT NULL,
	[Ma_Nha] [int] NOT NULL,
	[Ngay] [date] NULL,
	[NhanXet] [text] NULL,
	[MaNV] [int] NOT NULL
 CONSTRAINT [PK_ChiTiet_XemNha] PRIMARY KEY CLUSTERED 
(
	[Ma_KH] ASC,
	[Ma_Nha] ASC,
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTiet_YeuCau]    Script Date: 4/1/2021 1:32:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTiet_YeuCau](
	[Ma_KH] [int] NOT NULL,
	[Ma_LoaiNha] [int] NOT NULL,
 CONSTRAINT [PK_ChiTiet_YeuCau] PRIMARY KEY CLUSTERED 
(
	[Ma_KH] ASC,
	[Ma_LoaiNha] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChuSoHuu]    Script Date: 4/1/2021 1:32:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChuSoHuu](
	[ID] [int] NOT NULL,
	[Ho_Ten] [nvarchar](50) NULL,
	[Dia_Chi] [nvarchar](50) NULL,
	[SDT] [char](10) NULL,
 CONSTRAINT [PK_ChuSoHuu] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 4/1/2021 1:32:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[ID] [int] NOT NULL,
	[Ho_Ten] [nvarchar](50) NULL,
	[Dia_Chi] [nvarchar](50) NULL,
	[Dien_Thoai] [char](10) NULL,
	[TieuChi_SoPhong] [int] NULL,
	[TieuChi_Gia_Min] [int] NULL,
	[TieuChi_Gia_Max] [int] NULL,
	[TieuChi_KhuVuc] [nvarchar](50) NULL,
	[TieuChi_Duong] [nvarchar](50) NULL,
	[TieuChi_Quan] [nvarchar](50) NULL,
	[TieuChi_ThanhPhi] [nvarchar](50) NULL,
	[Thue_Mua] [bit] NULL,
	[Da_Lien_He] [bit] DEFAULT 0,
	[Ma_Chi_Nhanh] [int] NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiNha]    Script Date: 4/1/2021 1:32:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiNha](
	[ID] [int] NOT NULL,
	[Ten] [nvarchar](50) NULL,
 CONSTRAINT [PK_LoaiNha] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nha]    Script Date: 4/1/2021 1:32:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nha](
	[ID] [int] NOT NULL,
	[Khu_Vuc] [nvarchar](50) NULL,
	[Duong] [nvarchar](50) NULL,
	[Quan] [nvarchar](50) NULL,
	[Thanh_Pho] [nvarchar](50) NULL,
	[So_Phong] [int] NULL,
	[Ma_Loai] [int] NULL,
	[Ma_NV] [int] NULL,
	[Ma_CSH] [int] NULL,
	[Ngay_Dang] [date] NULL,
	[Ngay_het_han] [date] NULL,
	[Dieu_Kien] [nvarchar](max) NULL,
	[Gia] [int] NULL,
	[Tinh_Trang] [nvarchar](20) NULL,
	[Luot_Xem] [int] DEFAULT 0,
 CONSTRAINT [PK_Nha] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 4/1/2021 1:32:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[ID] [int] NOT NULL,
	[Ho_Ten] [nvarchar](50) NULL,
	[Gioi_Tinh] [bit] NULL,
	[Dia_Chi] [nvarchar](50) NULL,
	[SDT] [char](10) NULL,
	[Ngay_Sinh] [date] NULL,
	[Luong] [int] NULL,
	[Ma_Chi_Nhanh] [int] NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ChiTiet_HopDong]  WITH CHECK ADD  CONSTRAINT [FK_ChiTiet_HopDong_KhachHang] FOREIGN KEY([Ma_KhachHang])
REFERENCES [dbo].[KhachHang] ([ID])
GO
ALTER TABLE [dbo].[ChiTiet_HopDong] CHECK CONSTRAINT [FK_ChiTiet_HopDong_KhachHang]
GO
ALTER TABLE [dbo].[ChiTiet_HopDong]  WITH CHECK ADD  CONSTRAINT [FK_ChiTiet_HopDong_Nha] FOREIGN KEY([Ma_Nha])
REFERENCES [dbo].[Nha] ([ID])
GO
ALTER TABLE [dbo].[ChiTiet_HopDong] CHECK CONSTRAINT [FK_ChiTiet_HopDong_Nha]
GO
ALTER TABLE [dbo].[ChiTiet_HopDong]  WITH CHECK ADD  CONSTRAINT [FK_ChiTiet_HopDong_NhanVien] FOREIGN KEY([Ma_NhanVien])
REFERENCES [dbo].[NhanVien] ([ID])
GO
ALTER TABLE [dbo].[ChiTiet_HopDong] CHECK CONSTRAINT [FK_ChiTiet_HopDong_NhanVien]
GO
ALTER TABLE [dbo].[ChiTiet_XemNha]  WITH CHECK ADD  CONSTRAINT [FK_ChiTiet_XemNha_KhachHang] FOREIGN KEY([Ma_KH])
REFERENCES [dbo].[KhachHang] ([ID])
GO
ALTER TABLE [dbo].[ChiTiet_XemNha] CHECK CONSTRAINT [FK_ChiTiet_XemNha_KhachHang]
GO
ALTER TABLE [dbo].[ChiTiet_XemNha]  WITH CHECK ADD  CONSTRAINT [FK_ChiTiet_XemNha_Nha] FOREIGN KEY([Ma_Nha])
REFERENCES [dbo].[Nha] ([ID])
GO
ALTER TABLE [dbo].[ChiTiet_XemNha] CHECK CONSTRAINT [FK_ChiTiet_XemNha_Nha]
GO
ALTER TABLE [dbo].[ChiTiet_YeuCau]  WITH CHECK ADD  CONSTRAINT [FK_ChiTiet_YeuCau_KhachHang] FOREIGN KEY([Ma_KH])
REFERENCES [dbo].[KhachHang] ([ID])
GO
ALTER TABLE [dbo].[ChiTiet_YeuCau] CHECK CONSTRAINT [FK_ChiTiet_YeuCau_KhachHang]
GO
ALTER TABLE [dbo].[ChiTiet_YeuCau]  WITH CHECK ADD  CONSTRAINT [FK_ChiTiet_YeuCau_LoaiNha] FOREIGN KEY([Ma_LoaiNha])
REFERENCES [dbo].[LoaiNha] ([ID])
GO
ALTER TABLE [dbo].[ChiTiet_YeuCau] CHECK CONSTRAINT [FK_ChiTiet_YeuCau_LoaiNha]
GO
ALTER TABLE [dbo].[KhachHang]  WITH CHECK ADD  CONSTRAINT [FK_KhachHang_ChiNhanh] FOREIGN KEY([Ma_Chi_Nhanh])
REFERENCES [dbo].[ChiNhanh] ([ID])
GO
ALTER TABLE [dbo].[KhachHang] CHECK CONSTRAINT [FK_KhachHang_ChiNhanh]
GO
ALTER TABLE [dbo].[Nha]  WITH CHECK ADD  CONSTRAINT [FK_Nha_ChuSoHuu] FOREIGN KEY([Ma_NV])
REFERENCES [dbo].[ChuSoHuu] ([ID])
GO
ALTER TABLE [dbo].[Nha] CHECK CONSTRAINT [FK_Nha_ChuSoHuu]
GO
ALTER TABLE [dbo].[Nha]  WITH CHECK ADD  CONSTRAINT [FK_Nha_LoaiNha] FOREIGN KEY([Ma_Loai])
REFERENCES [dbo].[LoaiNha] ([ID])
GO
ALTER TABLE [dbo].[Nha] CHECK CONSTRAINT [FK_Nha_LoaiNha]
GO
ALTER TABLE [dbo].[Nha]  WITH CHECK ADD  CONSTRAINT [FK_Nha_NhanVien] FOREIGN KEY([Ma_NV])
REFERENCES [dbo].[NhanVien] ([ID])
GO
ALTER TABLE [dbo].[Nha] CHECK CONSTRAINT [FK_Nha_NhanVien]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_ChiNhanh] FOREIGN KEY([Ma_Chi_Nhanh])
REFERENCES [dbo].[ChiNhanh] ([ID])
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK_NhanVien_ChiNhanh]
GO
ALTER TABLE [dbo].[ChiTiet_HopDong]  WITH CHECK ADD  CONSTRAINT [CK_ChiTiet_HopDong] CHECK  (([Loai_HopDong]=(1) OR [Loai_HopDong]=(0)))
GO
ALTER TABLE [dbo].[ChiTiet_HopDong] CHECK CONSTRAINT [CK_ChiTiet_HopDong]
GO

ALTER TABLE [dbo].[ChiTiet_HopDong]  WITH CHECK ADD  CONSTRAINT [CK_ChiTiet_HopDong_2] CHECK  (([NgayHetHan]>[NgayLap]))
GO
ALTER TABLE [dbo].[ChiTiet_HopDong] CHECK CONSTRAINT [CK_ChiTiet_HopDong_2]
GO
ALTER TABLE [dbo].[KhachHang]  WITH CHECK ADD  CONSTRAINT [CK_KhachHang] CHECK  (([Thue_Mua]=(1) OR [Thue_Mua]=(0)))
GO
ALTER TABLE [dbo].[KhachHang] CHECK CONSTRAINT [CK_KhachHang]
GO
ALTER TABLE [dbo].[KhachHang]  WITH CHECK ADD  CONSTRAINT [CK_KhachHang_1] CHECK  (([Da_Lien_He]=(1) OR [Da_Lien_He]=(0)))
GO
ALTER TABLE [dbo].[KhachHang] CHECK CONSTRAINT [CK_KhachHang_1]
GO
ALTER TABLE [dbo].[KhachHang]  WITH CHECK ADD  CONSTRAINT [CK_KhachHang_2] CHECK  (([TieuChi_Gia_Max]>=[TieuChi_Gia_Min]))
GO
ALTER TABLE [dbo].[KhachHang] CHECK CONSTRAINT [CK_KhachHang_2]
GO
ALTER TABLE [dbo].[Nha]  WITH CHECK ADD  CONSTRAINT [CK_Nha] CHECK  (([Ngay_het_han]>[Ngay_Dang]))
GO
ALTER TABLE [dbo].[Nha] CHECK CONSTRAINT [CK_Nha]
GO
ALTER TABLE [dbo].[Nha]  WITH CHECK ADD  CONSTRAINT [CK_Nha_1] CHECK  (([So_Phong]>(0)))
GO
ALTER TABLE [dbo].[Nha] CHECK CONSTRAINT [CK_Nha_1]
GO
ALTER TABLE [dbo].[Nha]  WITH CHECK ADD  CONSTRAINT [CK_Nha_2] CHECK  (([Luot_Xem]>=(0)))
GO
ALTER TABLE [dbo].[Nha] CHECK CONSTRAINT [CK_Nha_2]
GO
ALTER TABLE [dbo].[Nha]  WITH CHECK ADD  CONSTRAINT [CK_Nha_3] CHECK  (([Tinh_Trang]=N'ĐÃ CHO THUÊ' OR [Tinh_Trang]=N'ĐÃ BÁN' OR [Tinh_Trang]=N'CÒN TRỐNG'))
GO
ALTER TABLE [dbo].[Nha] CHECK CONSTRAINT [CK_Nha_3]
GO
ALTER TABLE [dbo].[Nha]  WITH CHECK ADD  CONSTRAINT [CK_Nha_4] CHECK  (([Dieu_Kien] IS NULL AND [Gia]>(0) OR [Dieu_Kien] IS NOT NULL AND [Gia]>(500000)))
GO
ALTER TABLE [dbo].[Nha] CHECK CONSTRAINT [CK_Nha_4]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [CK_NhanVien] CHECK  (([Gioi_Tinh]=(0) OR [Gioi_Tinh]=(1)))
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [CK_NhanVien]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [CK_NhanVien_1] CHECK  (((datepart(year,getdate())-datepart(year,[Ngay_Sinh]))>=(18)))
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [CK_NhanVien_1]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [CK_NhanVien_2] CHECK  (([Luong]>=(1000000)))
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [CK_NhanVien_2]
GO

CREATE TRIGGER rb_HopDong ON ChiTiet_HopDong FOR INSERT
AS
 IF EXISTS ( SELECT * FROM ChiTiet_HopDong WHERE NgayHetHan IS NOT NULL AND NgayHetHan < getdate() )
 BEGIN
   Print 'Khong the them hop dong moi vi hop dong truoc chua het han'
   RollBack Tran
 END
GO

CREATE TRIGGER rb_HopDong_2 ON ChiTiet_HopDong FOR INSERT, UPDATE
AS
 IF EXISTS (SELECT * FROM (Nha JOIN ChiTiet_HopDong ON Nha.ID = ChiTiet_HopDong.Ma_Nha) WHERE Nha.Ngay_Dang > ChiTiet_HopDong.NgayLap)
 BEGIN
  Print 'Ngay ky hop dong khong the truoc ngay dang bai'
  RollBack Tran
 END
GO

CREATE TRIGGER rb_XemNha On ChiTiet_XemNha FOR INSERT, UPDATE
AS
 IF EXISTS (SELECT * FROM (Nha JOIN ChiTiet_XemNha ON Nha.ID = ChiTiet_XemNha.Ma_Nha) WHERE Nha.Ngay_Dang > ChiTiet_XemNha.Ngay)
 BEGIN
  Print 'Ngay xem nha khong the truoc ngay dang bai'
  RollBack Tran
 END
GO

USE [master]
GO
ALTER DATABASE [QuanLyNha] SET  READ_WRITE 
GO
