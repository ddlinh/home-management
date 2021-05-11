/*T31*/
USE QuanLyNha
GO

IF OBJECT_ID('T31') IS NOT NULL
	DROP PROCEDURE T31
GO

CREATE PROCEDURE T31(@MaNha as int, @MaKH as int, @MaNV as int, @loai as int)
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
			ROLLBACK TRANSACTION
		END TRY
		BEGIN CATCH
			SELECT ERROR_MESSAGE() AS ErrorMessage
			ROLLBACK TRANSACTION
			RETURN
		END CATCH
	COMMIT TRANSACTION
END
GO

EXEC T31 1,4,1,0
SELECT * FROM ChiTiet_HopDong
EXEC T32 1