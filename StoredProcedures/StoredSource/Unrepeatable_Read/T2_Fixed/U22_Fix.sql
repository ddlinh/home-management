/*U12*/
Use QuanLyNha
go

IF OBJECT_ID('U22_Fix') IS NOT NULL
	DROP PROCEDURE U22_Fix
GO

CREATE PROCEDURE U22_Fix(@id as int, @gia as int)
As
	Begin Transaction
		If Not Exists (Select * From NHA Where ID = @id)
			Begin
				Print 'Nha khong ton tai'
				RollBack Transaction
			End
		
		Begin Try
			Update Nha Set Gia = @gia Where ID = @id
		
		End Try
		Begin Catch
			Print 'Loi update gia nha'
			Rollback Transaction
		End Catch

		Commit Transaction
Go

EXEC U22_Fix 6,1500