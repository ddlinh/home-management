Use QuanLyNha
go

IF OBJECT_ID('L22') IS NOT NULL
	DROP PROCEDURE L22
GO



CREATE PROCEDURE L22(@Ma_Nha as int, @gia as int)
As
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
	Begin Transaction
		
		If Not Exists (Select * From NHA Where ID = @Ma_Nha)
			Begin
				Print 'Nha khong ton tai'
				RollBack Transaction
			End
		
		Begin Try
			Declare @GiaCapNhat int
			Select @GiaCapNhat = Gia From Nha Where ID = @Ma_Nha
			PRINT @GiaCapNhat
			Update Nha Set Gia = @GiaCapNhat + @gia Where ID = @Ma_Nha
		
		End Try
		Begin Catch
			Print 'Loi update gia nha trong L22'
			Rollback Transaction
		End Catch

		Commit Transaction
Go

EXEC L22 9, 1000
SELECT ID,Gia FROM Nha WHERE ID = 9