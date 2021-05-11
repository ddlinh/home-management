USE QuanLyNha
GO

IF OBJECT_ID('U31') IS NOT NULL
	DROP PROCEDURE U31
GO

CREATE PROCEDURE U31
AS
	SET TRANSACTION ISOLATION LEVEL READ COMMITTED
	Update Nha Set Duong = N'Dinh Tien Hoang' Where ID = 2 OR ID = 3
	Update Nha Set Quan = N'Quan Binh Thanh' Where ID = 2 OR ID = 3
	BEGIN TRANSACTION
		BEGIN TRY
			SELECT * FROM Nha Where Duong = N'Dinh Tien Hoang' AND Quan = N'Quan Binh Thanh'
			WAITFOR DELAY '00:00:10'
			UPDATE Nha SET Duong = N'Le Van Duyet' Where Duong = N'Dinh Tien Hoang' AND Quan = N'Quan Binh Thanh'
			SELECT * FROM Nha WHERE Duong = N'Le Van Duyet' AND Quan = N'Quan Binh Thanh'
		END TRY
		BEGIN CATCH
			print 'Loi tim kiem nha'
			Rollback Transaction
		END CATCH
	COMMIT TRANSACTION
GO

EXEC U31