/*T11*/
USE QuanLyNha
GO

IF OBJECT_ID(N'T11_Fix') IS NOT NULL
	DROP PROCEDURE T11_Fix
GO

CREATE PROCEDURE T11_Fix(@id as int, @GiaMoi as int)
As
	Begin Transaction
		If Not Exists (Select * From NHA Where ID = @id)
			Begin
				Print 'Nha khong ton tai'
				RollBack Transaction
			End
		Update Nha Set Gia = @GiaMoi Where ID = @id
		Waitfor Delay '00:00:05'
		Rollback Transaction
Go

EXEC T11_Fix 4,3500
EXEC T12_Fix 4