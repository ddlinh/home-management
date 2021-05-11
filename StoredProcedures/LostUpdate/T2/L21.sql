Use QuanLyNha
go

IF OBJECT_ID('L21') IS NOT NULL
	DROP PROCEDURE L21
GO

CREATE PROCEDURE L21(@QUAN as nvarchar(50))
As	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
	Begin Transaction
		Begin Try
			UPDATE Nha SET Gia = 1.2*Gia WHERE Quan = @QUAN AND Dieu_Kien IS NULL
			WAITFOR DELAY '00:00:15'
			UPDATE Nha SET Gia = 1.05*Gia WHERE Gia > 3000 AND Dieu_Kien IS NULL
		End Try
		Begin Catch
			Print 'Loi CAP NHAT GIA trong L21'
			Rollback Transaction
			RETURN
		End Catch
	Commit Transaction
Go

UPDATE Nha SET Gia = 8500 WHERE ID = 9

EXEC L21 N'Quan 3'


