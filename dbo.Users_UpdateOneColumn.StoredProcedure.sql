USE [C120_rj_allvalleyservicesca]
GO
/****** Object:  StoredProcedure [dbo].[Users_UpdateOneColumn]    Script Date: 10/26/2022 10:57:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


	CREATE proc [dbo].[Users_UpdateOneColumn]
				@PassConfirm nvarchar(64)
				,@Id int

	/*
	Declare @Id int = 3

	Declare @PassConfirm nvarchar(64) = 'newAbcd1234!!'

	Select *
	from dbo.Users
	where Id=@Id

	Execute dbo.Users_UpdateOneColumn
			@PassConfirm
			,@Id

	Select *
	from dbo.Users
	where Id=@Id

	*/

	as
	BEGIN

	Declare @todayDate datetime2 =getutcdate();

	UPDATE [dbo].[Users]
	   SET [PasswordConfirm] = @PassConfirm
		   ,[DateModified] = @todayDate
	 WHERE Id = @Id



	END
GO
