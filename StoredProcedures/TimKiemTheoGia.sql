USE QuanLyNha
GO

DROP PROCEDURE TimKiemTheoGia
GO

CREATE PROCEDURE TimKiemTheoGia(@from as int, @to as int)
AS
	Begin Transaction
		Begin Try
			Select * From Nha Where Nha.Gia >= @from AND Nha.Gia <= @to		
		End Try
		Begin Catch
			Print 'Loi update gia nha trong tangGiaNha_1'
			Rollback Transaction
		End Catch
		Commit
Go