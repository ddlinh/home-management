/*U12*/
Use QuanLyNha
go

IF OBJECT_ID('U12') IS NOT NULL
	DROP PROCEDURE U12
GO

CREATE PROCEDURE U12(@gia as int)
As
	Begin Transaction		
		Begin Try
			Update Nha Set Gia = Gia + @gia
		End Try
		Begin Catch
			Print 'Loi update gia nha trong U12'
			Rollback Transaction
			RETURN
		End Catch
	Commit Transaction
Go

EXEC U12 -100
