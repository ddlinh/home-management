USE QuanLyNha
GO

IF OBJECT_ID('T21_Fix') IS NOT NULL
	DROP PROCEDURE T21_Fix
GO

CREATE PROCEDURE T21_Fix(@id as int)
AS
	SET TRANSACTION ISOLATION LEVEL READ COMMITTED
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

EXEC T21_Fix 6
EXEC T22_Fix