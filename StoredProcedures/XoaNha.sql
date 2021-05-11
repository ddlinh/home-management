USE QuanLyNha
GO

CREATE PROCEDURE XoaNha(@id as int)
AS
	IF NOT EXISTS (SELECT * FROM Nha Where ID = @id)
		Print 'Nha khong ton tai'
		Rollback Transaction
	Begin Transaction
		Begin Try
			DELETE FROM Nha Where ID = @id
		End Try
		Begin Catch
			Print 'Loi update gia nha trong tangGiaNha_1'
			Rollback Transaction
		End Catch
		Commit
Go