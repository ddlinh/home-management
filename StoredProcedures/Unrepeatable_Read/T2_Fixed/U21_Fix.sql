USE QuanLyNha
GO

IF OBJECT_ID('U21_Fix') IS NOT NULL
	DROP PROCEDURE U21_Fix
GO

CREATE PROCEDURE U21_Fix(@from as int, @to as int)
AS
	Update Nha Set Gia = 2000 Where ID = 6
	SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
	BEGIN TRANSACTION
		BEGIN TRY
			SELECT COUNT(*) AS So_luong FROM Nha Where Gia >= @from AND Gia <= @to
			WAITFOR DELAY '00:00:05'
			SELECT * FROM Nha Where Gia >= @from AND Gia <= @to
		END TRY
		BEGIN CATCH
			print 'Loi tim kiem nha'
			Rollback Transaction
		END CATCH
	COMMIT TRANSACTION
GO

EXEC U21_Fix 2000, 4000