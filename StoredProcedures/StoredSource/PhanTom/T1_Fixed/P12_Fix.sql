Use QuanLyNha
go

IF OBJECT_ID('P12_Fix') IS NOT NULL
	DROP PROCEDURE P12_Fix
GO

CREATE PROCEDURE P12_Fix(@id as int, @Duong as nvarchar, @Quan as nvarchar, @Thanh_Pho as nvarchar, @So_Phong as int, @Ma_Loai as int, @Ma_CSH as int, @Ngay_Het_Han as date, @Dieu_Kien as nvarchar, @Gia as int)
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
Go

EXEC P12_Fix 10, N'Ton Dan', N'Quan 4', N'TP.HCM', 4, 1, 3, '08-11-2021', N'Tự do', 900000

