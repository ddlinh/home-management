USE QuanLyNha
GO

DROP PROCEDURE NhaThueReNhat
GO

CREATE PROCEDURE NhaThueReNhat
AS
	BEGIN TRANSACTION
		BEGIN TRY
			DECLARE @min as int
			SELECT @min = MIN(Gia) FROM Nha WHERE Nha.Dieu_Kien IS NULL
			SELECT * FROM Nha Where Gia = @min
		END TRY
		BEGIN CATCH
			print 'Loi Tim Kiem Nha Thue Re Nhat'
			Rollback Transaction
		END CATCH
		COMMIT
GO

EXEC NhaThueReNhat