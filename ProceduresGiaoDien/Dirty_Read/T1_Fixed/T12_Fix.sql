/*T12*/
USE QuanLyNha
GO

IF OBJECT_ID(N'T12_Fix') IS NOT NULL
	DROP PROCEDURE T12_Fix
GO

CREATE PROCEDURE T12_Fix(@id as int)
AS
	Begin Transaction
		Declare @gia int
		Begin Try
			SET TRANSACTION ISOLATION LEVEL READ COMMITTED
			Select  @gia = Gia From Nha Where ID = @id
			Select @gia As 'GiaNha04'
		End Try
		Begin Catch
			Print 'Loi update gia nha trong T12_Fix'
			Rollback Transaction
		End Catch
		Commit Transaction

		return @gia
Go

EXEC T12_Fix 4
