USE QuanLyNha
GO

DROP PROCEDURE TimKiemNhaTheoSLPhong
GO

CREATE PROCEDURE TimKiemNhaTheoSLPhong(@soPhong as int)
AS
	BEGIN TRANSACTION
		BEGIN TRY
			SELECT * FROM Nha Where Nha.So_Phong = @soPhong 
		END TRY
		BEGIN CATCH
			print 'Loi Tim Kiem Nha Theo So Luong Phong'
			Rollback Transaction
		END CATCH
		COMMIT
GO