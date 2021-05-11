/*T12*/
USE QuanLyNha
GO

IF OBJECT_ID(N'T12') IS NOT NULL
	DROP PROCEDURE T12
GO

CREATE PROCEDURE T12(@id as int)
AS
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
	Begin Transaction
		Declare @gia int
		Begin Try
			Select @gia = Nha.Gia From Nha Where Nha.ID = @id
			Select @gia As 'GiaNha04'
		End Try
		Begin Catch
			Print 'Loi update gia nha trong T12'
			Rollback Transaction
		End Catch
		Commit
		return @gia
Go