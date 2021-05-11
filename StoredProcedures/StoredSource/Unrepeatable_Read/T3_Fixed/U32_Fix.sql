/*U12*/
Use QuanLyNha
go

IF OBJECT_ID('U32_Fix') IS NOT NULL
	DROP PROCEDURE U32_Fix
GO

CREATE PROCEDURE U32_Fix(@id as int)
As

	Begin Transaction
		If Not Exists (Select * From NHA Where ID = @id)
			Begin
				Print 'Nha khong ton tai'
				RollBack Transaction
			End
		Update Nha Set Duong = N'Dinh Tien Hoang' Where ID = @id
		Update Nha Set Quan = N'Quan 1' Where ID = @id
		

		Commit Transaction
Go

EXEC U32_Fix 2
SELECT * FROM Nha Where ID = 2
