USE QuanLyNha
GO

DROP PROCEDURE NhaBanReNhat
GO

CREATE PROCEDURE NhaBanReNhat
AS
	BEGIN TRANSACTION
		BEGIN TRY
			DECLARE @min as int
			SELECT @min = MIN(Gia) FROM Nha WHERE Nha.Dieu_Kien IS NOT NULL
			SELECT * FROM Nha Where Gia = @min
		END TRY
		BEGIN CATCH
			print 'Loi Tim Kiem Nha Ban Re Nhat'
			Rollback Transaction
		END CATCH
		COMMIT
GO