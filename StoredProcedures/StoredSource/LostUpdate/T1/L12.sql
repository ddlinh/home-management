Use QuanLyNha
go

IF OBJECT_ID('L12') IS NOT NULL
	DROP PROCEDURE L12
GO

CREATE PROCEDURE L12(@Ma_Nha as int, @Ma_KH as int, @Ma_NV as int, @ngay AS DATE)
As
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
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
			PRINT @luotxem
			UPDATE Nha Set Luot_Xem = @luotxem WHERE ID = @Ma_Nha
		End Try
		Begin Catch
			Print 'Loi THEM LUOT XEM  trong L11'
			Rollback Transaction
			RETURN
		End Catch
	Commit Transaction
Go

EXEC L12 2, 5, 1, '06/08/2021'

SELECT ID,Luot_Xem FROM Nha WHERE ID = 2
SELECT * FROM ChiTiet_XemNha WHERE Ma_Nha = 2