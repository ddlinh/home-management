Use QuanLyNha
go

IF OBJECT_ID('P11') IS NOT NULL
	DROP PROCEDURE P11
GO

IF EXISTS(SELECT * FROM Nha WHERE ID = 10)
		BEGIN
			DELETE FROM Nha WHERE ID = 10
		END
GO

CREATE PROCEDURE P11(@from as int, @to as int)
As
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
Go

EXEC P11 500000, 1000000
