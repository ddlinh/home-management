Use QuanLyNha
go

IF OBJECT_ID('L31') IS NOT NULL
	DROP PROCEDURE L31
GO

CREATE PROCEDURE L31(@Ma_Nha as int, @Ma_KH as int, @Ma_NV as int, @ngay AS DATE)
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
Go

DELETE FROM ChiTiet_XemNha WHERE Ma_Nha = 3
UPDATE Nha SET Luot_Xem = 0 WHERE ID = 3

EXEC L31 3, 1, 4, '06/08/2021'

SELECT ID,Luot_Xem FROM Nha WHERE ID = 3
SELECT * FROM ChiTiet_XemNha WHERE Ma_Nha = 3

--EXEC ReloadData