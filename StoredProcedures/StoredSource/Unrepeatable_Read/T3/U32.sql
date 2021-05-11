/*U12*/
Use QuanLyNha
go

IF OBJECT_ID('U32') IS NOT NULL
	DROP PROCEDURE U32
GO

CREATE PROCEDURE U32(@id as int)
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

EXEC U32 2
