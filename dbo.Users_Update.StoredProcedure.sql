USE [C120_rj_allvalleyservicesca]
GO
/****** Object:  StoredProcedure [dbo].[Users_Update]    Script Date: 10/26/2022 10:57:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



	CREATE proc [dbo].[Users_Update]
			@FirstName nvarchar(100)
			,@LastName nvarchar(100)
			,@Email nvarchar(100)
			,@Password nvarchar(64)
			,@PasswordConfirm nvarchar(64)
			,@AvatarUrl nvarchar(max)
			,@TenantId nvarchar(30)
			,@Id int
/*
	Declare @Id int=30;

		Declare @FirstName nvarchar(100)='MeMyself'
			,@LastName nvarchar(100)='AndI'
			,@Email nvarchar(100)='myself@sabio.la'
			,@Password nvarchar(64)='Abcd1234!'
			,@PasswordConfirm nvarchar(64)='newerAbcd1234!'
			,@AvatarUrl nvarchar(max)='https://images.unsplash.com/photo-1542831371-29b0f74f9713?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxMTgwOTN8MHwxfHNlYXJjaHwzfHxwcm9ncmFtbWVyfGVufDB8fHx8MTY2MTY2NDkxMQ&ixlib=rb-1.2.1&q=80&w=1080'
			,@TenantId nvarchar(30) ='U03JVB0LY30'
			
			


	Select *
	From dbo.Users
	where Id = @Id

	Execute dbo.Users_Update
			@FirstName
			,@LastName
			,@Email
			,@Password
			,@PasswordConfirm
			,@AvatarUrl
			,@TenantId
			,@Id 

	Select *
	From dbo.Users
	where Id = @Id

	Select *
	from dbo.Users
*/
	
as
BEGIN
Declare @todayDate datetime2 = getutcdate();

UPDATE [dbo].[Users]
	SET [FirstName] = @FirstName
		,[LastName] = @LastName
		,[Email] = @Email
		,[Password] = @Password
		,[PasswordConfirm] =@PasswordConfirm
		,[AvatarUrl] = @AvatarUrl
		,[TenantId] = @TenantId
		,[DateModified] = @todayDate
	WHERE Id=@Id



END

GO
