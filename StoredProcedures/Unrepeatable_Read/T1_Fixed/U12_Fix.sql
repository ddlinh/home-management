/*U12*/
Use QuanLyNha
go

IF OBJECT_ID('U12_Fix') IS NOT NULL
	DROP PROCEDURE U12
GO

CREATE PROCEDURE U12_Fix(@gia as int)
As
	Begin Transaction		
		Begin Try
			Update Nha Set Gia = Gia + @gia
		End Try
		Begin Catch
			Print 'Loi update gia nha trong tangGiaNha_1'
			Rollback Transaction
		End Catch
	Commit Transaction
Go

EXEC U12_Fix 100
