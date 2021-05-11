Use QuanLyNha
go

IF OBJECT_ID('P31_Fix') IS NOT NULL
	DROP PROCEDURE P31_Fix
GO

IF EXISTS(SELECT * FROM KhachHang WHERE ID = 5)
		BEGIN
			DELETE FROM KhachHang WHERE ID = 5
		END
GO

UPDATE KhachHang SET Da_Lien_He = 0 WHERE ID = 1 OR ID = 3
GO

CREATE PROCEDURE P31_Fix
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
Go

EXEC P31_Fix
