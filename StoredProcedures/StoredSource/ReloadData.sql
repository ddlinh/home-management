
USE QuanLyNha
GO

IF OBJECT_ID(N'ReloadData') IS NOT NULL
	DROP PROCEDURE ReloadData
GO

CREATE PROCEDURE ReloadData
AS
BEGIN
	--delete all database
	EXEC sp_MSForEachTable 'ALTER TABLE ? NOCHECK CONSTRAINT ALL'
	EXEC sp_MSForEachTable 'DELETE FROM ?'
	EXEC sp_MSForEachTable 'ALTER TABLE ? WITH CHECK CHECK CONSTRAINT ALL'
	--insert database
	INSERT [dbo].[ChiNhanh] ([ID], [Duong], [Khu_Vuc], [Thanh_Pho], [SDT], [Fax]) VALUES (1, N'Le Duc Tho', N'Go Vap', N'TP.HCM', NULL, NULL)
	INSERT [dbo].[ChiNhanh] ([ID], [Duong], [Khu_Vuc], [Thanh_Pho], [SDT], [Fax]) VALUES (2, N'Duong Ba Trac', N'Quan 8', N'TP.HCM', NULL, NULL)
	INSERT [dbo].[ChiNhanh] ([ID], [Duong], [Khu_Vuc], [Thanh_Pho], [SDT], [Fax]) VALUES (3, N'Dinh Tien Hoang', N'Quan Binh Thanh', N'TP.HCM', NULL, NULL)
	INSERT [dbo].[ChiNhanh] ([ID], [Duong], [Khu_Vuc], [Thanh_Pho], [SDT], [Fax]) VALUES (4, N'Nguyen Van Cu', N'Quan 5', N'TP.HCM', NULL, NULL)
	INSERT [dbo].[KhachHang] ([ID], [Ho_Ten], [Dia_Chi], [Dien_Thoai], [TieuChi_SoPhong], [TieuChi_Gia_Min], [TieuChi_Gia_Max], [TieuChi_KhuVuc], [TieuChi_Duong], [TieuChi_Quan], [TieuChi_ThanhPhi], [Thue_Mua], [Da_Lien_He], [Ma_Chi_Nhanh]) VALUES (1, N'Nguyen Minh Tuan', N'125 Nguyen Trai', N'0913853349', 3, 1000, 5000, N'An ninh', N'Tran Hung Dao', N'Quan 1', N'HCM', 1, 1, 1)
	INSERT [dbo].[KhachHang] ([ID], [Ho_Ten], [Dia_Chi], [Dien_Thoai], [TieuChi_SoPhong], [TieuChi_Gia_Min], [TieuChi_Gia_Max], [TieuChi_KhuVuc], [TieuChi_Duong], [TieuChi_Quan], [TieuChi_ThanhPhi], [Thue_Mua], [Da_Lien_He], [Ma_Chi_Nhanh]) VALUES (2, N'Dang Anh Thu', N'230/34 Thanh Thai', N'0834023202', 2, 500, 2000, N'Gan benh vien', N'Nguyen Thuong Hien', N'Quan 3', N'HCM', 0, 1, 2)
	INSERT [dbo].[KhachHang] ([ID], [Ho_Ten], [Dia_Chi], [Dien_Thoai], [TieuChi_SoPhong], [TieuChi_Gia_Min], [TieuChi_Gia_Max], [TieuChi_KhuVuc], [TieuChi_Duong], [TieuChi_Quan], [TieuChi_ThanhPhi], [Thue_Mua], [Da_Lien_He], [Ma_Chi_Nhanh]) VALUES (3, N'Le Ngoc Minh Trang', N'300/3 Dang Van Ngu', N'0909120230', 3, 6000, 10000, N'Cao cap', N'Nguyen Van Cu', N'Quan 1', N'HCM', 1, 1, 1)
	INSERT [dbo].[KhachHang] ([ID], [Ho_Ten], [Dia_Chi], [Dien_Thoai], [TieuChi_SoPhong], [TieuChi_Gia_Min], [TieuChi_Gia_Max], [TieuChi_KhuVuc], [TieuChi_Duong], [TieuChi_Quan], [TieuChi_ThanhPhi], [Thue_Mua], [Da_Lien_He], [Ma_Chi_Nhanh]) VALUES (4, N'Le Minh Khoi', N'120/47 Hai Ba Trung', N'0232032002', 1, 500, 1000, N'Khong co', N'Doan Van Bo', N'Quan 4', N'HCM', 1, 1, 3)
	INSERT [dbo].[KhachHang] ([ID], [Ho_Ten], [Dia_Chi], [Dien_Thoai], [TieuChi_SoPhong], [TieuChi_Gia_Min], [TieuChi_Gia_Max], [TieuChi_KhuVuc], [TieuChi_Duong], [TieuChi_Quan], [TieuChi_ThanhPhi], [Thue_Mua], [Da_Lien_He], [Ma_Chi_Nhanh]) VALUES (5, N'Tran Ngoc Mai', N'Quan 7', N'0933181232', 3, NULL, NULL, NULL, N'Hai Ba Trung', N'Quan 1', N'TP.HCM', 1, 0, NULL)
	INSERT [dbo].[NhanVien] ([ID], [Ho_Ten], [Gioi_Tinh], [Dia_Chi], [SDT], [Ngay_Sinh], [Luong], [Ma_Chi_Nhanh]) VALUES (1, N'Mai Hong Ngoc', 1, N'Quan Phu Nhuan', N'0933222111', CAST(N'1997-02-03' AS Date), 3000000, 3)
	INSERT [dbo].[NhanVien] ([ID], [Ho_Ten], [Gioi_Tinh], [Dia_Chi], [SDT], [Ngay_Sinh], [Luong], [Ma_Chi_Nhanh]) VALUES (2, N'Nguyen Phuoc Thinh', 0, N'Quan 8', N'0988777666', CAST(N'1995-08-09' AS Date), 3000000, 2)
	INSERT [dbo].[NhanVien] ([ID], [Ho_Ten], [Gioi_Tinh], [Dia_Chi], [SDT], [Ngay_Sinh], [Luong], [Ma_Chi_Nhanh]) VALUES (3, N'Huynh Tran Thanh', 0, N'Quan 1', N'0956464373', CAST(N'1992-08-05' AS Date), 3000000, 4)
	INSERT [dbo].[NhanVien] ([ID], [Ho_Ten], [Gioi_Tinh], [Dia_Chi], [SDT], [Ngay_Sinh], [Luong], [Ma_Chi_Nhanh]) VALUES (4, N'Esther Luu', 1, N'Quan Go Vap', N'0987654321', CAST(N'1994-07-02' AS Date), 3000000, 1)
	INSERT [dbo].[NhanVien] ([ID], [Ho_Ten], [Gioi_Tinh], [Dia_Chi], [SDT], [Ngay_Sinh], [Luong], [Ma_Chi_Nhanh]) VALUES (5, N'Thieu Bao Tram', 1, N'Quan 3', N'0983747572', CAST(N'1993-08-08' AS Date), 3000000, 4)
	INSERT [dbo].[ChuSoHuu] ([ID], [Ho_Ten], [Dia_Chi], [SDT]) VALUES (1, N'Nguyen Minh Phuong', N'Quan 3', N'0944353466')
	INSERT [dbo].[ChuSoHuu] ([ID], [Ho_Ten], [Dia_Chi], [SDT]) VALUES (2, N'Vo Ha Tram', N'Quan Binh Thanh', N'0985332187')
	INSERT [dbo].[ChuSoHuu] ([ID], [Ho_Ten], [Dia_Chi], [SDT]) VALUES (3, N'Nguyen Vu', N'Quan 12', N'0947588233')
	INSERT [dbo].[ChuSoHuu] ([ID], [Ho_Ten], [Dia_Chi], [SDT]) VALUES (4, N'Tran Bao Chau', N'Quan Go Vap', N'0944857273')
	INSERT [dbo].[ChuSoHuu] ([ID], [Ho_Ten], [Dia_Chi], [SDT]) VALUES (5, N'Vu Hong My', N'Quan 5', N'0938172444')
	INSERT [dbo].[ChuSoHuu] ([ID], [Ho_Ten], [Dia_Chi], [SDT]) VALUES (6, N'Tran Binh Toan', N'Quan 2', N'0933812444')
	INSERT [dbo].[LoaiNha] ([ID], [Ten]) VALUES (1, N'Căn hộ chung cư')
	INSERT [dbo].[LoaiNha] ([ID], [Ten]) VALUES (2, N'Nhà riêng')
	INSERT [dbo].[LoaiNha] ([ID], [Ten]) VALUES (3, N'Villa, Biệt thự')
	INSERT [dbo].[LoaiNha] ([ID], [Ten]) VALUES (4, N'Căn hộ cho thuê')
	INSERT [dbo].[LoaiNha] ([ID], [Ten]) VALUES (5, N'Nhà trọ, Phòng trọ')
	INSERT [dbo].[LoaiNha] ([ID], [Ten]) VALUES (6, N'Văn phòng')
	INSERT [dbo].[Nha] ([ID], [Khu_Vuc], [Duong], [Quan], [Thanh_Pho], [So_Phong], [Ma_Loai], [Ma_NV], [Ma_CSH], [Ngay_Dang], [Ngay_het_han], [Dieu_Kien], [Gia], [Tinh_Trang], [Luot_Xem]) VALUES (1, NULL, N'Nguyen Van Troi', N'Quan 3', N'TP.HCM', 4, 1, 1, 4, CAST(N'2021-04-08' AS Date), CAST(N'2021-06-08' AS Date), N'Không nuôi thú cưng', 900000, N'CÒN TRỐNG', 0)
	INSERT [dbo].[Nha] ([ID], [Khu_Vuc], [Duong], [Quan], [Thanh_Pho], [So_Phong], [Ma_Loai], [Ma_NV], [Ma_CSH], [Ngay_Dang], [Ngay_het_han], [Dieu_Kien], [Gia], [Tinh_Trang], [Luot_Xem]) VALUES (2, NULL, N'Dinh Tien Hoang', N'Quan 1', N'TP.HCM', 3, 2, 1, 2, CAST(N'2021-02-05' AS Date), CAST(N'2021-02-09' AS Date), N'Hộ khẩu thành phố', 8000000, N'CÒN TRỐNG', 0)
	INSERT [dbo].[Nha] ([ID], [Khu_Vuc], [Duong], [Quan], [Thanh_Pho], [So_Phong], [Ma_Loai], [Ma_NV], [Ma_CSH], [Ngay_Dang], [Ngay_het_han], [Dieu_Kien], [Gia], [Tinh_Trang], [Luot_Xem]) VALUES (3, NULL, N'Le Van Duyet', N'Quan Binh Thanh', N'TP.HCM', 5, 1, 1, 2, CAST(N'2021-02-06' AS Date), CAST(N'2021-08-06' AS Date), N'Không nuôi thú cưng', 900000, N'CÒN TRỐNG', 1)
	INSERT [dbo].[Nha] ([ID], [Khu_Vuc], [Duong], [Quan], [Thanh_Pho], [So_Phong], [Ma_Loai], [Ma_NV], [Ma_CSH], [Ngay_Dang], [Ngay_het_han], [Dieu_Kien], [Gia], [Tinh_Trang], [Luot_Xem]) VALUES (4, NULL, N'Pham Hung', N'Quan 8', N'TP.HCM', 3, 5, 2, 4, CAST(N'2021-02-09' AS Date), CAST(N'2021-07-09' AS Date), NULL, 6000, N'CÒN TRỐNG', 0)
	INSERT [dbo].[Nha] ([ID], [Khu_Vuc], [Duong], [Quan], [Thanh_Pho], [So_Phong], [Ma_Loai], [Ma_NV], [Ma_CSH], [Ngay_Dang], [Ngay_het_han], [Dieu_Kien], [Gia], [Tinh_Trang], [Luot_Xem]) VALUES (5, NULL, N'Nguyen Oanh', N'Quan Go Vap', N'TP.HCM', 4, 4, 3, 5, CAST(N'2021-02-05' AS Date), CAST(N'2021-08-05' AS Date), NULL, 3000, N'CÒN TRỐNG', 1)
	INSERT [dbo].[Nha] ([ID], [Khu_Vuc], [Duong], [Quan], [Thanh_Pho], [So_Phong], [Ma_Loai], [Ma_NV], [Ma_CSH], [Ngay_Dang], [Ngay_het_han], [Dieu_Kien], [Gia], [Tinh_Trang], [Luot_Xem]) VALUES (6, NULL, N'Truong Chinh', N'Quan 12', N'TP.HCM', 2, 6, 4, 3, CAST(N'2021-02-09' AS Date), CAST(N'2021-09-09' AS Date), NULL, 2000, N'CÒN TRỐNG', 0)
	INSERT [dbo].[Nha] ([ID], [Khu_Vuc], [Duong], [Quan], [Thanh_Pho], [So_Phong], [Ma_Loai], [Ma_NV], [Ma_CSH], [Ngay_Dang], [Ngay_het_han], [Dieu_Kien], [Gia], [Tinh_Trang], [Luot_Xem]) VALUES (7, NULL, N'Thao Dien', N'Quan 2', N'TP.HCM', 6, 3, 1, 6, CAST(N'2021-03-08' AS Date), CAST(N'2021-12-08' AS Date), N'Tự do', 12000000, N'CÒN TRỐNG', 0)
	INSERT [dbo].[Nha] ([ID], [Khu_Vuc], [Duong], [Quan], [Thanh_Pho], [So_Phong], [Ma_Loai], [Ma_NV], [Ma_CSH], [Ngay_Dang], [Ngay_het_han], [Dieu_Kien], [Gia], [Tinh_Trang], [Luot_Xem]) VALUES (8, NULL, N'Le Van Sy', N'Quan 3', N'TP.HCM', 3, 2, NULL, 1, CAST(N'2021-09-05' AS Date), CAST(N'2021-09-08' AS Date), N'Tự do', 8000000, N'CÒN TRỐNG', 0)
	INSERT [dbo].[Nha] ([ID], [Khu_Vuc], [Duong], [Quan], [Thanh_Pho], [So_Phong], [Ma_Loai], [Ma_NV], [Ma_CSH], [Ngay_Dang], [Ngay_het_han], [Dieu_Kien], [Gia], [Tinh_Trang], [Luot_Xem]) VALUES (9, NULL, N'Huynh Van Banh', N'Quan 3', N'TP.HCM', 4, 4, NULL, 4, CAST(N'2021-09-05' AS Date), CAST(N'2021-09-08' AS Date), NULL, 8500, N'CÒN TRỐNG', 0)
	INSERT [dbo].[ChiTiet_HopDong] ([Ma_Nha], [Ma_NhanVien], [Ma_KhachHang], [Loai_HopDong], [NgayLap], [NgayHetHan]) VALUES (1, 1, 3, 1, CAST(N'2021-05-08' AS Date), CAST(N'2021-11-05' AS Date))
	INSERT [dbo].[ChiTiet_YeuCau] ([Ma_KH], [Ma_LoaiNha]) VALUES (1, 2)
	INSERT [dbo].[ChiTiet_YeuCau] ([Ma_KH], [Ma_LoaiNha]) VALUES (2, 3)
	INSERT [dbo].[ChiTiet_YeuCau] ([Ma_KH], [Ma_LoaiNha]) VALUES (3, 1)
	INSERT [dbo].[ChiTiet_YeuCau] ([Ma_KH], [Ma_LoaiNha]) VALUES (4, 2)
END
GO

EXEC ReloadData
SELECT * FROM Nha