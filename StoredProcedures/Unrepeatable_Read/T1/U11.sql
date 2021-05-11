USE QuanLyNha
GO

IF OBJECT_ID('U11') IS NOT NULL
	DROP PROCEDURE U11
GO

CREATE PROCEDURE U11
AS
	SET TRANSACTION ISOLATION LEVEL READ COMMITTED
	BEGIN TRANSACTION
		BEGIN TRY
			DECLARE @min as int
			SELECT @min = MIN(Gia) FROM Nha WHERE Nha.Dieu_Kien IS NULL
			SELECT @min AS GiaThapNhat
			WAITFOR DELAY '00:00:05'
			SELECT * FROM Nha Where Gia = @min AND Nha.Dieu_Kien IS NULL
		END TRY
		BEGIN CATCH
			print 'Loi Tim Kiem Nha Thue Re Nhat'
			Rollback Transaction
		END CATCH
	COMMIT TRANSACTION
GO

EXEC U11