Use QuanLyNha
go

CREATE PROCEDURE TangGiaNha_2(@id as int, @ty_le as float)
As
	Begin Transaction
		
		If Not Exists (Select * From NHA Where ID = @id)
			Begin
				Print 'Nha khong ton tai'
				RollBack Transaction
			End
		
		Begin Try
			Declare @GiaCapNhat int

			Select @GiaCapNhat = Gia From Nha Where ID = @id

			/*Waitfor Delay '00:00:10'*/
			Set @GiaCapNhat = @GiaCapNhat + @GiaCapNhat*@ty_le

			Update Nha Set Gia = @GiaCapNhat Where ID = @id

			Select * From Nha Where ID = @id
		
		End Try
		Begin Catch
			Print 'Loi update gia nha trong tangGiaNha_2'
			Rollback Transaction
		End Catch

		Commit Transaction
Go