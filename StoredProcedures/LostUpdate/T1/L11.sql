Use QuanLyNha
go

IF OBJECT_ID('L11') IS NOT NULL
	DROP PROCEDURE L11
GO



CREATE PROCEDURE L11(@Ma_Nha as int, @Ma_KH as int, @Ma_NV as int, @ngay AS DATE)
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
Go

DELETE FROM ChiTiet_XemNha WHERE Ma_Nha = 2
UPDATE Nha SET Luot_Xem = 0 WHERE ID = 2

EXEC L11 2, 1, 1, '06/08/2021'

SELECT ID,Luot_Xem FROM Nha WHERE ID = 2
SELECT * FROM ChiTiet_XemNha WHERE Ma_Nha = 2
