USE QuanLyNha
GO

IF OBJECT_ID(N'T21') IS NOT NULL
	DROP PROCEDURE T21
GO

CREATE PROCEDURE T21(@id as int)
AS
	Begin Transaction
		If Not Exists (Select * From Nha Where ID = @id)
			Begin
				Print 'Nha khong ton tai'
				RollBack Transaction
			End
		DELETE FROM Nha WHERE ID = @id
		Waitfor Delay '00:00:05'
		Rollback Transaction
GO

EXEC T21 6
EXEC T22