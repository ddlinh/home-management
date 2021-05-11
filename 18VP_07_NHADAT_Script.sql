USE [master]
GO
/****** Object:  Database [QuanLyNha]    Script Date: 5/11/2021 1:51:13 PM ******/
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
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLyNha].[dbo].[sp_fulltext_database] @action = 'enable'
end
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
/****** Object:  Table [dbo].[ChiNhanh]    Script Date: 5/11/2021 1:51:13 PM ******/
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
/****** Object:  Table [dbo].[ChiTiet_HopDong]    Script Date: 5/11/2021 1:51:13 PM ******/
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
/****** Object:  Table [dbo].[ChiTiet_XemNha]    Script Date: 5/11/2021 1:51:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTiet_XemNha](
	[Ma_KH] [int] NOT NULL,
	[Ma_Nha] [int] NOT NULL,
	[Ngay] [date] NULL,
	[NhanXet] [text] NULL,
	[MaNV] [int] NOT NULL,
 CONSTRAINT [PK_ChiTiet_XemNha] PRIMARY KEY CLUSTERED 
(
	[Ma_KH] ASC,
	[Ma_Nha] ASC,
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTiet_YeuCau]    Script Date: 5/11/2021 1:51:13 PM ******/
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
/****** Object:  Table [dbo].[ChuSoHuu]    Script Date: 5/11/2021 1:51:13 PM ******/
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
/****** Object:  Table [dbo].[KhachHang]    Script Date: 5/11/2021 1:51:13 PM ******/
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
	[Da_Lien_He] [bit] NULL,
	[Ma_Chi_Nhanh] [int] NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiNha]    Script Date: 5/11/2021 1:51:13 PM ******/
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
/****** Object:  Table [dbo].[Nha]    Script Date: 5/11/2021 1:51:13 PM ******/
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
	[Luot_Xem] [int] NULL,
 CONSTRAINT [PK_Nha] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 5/11/2021 1:51:13 PM ******/
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
INSERT [dbo].[ChiNhanh] ([ID], [Duong], [Khu_Vuc], [Thanh_Pho], [SDT], [Fax]) VALUES (1, N'Le Duc Tho', N'Go Vap', N'TP.HCM', NULL, NULL)
INSERT [dbo].[ChiNhanh] ([ID], [Duong], [Khu_Vuc], [Thanh_Pho], [SDT], [Fax]) VALUES (2, N'Duong Ba Trac', N'Quan 8', N'TP.HCM', NULL, NULL)
INSERT [dbo].[ChiNhanh] ([ID], [Duong], [Khu_Vuc], [Thanh_Pho], [SDT], [Fax]) VALUES (3, N'Dinh Tien Hoang', N'Quan Binh Thanh', N'TP.HCM', NULL, NULL)
INSERT [dbo].[ChiNhanh] ([ID], [Duong], [Khu_Vuc], [Thanh_Pho], [SDT], [Fax]) VALUES (4, N'Nguyen Van Cu', N'Quan 5', N'TP.HCM', NULL, NULL)
GO
INSERT [dbo].[ChiTiet_HopDong] ([Ma_Nha], [Ma_NhanVien], [Ma_KhachHang], [Loai_HopDong], [NgayLap], [NgayHetHan]) VALUES (1, 1, 3, 1, CAST(N'2021-05-08' AS Date), CAST(N'2021-11-05' AS Date))
GO
INSERT [dbo].[ChiTiet_XemNha] ([Ma_KH], [Ma_Nha], [Ngay], [NhanXet], [MaNV]) VALUES (1, 3, CAST(N'2021-06-08' AS Date), NULL, 4)
INSERT [dbo].[ChiTiet_XemNha] ([Ma_KH], [Ma_Nha], [Ngay], [NhanXet], [MaNV]) VALUES (3, 5, CAST(N'2021-06-08' AS Date), NULL, 3)
GO
INSERT [dbo].[ChiTiet_YeuCau] ([Ma_KH], [Ma_LoaiNha]) VALUES (1, 2)
INSERT [dbo].[ChiTiet_YeuCau] ([Ma_KH], [Ma_LoaiNha]) VALUES (2, 3)
INSERT [dbo].[ChiTiet_YeuCau] ([Ma_KH], [Ma_LoaiNha]) VALUES (3, 1)
INSERT [dbo].[ChiTiet_YeuCau] ([Ma_KH], [Ma_LoaiNha]) VALUES (4, 2)
GO
INSERT [dbo].[ChuSoHuu] ([ID], [Ho_Ten], [Dia_Chi], [SDT]) VALUES (1, N'Nguyen Minh Phuong', N'Quan 3', N'0944353466')
INSERT [dbo].[ChuSoHuu] ([ID], [Ho_Ten], [Dia_Chi], [SDT]) VALUES (2, N'Vo Ha Tram', N'Quan Binh Thanh', N'0985332187')
INSERT [dbo].[ChuSoHuu] ([ID], [Ho_Ten], [Dia_Chi], [SDT]) VALUES (3, N'Nguyen Vu', N'Quan 12', N'0947588233')
INSERT [dbo].[ChuSoHuu] ([ID], [Ho_Ten], [Dia_Chi], [SDT]) VALUES (4, N'Tran Bao Chau', N'Quan Go Vap', N'0944857273')
INSERT [dbo].[ChuSoHuu] ([ID], [Ho_Ten], [Dia_Chi], [SDT]) VALUES (5, N'Vu Hong My', N'Quan 5', N'0938172444')
INSERT [dbo].[ChuSoHuu] ([ID], [Ho_Ten], [Dia_Chi], [SDT]) VALUES (6, N'Tran Binh Toan', N'Quan 2', N'0933812444')
GO
INSERT [dbo].[KhachHang] ([ID], [Ho_Ten], [Dia_Chi], [Dien_Thoai], [TieuChi_SoPhong], [TieuChi_Gia_Min], [TieuChi_Gia_Max], [TieuChi_KhuVuc], [TieuChi_Duong], [TieuChi_Quan], [TieuChi_ThanhPhi], [Thue_Mua], [Da_Lien_He], [Ma_Chi_Nhanh]) VALUES (1, N'Nguyen Minh Tuan', N'125 Nguyen Trai', N'0913853349', 3, 1000, 5000, N'An ninh', N'Tran Hung Dao', N'Quan 1', N'HCM', 1, 1, 1)
INSERT [dbo].[KhachHang] ([ID], [Ho_Ten], [Dia_Chi], [Dien_Thoai], [TieuChi_SoPhong], [TieuChi_Gia_Min], [TieuChi_Gia_Max], [TieuChi_KhuVuc], [TieuChi_Duong], [TieuChi_Quan], [TieuChi_ThanhPhi], [Thue_Mua], [Da_Lien_He], [Ma_Chi_Nhanh]) VALUES (2, N'Dang Anh Thu', N'230/34 Thanh Thai', N'0834023202', 2, 500, 2000, N'Gan benh vien', N'Nguyen Thuong Hien', N'Quan 3', N'HCM', 0, 1, 2)
INSERT [dbo].[KhachHang] ([ID], [Ho_Ten], [Dia_Chi], [Dien_Thoai], [TieuChi_SoPhong], [TieuChi_Gia_Min], [TieuChi_Gia_Max], [TieuChi_KhuVuc], [TieuChi_Duong], [TieuChi_Quan], [TieuChi_ThanhPhi], [Thue_Mua], [Da_Lien_He], [Ma_Chi_Nhanh]) VALUES (3, N'Le Ngoc Minh Trang', N'300/3 Dang Van Ngu', N'0909120230', 3, 6000, 10000, N'Cao cap', N'Nguyen Van Cu', N'Quan 1', N'HCM', 1, 1, 1)
INSERT [dbo].[KhachHang] ([ID], [Ho_Ten], [Dia_Chi], [Dien_Thoai], [TieuChi_SoPhong], [TieuChi_Gia_Min], [TieuChi_Gia_Max], [TieuChi_KhuVuc], [TieuChi_Duong], [TieuChi_Quan], [TieuChi_ThanhPhi], [Thue_Mua], [Da_Lien_He], [Ma_Chi_Nhanh]) VALUES (4, N'Le Minh Khoi', N'120/47 Hai Ba Trung', N'0232032002', 1, 500, 1000, N'Khong co', N'Doan Van Bo', N'Quan 4', N'HCM', 1, 1, 3)
INSERT [dbo].[KhachHang] ([ID], [Ho_Ten], [Dia_Chi], [Dien_Thoai], [TieuChi_SoPhong], [TieuChi_Gia_Min], [TieuChi_Gia_Max], [TieuChi_KhuVuc], [TieuChi_Duong], [TieuChi_Quan], [TieuChi_ThanhPhi], [Thue_Mua], [Da_Lien_He], [Ma_Chi_Nhanh]) VALUES (5, N'Tran Ngoc Mai', N'Quan 7', N'0933181232', 3, NULL, NULL, NULL, N'Hai Ba Trung', N'Quan 1', N'TP.HCM', 1, 0, NULL)
GO
INSERT [dbo].[LoaiNha] ([ID], [Ten]) VALUES (1, N'Căn hộ chung cư')
INSERT [dbo].[LoaiNha] ([ID], [Ten]) VALUES (2, N'Nhà riêng')
INSERT [dbo].[LoaiNha] ([ID], [Ten]) VALUES (3, N'Villa, Biệt thự')
INSERT [dbo].[LoaiNha] ([ID], [Ten]) VALUES (4, N'Căn hộ cho thuê')
INSERT [dbo].[LoaiNha] ([ID], [Ten]) VALUES (5, N'Nhà trọ, Phòng trọ')
INSERT [dbo].[LoaiNha] ([ID], [Ten]) VALUES (6, N'Văn phòng')
GO
INSERT [dbo].[Nha] ([ID], [Khu_Vuc], [Duong], [Quan], [Thanh_Pho], [So_Phong], [Ma_Loai], [Ma_NV], [Ma_CSH], [Ngay_Dang], [Ngay_het_han], [Dieu_Kien], [Gia], [Tinh_Trang], [Luot_Xem]) VALUES (1, NULL, N'Nguyen Van Troi', N'Quan 3', N'TP.HCM', 4, 1, 1, 4, CAST(N'2021-04-08' AS Date), CAST(N'2021-06-08' AS Date), N'Không nuôi thú cưng', 900000, N'CÒN TRỐNG', 0)
INSERT [dbo].[Nha] ([ID], [Khu_Vuc], [Duong], [Quan], [Thanh_Pho], [So_Phong], [Ma_Loai], [Ma_NV], [Ma_CSH], [Ngay_Dang], [Ngay_het_han], [Dieu_Kien], [Gia], [Tinh_Trang], [Luot_Xem]) VALUES (2, NULL, N'Dinh Tien Hoang', N'Quan 1', N'TP.HCM', 3, 2, 1, 2, CAST(N'2021-02-05' AS Date), CAST(N'2021-02-09' AS Date), N'Hộ khẩu thành phố', 8000000, N'CÒN TRỐNG', 0)
INSERT [dbo].[Nha] ([ID], [Khu_Vuc], [Duong], [Quan], [Thanh_Pho], [So_Phong], [Ma_Loai], [Ma_NV], [Ma_CSH], [Ngay_Dang], [Ngay_het_han], [Dieu_Kien], [Gia], [Tinh_Trang], [Luot_Xem]) VALUES (3, NULL, N'Le Van Duyet', N'Quan Binh Thanh', N'TP.HCM', 5, 1, 1, 2, CAST(N'2021-02-06' AS Date), CAST(N'2021-08-06' AS Date), N'Không nuôi thú cưng', 900000, N'CÒN TRỐNG', 1)
INSERT [dbo].[Nha] ([ID], [Khu_Vuc], [Duong], [Quan], [Thanh_Pho], [So_Phong], [Ma_Loai], [Ma_NV], [Ma_CSH], [Ngay_Dang], [Ngay_het_han], [Dieu_Kien], [Gia], [Tinh_Trang], [Luot_Xem]) VALUES (4, NULL, N'Pham Hung', N'Quan 8', N'TP.HCM', 3, 5, 2, 4, CAST(N'2021-02-09' AS Date), CAST(N'2021-07-09' AS Date), NULL, 6202, N'CÒN TRỐNG', 0)
INSERT [dbo].[Nha] ([ID], [Khu_Vuc], [Duong], [Quan], [Thanh_Pho], [So_Phong], [Ma_Loai], [Ma_NV], [Ma_CSH], [Ngay_Dang], [Ngay_het_han], [Dieu_Kien], [Gia], [Tinh_Trang], [Luot_Xem]) VALUES (5, NULL, N'Nguyen Oanh', N'Quan Go Vap', N'TP.HCM', 4, 4, 3, 5, CAST(N'2021-02-05' AS Date), CAST(N'2021-08-05' AS Date), NULL, 18612, N'CÒN TRỐNG', 1)
INSERT [dbo].[Nha] ([ID], [Khu_Vuc], [Duong], [Quan], [Thanh_Pho], [So_Phong], [Ma_Loai], [Ma_NV], [Ma_CSH], [Ngay_Dang], [Ngay_het_han], [Dieu_Kien], [Gia], [Tinh_Trang], [Luot_Xem]) VALUES (6, NULL, N'Truong Chinh', N'Quan 12', N'TP.HCM', 2, 6, 4, 3, CAST(N'2021-02-09' AS Date), CAST(N'2021-09-09' AS Date), NULL, 1500, N'CÒN TRỐNG', 0)
INSERT [dbo].[Nha] ([ID], [Khu_Vuc], [Duong], [Quan], [Thanh_Pho], [So_Phong], [Ma_Loai], [Ma_NV], [Ma_CSH], [Ngay_Dang], [Ngay_het_han], [Dieu_Kien], [Gia], [Tinh_Trang], [Luot_Xem]) VALUES (7, NULL, N'Thao Dien', N'Quan 2', N'TP.HCM', 6, 3, 1, 6, CAST(N'2021-03-08' AS Date), CAST(N'2021-12-08' AS Date), N'Tự do', 12000000, N'CÒN TRỐNG', 0)
INSERT [dbo].[Nha] ([ID], [Khu_Vuc], [Duong], [Quan], [Thanh_Pho], [So_Phong], [Ma_Loai], [Ma_NV], [Ma_CSH], [Ngay_Dang], [Ngay_het_han], [Dieu_Kien], [Gia], [Tinh_Trang], [Luot_Xem]) VALUES (8, NULL, N'Le Van Sy', N'Quan 3', N'TP.HCM', 3, 2, NULL, 1, CAST(N'2021-09-05' AS Date), CAST(N'2021-09-08' AS Date), N'Tự do', 8000000, N'CÒN TRỐNG', 0)
INSERT [dbo].[Nha] ([ID], [Khu_Vuc], [Duong], [Quan], [Thanh_Pho], [So_Phong], [Ma_Loai], [Ma_NV], [Ma_CSH], [Ngay_Dang], [Ngay_het_han], [Dieu_Kien], [Gia], [Tinh_Trang], [Luot_Xem]) VALUES (9, NULL, N'Huynh Van Banh', N'Quan 3', N'TP.HCM', 4, 4, NULL, 4, CAST(N'2021-09-05' AS Date), CAST(N'2021-09-08' AS Date), NULL, 11710, N'CÒN TRỐNG', 0)
GO
INSERT [dbo].[NhanVien] ([ID], [Ho_Ten], [Gioi_Tinh], [Dia_Chi], [SDT], [Ngay_Sinh], [Luong], [Ma_Chi_Nhanh]) VALUES (1, N'Mai Hong Ngoc', 1, N'Quan Phu Nhuan', N'0933222111', CAST(N'1997-02-03' AS Date), 3000000, 3)
INSERT [dbo].[NhanVien] ([ID], [Ho_Ten], [Gioi_Tinh], [Dia_Chi], [SDT], [Ngay_Sinh], [Luong], [Ma_Chi_Nhanh]) VALUES (2, N'Nguyen Phuoc Thinh', 0, N'Quan 8', N'0988777666', CAST(N'1995-08-09' AS Date), 3000000, 2)
INSERT [dbo].[NhanVien] ([ID], [Ho_Ten], [Gioi_Tinh], [Dia_Chi], [SDT], [Ngay_Sinh], [Luong], [Ma_Chi_Nhanh]) VALUES (3, N'Huynh Tran Thanh', 0, N'Quan 1', N'0956464373', CAST(N'1992-08-05' AS Date), 3000000, 4)
INSERT [dbo].[NhanVien] ([ID], [Ho_Ten], [Gioi_Tinh], [Dia_Chi], [SDT], [Ngay_Sinh], [Luong], [Ma_Chi_Nhanh]) VALUES (4, N'Esther Luu', 1, N'Quan Go Vap', N'0987654321', CAST(N'1994-07-02' AS Date), 3000000, 1)
INSERT [dbo].[NhanVien] ([ID], [Ho_Ten], [Gioi_Tinh], [Dia_Chi], [SDT], [Ngay_Sinh], [Luong], [Ma_Chi_Nhanh]) VALUES (5, N'Thieu Bao Tram', 1, N'Quan 3', N'0983747572', CAST(N'1993-08-08' AS Date), 3000000, 4)
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
/****** Object:  StoredProcedure [dbo].[L11]    Script Date: 5/11/2021 1:51:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[L11](@Ma_Nha as int, @Ma_KH as int, @Ma_NV as int, @ngay AS DATE)
As
	Begin Transaction
		IF NOT EXISTS(SELECT * FROM Nha WHERE ID = @Ma_Nha)
			BEGIN
				PRINT 'Nha khong ton tai'
				ROLLBACK TRANSACTION
				RETURN
			END
		IF NOT EXISTS(SELECT * FROM NhanVien WHERE ID = @Ma_NV)
			BEGIN
				PRINT 'Nhan vien khong ton tai'
				ROLLBACK TRANSACTION
				RETURN
			END
		IF NOT EXISTS(SELECT * FROM KhachHang WHERE ID = @Ma_KH)
			BEGIN
				PRINT 'Khach hang khong ton tai'
				ROLLBACK TRANSACTION
				RETURN
			END
		Begin Try
			INSERT INTO ChiTiet_XemNha (Ma_KH, Ma_Nha, MaNV, Ngay) VALUES(@Ma_KH, @Ma_Nha, @Ma_NV, @ngay)
			DECLARE @luotxem as int
			SELECT @luotxem = Luot_Xem FROM Nha WHERE ID = @Ma_Nha
			WAITFOR DELAY '00:00:05'
			SET @luotxem = @luotxem + 1
			UPDATE Nha Set Luot_Xem = @luotxem WHERE ID = @Ma_Nha
			
		End Try
		Begin Catch
			Print 'Loi THEM LUOT XEM  trong L11'
			Rollback Transaction
			RETURN
		End Catch
	Commit Transaction
GO
/****** Object:  StoredProcedure [dbo].[L11_Fix]    Script Date: 5/11/2021 1:51:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[L11_Fix](@Ma_Nha as int, @Ma_KH as int, @Ma_NV as int, @ngay AS DATE)
As
	SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
	Begin Transaction
		IF NOT EXISTS(SELECT * FROM Nha WHERE ID = @Ma_Nha)
			BEGIN
				PRINT 'Nha khong ton tai'
				ROLLBACK TRANSACTION
				RETURN
			END
		IF NOT EXISTS(SELECT * FROM NhanVien WHERE ID = @Ma_NV)
			BEGIN
				PRINT 'Nhan vien khong ton tai'
				ROLLBACK TRANSACTION
				RETURN
			END
		IF NOT EXISTS(SELECT * FROM KhachHang WHERE ID = @Ma_KH)
			BEGIN
				PRINT 'Khach hang khong ton tai'
				ROLLBACK TRANSACTION
				RETURN
			END
		Begin Try
			INSERT INTO ChiTiet_XemNha (Ma_KH, Ma_Nha, MaNV, Ngay) VALUES(@Ma_KH, @Ma_Nha, @Ma_NV, @ngay)
			DECLARE @luotxem as int
			SELECT @luotxem = Luot_Xem FROM Nha WHERE ID = @Ma_Nha
			WAITFOR DELAY '00:00:05'
			SET @luotxem = @luotxem + 1
			UPDATE Nha Set Luot_Xem = @luotxem WHERE ID = @Ma_Nha
			
		End Try
		Begin Catch
			Print 'Loi THEM LUOT XEM  trong L11'
			Rollback Transaction
			RETURN
		End Catch
	Commit Transaction
GO
/****** Object:  StoredProcedure [dbo].[L12_Fix]    Script Date: 5/11/2021 1:51:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[L12_Fix](@Ma_Nha as int, @Ma_KH as int, @Ma_NV as int, @ngay AS DATE)
As
	SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
	Begin Transaction
		IF NOT EXISTS(SELECT * FROM Nha WHERE ID = @Ma_Nha)
			BEGIN
				PRINT 'Nha khong ton tai'
				ROLLBACK TRANSACTION
				RETURN
			END
		IF NOT EXISTS(SELECT * FROM NhanVien WHERE ID = @Ma_NV)
			BEGIN
				PRINT 'Nhan vien khong ton tai'
				ROLLBACK TRANSACTION
				RETURN
			END
		IF NOT EXISTS(SELECT * FROM KhachHang WHERE ID = @Ma_KH)
			BEGIN
				PRINT 'Khach hang khong ton tai'
				ROLLBACK TRANSACTION
				RETURN
			END
		Begin Try
			INSERT INTO ChiTiet_XemNha (Ma_KH, Ma_Nha, MaNV, Ngay) VALUES(@Ma_KH, @Ma_Nha, @Ma_NV, @ngay)
			DECLARE @luotxem as int
			SELECT @luotxem = Luot_Xem FROM Nha WHERE ID = @Ma_Nha
			SET @luotxem = @luotxem + 1
			UPDATE Nha Set Luot_Xem = @luotxem WHERE ID = @Ma_Nha
			
		End Try
		Begin Catch
			Print 'Loi THEM LUOT XEM  trong L11'
			Rollback Transaction
			RETURN
		End Catch
	Commit Transaction
GO
/****** Object:  StoredProcedure [dbo].[L21]    Script Date: 5/11/2021 1:51:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[L21](@QUAN as nvarchar(50))
As	
	SET TRANSACTION ISOLATION LEVEL READ COMMITTED
	Begin Transaction
		Begin Try
			UPDATE Nha SET Gia = 1.2*Gia WHERE Quan = @QUAN AND Dieu_Kien IS NULL
			WAITFOR DELAY '00:00:15'
			UPDATE Nha SET Gia = 1.05*Gia WHERE Gia > 3000 AND Dieu_Kien IS NULL
		End Try
		Begin Catch
			Print 'Loi CAP NHAT GIA trong L21'
			Rollback Transaction
			RETURN
		End Catch
	Commit Transaction
GO
/****** Object:  StoredProcedure [dbo].[L22]    Script Date: 5/11/2021 1:51:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[L22](@Ma_Nha as int, @gia as int)
As
	SET TRANSACTION ISOLATION LEVEL READ COMMITTED
	Begin Transaction
		
		If Not Exists (Select * From NHA Where ID = @Ma_Nha)
			Begin
				Print 'Nha khong ton tai'
				RollBack Transaction
			End
		
		Begin Try
			Declare @GiaCapNhat int
			Select @GiaCapNhat = Gia From Nha Where ID = @Ma_Nha
			PRINT @GiaCapNhat
			Update Nha Set Gia = @GiaCapNhat + @gia Where ID = @Ma_Nha
		
		End Try
		Begin Catch
			Print 'Loi update gia nha trong L22'
			Rollback Transaction
		End Catch

		Commit Transaction
GO
/****** Object:  StoredProcedure [dbo].[L31]    Script Date: 5/11/2021 1:51:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[L31](@Ma_Nha as int, @Ma_KH as int, @Ma_NV as int, @ngay AS DATE)
As
	Begin Transaction
		IF NOT EXISTS(SELECT * FROM Nha WHERE ID = @Ma_Nha)
			BEGIN
				PRINT 'Nha khong ton tai'
				ROLLBACK TRANSACTION
				RETURN
			END
		IF NOT EXISTS(SELECT * FROM NhanVien WHERE ID = @Ma_NV)
			BEGIN
				PRINT 'Nhan vien khong ton tai'
				ROLLBACK TRANSACTION
				RETURN
			END
		IF NOT EXISTS(SELECT * FROM KhachHang WHERE ID = @Ma_KH)
			BEGIN
				PRINT 'Khach hang khong ton tai'
				ROLLBACK TRANSACTION
				RETURN
			END
		Begin Try
			IF NOT EXISTS (SELECT * FROM ChiTiet_XemNha WHERE Ma_KH = @Ma_KH AND Ma_Nha = @Ma_Nha AND Ngay = @ngay)
				BEGIN
					WAITFOR DELAY '00:00:05'
					INSERT INTO ChiTiet_XemNha (Ma_KH, Ma_Nha, MaNV, Ngay) VALUES(@Ma_KH, @Ma_Nha, @Ma_NV, @ngay)
					UPDATE Nha Set Luot_Xem = Luot_Xem + 1 WHERE ID = @Ma_Nha
				END	
		End Try
		Begin Catch
			Print 'Loi THEM LUOT XEM  trong L31'
			SELECT ERROR_MESSAGE()
			Rollback Transaction
			RETURN
		End Catch
	Commit Transaction
GO
/****** Object:  StoredProcedure [dbo].[L31_Fix]    Script Date: 5/11/2021 1:51:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[L31_Fix](@Ma_Nha as int, @Ma_KH as int, @Ma_NV as int, @ngay AS DATE)
As
	SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
	Begin Transaction
		IF NOT EXISTS(SELECT * FROM Nha WHERE ID = @Ma_Nha)
			BEGIN
				PRINT 'Nha khong ton tai'
				ROLLBACK TRANSACTION
				RETURN
			END
		IF NOT EXISTS(SELECT * FROM NhanVien WHERE ID = @Ma_NV)
			BEGIN
				PRINT 'Nhan vien khong ton tai'
				ROLLBACK TRANSACTION
				RETURN
			END
		IF NOT EXISTS(SELECT * FROM KhachHang WHERE ID = @Ma_KH)
			BEGIN
				PRINT 'Khach hang khong ton tai'
				ROLLBACK TRANSACTION
				RETURN
			END
		Begin Try
			IF NOT EXISTS (SELECT * FROM ChiTiet_XemNha WHERE Ma_KH = @Ma_KH AND Ma_Nha = @Ma_Nha AND Ngay = @ngay)
				BEGIN
					WAITFOR DELAY '00:00:05'
					INSERT INTO ChiTiet_XemNha (Ma_KH, Ma_Nha, MaNV, Ngay) VALUES(@Ma_KH, @Ma_Nha, @Ma_NV, @ngay)
					UPDATE Nha Set Luot_Xem = Luot_Xem + 1 WHERE ID = @Ma_Nha
				END	
		End Try
		Begin Catch
			Print 'Loi THEM LUOT XEM  trong L31'
			SELECT ERROR_MESSAGE()
			Rollback Transaction
			RETURN
		End Catch
	Commit Transaction
GO
/****** Object:  StoredProcedure [dbo].[L32]    Script Date: 5/11/2021 1:51:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[L32](@Ma_Nha as int, @Ma_KH as int, @Ma_NV as int, @ngay AS DATE)
As
	Begin Transaction
		IF NOT EXISTS(SELECT * FROM Nha WHERE ID = @Ma_Nha)
			BEGIN
				PRINT 'Nha khong ton tai'
				ROLLBACK TRANSACTION
				RETURN
			END
		IF NOT EXISTS(SELECT * FROM NhanVien WHERE ID = @Ma_NV)
			BEGIN
				PRINT 'Nhan vien khong ton tai'
				ROLLBACK TRANSACTION
				RETURN
			END
		IF NOT EXISTS(SELECT * FROM KhachHang WHERE ID = @Ma_KH)
			BEGIN
				PRINT 'Khach hang khong ton tai'
				ROLLBACK TRANSACTION
				RETURN
			END
		Begin Try
			IF NOT EXISTS (SELECT * FROM ChiTiet_XemNha WHERE Ma_KH = @Ma_KH AND Ma_Nha = @Ma_Nha AND Ngay = @ngay)
				BEGIN
					INSERT INTO ChiTiet_XemNha (Ma_KH, Ma_Nha, MaNV, Ngay) VALUES(@Ma_KH, @Ma_Nha, @Ma_NV, @ngay)
					UPDATE Nha Set Luot_Xem = Luot_Xem + 1 WHERE ID = @Ma_Nha
				END	
		End Try
		Begin Catch
			Print 'Loi THEM LUOT XEM  trong L31'
			Rollback Transaction
			RETURN
		End Catch
	Commit Transaction
GO
/****** Object:  StoredProcedure [dbo].[L32_Fix]    Script Date: 5/11/2021 1:51:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[L32_Fix](@Ma_Nha as int, @Ma_KH as int, @Ma_NV as int, @ngay AS DATE)
As
	SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
	Begin Transaction
		IF NOT EXISTS(SELECT * FROM Nha WHERE ID = @Ma_Nha)
			BEGIN
				PRINT 'Nha khong ton tai'
				ROLLBACK TRANSACTION
				RETURN
			END
		IF NOT EXISTS(SELECT * FROM NhanVien WHERE ID = @Ma_NV)
			BEGIN
				PRINT 'Nhan vien khong ton tai'
				ROLLBACK TRANSACTION
				RETURN
			END
		IF NOT EXISTS(SELECT * FROM KhachHang WHERE ID = @Ma_KH)
			BEGIN
				PRINT 'Khach hang khong ton tai'
				ROLLBACK TRANSACTION
				RETURN
			END
		Begin Try
			IF NOT EXISTS (SELECT * FROM ChiTiet_XemNha WHERE Ma_KH = @Ma_KH AND Ma_Nha = @Ma_Nha AND Ngay = @ngay)
				BEGIN
					INSERT INTO ChiTiet_XemNha (Ma_KH, Ma_Nha, MaNV, Ngay) VALUES(@Ma_KH, @Ma_Nha, @Ma_NV, @ngay)
					UPDATE Nha Set Luot_Xem = Luot_Xem + 1 WHERE ID = @Ma_Nha
				END	
		End Try
		Begin Catch
			Print 'Loi THEM LUOT XEM  trong L31'
			Rollback Transaction
			RETURN
		End Catch
	Commit Transaction
GO
/****** Object:  StoredProcedure [dbo].[P11]    Script Date: 5/11/2021 1:51:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[P11](@Ma_Nha as int, @Ma_NV_Cu as int, @Ma_NV_Moi as int)
As
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
	Begin Transaction	
		Begin Try
			DECLARE @MaNV as int
			SELECT @MaNV = Ma_NV FROM Nha WHERE ID = @Ma_Nha
			--WAITFOR DELAY '00:00:05'
			IF(@MaNV = @Ma_NV_Cu)
				BEGIN
					PRINT SYSDATETIME()
					UPDATE Nha SET Ma_NV = @Ma_NV_Moi WHERE ID = @Ma_Nha
					PRINT 'UPDATE MA NV 2 TRONG BANG NHA'
					WAITFOR DELAY '00:00:08'
					PRINT SYSDATETIME()
					PRINT 'UPDATE MA NV 2 TRONG BANG CTXN'
				END
		End Try
		Begin Catch
			Print 'Loi UPDATE nha trong P11'
			Rollback Transaction
			RETURN
		End Catch
		UPDATE ChiTiet_XemNha SET MaNV = @Ma_NV_Moi WHERE Ma_Nha = @Ma_Nha and Ngay > GETDATE()
	Commit Transaction
GO
/****** Object:  StoredProcedure [dbo].[P11_Fix]    Script Date: 5/11/2021 1:51:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[P11_Fix](@from as int, @to as int)
As
	SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
	Begin Transaction		
		Begin Try
			SELECT COUNT(*) AS SoLuongNha From Nha WHERE Gia >= @from AND Gia <= @to
			WAITFOR DELAY '00:00:05'
			SELECT * FROM Nha WHERE Gia >= @from AND Gia <= @to
		End Try
		Begin Catch
			Print 'Loi tim nha trong P12'
			Rollback Transaction
			RETURN
		End Catch
	Commit Transaction
GO
/****** Object:  StoredProcedure [dbo].[P12]    Script Date: 5/11/2021 1:51:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[P12](@Ma_Nha as int, @Ma_NV_Cu as int, @Ma_NV_Moi as int)
As
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
	Begin Transaction		
		Begin Try
			DECLARE @MaNV as int
			SELECT @MaNV = Ma_NV FROM Nha WHERE ID = @Ma_Nha
			IF(@MaNV = @Ma_NV_Cu)
				WAITFOR DELAY '00:00:03'
				BEGIN
					UPDATE Nha SET Ma_NV = @Ma_NV_Moi WHERE ID = @Ma_Nha
					UPDATE ChiTiet_XemNha SET MaNV = @Ma_NV_Moi WHERE Ma_Nha = @Ma_Nha and Ngay > GETDATE()
					WAITFOR DELAY '00:00:08'
				END
		End Try
		Begin Catch
			Print 'Loi UPDATE nha trong P12'
			Rollback Transaction
			RETURN
		End Catch
	Commit Transaction
GO
/****** Object:  StoredProcedure [dbo].[P12_Fix]    Script Date: 5/11/2021 1:51:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[P12_Fix](@id as int, @Duong as nvarchar, @Quan as nvarchar, @Thanh_Pho as nvarchar, @So_Phong as int, @Ma_Loai as int, @Ma_CSH as int, @Ngay_Het_Han as date, @Dieu_Kien as nvarchar, @Gia as int)
As
	IF EXISTS(SELECT * FROM Nha WHERE ID = @id)
		BEGIN
			DELETE FROM Nha WHERE ID = @id
		END
	Begin Transaction		
		Begin Try
			INSERT INTO Nha (ID, Duong, Quan, Thanh_Pho, So_Phong, Ma_Loai, Ma_CSH, Ngay_Dang, Ngay_het_han, Dieu_Kien, Gia, Tinh_Trang) 
			VALUES(@id, @Duong, @Quan, @Thanh_Pho, @So_Phong, @Ma_Loai, @Ma_CSH, GETDATE(), @Ngay_Het_Han, @Dieu_Kien, @Gia, N'CÒN TRỐNG')
		End Try
		Begin Catch
			SELECT ERROR_MESSAGE() As ErrorMessage
			Rollback Transaction
			RETURN
		End Catch
	Commit Transaction
GO
/****** Object:  StoredProcedure [dbo].[P21_Fix]    Script Date: 5/11/2021 1:51:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[P21_Fix]
As
	SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
	Begin Transaction		
		Begin Try
			DECLARE @MaNV as int
			SELECT * From Nha
			SELECT * From Nha WHERE Ma_NV IS NULL
			SELECT TOP 1 @MaNV = ID FROM NhanVien WHERE Dia_Chi = N'Quan 3'
			WAITFOR DELAY '00:00:05'
			UPDATE Nha SET Ma_NV = @MaNV WHERE Ma_NV IS NULL
			SELECT * FROM Nha
		End Try
		Begin Catch
			Print 'Loi tim nha trong P21'
			Rollback Transaction
			RETURN
		End Catch
	Commit Transaction
GO
/****** Object:  StoredProcedure [dbo].[P22_Fix]    Script Date: 5/11/2021 1:51:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[P22_Fix](@id as int, @Duong as nvarchar(50), @Quan as nvarchar(50), @Thanh_Pho as nvarchar(50), @So_Phong as int, @Ma_Loai as int, @Ma_CSH as int, @Ngay_Het_Han as date, @Dieu_Kien nvarchar(50), @Gia as int)
As
	IF EXISTS(SELECT * FROM Nha WHERE ID = @id)
		BEGIN
			DELETE FROM Nha WHERE ID = @id
		END
	Begin Transaction		
		Begin Try
			INSERT INTO Nha (ID, Duong, Quan, Thanh_Pho, So_Phong, Ma_Loai, Ma_CSH, Ngay_Dang, Ngay_het_han, Dieu_Kien, Gia, Tinh_Trang) 
			VALUES(@id, @Duong, @Quan, @Thanh_Pho, @So_Phong, @Ma_Loai, @Ma_CSH, GETDATE(), @Ngay_Het_Han, @Dieu_Kien, @Gia, N'CÒN TRỐNG')
		End Try
		Begin Catch
			SELECT ERROR_MESSAGE() As ErrorMessage
			Rollback Transaction
			RETURN
		End Catch
	Commit Transaction
GO
/****** Object:  StoredProcedure [dbo].[P31]    Script Date: 5/11/2021 1:51:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[P31]
As
	Begin Transaction		
		Begin Try
			DECLARE @MaNV as int
			SELECT ID, Ho_Ten, Dien_Thoai, Da_Lien_He From KhachHang WHERE TieuChi_SoPhong = 3 AND TieuChi_Quan = N'Quan 1'
			WAITFOR DELAY '00:00:05'
			UPDATE KhachHang SET Da_Lien_He = 1 WHERE TieuChi_SoPhong = 3 AND TieuChi_Quan = N'Quan 1'
			SELECT ID, Ho_Ten, Dien_Thoai, Da_Lien_He FROM KhachHang WHERE TieuChi_SoPhong = 3 AND TieuChi_Quan = N'Quan 1'
		End Try
		Begin Catch
			Print 'Loi tim nha trong P31'
			Rollback Transaction
			RETURN
		End Catch
	Commit Transaction
GO
/****** Object:  StoredProcedure [dbo].[P31_Fix]    Script Date: 5/11/2021 1:51:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[P31_Fix]
As
	SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
	Begin Transaction		
		Begin Try
			DECLARE @MaNV as int
			SELECT ID, Ho_Ten, Dien_Thoai, Da_Lien_He From KhachHang WHERE TieuChi_SoPhong = 3 AND TieuChi_Quan = N'Quan 1'
			WAITFOR DELAY '00:00:05'
			UPDATE KhachHang SET Da_Lien_He = 1 WHERE TieuChi_SoPhong = 3 AND TieuChi_Quan = N'Quan 1'
			SELECT ID, Ho_Ten, Dien_Thoai, Da_Lien_He FROM KhachHang WHERE TieuChi_SoPhong = 3 AND TieuChi_Quan = N'Quan 1'
		End Try
		Begin Catch
			Print 'Loi tim nha trong P31'
			Rollback Transaction
			RETURN
		End Catch
	Commit Transaction
GO
/****** Object:  StoredProcedure [dbo].[P32]    Script Date: 5/11/2021 1:51:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[P32](@id as int, @HoTen as nvarchar(50), @DiaChi as nvarchar(50), @DienThoai as char(10), @So_Phong as int, @Duong as nvarchar(50), @Quan as nvarchar(50), @ThanhPho as nvarchar(50), @nhuCau as bit)
As
	IF EXISTS(SELECT * FROM KhachHang WHERE ID = @id)
		BEGIN
			DELETE FROM KhachHang WHERE ID = @id
		END
	Begin Transaction		
		Begin Try
			INSERT INTO KhachHang(ID, Ho_Ten, Dia_Chi, Dien_Thoai, TieuChi_SoPhong, TieuChi_Duong, TieuChi_Quan, TieuChi_ThanhPhi, Thue_Mua, Da_Lien_He)
			VALUES(@id, @HoTen, @DiaChi, @DienThoai, @So_Phong, @Duong, @Quan, @ThanhPho, @nhuCau, 0)
		End Try
		Begin Catch
			SELECT ERROR_MESSAGE() As ErrorMessage
			Rollback Transaction
			RETURN
		End Catch
	Commit Transaction
GO
/****** Object:  StoredProcedure [dbo].[P32_Fix]    Script Date: 5/11/2021 1:51:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[P32_Fix](@id as int, @HoTen as nvarchar(50), @DiaChi as nvarchar(50), @DienThoai as char(10), @So_Phong as int, @Duong as nvarchar(50), @Quan as nvarchar(50), @ThanhPho as nvarchar(50), @nhuCau as bit)
As
	IF EXISTS(SELECT * FROM KhachHang WHERE ID = @id)
		BEGIN
			DELETE FROM KhachHang WHERE ID = @id
		END
	Begin Transaction		
		Begin Try
			INSERT INTO KhachHang(ID, Ho_Ten, Dia_Chi, Dien_Thoai, TieuChi_SoPhong, TieuChi_Duong, TieuChi_Quan, TieuChi_ThanhPhi, Thue_Mua, Da_Lien_He)
			VALUES(@id, @HoTen, @DiaChi, @DienThoai, @So_Phong, @Duong, @Quan, @ThanhPho, @nhuCau, 0)
		End Try
		Begin Catch
			SELECT ERROR_MESSAGE() As ErrorMessage
			Rollback Transaction
			RETURN
		End Catch
	Commit Transaction
GO
/****** Object:  StoredProcedure [dbo].[T11]    Script Date: 5/11/2021 1:51:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[T11](@id as int, @GiaMoi as int)
As
	Begin Transaction
		If Not Exists (Select * From NHA Where ID = @id)
			Begin
				Print 'Nha khong ton tai'
				RollBack Transaction
			End
		Update Nha Set Gia = @GiaMoi Where ID = @id
		Waitfor Delay '00:00:05'
		Rollback Transaction
GO
/****** Object:  StoredProcedure [dbo].[T11_Fix]    Script Date: 5/11/2021 1:51:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[T11_Fix](@id as int, @GiaMoi as int)
As
	Begin Transaction
		If Not Exists (Select * From NHA Where ID = @id)
			Begin
				Print 'Nha khong ton tai'
				RollBack Transaction
			End
		Update Nha Set Gia = @GiaMoi Where ID = @id
		Waitfor Delay '00:00:05'
		Rollback Transaction
GO
/****** Object:  StoredProcedure [dbo].[T12]    Script Date: 5/11/2021 1:51:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[T12](@id as int)
AS
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
	Begin Transaction
		Declare @gia int
		Begin Try
			Select @gia = Nha.Gia From Nha Where Nha.ID = @id
			Select @gia As 'GiaNha04'
		End Try
		Begin Catch
			Print 'Loi update gia nha trong T12'
			Rollback Transaction
		End Catch
		Commit
		return @gia
GO
/****** Object:  StoredProcedure [dbo].[T12_Fix]    Script Date: 5/11/2021 1:51:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[T12_Fix](@id as int)
AS
	Begin Transaction
		Declare @gia int
		Begin Try
			SET TRANSACTION ISOLATION LEVEL READ COMMITTED
			Select  @gia = Gia From Nha Where ID = @id
			Select @gia As 'GiaNha04'
		End Try
		Begin Catch
			Print 'Loi update gia nha trong T12_Fix'
			Rollback Transaction
		End Catch
		Commit Transaction

		return @gia
GO
/****** Object:  StoredProcedure [dbo].[T21]    Script Date: 5/11/2021 1:51:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[T21](@id as int)
AS
	Begin Transaction
		If Not Exists (Select * From Nha Where ID = @id)
			Begin
				Print 'Nha khong ton tai'
				RollBack Transaction
			End
		DELETE FROM Nha WHERE ID = @id
		Waitfor Delay '00:00:05'
		Rollback Transaction
GO
/****** Object:  StoredProcedure [dbo].[T21_Fix]    Script Date: 5/11/2021 1:51:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[T21_Fix](@id as int)
AS
	SET TRANSACTION ISOLATION LEVEL READ COMMITTED
	Begin Transaction
		If Not Exists (Select * From Nha Where ID = @id)
			Begin
				Print 'Nha khong ton tai'
				RollBack Transaction
			End
		DELETE FROM Nha WHERE ID = @id
		Waitfor Delay '00:00:05'
		Rollback Transaction
GO
/****** Object:  StoredProcedure [dbo].[T22]    Script Date: 5/11/2021 1:51:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[T22]
AS
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
	BEGIN TRANSACTION
		SELECT * FROM Nha
		Commit
GO
/****** Object:  StoredProcedure [dbo].[T22_Fix]    Script Date: 5/11/2021 1:51:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[T22_Fix]
AS
	BEGIN TRANSACTION
		SELECT * FROM Nha
		Commit
GO
/****** Object:  StoredProcedure [dbo].[T31]    Script Date: 5/11/2021 1:51:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[T31](@MaNha as int, @MaKH as int, @MaNV as int, @loai as int)
AS
BEGIN
	BEGIN TRANSACTION
		UPDATE Nha SET Tinh_Trang = N'ĐÃ BÁN' WHERE ID = @MaNha
		UPDATE Nha SET Ma_CSH = @MaKH WHERE ID = @MaNha
		Waitfor Delay '00:00:05'
		IF NOT EXISTS(SELECT * FROM Nha Where ID = @MaNha)
			BEGIN
				Print 'Nha khong ton tai'
				ROLLBACK TRANSACTION
				RETURN
			END
		IF NOT EXISTS(SELECT * FROM KhachHang Where ID = @MaKH)
			BEGIN
				Print 'Khach hang khong ton tai'
				ROLLBACK TRANSACTION
				RETURN
			END
		IF NOT EXISTS(SELECT * FROM NhanVien Where ID = @MaNV)
			BEGIN
				Print 'Nhan vien khong ton tai'
				ROLLBACK TRANSACTION
				RETURN
			END
		IF EXISTS(SELECT * From ChiTiet_HopDong WHERE Ma_Nha = @MaNha AND Loai_HopDong = 1 AND NgayHetHan > GETDATE())
			BEGIN
				PRINT 'Hop dong cho thue truoc chua het han'
				ROLLBACK TRANSACTION
				RETURN
			END
		BEGIN TRY
			INSERT INTO ChiTiet_HopDong(Ma_Nha, Ma_NhanVien, Ma_KhachHang, Loai_HopDong, NgayLap) VALUES(@MaNha, @MaNV, @MaKH, 0, GETDATE())
		END TRY
		BEGIN CATCH
			SELECT ERROR_MESSAGE() AS ErrorMessage
			ROLLBACK TRANSACTION
			RETURN
		END CATCH
	COMMIT TRANSACTION
END
GO
/****** Object:  StoredProcedure [dbo].[T31_Fix]    Script Date: 5/11/2021 1:51:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[T31_Fix](@MaNha as int, @MaKH as int, @MaNV as int, @loai as int)
AS
BEGIN
	BEGIN TRANSACTION
		UPDATE Nha SET Tinh_Trang = N'ĐÃ BÁN' WHERE ID = @MaNha
		UPDATE Nha SET Ma_CSH = @MaKH WHERE ID = @MaNha
		Waitfor Delay '00:00:05'
		IF NOT EXISTS(SELECT * FROM Nha Where ID = @MaNha)
			BEGIN
				Print 'Nha khong ton tai'
				ROLLBACK TRANSACTION
				RETURN
			END
		IF NOT EXISTS(SELECT * FROM KhachHang Where ID = @MaKH)
			BEGIN
				Print 'Khach hang khong ton tai'
				ROLLBACK TRANSACTION
				RETURN
			END
		IF NOT EXISTS(SELECT * FROM NhanVien Where ID = @MaNV)
			BEGIN
				Print 'Nhan vien khong ton tai'
				ROLLBACK TRANSACTION
				RETURN
			END
		IF EXISTS(SELECT * From ChiTiet_HopDong WHERE Ma_Nha = @MaNha AND Loai_HopDong = 1 AND NgayHetHan > GETDATE())
			BEGIN
				PRINT 'Hop dong cho thue truoc chua het han'
				ROLLBACK TRANSACTION
				RETURN
			END
		BEGIN TRY
			INSERT INTO ChiTiet_HopDong(Ma_Nha, Ma_NhanVien, Ma_KhachHang, Loai_HopDong, NgayLap) VALUES(@MaNha, @MaNV, @MaKH, 0, GETDATE())
		END TRY
		BEGIN CATCH
			SELECT ERROR_MESSAGE() AS ErrorMessage
			ROLLBACK TRANSACTION
			RETURN
		END CATCH
	COMMIT TRANSACTION
END
GO
/****** Object:  StoredProcedure [dbo].[T32]    Script Date: 5/11/2021 1:51:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[T32](@MaNha as int)
AS
BEGIN
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
	BEGIN TRANSACTION
		SELECT * FROM Nha Where ID = @MaNha
	COMMIT TRANSACTION
END
GO
/****** Object:  StoredProcedure [dbo].[T32_Fix]    Script Date: 5/11/2021 1:51:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[T32_Fix](@MaNha as int)
AS
BEGIN
	SET TRANSACTION ISOLATION LEVEL READ COMMITTED
	BEGIN TRANSACTION
		SELECT * FROM Nha Where ID = @MaNha
	COMMIT TRANSACTION
END
GO
/****** Object:  StoredProcedure [dbo].[U11]    Script Date: 5/11/2021 1:51:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[U11]
AS
	SET TRANSACTION ISOLATION LEVEL READ COMMITTED
	BEGIN TRANSACTION
		BEGIN TRY
			DECLARE @min as int
			SELECT @min = MIN(Gia) FROM Nha WHERE Nha.Dieu_Kien IS NULL
			SELECT @min AS GiaThapNhat
			WAITFOR DELAY '00:00:05'
			SELECT * FROM Nha Where Gia = @min AND Nha.Dieu_Kien IS NULL
		END TRY
		BEGIN CATCH
			print 'Loi Tim Kiem Nha Thue Re Nhat'
			Rollback Transaction
		END CATCH
	COMMIT TRANSACTION
GO
/****** Object:  StoredProcedure [dbo].[U11_Fix]    Script Date: 5/11/2021 1:51:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[U11_Fix]
AS
	SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
	BEGIN TRANSACTION
		BEGIN TRY
			DECLARE @min as int
			SELECT @min = MIN(Gia) FROM Nha WHERE Nha.Dieu_Kien IS NULL
			SELECT @min AS GiaThapNhat
			WAITFOR DELAY '00:00:05'
			SELECT * FROM Nha Where Gia = @min AND Nha.Dieu_Kien IS NULL
		END TRY
		BEGIN CATCH
			print 'Loi Tim Kiem Nha Thue Re Nhat'
			Rollback Transaction
		END CATCH
	COMMIT TRANSACTION
GO
/****** Object:  StoredProcedure [dbo].[U12]    Script Date: 5/11/2021 1:51:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[U12](@gia as int)
As
	Begin Transaction		
		Begin Try
			Update Nha Set Gia = Gia + @gia
		End Try
		Begin Catch
			Print 'Loi update gia nha trong U12'
			Rollback Transaction
			RETURN
		End Catch
	Commit Transaction
GO
/****** Object:  StoredProcedure [dbo].[U12_Fix]    Script Date: 5/11/2021 1:51:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[U12_Fix](@gia as int)
As
	Begin Transaction		
		Begin Try
			Update Nha Set Gia = Gia + @gia
		End Try
		Begin Catch
			Print 'Loi update gia nha trong tangGiaNha_1'
			Rollback Transaction
		End Catch
	Commit Transaction
GO
/****** Object:  StoredProcedure [dbo].[U21]    Script Date: 5/11/2021 1:51:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[U21](@from as int, @to as int)
AS
	Update Nha Set Gia = 2000 Where ID = 6
	SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
	BEGIN TRANSACTION
		BEGIN TRY
			SELECT COUNT(*) AS So_luong FROM Nha Where Gia >= @from AND Gia <= @to
			WAITFOR DELAY '00:00:05'
			SELECT * FROM Nha Where Gia >= @from AND Gia <= @to
		END TRY
		BEGIN CATCH
			print 'Loi tim kiem nha'
			Rollback Transaction
		END CATCH
	COMMIT TRANSACTION
GO
/****** Object:  StoredProcedure [dbo].[U22]    Script Date: 5/11/2021 1:51:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[U22](@id as int, @gia as int)
As
	Begin Transaction
		If Not Exists (Select * From NHA Where ID = @id)
			Begin
				Print 'Nha khong ton tai'
				RollBack Transaction
			End
		
		Begin Try
			Update Nha Set Gia = @gia Where ID = @id
		
		End Try
		Begin Catch
			Print 'Loi update gia nha'
			Rollback Transaction
		End Catch

		Commit Transaction
GO
/****** Object:  StoredProcedure [dbo].[U31]    Script Date: 5/11/2021 1:51:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[U31]
AS
	SET TRANSACTION ISOLATION LEVEL READ COMMITTED
	Update Nha Set Duong = N'Dinh Tien Hoang' Where ID = 2 OR ID = 3
	Update Nha Set Quan = N'Quan Binh Thanh' Where ID = 2 OR ID = 3
	BEGIN TRANSACTION
		BEGIN TRY
			SELECT * FROM Nha Where Duong = N'Dinh Tien Hoang' AND Quan = N'Quan Binh Thanh'
			WAITFOR DELAY '00:00:10'
			UPDATE Nha SET Duong = N'Le Van Duyet' Where Duong = N'Dinh Tien Hoang' AND Quan = N'Quan Binh Thanh'
			SELECT * FROM Nha WHERE Duong = N'Le Van Duyet' AND Quan = N'Quan Binh Thanh'
		END TRY
		BEGIN CATCH
			print 'Loi tim kiem nha'
			Rollback Transaction
		END CATCH
	COMMIT TRANSACTION
GO
/****** Object:  StoredProcedure [dbo].[U31_Fix]    Script Date: 5/11/2021 1:51:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[U31_Fix]
AS
	SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
	Update Nha Set Duong = N'Dinh Tien Hoang' Where ID = 2 OR ID = 3
	Update Nha Set Quan = N'Quan Binh Thanh' Where ID = 2 OR ID = 3
	BEGIN TRANSACTION
		BEGIN TRY
			SELECT * FROM Nha Where Duong = N'Dinh Tien Hoang' AND Quan = N'Quan Binh Thanh'
			WAITFOR DELAY '00:00:10'
			UPDATE Nha SET Duong = N'Le Van Duyet' Where Duong = N'Dinh Tien Hoang' AND Quan = N'Quan Binh Thanh'
			SELECT * FROM Nha WHERE Duong = N'Le Van Duyet' AND Quan = N'Quan Binh Thanh'
		END TRY
		BEGIN CATCH
			print 'Loi tim kiem nha'
			Rollback Transaction
		END CATCH
	COMMIT TRANSACTION
GO
/****** Object:  StoredProcedure [dbo].[U32]    Script Date: 5/11/2021 1:51:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[U32](@id as int)
As

	Begin Transaction
		If Not Exists (Select * From NHA Where ID = @id)
			Begin
				Print 'Nha khong ton tai'
				RollBack Transaction
			End
		Update Nha Set Duong = N'Dinh Tien Hoang' Where ID = @id
		Update Nha Set Quan = N'Quan 1' Where ID = @id
		

		Commit Transaction
GO
/****** Object:  StoredProcedure [dbo].[U32_Fix]    Script Date: 5/11/2021 1:51:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[U32_Fix](@id as int)
As

	Begin Transaction
		If Not Exists (Select * From NHA Where ID = @id)
			Begin
				Print 'Nha khong ton tai'
				RollBack Transaction
			End
		Update Nha Set Duong = N'Dinh Tien Hoang' Where ID = @id
		Update Nha Set Quan = N'Quan 1' Where ID = @id
		

		Commit Transaction
GO
USE [master]
GO
ALTER DATABASE [QuanLyNha] SET  READ_WRITE 
GO
