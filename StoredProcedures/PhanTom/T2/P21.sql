Use QuanLyNha
go

IF OBJECT_ID('P21') IS NOT NULL
	DROP PROCEDURE P21
GO

IF EXISTS(SELECT * FROM Nha WHERE ID = 10)
		BEGIN
			DELETE FROM Nha WHERE ID = 10
		END
GO

UPDATE Nha SET Ma_NV = NULL WHERE ID = 8 OR ID = 9
GO

CREATE PROCEDURE P21
As
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
Go

EXEC P21
