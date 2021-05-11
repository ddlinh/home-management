Use QuanLyNha
go

IF OBJECT_ID('P32') IS NOT NULL
	DROP PROCEDURE P32
GO

CREATE PROCEDURE P32(@id as int, @HoTen as nvarchar(50), @DiaChi as nvarchar(50), @DienThoai as char(10), @So_Phong as int, @Duong as nvarchar(50), @Quan as nvarchar(50), @ThanhPho as nvarchar(50), @nhuCau as bit)
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
Go

EXEC P32 5, N'Tran Ngoc Mai', N'Quan 7', '0933181232', 3, N'Hai Ba Trung', N'Quan 1', N'TP.HCM', 1

