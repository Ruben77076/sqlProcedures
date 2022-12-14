USE [C120_rj_allvalleyservicesca]
GO
/****** Object:  StoredProcedure [dbo].[Users_Insert]    Script Date: 10/26/2022 10:57:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


	CREATE proc [dbo].[Users_Insert]
			@FirstName nvarchar(100)
			,@LastName nvarchar(100)
			,@Email nvarchar(100)
			,@Password nvarchar(64)
			,@PasswordConfirm nvarchar(64)
			,@AvatarUrl nvarchar(max)
			,@TenantId nvarchar(30)
			,@Id int OUTPUT

/*
Declare @Id int=0;

Declare @FirstName nvarchar(100)='Keke'
			,@LastName nvarchar(100)='Ramirez'
			,@Email nvarchar(100)='ruben4@sabio.la'
			,@Password nvarchar(64)='Abcd1234!'
			,@PasswordConfirm nvarchar(64)='Abcd1234!'
			,@AvatarUrl nvarchar(max)='https://images.unsplash.com/photo-1561030328-175e5e1e429f?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxMTgwOTN8MHwxfHNlYXJjaHwzMHx8bWV4aWNhbnxlbnwwfHx8fDE2NjE2NDcxNjE&ixlib=rb-1.2.1&q=80&w=1080'
			,@TenantId nvarchar(30)='U03JVB0LY30'
			



	Execute dbo.Users_Insert
		   @FirstName
		   ,@LastName
		   ,@Email
		   ,@Password
		   ,@PasswordConfirm
		   ,@AvatarUrl
		   ,@TenantId
		   ,@Id OUTPUT

	Select @Id

	Select *
	from dbo.Users
	Where Id = @Id

	Select *
	from dbo.Users


*/

as

BEGIN

INSERT INTO [dbo].[Users]
           ([FirstName]
           ,[LastName]
           ,[Email]
           ,[Password]
		   ,[PasswordConfirm]
           ,[AvatarUrl]
           ,[TenantId])
     VALUES
           (@FirstName
		   ,@LastName
		   ,@Email
		   ,@Password
		   ,@PasswordConfirm
		   ,@AvatarUrl
		   ,@TenantId)

	SET @Id = SCOPE_IDENTITY()
		   
END
GO
